module Millionaire
  class Main < MiniGL::GameWindow
    include MiniGL

    def initialize
      super C.screen_width, C.screen_height, false
      self.caption = "Millionaire Game"

      show_question
      show_answers
    end

    def show_question
      @question = Question.new "Test question ... #{rand 1000}"
    end

    def show_answers
      @btns = []

      (0..3).inject(80) do |current_y_coord, i|
        answer_y = current_y_coord + 20
        answer_y = i.zero? ? answer_y : (answer_y + C.answer_height)

        @btns << AnswerButton.new(answer_y, "TEST #{rand 10000}") do
          select_answer
        end

        answer_y
      end
    end

    def select_answer
      show_question
      show_answers
    end

    def needs_cursor?
      true
    end

    def update
      Mouse.update
      @btns.map(&:update)
    end

    def draw
      C.background.draw(0, 0, 0)
      @question.write
      @btns.map(&:draw)
    end

    def button_down(id)
      close and return if id == Gosu::KB_ESCAPE

      super
    end
  end
end