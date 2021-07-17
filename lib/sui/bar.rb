# frozen_string_literal: true

module SUI
  def bar(x:, y:, percent:, w: 100, h: 20, border: true, bar_color: '#000000', border_color: '#000000', padding: 2, align: :left)
    sui_primitive = []
    case align
    when :left
      sui_primitive << bar_left(x: x, y: y, percent: percent, w: w, h: h, border: border, bar_color: bar_color,
                                border_color: border_color, padding: 2)
    when :center
      sui_primitive << bar_center(x: x, y: y, percent: percent, w: w, h: h, border: border, bar_color: bar_color,
                                  border_color: border_color, padding: 2)
    when :right
      sui_primitive << bar_right(x: x, y: y, percent: percent, w: w, h: h, border: border, bar_color: bar_color,
                                 border_color: border_color, padding: 2)
    end
  end

  def bar_left(x:, y:, percent:, w: 100, h: 20, border: true, bar_color: '#000000', border_color: '#000000', padding: 2)
    border_color = hex_to_rgb(border_color)
    bar_color = hex_to_rgb(bar_color)
    sui_primitive = []
    if border
      sui_primitive << { x: x, y: y, w: w, h: h, r: border_color[0], g: border_color[1], b: border_color[2],
                         primitive_marker: :border }
      sui_primitive << { x: x + padding, y: y + padding, w: w * percent - padding * 2, h: h - padding * 2,
                         r: bar_color[0], g: bar_color[1], b: bar_color[2], primitive_marker: :solid }
    else
      sui_primitive << { x: x, y: y, w: w * percent, h: h, r: bar_color[0], g: bar_color[1], b: bar_color[2],
                         primitive_marker: :solid }
    end
  end

  def bar_center(x:, y:, percent:, w: 100, h: 20, border: true, bar_color: '#000000', border_color: '#000000', padding: 2)
    border_color = hex_to_rgb(border_color)
    bar_color = hex_to_rgb(bar_color)
    sui_primitive = []
    bar_width = w * percent
    if border
      sui_primitive << { x: x, y: y, w: w, h: h, r: border_color[0], g: border_color[1], b: border_color[2],
                         primitive_marker: :border }
      sui_primitive << { x: x + w / 2 - bar_width / 2 + padding, y: y + padding, w: bar_width - padding * 2, h: h - padding * 2,
                         r: bar_color[0], g: bar_color[1], b: bar_color[2], primitive_marker: :solid }
    else
      sui_primitive << { x: x + bar_width * 2, y: y, w: bar_width, h: h, r: bar_color[0], g: bar_color[1], b: bar_color[2],
                         primitive_marker: :solid }
    end
  end

  def bar_right(x:, y:, percent:, w: 100, h: 20, border: true, bar_color: '#000000', border_color: '#000000', padding: 2)
    border_color = hex_to_rgb(border_color)
    bar_color = hex_to_rgb(bar_color)
    sui_primitive = []
    bar_width = w * percent
    if border
      sui_primitive << { x: x, y: y, w: w, h: h, r: border_color[0], g: border_color[1], b: border_color[2],
                         primitive_marker: :border }
      sui_primitive << { x: x + w - bar_width + padding, y: y + padding, w: bar_width - padding * 2, h: h - padding * 2,
                         r: bar_color[0], g: bar_color[1], b: bar_color[2], primitive_marker: :solid }
    else
      sui_primitive << { x: x - bar_width, y: y, w: bar_width, h: h, r: bar_color[0], g: bar_color[1], b: bar_color[2],
                         primitive_marker: :solid }
    end
  end
end
