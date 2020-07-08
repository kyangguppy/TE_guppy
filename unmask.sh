awk '{if(/^[^>]/)-bash = toupper(-bash);print -bash}' guppy_pacbio_male.fasta > guppy_pacbio_male.unmasked.fasta
