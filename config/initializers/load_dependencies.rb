Dir.glob("#{Rails.root}/lib/modules/*.rb").collect{|file| require file}
