#!/usr/bin/env rake
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'json'

task :update do
  js_dir  = 'vendor/assets/javascripts'
  css_dir = 'vendor/assets/stylesheets'
  img_dir = 'vendor/assets/images'
  [js_dir, css_dir, img_dir].each do |dir|
    FileUtils.rm_r(dir)
    FileUtils.mkdir(dir)
    FileUtils.touch(File.join(dir, '.gitkeep'))
  end

  puts 'Updating source files...'
  `git submodule foreach git pull`

  puts 'Copying source js files...'

  source_files = Dir['jquery.inputmask/js/*.js'].reject{ |file| file =~ /.min.js\Z/}
  source_files.each do |file|
    print "#{file.sub('jquery.inputmask/', '')}"
    FileUtils.cp(file, js_dir)
    puts "...ok"
  end

  puts 'Updating version...'
  version = JSON.parse(File.read('jquery.inputmask/bower.json'))['version']
  readme  = File.read('README.md')
  puts "Current version is: #{version}"
  new_content = readme.gsub(/(?<=<b id="jquery.inputmask-version">)[\d\.]+(?=<\/b>)/, version)
  File.open('README.md','w') { |f| f.write(new_content) }
end

task :build do
  FileUtils.rm_f Dir['*.gem']
  `gem build jquery-inpumask-rails.gemspec`
  built_gem_file = Dir['*.gem'].first
  if built_gem_file
    `gem push #{built_gem_file}`
  else
    raise "Gem was not built!"
  end
end
