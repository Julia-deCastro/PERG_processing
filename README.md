# Análise e Classificação de Sinais de PERG utilizando Regressão Logística

Este repositório contém o código-fonte e o trabalho de conclusão de curso (TCC) intitulado:

**"Análise e classificação de sinais de eletrorretinograma utilizando regressão logística aplicada a parâmetros morfológicos e estatísticos"**

Desenvolvido por **Júlia de Castro**

Orientado por **Prof. Danilo Barbosa Melges**

Curso de Engenharia de Controle e Automação – UFMG  
Laboratório de Engenharia Biomédica (LEB)  
Novembro de 2025

---

## 📌 Sobre o Projeto

O eletrorretinograma por padrão (PERG) é um exame oftalmológico que avalia a função das células ganglionares da retina a partir da resposta elétrica gerada por estímulos visuais.

Este trabalho teve como objetivo:

- Realizar o **pré-processamento de sinais de PERG**
- Extrair **parâmetros morfológicos e estatísticos**
- Aplicar **Regressão Logística** para classificação automática
- Comparar desempenho entre diferentes conjuntos de características

A classificação foi realizada entre os seguintes grupos:

- Indivíduos com visão normal
- Pacientes com Distrofia Macular (DM)
- Pacientes com Retinite Pigmentosa (RP)

---

## 🧠 Metodologia

### 1️⃣ Base de Dados

Foi utilizada a base pública **PERG-IOBA**, disponível no PhysioNet, contendo registros de indivíduos com visão normal e diferentes disfunções visuais.

### 2️⃣ Pré-processamento

- Remoção de flutuação de linha de base (detrend)
- Filtragem passa-baixas Butterworth (2ª ordem, 90 Hz, fase nula)

### 3️⃣ Extração de Características

#### 🔹 Parâmetros Morfológicos (PM)

- Amplitude das componentes N35, P50 e N95
- Latência (tempo implícito) das componentes

#### 🔹 Parâmetros Estatísticos (PE)

- Variância
- Curtose
- Assimetria
- Entropia

### 4️⃣ Classificação

Foi utilizada **Regressão Logística**, com:

- 80% dos dados para treino
- 20% para teste
- 100 execuções com divisão aleatória
- Avaliação por:
  - Acurácia
  - Sensibilidade
  - Especificidade

---

## 📊 Resultados

- Acurácia média ~80% na classificação:
  - Normal vs DM
  - Normal vs RP

- Baixa capacidade de discriminação entre:
  - DM vs RP (~53%)

Os resultados indicam que a metodologia é promissora para distinguir sinais normais de patológicos, mas não suficiente para diagnóstico diferencial entre patologias.

---

## 🗂 Estrutura do Repositório

📁 codigos/

📄 TCC_JuliaDeCastro.pdf

📄 README.md

---

## ⚙️ Tecnologias Utilizadas

- MATLAB
- Processamento de Sinais
- Estatística Não Paramétrica
- Regressão Logística
- Análise Biomédica

---

## 🎓 Referência

CASTRO, Júlia de.  
_Análise e classificação de sinais de eletrorretinograma utilizando regressão logística aplicada a parâmetros morfológicos e estatísticos._  
Monografia – Universidade Federal de Minas Gerais, 2025.

---
