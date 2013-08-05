###
 Creates appropriate particle views based on JSON data
###
define ['view/particles/BuzzParticle', 'view/particles/TwitterParticle', 'view/particles/VideoParticle'], (BuzzParticle, TwitterParticle, VideoParticle) ->
	class ParticleFactory

		# Create random particle view
		create: (data) ->
			types = [BuzzParticle, TwitterParticle, VideoParticle]
			ParticleType = types[Math.floor(Math.random() * types.length)]
			return new ParticleType(data)

		# Create specific particle type
		createType: (data) ->
			switch(data.type)
				when 'buzz'
					return new BuzzParticle(data)
				when 'twitter'
					return new TwitterParticle(data)
				when 'video'
					return new VideoParticle(data)

	return new ParticleFactory()