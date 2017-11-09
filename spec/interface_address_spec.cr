require "./spec_helper"

describe InterfaceAddress do
  it "works" do
    interfaces = InterfaceAddress.get_interface_addresses
    interfaces.size.should be > 0
  end

  it "has important properties" do
    interfaces = InterfaceAddress.get_interface_addresses
    result = interfaces.first

    result.interface_name.should be_a String
    result.ip_address.should be_a Socket::IPAddress
    result.netmask.should be_a Socket::IPAddress
  end
end
