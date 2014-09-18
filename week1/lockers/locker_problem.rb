class LockerProblem
  NUMBER_OF_LOCKERS = 100

  def initialize
    @students = (1..100)
    @locker_numbers = (1..NUMBER_OF_LOCKERS)
    @lockers = []
    NUMBER_OF_LOCKERS.times do
      @lockers << "closed"
    end
  end

  def run
    @students.each do |student_number|
      @locker_numbers.each do |locker_number|
        if locker_number % student_number == 0
          toggle_locker_number(locker_number)
        end
      end
    end

    print_out_lockers
  end

  private

  def toggle_locker_number(number)
    if @lockers[number-1] == "open"
      @lockers[number-1] = "closed"
    else
      @lockers[number-1] = "open"
    end
  end

  def print_out_lockers
    @lockers.each_with_index do |locker_state, number|
      puts "#{number+1} #{locker_state}"
    end
  end
end

locker_problem = LockerProblem.new
locker_problem.run