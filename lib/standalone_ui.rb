# frozen_string_literal: true

DEGREES_TO_RADIANS = Math::PI / 180

# Drop-in ui elements for DRGTK
module SUI
  def bar(x:, y:, percent:, w: 100, h: 20, border: true, bar_color: '#000000', border_color: '#000000', padding: 2)
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

  def checkbox(id:, x:, y:, w: 20, h: 20, box_color: '#000000', fill_color: '#000000', padding: 2, checked: false)
    $gtk.args.state.checkboxes ||= {}
    $gtk.args.state.checkboxes[id] ||= { id: id, x: x, y: y, w: w, h: h, box_color: hex_to_rgb(box_color),
                                         fill_color: hex_to_rgb(fill_color), padding: padding, checked: checked }
    sui_primitive = []
    if $gtk.args.state.checkboxes[id][:checked]
      sui_primitive << { x: x + padding, y: y + padding, w: w - padding * 2, h: h - padding * 2, r: fill_color[0],
                         g: fill_color[1], b: fill_color[2], primitive_marker: :solid }
    end
    sui_primitive << { x: x, y: y, w: w, h: h, r: box_color[0], g: box_color[1], b: box_color[2],
                       primitive_marker: :border }
  end

  def checkbox_value(id:)
    $gtk.args.state.checkboxes[id][:checked]
  end

  def remove_checkbox(id:)
    $gtk.args.state.checkboxes.delete(id)
  end

  def ui_update
    if $gtk.args.inputs.mouse.click
      $gtk.args.state.checkboxes.each do |_k, v|
        v[:checked] = !v[:checked] if $gtk.args.inputs.mouse.inside_rect? v
      end
    end
  end

  private

  def hex_to_rgb(hexstring)
    hexstring.gsub('#', '').split('').each_slice(2).map { |e| e.join.to_i(16) }
  end

  def randr(min, max)
    rand(max - min + 1) + min
  end

  def gaussian(mean, stddev)
    theta = 2 * Math::PI * rand
    rho = Math.sqrt(-2 * Math.log(1 - rand))
    scale = stddev * rho
    [mean + scale * Math.cos(theta), mean + scale * Math.sin(theta)]
  end
end
