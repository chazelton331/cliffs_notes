module ApplicationHelper

  def render_links_in(string)
    string.split(" ").map { |piece| piece.match(/^http/) ? link_to(piece, piece, target: "_external") : piece }.join(" ")
  end

end
