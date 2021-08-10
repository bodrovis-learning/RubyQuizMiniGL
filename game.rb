module Millionaire
  C = Gui::CReader.new

  class Game
    def initialize
      engine = Millionaire::Engine::GameEngine.new
      @main_window = Millionaire::Gui::Main.new engine
      @main_window.show
    end
  end
end