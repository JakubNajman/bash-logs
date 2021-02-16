mkdir ./temp 
grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" ./input/input.log > ./temp/temp.txt
sed -e "s/remote_addr=//g" -i ./input/input.log
sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n ./temp/temp.txt > ./temp/tempoutput.txt
sort -m ./temp/tempoutput.txt | uniq -d > ./temp/dups.txt
cat -n ./temp/tempoutput.txt | sort -uk2 | sort -n | cut -f2- > output.txt
echo "Adresy IP w logu:"
cat output.txt
echo "Zduplikowane adresy w logu:"
cat ./temp/dups.txt
rm -rf ./temp
