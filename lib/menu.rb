require 'kisiler'
require './program'

module Passaparola
  class Menu
    def initiliaze
      main_menu
    end

    def main_menu
      puts "MENU".center(10,"*")
      puts "1) Yaris"
      puts "2) Kayıtlar "
      puts "Cikmak icin q"
      print "Secim : "
      selection = gets
      case selection
      when "1"
        info_menu
      when "2"

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
      @sorular = Passaparola::Dosya.sozluk
      until @sorular.empty? do
        @sorular.each do |key,value|
          puts key
          print "Cevabiniz : "
          cevap = gets.upcase!
          if cevap == value.upcase
            @yarismaci.puani += 100
            @sorular.shift
          elsif cevap == "PAS"
          else
            puts "Kaybettiniz. Cevap : #{value}"
          end
        end
      end
    end
  end
end
