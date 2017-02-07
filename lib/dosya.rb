module Passaparola
  class Dosya

    SORULAR = "./db/sorular.txt"
    CEVAPLAR = "./db/sorular.txt"

    def sozluk
      @soru_cevap = Hash[sorular.zip(cevaplar)]
    end

    def


  end
end
