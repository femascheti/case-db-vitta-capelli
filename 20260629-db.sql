CREATE DATABASE IF NOT EXISTS sistema_base;
USE sistema_base;

-- ------------------------------------------------------------
-- Tabela: Pessoa
-- Representa qualquer entidade humana no sistema
-- (usuário, cliente, colaborador, participante, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS pessoa (
    id_pessoa              INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE,
    data_nascimento DATE,
    telefone        VARCHAR(20),
    status_pessoa          VARCHAR(20) DEFAULT 'ativo'
);

-- ------------------------------------------------------------
-- Tabela: Item
-- Representa qualquer recurso, produto ou elemento do sistema
-- (produto, livro, equipamento, serviço, vaga, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS item (
    id_item                    INT AUTO_INCREMENT PRIMARY KEY,
    nome                  VARCHAR(100) NOT NULL,
    categoria             VARCHAR(50),
    descricao             TEXT,
    valor                 DECIMAL(10, 2),
    quantidade_disponivel INT DEFAULT 0
);

-- ------------------------------------------------------------
-- Tabela: Registro
-- Representa uma relação entre Pessoa e Item
-- (compra, empréstimo, inscrição, reserva, etc.)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS registro (
    id_registro           INT AUTO_INCREMENT PRIMARY KEY,
    id_pessoa    INT NOT NULL,
    id_item      INT NOT NULL,
    data_registro DATE DEFAULT NULL,
    observacao   TEXT,
    status_registro       VARCHAR(20) DEFAULT 'pendente',
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
    FOREIGN KEY (id_item)   REFERENCES item(id_item)
);

-- ------------------------------------------------------------
-- Dados
-- Quais outros dados poderiam fazer parte do seu banco?
-- ------------------------------------------------------------
INSERT INTO pessoa (nome, email, telefone, data_nascimento, status_pessoa) VALUES
('Ana Carolina Souza', 'ana.souza@email.com', '(11) 98765-1234', '1995-03-15', 'Ativo'),
('Beatriz Lima Santos', 'beatriz.lima@email.com', '(11) 99874-4567', '1992-07-21', 'Ativo'),
('Camila Ferreira Alves', 'camila.alves@email.com', '(11) 97654-3210', '1988-11-05', 'Ativo'),
('Daniela Oliveira Rocha', 'daniela.rocha@email.com', '(11) 96543-2198', '1997-02-18', 'Ativo'),
('Eduarda Martins Silva', 'eduarda.silva@email.com', '(11) 95432-1876', '1999-09-10', 'Inativo'),
('Fernanda Costa Pereira', 'fernanda.costa@email.com', '(11) 94321-1765', '1990-06-30', 'Ativo'),
('Gabriela Mendes Ribeiro', 'gabriela.ribeiro@email.com', '(11) 93210-1654', '1994-12-08', 'Ativo'),
('Helena Barbosa Gomes', 'helena.gomes@email.com', '(11) 92109-1543', '1987-08-12', 'Ativo'),
('Isabela Rodrigues Castro', 'isabela.castro@email.com', '(11) 91098-1432', '1996-01-27', 'Ativo'),
('Juliana Moreira Lopes', 'juliana.lopes@email.com', '(11) 99987-1321', '1993-04-09', 'Inativo'),
('Karina Almeida Freitas', 'karina.freitas@email.com', '(11) 98876-1210', '1989-05-17', 'Ativo'),
('Larissa Nogueira Dias', 'larissa.dias@email.com', '(11) 97765-1109', '2000-10-03', 'Ativo'),
('Mariana Cardoso Pinto', 'mariana.pinto@email.com', '(11) 96654-1098', '1991-07-14', 'Ativo'),
('Natália Teixeira Ramos', 'natalia.ramos@email.com', '(11) 95543-0987', '1998-03-22', 'Ativo'),
('Patrícia Araújo Fernandes', 'patricia.fernandes@email.com', '(11) 94432-0876', '1986-09-01', 'Ativo'),
('Renata Carvalho Moraes', 'renata.moraes@email.com', '(11) 93321-0765', '1995-12-19', 'Ativo'),
('Sabrina Batista Cunha', 'sabrina.cunha@email.com', '(11) 92210-0654', '1997-06-11', 'Inativo'),
('Tatiane Vieira Campos', 'tatiane.campos@email.com', '(11) 91109-0543', '1992-01-04', 'Ativo'),
('Vanessa Ribeiro Melo', 'vanessa.melo@email.com', '(11) 90098-0432', '1985-11-28', 'Ativo'),
('Yasmin Lopes Andrade', 'yasmin.andrade@email.com', '(11) 98987-0321', '2001-08-16', 'Ativo');


INSERT INTO item (nome, categoria, descricao, valor, quantidade_disponivel) VALUES
('Hidratação Express', 'Hidratação', 'Tratamento rápido para reposição de água dos fios.', 60.00, 999),
('Hidratação Profunda', 'Hidratação', 'Tratamento intensivo para cabelos ressecados.', 90.00, 999),
('Nutrição Capilar', 'Nutrição', 'Reposição de lipídios e brilho.', 85.00, 999),
('Reconstrução Capilar', 'Reconstrução', 'Reposição de queratina para fios danificados.', 120.00, 999),
('Cauterização', 'Reconstrução', 'Tratamento para fortalecimento dos fios.', 150.00, 999),
('Botox Capilar', 'Alinhamento', 'Redução de volume e hidratação.', 180.00, 999),
('Progressiva', 'Alisamento', 'Alisamento dos fios com redução de frizz.', 250.00, 999),
('Escova Simples', 'Finalização', 'Escova modeladora.', 45.00, 999),
('Escova com Babyliss', 'Finalização', 'Escova com modelagem em cachos.', 65.00, 999),
('Corte Feminino', 'Corte', 'Corte personalizado.', 70.00, 999),
('Corte Masculino', 'Corte', 'Corte moderno.', 45.00, 999),
('Lavagem Capilar', 'Higienização', 'Lavagem com shampoo profissional.', 25.00, 999),
('Cronograma Capilar', 'Tratamento', 'Sequência de hidratação, nutrição e reconstrução.', 220.00, 999),
('Selagem Capilar', 'Alisamento', 'Redução de frizz e alinhamento dos fios.', 200.00, 999),
('Matização', 'Coloração', 'Neutralização de tons amarelados.', 90.00, 999),
('Coloração Completa', 'Coloração', 'Aplicação de coloração em todo o cabelo.', 180.00, 999),
('Retoque de Raiz', 'Coloração', 'Coloração apenas na raiz.', 110.00, 999),
('Umectação', 'Nutrição', 'Tratamento com óleos vegetais.', 75.00, 999),
('Peeling Capilar', 'Tratamento', 'Limpeza profunda do couro cabeludo.', 95.00, 999),
('Massagem Capilar', 'Relaxamento', 'Massagem para estimular a circulação do couro cabeludo.', 50.00, 999);

INSERT INTO registro (id_pessoa, id_item, data_registro, observacao, status_registro) VALUES
(1, 1, '2026-01-10', 'Cabelo levemente ressecado.', 'Concluído'),
(2, 7, '2026-01-12', 'Aplicado protetor térmico.', 'Concluído'),
(3, 4, '2026-01-15', 'Reconstrução com queratina.', 'Concluído'),
(4, 10, '2026-01-18', 'Corte em camadas.', 'Concluído'),
(5, 3, '2026-01-20', 'Nutrição com óleo de argan.', 'Cancelado'),
(6, 5, '2026-01-21', 'Fios muito danificados.', 'Concluído'),
(7, 2, '2026-01-22', 'Hidratação intensiva.', 'Concluído'),
(8, 8, '2026-01-24', 'Escova lisa.', 'Concluído'),
(9, 15, '2026-01-25', 'Matização platinada.', 'Concluído'),
(10, 16, '2026-01-27', 'Coloração castanho escuro.', 'Concluído'),
(11, 14, '2026-02-01', 'Selagem sem formol.', 'Concluído'),
(12, 18, '2026-02-03', 'Umectação com óleo de coco.', 'Concluído'),
(13, 6, '2026-02-05', 'Botox capilar.', 'Concluído'),
(14, 20, '2026-02-07', 'Massagem relaxante.', 'Concluído'),
(15, 13, '2026-02-09', 'Início do cronograma capilar.', 'Agendado'),
(16, 11, '2026-02-10', 'Corte tradicional.', 'Concluído'),
(17, 19, '2026-02-12', 'Peeling no couro cabeludo.', 'Concluído'),
(18, 17, '2026-02-15', 'Retoque da raiz.', 'Concluído'),
(19, 9, '2026-02-18', 'Escova com babyliss.', 'Cancelado'),
(20, 12, '2026-02-20', 'Lavagem antes da hidratação.', 'Concluído'),
(1, 5, '2026-03-01', 'Segunda sessão de cauterização.', 'Concluído'),
(2, 2, '2026-03-03', 'Manutenção da hidratação.', 'Concluído'),
(3, 13, '2026-03-05', 'Segunda etapa do cronograma.', 'Concluído'),
(4, 8, '2026-03-07', 'Escova para evento.', 'Concluído'),
(5, 15, '2026-03-08', 'Matização loiro.', 'Agendado'),
(6, 10, '2026-03-09', 'Apenas corte das pontas.', 'Concluído'),
(7, 18, '2026-03-10', 'Tratamento nutritivo.', 'Concluído'),
(8, 3, '2026-03-12', 'Nutrição intensa.', 'Concluído'),
(9, 1, '2026-03-15', 'Hidratação rápida.', 'Concluído'),
(10, 6, '2026-03-17', 'Botox para redução de volume.', 'Concluído'),
(11, 7, '2026-03-20', 'Progressiva de manutenção.', 'Agendado'),
(12, 16, '2026-03-22', 'Nova coloração.', 'Concluído'),
(13, 19, '2026-03-24', 'Peeling preventivo.', 'Concluído'),
(14, 11, '2026-03-25', 'Corte masculino social.', 'Concluído'),
(15, 4, '2026-03-26', 'Reconstrução pós-coloração.', 'Concluído'),
(16, 20, '2026-03-27', 'Massagem relaxante.', 'Concluído'),
(17, 9, '2026-03-28', 'Finalização para festa.', 'Concluído'),
(18, 14, '2026-03-29', 'Selagem capilar.', 'Agendado'),
(19, 17, '2026-03-30', 'Retoque da raiz.', 'Concluído'),
(20, 2, '2026-03-31', 'Hidratação profunda.', 'Concluído');

-- ------------------------------------------------------------
-- Agora:
-- 1. Defina o contexto do seu sistema (Fase 1)
-- 2. Gere dados coerentes com esse contexto com IA (Fase 2)
--    e adicione os dados usando INSERT
-- 3. Formule suas perguntas e escreva os comandos abaixo (Fase 3)
-- ------------------------------------------------------------

-- Pergunta 1 (UPDATE):
-- Uma cliente fez um atendimento de hidratação que ainda está como "agendado", mas ela já compareceu e o serviço foi concluído. Como atualizamos o status desse registro para "concluído"?
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]


-- Pergunta 2 (DELETE):
-- Um cliente cancelou um agendamento e a empresa decidiu remover registros de atendimentos cancelados há mais de um ano para manter a base organizada. Como excluímos esses registros antigos?
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]


-- Pergunta 3 (ALTER TABLE):
-- O salão percebeu que, além das observações em texto livre, seria útil registrar se a cliente tem alguma alergia conhecida, algo que precisa aparecer rapidamente, sem precisar ler todo o campo de observação. Como adicionamos essa informação como uma nova coluna na tabela pessoa?
-- [agora escreva o código que ajuda a responder essa pergunta logo abaixo]
