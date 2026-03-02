BEGIN;

-- =========================
-- EDUCATION
-- =========================

INSERT INTO education (id, institution, course, start_date, end_date, created_at, degree)
VALUES
('1e9104c8-fea7-4076-ba03-30e357dd512f', 'UNIP', 'Análise e Desenvolvimento de Sistemas', '2021-01-01', '2022-12-01', '2026-03-01 00:47:30.361473', 'Nivel Superior'),
('6b47ed31-c3e4-421f-9940-9353875a5540', 'FATEC (Rubens Lara)', 'Gestão Portuaria', '2017-01-01', '2020-06-01', '2026-03-01 00:47:30.361473', 'Nivel Superior')
ON CONFLICT (id) DO UPDATE SET
  institution = EXCLUDED.institution,
  degree = EXCLUDED.degree,
  course = EXCLUDED.course,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date,
  created_at = EXCLUDED.created_at
;

-- =========================
-- EXPERIENCES
-- =========================

INSERT INTO experiences (id, company, job_title, start_date, end_date, created_at)
VALUES
('b3a8641d-4f20-455a-9929-f71829597b1a', 'Bauk Tech', 'Desenvolvedor Fullstack Pleno', '2023-09-01', NULL, '2026-02-28 19:44:16.971086'),
('871eaabd-f121-4bda-90ee-3925807a8bed', 'CBYK', 'Analista de Desenvolvimento de Sistemas', '2022-06-01', '2023-10-01', '2026-02-28 19:44:23.812791'),
('7189368a-450a-4b34-a98a-5aaabf9cd5c3', 'Grumft', 'Estágio em Desenvolvimento Backend', '2021-09-01', '2022-02-01', '2026-02-28 19:44:30.473089'),
('0586f066-c273-49ca-bfd4-754c5e1d807d', 'Kelda', 'Estágio em Desenvolvimento Fullstack', '2021-02-01', '2021-07-01', '2026-02-28 19:44:38.143868')
ON CONFLICT (id) DO UPDATE SET
  company = EXCLUDED.company,
  job_title = EXCLUDED.job_title,
  start_date = EXCLUDED.start_date,
  end_date = EXCLUDED.end_date,
  created_at = EXCLUDED.created_at
;

-- =========================
-- EXPERIENCE_HIGHLIGHTS
-- =========================

INSERT INTO experience_highlights (id, experience_id, description)
VALUES
('4953467f-fcc6-4393-a2fb-667aa3bc3d44', 'b3a8641d-4f20-455a-9929-f71829597b1a', 'Liderei a refatoração da API .NET legada para uma arquitetura multi-tenant, unificando portais por cliente em um único portal multi-projeto por meio do desenvolvimento de middleware integrado a configurações no PostgreSQL, reduzindo custos operacionais e simplificando a manutenção.'),
('36abc6f2-42f4-4113-9aa6-9c1be83f3ccd', 'b3a8641d-4f20-455a-9929-f71829597b1a', 'Desenvolvi pipelines de processamento financeiro em Node.js (TypeScript) com processos configuráveis por cliente, incluindo aplicação de taxas de juros, gestão de estoque e cálculos financeiro, geração de CNAB e automação de fluxos regulatórios.'),
('490f39f3-6f87-419b-afc0-58e9187bbbda', 'b3a8641d-4f20-455a-9929-f71829597b1a', 'Otimizei o processamento de grandes volumes de dados com paralelismo
(subdivisão de volumes, paginação, bulk insert e escrita em stream), aumentando
performance e estabilidade.'),
('19bb1b9e-3538-4e16-aa09-bec975ec8b3a', 'b3a8641d-4f20-455a-9929-f71829597b1a', 'Estruturei a comunicação entre orquestrador e workers via mensageria,
permitindo a execução dinâmica de pipelines baseada em configuração.'),
('82843a99-ebe4-412f-a38a-96567442945e', '871eaabd-f121-4bda-90ee-3925807a8bed', 'Alocada em projeto que posteriormente se consolidou como BAUK (fintech de
soluções FIDC)'),
('77897af5-6e1d-4b70-9c61-f791fd6a2a28', '871eaabd-f121-4bda-90ee-3925807a8bed', 'Atuei no desenvolvimento e manutenção de APIs backend em Node.js
(TypeScript) e C# (.NET), integradas a front-end em Vue.js e serviços em cloud (AWS, GCP).'),
('2573a94b-1f55-4adf-a7c7-f5f8003ed682', '871eaabd-f121-4bda-90ee-3925807a8bed', 'Participei da construção de funcionalidades para sistemas financeiros,
colaborando com times ágeis na entrega contínua de novas features.'),
('e24d6ac7-4fe4-4631-8c14-f4e791eca8f1', '871eaabd-f121-4bda-90ee-3925807a8bed', 'Apoiei integrações entre microsserviços, banco de dados e aplicações web,
garantindo estabilidade e evolução do produto.'),
('2d615520-575f-4848-89a0-1dc474160a86', '7189368a-450a-4b34-a98a-5aaabf9cd5c3', 'Atuei no desenvolvimento de soluções internas em PHP (Laravel), incluindo
criação de funcionalidades e interfaces utilizando Blade.'),
('f50a0e84-9e90-4039-9a66-442abe523466', '7189368a-450a-4b34-a98a-5aaabf9cd5c3', 'Desenvolvi uma plataforma interna para consolidação de informações de
colaboradores, apoiando processos administrativos e de RH.'),
('3929ea3c-f71c-4ee9-bd3d-b05d154d37ff', '7189368a-450a-4b34-a98a-5aaabf9cd5c3', 'Trabalhei em ambiente Linux, com integração a banco de dados e versionamento
de código.'),
('81cb837b-8772-4697-9eb2-519d18ce4ba0', '0586f066-c273-49ca-bfd4-754c5e1d807d', 'Atuei no desenvolvimento de sistemas web de ponta a ponta, desde prototipação (Adobe XD) até implementação de interfaces em HTML e CSS.'),
('196eeb94-adad-4af3-879f-82562f4ed544', '0586f066-c273-49ca-bfd4-754c5e1d807d', 'Participei da construção de funcionalidades backend em PHP (Laravel),
integrando front-end, regras de negócio e banco de dados.'),
('280b48c9-723b-469e-b497-2a8c26dec78a', '0586f066-c273-49ca-bfd4-754c5e1d807d', 'Aprendi e utilizei ambiente Linux, versionamento com Git e boas práticas de desenvolvimento no ciclo completo da aplicação.')
ON CONFLICT (id) DO UPDATE SET
  experience_id = EXCLUDED.experience_id,
  description = EXCLUDED.description
;

-- =========================
-- SKILLS
-- =========================

INSERT INTO skills (id, name, category, created_at)
VALUES
('dbc40492-113c-4228-9576-cff7579dfdcc', 'Node.js', 'backend', '2026-03-01 00:11:33.137157'),
('901273d2-6fa8-4072-8455-8b584075035c', 'TypeScript', 'backend', '2026-03-01 00:11:33.137157'),
('8325613a-d63e-4d33-8ced-1c5066b9c404', 'Express', 'backend', '2026-03-01 00:11:33.137157'),
('4cfa7069-00ee-46bf-9353-4b6cf909a484', 'Nest', 'backend', '2026-03-01 00:11:33.137157'),
('7bff68fc-887d-4e81-960b-1f3121534ecb', '.NET', 'backend', '2026-03-01 00:11:33.137157'),
('8f198ccf-83b2-4a6d-834d-bf2e36df2b98', 'PHP', 'backend', '2026-03-01 00:11:33.137157'),
('9c35ab81-6e0f-46fe-a6f0-d383b5f50049', 'Laravel', 'backend', '2026-03-01 00:11:33.137157'),
('2724bc5f-c0eb-4cfa-945e-1101ba303026', 'Vue.js', 'frontend', '2026-03-01 00:11:33.137157'),
('73db23a8-afaa-4008-a5cb-8520eafdae99', 'PostgreSQL', 'database', '2026-03-01 00:11:33.137157'),
('2bb27bc9-aa5b-4c7f-9d07-de2c384233ff', 'MySQL', 'database', '2026-03-01 00:11:33.137157'),
('a5f93d88-2340-4707-bbad-f7541f5c56d1', 'DynamoDB', 'database', '2026-03-01 00:11:33.137157'),
('582a6743-87ec-4f87-9144-3a189fca59b1', 'Linux', 'os', '2026-03-01 00:11:33.137157'),
('3c555864-896d-4269-9288-bae0dd2dba36', 'Docker', 'devops', '2026-03-01 00:11:33.137157'),
('ceb0e9d2-1876-47b6-9720-2256b8ced1d9', 'AWS S3', 'cloud', '2026-03-01 00:13:34.573536'),
('3cba7043-3a83-4129-869e-da394f913653', 'AWS SQS', 'cloud', '2026-03-01 00:13:34.573536'),
('c72e4c55-d72b-424d-bb5e-c8d3e5157540', 'AWS Systems Manager Parameter Store', 'cloud', '2026-03-01 00:13:34.573536'),
('c2c0dd86-e5bc-41fd-a92b-9ad3f3a950f0', 'AWS Step Functions', 'cloud', '2026-03-01 00:13:34.573536'),
('b3a8e69e-2cb1-4f54-a498-cfd89772edff', 'AWS Lambda', 'cloud', '2026-03-01 00:13:34.573536'),
('275a96ca-a303-41df-9856-fea67589786e', 'GCP Cloud Storage', 'cloud', '2026-03-01 00:13:34.573536'),
('70dc6ea1-e5f5-463d-9284-2b716257f4c6', 'GCP Cloud Run', 'cloud', '2026-03-01 00:13:34.573536'),
('d9814e22-6ea3-4aac-8aa7-f8ab9b12cef0', 'GCP Cloud Run Functions', 'cloud', '2026-03-01 00:13:34.573536'),
('e19a271d-36d2-4448-b130-b7aa7c90fae8', 'Jest', 'testing', '2026-03-01 00:13:34.573536'),
('e2bfb52d-37ac-4c19-88af-cb0160cb6a1c', 'Javascript', 'frontend', '2026-03-01 00:35:55.645767'),
('5a068efb-1d0a-4e8a-82e9-90cf2ee3f7f6', 'AdobeXD', 'design', '2026-03-01 00:35:55.645767')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  category = EXCLUDED.category,
  created_at = EXCLUDED.created_at
;

-- =========================
-- EXPERIENCE_SKILLS
-- =========================

INSERT INTO experience_skills (experience_id, skill_id)
VALUES
('b3a8641d-4f20-455a-9929-f71829597b1a', 'dbc40492-113c-4228-9576-cff7579dfdcc'),
('b3a8641d-4f20-455a-9929-f71829597b1a', '901273d2-6fa8-4072-8455-8b584075035c'),
('b3a8641d-4f20-455a-9929-f71829597b1a', '4cfa7069-00ee-46bf-9353-4b6cf909a484'),
('b3a8641d-4f20-455a-9929-f71829597b1a', '7bff68fc-887d-4e81-960b-1f3121534ecb'),
('b3a8641d-4f20-455a-9929-f71829597b1a', '8325613a-d63e-4d33-8ced-1c5066b9c404'),
('b3a8641d-4f20-455a-9929-f71829597b1a', '2724bc5f-c0eb-4cfa-945e-1101ba303026'),
('b3a8641d-4f20-455a-9929-f71829597b1a', '73db23a8-afaa-4008-a5cb-8520eafdae99'),
('b3a8641d-4f20-455a-9929-f71829597b1a', 'a5f93d88-2340-4707-bbad-f7541f5c56d1'),
('b3a8641d-4f20-455a-9929-f71829597b1a', '582a6743-87ec-4f87-9144-3a189fca59b1'),
('b3a8641d-4f20-455a-9929-f71829597b1a', '3c555864-896d-4269-9288-bae0dd2dba36'),
('b3a8641d-4f20-455a-9929-f71829597b1a', 'ceb0e9d2-1876-47b6-9720-2256b8ced1d9'),
('b3a8641d-4f20-455a-9929-f71829597b1a', '3cba7043-3a83-4129-869e-da394f913653'),
('b3a8641d-4f20-455a-9929-f71829597b1a', 'c72e4c55-d72b-424d-bb5e-c8d3e5157540'),
('b3a8641d-4f20-455a-9929-f71829597b1a', 'b3a8e69e-2cb1-4f54-a498-cfd89772edff'),
('b3a8641d-4f20-455a-9929-f71829597b1a', 'e19a271d-36d2-4448-b130-b7aa7c90fae8'),
('871eaabd-f121-4bda-90ee-3925807a8bed', 'dbc40492-113c-4228-9576-cff7579dfdcc'),
('871eaabd-f121-4bda-90ee-3925807a8bed', '901273d2-6fa8-4072-8455-8b584075035c'),
('871eaabd-f121-4bda-90ee-3925807a8bed', '8325613a-d63e-4d33-8ced-1c5066b9c404'),
('871eaabd-f121-4bda-90ee-3925807a8bed', '4cfa7069-00ee-46bf-9353-4b6cf909a484'),
('871eaabd-f121-4bda-90ee-3925807a8bed', '7bff68fc-887d-4e81-960b-1f3121534ecb'),
('871eaabd-f121-4bda-90ee-3925807a8bed', '2724bc5f-c0eb-4cfa-945e-1101ba303026'),
('871eaabd-f121-4bda-90ee-3925807a8bed', '73db23a8-afaa-4008-a5cb-8520eafdae99'),
('871eaabd-f121-4bda-90ee-3925807a8bed', '582a6743-87ec-4f87-9144-3a189fca59b1'),
('871eaabd-f121-4bda-90ee-3925807a8bed', '3c555864-896d-4269-9288-bae0dd2dba36'),
('871eaabd-f121-4bda-90ee-3925807a8bed', 'ceb0e9d2-1876-47b6-9720-2256b8ced1d9'),
('871eaabd-f121-4bda-90ee-3925807a8bed', '3cba7043-3a83-4129-869e-da394f913653'),
('871eaabd-f121-4bda-90ee-3925807a8bed', 'c72e4c55-d72b-424d-bb5e-c8d3e5157540'),
('7189368a-450a-4b34-a98a-5aaabf9cd5c3', '8f198ccf-83b2-4a6d-834d-bf2e36df2b98'),
('7189368a-450a-4b34-a98a-5aaabf9cd5c3', '9c35ab81-6e0f-46fe-a6f0-d383b5f50049'),
('7189368a-450a-4b34-a98a-5aaabf9cd5c3', '2724bc5f-c0eb-4cfa-945e-1101ba303026'),
('7189368a-450a-4b34-a98a-5aaabf9cd5c3', '582a6743-87ec-4f87-9144-3a189fca59b1'),
('7189368a-450a-4b34-a98a-5aaabf9cd5c3', '73db23a8-afaa-4008-a5cb-8520eafdae99'),
('0586f066-c273-49ca-bfd4-754c5e1d807d', '8f198ccf-83b2-4a6d-834d-bf2e36df2b98'),
('0586f066-c273-49ca-bfd4-754c5e1d807d', '9c35ab81-6e0f-46fe-a6f0-d383b5f50049'),
('0586f066-c273-49ca-bfd4-754c5e1d807d', '2bb27bc9-aa5b-4c7f-9d07-de2c384233ff'),
('0586f066-c273-49ca-bfd4-754c5e1d807d', '582a6743-87ec-4f87-9144-3a189fca59b1'),
('0586f066-c273-49ca-bfd4-754c5e1d807d', 'e2bfb52d-37ac-4c19-88af-cb0160cb6a1c'),
('0586f066-c273-49ca-bfd4-754c5e1d807d', '5a068efb-1d0a-4e8a-82e9-90cf2ee3f7f6')
ON CONFLICT DO NOTHING
;

-- =========================
-- HOBBIES
-- =========================

INSERT INTO hobbies (id, name, created_at)
VALUES
('6e5ded1a-7acc-4b23-a009-9393eb2e3294', 'Discotecagem', '2026-03-01 00:50:10.385118'),
('058b9023-4274-4468-96b8-6aec8962c243', 'Surf', '2026-03-01 00:50:10.385118'),
('18c77662-790d-4dd9-a8cf-803ff54b8517', 'Yoga', '2026-03-01 00:50:10.385118'),
('6c33284f-6551-41e7-a0f4-dfd895faf341', 'Jardinagem', '2026-03-01 00:50:10.385118'),
('ae01552a-cb06-464c-9be6-3b014f15519a', 'Assistir Esportes ao Vivo', '2026-03-01 00:50:10.385118')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  created_at = EXCLUDED.created_at
;

-- =========================
-- PROFILE
-- =========================

INSERT INTO profile (id, name, birth_date, job_title, city, email, created_at)
VALUES
('6be91790-ae8e-47b1-91c5-4184fce11441', 'Carolina Longo Valdrighi', '1999-03-24', 'Backend Developer', 'Santos', 'valdrighdev@gmail.com', '2026-03-01 01:08:08.96915')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  birth_date = EXCLUDED.birth_date,
  job_title = EXCLUDED.job_title,
  city = EXCLUDED.city,
  email = EXCLUDED.email,
  created_at = EXCLUDED.created_at
;

COMMIT;