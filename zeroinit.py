import os
import sys

# Handle function arguments
if len(sys.argv) != 2:
    print("usage: {} <GameMaker project dir>".format(sys.argv[0]))
    sys.exit(1)
projectdir = sys.argv[1]

# Containers for objects
globals = {}
scripts = {}
objects = {}
builtin = {}

# Auto-populate builtins
builtinsRaw = [
    "if",
    "else",
    "and",
    "or",
    "xor",
    "for",
    "while",
    "repeat",
    "with",
    "switch",
    "case",
    "default",
    "break",
    "continue",
    "argument",
    "argument_count",
    "argument0",
    "argument1",
    "argument2",
    "argument3",
    "argument4",
    "argument5",
    "argument6",
    "argument7",
    "argument8",
    "argument9",
    "argument10",
    "argument11",
    "argument12",
    "argument13",
    "argument14",
    "argument15",
    "var",
    "globalvar",
    "return",
    "gp_face1",
    "gp_face2",
    "gp_face3",
    "gp_face4",
    "gp_shoulderl",
    "gp_shoulderlb",
    "gp_shoulderr",
    "gp_shoulderrb",
    "gp_select",
    "gp_start",
    "gp_stickl",
    "gp_stickr",
    "gp_axislh",
    "gp_axislv",
    "gp_padu",
    "gp_padd",
    "gp_padl",
    "gp_padr",
    "undefined",
    "true",
    "false",
    "mod",
    "room_speed",
    "x",
    "y",
    "xprevious",
    "yprevious",
    "hspeed",
    "vspeed",
    "speed",
    "direction",
    "room_width",
    "room_height",
    "vk_left",
    "vk_right",
    "vk_up",
    "vk_down",
    "vk_space",
    "vk_enter",
    "vk_escape",
    "vk_numpad0",
    "vk_numpad1",
    "vk_numpad2",
    "vk_numpad3",
    "vk_numpad4",
    "vk_numpad5",
    "vk_numpad6",
    "vk_numpad7",
    "vk_numpad8",
    "vk_numpad9",
    "vk_alt",
    "vk_control",
    "vk_enter",
    "vk_delete",
    "vk_insert",
    "vk_shift",
    "sprite_index",
    "image_index",
    "object_index",
    "gravity",
    "bbox_top",
    "bbox_bottom",
    "bbox_left",
    "bbox_right",
    "depth",
    "room",
    "other",
    "layerelementtype_background",
    "layer",
    "alarm",
    "visible",
]
for symbol in builtinsRaw:
    builtin[symbol] = symbol

# Script asset
class Script:
    def __init__(self, name, path):
        self.name = name
        self.path = path
        self.variables = {}
        self.scripts = {}

# Object asset
class Object:
    def __init__(self, name, path):
        self.name = name
        self.path = path
        self.variables = {}
        self.scripts = {}
        self.events = []
        for fname in os.listdir(path):
            pt, ext = os.path.splitext(fname)
            if ext == ".gml":
                self.events.append(path + "/" + fname)



# Remove comments and strings
def RemoveSpecialChars(string):
    pos = 0
    while True:
        pos = string.find("//", pos)
        if pos == -1:
            break
        
        removed = 0
        while pos < len(string):
            if string[pos] == "\n":
                break
            string = string[0 : pos : ] + string[pos + 1 : :]
            removed += 1
    
    pos = 0
    while True:
        pos = string.find("\"", pos)
        if pos == -1:
            break
        removed = 1
        string = string[0 : pos : ] + string[pos + 1 : :]
        while pos < len(string):
            if string[pos] == "\"":
                string = string[0 : pos : ] + string[pos + 1 : :]
                break
            string = string[0 : pos : ] + string[pos + 1 : :]
            removed += 1
    
    pos = 0
    while pos < len(string):
        pos = string.find("/*", pos)
        if pos == -1:
            break
        
        removed = 2
        while pos < len(string):
            if string[pos] == "*":
                if string[pos+1] == "/":
                    string = string[0 : pos : ] + string[pos + 2 : :]
                    break

            string = string[0 : pos : ] + string[pos + 1 : :]
            removed += 1

    
    string = string.replace("<", " ")
    string = string.replace(">", " ")
    string = string.replace("=", " ")
    string = string.replace("!", " ")
    string = string.replace("|", " ")
    string = string.replace("&", " ")
    string = string.replace("{", " ")
    string = string.replace("}", " ")
    string = string.replace("[", " ")
    string = string.replace("]", " ")
    string = string.replace(")", " ")
    string = string.replace("+", " ")
    string = string.replace("-", " ")
    string = string.replace("*", " ")
    string = string.replace("/", " ")
    string = string.replace(",", " ")
    string = string.replace(";", " ")
    string = string.replace(":", " ")
    string = string.replace("?", " ")
    string = string.replace("^", " ")

    string = string.replace("function", " ")

    return string

def CharIsNumber(char):
    return char == "0" or char == "1" or char == "2" or char == "3" or char == "4" or char == "5" or char == "6" or char == "7" or char == "8" or char == "9" or char == "$"

def IsBuiltin(string):
    return string in builtin

def VariableIsInvalid(string):
    if string.find(".") != -1:
        return True
    if string in scripts:
        return True
    return IsBuiltin(string)

# Get all variable names for a given string
def GetVariableNames(vlist, slist, string):
    
    # Weed out global variables
    pos = 0
    while pos < len(string):
        pos = string.find("global.", pos)
        if pos == -1:
            break

        string = string[0 : pos : ] + string[pos + 7 : :]

        substr = ""
        while pos < len(string):
            if string[pos] == " ":
                break

            substr += string[pos]
            string = string[0 : pos : ] + string[pos + 1 : :]
        
        globals[substr] = substr
    
    # Do the thing
    pos = 0
    prevvar = ""
    vlist_o = vlist
    ignoreVars = {}
    while pos < len(string):
        char = string[pos]
        if char == " " or char == "\t" or char == "\n":
            pos += 1
            continue

        substr = ""
        while pos < len(string):
            if string[pos] == " " or string[pos] == "\t" or string[pos] == "\n":
                break
                
            # Refering to other objects
            if string[pos] == ".":
                psbstr = substr
                if substr == "":
                    substr = prevvar
                if not CharIsNumber(substr[0]):
                    if substr in objects:
                        vlist = objects[substr].variables
                        substr = ""
                        string = string[0 : pos : ] + string[pos + 1 : :]
                        continue
                substr = psbstr
            
            # Weed out functions
            if string[pos] == "(":
                string = string[0 : pos : ] + string[pos + 1 : :]
                if substr != "":
                    slist[substr] = substr
                substr = -1
                break
                
            substr += string[pos]
            string = string[0 : pos : ] + string[pos + 1 : :]
        
        # Add variable to list maybe
        if substr != -1 and substr != "":
            if not CharIsNumber(substr[0]):
                if prevvar == "var":
                    ignoreVars[substr] = substr
                
                if substr not in ignoreVars:
                    vlist[substr] = substr
        
        prevvar = substr
        vlist = vlist_o

def CopyVariablesFromScript(vlist, script, visited):
    if script not in scripts:
        return
    
    if script in visited:
        return

    for variable in scripts[script].variables:
        vlist[variable] = variable
    
    visited[script] = 0

    for ns in scripts[script].scripts:
        CopyVariablesFromScript(vlist, ns, visited)



# Create script objects
for fname in os.listdir(projectdir + "/scripts"):
    scripts[fname] = Script(fname, projectdir + "/scripts/" + fname + "/" + fname + ".gml")

# Create object objects
for fname in os.listdir(projectdir + "/objects"):
    objects[fname] = Object(fname, projectdir + "/objects/" + fname)

# Read asset names
for fname in os.listdir(projectdir + "/sprites"):
    builtin[fname] = fname
for fname in os.listdir(projectdir + "/rooms"):
    builtin[fname] = fname
for fname in os.listdir(projectdir + "/sounds"):
    builtin[fname] = fname
for fname in os.listdir(projectdir + "/objects"):
    builtin[fname] = fname

 

# Read script variables
for script in scripts:
    script = scripts[script]
    file = open(script.path)
    string = RemoveSpecialChars(file.read())

    print("finding variables used in {}...".format(script.name))
    GetVariableNames(script.variables, script.scripts, string)
    for variable in script.variables:

        # Check variables and convert some to scripts
        if variable in scripts:
            script.scripts[variable] = variable    

# Read object variables
for object in objects:
    object = objects[object]
    print("finding variables used by {}...".format(object.name))
    for event in object.events:
        file = open(event)
        string = RemoveSpecialChars(file.read())

        GetVariableNames(object.variables, object.scripts, string)
    
    # Check variables and convert some to scripts
    for variable in object.variables:
        if variable in scripts:
            object.scripts[variable] = variable
    
    visited = {}
    for script in object.scripts:
        CopyVariablesFromScript(object.variables, script, visited)



# Prepare to save the output
generated = "This part of the file has been auto-generated by zeroinit.py"

# Print global variables
globalstring = "\n\n//" + generated + "\n//Globals:\n"
for globalvar in globals:
    globalstring += "global." + globalvar + " = 0;\n"

# Save global variables
if globalstring != "\n\n//" + generated + "\n//Globals:\n":
    print("saving globals...")
    path = projectdir + "/scripts/__init_global/"
    scrfile = open(path + "__init_global.gml")
    scrtext = scrfile.read()
    scrfile.close()
    os.remove(path + "__init_global.gml")

    scrtext += globalstring
    scrfile = open(path + "__init_global.gml", "w")
    scrfile.write(scrtext)
    scrfile.close()

# Print object variables
for object in objects:
    object = objects[object]

    objectstring = "//" + generated + "\n//" + object.name + ":\n"
    path = projectdir + "/objects/" + object.name
    oldevent = ""

    # Write all the variables to a string
    for message in object.variables:
        if not VariableIsInvalid(message):
            objectstring += message + " = 0;\n"
    
    # Is string empty?
    if objectstring == "//" + generated + "\n//" + object.name + ":\n":
        continue

    # Create event already exists
    if "Create_0.gml" in os.listdir(path):
        ofile = open(path + "/Create_0.gml")
        oldevent = "\n\n//Below are the original contents of the file.\n" + ofile.read()
        ofile.close()
        os.remove(path + "/Create_0.gml")
    
    # Create event does not exist
    else:
        print("adding 'create' event for {}...".format(object.name))

        # Get object metadata file
        yyfile = open(path + "/" + object.name + ".yy")
        propfile = yyfile.read()
        yyfile.close()
        os.remove(path + "/" + object.name + ".yy")

        # Find position of event list
        pos = propfile.find(r'"eventList": [')
        pos = propfile.find("\n", pos)
        propfile = propfile[:pos] + "\n    " + r'{"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},' + propfile[pos:]

        # Add create event to file
        yyfile = open(path + "/" + object.name + ".yy", "w")
        yyfile.write(propfile)
        yyfile.close()
    
    # Save this :)
    print("saving variables for {}...".format(object.name))
    createfile = open(path + "/Create_0.gml", "w")
    createfile.write(objectstring + oldevent)
    createfile.close()
