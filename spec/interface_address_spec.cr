require "./spec_helper"

describe InterfaceAddress do
  it "works" do
    interfaces = InterfaceAddress.get_interface_addresses
    interfaces.size.should_not eq(0)
  end
end
