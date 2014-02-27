require "lita"

module Lita
  module Handlers
    class HighFive < Handler
      route(%r{o/}i, :high_five, command: true, help: { "o/" => t("help.high_five_value")})
      route(%r{\\o}i, :inverse_high_five, command: true)

      def high_five(response)
        response.reply("\\o")
      end

      def inverse_high_five(response)
        response.reply("o/")
      end
    end

    Lita.register_handler(HighFive)
  end
end

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "..", "..", "locales", "*.yml"), __FILE__
)]
