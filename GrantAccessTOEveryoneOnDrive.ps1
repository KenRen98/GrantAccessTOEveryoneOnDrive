param(
    [string]$Drive = "D"
)

# Construct the full drive path
$drivePath = "${Drive}:\"  # This ensures that the drive path is correctly formed

# Get all files and directories recursively
Get-ChildItem -Path $drivePath -Recurse | ForEach-Object {
    $itemPath = $_.FullName
    try {
        # Get the current ACL (Access Control List) for the item
        $acl = Get-Acl -Path $itemPath

        # Create a new permission rule for 'Everyone' with FullControl
        $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone","FullControl","ContainerInherit,ObjectInherit","None","Allow")

        # Add the rule to the ACL
        $acl.AddAccessRule($rule)

        # Set the modified ACL back to the item
        Set-Acl -Path $itemPath -AclObject $acl

        # Output a message indicating successful permission change
        Write-Output "Successfully modified permissions for $itemPath"
    }
    catch {
        Write-Warning ("Failed to modify permissions for $($itemPath): $_")
    }
}
