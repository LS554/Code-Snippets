# Linux shared library in Nim

Shared libraries allow for code to be shared accross programmes and sytem wide. They are the Linux equivalent of DLLs.



## The library

The library file (.so) provides the code that will be shared to other programmes.

```nim
proc NimMain() {.cdecl, importc.} #Sets up the Nim runtime, must be called before using any Nim code in a shared library context

proc library_init(): cint {.exportc, dynlib, cdecl.} =
  NimMain() #Initializes the library
  echo "Library initialized!"
  return 0 #Return isn't needed but useful if you want to pass this result to the caller

proc library_main(arg: cint): cint {.exportc, dynlib, cdecl.} =
  echo "We got the argument from the caller: ", arg #Prints the argument passed by the calling programme
  echo "Done main!"
  return 0 # This will be automatically converted to a cint and passed to the caller

proc library_deinit(): cint {.exportc, dynlib, cdecl.} =
  echo "Cleaning up." #We don't have any global memory, so there's nothing to do
  GC_FullCollect() #Force a full garbage collection
  return 0 #Return isn't needed but useful if you want to pass this result to the callerFullCollect()
```

- Library code adapted from Peter's DevLog

## Calling the library

While the library contains our main code, its useless on it's own. We need a programme to call it ~

```nim
#Declare the procedures from the library so we can call them:
proc library_init() {.cdecl, importc, dynlib: "lib.so".}
proc library_main(arg: cint): cint {.cdecl, importc, dynlib: "lib.so".}
proc library_deinit() {.cdecl, importc, dynlib: "lib.so".}

#Run the code from the library:
when isMainModule:
  library_init() #Initialize the library
  let result = library_main(42) #The return value of the library's main procedure
  echo "Result: ", result #This prints the return value passed from the library's main procedure
  library_deinit() #Deinitialize the library
```

## Finishing up

To compile the library, we will specify it's type as a library, and it's output. Remember the caller will call the library by it's name, so if you change it's output you must update this in the caller's source code.

```shell
nim c --app:lib --out:lib.so lib.nim
```

To compile the caller, we need to tell the compiler to look for our library. We hard-code this in at compile time, so make sure the library is not moved or the caller won't find it!

```shell
nim c --passL:"-Wl,-rpath,." caller.nim
```

The -rpath flag specifies the library's location to the linker. Since both files are in the same directory, we use "." . If your library is in a different directory, for example "lib", update the command accordingly:

```shell
nim c --passL:"-Wl,-rpath,./lib" caller.nim
```

Note: Since it is being specified here, you shouldn't have to update the caller's code. Just ensure the file name still matches!
