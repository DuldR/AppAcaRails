module ApplicationHelper
    def ugly_lyrics(lyrics)


        ugly = "#{h(lyrics)}"
        ugly = ugly.chars.map do |c|
            if c == "\n"
                "♫ "
            else
                c
            end
        end

        ugly = ugly.join("")
        ugly.prepend("♫ ")

    
        "<pre class='lyrics'>#{ugly}</pre>".html_safe
    end
end
