require "./interface_address/*"

require "socket"

module InterfaceAddress
  def self.get_interface_addresses
    output = [] of IfAddr

    retval = C.getifaddrs(out current_ip)
    return output if retval != 0

    while current_ip
      begin
        output << IfAddr.new(
          String.new(current_ip.value.ifa_name),
          Socket::IPAddress.from(current_ip.value.ifa_addr, sizeof(LibC::Sockaddr)),
          Socket::IPAddress.from(current_ip.value.ifa_netmask, sizeof(LibC::Sockaddr)),
        )
      rescue e : Exception
        message = e.message
        if message
          # Ignore errors from Socket::Address
          raise e unless message.starts_with?("Unsupported family type")
        end
      end

      current_ip = current_ip.value.ifa_next
    end

    output
  end
end
