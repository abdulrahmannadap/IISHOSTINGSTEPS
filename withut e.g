Step 1: Install the .NET 8 Hosting Bundle
1. Open your web browser.

2. Search for "Download .NET 8 Hosting Bundle."

3. Click the link from Microsoft's website.

4. Download the hosting bundle file.

5. Open the downloaded file and follow the instructions to install it.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 2: Configure IIS for Development
1. Press windows Key + R, type inetmgr , and press Enter (this opens IIS Manager).

2. Click on your website under the Connections panel (left side).

3. In the middle section, find and double-click Configuration Editor.

4. At the top of Configuration Editor, find the Section drop-down.

5. Select system.webServer/aspNetCore/environmentVariables.

6. On the right, click Add:

. Name: ASPNETCORE_ENVIRONMENT

. Value: Development

7. Click OK to save.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 3: Restart IIS

1. Open Command Prompt as an administrator:

. Press windows Key , type cmd , right-click, and choose Run as administrator.

2. Type the following and press Enter:

cmd: iisreset  
eg: C:\Windows\System32>iisreset

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 4: Add IIS App Pool User to SQL Server
1. Open SQL Server Management Studio (SSMS).

2. Log in to your SQL Server instance.
3. In the Object Explorer, expand Security > Logins.

4. Right-click on Logins and choose New Login.

5. In the new window:

. Enter Login Name: IIS APPPOOL\ilsdemo.

. Select Windows Authentication.

. (Optional) Choose a Default Database or leave the default.

6. On the left, click User Mapping.

7. In the Databases list, check your application database.

8. Below, under Database role membership, check db_owner (or any other role needed).

9. Click OK.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 5: Allow Port 82 in Windows Firewall

1. Open Windows Defender Firewall:

. Press windows Key , search for Firewall, and click Windows Defender Firewall.

2. On the left, click Advanced Settings.

3. In the new window, click Inbound Rules.

4. On the right, click New Rule.

5. Follow these steps in the wizard:

. Rule Type: Select Port and click Next.

. Protocol and Ports: Choose TCP and enter port 82, then click Next.

. Action: Select Allow the Connection and click Next.

. Profile: Check all options and click Next.

. Name: Enter Allow Port 82 and click Finish.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Step 6: Verify Configuration
1. Open Command Prompt as an administrator again.

2. Type ipconfig and press Enter to find your computer's IP address.

3. Test your setup by typing:

cmd : ping [Your IP Address]
eg: C:\Windows\System32> ping 198.162.0.0


4. Finally, reset IIS one more time:

cmd : iisreset 
eg: C:\Windows\System32>iisreset

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Done!
Now, your .NET 8 application should be ready to run on IIS, connected to SQL Server, and accessible on port 82.
