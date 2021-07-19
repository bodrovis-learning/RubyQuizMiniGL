module Millionaire
  C = CReader.new

  class Game
    def initialize
      @main_window = Millionaire::Main.new
      @main_window.show
    end
  end
end