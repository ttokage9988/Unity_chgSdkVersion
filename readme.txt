for linux
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
	├── chgSdkVersion.sh	<--deploy
	├── UnityProject
	~~

3.配置したスクリプトと同じディレクトリに移動し、
chgSdkVersion.shを実行します。

	$ cd <deploy_script_dir>	

	usage:
	$ ./chgSdkVersion.sh <UnityProject> <minSdkVersion> <targetSdkVersion>

	example:
	$ ./chgSdkVersion.sh UnityProject 17 22

4.スクリプト実行後、カレントディレクトリに書き換えたファイルのログが出力されます。

.
├── chgSdkVersion.sh
├── chgSdkVersion_log.txt	<--generate
├── UnityProject
~~
