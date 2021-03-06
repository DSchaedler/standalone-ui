# frozen_string_literal: true

require 'lib/sui.rb'

def tick(args)
  SUI.ui_update # Checks for required changes, like checkbox clicks

  sui_primitive = []
  sui_primitive << bar(args)
  sui_primitive << checkbox

  sui_primitive << SUI.button(id: :first, text: 'Button', x: CENTER_X, y: CENTER_Y)

  # Print
  args.outputs.primitives << sui_primitive
end

def bar(args)
  percent_ticker = args.state.tick_count.mod(200) / 200
  sui_primitive = []

  # Bordered Bars
  sui_primitive << SUI.bar(x: 20, y: 680, percent: percent_ticker, align: :left)
  sui_primitive << SUI.bar(x: 20, y: 640, percent: percent_ticker, align: :center, bar_color: [0, 255, 0],
                           border_color: [255, 0, 0])
  sui_primitive << SUI.bar(x: 20, y: 600, percent: percent_ticker, align: :right, bar_color: [0, 0, 255],
                           border_color: [0, 255, 255])

  # Borderless Bars
  sui_primitive << SUI.bar(x: 140, y: 680, percent: percent_ticker, align: :left, border: false,
                           bar_color: SUI.hex_to_rgb('#coffee'))
  sui_primitive << SUI.bar(x: 140, y: 640, percent: percent_ticker, align: :center, border: false,
                           bar_color: SUI.hex_to_rgb('#543210'))
  sui_primitive << SUI.bar(x: 140, y: 600, percent: percent_ticker, align: :right, border: false,
                           bar_color: SUI.hex_to_rgb('#00AAFF'))
end

def checkbox
  # Checkbox
  sui_primitive = []
  sui_primitive << SUI.checkbox(id: :first, x: 20, y: 560)

  checkbox_value = SUI.checkbox_value(id: :first)
  sui_primitive << [60, 580, checkbox_value.to_s].label
end
