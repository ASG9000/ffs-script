HEADER=$(cat <<-END
 _______  _______  _______            _______  _______  ______    ___   _______  _______ 
|       ||       ||       |          |       ||       ||    _ |  |   | |       ||       |
|    ___||    ___||  _____|          |  _____||       ||   | ||  |   | |    _  ||_     _|
|   |___ |   |___ | |_____           | |_____ |       ||   |_||_ |   | |   |_| |  |   |  
|    ___||    ___||_____  |          |_____  ||      _||    __  ||   | |    ___|  |   |  
|   |    |   |     _____| |           _____| ||     |_ |   |  | ||   | |   |      |   |  
|___|    |___|    |_______|          |_______||_______||___|  |_||___| |___|      |___|  

         _______  _______  __   __  _______  ___   ___      _______  ______   
        |       ||       ||  |_|  ||       ||   | |   |    |       ||    _ |  
        |       ||   _   ||       ||    _  ||   | |   |    |    ___||   | ||  
        |       ||  | |  ||       ||   |_| ||   | |   |    |   |___ |   |_||_ 
        |      _||  |_|  ||       ||    ___||   | |   |___ |    ___||    __  |
        |     |_ |       || ||_|| ||   |    |   | |       ||   |___ |   |  | |
        |_______||_______||_|   |_||___|    |___| |_______||_______||___|  |_|


=========================================================================================

END
)
#http://patorjk.com/software/taag/#p=display&f=Modular&t=COMPILER

USAGE=$(cat <<-END

Usage: $0 <FFS Script filename>

Output will be created in the same location with a .js extension

=========================================================================================
END
)

echo "$HEADER"
if [ "$#" -eq  "0" ]
  then
    echo "$USAGE"
  else

    # "Compilation"
    cat ./1.ffs > $1.js

    # do -> pipeArray
    sed 's/do(/pipeArray(/g' <$1 >$1.obj.1
    sed 's/^\s*do,\s*$/pipeArray,/g' <$1.obj.1 >$1.obj.2
    sed 's/^\s*do\s*$/pipeArray/g' <$1.obj.2 >$1.obj.3
    sed 's/\(do\)/(pipeArray)/g' <$1.obj.3 >$1.obj.4

    # delayed(y) -> (() => y)
    sed 's/delayed(/(() => /g' <$1.obj.4 >$1.obj.5

    cat $1.obj.5 >> $1.js

    rm ./$1.obj.*
    cat ./2.ffs >> $1.js

    # Linting
    ./node_modules/eslint/bin/eslint.js ./$1.js > $1.lint 2>&1
    # Delete everything < length of 1.ffs
    numberoflines=$(sed -n '$=' ./1.ffs)
    # rewrite the line numbers and the filename (to ffs)
    sed 's/\.ffs.js/.ffs/g' <$1.lint >$1.bin.1
    sed 's/fp\///g' <$1.bin.1 >$1.bin.2
    perl -pe "s/^\s+\K\d+/$&- ${numberoflines}/ge" <$1.bin.2 >$1.bin.3
    cat $1.bin.3
    rm $1.bin.*
    rm $1.lint
 fi