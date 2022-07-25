type Medicamento = String

type Quantidade = Int

type Horario = Int

type EstoqueMedicamentos = [(Medicamento, Quantidade)]

type Prescricao = (Medicamento, [Horario])

type Receituario = [Prescricao]

type PlanoMedicamento = [(Horario, [Medicamento])]

type Plantao = [(Horario, [Cuidado])]

data Cuidado = Comprar Medicamento Quantidade | Medicar Medicamento

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
-- Questão 6
-- Questão 7
-- Questão 8
-- Questão 9 
-- Questão 10
-- Questão 11