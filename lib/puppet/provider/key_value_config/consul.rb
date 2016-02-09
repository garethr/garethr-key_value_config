require 'diplomat'

Puppet::Type.type(:key_value_config).provide(:consul) do
  confine feature: :consul

  mk_resource_methods

  def exists?
    Puppet.info("Checking if key #{name} exists")
    begin
      resp = Diplomat.get(name)
      resp == resource[:value]
    rescue Diplomat::KeyNotFound
      false
    end
  end

  def create
    Puppet.info("Setting #{name} to #{resource[:value]}")
    Diplomat.put(name, resource[:value].to_s)
  end

  def destroy
    Puppet.info("Deleting #{name}")
    Diplomat.delete(name)
  end
end
