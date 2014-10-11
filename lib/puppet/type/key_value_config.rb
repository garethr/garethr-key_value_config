Puppet::Type.newtype(:key_value_config) do
  @doc = 'type representing a value in a key/value config store'

  ensurable

  newparam(:name, namevar: true) do
    desc 'the key under which to store the value'
  end

  newproperty(:value) do
    desc 'the value to store'
  end
end
