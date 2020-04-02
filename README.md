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
### Select flavour download

Rather than downloading all of the flavour you can  add the flavour name to download that specific flavour eg.
```
./getiso.sh ubuntu kubuntu
```
to download only the ubuntu and kubuntu flavours.

### copy2usb

Extra script for copying the downloaded iso's to an Easy2Boot drive.

It labels the iso's with the flavour and date modified for easy identification. You can also select to copy select flavours.

Please modify the E2B_DRIVE variable in the script to the path of your drive.
## About

Written by digitalight (Mike Glover)

Inspired by Alan Pope ubuntu testing youtube videos.
