Maybe your configuration data isn't in files on disk, but in a new fancy
distributed configuration store. But you still want to manage that
configuration in code. Enter the `key_value_config` type for Puppet.

[![Puppet
Forge](http://img.shields.io/puppetforge/v/garethr/key_value_config.svg)](https://forge.puppetlabs.com/garethr/key_value_config)
[![Build
Status](https://secure.travis-ci.org/garethr/garethr-key_value_config.png)](http://travis-ci.org/garethr/garethr-key_value_config)

## Usage

Currently this type has two providers for
[Etcd](https://github.com/coreos/etcd) and [Consul](http://www.consul.io/) but
writing other providers for Zookeeper or similar services should be trivial.

So setting a value for Etcd:

```puppet
key_value_config { '/foo':
  ensure   => present,
  provider => etcd,
  value    => 'bar',
}
```

Or alternatvely for Consul:

```puppet
key_value_config { '/foo':
  ensure   => present,
  provider => etcd,
  value    => 'bar',
}
```


## Configuration

By default the provider will try and talk with an Etcd node on localhost
on port 4001. You can adjust this behaviour using environment variables,
specifically: `ETCD_HOST`, `ETCD_PORT`, `ETCD_USERNAME` and
`ETCD_PASSWORD`.

The Consul provider currently tries to access Consul on localhost:8500
and isn't configurable. This is because I couldn't find a configurable
Consul client.


## A note on error handling

There isn't any. If you don't pass workable keys and values then you'll
likely get errors. I'll hopefully add sensible validation and remove
this message in the future.
