# 🏥 Sistema de Captura e Geração de PDF - Curva Tensional Diária

![Python](https://img.shields.io/badge/Python-3.12+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Platform](https://img.shields.io/badge/Plataforma-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Status](https://img.shields.io/badge/Status-Em_Desenvolvimento-yellow?style=for-the-badge)
![License](https://img.shields.io/badge/Licença-MIT-green?style=for-the-badge)

> **HOC - Hospital de Olhos e Clínicas de Caraguatatuba**

## 📄 Descrição

Este projeto é uma ferramenta de automação desenvolvida em **Python** para otimizar a rotina de **Medida de Curva Tensional Diária**. O script captura automaticamente dados visuais (tabelas de tonometria) da tela do computador, processa a imagem e gera um relatório em **PDF** padronizado, pronto para impressão ou arquivamento.

O sistema foi projetado para integrar-se ao fluxo de trabalho hospitalar, garantindo que o **Internet Explorer** (utilizado pelo equipamento médico) esteja ativo e permitindo renomeação rápida dos arquivos gerados.

---

## 🚀 Funcionalidades Principais

* **📸 Captura Inteligente:** Utiliza a biblioteca `mss` para capturar regiões específicas da tela (tabelas de exames) com precisão de pixel.
* **🖱️ Automação de Interface:** Verifica, abre e maximiza o **Internet Explorer** automaticamente se ele não estiver em foco.
* **⌨️ Hotkeys Globais:**
    * `<F9>`: Captura Padrão (Paciente/Funcionário).
    * `<F8>`: Captura com nome específico (Nicolas Borges - Técnico).
    * `<Scroll Lock>`: Captura alternativa de região.
* **📄 Geração de PDF:** Criação instantânea de documentos PDF com cabeçalho, logo do HOC, data/hora e a imagem do exame centralizada.
* **🔔 Feedback Visual:** Notificações em tempo real na tela (Overlay) informando o status ("Tirando Print", "PDF Criado", "Erro").
* **✏️ Renomeação Dinâmica:** Interface gráfica (GUI) simples para renomear o arquivo final antes de salvar, com prevenção de duplicidade.

---

## 🛠️ Tecnologias Utilizadas

O projeto foi construído utilizando as seguintes bibliotecas e ferramentas:

| Tecnologia | Função |
| :--- | :--- |
| ![Python](https://img.shields.io/badge/-Python-black?style=flat-square&logo=python) | Linguagem base do projeto. |
| **ReportLab** | Geração dinâmica de arquivos PDF. |
| **MSS & Pillow** | Captura e processamento de imagem de alta performance. |
| **Tkinter** | Interfaces gráficas para notificações e diálogos. |
| **PyGetWindow** | Gerenciamento e foco de janelas do Windows. |
| **Keyboard** | Escuta de atalhos de teclado em segundo plano. |

---

## 📂 Estrutura do Projeto

```text
📁 EXAMES CURVA/
│
├── 📄 MEU_SCRIPT.py             # Código fonte principal (Python)
├── ⚙️ executar_script.vbs       # Script VBS para execução silenciosa (background)
├── 🚀 EXECUTAR SCRIPT DEBUG.BAT # Batch file para execução via terminal/debug
├── 🖼️ LOGO_HOC.png              # Logotipo do Hospital (usado no PDF)
└── 📄 README.md                 # Documentação do projeto

```

---

## ⚙️ Instalação e Configuração

### Pré-requisitos

Certifique-se de ter o [Python 3.12+](https://www.python.org/downloads/) instalado. Em seguida, instale as dependências listadas abaixo:

```bash
pip install mss numpy pillow keyboard pygetwindow pyautogui reportlab

```

### Configuração de Caminhos

⚠️ **Importante:** O script atualmente utiliza caminhos absolutos (hardcoded). Antes de rodar, abra o arquivo `MEU_SCRIPT.py` e ajuste as variáveis abaixo para corresponderem às pastas do seu computador:

```python
# Exemplo de variáveis a serem ajustadas no código:
pdf_path_f9 = "C:\\Seu\\Caminho\\Aqui\\arquivo.pdf"
image_path = "C:\\Seu\\Caminho\\Temp\\captura.bmp"
logo_path = "C:\\Seu\\Caminho\\Assets\\LOGO_HOC.png"

```

---

## 🖥️ Como Usar

1. **Iniciar o Serviço:**
Execute o arquivo `executar_script.vbs`. O script rodará em segundo plano (você não verá uma janela preta).
2. **Realizar o Exame:**
Abra o software do equipamento no Internet Explorer e posicione a tabela de resultados na tela.
3. **Capturar:**
Pressione **`F9`** (ou a tecla configurada).
* O script focará o IE.
* Uma notificação vermelha aparecerá.
* O PDF será gerado e aberto automaticamente.


4. **Finalizar:**
Uma janela azul aparecerá pedindo para confirmar ou alterar o nome do arquivo. Pressione `Enter` para salvar ou `Esc` para cancelar.

---

## 🤝 Contribuição

Contribuições são bem-vindas! Siga os passos abaixo:

1. Faça um **Fork** do projeto.
2. Crie uma Branch para sua Feature (`git checkout -b feature/NovaFuncionalidade`).
3. Faça o Commit (`git commit -m 'Adicionando nova funcionalidade'`).
4. Faça o Push (`git push origin feature/NovaFuncionalidade`).
5. Abra um **Pull Request**.

---

## 📝 Licença

Este projeto está licenciado sob a licença **MIT**. Consulte o arquivo [LICENSE](https://www.google.com/search?q=LICENSE) para mais detalhes.

---

## 👨‍💻 Autor

<table align="center">
<tr>
<td align="center">
<img src="https://avatars.githubusercontent.com/u/34519753?v=4" width="100px;" alt=""/><br />
<sub><b>Nicolas Bonza Cavalari Borges</b></sub>
</td>
</tr>
</table>

Desenvolvido para auxiliar nas rotinas do **Hospital de Olhos e Clínicas de Caraguatatuba**.
