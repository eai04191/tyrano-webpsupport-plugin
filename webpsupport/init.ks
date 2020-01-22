[loadjs storage="plugin/webpsupport/lib/webp-hero-0.0.0-dev.24/polyfills.js" ]
[loadjs storage="plugin/webpsupport/lib/webp-hero-0.0.0-dev.24/webp-hero.bundle.js" ]

[iscript]
const webpMachine = new webpHero.WebpMachine();

const observer = new MutationObserver(function(mutations) {
    if (document.querySelectorAll("img[src$='.webp']").length !== 0) {
        console.log(
            "webp elements",
            document.querySelectorAll("img[src$='.webp']")
        );
        webpMachine.polyfillDocument();

        // インラインCSS周りのは対応していないので自分でなんとかする（つらい）
        [].slice
            .call(document.querySelectorAll("div"))
            .filter(function(element) {
                return element.style.backgroundImage;
            })
            .forEach(function(element) {
                const match = element.style.backgroundImage.match(
                    /url\("(?<path>.+)"\)/
                );
                const path = match.groups.path;
                if (path) {
                    path2dataUrl(path).then(function(dataUrl) {
                        element.style.backgroundImage = `url(${dataUrl})`;
                    });
                }
            });
    }
});

webpHero.detectWebpSupport().then(function(webpSupport) {
    alert("detectWebpSupport: " + webpSupport);
    if (webpSupport === false) {
        // webpをサポートしていない場合のみ監視する
        observer.observe(document.body, {
            attributes: true, // 属性変化の監視
            childList: true, // 子ノードの変化を監視
            subtree: true // 子孫ノードも監視対象に含める
        });

        alert("Observer Created");
    }
});

function path2dataUrl(path) {
    const wm = new webpHero.WebpMachine();
    return new Promise(function(resolve) {
        webpHero.loadBinaryData(path).then(function(binary) {
            wm.decode(binary).then(function(dataUrl) {
                resolve(dataUrl);
            });
        });
    });
}


[endscript]