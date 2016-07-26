describe apt('ppa:git-core/ppa') do
  it { should exist }
  it {should be_enabled }
end

describe package('git') do
  it { should be_installed }
end

describe package('chefdk') do
  it { should be_installed }
end

describe package('zsh-beta') do
  it { should be_installed }
end

