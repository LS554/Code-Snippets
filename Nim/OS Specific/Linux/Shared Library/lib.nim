# nim c --app:lib --out:lib.so lib.nim

proc NimMain() {.cdecl, importc.} # Sets up the Nim runtime, must be called before using any Nim code in a shared library context
 
proc library_init(): cint {.exportc, dynlib, cdecl.} =
  NimMain() # Initializes the library
  echo "Library initialized!"
  return 0 # Return isn't needed but useful if you want to pass this result to the caller
 
proc library_main(arg: cint): cint {.exportc, dynlib, cdecl.} =
  echo "We got the argument from the caller: ", arg # Prints the argument passed by the calling programme
  echo "Done main!"
  return 0 # This will be automatically converted to a cint and passed to the caller
 
proc library_deinit(): cint {.exportc, dynlib, cdecl.} =
  echo "Cleaning up." # We don't have any global memory, so there's nothing to do
  GC_FullCollect() # Force a full garbage collection
  return 0 #Return isn't needed but useful if you want to pass this result to the caller