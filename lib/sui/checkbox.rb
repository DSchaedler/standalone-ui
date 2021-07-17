# frozen_string_literal: true

module SUI
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

  def clear_checkboxes
    $gtk.args.state.checkboxes = {}
  end
end
