class FourLetterMethodsOnlyPlease
  
  def method_missing(name, *args, &block)
    if name.to_s.size == 4
      puts "Thanks for calling #{name}"
    else
      super
    end
  end
  
end

four_letters_ok = FourLetterMethodsOnlyPlease.new

four_letters_ok.chad
four_letters_ok.helo
four_letters_ok.oh_no!