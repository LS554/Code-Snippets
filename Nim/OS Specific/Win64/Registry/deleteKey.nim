#I don't even know how this is useful, just use C# for windows programmes.

import winim/lean #light version of winim Windows API module

proc deleteRegistryKey(keyPath: string) =
  let result = RegDeleteKeyW(HKEY_CURRENT_USER, keyPath) #RegDeleteKeyW deletes single key (not recursive; A (not W) for recursive), set here HKEY path to work in
  if result == ERROR_SUCCESS:
    echo "Key deleted successfully."
  else:
    echo "Failed to delete key: ", result

# Example usage:
deleteRegistryKey(r"Software\Microsoft\Windows\CurrentVersion\Explorer\TestKey") #key to delete
