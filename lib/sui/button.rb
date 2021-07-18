# frozen_string_literal: true

# Clickable Buttons
module SUI
  def button(id:, text:, x:, y:, w: 100, h: 40, border: true, border_color: [0, 0, 0],
             fill_color: [255, 255, 255], pressed_color: [127, 127, 127], text_color: [0, 0, 0], padding: 2,
             align: :left)
    $gtk.args.state.sui_buttons ||= {}
    sui_primitive = []

    case align
    when :left
      sui_primitive << left_button(id: id, text: text, x: x, y: y, w: w, h: h, border: border,
                                   border_color: border_color, fill_color: fill_color,
                                   pressed_color: pressed_color, text_color: text_color,
                                   padding: padding)
    end
  end

  def left_button(id:, text:, x:, y:, w: 100, h: 40, border: true, border_color: [0, 0, 0],
                  fill_color: [255, 255, 255], pressed_color: [127, 127, 127], text_color: [0, 0, 0], padding: 2)
    $gtk.args.state.sui_buttons ||= {}
    $gtk.args.state.sui_buttons[id] ||= { id: id, text: text, x: x, y: y, w: w, h: h, border: border,
                                          border_color: border_color, fill_color: fill_color,
                                          pressed_color: pressed_color, text_color: text_color,
                                          padding: padding, align: :left, pressed: false }

    sui_primitive = []
    this_button = $gtk.args.state.sui_buttons[id]

    sui_primitive << if this_button[:pressed]
                       { x: this_button[:x], y: this_button[:y], w: this_button[:w], h: this_button[:h],
                         r: this_button[:pressed_color][0], g: this_button[:pressed_color][1],
                         b: this_button[:pressed_color][2], primitive_marker: :solid }
                     else
                       { x: this_button[:x], y: this_button[:y], w: this_button[:w], h: this_button[:h],
                         r: this_button[:fill_color][0], g: this_button[:fill_color][1],
                         b: this_button[:fill_color][2], primitive_marker: :solid }
                     end

    if this_button[:border]
      sui_primitive << { x: this_button[:x], y: this_button[:y], w: this_button[:w], h: this_button[:h],
                         r: this_button[:border_color][0], g: this_button[:border_color][1],
                         b: this_button[:border_color][2], primitive_marker: :border }
    end

    return unless this_button[:text] != ''

    sui_primitive << { x: this_button[:x] + padding, y: this_button[:y] + padding, text: this_button[:text],
                       alignment_enum: 0, r: this_button[:text_color][0], g: this_button[:text_color][1],
                       b: this_button[:text_color][2] }
  end
end

SUI.extend SUI
