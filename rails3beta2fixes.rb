class Object
  # See ChangeLog of rails3beta2:
  # * Rename #metaclass to #singleton_class now that ruby-core has decided [JK]
  unless respond_to? :metaclass # authlogic need it
    unless respond_to? :singleton_class # ruby trunk
      def singleton_class
        class << self
          self
        end
      end
    end
    alias :metaclass :singleton_class
  end
end
