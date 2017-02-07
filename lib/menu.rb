require_relative './kisiler'
require_relative './dosya'

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
      @yarismaci.puani = 0
    end

    def oyun
      dosya = Passaparola::Dosya.new
      @sorular = dosya.soru_cevap
      until @sorular.empty? do
        @sorular.each do |key,value|
          puts key
          print "Cevabiniz #{value[1]}.. : "
          cevap = gets.chomp.upcase!
          if cevap == value.upcase.strip
            @yarismaci.puani +=100
            puts "DOGRU !"
            @sorular.delete key
          elsif cevap == "PAS" && @pas_hakki != 0
            puts "Pas gectiniz."
          else
            @yarismaci.puani -=100
            @sorular.delete key
            puts "YANLİS !"
          end
          puts "-"*50
        end
      end
      puts "Puaniniz #{@yarismaci.puani}"
    end
  end
end
