// Generated by CoffeeScript 1.6.3
/*
 VideoParticle shows various video streams
 This needs more work..
*/


(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['view/particles/ParticleView'], function(ParticleView) {
    var VideoParticle;
    return VideoParticle = (function(_super) {
      __extends(VideoParticle, _super);

      function VideoParticle(data) {
        var bg, bitmap, video, videoMask;
        VideoParticle.__super__.constructor.call(this, data);
        bg = new createjs.Shape();
        bg.graphics.beginFill('#ffffff').drawCircle(0, 0, this.radius);
        this.addChild(bg);
        video = document.getElementById(data.video);
        if (video) {
          bitmap = new createjs.Bitmap(video);
          bitmap.x = -320;
          bitmap.y = -240;
          this.addChild(bitmap);
        }
        videoMask = new createjs.Shape();
        videoMask.graphics.beginFill('#ffffff').drawCircle(0, 0, this.radius - 3);
        bitmap.mask = videoMask;
        this.hitArea = bg;
      }

      return VideoParticle;

    })(ParticleView);
  });

}).call(this);
