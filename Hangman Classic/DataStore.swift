//
//  DataStore.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 24.04.2023.
//

final class DataStore {
    let easyWords = [
        "автомобиль",
        "банан",
        "гитара",
        "дерево",
        "единорог",
        "жираф",
        "зонт",
        "игрушка",
        "корабль",
        "лампа",
        "молоток",
        "ноутбук",
        "обезьяна",
        "птица",
        "ракета",
        "собака",
        "телефон",
        "улитка",
        "фламинго",
        "холодильник",
        "цветок",
        "шарик",
        "электроника",
        "юбка",
        "яблоко",
        "камень",
        "кот",
        "книга",
        "кран",
        "лестница",
        "лиса",
        "лодка",
        "лампочка",
        "медведь",
        "медаль",
        "микроскоп",
        "музыка",
        "наушники",
        "носок",
        "огонь",
        "парашют",
        "перчатка",
        "полицейский",
        "радио",
        "рыба",
        "самолет",
        "солнце",
        "стол",
        "сумка",
        "танк",
        "топор",
        "треугольник",
        "уголь",
        "фонарь",
        "футбол",
        "хирург",
        "церковь",
        "шампунь",
        "шляпа",
        "электричество",
        "ювелир",
        "ягода",
        "картина",
        "карман",
        "карандаш",
        "кастрюля",
        "кольцо",
        "компас",
        "крокодил",
        "кровать",
        "корова",
        "конь",
        "кролик",
        "котелок",
        "лира",
        "лук",
        "магнит",
        "медицина",
        "мяч",
        "нож",
        "носорог",
        "обувь",
        "овощ",
        "пальма",
        "перо",
        "печенье",
        "пианино",
        "пылесос",
        "робот",
        "рыцарь",
        "светофор",
        "стул",
        "сумасшедший",
        "такси",
        "телевизор",
        "тополь",
        "троллейбус",
        "угол",
        "фестиваль",
        "фортепиано",
        "хлеб",
        "царь",
        "часы",
        "шарф"
]

    let mediumWords = [
        "батарея",
        "бензин",
        "бизнес",
        "блюдо",
        "бронза",
        "валюта",
        "вдова",
        "вектор",
        "векция",
        "вертолет",
        "весна",
        "вещество",
        "виноград",
        "висок",
        "витамин",
        "власть",
        "внук",
        "возраст",
        "воздух",
        "волна",
        "воск",
        "выпуск",
        "гармония",
        "гектар",
        "генератор",
        "глазок",
        "голова",
        "горшок",
        "гостиница",
        "гранит",
        "гроза",
        "грунт",
        "группа",
        "дальномер",
        "дама",
        "декада",
        "джаз",
        "джинсы",
        "диаметр",
        "диван",
        "дипломат",
        "дисциплина",
        "длина",
        "добыча",
        "документ",
        "домик",
        "доска",
        "дочь",
        "дракон",
        "душа",
        "дырка",
        "евро",
        "ежедневник",
        "жаба",
        "жало",
        "жара",
        "жасмин",
        "желание",
        "железо",
        "жемчуг",
        "жеребец",
        "жест",
        "жизнь",
        "жила",
        "жир",
        "журнал",
        "заголовок",
        "закон",
        "замок",
        "заряд",
        "звезда",
        "земляника",
        "зерно",
        "зима",
        "знак",
        "золото",
        "зона",
        "игрушка",
        "идея",
        "издание",
        "изумруд",
        "икона",
        "индекс",
        "инструмент",
        "интернет",
        "искра",
        "источник",
        "кабель",
        "кабина",
        "кадр",
        "камера",
        "каникулы",
        "капитал",
        "карман",
        "кассета",
        "катер",
        "кафе",
        "кинотеатр",
        "кисть",
        "класс",
        "клиент",
        "книга",
        "кнопка",
        "ковер",
        "колесо",
        "команда",
        "конфета",
        "копия",
        "корзина",
        "корм",
        "коробка",
        "космос",
        "костюм",
        "корабль"
        ]
    
    let hardWords = [
        "фрагментация",
        "термодинамика",
        "экстраполяция",
        "амальгамация",
        "перспективность",
        "преципитат",
        "полигон",
        "политология",
        "перспективность",
        "периферия",
        "парадокс",
        "продвижение",
        "антропоморфизм",
        "аналитика",
        "вульгаризация",
        "вариабельность",
        "гиперболизация",
        "гомеостаз",
        "геноцид",
        "дефолт",
        "деструктуризация",
        "экстремизм",
        "экспансия",
        "экспериментатор",
        "экстравагантность",
        "экзотика",
        "эндокринология",
        "эпистемология",
        "эволюция",
        "антропогенез",
        "актуализация",
        "акцентуация",
        "автократия",
        "абсентеизм",
        "блокада",
        "бездействие",
        "бюрократия",
        "биохимия",
        "безграничность",
        "болезненность",
        "бесконечность",
        "вариантность",
        "величественность",
        "гедонизм",
        "грандиозность",
        "герметизм",
        "гештальт",
        "декаданс",
        "дифференциация",
        "дискуссионность",
        "детерминизм",
        "эпигонство",
        "элегантность",
        "экспертность",
        "эволюционизм",
        "эйдетика",
        "эротизм",
        "эстетика",
        "элементарность",
        "эконометрика",
        "эклектика",
        "эгоизм",
        "эмпиризм",
        "экспроприация",
        "экстаз",
        "экзекуция",
        "эквивалентность",
        "эксперимент",
        "эксцентричность",
        "экспрессия",
        "экспоненциальность",
        "экспозиция",
        "эффективность",
        "эффектность",
        "этнография",
        "энциклопедия",
        "энергичность",
        "эмиграция",
        "экспериментальность",
        "эндемизм",
        "эвристика",
        "эзотерика",
        "эволюционирование",
        "экранирование"
        ]
    
    let impossibleWords = [
        "достопримечательность",
        "переосвидетельствование",
        "высокопревосходительство",
        "человеконенавистничество",
        "адъюнктство",
        "бургомистрство",
        "контрстратегия",
        "ротмистрство",
        "забулдыжничество",
        "чиуауа",
        "гермафродит",
        "баржестроение",
        "Штангенциркуль",
        "Чересполосица",
        "Постфактум",
        "Тропосфера",
        "Эквайринг"
    ]
        
}
