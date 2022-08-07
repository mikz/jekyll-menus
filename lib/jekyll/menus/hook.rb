# Frozen-string-literal: true

module Jekyll
  module Drops
    class SiteDrop
      attr_accessor :menus
    end
  end
end

Jekyll::Hooks.register :site, :pre_render do |site, payload|
  payload.site.menus = Jekyll::Menus.new(site).to_liquid_drop
end
