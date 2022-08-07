# Frozen-string-literal: true

# Copyright: 2015 Forestry.io - MIT License

module Jekyll
  class Menus
    module Drops
      class All < Liquid::Drop
        def initialize(menus)
          @menus = menus
        end

        def find(&block)
          to_a.find(&block)
        end

        def to_a
          @menus.keys.map do |identifier|
            self[
              identifier
            ]
          end
        end

        def each(&block)
          to_a.each(&block)
        end

        def [](key)
          if @menus.key?(key)
            then Menu.new(@menus[key],
                          key, self)
          end
        end
      end
    end
  end
end
