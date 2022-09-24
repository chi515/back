/*
 *  jQuery StarRatingSvg v1.2.0
 *
 *  http://github.com/nashio/star-rating-svg
 *  Author: Ignacio Chavez
 *  hello@ignaciochavez.com
 *  Licensed under MIT
 */

;(function ( $, window, document, undefined ) {

    'use strict';
  
    // Create the defaults once
    var pluginName = 'starRating';
    var noop = function(){};
    var defaults = {
      totalStars: 5,
      useFullStars: false,
      starShape: 'straight',
      emptyColor: 'lightgray',
      hoverColor: 'orange',
      activeColor: 'gold',
      ratedColor: 'crimson',
      useGradient: true,
      readOnly: false,
      disableAfterRate: true,
      baseUrl: false,
      starGradient: {
        start: '#FEF7CD',
        end: '#FF9511'
      },
      strokeWidth: 4,
      strokeColor: 'black',
      initialRating: 0,
      starSize: 40,
      callback: noop,
      onHover: noop,
      onLeave: noop
    };
  
      // The actual plugin constructor
    var Plugin = function( element, options ) {
      var _rating;
      var newRating;
      var roundFn;
  
      this.element = element;
      this.$el = $(element);
      this.settings = $.extend( {}, defaults, options );
  
      // grab rating if defined on the element
      _rating = this.$el.data('rating') || this.settings.initialRating;
  
      // round to the nearest half
      roundFn = this.settings.forceRoundUp ? Math.ceil : Math.round;
      newRating = (roundFn( _rating * 2 ) / 2).toFixed(1);
      this._state = {
        rating: newRating
      };
  
      // create unique id for stars
      this._uid = Math.floor( Math.random() * 999 );
  
      // override gradient if not used
      if( !options.starGradient && !this.settings.useGradient ){
        this.settings.starGradient.start = this.settings.starGradient.end = this.settings.activeColor;
      }
  
      this._defaults = defaults;
      this._name = pluginName;
      this.init();
    };
  
    var methods = {
      init: function () {
        this.renderMarkup();
        this.addListeners();
        this.initRating();
      },
  
      addListeners: function(){
        if( this.settings.readOnly ){ return; }
        this.$stars.on('mouseover', this.hoverRating.bind(this));
        this.$stars.on('mouseout', this.restoreState.bind(this));
        this.$stars.on('click', this.handleRating.bind(this));
      },
  
      // apply styles to hovered stars
      hoverRating: function(e){
        var index = this.getIndex(e);
        this.paintStars(index, 'hovered');
        this.settings.onHover(index + 1, this._state.rating, this.$el);
      },
  
      // clicked on a rate, apply style and state
      handleRating: function(e){
        var index = this.getIndex(e);
        var rating = index + 1;
  
        this.applyRating(rating, this.$el);
        this.executeCallback( rating, this.$el );
  
        if(this.settings.disableAfterRate){
          this.$stars.off();
        }
      },
  
      applyRating: function(rating){
        var index = rating - 1;
        // paint selected and remove hovered color
        this.paintStars(index, 'rated');
        this._state.rating = index + 1;
        this._state.rated = true;
      },
  
      restoreState: function(e){
        var index = this.getIndex(e);
        var rating = this._state.rating || -1;
        // determine star color depending on manually rated
        var colorType = this._state.rated ? 'rated' : 'active';
        this.paintStars(rating - 1, colorType);
        this.settings.onLeave(index + 1, this._state.rating, this.$el);
      },
  
      getIndex: function(e){
        var $target = $(e.currentTarget);
        var width = $target.width();
        var side = $(e.target).attr('data-side');
        var minRating = this.settings.minRating;
  
        // hovered outside the star, calculate by pixel instead
        side = (!side) ? this.getOffsetByPixel(e, $target, width) : side;
        side = (this.settings.useFullStars) ? 'right' : side ;
  
        // get index for half or whole star
        var index = $target.index() - ((side === 'left') ? 0.5 : 0);
  
        // pointer is way to the left, rating should be none
        index = ( index < 0.5 && (e.offsetX < width / 4) ) ? -1 : index;
  
        // force minimum rating
        index = ( minRating && minRating <= this.settings.totalStars && index < minRating ) ? minRating - 1 : index;
        return index;
      },
  
      getOffsetByPixel: function(e, $target, width){
        var leftX = e.pageX - $target.offset().left;
        return ( leftX <= (width / 2) && !this.settings.useFullStars) ? 'left' : 'right';
      },
  
      initRating: function(){
        this.paintStars(this._state.rating - 1, 'active');
      },
  
      paintStars: function(endIndex, stateClass){
        var $polygonLeft;
        var $polygonRight;
        var leftClass;
        var rightClass;
        var s = this.settings;
  
        $.each(this.$stars, function(index, star){
          $polygonLeft = $(star).find('[data-side="left"]');
          $polygonRight = $(star).find('[data-side="right"]');
          leftClass = rightClass = (index <= endIndex) ? stateClass : 'empty';
  
          // has another half rating, add half star
          leftClass = ( index - endIndex === 0.5 ) ? stateClass : leftClass;
  
          $polygonLeft.attr('class', 'svg-'  + leftClass + '-' + this._uid);
          $polygonRight.attr('class', 'svg-'  + rightClass + '-' + this._uid);
  
          // get color for level
          var ratedColorsIndex = endIndex >= 0 ? Math.ceil(endIndex) : 0;
  
          var ratedColor;
          if (s.ratedColors && s.ratedColors.length && s.ratedColors[ratedColorsIndex]) {
            ratedColor = s.ratedColors[ratedColorsIndex];
          } else {
            ratedColor = this._defaults.ratedColor;
          }
  
          // only override colors in rated stars and when rated number is valid
          if (stateClass === 'rated' && endIndex > -1) {
            // limit to painting only to rated stars, and specific case for half star
            if (index <= Math.ceil(endIndex) || (index < 1 && endIndex < 0)) {
              $polygonLeft.attr('style', 'fill:'+ratedColor);
            }
            if (index <= endIndex) {
              $polygonRight.attr('style', 'fill:'+ratedColor);
            }
          }
        }.bind(this));
      },
  
      renderMarkup: function () {
        var s = this.settings;
        var baseUrl = s.baseUrl ? location.href.split('#')[0] : '';
  
        // inject an svg manually to have control over attributes
        var star = '<div class="jq-star" style="width:' + s.starSize+ 'px;  height:' + s.starSize + 'px;"><svg version="1.0" class="jq-star-svg" shape-rendering="geometricPrecision" xmlns="http://www.w3.org/2000/svg" ' + this.getSvgDimensions(s.starShape) +  ' stroke-width:' + s.strokeWidth + 'px;" xml:space="preserve"><style type="text/css">.svg-empty-' + this._uid + '{fill:url(' + baseUrl + '#' + this._uid + '_SVGID_1_);}.svg-hovered-' + this._uid + '{fill:url(' + baseUrl + '#' + this._uid + '_SVGID_2_);}.svg-active-' + this._uid + '{fill:url(' + baseUrl + '#' + this._uid + '_SVGID_3_);}.svg-rated-' + this._uid + '{fill:' + s.ratedColor + ';}</style>' +
  
        this.getLinearGradient(this._uid + '_SVGID_1_', s.emptyColor, s.emptyColor, s.starShape) +
        this.getLinearGradient(this._uid + '_SVGID_2_', s.hoverColor, s.hoverColor, s.starShape) +
        this.getLinearGradient(this._uid + '_SVGID_3_', s.starGradient.start, s.starGradient.end, s.starShape) +
        this.getVectorPath(this._uid, {
          starShape: s.starShape,
          strokeWidth: s.strokeWidth,
          strokeColor: s.strokeColor
        } ) +
        '</svg></div>';
  
        // inject svg markup
        var starsMarkup = '';
        for( var i = 0; i < s.totalStars; i++){
          starsMarkup += star;
        }
        this.$el.append(starsMarkup);
        this.$stars = this.$el.find('.jq-star');
      },
  
      getVectorPath: function(id, attrs){
        return (attrs.starShape === 'rounded') ?
          this.getRoundedVectorPath(id, attrs) : this.getSpikeVectorPath(id, attrs);
      },
  
      getSpikeVectorPath: function(id, attrs){
        return '<polygon data-side="center" class="svg-empty-' + id + '" points="281.1,129.8 364,55.7 255.5,46.8 214,-59 172.5,46.8 64,55.4 146.8,129.7 121.1,241 212.9,181.1 213.9,181 306.5,241 " style="fill: transparent; stroke: ' + attrs.strokeColor + ';" />' +
          '<polygon data-side="left" class="svg-empty-' + id + '" points="281.1,129.8 364,55.7 255.5,46.8 214,-59 172.5,46.8 64,55.4 146.8,129.7 121.1,241 213.9,181.1 213.9,181 306.5,241 " style="stroke-opacity: 0;" />' +
            '<polygon data-side="right" class="svg-empty-' + id + '" points="364,55.7 255.5,46.8 214,-59 213.9,181 306.5,241 281.1,129.8 " style="stroke-opacity: 0;" />';
      },
  
      getRoundedVectorPath: function(id, attrs){
        var fullPoints = 'M520.9,336.5c-3.8-11.8-14.2-20.5-26.5-22.2l-140.9-20.5l-63-127.7 c-5.5-11.2-16.8-18.2-29.3-18.2c-12.5,0-23.8,7-29.3,18.2l-63,127.7L28,314.2C15.7,316,5.4,324.7,1.6,336.5S1,361.3,9.9,370 l102,99.4l-24,140.3c-2.1,12.3,2.9,24.6,13,32c5.7,4.2,12.4,6.2,19.2,6.2c5.2,0,10.5-1.2,15.2-3.8l126-66.3l126,66.2 c4.8,2.6,10,3.8,15.2,3.8c6.8,0,13.5-2.1,19.2-6.2c10.1-7.3,15.1-19.7,13-32l-24-140.3l102-99.4 C521.6,361.3,524.8,348.3,520.9,336.5z';
  
        return '<path data-side="center" class="svg-empty-' + id + '" d="' + fullPoints + '" style="stroke: ' + attrs.strokeColor + '; fill: transparent; " /><path data-side="right" class="svg-empty-' + id + '" d="' + fullPoints + '" style="stroke-opacity: 0;" /><path data-side="left" class="svg-empty-' + id + '" d="M121,648c-7.3,0-14.1-2.2-19.8-6.4c-10.4-7.6-15.6-20.3-13.4-33l24-139.9l-101.6-99 c-9.1-8.9-12.4-22.4-8.6-34.5c3.9-12.1,14.6-21.1,27.2-23l140.4-20.4L232,164.6c5.7-11.6,17.3-18.8,30.2-16.8c0.6,0,1,0.4,1,1 v430.1c0,0.4-0.2,0.7-0.5,0.9l-126,66.3C132,646.6,126.6,648,121,648z" style="stroke: ' + attrs.strokeColor + '; stroke-opacity: 0;" />';
      },
  
      getSvgDimensions: function(starShape){
        return (starShape === 'rounded') ? 'width="550px" height="500.2px" viewBox="0 146.8 550 500.2" style="enable-background:new 0 0 550 500.2;' : 'x="0px" y="0px" width="50px" height="50px" viewBox="60 -62 309 309" style="enable-background:new 64 -59 305 305;';
      },
  
      getLinearGradient: function(id, startColor, endColor, starShape){
        var height = (starShape === 'rounded') ? 500 : 250;
        return '<linearGradient id="' + id + '" gradientUnits="userSpaceOnUse" x1="0" y1="-50" x2="0" y2="' + height + '"><stop  offset="0" style="stop-color:' + startColor + '"/><stop  offset="1" style="stop-color:' + endColor + '"/> </linearGradient>';
      },
  
      executeCallback: function(rating, $el){
        var callback = this.settings.callback;
        callback(rating, $el);
      }
  
    };
  
    var publicMethods = {
  
      unload: function() {
        var _name = 'plugin_' + pluginName;
        var $el = $(this);
        var $starSet = $el.data(_name).$stars;
        $starSet.off();
        $el.removeData(_name).remove();
      },
  
      setRating: function(rating, round) {
        var _name = 'plugin_' + pluginName;
        var $el = $(this);
        var $plugin = $el.data(_name);
        if( rating > $plugin.settings.totalStars || rating < 0 ) { return; }
        if( round ){
          rating = Math.round(rating);
        }
        $plugin.applyRating(rating);
      },
  
      getRating: function() {
        var _name = 'plugin_' + pluginName;
        var $el = $(this);
        var $starSet = $el.data(_name);
        return $starSet._state.rating;
      },
  
      resize: function(newSize) {
        var _name = 'plugin_' + pluginName;
        var $el = $(this);
        var $starSet = $el.data(_name);
        var $stars = $starSet.$stars;
  
        if(newSize <= 1 || newSize > 200) {
          console.error('star size out of bounds');
          return;
        }
  
        $stars = Array.prototype.slice.call($stars);
        $stars.forEach(function(star){
          $(star).css({
            'width': newSize + 'px',
            'height': newSize + 'px'
          });
        });
      },
  
      setReadOnly: function(flag) {
        var _name = 'plugin_' + pluginName;
        var $el = $(this);
        var $plugin = $el.data(_name);
        if(flag === true){
          $plugin.$stars.off('mouseover mouseout click');
        } else {
          $plugin.settings.readOnly = false;
          $plugin.addListeners();
        }
      }
  
    };
  
  
    // Avoid Plugin.prototype conflicts
    $.extend(Plugin.prototype, methods);
  
    $.fn[ pluginName ] = function ( options ) {
  
      // if options is a public method
      if( !$.isPlainObject(options) ){
        if( publicMethods.hasOwnProperty(options) ){
          return publicMethods[options].apply(this, Array.prototype.slice.call(arguments, 1));
        } else {
          $.error('Method '+ options +' does not exist on ' + pluginName + '.js');
        }
      }
  
      return this.each(function() {
        // preventing against multiple instantiations
        if ( !$.data( this, 'plugin_' + pluginName ) ) {
          $.data( this, 'plugin_' + pluginName, new Plugin( this, options ) );
        }
      });
    };
  
  })( jQuery, window, document );


  var array = '';

  $(".my-rating-6").starRating({
    totalStars: 5,
    emptyColor: 'lightgray',
    hoverColor: 'salmon',
    activeColor: 'cornflowerblue',
    initialRating: 4,
    strokeWidth: 0,
    useGradient: false,
    minRating: 1,
    callback: function (currentRating, $el) {
      /*alert('rated ' + currentRating);
      console.log('DOM element ', $el);
      $('#test').attr("value", currentRating);
      array = currentRating;*/

      try {       
      $.ajax({
        type : 'POST',
        cache : false,
        url : 'http://xxxx/setRate.jsp',/*要接一支後端程式*/
        data:{ /*傳遞rating值給JSP, 使用JSON格式*/
           currentRating:currentRating
           /*, productId: productID*/
        },
        async : true,
        success : function(response) { /*JSP程式回傳結果*/
          if(response.result){
            alert('評分成功!');
            }else{
            alert(response.message);
          }
        },
        error: function( jqXHR, textStatus, errorThrown ){
          alert('xxx error');
        }/*,
        beforeSend: function( jqXHR, settings ){
          
        },
        complete: function( jqXHR, textStatus ){
          
        }*/
      });
    } catch (err) {
      alert(err);
    }

    }
  });

  !function(a){"use strict";var b="starRating",c=function(){},d={totalStars:5,useFullStars:!1,starShape:"straight",emptyColor:"lightgray",hoverColor:"orange",activeColor:"gold",ratedColor:"crimson",useGradient:!0,readOnly:!1,disableAfterRate:!0,baseUrl:!1,starGradient:{start:"#FEF7CD",end:"#FF9511"},strokeWidth:4,strokeColor:"black",initialRating:0,starSize:40,callback:c,onHover:c,onLeave:c},e=function(c,e){var f,g,h;this.element=c,this.$el=a(c),this.settings=a.extend({},d,e),f=this.$el.data("rating")||this.settings.initialRating,h=this.settings.forceRoundUp?Math.ceil:Math.round,g=(h(2*f)/2).toFixed(1),this._state={rating:g},this._uid=Math.floor(999*Math.random()),e.starGradient||this.settings.useGradient||(this.settings.starGradient.start=this.settings.starGradient.end=this.settings.activeColor),this._defaults=d,this._name=b,this.init()},f={init:function(){this.renderMarkup(),this.addListeners(),this.initRating()},addListeners:function(){this.settings.readOnly||(this.$stars.on("mouseover",this.hoverRating.bind(this)),this.$stars.on("mouseout",this.restoreState.bind(this)),this.$stars.on("click",this.handleRating.bind(this)))},hoverRating:function(a){var b=this.getIndex(a);this.paintStars(b,"hovered"),this.settings.onHover(b+1,this._state.rating,this.$el)},handleRating:function(a){var b=this.getIndex(a),c=b+1;this.applyRating(c,this.$el),this.executeCallback(c,this.$el),this.settings.disableAfterRate&&this.$stars.off()},applyRating:function(a){var b=a-1;this.paintStars(b,"rated"),this._state.rating=b+1,this._state.rated=!0},restoreState:function(a){var b=this.getIndex(a),c=this._state.rating||-1,d=this._state.rated?"rated":"active";this.paintStars(c-1,d),this.settings.onLeave(b+1,this._state.rating,this.$el)},getIndex:function(b){var c=a(b.currentTarget),d=c.width(),e=a(b.target).attr("data-side"),f=this.settings.minRating;e=e?e:this.getOffsetByPixel(b,c,d),e=this.settings.useFullStars?"right":e;var g=c.index()-("left"===e?.5:0);return g=.5>g&&b.offsetX<d/4?-1:g,g=f&&f<=this.settings.totalStars&&f>g?f-1:g},getOffsetByPixel:function(a,b,c){var d=a.pageX-b.offset().left;return c/2>=d&&!this.settings.useFullStars?"left":"right"},initRating:function(){this.paintStars(this._state.rating-1,"active")},paintStars:function(b,c){var d,e,f,g,h=this.settings;a.each(this.$stars,function(i,j){d=a(j).find('[data-side="left"]'),e=a(j).find('[data-side="right"]'),f=g=b>=i?c:"empty",f=i-b===.5?c:f,d.attr("class","svg-"+f+"-"+this._uid),e.attr("class","svg-"+g+"-"+this._uid);var k,l=b>=0?Math.ceil(b):0;k=h.ratedColors&&h.ratedColors.length&&h.ratedColors[l]?h.ratedColors[l]:this._defaults.ratedColor,"rated"===c&&b>-1&&((i<=Math.ceil(b)||1>i&&0>b)&&d.attr("style","fill:"+k),b>=i&&e.attr("style","fill:"+k))}.bind(this))},renderMarkup:function(){for(var a=this.settings,b=a.baseUrl?location.href.split("#")[0]:"",c='<div class="jq-star" style="width:'+a.starSize+"px;  height:"+a.starSize+'px;"><svg version="1.0" class="jq-star-svg" shape-rendering="geometricPrecision" xmlns="http://www.w3.org/2000/svg" '+this.getSvgDimensions(a.starShape)+" stroke-width:"+a.strokeWidth+'px;" xml:space="preserve"><style type="text/css">.svg-empty-'+this._uid+"{fill:url("+b+"#"+this._uid+"_SVGID_1_);}.svg-hovered-"+this._uid+"{fill:url("+b+"#"+this._uid+"_SVGID_2_);}.svg-active-"+this._uid+"{fill:url("+b+"#"+this._uid+"_SVGID_3_);}.svg-rated-"+this._uid+"{fill:"+a.ratedColor+";}</style>"+this.getLinearGradient(this._uid+"_SVGID_1_",a.emptyColor,a.emptyColor,a.starShape)+this.getLinearGradient(this._uid+"_SVGID_2_",a.hoverColor,a.hoverColor,a.starShape)+this.getLinearGradient(this._uid+"_SVGID_3_",a.starGradient.start,a.starGradient.end,a.starShape)+this.getVectorPath(this._uid,{starShape:a.starShape,strokeWidth:a.strokeWidth,strokeColor:a.strokeColor})+"</svg></div>",d="",e=0;e<a.totalStars;e++)d+=c;this.$el.append(d),this.$stars=this.$el.find(".jq-star")},getVectorPath:function(a,b){return"rounded"===b.starShape?this.getRoundedVectorPath(a,b):this.getSpikeVectorPath(a,b)},getSpikeVectorPath:function(a,b){return'<polygon data-side="center" class="svg-empty-'+a+'" points="281.1,129.8 364,55.7 255.5,46.8 214,-59 172.5,46.8 64,55.4 146.8,129.7 121.1,241 212.9,181.1 213.9,181 306.5,241 " style="fill: transparent; stroke: '+b.strokeColor+';" /><polygon data-side="left" class="svg-empty-'+a+'" points="281.1,129.8 364,55.7 255.5,46.8 214,-59 172.5,46.8 64,55.4 146.8,129.7 121.1,241 213.9,181.1 213.9,181 306.5,241 " style="stroke-opacity: 0;" /><polygon data-side="right" class="svg-empty-'+a+'" points="364,55.7 255.5,46.8 214,-59 213.9,181 306.5,241 281.1,129.8 " style="stroke-opacity: 0;" />'},getRoundedVectorPath:function(a,b){var c="M520.9,336.5c-3.8-11.8-14.2-20.5-26.5-22.2l-140.9-20.5l-63-127.7 c-5.5-11.2-16.8-18.2-29.3-18.2c-12.5,0-23.8,7-29.3,18.2l-63,127.7L28,314.2C15.7,316,5.4,324.7,1.6,336.5S1,361.3,9.9,370 l102,99.4l-24,140.3c-2.1,12.3,2.9,24.6,13,32c5.7,4.2,12.4,6.2,19.2,6.2c5.2,0,10.5-1.2,15.2-3.8l126-66.3l126,66.2 c4.8,2.6,10,3.8,15.2,3.8c6.8,0,13.5-2.1,19.2-6.2c10.1-7.3,15.1-19.7,13-32l-24-140.3l102-99.4 C521.6,361.3,524.8,348.3,520.9,336.5z";return'<path data-side="center" class="svg-empty-'+a+'" d="'+c+'" style="stroke: '+b.strokeColor+'; fill: transparent; " /><path data-side="right" class="svg-empty-'+a+'" d="'+c+'" style="stroke-opacity: 0;" /><path data-side="left" class="svg-empty-'+a+'" d="M121,648c-7.3,0-14.1-2.2-19.8-6.4c-10.4-7.6-15.6-20.3-13.4-33l24-139.9l-101.6-99 c-9.1-8.9-12.4-22.4-8.6-34.5c3.9-12.1,14.6-21.1,27.2-23l140.4-20.4L232,164.6c5.7-11.6,17.3-18.8,30.2-16.8c0.6,0,1,0.4,1,1 v430.1c0,0.4-0.2,0.7-0.5,0.9l-126,66.3C132,646.6,126.6,648,121,648z" style="stroke: '+b.strokeColor+'; stroke-opacity: 0;" />'},getSvgDimensions:function(a){return"rounded"===a?'width="550px" height="500.2px" viewBox="0 146.8 550 500.2" style="enable-background:new 0 0 550 500.2;':'x="0px" y="0px" width="305px" height="305px" viewBox="60 -62 309 309" style="enable-background:new 64 -59 305 305;'},getLinearGradient:function(a,b,c,d){var e="rounded"===d?500:250;return'<linearGradient id="'+a+'" gradientUnits="userSpaceOnUse" x1="0" y1="-50" x2="0" y2="'+e+'"><stop  offset="0" style="stop-color:'+b+'"/><stop  offset="1" style="stop-color:'+c+'"/> </linearGradient>'},executeCallback:function(a,b){var c=this.settings.callback;c(a,b)}},g={unload:function(){var c="plugin_"+b,d=a(this),e=d.data(c).$stars;e.off(),d.removeData(c).remove()},setRating:function(c,d){var e="plugin_"+b,f=a(this),g=f.data(e);c>g.settings.totalStars||0>c||(d&&(c=Math.round(c)),g.applyRating(c))},getRating:function(){var c="plugin_"+b,d=a(this),e=d.data(c);return e._state.rating},resize:function(c){var d="plugin_"+b,e=a(this),f=e.data(d),g=f.$stars;return 1>=c||c>200?void console.error("star size out of bounds"):(g=Array.prototype.slice.call(g),void g.forEach(function(b){a(b).css({width:c+"px",height:c+"px"})}))},setReadOnly:function(c){var d="plugin_"+b,e=a(this),f=e.data(d);c===!0?f.$stars.off("mouseover mouseout click"):(f.settings.readOnly=!1,f.addListeners())}};a.extend(e.prototype,f),a.fn[b]=function(c){if(!a.isPlainObject(c)){if(g.hasOwnProperty(c))return g[c].apply(this,Array.prototype.slice.call(arguments,1));a.error("Method "+c+" does not exist on "+b+".js")}return this.each(function(){a.data(this,"plugin_"+b)||a.data(this,"plugin_"+b,new e(this,c))})}}(jQuery,window,document);

  
  
  
  