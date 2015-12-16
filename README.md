# locale

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What locales affects](#what-locales-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with locales](#beginning-with-locales)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

Configures the language location.

## Module Description

Configures the locales of the system.

## Setup

### What locales affects

* Configures content of /etc/default/locale, it will be overwritten.
* Configures content of /var/lib/locales/supported.d/local, it will be overwritten.
* Compiles the list of locales definition files

### Beginning with locales
Example with default configuration.
```puppet
class { 'locale':
  default_locale => 'en_US.UTF-8',
  locales        => [ 'en_US.UTF-8 UTF-8', 'es_ES.UTF-8 UTF-8' ],
}
```

## Usage

### locale
* default_locale: the primary location to set.
* locales: the whole of locations to add to configuration.

## Limitations

* Deviant derivatives: supported.
* Others: unsupported.
