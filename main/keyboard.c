// 参考：http://blueeyes.sakura.ne.jp/2021/02/13/3777/

#include <stdio.h>
#include "pico/stdlib.h"
#include "tusb.h"
#include "bsp/board.h"

int main()
{
	board_init();	// マイコン内の各種ペリフェラル（機能）の初期化
	tusb_init();	// TinyUSB の初期化

	while(1)
	{
		tud_task();	// 関数内部でコールバック関数を呼んでいるのでループ内で wait などのブロッキング処理は厳禁らしい。
		// コールバック関数を呼んでいたらブロッキングできない理由がわからない。
		// 通常割り込みで処理するべきらしい。なんかよくわからんこと書いてある。
	}
	return 0;
}

