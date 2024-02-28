Remove color in the output

> ./somescript | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g"

https://stackoverflow.com/questions/17998978/removing-colors-from-output
