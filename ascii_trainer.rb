#!/usr/bin/env ruby

class Question
  def initialize position
    @position = position
    @answers = [ position, rand(32..127), rand(32..127), rand(32..127), rand(32..127) ].uniq.shuffle
  end

  def info
    @answers.each { |a| puts a }
  end

  def ask
    system("clear")
    puts "which is #{@position}?"

    i = 0
    @answers.each{ |a| puts "#{i += 1} #{a.chr}" }

    puts "(char @ #{@position} = (#{@position.chr}))"
    answer = gets.chomp

    if answer == @position.chr || @answers[(answer).to_i - 1].chr == @position.chr
      system("clear")
      puts "\nyay! that is correct!\n"
      gets
    end

  end
end

nums = (32..128).each { |num|
  answer = num.chr
  false_answers = [num,0,0,0]
  (1..3).each{ |position| false_answers[position] = rand(32..127) }
}

questions = (32..127).map{ |n| Question.new(n) }
questions.shuffle.each { |q| q.ask}
