# Extract only the remaining gRNA sequence from each trimmed file in the folder
# and store in a subdirectory ./seqonly with suffix .seq
mkdir seqonly
for file in *.trimmed
do awk 'NR % 4 == 2' "$file" > ./seqonly/"$file".seq
done
cd seqonly

# Tabulate and sort in descending order all .trimmed files
# and store in subdirectory ./uniq with suffix .uniq
mkdir uniq
for file in *.seq
do sort "$file" | uniq -c | sort -nr > ./uniq/"$file".uniq
done
