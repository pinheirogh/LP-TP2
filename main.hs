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
comprarMedicamento :: Medicamento -> Quantidade -> EstoqueMedicamentos -> EstoqueMedicamentos
comprarMedicamento medicamento quantidade [] = (medicamento, quantidade) : []
comprarMedicamento medicamento quantidade ((x_med, y_qtd):xs) =
    if medicamento == x_med
        then (x_med, y_qtd + quantidade):xs
    else (x_med, y_qtd):comprarMedicamento medicamento quantidade xs

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

stringMatchesStringList :: String -> [String] -> Bool
stringMatchesStringList _ [] = False
stringMatchesStringList string (x:xs) = (string == x) || stringMatchesStringList string xs

stringListMatchesStringList :: [String] -> [String] -> Bool
stringListMatchesStringList [] _ = False
stringListMatchesStringList x y = 
  if stringMatchesStringList (head x) y 
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

-- geraPlanoReceituario :: Receituario -> PlanoMedicamento


-- Questão 8
-- Questão 9 
-- Questão 10
-- Questão 11