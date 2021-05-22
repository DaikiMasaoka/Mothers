class SearchesController < ApplicationController
	def search
		word = params[:word]
		search = params[:search]

		@user = User.search(search,word)
		@diary = Diary.search(search,word)
		@trouble = Trouble.search(search,word)
	end
end
