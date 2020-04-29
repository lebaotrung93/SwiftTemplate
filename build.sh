CONST_SCHEME_KEY="release"
CONST_WORKSPACE_KEY=""
CONST_OUTPUT_KEY="--output"


# Start of reading program arguments
ARGS=("$@")
ARG_SCHEME="2WP"
ARG_WORKSPACE="2WP.xcworkspace"
ARG_OUTPUT="~/Desktop/"

for (( i = 0; i < ${#ARGS[@]}; i++ )); do
	CURRENT_ARG=${ARGS[$i]}
	if [[ ${CURRENT_ARG} == ${CONST_SCHEME_KEY} ]]; then
        i=$(( $i + 1 ))
        ARG_SCHEME=${ARGS[$i]}
    elif [[ ${CURRENT_ARG} == ${CONST_OUTPUT_KEY} ]]; then
    	i=$(( $i + 1 ))
        ARG_OUTPUT=${ARGS[$i]}
    elif [[ ${CURRENT_ARG} == ${CONST_WORKSPACE_KEY} ]]; then
    	i=$(( $i + 1 ))
        ARG_WORKSPACE=${ARGS[$i]}
	fi
done
# End of reading program arguments

# Validating the arguments
if [[ -z ${ARG_SCHEME} ]]; then
    echo "Please specify $CONST_SCHEME_KEY"
    exit 1
fi
if [[ -z ${ARG_WORKSPACE} ]]; then
    echo "Please specify $CONST_ARRKSPACE_KEY"
    exit 1
fi
if [[ -z ${ARG_OUTPUT} ]]; then
    echo "Please specify $CONST_OUTPUT_KEY"
    exit 1
fi

ARCHIVE_PATH="/var/tmp/$ARG_SCHEME.xcarchive"

xcodebuild clean -workspace $ARG_WORKSPACE -scheme $ARG_SCHEME

xcodebuild archive -workspace $ARG_WORKSPACE -scheme $ARG_SCHEME -archivePath $ARCHIVE_PATH | xcpretty

xcodebuild -exportArchive -archivePath $ARCHIVE_PATH -exportPath "$ARG_OUTPUT/$ARG_SCHEME" -exportOptionsPlist /Users/lebaotrung/2wp_fod_mobile/2WP/2WP-Integrated-v2/2WP/defaultExportOptions.plist | xcpretty

appcenter distribute release --app lebaotrung/2WP --file ~/Desktop/2WP/2WP.ipa --group "Collaborators"

rm -rf $ARCHIVE_PATH
