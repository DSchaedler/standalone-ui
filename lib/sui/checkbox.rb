# frozen_string_literal: true

# Clickable Checkboxes
module SUI
  def checkbox(id:, x:, y:, w: 20, h: 20, box_color: [0, 0, 0], fill_color: [0, 0, 0], padding: 2, checked: false)
    $gtk.args.state.sui_checkboxes ||= {}
    $gtk.args.state.sui_checkboxes[id] ||= { id: id, x: x, y: y, w: w, h: h, box_color: box_color,
                                             fill_color: fill_color, padding: padding, checked: checked }
    sui_primitive = []
    this_checkbox = $gtk.args.state.sui_checkboxes[id]
    if this_checkbox[:checked]
      sui_primitive << { x: this_checkbox[:x] + this_checkbox[:padding], y: this_checkbox[:y] + this_checkbox[:padding], w: this_checkbox[:w] - this_checkbox[:padding] * 2, h: this_checkbox[:h] - this_checkbox[:padding] * 2, r: this_checkbox[:fill_color][0],
                         g: this_checkbox[:fill_color][1], b: this_checkbox[:fill_color][2], primitive_marker: :solid }
    end
    sui_primitive << { x: this_checkbox[:x], y: this_checkbox[:y], w: this_checkbox[:w], h: this_checkbox[:h], r: this_checkbox[:box_color][0], g: this_checkbox[:box_color][1], b: this_checkbox[:box_color][2],
                       primitive_marker: :border }
  end

  def checkboxes_check_click
    return unless $gtk.args.inputs.mouse.click

    $gtk.args.state.sui_checkboxes.each do |_k, v|
      v[:checked] = !v[:checked] if $gtk.args.inputs.mouse.inside_rect? v
    end
  end

  def set_checkbox(id:, checked:)
    $gtk.args.state.sui_checkboxes[id][:checked] = checked
  end

  def checkbox_value(id:)
    $gtk.args.state.sui_checkboxes[id][:checked]
  end

  def remove_checkbox(id:)
    $gtk.args.state.sui_checkboxes.delete(id)
  end

  def clear_checkboxes
    $gtk.args.state.sui_checkboxes = {}
  end
end

SUI.extend SUI
