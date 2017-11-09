require "./interface_address/*"

require "socket"

module InterfaceAddress
  def self.get_interface_addresses
    output = [] of IfAddr

    retval = Ifaddrs.getifaddrs(out current_ip)
    return output if retval != 0

    while current_ip
      if current_ip.value.ifa_addr.value.sa_family != 17
        output << IfAddr.new(
          String.new(current_ip.value.ifa_name),
          Socket::IPAddress.from(current_ip.value.ifa_addr, sizeof(LibC::Sockaddr)),
          Socket::IPAddress.from(current_ip.value.ifa_netmask, sizeof(LibC::Sockaddr)),
        )
      end

      current_ip = current_ip.value.ifa_next
    end

    output
  end
end
