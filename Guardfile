guard :bundler do
  watch 'Gemfile'
end

guard :rspec do
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

  watch 'app/controllers/application_controller.rb' do
    "spec/controllers"
  end

  watch %r{^app/views/(.+)/.*\.(erb|haml)$} do |m|
    "spec/features/#{m[1]}_spec.rb"
  end
end

