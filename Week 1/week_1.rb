# Karatsuba Algo

class Karatsuba

  def self.product(x, y)
    # convert input data to strings
    x_string = x.to_s
    y_string = y.to_s

    # define the longest string and set it up as 'n'
    n = [x_string.length, y_string.length].max
    # puts
    # puts("n = #{n}")

    # return simple product if there are one-digit numbers
    if n == 1
      # puts("return #{x} * #{y} = #{x * y}")
      return x * y
    end

    # middle = (n.to_f/2).floor
    middle = (n.to_f/2).ceil

    # define a, b, c, d
    if n > x_string.length
      a = 0
      b = x
    else
      a = x_string[0...middle].to_i
      b = x_string[(middle)...x_string.length].to_i
    end

    if n > y_string.length
      c = 0
      d = y
    else
      c = y_string[0...middle].to_i
      d = y_string[(middle)...y_string.length].to_i  
    end
    # recursive calculations
    ac = product(a, c)
    bd = product(b, d)
    gauss_trick = product(a + b, c + d)
    gauss_trick = gauss_trick - ac - bd

    # the power must be always even, so make it this way
    pow = n / 2
    pow = pow * 2

    # the main calculation by Karatsuba method
    return ac * (10 ** pow) + gauss_trick * (10 ** (pow / 2)) + bd
  end
end

###########################################################################################################################

# Input data:
x = 3141592653589793238462643383279502884197169399375105820974944592
y = 2718281828459045235360287471352662497757247093699959574966967627

# print out the result:
puts "\n X = #{x}"
puts " Y = #{y}"
puts "\n********************************************************************************************************************************"
puts " X * Y = #{Karatsuba.product(x,y)}"
puts "********************************************************************************************************************************\n"


