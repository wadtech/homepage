guard :rspec, cmd: "bundle exec bin/rspec --color --format documentation", all_on_start: true do
  watch %r{^spec/.+_spec\.rb$}

  watch %r{^lib/(.+)\.rb$} do |m|
    "spec/lib/#{m[1]}_spec.rb"
  end

  watch 'spec/spec_helper.rb' do
    "spec"
  end

  watch %r{^app/(.+)\.rb$} do |m|
    "spec/#{m[1]}_spec.rb"
  end

  watch %r{^spec/support/(.+)\.rb$} do
    "spec"
  end

  watch %r{^app/views/(.+)/.*\.(erb|haml)$} do |m|
    "spec/features/#{m[1]}_spec.rb"
  end
end


guard 'migrate' do
  watch(%r{^db/migrate/(\d+).+\.rb})
  watch('db/seeds.rb')
end

guard :bundler do
  require 'guard/bundler'
  require 'guard/bundler/verify'
  helper = Guard::Bundler::Verify.new

  files = ['Gemfile']
  files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }

  # Assume files are symlinked from somewhere
  files.each { |file| watch(helper.real_path(file)) }
end
