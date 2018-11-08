#CLI
class ProjectFinal::CLI

  def call
    puts "=" * 90
    puts "                               Welcome to My Project!!!"
    puts "=" * 90

   ProjectFinal::Scraper.new.scrape_article_info
   menu
   goodbye
  end

  def list_books
    puts ""
    puts "\033[0;36mHERE IS A LIST OF 20 CULT BOOKS TO HAVE READ AT LEAST ONCE IN HIS LIFE:\033[0m"
    ProjectFinal::Info.all.each_with_index do |info, i|
      puts "#{i+1}. #{info.title}"
    end
end

   def menu
    list_books
    puts ""
    input = nil
    while input != "q"
      puts "\033[0;93mEnter the number of the book you would like to read mor informations.\033[0m"
      puts ""
      input = STDIN.gets.chomp

     if input.to_i > 0 && input.to_i <= ProjectFinal::Info.all.size
      info = ProjectFinal::Info.all[input.to_i-1]

      puts "\033[0;94mYour choice is #{input} \033[0m"
      puts ""
      puts "\033[0;96mTitle   :\033[0m"
      puts "#{info.title}"
      puts ""
      puts "\033[0;96mSummary :\033[0m"
      puts ""
      puts "#{info.summary}"
      puts ""
      puts "\033[0;94mPlease type 'list' to return to the list of articles or 'q' to exit the program.\033[0m"
      input_answer = STDIN.gets.chomp

     if input_answer == "LIST" || input_answer == "L" || input_answer == "l" || input_answer == "list"
        list_books
      elsif input_answer == "q" || input_answer == "exit"
        goodbye
        exit
      else
        puts "\033[0;91mInvalid input. Type 'list' to list again or 'q' to go exit.\033[0m"
     end
    end
  end
end

def goodbye
  puts "\033[1;96mThank you...See you next time!\033[0m"
end

end
