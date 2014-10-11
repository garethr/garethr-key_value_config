Maybe your configuration data isn't in files on disk, but in a new fancy
distributed configuration store. But you still want to manage that
configuration in code. Enter the `key_value_config` type for Puppet.

```puppet
key_value_config { '/foo':
  ensure   => present,
  provider => etcd,
  value    => 'bar',
}
```

Currently this type has a single provider for
[Etcd](https://github.com/coreos/etcd) but writing other providers for
Consul or Zookeeper should be trivial.

## Configuration

By default the provider will try and talk with an Etcd node on localhost
on port 4001. You can adjust this behaviour using environment variables,
specifically: `ETCD_HOST`, `ETCD_PORT`, `ETCD_USERNAME` and
`ETCD_PASSWORD`.
