# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb
@IgnoreOn836
@IgnoreOn837
@IgnoreOn838



Функционал: Проверка работы определения шага после цикла


Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	
	
Сценарий: Проверка работы определения шага после цикла
	Когда Я открываю VanessaAutomation в режиме TestClient со стандартной библиотекой
	И В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ДляПроверкиОпределенияШагаПослеЦикла"
	И Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Automation TestClient
	
	#Сделаем переход ко второй строке
	И     в таблице "ДеревоТестов" я разворачиваю строку:
		| 'Наименование'   |
		| '*Первая группа' |
		
	И     в таблице "ДеревоТестов" я перехожу к строке:
		| 'Наименование'                                                           |
		| 'И Я запоминаю значение выражения "2" в переменную "ТестоваяПеременная"' |
	
	И  я снимаю флаг "Сценарии выполнены"
	#И     в таблице "ДеревоТестов" я нажимаю на кнопку "Выполнить с текущего шага"
	И я выбираю пункт контекстного меню "Выполнить с текущего шага" на элементе формы с именем "ДеревоТестов"
	И     у элемента "Сценарии выполнены" я жду значения "Да" в течение 50 секунд
	И     элемент формы с именем "Статистика" стал равен "1/1/14, 11/0/0"
