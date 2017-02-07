require_relative './kisiler'


module Passaparola
  class Menu
    def initialize
      main_menu
    end

    def main_menu
      puts "MENU".center(10,"*")
      puts "1) Yaris"
      puts "2) Kayıtlar "
      puts "Cikmak icin q"
      print "Secim : "
      selection = gets.chomp
      case selection
      when "1"
        info_menu
        oyun
      when "2"
        Ogrenciler::Dosya.save
      when "q"; exit
      else
        puts "Hatali giris yaptiniz."
        main_menu
      end
    end

    def info_menu
      @yarismaci = Passaparola::Kisiler.new
      puts "Adiniz : "
      @yarismaci.adi = gets
      puts "Soyadiniz : "
      @yarismaci.soyadi = gets
      puts "Yasiniz : "
      @yarismaci.yasi = gets
      puts "Mesleginiz : "
      @yarismaci.meslegi = gets
    end

    def oyun
      dosya = Passaparola::Dosya.new
      @sorular = dosya.soru_cevap
      until @sorular.empty? do
        @sorular.each do |key,value|
          puts key
          print "Cevabiniz : #{value[0].uppercase!}"
          cevap = gets.upcase!.insert(0,value[0])
          if cevap == value.upcase
            @yarismaci.puani += 100
            @sorular.shift
          elsif cevap == "PAS"
          else
            @yarismaci.puani -=100
          end
        end
      end
    end
  end
end
