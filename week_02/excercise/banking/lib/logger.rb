module Logger
  private
  def log(message)
    output = "#{Time.now} : #{message}"
    File.open("log.txt", "ab") do |logfile|
      logfile << output
    end
  end
end