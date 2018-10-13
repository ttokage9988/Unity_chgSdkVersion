for Linux
for Mac

--概要--

Unity projectの.aarファイルに格納された
AndroidManifest.xmlに記述された以下の設定値を変更します。

・minSdkVersion
・targetSdkVersion

--使い方(How to Use)--

0.念のため、バックアップをお願いします。
Please back up your Unity Project.

1.Unity projectディレクトリと同じ階層にスクリプトを配置します。

	example:
	.
	├── chgSdkVersion_for***.sh	<--deploy
	├── UnityProject
	~~

3.配置したスクリプトと同じディレクトリに移動し、
chgSdkVersion_for***.shを実行します。

	$ cd <deploy_script_dir>	

	usage:
	$ ./chgSdkVersion_for***.sh <UnityProject> <minSdkVersion> <targetSdkVersion>

	example:
	$ ./chgSdkVersion_for***.sh UnityProject 17 22

4.スクリプト実行後、カレントディレクトリに書き換えたファイルのログが出力されます。

.
├── chgSdkVersion_for***.sh
├── chgSdkVersion_log.txt	<--generate
├── UnityProject
~~
