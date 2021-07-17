# frozen_string_literal: true

# Clickable Checkboxes
module SUI
  def checkbox(id:, x:, y:, w: 20, h: 20, box_color: [0, 0, 0], fill_color: [0, 0, 0], padding: 2, checked: false)
    $gtk.args.state.sui_checkboxes ||= {}
    $gtk.args.state.sui_checkboxes[id] ||= { id: id, x: x, y: y, w: w, h: h, box_color: box_color,
                                         fill_color: fill_color, padding: padding, checked: checked }
    sui_primitive = []
    if $gtk.args.state.sui_checkboxes[id][:checked]
      sui_primitive << { x: x + padding, y: y + padding, w: w - padding * 2, h: h - padding * 2, r: fill_color[0],
                         g: fill_color[1], b: fill_color[2], primitive_marker: :solid }
    end
    sui_primitive << { x: x, y: y, w: w, h: h, r: box_color[0], g: box_color[1], b: box_color[2],
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
