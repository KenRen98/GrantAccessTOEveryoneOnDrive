# GrantAccessTOEveryoneOnDrive
 A powershell script to add ACL on NTFS Drive, granting access for everyone.

# Use Scenario
A new OS installed on the same machine, and want to keep old drive data accessible.

# Before Running
Before that, you may want to delete the unused partitions on the old drive.
Please use Diskpart or other tools to delete partitions like EFI, Recovery, etc. on the old drive.
You can use below command to override the deletion protection in Diskpart.
```CMD
select disk 1 # Select the old disk
detail disk # Check the disk details to identify the volumes that needs to be deleted
select volume 1 # Select the volume to delete
delete volume override # Delete the volume
```

# How to Run
1. Open CMD or Powershell as Administrator
2. Run the script with the old drive letter as parameter
```CMD
powershell.exe -ExecutionPolicy Bypass -File "<Absolute Path>\GrantAccessToEveryoneOnDrive.ps1" -Drive "D"
```
3. Watch the script running and check the output for any errors.
4. After the script is completed, you can access the old drive data.

# Note
This script is provided as is, and you should use it at your own risk.


