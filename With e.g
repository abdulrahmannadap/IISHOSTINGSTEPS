Step 0: Publish Your Application

1. In Visual Studio, locate your main project in the Solution Explorer.

2. Right-click on the project and select Publish.
3. In the Publish wizard:

. Target: Select Folder and click Next.

. Specific Folder: Choose or create a folder where the application will be published. For
example: C:\PublishedApp.

4. Click Finish, then Publish.

5. After publishing, the folder you selected will contain the DLL files and other necessary files to
deploy your application.

Example:
. Folder path: C:\PublishedApp

. Files: MyApp.dll, web.config, etc.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 1: Install the .NET 8 Hosting Bundle
1. Open your brawser and search for Download .NET 8 Hosting Bundle.
2. Go to the official Microsoft .NET page and download the Hosting Bundle.
3. Run the installer and click Next until the installation is complete.

4. Example:
. If your download is named dotnet-hosting-8.8.0-win.exe, double-dlick it to run.

. Follow the prompts like installing a regular program (like a game or app).
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Step 2: Configure IIS for Development
1. Press Windows Key + R, type inetegr, and press Enter to open IIS Manager.
2. Click on your website under Connections an the left.

. Example: Your site might be named Default Web Site or a custom name like MyAppSite.

3. In the middle panel, find and double-dick Configuration Editor.
4. At the top of Configuration Editor, click the Section dropdown and select:


system.wbServer/aspNetCore/environmontVariables

5. On the right, click Add and fill in these details:

. Name: ASPNETCORE_ENVIRONMENT

. Value: Development

6. Click OK to save your changes.
7. Example Screenshot: You should see ASPNETCORE_ENVIRONMENT . Development listed in the
environment variables.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 3: Restart IIS

1. Open Command Prompt as an Administrator:

. Press the windows Key , type cmd, right-click it, and select Run as Administrator.

2. In the Command Prompt, type:

iisreset

3. Example Output:

Attempting stop ...
Internet services successfully stopped
Internet services successfully restarted

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 4: Add IIS App Pool User to SQL Server

1. Open SQL Server Management Studio (SSMS).
. Example: Log in to your server using credentials like Server Name: localhost and Authentication
Windows Authentication.

2. In the left panel, expand:

Security > Logins

Database selected: MyAppDB

Role: do_owner

3. Right-click Logins and choose New Login.

4. In the New Lagin window:
. Login Name: Enter IIS APPPOOL\iIsdemo.

. Authentication: Select Windows Authentication.

. Default Database: Leave it as default or choose your database.

. Example:
If your app uses a database called MyAppDB, select it.

5. On the left, click User Mapping.
. Under Databases, check MyAppDB

. Under Database role membership, check db_ewner (or the role you need).
Example

.Database selected: MyAppDB

.Role: db_owner

6. Click OK to save.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 5: Allow Port 82 in Windows Firewall
1. Open Windows Defender Firewall:

. Press the Windows Key , search for Firewall, and open Windows Defender Firewall.

2. On the left, click Advanced Settings.

3. In the new window, click Inbound Rules (on the left).

4. On the right, click New Rule.

5. Follow these steps in the wizard:

. Rule Type: Choose Port and click Next.

. Protocol and Ports: Select TCP, and in the Specific local ports field, type 82. Click Next.

. Action: Choose Allow the connection. Click Next.

. Profile: Check Domain, Private, and Public. Click Next.

. Name: Enter Allow Port 82,
Description: Enter Allow Inbound TCP Traffic on Port 82 for IIS . Click Finish.

Example:
After completing, you will see a new inbound rule named Allow Port 82 under Inbound Rules.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 6: Verify Configuration
1. Open Command Prompt as Administrator again.

2. Type: ipconfig


3. Look for your IPv4 address under your active connection:

. Example: If it shows IPv4 Address: 192.168.1.100, this is your IP address.

4. Test your setup by typing: ping 192.168.1.100

. Example Output: Reply from 192.168.1.100: bytes=32 time<1ms TTL=128

5. Finally, restart IIS one more time: iisreset

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 7: Access Your Application
1. Open your browser and type: http://[Your IP Address]:82

Example: http://192.168.1.100:82

2. You should see your application running!


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
This detailed guide includes all the steps with exar'as to ensure you can set up your .NET 8 app with
IIS and SQL Server successfully.
