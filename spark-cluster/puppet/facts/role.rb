# role.rb

Facter.add('role') do
  setcode do
    Facter::Core::Execution.exec('cat /tags/.role')
  end
end