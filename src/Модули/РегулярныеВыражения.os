Функция ПолучитьДочерниеЭлементыОписанияКонфигурации(Знач СодержимоеФайла) Экспорт
	
	Элементы = Новый Структура("Количество,ДочерниеЭлементыСтрока,Совпадения", 0, "", Неопределено);
	
	Регексп = Новый РегулярноеВыражение("(<ChildObjects>\s+?)([\w\W]+?)(\s+<\/ChildObjects>)");
	Регексп.ИгнорироватьРегистр = Истина;
	Регексп.Многострочный = Истина;
	
	ДочерниеЭлементы = Регексп.НайтиСовпадения(СодержимоеФайла);
	Элементы.Количество = ДочерниеЭлементы.Количество();
	Элементы.Совпадения = ДочерниеЭлементы;
	
	Если НЕ Элементы.Количество = 0 Тогда // Если количество 0 вернется пустая коллекция
		
		Элементы.ДочерниеЭлементыСтрока = ДочерниеЭлементы[0].Группы[2].Значение;
		РегекспМетаданные = Новый РегулярноеВыражение("^\s+<([\w]+)>([а-яa-zA-ZА-Я0-9_]+)<\/[\w]+>");
		РегекспМетаданные.ИгнорироватьРегистр = Истина;
		РегекспМетаданные.Многострочный = Истина;
		Элементы.Совпадения = РегекспМетаданные.НайтиСовпадения(Элементы.ДочерниеЭлементыСтрока);
		
	КонецЕсли;
	
	Возврат Элементы;

КонецФункции