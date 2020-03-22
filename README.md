# Ubuntu-Daily-Build-Downloader

## Information

Simple Shell script that will download the latest daily builds of the official ubuntu flavours

Uses zsync to effeciently download the changes to the file if already downloaded

## Requirements

 - zync required
 
    ```sudo apt install zsync```


## Usage

```./getiso.sh```

Will create a folder for each flavour and download the iso into it.


For different versions and arch edit the scripts following lines:
```
SERIES="focal"
TYPE="desktop"
ARCH="amd64"
```

Inspired by Alan Pope ubuntu testing youtube videos.
