# bass-connections-acoustics

```
conda create -n birdnet-analyzer python=3.10 -c conda-forge -y
conda activate birdnet-analyzer
python3 analyze.py --i /Volumes/TLS-1/Test-Data --o /Volumes/TLS-1/Test-Output
```
```
# combining files
for file in *.txt; do cat "$file"; echo "-----------------------"; done > Site_18_Results.txt
awk -F'\t' '{print $4 "," $5 "," $6 "," $10 "," $11}' *.txt | sort | uniq -c | awk -F',' '{print $2 "," $3 "," $4 "," $5 "," $1}' > summary.csv
```
