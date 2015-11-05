module TestWorld

	def imgflip
		@imgflip ||= Model::Site.new
	end
end

World(TestWorld)
