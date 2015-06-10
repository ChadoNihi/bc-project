module ApplicationHelper
	def admin?
		true
	end

	def sortable(sort_opt, view=nil)
		view ||= sort_opt.titleize
		css_class = sort_opt == sort_option ? "current #{sort_direction}" : nil
		direction = sort_opt == sort_option && sort_direction == "asc" ? "desc" : "asc"
		link_to view, {:sort => sort_opt, :direction => direction}, {:class => css_class}
	end
end
