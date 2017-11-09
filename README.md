# interface_address

Crystal library to retrieve your system's network interface addresses.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  interface_address:
    github: t-richards/interface_address
```

## Usage

```crystal
require "interface_address"

InterfaceAddress.get_interface_addresses.each do |a|
  puts a.interface_name
  print "  IP: "
  puts a.ip_address.address
  print "  NETMASK: "
  puts a.netmask.address
end
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/t-richards/interface_address/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [t-richards](https://github.com/t-richards) Tom Richards - creator, maintainer
