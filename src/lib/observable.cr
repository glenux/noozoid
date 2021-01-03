
# Code from: https://github.com/crystal-community/crystal-patterns
# Licence:   MIT

module Observable(T)
  getter observers

  def add_observer(observer)
    @observers ||= [] of T
    @observers.not_nil! << observer
  end

  def delete_observer(observer)
    @observers.try &.delete(observer)
  end

  def notify_observers
    @observers.try &.each &.update self
  end
end

