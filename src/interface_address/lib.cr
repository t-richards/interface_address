lib C
  struct Ifaddrs
    ifa_next : Ifaddrs*
    ifa_name : UInt8*
    ifa_flags : UInt32
    ifa_addr : LibC::Sockaddr*
    ifa_netmask : LibC::Sockaddr*
    ifa_destaddr : LibC::Sockaddr*
    ifa_data : Void*
  end

  fun getifaddrs(ifap : Ifaddrs**) : Int32
end
