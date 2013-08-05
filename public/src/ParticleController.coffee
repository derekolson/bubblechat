###
 ParticleController maintains the "Bubble" Particle System
 It utilizes the toxiclibs physics library to simulate these forces
###

define ['util/ParticleFactory'], (ParticleFactory) ->
	class ParticleController
		constructor: (@container) ->
			# Setup Particle System
			@MAX_PARTICLES = 12
			@physics = new VerletPhysics2D()
			@physics.setDrag(0.1)
			@physics.addBehavior(new GravityBehavior(new Vec2D(-0.02, 0)))

		addParticle: () ->
			# Add new particle at a random location at the center of the display
			randLoc = Vec2D.randomVector().scale(5).addSelf(@width / 2, @height/2)
			p = new VerletParticle2D(randLoc)
			
			# Simulate a unique ID - to be generated by server later..
			uid = @physics.particles.length - 1

			# Create a new view for this particle
			p.view = ParticleFactory.create(uid.toString())
			p.view.x = p.x
			p.view.y = p.y
			@container.addChild(p.view)
			p.view.particle = p;

			# Add a "repulsion" effect to this particle to push other particles away "Negative Force"
			p.behavior = new AttractionBehavior(p, p.view.radius * 1.7, -1.5, 0.015)
			@physics.addBehavior(p.behavior)
			
			# Add particle to simulation
			@physics.addParticle(p)
		
		removeParticle: (p=null) ->
			# Remove a specific particle or the oldest particle from the system
			if p == null
				p = @physics.particles.shift()
			else 
				@physics.particles.splice(@physics.particles.indexOf(p), 1)

			@physics.removeBehavior(p.behavior)
			@physics.removeParticle(p)
			p.view.destroy()

		update: () ->
			# Remove the oldest particle if there are more than MAX_PARTICLES
			if(@physics.particles.length > @MAX_PARTICLES)
				@removeParticle()

			# Advance the physics simulation
			@physics.update()

			# Update all particle views position
			for i in [0...@physics.particles.length]
				p = @physics.particles[i]
				p.view.x = p.x
				p.view.y = p.y

			return


		resize: (width, height) ->
			# Resize the particle simulation boundaries
			@width = width
			@height = height
			buffer = 500
			#@physics.setWorldBounds(new Rect(-@width*2, @height/2 - buffer/2, @width*4, buffer))
			@physics.setWorldBounds(new Rect(-@width, @height/2 - buffer/2, @width*3, buffer))
			
window.VerletPhysics2D = toxi.physics2d.VerletPhysics2D
window.VerletParticle2D = toxi.physics2d.VerletParticle2D
window.AttractionBehavior = toxi.physics2d.behaviors.AttractionBehavior
window.GravityBehavior = toxi.physics2d.behaviors.GravityBehavior
window.Vec2D = toxi.geom.Vec2D
window.Rect = toxi.geom.Rect