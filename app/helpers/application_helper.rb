module ApplicationHelper
    def get_season()
        time = Time.new

        if (time.month >= 3) &&(time.month <= 5)
            "It's Spring!"
        elsif (time.month > 5) &&(time.month <= 8)
            "Everyone love Summer!!"
        elsif (time.month > 8) &&(time.month <= 10)
            "Put on your coat because Fall is here!!"
        else
            "Yuck Winter is here.."
        end
    end

    def get_random_number(max_value = 10)
        @random_value = rand(max_value)
    end

    def get_random_welcome()
        opening = ["What a beautiful day!.", "Welcome to our site!",
                   "Thank you for stopping by!"]
        middle = ["Like what you see?", "Do you need help?",
                  "Checkout our other items."]
        ending = ["Thank you for comming.", "Please leave a feedback.",
                  "Good day to ya."]

        "#{opening[rand(3)]} #{middle[rand(3)]} #{ending[rand(3)]}"
    end

    def count_to_random(value = 10)
        x = 2
        number_list = "1"
        loop do
            number_list = number_list + ", " + x.to_s
            x += 1
            break if x > value
        end
        "#{number_list}"
        
    end
end
