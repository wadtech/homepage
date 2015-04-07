def random_hex
  "%06x" % (rand * 0xffffff)
end

namespace :homepage do
  require "open-uri"
  require "faker"

  desc "Generates random test images for seeding the database"
  task :capture_test_images do
    sample_path = File.join(Rails.root, "db", "sampleimages")
    if Dir.glob(File.join(sample_path, '*.png')).length != 0
      puts "Images already generated? Check #{sample_path}"
      next
    end

    10.times do |i|
      url = "http://dummyimage.com/500x350/#{random_hex}/#{random_hex}&text=#{Faker::App.version}"
      open(url) do |f|
        File.open(sample_path + "/image-#{i}.png", "wb") { |file|
          file.puts f.read
          puts "Saved image #{i}"
        }
      end
    end

    puts "Generated Images"
  end
end
