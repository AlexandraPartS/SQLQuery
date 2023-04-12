Задание: в базе данных MS SQL Server есть продукты и категории. Одному продукту может соответствовать много категорий, в одной категории может быть много продуктов. Напишите SQL запрос для выбора всех пар «Имя продукта – Имя категории». Если у продукта нет категорий, то его имя все равно должно выводиться.

Реализация:
СУБД: MS SQL Server, версия LocalDB
Средство администрирования: MVS
Для работы с БД (создание, работа с данными, проверка выполнения запроса) используется скрипт на языке SQL (файл "SQLQuery1.sql")
Для выполнения запроса многие ко многим в MS SQL Server: для установки связей многие ко многим между двумя таблицами (Products, Categoryes) используется дополнительная таблица (Product_Categoryes), представляющая отдельную сущность.
Код запроса: 

SELECT ProductTitle, CategoryTitle
FROM Products
     LEFT JOIN 

     (SELECT CategoryTitle, ProductId
      FROM Categoryes
      JOIN Product_Categoryes
      ON Categoryes.Id = Product_Categoryes.CategoryesId) AS CATEGORYNew

      ON CATEGORYNew.ProductId = Products.Id



