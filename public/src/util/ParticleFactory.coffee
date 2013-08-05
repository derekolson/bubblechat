###
 Creates appropriate particle views based on JSON data
###
define ['view/particles/BuzzParticle', 'view/particles/TwitterParticle', 'view/particles/VideoParticle'], (BuzzParticle, TwitterParticle, VideoParticle) ->
	class ParticleFactory

		
		create: (data) ->
			if data
				# Create specific particle view
				switch(data.type)
					when 'buzz'
						return new BuzzParticle(data)
					when 'twitter'
						return new TwitterParticle(data)
					when 'video'
						return new VideoParticle(data)
			else
				# Create random particle view
				types = [BuzzParticle, TwitterParticle, VideoParticle]
				ParticleType = types[Math.floor(Math.random() * types.length)]
				return new ParticleType(data)

	return new ParticleFactory()