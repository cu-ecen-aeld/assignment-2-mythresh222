 #!/bin/bash
 set -xev
 if [ $# -lt 1 ]; then
     echo "writefile is not specified"
         exit 1
         elif [ $# -lt 2 ]; then
             echo "writestr is not specified"
                 exit 1
                 else
                     filepath=$1
                         directory=$(dirname "$filepath")
                             filename=$(basename "$filepath")
 
                                 # Create the directory if it doesn't exist
                                     mkdir -p "$directory"
 
                                         # Create the file and write to it
                                             if touch "$filepath"; then
                                                     echo "$2" > "$filepath"
                                                         else
                                                                 echo "Error: Could not create file $filepath"
                                                                         exit 1
                                                                             fi
 fi
