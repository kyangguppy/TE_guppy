RepeatMasker -pa 32 -a -no_is -gccalc -lib /data/charlesworth/guppy/analyses/TEguppy/guppy-families.fa -div 30 -xsmall /data/charlesworth/guppy/raw/PacBio_male/upper_guppy_pacbio_male.fasta -dir /scratch/kyang/RepeatMasker2 && rsync -r /scratch/kyang/RepeatMasker2 /data/charlesworth/guppy/analyses/temporary && rm -r /scratch/kyang/RepeatMasker2

