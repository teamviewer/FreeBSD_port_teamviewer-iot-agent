# FreeBSD Port TeamViewer IoT Agent
The TeamViewer IoT Agent provides an out-of-the-box secure remote access and file transfer solution for your IoT environment and connected devices.
The Agent seamlessly integrates with the latest TeamViewer Client, which enables you to remotely access your device.
The Teamviewer Client can be downloaded at https://www.teamviewer.com/.

TeamViewer IoT Agent is free for two endpoints.
More endpoints require a license. For more information, please visit https://www.teamviewer.com/link/?url=597425.

Use of the TeamViewer IoT Agent must adhere to the end user license agreement. http://www.teamviewer.com/link/?url=653670

TeamViewer IoT Agent contains Free Software components where it licenses can be found at /usr/share/doc/teamviewer-iot-agent/Third_Party_License.txt

## Usage
After checkout this repository, you can run
```
make package
```
The created package will be located in *./work/pkg/teamviewer-iot-agent-<version>.[pkg/txz]*
The installation of the package can be started via *pkg install teamviewer-iot-agent-<version>.[pkg/txz]*

## Provisioning
After the installation it is mandatory to accept the licence via
```
/usr/local/libexec/teamviewer-iot-agent/teamviewer-iot-agent eula [-y]
```
if the -y paramter is not present the EULA will be displayed and an interactive wizard will guide through the acceptance of the EULA.
If the -y paramter is present, the EULA will be automatically accepted.

The last step of the provisioning is the assignment to your TeamViewer account.
```
/usr/local/libexec/teamviewer-iot-agent assign --api-token <assignment-token> --group <group> --alias <alias name>
```
If it was successful, it will print out a message displaying the name of the new manager and the group where the device is in.
If it fails, an error message will be displayed and an exit code other than 0 is returned.
The assignment-token can be retrieved via the [IoT Dashboard](https://www.teamviewer.com/link/?url=858956).


## Limitation
The FreeBSD port is currenlty only availalbe for x86_64 (amd64) architecture.
Furthermore the port is only verifired against FreeBSD 12 and 13.
