# frozen_string_literal: true

require 'lib/standalone_ui'

def tick(args)
  include SUI
  percent_ticker = args.state.tick_count.mod(100) / 100
  new_bar = SUI.bar(x: 20, y: 680, percent: percent_ticker)
  args.outputs.primitives << new_bar

  new_checkbox = SUI.checkbox(id: :first, x: 20, y: 640)
  args.outputs.primitives << new_checkbox

  checkbox_value = SUI.checkbox_value(id: :first)
  args.outputs.labels << [60, 660, checkbox_value.to_s]

  SUI.ui_update
end
