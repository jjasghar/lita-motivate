require 'pry'
module Lita
  module Handlers
    class Motivate < Handler


      route(/^!(m|than(k|ks)) (.+)$/, :motivate, help: {
              "!m USER" => "motivates the user.",
              "!m thank(s) USER" => "motivates the user."
            })

      def motivate(request)
        name = request.matches[0][2]
        request.reply("#{name} keep up the good work!")
      end

    end

    class MotivateWithTemplates < Handler
      route(/^(\^5|!h5) (.+)$/, :high_five, help: {
              "!h5 USER" => "high fives the user.",
              "^5 USER" => "high fives the user."
            })

      def high_five(request)
        name = request.matches[0][1]
        request.reply("/me high fives #{name}")
      end

    end

    Lita.register_handler(Motivate)
    Lita.register_handler(MotivateWithTemplates)
  end
end
