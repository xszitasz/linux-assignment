SEARCH_WORD=$1
CHANGE_WORD=$2

if grep -q "$SEARCH_WORD" "test-1.txt"; then
    sed -i "s/$SEARCH_WORD/$CHANGE_WORD/g" "test-1.txt"
    cat "test-1.txt"
else
    echo "FAILED"
    echo "$(date '+%Y-%m-%d %H:%M:%S') Search word: \"$SEARCH_WORD\" wasnt found!" >> "test-2.log"
fi