Facter.add('current_user') do
  setcode do
    Facter::Util::Resolution.exec('/usr/bin/sudo -i echo $SUDO_USER')
  end
end
