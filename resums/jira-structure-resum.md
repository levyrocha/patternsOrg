# Estrutura de Cards Jira em Projetos Salesforce

## Hierarquia Organizacional

```text
EPIC-100  [Epic]
│
├── FEAT-220  [Feature]
│     │
│     ├── STORY-521  [User Story]
│     │      │
│     │      ├── TASK-900  [Technical Task]
│     │      │      ├── SUBTASK-001
│     │      │      ├── SUBTASK-002
│     │      │      └── SUBTASK-003
│     │      │
│     │      ├── TASK-901  [Technical Task]
│     │      │      ├── SUBTASK-004
│     │      │      └── SUBTASK-005
│     │      │
│     │      ├── QA-902  [QA Task]
│     │      │      └── SUBTASK-006
│     │      │
│     │      ├── BUG-903  [Bug]
│     │      │      └── SUBTASK-007
│     │      │
│     │      └── SUBTASK-008  [Subtask diretamente na Story]
│     │
│     └── STORY-522  [User Story]
│            │
│            ├── TASK-910
│            │      └── SUBTASK-009
│            │
│            └── SUBTASK-010  [Subtask diretamente na Story]
│
└── FEAT-221  [Feature]
       │
       └── STORY-530
              ├── TASK-920
              └── SUBTASK-011
```

---

# Tipos de Cards

| Tipo | Objetivo |
|---|---|
| Epic | Grande iniciativa de negócio |
| Feature | Bloco funcional relevante |
| Story | Requisito funcional implementável |
| Technical Task | Implementação técnica derivada da Story |
| QA Task | Validação e testes |
| Bug | Correção de defeitos |
| Subtask | Unidade operacional detalhada |
| Spike | Pesquisa/análise técnica |

---

# Relações Mais Comuns

| Relação | Observação |
|---|---|
| Epic → Feature | Estrutura enterprise |
| Feature → Story | Organização funcional |
| Story → Task | Refinamento técnico |
| Story → Subtask | Modelo simplificado |
| Task → Subtask | Modelo enterprise |
| Bug → Subtask | Bugs complexos |
| QA Task → Subtask | Casos de teste detalhados |

---

# Modelos Mais Utilizados

## Modelo Simplificado

Subtasks diretamente na Story.

```text
Story
 ├── Subtask Dev
 ├── Subtask QA
 └── Subtask Deploy
```

### Mais comum em:
- squads pequenos
- projetos rápidos
- consultorias menores

---

## Modelo Enterprise

Hierarquia técnica detalhada.

```text
Story
 ├── Technical Task
 │      ├── Subtask A
 │      └── Subtask B
 │
 ├── QA Task
 │      └── Subtask QA
 │
 └── Deployment Task
        └── Subtask Deploy
```

### Mais comum em:
- bancos
- telecom
- projetos Salesforce enterprise
- squads grandes
- ambientes regulados

---

# Exemplo Salesforce

## Story Funcional

```text
STORY:
Aprovação desconto >20%
```

## Tasks Técnicas

```text
TASK:
Criar Approval Flow

TASK:
Criar Email Notification

TASK:
Criar Permission Set
```

# Responsabilidades

| Item | Responsável |
|---|---|
| Epic | Product Owner / Delivery |
| Feature | BA / Product Owner |
| Story | Business Analyst |
| Task | Tech Lead / Senior Dev |
| Subtask | Developer |
| QA Task | QA Engineer |
| Bug | QA / UAT / Suporte |

---

## Camada Técnica

```text
Story
 ├── Technical Task
 ├── QA Task
 ├── Bug
 └── Subtask
```

---