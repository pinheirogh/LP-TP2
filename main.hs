import Data.List

type Medicamento = String

type Quantidade = Int

type Horario = Int

type EstoqueMedicamentos = [(Medicamento, Quantidade)]

type Prescricao = (Medicamento, [Horario])

type Receituario = [Prescricao]

type PlanoMedicamento = [(Horario, [Medicamento])]

type Plantao = [(Horario, [Cuidado])]

data Cuidado = Comprar Medicamento Quantidade | Medicar Medicamento

instance Show Cuidado where
  show (Comprar m q) =
    "Comprar "
      ++ Prelude.show q
      ++ " comprimido(s) do medicamento: "
      ++ m
  show (Medicar m) = "Ministrar medicamento: " ++ m

-- instance Eq Cuidado where
--   (Comprar m q) == (Comprar m' q') = m == m' && q == q'
--   (Medicar m) == (Medicar m') = m == m'
--   _ == _ = False

-- instance Ord Cuidado where
--   compare (Comprar m q) (Comprar m' q') = compare (m, q) (m', q')
--   compare (Medicar m) (Medicar m') = compare m m'
--   compare _ _ = EQ

med1 :: Medicamento
med1 = "Adera"

med2 :: Medicamento
med2 = "Alprazolam"

med3 :: Medicamento
med3 = "Donepezila"

med4 :: Medicamento
med4 = "Lactulona"

med5 :: Medicamento
med5 = "Mirtazapina"

med6 :: Medicamento
med6 = "Pantoprazol"

med7 :: Medicamento
med7 = "Patz"

med8 :: Medicamento
med8 = "Quetiapina"

med9 :: Medicamento
med9 = "Xarelto"

estoque1 :: EstoqueMedicamentos
estoque1 = [(med4, 10), (med6, 5), (med7, 0)]

estoque2 :: EstoqueMedicamentos
estoque2 = [(med4, 10), (med6, 5), (med7, 10)]

estoque3 :: EstoqueMedicamentos
estoque3 = [(med4, 10), (med6, 50), (med7, 10), (med8, 20)]

receituario1 :: Receituario
receituario1 = [(med4, [8, 17]), (med6, [6]), (med7, [22])]

receituario2 :: Receituario
receituario2 = [(med4, [8, 17]), (med6, [6]), (med7, [22]), (med8, [8, 22, 23])]

receituarioInvalido1 :: Receituario
-- Invalido: horário não está ordenado de forma crescente
receituarioInvalido1 = [(med4, [22, 10])]

receituarioInvalido2 :: Receituario
-- Invalido: medicamentos não estão ordenbados de forma crescente
receituarioInvalido2 = [(med4, [8, 17]), (med6, [6]), (med7, [22]), (med2, [8, 22, 23])]

receituarioInvalido3 :: Receituario
-- Invalido: medicamentos não estão ordenbados de forma crescente
receituarioInvalido3 = [(med4, [8, 17]), (med3, [6]), (med7, [22])]

receituarioInvalido4 :: Receituario
-- Invalido: horário não estão ordenbados de forma crescente
receituarioInvalido4 = [(med4, [8, 17]), (med6, [6]), (med7, [22]), (med8, [8, 23, 22])]

plano1 :: PlanoMedicamento
plano1 = [(6, [med6]), (8, [med4]), (17, [med4]), (22, [med7])]

plano2 :: PlanoMedicamento
plano2 = [(6, [med6]), (8, [med4, med8]), (17, [med4]), (22, [med7, med8]), (23, [med8])] :: [(Int, [String])]

planoInvalido1 :: PlanoMedicamento
-- Invalido: horário não está ordenado de forma crescente
planoInvalido1 = [(8, [med4]), (6, [med6]), (17, [med4]), (22, [med7])]

planoInvalido2 :: PlanoMedicamento
-- Invalido: medicamentos não estão ordenbados de forma crescente
planoInvalido2 = [(6, [med6]), (8, [med8, med4]), (17, [med4]), (22, [med7, med8]), (23, [med8])] :: [(Int, [String])]

planoInvalido3 :: PlanoMedicamento
-- Invalido: medicamentos não estão ordenbados de forma crescente
planoInvalido3 = [(6, [med6]), (8, [med4, med8]), (17, [med4]), (22, [med8, med7]), (23, [med8])] :: [(Int, [String])]

planoInvalido4 :: PlanoMedicamento
-- Invalido: horário não está ordenado de forma crescente
planoInvalido4 = [(6, [med6]), (8, [med4, med8]), (17, [med4]), (23, [med8]), (22, [med7, med8])] :: [(Int, [String])]

plantao1 :: Plantao
plantao1 =
  [ (6, [Medicar med6]),
    (8, [Medicar med4]),
    (17, [Medicar med4]),
    (22, [Medicar med7])
  ]

plantao2 :: Plantao
plantao2 =
  [ (6, [Medicar med6]),
    (8, [Medicar med4]),
    (17, [Medicar med4, Comprar med7 30]),
    (22, [Medicar med7])
  ]

plantao3 :: Plantao
plantao3 =
  [ (6, [Medicar med6, Medicar med9]),
    (8, [Medicar med2, Medicar med4]),
    (17, [Medicar med4, Comprar med7 30]),
    (22, [Medicar med7])
  ]

plantaoInvalido1 :: Plantao
plantaoInvalido1 =
  [ (6, [Medicar med6, Medicar med9]),
    (8, [Medicar med2, Medicar med4]),
    (22, [Medicar med7]),
    -- Invalido: não está em horario crescente
    (17, [Medicar med4, Comprar med7 30])
  ]

plantaoInvalido2 :: Plantao
plantaoInvalido2 =
  [ (6, [Medicar med6, Medicar med9]),
    (8, [Medicar med2, Medicar med4]),
    -- Invalido: comprar o mesmo medicamento no horário
    (17, [Medicar med4, Comprar med4 30]),
    (22, [Medicar med7])
  ]

plantaoInvalido3 :: Plantao
plantaoInvalido3 =
  [ (6, [Medicar med6, Medicar med9]),
    -- Invalido: ordem dos medicamentos não está ordenada
    (8, [Medicar med4, Medicar med2]),
    (17, [Medicar med4, Comprar med7 30]),
    (22, [Medicar med7])
  ]

plantaoInvalido4 :: Plantao
plantaoInvalido4 =
  [ (6, [Medicar med6]),
    -- Invalido: comprar o mesmo medicamento no horário
    (8, [Comprar med4 20, Medicar med4, Medicar med8]),
    (17, [Medicar med4]),
    (22, [Medicar med7, Medicar med8]),
    (23, [Medicar med8])
  ]


-- Questão 1
medicamentoNoEstoque :: Medicamento -> EstoqueMedicamentos -> Bool
medicamentoNoEstoque med [] = False
medicamentoNoEstoque med (x:xs) = 
  if med == (fst x) 
    then True 
  else medicamentoNoEstoque med xs

comprarMedicamento :: Medicamento -> Quantidade -> EstoqueMedicamentos -> EstoqueMedicamentos
comprarMedicamento medicamento quantidade [] = (medicamento, quantidade) : []
comprarMedicamento medicamento quantidade ((x_med, y_qtd):xs) =
  if (medicamentoNoEstoque medicamento ((x_med, y_qtd):xs)) 
    then (if medicamento == x_med 
            then (x_med, y_qtd + quantidade):xs 
          else (x_med, y_qtd):comprarMedicamento medicamento quantidade xs) 
  else (medicamento, quantidade):(x_med, y_qtd):xs

-- Questão 2
tomarMedicamento :: Medicamento -> EstoqueMedicamentos -> Maybe EstoqueMedicamentos
tomarMedicamento _ [] = Nothing
tomarMedicamento medicamento ((x_med, y_qtd):xs) = 
    if medicamento == x_med 
        then Just ((x_med, y_qtd - 1):xs)
    else tomarMedicamento medicamento xs

-- Questão 3
consultarMedicamento :: Medicamento -> EstoqueMedicamentos -> Quantidade
consultarMedicamento _ [] = 0
consultarMedicamento medicamento ((x_med, y_qtd):xs) = 
    if medicamento == x_med
        then y_qtd
    else consultarMedicamento medicamento xs

-- Questão 4
demandaMedicamentos :: Receituario -> EstoqueMedicamentos
demandaMedicamentos [] = []
demandaMedicamentos ((x_med, y_horarios):xs) = (x_med, length(y_horarios)):demandaMedicamentos xs

-- Questão 5
listaOrdenada :: Ord a => [a] -> Bool
listaOrdenada [] = True
listaOrdenada [_] = True
listaOrdenada (x:xs) = (x < head xs) && listaOrdenada xs

receituarioValido :: Receituario -> Bool
receituarioValido [] = True
receituarioValido receituario = listaOrdenada (map fst receituario) && all listaOrdenada (map snd receituario)

planoValido :: PlanoMedicamento -> Bool
planoValido [] = True
planoValido plano = listaOrdenada (map fst plano) && all listaOrdenada (map snd plano)


-- Questão 6

-- a = [x | x@(Comprar _ _) <- map head (map snd plantao2)]
-- [isMedicar y | y <- (map snd plantao2)]
-- [map isMedicar y | y <- (map snd plantao2)]
-- [y | y <- (map snd plantao2), all isMedicar y]
-- map(map(\(Medicar m) -> m)) [y | y <- (map snd plantaoInvalido3), all isMedicar y]

isMedicar :: Cuidado -> Bool
isMedicar (Medicar _) = True
isMedicar _ = False

isComprar :: Cuidado -> Bool
isComprar (Comprar _ _) = True
isComprar _ = False

-- SUBSTITUIDO POR FUNÇÃO ELEM
-- stringMatchesStringList :: String -> [String] -> Bool
-- stringMatchesStringList _ [] = False
-- stringMatchesStringList string (x:xs) = (string == x) || stringMatchesStringList string xs

stringListMatchesStringList :: [String] -> [String] -> Bool
stringListMatchesStringList [] _ = False
stringListMatchesStringList x y = 
  if elem (head x) y 
    then True 
  else stringListMatchesStringList (tail x) y

listOfStringListMatchesListOfStringList :: [[String]] -> [[String]] -> Bool
listOfStringListMatchesListOfStringList [] [] = False
listOfStringListMatchesListOfStringList x y = 
  if stringListMatchesStringList (head x) (head y) 
    then True 
  else listOfStringListMatchesListOfStringList (tail x) (tail y)

plantaoValido :: Plantao -> Bool
plantaoValido [] = True
plantaoValido plantao = listaOrdenada (map fst plantao) && all listaOrdenada listaMedicarFiltrada && not (listOfStringListMatchesListOfStringList listaMedicarFiltrada listaComprarFiltrada)
  where listaMedicarFiltrada = map(map(\(Medicar m) -> m)) [(filter isMedicar) y | y <- (map snd plantao)]
        listaComprarFiltrada = map(map(\(Comprar m q) -> m)) [(filter isComprar) y | y <- (map snd plantao)] 


-- Questão 7
concatenarHorarios :: [Horario] -> [Horario] -> [Horario]
concatenarHorarios [] _ = []
concatenarHorarios x y = y ++ x

ordenarListaHorarios :: [Horario] -> [Horario]
ordenarListaHorarios [] = []
ordenarListaHorarios [x] = [x]
ordenarListaHorarios (x:xs) = ordenarListaHorarios [y | y <- xs, y < x] ++ [x] ++ ordenarListaHorarios [y | y <- xs, y >= x] 

eliminarDuplicidades :: [Horario] -> [Horario]
eliminarDuplicidades [] = []
eliminarDuplicidades [x] = [x]
eliminarDuplicidades (x:y:xs) =
  if x == y
    then eliminarDuplicidades (y:xs)
  else x : eliminarDuplicidades (y:xs)

listaHorarios :: [[Horario]] -> [Horario] -> [Horario]
listaHorarios [] _ = []
listaHorarios (x:xs) y = eliminarDuplicidades . ordenarListaHorarios $ concatenarHorarios x y ++ listaHorarios xs y
-- listaHorarios (x:xs) y = eliminarDuplicidades(ordenarListaHorarios(concatenarHorarios x y ++ listaHorarios xs y))

horarioInListaHorarios :: Horario -> [Horario] -> Bool
horarioInListaHorarios _ [] = False
horarioInListaHorarios horario listaHorarios = 
  if elem horario listaHorarios
    then True
  else horarioInListaHorarios horario (tail listaHorarios)

-- ordenar lista de tuplas por primeiro elemento
ordenarListaTuplas :: Ord a => [(a, b)] -> [(a, b)]
ordenarListaTuplas [] = []
ordenarListaTuplas [x] = [x]
ordenarListaTuplas (x:xs) = ordenarListaTuplas [y | y <- xs, fst y < fst x] ++ [x] ++ ordenarListaTuplas [y | y <- xs, fst y >= fst x]

-- agrupar lista de tuplas por primeiro elemento sem usar fst e snd
agruparListaTuplas :: (Eq a, Ord a) => [(a, b)] -> [(a, [b])]
agruparListaTuplas [] = []
agruparListaTuplas [x] = [(fst x, [snd x])]
agruparListaTuplas (x:xs) =
  if fst x == fst(head xs)
    then (fst x, [snd x] ++ [snd (head xs)]) : agruparListaTuplas (tail xs)
  else (fst x, [snd x]) : agruparListaTuplas xs

-- elementoEstaNaLista :: Eq a -> [a] -> Bool
-- elementoEstaNaLista _ [] = False
-- elementoEstaNaLista elemento (x:xs) = 
--   if elemento == x
--     then True
--   else elementoEstaNaLista elemento xs

-- elem :: Eq a => a -> [a] -> Bool

-- geraReceituarioPlano :: PlanoMedicamento -> Receituario
-- geraPlanoReceituario :: Receituario -> [Horario]
-- geraPlanoReceituario receituario = 
  
--   a = listaHorarios (map snd receituario) []
--   b = [(horarioIndv, med) | (med, horariosX) <- receituario2, horarioIndv <- a, horarioIndv `elem` horariosX]
--   c = b


geraPlanoReceituario :: Receituario -> PlanoMedicamento
geraPlanoReceituario receituario = agruparListaTuplas . ordenarListaTuplas $ listaTuplas 
  where listaTuplas = [(horarioIndv, med) | (med, horariosX) <- receituario, horarioIndv <- listaHorariosFiltrada, horarioIndv `elem` horariosX]
        listaHorariosFiltrada = listaHorarios (map snd receituario) []
  
  -- agruparListaTuplas (ordenarListaTuplas ([(horarioIndv, med) | (med, horariosX) <- receituario2, horarioIndv <- (listaHorarios (map snd receituario) []), horarioIndv `elem` horariosX]))

-- [med | (med, horariosX) <- receituario, (Implementar função)horarioY in horarioX]
-- [med | (med, horariosX) <- receituario, horarioIndv <- horariosY, horarioIndv `elem` horarioX]
-- map(map(\elem y c -> y)) horariosX
-- a = geraPlanoReceituario receituario2
-- b = agruparListaTuplas . ordenarListaTuplas $ [(horarioIndv, med) | (med, horariosX) <- receituario2, horarioIndv <- a, horarioIndv `elem` horariosX]
-- [(horarioIndv, med) | (med, horariosX) <- receituario2, horarioIndv <- a, horarioIndv `elem` horariosX]


-- Questão 8
eliminarDuplicidadesMedicamentos :: [Medicamento] -> [Medicamento]
eliminarDuplicidadesMedicamentos [] = []
eliminarDuplicidadesMedicamentos [x] = [x]
eliminarDuplicidadesMedicamentos (x:y:xs) =
  if x == y
    then eliminarDuplicidadesMedicamentos (y:xs)
  else x : eliminarDuplicidadesMedicamentos (y:xs)

ordenarListaMedicamentos :: [Medicamento] -> [Medicamento]
ordenarListaMedicamentos [] = []
ordenarListaMedicamentos [x] = [x]
ordenarListaMedicamentos (x:xs) = ordenarListaMedicamentos [y | y <- xs, y < x] ++ [x] ++ ordenarListaMedicamentos [y | y <- xs, y >= x]  

concatenarMedicamentos :: [[Medicamento]] -> [Medicamento]
concatenarMedicamentos [] = []
concatenarMedicamentos (x:xs) = x ++ concatenarMedicamentos xs

ordenarListaTuplasMedicamentos :: [(Medicamento, [Horario])] -> [(Medicamento, [Horario])]
ordenarListaTuplasMedicamentos [] = []
ordenarListaTuplasMedicamentos [x] = [x]
ordenarListaTuplasMedicamentos (x:xs) = ordenarListaTuplasMedicamentos [y | y <- xs, fst y < fst x] ++ [x] ++ ordenarListaTuplasMedicamentos [y | y <- xs, fst y >= fst x] 

agruparListaTuplasMedicamentos :: (Eq a, Ord a) => [(a, [b])] -> [(a, [b])]
agruparListaTuplasMedicamentos [] = []
agruparListaTuplasMedicamentos [x] = [x]
agruparListaTuplasMedicamentos (x:xs) =
  if fst x == fst(head xs)
    then (fst x, snd x ++ snd (head xs)) : agruparListaTuplasMedicamentos (tail xs)
  else (fst x, snd x) : agruparListaTuplasMedicamentos xs

-- a = [med | (horario, med) <- plano1]
-- b = eliminarDuplicidadesMedicamentos. concatenarMedicamentos a  
-- c = [(medicamento, horario) | (horario, listaMed) <- plano1, medicamento <- b, elem medicamento listaMed]
-- d = ordenarListaTuplasMedicamentos c

geraReceituarioPlano :: PlanoMedicamento -> Receituario
geraReceituarioPlano plano = agruparListaTuplasMedicamentos . agruparListaTuplasMedicamentos . ordenarListaTuplasMedicamentos $ listaTuplasMedicamentos 
  where listaTuplasMedicamentos = [(medicamento, [horario]) | (horario, listaMed) <- plano, medicamento <- listaMedicamentosFiltrada, elem medicamento listaMed] 
        listaMedicamentosFiltrada = eliminarDuplicidadesMedicamentos . ordenarListaMedicamentos . concatenarMedicamentos $ listaMedicamentosBruta
        listaMedicamentosBruta = [listaMedicamentos | (horario, listaMedicamentos) <- plano] 




-- Questão 9 
-- Questão 10
-- Questão 11