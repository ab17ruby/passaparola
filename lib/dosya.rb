module Passaparola
    class Dosya
      def initialize
      end

        DOSYA_ADI = './db/soru_cevap.txt'.freeze

        def soru_cevap
            File.open(DOSYA_ADI, 'r').readlines.reject(&:empty?).map { |s| s.split(';') }.to_h
        end
      end
end
