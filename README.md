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

Installation of firefox on desktop. I use it on Debian with gnome-shell

## Module Description


## Setup

### What firefox affects

* Require maestrodev-wget
* Download firefox and extract it
* System icon and app launcher

### Beginning with firefox

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

  class { 'firefox':
    version => '30.0',
  }

## Reference

## Limitations

Tested on debian
