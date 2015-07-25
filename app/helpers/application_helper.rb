module ApplicationHelper
	def admin?
		true
	end

	def sortable(sort_opt, view=nil)
		view ||= sort_opt.titleize
		css_class = sort_opt == sort_option ? "current #{sort_direction}" : "desc"
		direction = sort_opt == sort_option && sort_direction == "asc" ? "desc" : "asc"
		link_to view, {:sort => sort_opt, :direction => direction}, {:class => css_class}
	end

	def fst_letters(collection)
		letterToOccured = Hash[([*'A'..'Z']+[*'0'..'9']).map {|l| [l, false]}]
	  	collection.each do |item|
	  		fstLetter = city.name[0]
	  		letterToOccured[fstLetter] = true unless letterToOccured[fstLetter]
	  	end
	    letterToOccured.keys.select { |k| letterToOccured[k] }
	end
end
