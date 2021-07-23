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
    $gtk.args.state.sui_buttons = { id => { id: id, text: text, x: x, y: y, w: w, h: h, border: border,
                                            border_color: border_color, fill_color: fill_color,
                                            pressed_color: pressed_color, text_color: text_color, padding: padding,
                                            align: :left, pressed: false } }

    (sui_primitive = []) << part_button(id)
    b = $gtk.args.state.sui_buttons[id]

    return unless b[:text] != ''

    y_pos = b[:y] + b[:h] / 2 + $gtk.args.gtk.calcstringbox(b[:text])[1] / 2 - padding
    sui_primitive << { x: b[:x] + padding, y: y_pos, text: b[:text], r: b[:text_color][0],
                       g: b[:text_color][1], b: b[:text_color][2] }
  end

  def part_button(button_id)
    b = $gtk.args.state.sui_buttons[button_id]
    b_box = { x: b[:x], y: b[:y], w: b[:w], h: b[:h], primitive_marker: :solid }

    (sui_primitive = []) << if b[:pressed]
                              b_box.merge({ r: b[:pressed_color][0], g: b[:pressed_color][1], b: b[:pressed_color][2] })
                            else
                              b_box.merge({ r: b[:fill_color][0], g: b[:fill_color][1], b: b[:fill_color][2] })
                            end

    return unless b[:border]

    sui_primitive << b_box.merge({ r: b[:border_color][0], g: b[:border_color][1], b: b[:border_color][2],
                                   primitive_marker: :border })
  end
end

SUI.extend SUI
