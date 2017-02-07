module Passaparola
  class Kisiler
    attr_accessor :adi, :soyadi, :yasi, :meslegi, :puani

    def initialize; end

    DOSYA_ADI = 'db/yarismacilar.txt'.freeze
    def save
      yarismacilar = [@adi, @soyadi, @yasi, @meslegi]
      File.open(DOSYA_ADI, 'a') do |dosya|
        dosya.print yarismacilar.join(';')
      end
     end
   end
 end
