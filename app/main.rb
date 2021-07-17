# frozen_string_literal: true

require 'lib/sui.rb' # rubocop:disable Style/RedundantFileExtensionInRequire

def tick(args)
  include SUI
  percent_ticker = args.state.tick_count.mod(200) / 200
  sui_primitive = []

  sui_primitive << SUI.bar(x: 20, y: 680, percent: percent_ticker, align: :left)

  sui_primitive << SUI.bar(x: 20, y: 640, percent: percent_ticker, align: :center)

  sui_primitive << SUI.bar(x: 20, y: 600, percent: percent_ticker, align: :right)

  sui_primitive << SUI.checkbox(id: :first, x: 20, y: 560)

  checkbox_value = SUI.checkbox_value(id: :first)
  sui_primitive << [60, 580, checkbox_value.to_s].label

  args.outputs.primitives << sui_primitive
  SUI.ui_update
end
