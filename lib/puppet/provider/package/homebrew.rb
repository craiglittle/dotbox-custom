require 'puppet/provider/package'

Puppet::Type.type(:package).provide(:homebrew, :parent => Puppet::Provider::Package) do
  desc 'Package provider support for Homebrew'

  confine :operatingsystem => :darwin

  HOMEBREW_DIR = '/usr/local'

  environment_vars = {
    'HOME'     => "/Users/#{Facter.value(:id)}",
    'PATH'     => "#{HOMEBREW_DIR}/bin:/usr/bin:/usr/sbin:/bin:/sbin",
    'CFLAGS'   => '-O2',
    'CPPFLAGS' => '-O2',
    'CXXFLAGS' => '-O2'
  }

  has_command(:brew, '/usr/local/bin/brew') { environment(environment_vars) }

  has_feature :versionable
  has_feature :install_options

  class << self

    def home
      HOMEBREW_DIR
    end

    def active?(name, version)
      current(name) == version
    end

    def available?(name, version)
      version = nil if unversioned?(version)

      File.exist?(File.join([home, 'Cellar', simplify(name), version].compact))
    end

    def current(name)
      link = Pathname.new("#{home}/opt/#{simplify(name)}")

      link.exist? && link.realpath.basename.to_s
    end

    def simplify(name)
      name.split('/').last
    end

    # When it comes to Homebrew, none of Puppet's state stuff is to be
    # trusted. Do everything as just-in-time as possible.

    def instances
      []
    end

    def unversioned?(version)
      %w(present installed absent purged held latest).include?(version.to_s)
    end

  end

  def install
    version = unversioned? ? 'latest' : @resource[:ensure]

    update_formulas if !version_defined?(version) || version == 'latest'

    if self.class.available?(@resource[:name], version)
      # If the desired version is already installed, just link or
      # switch. Somebody might've activated another version for
      # testing or something like that.
      brew(:switch, @resource[:name], version)
    elsif self.class.current(@resource[:name])
      # Okay, so there's a version already active, it's not the right
      # one, and the right one isn't installed. That's an upgrade.
      brew(:upgrade, @resource[:name])
    else
      # Nothing here? Nothing from before? Yay! It's a normal install.
      brew(:install, @resource[:name], *install_options)
    end
  end

  def update_formulas
    unless self.class.const_defined?(:UPDATED_BREW)
      notice 'Updating homebrew formulas...'

      brew(:update)

      self.class.const_set(:UPDATED_BREW, true)
    end
  end

  def version_defined?(version)
    output           = brew(:info, @resource[:name]).strip
    defined_versions = output.lines.first.strip.split(' ')[2..-1]

    defined_versions.include?(version)
  end

  def install_options
    Array(resource[:install_options]).flatten.compact
  end

  def query
    return unless version = self.class.current(@resource[:name])

    {:ensure => version, :name => @resource[:name]}
  end

  def uninstall
    brew(:uninstall, '--force', "#{simplify(@resource[:name])}")
  end

  def unversioned?
    self.class.unversioned?(@resource[:ensure])
  end

  def update
    install
  end

  def simplify(name)
    self.class.simplify(name)
  end

end
