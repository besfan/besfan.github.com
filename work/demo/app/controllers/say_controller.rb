class SayController < ApplicationController
  def hello
    @time = Time.now.to_s
  end

  def goodbye
    @files = Dir.glob("*")
  end

end
