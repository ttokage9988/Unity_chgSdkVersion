#!/bin/sh

## arg check ##
if [ ! "$#" = 3 ]; then
	echo "Usage: $0 <current_dir_unity_project> <minSdkVersion> <targetSdkVersion>"
	echo "(example: $0 project 17 21)"
	exit 1
fi

## define ##
PROJECT_DIR="$(pwd)/$1"
TMP_WORK="${PROJECT_DIR}/_tmp_work"
LOG_FILE="$(pwd)/chgSdkVersion_log.txt"

## main ##
AAR_LIST=$(find ${PROJECT_DIR} -name "*.aar")

#echo "aarリストは以下です" #debug
#echo ${AAR_LIST} #debug
if [ -e ${LOG_FILE} ]; then
	rm ${LOG_FILE}
fi

if [ ! -e ${TMP_WORK} ]; then
	mkdir ${TMP_WORK}
else
	rm -r ${TMP_WORK}/*
fi

for aar in ${AAR_LIST}; do
	## Check AndroidManifest.xml exist ##
	unzip -l ${aar} | grep "AndroidManifest.xml" > /dev/null 2>&1
	am_exist=$?
	if [ "0" = "${am_exist}" ]; then
		echo "${aar} unzip" | tee -a ${LOG_FILE}
		unzip ${aar} -d ${TMP_WORK} > /dev/null 2>&1
		AM_LIST=$(find ${TMP_WORK} -name "AndroidManifest.xml")

		## Change minSdkVersion & targetSdkVersion of AndroidManifest.xml ##
		for am in ${AM_LIST}; do
			#### debug ####
	#		sed '/minSdkVersion/ s/minSdkVersion="[0-9]*"/minSdkVersion='\"$2\"'/g' ${am} | grep minSdkVersion | tee -a ${LOG_FILE}
			###############

			sed -i "" '/minSdkVersion/ s/minSdkVersion="[0-9]*"/minSdkVersion='\"$2\"'/g' ${am}

			#### debug ####
	#		sed '/targetSdkVersion/ s/targetSdkVersion="[0-9]*"/targetSdkVersion='\"$3\"'/g' ${am} | grep targetSdkVersion | tee -a ${LOG_FILE}
			###############

			sed -i "" '/targetSdkVersion/ s/targetSdkVersion="[0-9]*"/targetSdkVersion='\"$3\"'/g' ${am}
		done

		## output log ##
		grep -e minSdkVersion -e targetSdkVersion ${am} | tee -a ${LOG_FILE}

		cd ${TMP_WORK}
		zip -rmu ${aar} ./* > /dev/null 2>&1
		cd $(pwd)
		#break; #debug
	fi
done

rm -r ${TMP_WORK}
exit 0
