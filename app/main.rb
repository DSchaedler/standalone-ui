# frozen_string_literal: true

require 'lib/standalone_ui.rb'

def tick(args)
  include SUI
  new_bar = SUI.bar(x: 100, y: 100, percent: 0.75)
  args.outputs.primitives << new_bar
end
