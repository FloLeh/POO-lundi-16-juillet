class BoardCase

    attr_accessor :form

    def initialize(form=' ')
      @form = form
    end

    def is_empty
      form == ' '
    end

end
