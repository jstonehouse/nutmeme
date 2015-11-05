module Model
	module Section
		class MemeSettings  < SitePrism::Section

			#element  :meme_settings,		      "#mm-settings"
			elements :meme_carousel,					".im"
			#element  :top_text,								"textarea[placeholder='TOP TEXT']"
			#element  :bottom_text,					"textarea[placeholder='BOTTOM TEXT']"


			def select_random_template
				all(".im").sample.click
				#refactor to below
				#s = meme_carousel
				#s.sample.click
			end

		end
	end
end