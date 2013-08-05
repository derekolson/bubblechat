// Generated by CoffeeScript 1.6.3
/*
 Base Particle View
*/


(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['AppController'], function(AppController) {
    var ParticleView;
    return ParticleView = (function(_super) {
      __extends(ParticleView, _super);

      function ParticleView(data) {
        this.data = data;
        this.cleanUp = __bind(this.cleanUp, this);
        this.stopDrag = __bind(this.stopDrag, this);
        this.doDrag = __bind(this.doDrag, this);
        this.startDrag = __bind(this.startDrag, this);
        ParticleView.__super__.constructor.call(this);
        this.id = this.data.id;
        this.radius = 200;
        this.scaleX = this.scaleY = Math.random() * 0.4 + 0.6;
        this.dragOffset = new createjs.Point();
        this.addEventListener("mousedown", this.startDrag);
        this.show();
      }

      ParticleView.prototype.startDrag = function(e) {
        this.dragOffset.x = e.stageX - this.x;
        this.dragOffset.y = e.stageY - this.y;
        this.parent.addChild(this);
        this.particle.lock();
        e.addEventListener("mousemove", this.doDrag);
        return e.addEventListener("mouseup", this.stopDrag);
      };

      ParticleView.prototype.doDrag = function(e) {
        this.particle.x = e.stageX - this.dragOffset.x;
        return this.particle.y = e.stageY - this.dragOffset.y;
      };

      ParticleView.prototype.stopDrag = function(e) {
        this.particle.unlock();
        e.removeEventListener("mousemove", this.doDrag);
        return e.removeEventListener("mouseup", this.onMouseUp);
      };

      ParticleView.prototype.show = function(onComplete) {
        if (onComplete == null) {
          onComplete = null;
        }
        return TweenLite.from(this, 0.5, {
          scaleX: 0,
          scaleY: 0,
          ease: Expo.easeOut,
          onComplete: onComplete
        });
      };

      ParticleView.prototype.hide = function(onComplete) {
        if (onComplete == null) {
          onComplete = null;
        }
        return TweenLite.to(this, 0.5, {
          scaleX: 0,
          scaleY: 0,
          ease: Expo.easeOut,
          onComplete: onComplete
        });
      };

      ParticleView.prototype.destroy = function() {
        return this.hide(this.cleanUp);
      };

      ParticleView.prototype.cleanUp = function() {
        this.particle = null;
        this.parent.removeChild(this);
        this.uncache();
        return this.removeAllEventListeners();
      };

      return ParticleView;

    })(createjs.Container);
  });

}).call(this);
