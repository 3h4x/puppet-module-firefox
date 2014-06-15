puppet-module-firefox
=====================

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with firefox](#setup)
    * [What firefox affects](#what-firefox-affects)
    * [Beginning with firefox](#beginning-with-firefox)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This module provide installation of firefox.
It should work on any linux system because it use pre-compiled binary from mozilla.

## Module Description

What it does is download tar.bz2 archive with firefox pre-compiled binary, extract it and create firefox.desktop.
I use it on Debian with gnome-shell.

## Setup

### What firefox affects

* Download firefox and extract it
* Require maestrodev-wget
* New system icon and app launcher

### Beginning with firefox

puppet module install h4x-firefox

## Usage

* you can start with just using defaults
```
   class { 'firefox': }
```

* version picking
```
  class { 'firefox:'
    version => '30.0',
  }
```

* architecture
```
   class { 'firefox:'
      architecture => 'x86_64',
   }
```
For 64 bit
```
   class { 'firefox:'
      architecture => 'i686',
   }
```
For 32 bit

* language
```
  class { 'firefox:'
    language => 'en_GB',
  }
```
Check avaliable languages on mozilla website http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/latest/linux-x86_64/

* installation directory
```
   class { 'firefox':
      root_dir => '/opt',
   }
```

## Reference

## Limitations

All versions tested with docker on debian-wheezy and debian jessie.
