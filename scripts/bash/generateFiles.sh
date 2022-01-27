## ANSI terminal colors
declare -A ANSI=(
    ["reset"]="\u001b[0m"
    ["bold"]="\u001b[1m"
    ["red"]="\u001b[31m"
    ["green"]="\u001b[32m"
    ["yellow"]="\u001b[33m"
    ["blue"]="\u001b[34m"
)

## ==USAGE==:
##   generateFile size fileName
##     [size]: size in B (optional, default 5000000)
##     [fileName]: output path/filename (optional, default ./file.txt)
##
## ==EXAMPLE==:
##   $ generateFile 500000 ~/Desktop/foo.txt
function generateFile() {
    size=${1:-5000000}
    fileName=${2:-./file.txt}
    head -c $size </dev/urandom > $fileName
    echo "${ANSI[bold]}Result:${ANSI[reset]}"
    echo "${size} ${ANSI[red]}${fileName}${ANSI[reset]}" | numfmt --suffix=B --format="  |%-5f|" --to=iec-i --field 1
}

## ==USAGE==:
##   generateFiles numFiles outputDirectory byteSizeLimit
##     [numFiles]: number of files to generate (optional, default 5)
##     [outputDirectory]: output destination for generated files (optional, default ./)
##     [byteSizeLimit]: byte size upper limit for random file sizes (optional, default 625000)
##
## ==EXAMPLE==:
##   $ generateFiles 3 ~/Desktop/ 400000
function generateFiles() {
    fileTypes=(".txt" ".c3d" ".jpg")
    numberOfFiles=${1:-5}
    outputDirectory=${2:-./}
    byteSizeUpper=${3:-625000}
    echo "Generating ${ANSI[red]}${numberOfFiles}${ANSI[reset]} random files between 0B – ${byteSizeUpper}" | numfmt --suffix=B --format="%-5f" --to=iec-i --field 8
    echo "${ANSI[bold]}Results:${ANSI[reset]}"
    for ((i=1;i<=numberOfFiles;i++)); do
        fileName="${outputDirectory}file${i}${fileTypes[$RANDOM % ${#fileTypes[@]} ]}"
        size=$((RANDOM % byteSizeUpper))
        head -c $size </dev/urandom >$fileName
        echo "${size} ${ANSI[red]}${fileName}${ANSI[reset]}" | numfmt --suffix=B --format="  |%-5f|" --to=iec-i --field 1
    done
}
