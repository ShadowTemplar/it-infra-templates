Set objService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\CIMV2")
i=0
For Each objProc In objService.ExecQuery("SELECT * FROM Win32_Processor")
	i=i+1
Next
Wscript.echo "���������� �����������: " & i
For Each objphmem In objService.ExecQuery("SELECT * FROM Win32_PhysicalMemory")
	WScript.Echo "����� ����������� ������: " & objPhMem.Capacity
Next
d=0
For Each objNtw In objService.ExecQuery("SELECT * FROM Win32_NetworkAdapter")
	WScript.Echo "������� ��� ���������: " & objNtw.SystemName
	d=d+1
	if d=1 then exit for
Next
For Each objWin In objService.ExecQuery("SELECT * FROM Win32_OperatingSystem")
	WScript.Echo "������ ��: " & objWin.name
Next
For Each objDisk In objService.ExecQuery("SELECT * FROM Win32_LogicalDisk where drivetype=3")
	WScript.Echo "������ ����� �������� �����: " & objDisk.Size
	WScript.Echo "��������� ����� �������� �����: " & objDisk.FreeSpace
Next
Wscript.Echo "�������� ������������:"
For Each objHard In objService.ExecQuery("SELECT * FROM Win32_PNPEntity")
	WScript.Echo objHard.Name
Next
Wscript.echo "�������� ������� ����� ������:"
For Each objShare In objService.ExecQuery("SELECT * FROM Win32_Share")
	WScript.Echo objShare.Name
Next
Wscript.echo "������ ���������:"
For Each objPrinter In objService.ExecQuery("SELECT * FROM Win32_Printer")
	WScript.Echo objPrinter.Name
Next
Wscript.echo "������ �������������� ��:"
For Each objSoft In objService.ExecQuery("SELECT * FROM Win32_Product")
	WScript.Echo objSoft.Name
Next