$ ->
    return if document.querySelector('.city-photo') == null

    startInitPhotoSwipe()

startInitPhotoSwipe = ->
    pswpDom = '<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="pswp__bg"></div>

    <!-- Slides wrapper with overflow:hidden. -->
    <div class="pswp__scroll-wrap">
        <div class="pswp__container">
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
        </div>

        <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
        <div class="pswp__ui pswp__ui--hidden">

            <div class="pswp__top-bar">

                <!--  Controls are self-explanatory. Order can be changed. -->

                <div class="pswp__counter"></div>

                <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>

                <button class="pswp__button pswp__button--share" title="Share"></button>

                <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>

                <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

                <!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
                <div class="pswp__preloader">
                    <div class="pswp__preloader__icn">
                      <div class="pswp__preloader__cut">
                        <div class="pswp__preloader__donut"></div>
                      </div>
                    </div>
                </div>
            </div>

            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip"></div> 
            </div>

            <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
            </button>

            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
            </button>

            <div class="pswp__caption">
                <div class="pswp__caption__center"></div>
            </div>

        </div>

    </div>

</div>'
    document.getElementsByTagName('main')[0].insertAdjacentHTML 'beforeend', pswpDom

    $('#masonry-container').on 'click', '.city-photo', ->
        initPhotoSwipeFromDOM '#masonry-container', $(this).data 'index'

initPhotoSwipeFromDOM = (photoContainer, index) ->
    openPhotoSwipe = (photoContainer) ->
        slides = parsePhotos()
        options =
            index: parseInt index, 10
            bgOpacity: 0.8
            getThumbBoundsFn: undefined
            hideAnimationDuration: 0
            showAnimationDuration: 0
            history: false
        return false if isNaN options.index

        gallery = new PhotoSwipe document.getElementsByClassName('pswp')[0], PhotoSwipeUI_Default, slides, options
        gallery.init()

    parsePhotos = ->
        slides = []
        phEls = document.getElementsByClassName('city-photo')
        for phEl in phEls
            do (phEl) ->
                phData = phEl.dataset
                slides.push
                    src: 'assets/'+phData.filePath
                    w: 640
                    h: 433
                    title: "<a href='/cities/"+phData.city+"'>"+phData.city
        slides
    
    openPhotoSwipe photoContainer