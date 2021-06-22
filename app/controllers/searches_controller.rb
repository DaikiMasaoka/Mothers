class SearchesController < ApplicationController
	def search
		word = params[:word]
		search = params[:search]

		@users = User.search(search,word)
		@diaries = Diary.search(search,word)
		@troubles = Trouble.search(search,word)
	end
end
