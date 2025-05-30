#nim c --passL:"-Wl,-rpath,." caller.nim

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