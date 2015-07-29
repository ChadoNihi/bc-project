module NextPrev
  def next
	model = self.class
    model.where("id > ?", id).first || model.find( model.minimum(:id) )
  end

  def prev
  	model = self.class
    model.where("id < ?", id).last || model.find( model.maximum(:id) )
  end

	def next2
		res = self.class.where("id > ?", id).first(2)
		if res[0].nil? or res[1].nil?
			fst_next = self.next
			[fst_next, fst_next.next]
		else
			res
		end
	end

	def prev2
		res = self.class.where("id < ?", id).last(2)
		if res[0].nil? or res[1].nil?
			fst_prev = self.prev
			[fst_prev, fst_prev.prev]
		else
			res
		end
	end
end