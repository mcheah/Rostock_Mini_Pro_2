import FreeCAD
import Import
from collections.abc import Iterable
from os import listdir
from typing import List, Union
from OpenSCAD import importCSG
from sys import argv


verbose = False

def export_scad_to_step(srcFileName : str, dstFileName : str, preserveNodes : Union[None, List[str]] = None):
    doc = importCSG.open(srcFileName)
    doc.recompute()
    
    # vibe-coded by co-pilot, traverse all imported CSG objects and determine
    # which ones are not referenced as child nodes by any others.  We assume
    # these will be top level objects to be exported.
    def iter_object_refs(obj):
        """Yield all FreeCAD objects referenced by properties of obj."""
        for prop in obj.PropertiesList:
            val = getattr(obj, prop)
    
            # Single object reference
            if hasattr(val, "Name"):
                yield val
                continue
    
            # List/tuple/etc of objects
            if isinstance(val, Iterable) and not isinstance(val, (str, bytes)):
                for item in val:
                    if hasattr(item, "Name"):
                        yield item
    
    # Build set of all referenced objects (inputs to others)
    referenced = set()
    for obj in doc.Objects:
        for ref in iter_object_refs(obj):
            referenced.add(ref)
    
    # Top-level objects are those not referenced by any other object
    top_level = [obj for obj in doc.Objects if (obj not in referenced or ((obj.Name in preserveNodes) if preserveNodes else False))]
    
    if(verbose):
        print("Top-level objects:")
        for o in top_level:
            print(" ", o.Name)

    Import.export(top_level,dstFileName)

def export_folder_to_step(srcfoldername: str):
    files = [f for f in listdir(srcfoldername) if f.endswith(".scad")]
    for f in files:
        export_scad_to_step(f,f.replace('.scad','_2.step'))

if __name__ == "__main__":
    #export_scad - exports all scad files in the current folder
    #export_scad <scadFileName> - exports the scad file specified to 
    #                    scadFileName.step
    #export_scad <scadFolderName> - exports all scad files in the 
    #                    specified folder
    #export_scad <scadFileName> <stepFileName> -  exports the scad file
    #                    specified into stepFileName
    #export_scad <scadFileName> <stepFileName> <preserveNode1> 
    #                    <preserveNode2> ... -  
    #                    exports the scad file specified into stepFileName 
    #                    preserving all nodes named  additional arguments

    preserveNodes = None
    dstFileName = ""
    argc = len(argv)
    if(argc>3):
        preserveNodes = argv[3:]
    if(argc>2):
        dstFileName = argv[2]
    if(argc>1):
        srcFileName = argv[1]
    if(argc==1):
        srcFileName = '.'
    if(srcFileName.endswith(".scad")):
        export_scad_to_step(srcFileName,dstFileName if dstFileName!="" else srcFileName.replace(".scad","_2.step"),preserveNodes)
    else:
        export_folder_to_step(srcFileName)
