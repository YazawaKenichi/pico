#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "pico/binary_info.h"

const uint LED_PIN = 25;	//定数宣言

int main()
{
	bi_decl(bi_program_description("This is a test binary."));
	bi_decl(bi_1pin_with_name(LED_PIN, "On-board LED"));

	stdio_init_all();

	gpio_init(LED_PIN);
	gpio_set_dir(LED_PIN, GPIO_OUT);	// LED_PIN を GPIO_OUT として扱う
	while(1)
	{
		gpio_put(LED_PIN, 0);	// LED_PIN から 0 を出力する
		sleep_ms(250);	// 250 ms 待つ
		gpio_put(LED_PIN, 1);	// LED_PIN から 1 を出力する
		puts("Hello, World!\n");	// シリアルから文字列を出力する
		sleep_ms(1000);	// 1000 ms 待つ
	}
}


/*
	疑問
	bidecl() メソッドは何をするメソッドなのだろう？
	bi_program_description() メソッドは名前からして、プログラムがどのようなプログラムなのか説明するプログラムなのだろうが、そのようなものを記述する必要はあるのだろうか？
	bi_1pin_with_name() メソッドに至っては何なんだこいつ。

	stdio_init_all() メソッドや gpio_init() メソッドはそれぞれ stdio と gpio をリセットするメソッドであることが名前から明白だが、stdio と gpio を使うときは最初に呼び出す必要があるのだろう。この考え方は合ってる？
	そして他にも IO ピンを使用したいときはそれらをすべて gpio_put する必要があるのだろうが、本当にその考えで合っているか？
	GPIO 25 自体を最初に定義している場所は bi_1pin_with_name() の方か gpio_init() の方か？これはそれぞれのメソッドの意味を理解すれば解決しそう。
*/

