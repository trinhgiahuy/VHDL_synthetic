## Makefile in general

---
## Concept break down

* Bash Scripting : **Bash** is a command language (its also Unix shell), which we will use to write actual commands or automate file generation

For e.g: see [bashExample.sh](./bashExample.sh)

* Target notation: a way of writting which files are dependent on other files. See also bashExample.sh

Bash is mostly used for automation on Linux distro, also an imperative script language. When creating a script, depending on your current **umask**, the script may not itself executable
You need to change by `chmod +x script_name.sh`

If you wantto give more generic permissions, you can execute something similar to this

`chmod 777 script_name.sh`

[make and Makefiles Ryerson Polytechnic University](https://www.ee.ryerson.ca/~elf/ele428/makefile-tutorial.html)
