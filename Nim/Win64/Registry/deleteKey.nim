import winim/lean

proc deleteRegistryKey(keyPath: string) =
  let result = RegDeleteKeyW(HKEY_CURRENT_USER, keyPath)
  if result == ERROR_SUCCESS:
    echo "Key deleted successfully."
  else:
    echo "Failed to delete key: ", result

# Example usage:
deleteRegistryKey(r"Software\Microsoft\Windows\CurrentVersion\Explorer\TestKey")