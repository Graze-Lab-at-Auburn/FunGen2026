#!/bin/bash

############################################################################################
###  	Title: Practice Script						
### 	Author: Rita Graze
###		Date: January, 2026
###		BIOL6850: Functional Genomics, Auburn University
###		
###     Purpose: Practice making a directory (folder) in scratch, moving files, assigning
###     variables,and checking error logs. 
###
###     THERE ARE FOUR ERRORS IN THIS SCRIPT! Can you find them and make 
###     it run correctly? Try to do this without AI.
###
###     Stuck? See hints below.  
###     HINT 1: Make sure your variable syntax is correct
###     HINT 2: Make sure your mkdir commands behave as expected
###     HINT 3: Doublecheck directories and file names are consistent
###     HINT 4: Always check logs and output
###
###     For running the script on the Alabama Super Computer:
###	    https://hpcdocs.asc.edu/content/pbs-queue-system
### 	After you have this script in your home directory and you have made it executable using  
###     "chmod +x [script name]", then run the script by using "run_script [script name]"
### 	Suggested paramenters are below to submit this script:
### 	queue: class
###		core: 1
###		time limit (HH:MM:SS): 00:20:00 
###		Memory: 1gb
###		run on asax
##############################################################################################

#source /opt/asn/etc/asn-bash-profiles-special/modules.sh
#module load <tool name >

######### Your first goal is to make a directory in scratch for you to conduct your work #######
##### Assign a variable to the directory name that you plan to make. 
	## This will make it easier in following steps so you don't have to write out the whole directory everytime
	##  IMPORTANT! 'aubrmg001' is MY (Rita Graze) class account identifier. You need to replace 'aubrmg001' with YOUR ID
DATADIR=/scratch/aubrmg001/test2
SHAREDIR=/home/aubrmg001/graze_class/

######  Now use that variable to make the directory in SCRATCH for holding your data
###  Example: mkdir /scratch/YOUR_ID/fastqc
###  -p means to make all directories above if needed
mkdir -p ${DATADIR}

### Change (move) to the scratch directory you just made
### Example: cd /scratch/YOUR_ID/test
cd ${DATADIR}

####### Move the practice datafiles (all files with .fastq) from our shared directory to where you are, here (.)
cp ${SHAREDIR}/*.fastq  .


###########  Check for errors in transfer. Calculate the md5sum for the file.
### Calculate the md5sum values of the files in the original folder and read (put) into a text file.
md5sum {SHAREDIR}*.fastq 2> md5sum_Original.txt

### Calculate the md5sum values of the files you just moved and read (put) into a text file.
md5sum ./*.fastq >> md5sum_New.txt

######  Make a directory for this project and results in your home folder
######  This code checks if the directory is created and outputs a log

if mkdir /home/aubrmg001/Practice_Code_2026/md5sum_files; then
	echo "Beep Boop, directory made!" > log.txt
else
    echo "Beep Boop, rut roh" > log.txt
fi

##### Move the md5sums text files back to your home folder
mv md5sum.txt /home/aubrmg001/Practice_Code_2026/md5sum_files

mv md5sum_Original.txt /home/aubrmg001/Practice_Code_2026/md5sum_files

##### Log that your script has completed
echo "Script Completed" >> log.txt

