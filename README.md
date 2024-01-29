# Use BirdNET for Acoustic Analysis

[Link here](https://github.com/kahst/BirdNET-Analyzer#6-setup) to BirdNET documentation about setup.

## Running software after installation
```
conda create -n birdnet-analyzer python=3.10 -c conda-forge -y
conda activate birdnet-analyzer
```
## Analyzing data
`/Test-Data` contains the audio files, and `/Test-Output` will contain the output txt files.
```
python3 analyze.py --i /Volumes/TLS-1/Test-Data --o /Volumes/TLS-1/Test-Output
```
Example of output txt file:
```
Selection	View	Channel	Begin File	Begin Time (s)	End Time (s)	Low Freq (Hz)	High Freq (Hz)	Species Code	Common Name	Confidence
1	Spectrogram 1	1	PAM10_20230329_134000.wav	27.0	30.0	0	15000	comyel	Common Yellowthroat	0.1509
2	Spectrogram 1	1	PAM10_20230329_134000.wav	42.0	45.0	0	15000	whcspa	White-crowned Sparrow	0.4326
3	Spectrogram 1	1	PAM10_20230329_134000.wav	51.0	54.0	0	15000	rensap	Red-naped Sapsucker	0.2931
4	Spectrogram 1	1	PAM10_20230329_134000.wav	51.0	54.0	0	15000	azujay1	Azure Jay	0.1941
5	Spectrogram 1	1	PAM10_20230329_134000.wav	54.0	57.0	0	15000	yebsap	Yellow-bellied Sapsucker	0.2835
6	Spectrogram 1	1	PAM10_20230329_134000.wav	54.0	57.0	0	15000	rensap	Red-naped Sapsucker	0.2361
```

## Summarizing all txt files in a csv file
```
awk -F'\t' '{print $4 "," $5 "," $6 "," $10 "," $11}' *.txt | sort | uniq -c | awk -F',' '{print $2 "," $3 "," $4 "," $5 "," $1}' > summary.csv
```
