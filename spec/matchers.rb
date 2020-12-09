# coding: utf-8
require 'sxp'

 def parser(**options)
   Proc.new do |input|
     case input
     when String then SXP.parse(input)
     when SHACL::Algebra::Operator, SHACL::Shapes then input.to_sxp_bin
     else input
     end
   end
 end

 def normalize(obj)
   if obj.is_a?(String)
     obj.gsub(/\s+/m, ' ').
       gsub(/\s+\)/m, ')').
       gsub(/\(\s+/m, '(').
       strip
   else
     obj
   end
 end

RSpec::Matchers.define :generate do |expected, **options|
  match do |input|
    @input = input
    begin
      case
      when expected.is_a?(Regexp)
        @actual = parser(**options).call(input)
        expected.match(@actual.to_sxp)
      when expected.is_a?(String)
        @actual = parser(**options).call(input)
        normalize(@actual.to_sxp) == normalize(expected)
      else
        @actual = parser(**options).call(input)
        @actual == expected
      end
    rescue
      @actual = $!.message
      #false
      raise
    end
  end

  failure_message do |input|
    "Input        : #{@input}\n" +
    case expected
    when String
      "Expected     : #{expected}\n"
    else
      "Expected     : #{expected.inspect}\n" +
      "Expected(sxp): #{SXP::Generator.string(expected.to_sxp_bin)}\n"
    end +
    "Actual       : #{actual.inspect}\n" +
    "Actual(sxp)  : #{SXP::Generator.string(actual.to_sxp_bin)}\n" +
    (options[:logger] ? "Trace     :\n#{options[:logger].to_s}" : "")
  end

  failure_message_when_negated do |input|
    "Input        : #{@input}\n" +
    case expected
    when String
      "Expected     : #{expected}\n"
    else
      "Expected     : #{expected.inspect}\n" +
      "Expected(sxp): #{SXP::Generator.string(expected.to_sxp_bin)}\n"
    end +
    "Actual       : #{actual.inspect}\n" +
    "Actual(sxp)  : #{SXP::Generator.string(actual.to_sxp_bin)}\n" +
    (options[:logger] ? "Trace     :\n#{options[:logger].to_s}" : "")
  end
end
