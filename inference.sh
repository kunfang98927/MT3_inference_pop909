#!/bin/bash

#SBATCH -p aquila # Partition to submit to

#SBATCH --mem=8000 # Memory pool for all cores, MB

#SBATCH -o myjob.o # File to which STDOUT will be written

#SBATCH -e myjob.e # File to which STDERR will be written

#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL

#SBATCH --mail-user=kf2395@nyu.edu # Email which notifications will be sent  

#SBATCH --gres=gpu:4 # How much gpu need, n is the number

python mt3_inference.py