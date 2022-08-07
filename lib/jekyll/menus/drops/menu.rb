# Frozen-string-literal: true

# Copyright: 2015 Forestry.io - MIT License

module Jekyll
  class Menus
    module Drops
      class Menu < Liquid::Drop
        attr_reader :parent, :identifier, :menu

        def initialize(menu, identifier, parent)
          @parent = parent
          @identifier = identifier
          @menu = menu
        end

        def find(&block)
          to_a.find(&block)
        end

        def select(&block)
          to_a.select(&block)
        end

        def to_a
          @menu.map { |item| Item.new(item, parent) }.sort_by(
            &:weight
          )
        end

        def each(&block)
          to_a.each(&block)
        end
      end
    end
  end
end
