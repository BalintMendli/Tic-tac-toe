module UI
  def output(str, new_line = false)
    print str + (new_line ? "\n" : '')
  end

  def input
    gets.chomp
  end

  def clear_console
    system('clear')
  end

  def show_welcome_message
    output('Welcome to Tic-tac-toe!', true)
  end
end
