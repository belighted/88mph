class Timeline

  attr_reader :user

  def initialize(options={})
    @user = options[:user]
    super()
  end

  def current_project=(_project)
    # TODO refactor all this crap and move it to some sort of model
    current_time = Time.now
    new_project = _project
    current_time_slot = user.current_time_slot
    if current_time_slot
      if current_time_slot.project != new_project
        # we are switching to a new project
        current_time_slot.stop!
        new_time_slot = user.time_slots.create(:project => new_project)
      else
        # we are already working on that project so do nothing
      end
    else
      # We are working on nothing yet
      new_time_slot = user.time_slots.create(:project => new_project)
    end
  end

end