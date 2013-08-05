// Generated by CoffeeScript 1.6.3
/*
 Kudos Particle
 Heavily unfinished..
*/


(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['view/particles/ParticleView', 'Resources'], function(ParticleView, Resources) {
    var BuzzParticle;
    return BuzzParticle = (function(_super) {
      __extends(BuzzParticle, _super);

      function BuzzParticle(data) {
        var bg, dummyTxt, kudosType, txt;
        BuzzParticle.__super__.constructor.call(this, data);
        this.radius = 237;
        bg = new createjs.Bitmap(Resources.get("buzz_bg"));
        bg.regX = this.radius;
        bg.regY = this.radius;
        this.addChild(bg);
        this.hitArea = bg;
        kudosType = new createjs.Shape();
        kudosType.graphics.beginFill('#ef5639').drawCircle(0, 0, 32);
        kudosType.y = -95;
        this.addChild(kudosType);
        dummyTxt = "Happy 3 year anniversary! We are all so lucky to have you! Happy 3 year anniversary!";
        dummyTxt = dummyTxt.toUpperCase();
        txt = new createjs.Text(dummyTxt, "30px kiosk_light", "#ffffff");
        txt.y = 0;
        txt.textAlign = "center";
        txt.lineWidth = this.radius * 1.5;
        this.addChild(txt);
        this.cache(-this.radius, -this.radius, this.radius * 2, this.radius * 2);
      }

      return BuzzParticle;

    })(ParticleView);
  });

}).call(this);
