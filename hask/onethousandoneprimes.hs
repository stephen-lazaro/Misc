--10,001st Prime!
genPrime :: ([Integer], Integer) -> Integer
genPrime ((hd:lz), 10001) = hd
genPrime ((hd:lz)), n) = genPrime ((erato (hd:lz)), n + 1)
	where erato (hd:lz) = 