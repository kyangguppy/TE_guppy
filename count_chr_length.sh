#count chromosome length
awk '/^>/&&NR>1{print "";}{printf "%s",/^>/ ? $0" ":$0}' guppy_pacbio_male.unmasked.fasta |awk '{print $1"\t"length($2)}' > guppy.len.txt