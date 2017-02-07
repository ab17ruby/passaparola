module Passaparola
    class Dosya
      def initialize
      end

        DOSYA_ADI = './db/soru_cevap.txt'.freeze

        def soru_cevap
            File.open(DOSYA_ADI, 'r').readlines.reject(&:empty?).map { |s| s.split(';') }.to_h
        end

        def sonuclari_oku
            file = File.open("./db/yarismacilar.txt","r")
            yarismacilar = file.readlines.delete_if {|line| line.empty?}.map do |yarismaci|
              dosya_yarismaci = yarismaci.split(";")
              yarismaci = Passaparola::Kisiler.new
              yarismaci.adi = dosya_yarismaci[0]
              yarismaci.soyadi = dosya_yarismaci[1]
              yarismaci.yasi = dosya_yarismaci[2]
              yarismaci.meslegi = dosya_yarismaci[3]
              yarismaci.puani = dosya_yarismaci[4]
              yarismaci
            end
            file.close
            yarismacilar
          end
      end
end
