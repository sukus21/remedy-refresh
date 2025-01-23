import os
import sys
import ast
import math

# Handle function arguments
if len(sys.argv) != 2:
    print("usage: {} <GameMaker project dir>".format(sys.argv[0]))
    sys.exit(1)
projectdir = sys.argv[1]

class YYWriter:
    def __init__(self, w):
        self.w = w
        self.d = 0
        self.p = True

    def write(self, v) -> None:
        if isinstance(v, dict):
            self.writeDict(v)
        elif isinstance(v, list):
            self.writeList(v)
        elif isinstance(v, str):
            self.w.write("\"{}\"".format(v))
        elif v == None:
            self.w.write("null")
        elif isinstance(v, bool) and v == True:
            self.w.write("true")
        elif isinstance(v, bool) and v == False:
            self.w.write("false")
        else:
            self.w.write("{}".format(v))
    
    def writeDict(self, d: dict) -> None:
        if len(d) == 0:
            self.w.write("{}")
            return
        if self.p:
            self.writeDictPretty(d)
            return
        
        self.d += 1
        self.w.write("{")
        for k, v in d.items():
            self.w.write("\"{}\":".format(k))
            self.write(v)
            self.w.write(",")
        self.w.write("}")
        self.d -= 1

    def writeDictPretty(self, d: dict) -> None:
        self.w.write("{\n")
        self.d += 1
        for k, v in d.items():
            self.w.write("  " * self.d)
            self.w.write("\"{}\": ".format(k))
            self.write(v)
            self.w.write(",\n")
        self.d -= 1
        self.w.write(("  " * self.d) + "}")

    def writeList(self, l: list) -> None:
        if len(l) == 0:
            self.w.write("[]")
            return

        isPretty = self.p
        if not isPretty:
            isPretty = isinstance(l[0], dict) and "resourceType" in l[0]

        oldp = self.p
        self.p = False
        self.w.write("[")
        self.d += 1
        self.w.write("\n")
        idx = 0
        for v in l:
            if isPretty:
                self.w.write("  " * self.d)
            self.write(v)
            self.w.write(",")
            idx += 1
            if isPretty or idx == 10:
                idx = 0
                self.w.write("\n")
        self.d -= 1
        if isPretty:
            self.w.write("  " * self.d)
        self.w.write("]")
        self.p = oldp

# Export a .yy file
def yyWriteFile(fname: str, yy: dict) -> None:
    os.remove(fname)
    yyFile = open(fname, "w")
    
    w = YYWriter(yyFile)
    w.write(yy)

    yyFile.close()

# This is very hacky, but works for this
def yyReadFile(fname: str) -> str:
    with open(fname) as file:
        return ast.literal_eval(file.read().replace('null', 'None').replace('true', 'True').replace('false', 'False'))

class Tilemap:
    def __init__(self, name):
        self.name = name
        self.tileWidth = 0
        self.tileHeight = 0
        self.tiles = []
        self.offsetX = 0
        self.offsetY = 0

class Tile:
    def __init__(self):
        self.x = 0
        self.y = 0
        self.u0 = 0
        self.u1 = 0
        self.v0 = 0
        self.v1 = 0

class Sprite:
    def __init__(self, w, h):
        self.w = w
        self.h = h

# Open sprites
sprites = {}
for spriteName in os.listdir(projectdir + "/sprites"):
    yyFile = yyReadFile(projectdir + "/sprites/" + spriteName + "/" + spriteName + ".yy")
    sprites[spriteName] = Sprite(int(yyFile["width"]), int(yyFile["height"]))

# Open room files
for roomName in os.listdir(projectdir + "/rooms"):
    roomFname = "{}/rooms/{}/{}.yy".format(projectdir, roomName, roomName)
    yyFile = yyReadFile(roomFname)
    
    roomWidth = yyFile["roomSettings"]["Width"]
    roomHeight = yyFile["roomSettings"]["Height"]
    removeLayers = {}

    layerId = -1
    for yyLayer in yyFile["layers"]:
        layerId += 1
        if yyLayer["resourceType"] != "GMRAssetLayer":
            continue

        # Find tiles
        tilemaps = {}
        for yyAsset in yyLayer["assets"]:
            if yyAsset["resourceType"] != "GMRGraphic":
                continue

            tilesetName = yyAsset["spriteId"]["name"]
            if tilesetName not in tilemaps:
                tilemap = Tilemap(tilesetName)
                tilemap.tileWidth = int(yyAsset["w"])
                tilemap.tileHeight = int(yyAsset["h"])
                tilemap.offsetX = int(yyAsset["x"]) % tilemap.tileWidth
                tilemap.offsetY = int(yyAsset["y"]) % tilemap.tileHeight
                tilemaps[tilesetName] = tilemap
            tilemap = tilemaps[tilesetName]
            if yyAsset["w"] != tilemap.tileWidth or yyAsset["h"] != tilemap.tileHeight:
                print("room {}, layer {}, tileset {}: tile does not match surrounding tiles".format(roomName, yyLayer["name"], tilemap.name))
                continue
            
            tile = Tile()
            tile.x = int(yyAsset["x"])
            tile.y = int(yyAsset["y"])
            tile.u0 = int(yyAsset["u0"])
            tile.u1 = int(yyAsset["u1"])
            tile.v0 = int(yyAsset["v0"])
            tile.v1 = int(yyAsset["v1"])
            if tile.x % tilemap.tileWidth != tilemap.offsetX or tile.y % tilemap.tileHeight != tilemap.offsetY or tile.u0 % tilemap.tileWidth != 0 or tile.u1 % tilemap.tileWidth != 0 or tile.v0 % tilemap.tileHeight != 0 or tile.v1 % tilemap.tileHeight != 0:
                print("room {}, layer {}, tileset {}: tile is not aligned to grid".format(roomName, yyLayer["name"], tilemap.name))
                continue

            tile.x = int((tile.x - tilemap.offsetX) / tilemap.tileWidth)
            tile.y = int((tile.y - tilemap.offsetY) / tilemap.tileHeight)
            tile.u0 /= tilemap.tileWidth
            tile.u1 /= tilemap.tileWidth
            tile.v0 /= tilemap.tileHeight
            tile.v1 /= tilemap.tileHeight
            tilemap.tiles.append(tile)
        
        # Save tilemaps
        insertLayers = []
        for k, tilemap in tilemaps.items():
            sourceSprite = sprites[tilemap.name]
            tilesetWidth = sourceSprite.w / tilemap.tileWidth
            tilemapWidth = int(math.ceil(roomWidth / tilemap.tileWidth))
            tilemapHeight = int(math.ceil(roomHeight / tilemap.tileHeight))
            outTiles = [-0x8000_0000] * (tilemapWidth * tilemapHeight + 1)
            outTiles[0] = int(tilemapWidth * tilemapHeight)
            for tile in tilemap.tiles:
                tilePos = int(tile.x + tile.y*tilemapWidth)
                tileId = int(min(tile.u0, tile.u1) + min(tile.v0, tile.v1) * tilesetWidth)
                if tile.u0 > tile.u1 or tile.v0 > tile.v1:
                    print("room {}, layer {}, tileset {}: TODO: mirror and flip".format(roomName, yyLayer["name"], tilemap.name))
                
                outTiles[tilePos+1] = tileId
            
            # Add tile layer to room
            tilesetAssetName = tilemap.name.replace("bg_", "tls_")
            tileLayer = {
                "resourceType": "GMRTileLayer",
                "resourceVersion": "1.1",
                "name": "{}_{}".format(tilemap.name, yyLayer["depth"]),
                "depth": int(yyLayer["depth"]),
                "tilesetId": {
                    "name": tilesetAssetName,
                    "path": "tilesets/{}/{}.yy".format(tilesetAssetName, tilesetAssetName),
                },
                "x": tilemap.offsetX,
                "y": tilemap.offsetY,
                "tiles": {
                    "TileDataFormat": 1,
                    "SerialiseWidth": tilemapWidth,
                    "SerialiseHeight": tilemapHeight,
                    "TileCompressedData": outTiles,
                },
                "visible": True,
                "userdefinedDepth": False,
                "inheritLayerDepth": False,
                "inheritLayerSettings": False,
                "inheritVisibility": True,
                "inheritSubLayers": True,
                "gridX": tilemap.tileWidth,
                "gridY": tilemap.tileHeight,
                "layers": [],
                "hierarchyFrozen": False,
                "effectEnabled": True,
                "effectType": None,
                "properties": [],
            }

            insertLayers.append(tileLayer)
        
        removeLayers[layerId] = insertLayers

    # Replace layers
    sortedLayers = sorted(removeLayers.items())
    sortedLayers.reverse()
    for layerId, insertLayers in sortedLayers:
        del yyFile["layers"][layerId]
        for tileLayer in insertLayers:
            yyFile["layers"].insert(layerId, tileLayer)
    
    # Save room file
    yyWriteFile(roomFname, yyFile)
