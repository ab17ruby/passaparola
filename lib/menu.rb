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
        oyunSonu_kaydet
      when "2"
        sonuclari_goster
      when "q"; exit
      else
        puts "Hatali giris yaptiniz."
        main_menu
      end
    end

    def info_menu
      @yarismaci = Passaparola::Kisiler.new
      puts "Adiniz : "
      @yarismaci.adi = gets.gsub("\n",'')
      puts "Soyadiniz : "
      @yarismaci.soyadi = gets.gsub("\n",'')
      puts "Yasiniz : "
      @yarismaci.yasi = gets.gsub("\n",'')
      puts "Mesleginiz : "
      @yarismaci.meslegi = gets.gsub("\n",'')
      @yarismaci.puani = 0
    end

    def oyun
      dosya = Passaparola::Dosya.new
      @sorular = dosya.soru_cevap
      puts "Pas geçmek için ENTER'a basınız"
      until @sorular.empty? do
        @sorular.each do |key,value|
          puts key
          print "Cevabiniz : "
          print value[1]
          cevap = gets.chomp.upcase
          cevap.insert(0,value[1].upcase!) unless cevap.nil?
          if cevap.upcase == value.upcase!.strip
            @yarismaci.puani +=100
            puts "DOGRU !"
            @sorular.delete key
          elsif cevap == "PAS" || cevap.nil?
            puts "Pas gectiniz."
          else
            @yarismaci.puani -=100
            @sorular.delete key
            puts "YANLİS !"
            puts "Dogru cevap : #{value.upcase}"
          end
          puts "-"*50
          puts "Güncel Puan : " + @yarismaci.puani.to_s
        end
      end
      puts "Puaniniz #{@yarismaci.puani}"
    end
    def oyunSonu_kaydet
      puts @yarismaci.adi
      puts @yarismaci.puani =@yarismaci.puani.to_s << "\n"
      @yarismaci.save
    end
    def sonuclari_goster
      Passaparola::Dosya.new.sonuclari_oku.each do |yarismaci|
        puts yarismaci.adi + " " + yarismaci.soyadi + " : " + yarismaci.puani
      end
    end
  end
end
