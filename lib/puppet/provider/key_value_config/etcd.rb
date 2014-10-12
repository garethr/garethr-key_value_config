require 'etcd'

Puppet::Type.type(:key_value_config).provide(:etcd) do
  confine feature: :etcd
  mk_resource_methods

  def initialize(*args)
    opts = {
      host: ENV['ETCD_HOST'],
      port: ENV['ETCD_PORT'],
      username: ENV['ETCD_USERNAME'],
      password: ENV['ETCD_PASSWORD'],
    }
    final_opts = opts.reject { |k,v| v.nil? }
    @client = Etcd.client(final_opts)
    super(*args)
  end

  def exists?
    Puppet.info("Checking if key #{name} exists")
    @client.exists?(name) && @client.get(name).value == resource[:value]
  end

  def create
    Puppet.info("Setting #{name} to #{resource[:value]}")
    @client.set(name, value: resource[:value])
  end

  def destroy
    Puppet.info("Deleting #{name}")
    @client.delete(name)
  end
end
