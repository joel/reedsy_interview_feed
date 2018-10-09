module ReedsyInterviewFeed
  module Utils
    class ConsoleOutput

      def repaint(data)
        hide_cursor

        line = ['===========================================']
        data.each_with_index do |entry, index|
          line << ["#{index}:\t#{entry}"]
        end
        line << ['===========================================']
        line = line.join("\n")

        reset_line(line)

        show_cursor

        puts('')
      end

      private

      # Unix
      # Contains a string to clear the line in the shell
      CLR = "\e[0K"
      # ANSI escape sequence for hiding terminal cursor
      ESC_CURS_INVIS = "\e[?25l"
      # ANSI escape sequence for showing terminal cursor
      ESC_CURS_VIS   = "\e[?25h"
      # ANSI escape sequence for clearing line in terminal
      ESC_R_AND_CLR  = "\r#{CLR}"
      # ANSI escape sequence for going up a line in terminal
      ESC_UP_A_LINE = "\e[1A"

      def reset_line(text = '')
        # Initialise ANSI escape string
        escape = ""

        # The number of lines the previous message spanned
        lines = text.strip.lines.count - 1

        # Clear and go up a line
        lines.times { escape += "#{ESC_R_AND_CLR}#{ESC_UP_A_LINE}" }

        # Console is clear, we can print!
        STDOUT.print(escape)

        print(text)
      end

      def hide_cursor
        STDOUT.print(ESC_CURS_INVIS)
      end

      def show_cursor
        STDOUT.print(ESC_CURS_VIS)
      end

    end
  end
end
