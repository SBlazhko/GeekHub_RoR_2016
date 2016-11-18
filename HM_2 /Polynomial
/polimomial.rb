class Polynomial
  def initialize(elements=[])
      @elements = elements
      if @elements.size < 3
        raise ArgumentError, 'Two or more coefficients are required'
        return
      end
  end

  def to_s
      polinom = []
      @elements.reverse!
      @elements.each_index do |i|
          if @elements[i]==0
              polinom << nil
          elsif @elements[i]==1
              polinom << "+x^#{i}"
          elsif @elements[i]==-1
              polinom << "-x^#{i}"
          elsif @elements[i]<0
              polinom << "#{@elements[i]}x^#{i}"
          else
              polinom << "+#{@elements[i]}x^#{i}"
          end
      end
        
      polinom.reverse!
      
      unless polinom[-1].nil?
          polinom[-1].delete!('x^0')
      end
      
      unless polinom[-2].nil?
          polinom[-2].delete!('\^1')
      end
      
      if polinom.reject{|i| i==nil}.empty?
          polinom = "0"
      elsif polinom.join.chr=="+"
          polinom.join.reverse!.chop!.reverse!
      else
          polinom.join
      end
  end
end