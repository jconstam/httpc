#!/bin/sh

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)
COL=$(tput cols)

if [ "$#" -lt 1 ]; then
    echo -e "Usage: $0 <root_path> <ignore1> <ignore2> ..."
    echo -e "\t<root_path> - The root path to search for files."
    echo -e "\t<ignore> - Paths to ignore."
    exit 1
fi

ROOT_PATH=$(realpath $1)
if [ ! -d "${ROOT_PATH}" ]; then
    echo "Could not find root path \"${1}\""
    exit 1
fi
echo "Using root path \"${ROOT_PATH}\""

IGNORE_LIST=" -e .git -e .vscode -e build"
if [ "$#" -gt 1 ]; then
    echo "Excluding paths \"${@:2}\""
    for IGNORE in ${@:2}
    do
        IGNORE_LIST="${IGNORE_LIST} -e ${IGNORE}"
    done
fi

RESULT=0
FILES=$(find ${ROOT_PATH} -type f | grep -v ${IGNORE_LIST})
for FILE in ${FILES}
do
    CHECK=`tail -c 1 ${FILE}`
    WIDTH=$(($COL - ${#FILE}))
    if [ "${CHECK}" != "" ]; then
        printf '%s%s%*s%s\n' "${FILE}" "$RED" $WIDTH "[FAIL]" "$NORMAL"
        RESULT=1
    fi
done

if [ "${RESULT}" -eq 0 ]; then
    OUT_STR="All files in ${ROOT_PATH} (except excluded paths) end with a newline."
    WIDTH=$(($COL - ${#OUT_STR}))
    printf '%s%s%*s%s\n' "${OUT_STR}" "$GREEN" $WIDTH "[PASS]" "$NORMAL"
fi

exit ${RESULT}
