class Fixnum
    # Extension method
    def isOdd() self % 2 != 0 end
end

def isValid( isbn )

    result = 0

    if not isbn.to_s.empty?
        isbn = isbn.gsub("-", "").gsub(" ", "") #remove '-' and whitespaces
      
        if /^\d{12}$/.match(isbn)
          sum = 0
  
          isbn.split("").each_with_index do |char, index|
              sum += char.to_i * if index.isOdd then 3 else 1 end
          end
          
          result = 10 - (sum % 10)
      end         
    end  

    return isbn + result.to_s
end

isbn = "978014300723"
puts "The complete ISBN is #{isValid(isbn)}"
