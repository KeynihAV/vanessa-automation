﻿# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOn837
@IgnoreOn839

#из-за ошибки web клиента в 8.3.10
@IgnoreOnWeb8310

@tree


Функционал: Автоматизированное получение изменения состояния формы

Как Разработчик я хочу
Чтобы у меня был функционал для получения шагов Gherkin при изменении формы
Для того чтобы я мог использовать их в своих сценариях без программирования



Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Когда я удаляю все элементы Справочника "Справочник1"
	Когда я создаю fixtures по макету "Макет"
	
	
	
Сценарий: Я получаю изменения формы в виде сценария Gherkin

	И я включаю асинхронный режим выполнения шагов с интервалом 1
	И я отключаю асинхронный режим выполнения шагов
	
#Область Создание элементов шапки	
	Если Версия платформы ">=" "8.3.12" Тогда
			Дано я устанавливаю максимальное время выполнения действия 60
	
	
	Затем Я запоминаю значение выражения "0" в переменную "КомандаПанельРазделов"
	Если в панели разделов есть команда "Основная" Тогда
		Затем Я запоминаю значение выражения "1" в переменную "КомандаПанельРазделов"
	Тогда переменная "КомандаПанельРазделов" имеет значение 1
	
	Когда Я нажимаю кнопку командного интерфейса "Основная"

	Затем Я запоминаю значение выражения "0" в переменную "КомандаПанельФункций"
	Если в панели функций есть команда "Справочник1" Тогда
		Затем Я запоминаю значение выражения "1" в переменную "КомандаПанельФункций"
	Тогда переменная "КомандаПанельФункций" имеет значение 1

	И     В панели функций я выбираю "Справочник1"
	Тогда открылось окно "Справочник1"
	
	Тогда открылось окно
		|'Справочник1'|
		
	Тогда открылось окно
		|'Справочник2'|
		|'Справочник1'|
		|'Справочник3'|
		
	Тогда открылось окно
		|'Справочник2'|
		|'Спра*1'|
		|'Справочник3'|
	
	Затем В панели открытых я выбираю "Справочник1"
	
	Затем Я запоминаю значение выражения "0" в переменную "ПроверкаИмениФормы"
	Если имя текущей формы "Справочник.Справочник1.ФормаСписка" Тогда
		Затем Я запоминаю значение выражения "1" в переменную "ПроверкаИмениФормы"
	Тогда переменная "ПроверкаИмениФормы" имеет значение 1


	Затем Я запоминаю значение выражения "0" в переменную "КомандаПанельОткрытых"
	Если в панели открытых есть команда "Справочник1" Тогда
		Затем Я запоминаю значение выражения "1" в переменную "КомандаПанельОткрытых"
	Тогда переменная "КомандаПанельОткрытых" имеет значение 1
	
	Затем Я запоминаю значение выражения "0" в переменную "ЕстьКолонкаКод"
	Если в таблице "Список" есть колонка "Код" Тогда
		Затем Я запоминаю значение выражения "1" в переменную "ЕстьКолонкаКод"
	Тогда переменная "ЕстьКолонкаКод" имеет значение 1
	
	Затем Я запоминаю значение выражения "0" в переменную "ЕстьКолонкаРеквизитПереключатель"
	Если в таблице "Список" есть колонка с именем "РеквизитПереключатель" Тогда
		Затем Я запоминаю значение выражения "1" в переменную "ЕстьКолонкаРеквизитПереключатель"
	Тогда переменная "ЕстьКолонкаРеквизитПереключатель" имеет значение 1
		
	Затем Я запоминаю значение выражения "0" в переменную "ТакойКолонкиНет"
	Если в таблице "Список" нет колонки "Несуществующая колонка" Тогда
		Затем Я запоминаю значение выражения "1" в переменную "ТакойКолонкиНет"
	Тогда переменная "ТакойКолонкиНет" имеет значение 1

	Затем Я запоминаю значение выражения "0" в переменную "ТакойКолонкиНет"
	//такой колонки нет, т.к. ищем по имени, а в имени не может быть пробела
	Если в таблице "Список" нет колонки с именем "Реквизит переключатель" Тогда
		Затем Я запоминаю значение выражения "1" в переменную "ТакойКолонкиНет"
	Тогда переменная "ТакойКолонкиНет" имеет значение 1

	
	Затем в течение 100 секунд я выполняю
		Дано я нажимаю на кнопку с именем 'ФормаОбновить'
		Если в таблице "Список" количество строк "больше" 0 Тогда
			Тогда я прерываю цикл
		И пауза 1	
			
	
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'       |
		| 'Тестовый Элемент 1' |
	
	//Это поле заполнено
	Затем Я запоминаю значение выражения "0" в переменную "ПолеНаименованиеЗаполнено"
	Если в таблице "Список" поле "Наименование" заполнено Тогда
		Затем Я запоминаю значение выражения "1" в переменную "ПолеНаименованиеЗаполнено"
	Тогда переменная "ПолеНаименованиеЗаполнено" имеет значение 1
	
	//Это поле не заполнено
	Затем Я запоминаю значение выражения "0" в переменную "ПолеРеквизит1Заполнено"
	Если в таблице "Список" поле с именем "Реквизит1" не заполнено Тогда
		Затем Я запоминаю значение выражения "1" в переменную "ПолеРеквизит1Заполнено"
	Тогда переменная "ПолеРеквизит1Заполнено" имеет значение 1
	
	//Это поле не заполнено
	Затем Я запоминаю значение выражения "0" в переменную "ПолеРеквизит1Заполнено"
	Если в таблице "Список" поле "Реквизит1" не заполнено Тогда
		Затем Я запоминаю значение выражения "1" в переменную "ПолеРеквизит1Заполнено"
	Тогда переменная "ПолеРеквизит1Заполнено" имеет значение 1
	
	//Это поле не заполнено
	Затем Я запоминаю значение выражения "0" в переменную "ПолеРеквизитПереключательЗаполнено"
	Если в таблице "Список" поле с именем "РеквизитПереключатель" заполнено Тогда
		Затем Я запоминаю значение выражения "1" в переменную "ПолеРеквизитПереключательЗаполнено"
	Иначе	
		Затем Я запоминаю значение выражения "2" в переменную "ПолеРеквизитПереключательЗаполнено"
	Тогда переменная "ПолеРеквизитПереключательЗаполнено" имеет значение 2
	
	Тогда открылось окно "Спр" "авочник1"
	Тогда открылось окно "Спр" "а" "в" "о" "ч" "н" "ик1"
	Тогда открылось окно "Спр" + "а" + "в" + "о" + "ч" + "н" + "ик1"
	И я активизирую окно "Справочник1"
	
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаОкна"
	Если появилось окно с заголовком "Справочник1" в течение 10 секунд Тогда
			Затем Я запоминаю значение выражения "2" в переменную "ПроверкаОкна"
	Тогда переменная "ПроверкаОкна" имеет значение 2
			
	Если текущее окно имеет заголовок "Спра*ник1" Тогда
			Затем Я запоминаю значение выражения "3" в переменную "ПроверкаОкна"
	Тогда переменная "ПроверкаОкна" имеет значение 3
			
	
	И я запоминаю значение таблицы "Список" как "Таб1"
		| 'Наименование' |
		| 'Код'          | 	
	И я запоминаю значение таблицы "Список" как "Таб2"
		| 'Наименование' |
		| 'Код'          | 	
	И таблица "Таб1" содержится в таблице "Таб2"
	
			
			
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаСтрокВТаблице"
	Если в таблице "Список" есть строки Тогда
		| Код         | Наименование       |
		| "000000002" | Тестовый Элемент 2 |
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаСтрокВТаблице"
	Тогда переменная "ПроверкаСтрокВТаблице" имеет значение 2	
		
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаОтсутствияСтрокВТаблице"
	Если в таблице "Список" нет строки Тогда
		| Код         | Наименование               |
		| "000000002" | Тестовый Элемент 111111111 |
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаОтсутствияСтрокВТаблице"
	Тогда переменная "ПроверкаОтсутствияСтрокВТаблице" имеет значение 2	


		
	И     В форме "Справочник1" в таблице "Список" я перехожу к строке:
		| Код       | Наименование       |
		| "000000002" | Тестовый Элемент 2 |
	И     в таблице "Список" я перехожу к строке содержащей подстроки
		| Код       | Наименование       |
		| "000000002" | '2'             |
	
	И в таблице "Список" я активизирую поле с именем "РеквизитДата"
	
	И в таблице "Список" заголовок активной колонки "Реквизит дата"
	И в таблице "Список" имя активной колонки "РеквизитДата"	
	
	И в таблице "Список" я активизирую поле с именем "Код"
	И в таблице текущее поле заполнено
	И я жду, что в таблице текущее поле будет заполнено в течение 10 секунд.
	И в таблице "Список" я активизирую поле с именем "Реквизит3"
	И в таблице текущее поле не заполнено
	И я жду, что в таблице текущее поле будет не заполнено в течение 10 секунд.
	И в таблице "Список" я активизирую поле с именем "Код"
	И в таблице "Список" у поля "Наименование" я жду значения "Тестовый Элемент 2" в течение 10 секунд
	И в таблице "Список" у поля с именем "Наименование" я жду значения "Тестовый Элемент 2" в течение 10 секунд	
	
	И в таблице "Список" у поля "Наименование" я жду значения отличного от "Тестовый Элемент 22222" в течение 10 секунд
	И в таблице "Список" у поля с именем "Наименование" я жду значения отличного от "Тестовый Элемент 22222" в течение 10 секунд	
	
	И я запоминаю значение таблицы "Список" как "ТабВсеСтроки"
		| 'Наименование' |
		| 'Код'          | 	
	
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'       |
		| 'Тестовый Элемент 1' |
	И в таблице "Список" я перехожу к строке с переключением выделения:
		| 'Наименование'       |
		| 'Тестовый Элемент 2' |

	И я запоминаю выделенные строки таблицы "Список" как "ВыделенныеСтроки"
		| 'Наименование' |
		| 'Код'          | 	
	И таблица "ВыделенныеСтроки" содержится в таблице "ТабВсеСтроки"
		
	
	И     в таблице "Список" я перехожу к первой строке
	
	И     я запоминаю значение таблицы "Список" поля "Код" как "КодЭлементаВТаблице"
	И в таблице "Список" я перехожу к последней строке
	И в таблице "Список" я перехожу к строке:
			| 'Код'                       |
			|  '$КодЭлементаВТаблице$'    |


	И таблица  "Список"  содержит строки:
			| 'Код'                       |
			|  '$КодЭлементаВТаблице$'    |
	
	И я жду, что таблица "Список" станет содержать строки в течение 10 секунд:
			| 'Код'                       |
			|  '$КодЭлементаВТаблице$'    |
	

	И я жду, что таблица "Список" не станет содержать строки в течение 10 секунд:
			| 'Код'                       |
			|  'ТакогоКодаНет'            |
	
	И     в таблице "Список" я перехожу к строке по шаблону
		| Код         | Наименование       |
		| "00000000*" | '*Элемент*2'      |

	И     в таблице "Список" я перехожу к строке по шаблону
		| Код         | Наим*             |
		| "00000000*" | '*Элемент*2'      |
		
		
	И я запоминаю текущее окно как "ТекущееОкноДоОткрытия"	
	И В форме "Справочник1" в ТЧ "Список" я выбираю текущую строку
	И открылось окно "Тестовый Элемент * (Справочник1)"
	И я жду открытия окна отличного от "$ТекущееОкноДоОткрытия$" в течение 10 секунд
	
	И в группе "Основа" содержатся элементы
		| '!ГруппаРеквизит1' |
		| '!ГруппаРеквизит2' |
	
	И в группе "Основа" содержатся элементы
		| 'Реквизит дата' |
		| 'Реквизит число' |
	
	И в группе с именем "Группа1" содержатся элементы
		| '!ГруппаРеквизит1' |
		| '!ГруппаРеквизит2' |
	И в группе с именем "Группа1" содержатся элементы
		| 'Реквизит дата' |
		| 'Реквизит число' |

	И в группе "Основа" не содержатся элементы
		| '!НеСуществующаяГруппаРеквизит1' |
		| '!НеСуществующаяГруппаРеквизит2' |
	
	И в группе "Основа" не содержатся элементы
		| 'Реквизит дата, который не существует' |
		| 'Реквизит число, который не существует' |
	
	И в группе с именем "Группа1" не содержатся элементы
		| '!НеСуществующаяГруппаРеквизит1' |
		| '!НеСуществующаяГруппаРеквизит2' |

		
#	И     В открытой форме я открываю выпадающий список с заголовком "Реквизит1"
	
	//проверка поиска элементов по заголовку, хотя есть группа с таким же заголовком
	
	И Я запоминаю значение выражения '1+1' в переменную "$$$$Подготовка данных.НачалоМесяца$$$$"
	И в поле с именем 'РеквизитСтрока' я ввожу текст '$$$$Подготовка данных.НачалоМесяца$$$$'
	И элемент формы с именем "РеквизитСтрока" стал равен "2"
	
	И в поле с именем 'РеквизитСтрока' я ввожу текст '$'
	И элемент формы с именем "РеквизитСтрока" стал равен "$"
	И в поле с именем 'РеквизитСтрока' я ввожу текст '$$'
	И элемент формы с именем "РеквизитСтрока" стал равен "$$"
	И в поле с именем 'РеквизитСтрока' я ввожу текст '111'
	
	И поле с именем "РеквизитСтрока" имеет заголовок "Реквизит строка"
	Затем Я запоминаю значение выражения "0" в переменную "ПравильныйЗаголовок"
	Если поле с именем "РеквизитСтрока" имеет заголовок "Реквизит строка" Тогда
		Затем Я запоминаю значение выражения "1" в переменную "ПравильныйЗаголовок"
	Тогда переменная "ПравильныйЗаголовок" имеет значение 1
	
	
	
	И у элемента с именем "РеквизитСтрока" я жду значения "1*1" в течение 10 секунд по шаблону
	И у поля с именем "РеквизитСтрока" текст подсказки равен ""
	И поле таблицы "ТабличнаяЧасть1" с именем "ТабличнаяЧасть1РеквизитСтрока" имеет заголовок "Реквизит строка"
	И у поля таблицы "ТабличнаяЧасть1" с именем "ТабличнаяЧасть1РеквизитСтрока" текст подсказки равен ""
	И в поле 'Реквизит Дата' я ввожу текст '08.04.1981'
	И я снимаю флаг 'Реквизит булево'
	И я меняю значение переключателя 'Реквизит переключатель' на 'Первое значение'
	
	Если Версия платформы ">=" "8.3.12" Тогда
		И я меняю значение переключателя 'Реквизит переключатель' на 'Второе значение*' по шаблону
		И я меняю значение переключателя 'Реквизит переключатель' на 'Второе*' по шаблону
		И я меняю значение переключателя 'Реквизит переключатель' на 'Первое*' по шаблону
		
	И из выпадающего списка "Реквизит быстрый выбор" я выбираю точное значение 'ТестовыйЭлемент20'	
	
	Если Версия платформы ">=" "8.3.10" Тогда
			Тогда открылась форма "Тестовый Элемент 2 (Справочник1)*"
			Тогда открылась форма с именем "Справочник.Справочник1.Форма.ФормаЭлемента"
			Тогда открылась форма с именем 
				|'Справочник.Справочник1.Форма.ФормаЭлемента'|
			Тогда открылась форма с именем 
				|'Справочник.Справочник2.Форма.ФормаЭлемента'|
				|'Справочник.Спра*ник1.Форма.ФормаЭлемента'|
	
	Если Версия платформы ">=" "8.3.12" Тогда
		И представление элемента с именем "Наименование" стало равно "Тестовый Элемент 2"
		
	И я жду доступности элемента с именем "Наименование" в течение 10 секунд	

	И я фиксирую форму с именем "Справочник.Справочник1.Форма.ФормаЭлемента"	
	
	И в поле с именем 'РеквизитСтрока' я ввожу текст 'Тест'
	И я запоминаю имя текущего поля как "ИмяПоляРеквизитСтрока"
	И я перехожу к следующему реквизиту
	И элемент формы с именем "РеквизитСтрокаНеДоступныйДляРедактирования" стал равен 'Тест'
	И я нажимаю кнопку очистить у поля с именем "$ИмяПоляРеквизитСтрока$"
	И элемент формы с именем "РеквизитСтрока" стал равен ""
	И элемент формы с именем "$ИмяПоляРеквизитСтрока$" стал равен ""
	И в поле с именем '$ИмяПоляРеквизитСтрока$' я ввожу текст 'Тест'
	Тогда переменная "ИмяПоляРеквизитСтрока" имеет значение "РеквизитСтрока"
	И я перехожу к следующему реквизиту
	И я активизирую поле с именем "РеквизитСтрока"
	И я запоминаю значение текущего поля как "ЗначениеПоляРеквизитСтрока"
	И я перехожу к следующему реквизиту
	И Я запоминаю значение выражения "$ЗначениеПоляРеквизитСтрока$+$ЗначениеПоляРеквизитСтрока$" в переменную "ЗначениеПоляРеквизитСтрока2"
	И я активизирую поле с именем "РеквизитСтрока"
	И в текущее поле я ввожу текст "$ЗначениеПоляРеквизитСтрока2$"
	И элемент формы с именем "РеквизитСтрока" стал равен "ТестТест"

	
	И     в поле "Реквизит число" я увеличиваю значение
	И     в поле "Реквизит число" я уменьшаю значение
	
	И в таблице "ТабличнаяЧасть1" я нажимаю на кнопку с именем 'ТабличнаяЧасть1Добавить'
	И в таблице "ТабличнаяЧасть1" я активизирую поле "ЧастьЗаголовка1 ЧастьЗаголовка2"
	И в таблице "ТабличнаяЧасть1" в поле 'ЧастьЗаголовка1 ЧастьЗаголовка2' я ввожу текст '222'
	И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	Тогда таблица "ТабличнаяЧасть1" стала равной:
		| 'ЧастьЗаголовка1\nЧастьЗаголовка2' |
		| '222'                              |

	И таблица "ТабличнаяЧасть1" равна макету "ВЗаголовкеПереносСтроки1"
	
	И в таблице "ТабличнаяЧасть1" я перехожу к строке:
		| 'N' | 'ЧастьЗаголовка1\nЧастьЗаголовка2' |
		| '1' | '222'                              |

				
	
	И в таблице 'ТабличнаяЧасть1' я удаляю строку
	
	
	И     в таблице "ТабличнаяЧасть1" я нажимаю на кнопку 'Добавить'
	И     в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	И     в таблице "ТабличнаяЧасть1" я выбираю текущую строку
	И     в таблице "ТабличнаяЧасть1" в поле "Реквизит число" я увеличиваю значение
	И     в таблице "ТабличнаяЧасть1" в поле "Реквизит число" я уменьшаю значение
	И     в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	
	И элемент формы с именем "РеквизитЧисло" стал равен "0,00"
	
	И я изменяю флаг 'Флаг три значения'
	И я перехожу к следующему реквизиту
	И я изменяю флаг 'Флаг три значения'
	И я перехожу к следующему реквизиту
	//флаг сейчас находится в третьей позиции
	
	И я снимаю флаг 'Флаг три значения'
	И я перехожу к следующему реквизиту
	И элемент формы с именем "РеквизитЧисло" стал равен "0,00"

	И я изменяю флаг 'Флаг три значения'
	И я перехожу к следующему реквизиту
	И я изменяю флаг 'Флаг три значения'
	И я перехожу к следующему реквизиту
	//флаг сейчас находится в третьей позиции
	И я устанавливаю флаг 'Флаг три значения'
	И я перехожу к следующему реквизиту
	И элемент формы с именем "РеквизитЧисло" стал равен "1,00"

	
	И в таблице "ТабличнаяЧасть1" я перехожу к следующей ячейке
	И в таблице "ТабличнаяЧасть1" я перехожу к предыдущей ячейке
	
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаТЧ"
	Если в таблице "ТабличнаяЧасть1" поле с именем "ТабличнаяЧасть1РеквизитСтрока" имеет значение "" тогда
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаТЧ"
	Тогда переменная "ПроверкаТЧ" имеет значение 2
	
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаТЧ"
	Если в таблице "ТабличнаяЧасть1" поле с именем "ТабличнаяЧасть1РеквизитСтрока" имеет значение "" тогда
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаТЧ"
	Тогда переменная "ПроверкаТЧ" имеет значение 2
	
	И     таблица "ТабличнаяЧасть1" стала равной:
		| 'Реквизит число' |
		| ''               |
	
	
	И в таблице "ТабличнаяЧасть1" я активизирую поле с именем "ТабличнаяЧасть1РеквизитСтрока"
	И в таблице "ТабличнаяЧасть1" я выбираю текущую строку
	И в таблице "ТабличнаяЧасть1" в  текущее поле я ввожу текст '555'
	И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	И     я запоминаю значение таблицы "ТабличнаяЧасть1" поля "Реквизит строка" как "ЗначениеРеквизитСтрока"
	
	Тогда таблица "ТабличнаяЧасть1" стала равной:
		| 'Реквизит строка'           |
		| '$ЗначениеРеквизитСтрока$'  |

	И в таблице 'ТабличнаяЧасть1' я удаляю строку
	
	
	#Создание нескольких строк таблицы. Значение реквизита создаётся как "Значение1", "Значение2" и т.д.
	Затем Я запоминаю значение выражения "5" в переменную "МаксКолСтрок"
	Затем Я запоминаю значение выражения "0" в переменную "ТекНомерСтроки"
	Затем Пока выражение встроенного языка "$ТекНомерСтроки$ < $МаксКолСтрок$" истинно тогда
		Дано в таблице "ТабличнаяЧасть1" я нажимаю на кнопку с именем 'ТабличнаяЧасть1Добавить'
		И в таблице "ТабличнаяЧасть1" я активизирую поле с именем "ТабличнаяЧасть1РеквизитСтрока"
		И Я запоминаю значение выражения "$ТекНомерСтроки$+1" в переменную "ТекНомерСтроки"
		И в таблице "ТабличнаяЧасть1" в поле 'Реквизит строка' я ввожу значение выражения '"Значение" + $ТекНомерСтроки$'
		И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
		И в таблице текущее поле заполнено
		
	И в таблице 'ТабличнаяЧасть1' я выделяю все строки
	И Пока в таблице "ТабличнаяЧасть1" количество строк ">" 0 Тогда
		И в таблице "ТабличнаяЧасть1" я перехожу к первой строке
		И в таблице 'ТабличнаяЧасть1' я удаляю строку
	
	
	
	
	И в таблице "ТабличнаяЧасть1" я нажимаю на кнопку с именем 'ТабличнаяЧасть1Добавить'
	И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	
	
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
	Если таблица "ТабличнаяЧасть1" равна переданной тогда
		| 'Реквизит число' |
		| ''               |
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
		
	Тогда переменная "ПроверкаУсловияНаРавенствоТаблицы" имеет значение 2
	

	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
	#проверяем, что условие не выполнится
	Если таблица "ТабличнаяЧасть1" равна переданной тогда
		| 'Реквизит число' |
		| '111'            |
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
		
	Тогда переменная "ПроверкаУсловияНаРавенствоТаблицы" имеет значение 1
	

	
	
	
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
	Если таблица "ТабличнаяЧасть1" равна макету "МакетТабличнаяЧасть1" тогда
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
		
	Тогда переменная "ПроверкаУсловияНаРавенствоТаблицы" имеет значение 2
	

	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
	#проверяем, что условие не выполнится
	Если таблица "ТабличнаяЧасть1" равна макету "МакетТабличнаяЧасть1СОшибкой" тогда
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
		
	Тогда переменная "ПроверкаУсловияНаРавенствоТаблицы" имеет значение 1
	
	
	
	
	
	
	И     в таблице "ТабличнаяЧасть1" я удаляю текущую строку
	
	
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаЗначенияПоля"
	Если поле с именем "Наименование" стало равно "Тестовый Элемент 2" в течение 10 секунд Тогда
			Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаЗначенияПоля"
			
	Тогда переменная "ПроверкаУсловияНаЗначенияПоля" имеет значение 2
	
	Если установлен режим совместимости "НеИспользовать" Тогда
			Если Версия платформы ">=" "8.3.13" Тогда
					И Я очищаю окно сообщений пользователю
					И у поля "Надпись форматированная строка" я нажимаю гиперссылку 'Ссылка1'
					И В последнем сообщении TestClient есть строка "НавигационнаяСсылкаФорматированнойСтроки=Ссылка1"
					
					И Я очищаю окно сообщений пользователю
					И у поля "Надпись форматированная строка" я нажимаю гиперссылку 'Ссылка2'
					И В последнем сообщении TestClient есть строка "НавигационнаяСсылкаФорматированнойСтроки=Ссылка2"
					
					И Я очищаю окно сообщений пользователю

	
	#Проверка работы с многострочным реквизитом
	И я перехожу к закладке "Вспомогательная"
	И     в поле "Реквизит многострочная строка" я ввожу текст
		|'111'|
		|'222'|
	И     элемент формы с именем "РеквизитМногострочнаяСтрока" стал равен
		|'111'|
		|'222'|

	И     элемент формы с именем "РеквизитМногострочнаяСтрока" стал равен шаблону
		|'1*1'|
		|'2*2'|

	И     элемент формы с именем "РеквизитМногострочнаяСтрока" стал равен шаблону 
		|'1*1'|
		|'222'|

	И     элемент формы с именем "Код" стал равен шаблону  "0*0*"
		
	#Проверка работы с полем стандартного периода
	И     я нажимаю кнопку выбора у поля "Реквизит стандартный период"
	Тогда открылось окно "Выберите период"
	И пауза 1
	И     в поле "DateBegin" я ввожу текст "08.04.1981"
	И     в поле "DateEnd" я ввожу текст "11.09.1983"
	И     я нажимаю на кнопку "Выбрать"
	И элемент формы "Реквизит стандартный период" стал равен "08.04.1981 - 11.09.1983"
	
	
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаТолькоПросмотр"
	Если элемент "Наименование" доступен только для просмотра Тогда
		Тогда Я запоминаю значение выражения "2" в переменную "ПроверкаТолькоПросмотр"
	Тогда переменная "ПроверкаТолькоПросмотр" имеет значение 1

			
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаДоступности"
	Если элемент "Наименование" доступен для редактирования Тогда
		Тогда Я запоминаю значение выражения "2" в переменную "ПроверкаДоступности"
	Тогда переменная "ПроверкаДоступности" имеет значение 2

		
	И я перехожу к закладке "Основа"	
	И     В открытой форме из выпадающего списка с именем "Реквизит1" я выбираю "ЗначениеПеречисления1"
	И     из выпадающего списка с именем "Реквизит1" я выбираю точное значение "ЗначениеПеречисления2"
	И     элемент формы с именем "Реквизит1" стал равен "ЗначениеПеречисления2"
	И     из выпадающего списка с именем "Реквизит1" я выбираю точное значение "ЗначениеПеречисления1"
	И     элемент формы с именем "Реквизит1" стал равен "ЗначениеПеречисления1"
	
	
	И     В открытой форме я выбираю значение реквизита с заголовком "Реквизит2" из формы списка
	Тогда открылось окно "Справочник2"
	И     В форме "Справочник2" в таблице "Список" я перехожу к строке:
		| Наименование      |
		| ТестовыйЭлемент21 |
	И     В форме "Справочник2" в ТЧ "Список" я выбираю текущую строку
	Тогда открылось окно "Тестовый Элемент * (Справочник1) *"
	
	Если Версия платформы ">=" "8.3.12" Тогда
			//проверка для Таблицы
			И в таблице "ТабличнаяЧасть1" я нажимаю на кнопку с именем 'ТабличнаяЧасть1Добавить'
			И в таблице "ТабличнаяЧасть1" я активизирую поле с именем "ТабличнаяЧасть1РеквизитБыстрыйВыборТЧ"
			И в таблице "ТабличнаяЧасть1" я открываю выпадающий список с именем "ТабличнаяЧасть1РеквизитБыстрыйВыборТЧ"
			
			И в таблице "ТабличнаяЧасть1" выпадающий список с именем "ТабличнаяЧасть1РеквизитБыстрыйВыборТЧ" содержит значения
				| 'Группа1Элем1' |
				| 'Группа1Элем2' |
				| 'Группа2Элем1' |
				| 'Группа2Элем2' |
				| 'ТестовыйЭлемент20' |
				| 'ТестовыйЭлемент21' |
			
			И в таблице "ТабличнаяЧасть1" выпадающий список с именем "ТабличнаяЧасть1РеквизитБыстрыйВыборТЧ" стал равен:
				| 'Группа1Элем1' |
				| 'Группа1Элем2' |
				| 'Группа2Элем1' |
				| 'Группа2Элем2' |
				| 'ТестовыйЭлемент20' |
				| 'ТестовыйЭлемент21' |
			
			И в таблице "ТабличнаяЧасть1" выпадающий список с именем "ТабличнаяЧасть1РеквизитБыстрыйВыборТЧ" не содержит значения
				| 'Такого значения нет 1' |
				| 'Такого значения нет 2' |
				
			И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
			И в таблице 'ТабличнаяЧасть1' я удаляю строку
			
	
			И я открываю выпадающий список с именем "Реквизит1"
			И пауза 1
			И выпадающий список с именем "Реквизит1" стал равен
				| 'ЗначениеПеречисления1' |
				| 'ЗначениеПеречисления2' |

			И выпадающий список с именем "Реквизит1" содержит значения
				| 'ЗначениеПеречисления1' |
				
			И выпадающий список с именем "Реквизит1" содержит значения
				| 'ЗначениеПеречисления2' |
				
			И выпадающий список с именем "Реквизит1" содержит значения
				| 'ЗначениеПеречисления2' |
				| 'ЗначениеПеречисления1' |
				
			И выпадающий список с именем "Реквизит1" не содержит значения
				| 'ЗначениеПеречисления3' |
				| 'ЗначениеПеречисления4' |
		
	
	И     В открытой форме в поле с именем "РеквизитЧисло" я ввожу текст "12,34"
	И     В открытой форме в поле с именем "РеквизитСтрока" я ввожу текст "тест"
	И     я запоминаю значение поля с именем "РеквизитЧисло" как "ЗначениеРеквизитЧисло"
	Тогда переменная "ЗначениеРеквизитЧисло" имеет значение "12,34"
	И     поле с именем "РеквизитЧисло" равно переменной "ЗначениеРеквизитЧисло"
	И     В открытой форме в поле с именем "РеквизитСтрока" я ввожу текст ""
	И     элемент формы с именем "РеквизитСтрока" стал равен ""
	И     В открытой форме в поле с именем "РеквизитСтрока" я ввожу текст "тест"
	
	И в поле "!РеквизитДата" я ввожу начало текущего месяца
	И в поле "!РеквизитДата" я ввожу конец текущего месяца
	И в поле "!РеквизитДата" я ввожу начало следующего месяца
	И в поле "!РеквизитДата" я ввожу конец следующего месяца
	И в поле с именем "РеквизитДата" я ввожу текущую дату
	
	//страница Проверка кнопок
	И я перехожу к закладке "Проверка кнопок"
	
	//в ранних версиях платформы могут быит проблемы с получением сообщений пользователя
	Если Версия платформы ">=" "8.3.10" Тогда
			И я нажимаю на гиперссылку "Гиперссылка только просмотр картинка"
			Тогда в логе сообщений TestClient есть строки:
				| 'ГиперссылкаТолькоПросмотрНажатиеКартинка' |
			И я нажимаю на гиперссылку "Гиперссылка только просмотр надпись"
			Тогда в логе сообщений TestClient есть строки:
				| 'ГиперссылкаТолькоПросмотрНажатиеНадпись' |
		
	И элемент формы с именем "НедоступнаяКоманда" не доступен
	И в поле "Рек строка1" я ввожу текущую дату и текущее время
	
	И я перехожу к закладке "Основа"
	И     В открытой форме в поле с именем "РеквизитДата" я ввожу текст "08.04.1981"
	Если поле с именем "РеквизитСтрока" имеет значение "тест" тогда
		И     В открытой форме я устанавливаю флаг с заголовком "Реквизит булево"
	И элемент формы с именем "РеквизитБулево" стал равен "Да"	
	И элемент формы с именем "РеквизитБулево" стал равен "Yes"	
	И     В открытой форме я меняю значение переключателя с заголовком "Реквизит переключатель" на "Первое значение"
	И     поле с именем "РеквизитСтрока" присутствует на форме
	
#КонецОбласти

	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаОтсутствияСтроки"
	Если в таблице "ТабличнаяЧасть1" нет строки Тогда
			| 'Реквизит строка'        |
			| 'Какое-то значение'      |
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаОтсутствияСтроки"
		
	Тогда переменная "ПроверкаОтсутствияСтроки" имеет значение 2

#Область Создание элементов ТЧ	
	
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я нажимаю на кнопку с заголовком "Добавить"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" в поле с заголовком "Реквизит число" я ввожу текст "56,78"
	И     в таблице "ТабличнаяЧасть1" я активизирую поле "Реквизит строка"
	И     в таблице "ТабличнаяЧасть1" я активизирую поле "Реквизит число"
	И     я запоминаю значение таблицы "ТабличнаяЧасть1" поля с именем "ТабличнаяЧасть1РеквизитЧисло" как "ЗначениеРеквизитЧислоТаблица"
	Тогда переменная "ЗначениеРеквизитЧислоТаблица" имеет значение "56,78"
	И     я вывожу значение переменной "ЗначениеРеквизитЧислоТаблица"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" в поле с заголовком "Реквизит строка" я ввожу текст "ТестСтрока"
	И     в таблице "ТабличнаяЧасть1" в поле "Реквизит дата" я ввожу текущую дату
	И     в таблице "ТабличнаяЧасть1" в поле с именем "ТабличнаяЧасть1РеквизитДата" я ввожу текущую дату
	
	И     в таблице "ТабличнаяЧасть1" в поле с именем "ТабличнаяЧасть1РеквизитДата" я ввожу начало текущего месяца
	И     в таблице "ТабличнаяЧасть1" в поле с именем "ТабличнаяЧасть1РеквизитДата" я ввожу конец текущего месяца
	И     в таблице "ТабличнаяЧасть1" в поле с именем "ТабличнаяЧасть1РеквизитДата" я ввожу начало следующего месяца
	И     в таблице "ТабличнаяЧасть1" в поле с именем "ТабличнаяЧасть1РеквизитДата" я ввожу конец следующего месяца
	
	
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" в поле с заголовком "Реквизит дата" я ввожу текст "11.09.1983"
	И     в таблице "ТабличнаяЧасть1" я активизирую поле "Реквизит число"
	И     поле таблицы "ТабличнаяЧасть1" "ТабличнаяЧасть1РеквизитЧисло" равно переменной "ЗначениеРеквизитЧислоТаблица"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" из выпадающего списка с заголовком "Реквизит справочник" я выбираю "ТестовыйЭлемент21"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я изменяю флаг с заголовком "Реквизит булево"
	И     в таблице "ТабличнаяЧасть1" я снимаю флаг "Реквизит булево"
	И     в таблице "ТабличнаяЧасть1" я устанавливаю флаг "Реквизит булево"
	И     в таблице "ТабличнаяЧасть1" я снимаю флаг с именем "ТабличнаяЧасть1РеквизитБулево"
	И     в таблице "ТабличнаяЧасть1" я устанавливаю флаг с именем "ТабличнаяЧасть1РеквизитБулево"
	
	
	И     в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" из выпадающего списка с заголовком "Реквизит справочник" я выбираю "ТестовыйЭлемент21"
	
	
	
	И     в таблице "ТабличнаяЧасть1" поле "Реквизит строка" имеет значение "ТестСтрока"
	И     в таблице "ТабличнаяЧасть1" поле с именем "ТабличнаяЧасть1РеквизитСтрока" имеет значение "ТестСтрока"
	
	
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я выбираю значение реквизита с заголовком "Реквизит справочник выбор из формы списка" из формы списка
	Тогда открылось окно "Справочник2"
	И     В форме "Справочник2" в таблице "Список" я перехожу к строке:
		| Наименование      |
		| ТестовыйЭлемент21 |
	И     В форме "Справочник2" в ТЧ "Список" я выбираю текущую строку
	
#КонецОбласти	
	
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать"
	
	И я запоминаю количество строк таблицы "ТабличнаяЧасть1" как "КолСтрокТЧ1"
	И количество строк таблицы "ТабличнаяЧасть1" равно переменной "КолСтрокТЧ1"

#Область Проверка значений элементов формы
	Тогда элемент формы с именем "Код" стал равен "000000002"
	И     элемент формы с именем "Наименование" стал равен "Тестовый Элемент 2"
	И     значение поля с именем "Наименование" содержит текст "Тестовый"
	И     значение поля с именем "Наименование" не содержит текст "Значение которого нет"
	И     Проверяю шаги на Исключение:
		|'И     значение поля с именем "Наименование" содержит текст "Тестовый111"'|	
	
	И     элемент формы с именем "Реквизит1" стал равен "ЗначениеПеречисления1"
	И     элемент формы с именем "Реквизит2" стал равен "ТестовыйЭлемент21"
	И     элемент формы с именем "РеквизитЧисло" стал равен "12,34"
	И     элемент формы с именем "РеквизитСтрока" стал равен "тест"
	И     элемент формы с именем "РеквизитДата" стал равен "08.04.1981"
	И     элемент формы с именем "РеквизитБулево" стал равен "Да"
	И     элемент формы с именем "РеквизитПереключатель" стал равен "1"
	И     таблица формы с именем "ТабличнаяЧасть1" стала равной:
		| 'N' | 'Реквизит число' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '56,78'          |  '56,78'         | 'ТестСтрока'      | '11.09.1983'    | 'ТестовыйЭлемент21'                         | 'ТестовыйЭлемент21'   | 'Да'              |

	И     таблица "ТабличнаяЧасть1" стала равной по шаблону:
		| 'N' | 'Реквизит число' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '*,78'           |  '56,*'          | 'Т*тСт*ка'        | '11.*.1983'     | 'Тестов*Элемент21'                          | '*естовыйЭлемент2*'   | '*'               |

		
	И     таблица формы с именем "ТабличнаяЧасть1" содержит строки:
		| 'N' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '56,78'          | 'ТестСтрока'      | '11.09.1983'    | 'ТестовыйЭлемент21'                         | 'ТестовыйЭлемент21'   | 'Да'              |	

	И     таблица "ТабличнаяЧасть1" содержит строки из макета "СтрокиТабличнаяЧасть1"
	И     таблица "ТабличнаяЧасть1" содержит строки из макета "СтрокиТабличнаяЧасть1Шаблон" по шаблону

	И     таблица "ТабличнаяЧасть1" не содержит строки:
		| 'N' |
		| '2' |
		| '3' |
		
	И     таблица "ТабличнаяЧасть1" не содержит строки из макета "НеСтрокиТабличнаяЧасть1"
	
	#Проверим, что шаг, проверяющий отстутствие строки вызовет исключение, т.к. в макете указано значение 
	#	| 'N' |
	#	| '1' |
	Затем Проверяю шаги на Исключение:
        |'И     таблица "ТабличнаяЧасть1" не содержит строки из макета "МакетСПервойСтрокой"'|	
		
		
	И     таблица формы с именем "ТабличнаяЧасть1" содержит строки:
		| 'N' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '56,7*'          | '*'               | '11.09.1983'    | 'ТестовыйЭлемент*'                         | 'ТестовыйЭлемент21'   | 'Да'              |			
# Реквизит число специально указан два раза
		
		
	Тогда таблица формы с именем "ТабличнаяЧасть1" содержит изменения:
		| 'Реквизит число' |
		| '56,78'          |


		
		
	И     элемент формы с именем "Код1" стал равен "000000002"
	И     элемент формы с именем "Наименование2" стал равен "Тестовый Элемент 2"
	И     элемент формы с именем "Наименование1" стал равен "Тестовый Элемент 2"
	И     элемент формы с именем "Реквизит3" стал равен "ЗначениеПеречисления1"	

#КонецОбласти	
	И     Я нажмаю на кнопку Vanessa-Behavior "Забыть состояние формы TestClient"
	И     Я нажмаю на кнопку Vanessa-Behavior "ПолучитьИзмененияФормыGherkin"
	И     Пауза 2
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать и закрыть"

	
#Область Проверка созданного кода Gherkin по изменениям элементов формы
	
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Код" стал равен \'000000002\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Наименование" стал равен \'Тестовый Элемент 2\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Реквизит1" стал равен \'ЗначениеПеречисления1\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Реквизит2" стал равен \'ТестовыйЭлемент21\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитЧисло" стал равен \'12,34\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитСтрока" стал равен \'тест\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитДата" стал равен \'08.04.1981 0:00:00\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитБулево" стал равен \'Да''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитПереключатель" стал равен \'1\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'таблица "ТабличнаяЧасть1" стала равной:'
#	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка '| 'N' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |'
#	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка '| '1' | '56,78'          | 'ТестСтрока'      | '11.09.1983'    | 'ТестовыйЭлемент21'                         | 'ТестовыйЭлемент21'   | 'Да'              |'
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Код1" стал равен \'000000002\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Наименование2" стал равен \'Тестовый Элемент 2\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Наименование1" стал равен \'Тестовый Элемент 2\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Реквизит3" стал равен \'ЗначениеПеречисления1\''

#КонецОбласти		

	И я отменяю фиксирование формы
	
	
	Тогда в таблице "Список" текущая строка равна:
		| 'Реквизит1'             | 'Наименование'       |
		| 'ЗначениеПеречисления1' | 'Тестовый Элемент 2' |
	
	