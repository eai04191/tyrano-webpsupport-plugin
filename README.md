# DO NOT USE IT IN PRODUCTION
This is a proof of concept. It has not been fully validated for production use and is not supported.

# tyrano-webpsupport-plugin
webpをサポートしていない環境(safari)で表示しようとしたときにpngに変換して表示します

## 使い方
1. `others\plugin`にwebpsupportフォルダをコピー
2. `first.ks`の中に以下を追記
    ```
    [plugin name="webpsupport"]
    ```

## 注意
background-imageに対する変換がおそらく動かない

## LICENSE

MIT

このプラグインはchase-moskal/webp-heroを使用しています

https://github.com/chase-moskal/webp-hero
