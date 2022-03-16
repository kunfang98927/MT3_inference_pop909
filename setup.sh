#!/bin/bash

apt-get update -qq && apt-get install -qq libfluidsynth1 build-essential libasound2-dev libjack-dev

pip install --upgrade pip
pip install --upgrade jaxlib -f https://storage.googleapis.com/jax-releases/jax_releases.html
pip install nest-asyncio
pip install pyfluidsynth

# install t5x
git clone --branch=main https://github.com/google-research/t5x
mv t5x t5x_tmp; mv t5x_tmp/* .; rm -r t5x_tmp
sed -i 's:jax\[tpu\]:jax:' setup.py
python3 -m pip install -e .

# install mt3
git clone --branch=main https://github.com/magenta/mt3
mv mt3 mt3_tmp; mv mt3_tmp/* .; rm -r mt3_tmp
python3 -m pip install -e .

# copy checkpoints
gsutil -q -m cp -r gs://mt3/checkpoints .

# copy soundfont (originally from https://sites.google.com/site/soundfonts4u)
gsutil -q -m cp gs://magentadata/soundfonts/SGM-v2.01-Sal-Guit-Bass-V1.3.sf2 .

pip install jax jaxlib librosa seqio t5 t5x note_seq