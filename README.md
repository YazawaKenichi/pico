# Pico_Keyboard
This is a repository that is built for Keyboard on Raspberry Pi Pico with C/C++ SDK


###build する前に...
このままだとビルドできません！
以下の手順を行って、有効にしてください！

1. pico-sdk/lib/tinyusb/src/device/usbd.c 922 行目くらいに以下を追記。
```
const uint8_t device_desc[] =
{
18, // bLength
1, // bDescriptorType
0x10,
0x01, // bcdUSB
0x00, // bDeviceClass
0x00, // bDeviceSubClass
0x00, // bDeviceProtocol
CFG_TUD_ENDPOINT0_SIZE, // bMaxPacketSize0
0x34,
0x12, // idVendor
0xcd,
0xab, // idProduct,
0x00,
0x00, // bcdDevice
0x00, // iManufacturer
0x01, // iProduct
0x00, // iSerialNumber
0x01, // bNumConfigurations
};

const uint8_t conf_desc[] =
{
9, // bLength
2, // bDescriptorType
9 + 9,
0, // wTotalLength
1, // bNumInterface
1, // bConfigurationValue
0, // iConfiguration
0x20, // bmAttributes
0x0F, // bMaxPower

// --- Interface ---
9, // bLength
4, // bDescriptorType
1, // bInterfaceNumber
0, // bAlternateSetting
0, // bNumEndpoints
0xFF, // bInterfaceClass
0xFF, // bInterfaceSubClass
0xFF, // bInterfaceProtocol
0, // iInterface
};

const uint16_t string_desc_lang[] =
{ // Index: 0
4 | (3 << 8), // bLength & bDescriptorType
0x411 // てきとーにja-JP
};

const uint16_t string_desc_product[] =
{ // Index: 1
16 | (3 << 8),
'R', 'a', 's', 'p', 'i', 'c', 'o'
};

uint8_t const *tud_descriptor_device_cb(void)
{
return device_desc;
}

uint8_t const *tud_descriptor_configuration_cb(uint8_t index)
{
return conf_desc;
}

uint16_t const *tud_descriptor_string_cb(uint8_t index, uint16_t langid)
{
uint16_t const *ret = NULL;
switch(index)
{
case 0:
ret = string_desc_lang;
break;
case 1:
ret = string_desc_product;
break;
default:
break;
}

return ret;
}
```

参考：http://blueeyes.sakura.ne.jp/2021/02/13/3777/
### 用語メモ
- ペリフェラル：ググったら機器とか出てきたけど、個人的には機能って感じがする。
- ポーリング：
- ハンドラ：
- コールバック関数：関数（ここでは A 関数と呼ぶことにする）の引数に関数（ここでは B 関数と呼ぶことにする）を渡すことで、A 関数の中身を変更することなく、A 関数に B 関数の処理内容を追加するというもの。これの前後にブロッキング処理を置くのは良くないらしいが、よくわからない。
- ブロッキング処理：操作に対して順番に処理する流れのこと。順番に処理していくため、操作と操作の間に必ず待ち時間が発生する。らしい。例えば wait() 関数とか。
- ディスクリプタ：OS がファイルを操作するときの目印的なやつ
- const：宣言した変数を定数にする。
- Vendor-specific：
- エンドポイント：末端。ノードの一番端っこ。


### 疑問点
参考サイトに対する疑問点
> tud_task() 関数内部でコールバック関数を読んでいるため、ループ内でブロッキング処理は厳禁。
コールバック関数を呼び出しているから、ブロッキング処理禁止。の因果がよくわからない。
> エンドポイント情報を含んでいません。マジで何も出来ないデバイスです。
どうしてエンドポイントがないと何もできないデバイスになるのか

### 一言二言
tusb_config.h をわざわざプロジェクトフォルダにコピーして来なくても良くね？
実際それでも動いた。
参考サイトの CMakeLists.txt をそのまま持ってきたらビルドできなかったからいくつか編集した。

