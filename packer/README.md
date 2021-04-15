# Packer
## Command
```
$ cd dev
$ packer build -var-file="var.json" packer.json
```

# KickStart
## Generate Root password
```
$ python3 -c 'import crypt; print(crypt.crypt("パスワード", crypt.METHOD_SHA512))'
```