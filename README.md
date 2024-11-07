# Script de Captura e Geração de PDF
(Resolução 1366x768)

## Descrição

Este script foi desenvolvido para automatizar a captura de uma parte da tela de um computador, processar a imagem capturada e gerar um PDF com essa imagem, incluindo informações do paciente, data e hora. O objetivo principal é realizar uma "medida de curva tensional diária" de maneira rápida e eficiente. Quando ativado, o script captura parte da tela do Internet Explorer, cria o PDF com o conteúdo e o abre automaticamente.

### Funcionalidades:
1. **Captura de Tela:** O script captura a parte da tela definida (no caso a tabela gerada pela máquina que realiza Tonometria) em momentos específicos, quando pressionadas as teclas F9 ou Scroll Lock.
2. **Geração de PDF:** O PDF é gerado com a imagem capturada, o título "MEDIDA DE CURVA TENSIONAL DIÁRIA", a data e hora da captura, e o logo oficial do hospital.
3. **Notificações Visuais:** Durante o processo, notificações são exibidas para o usuário, informando sobre o status da execução, como a criação do PDF ou erros.
4. **Abertura e Ativação do Internet Explorer:** O script verifica se o Internet Explorer está aberto e, caso contrário, o abre automaticamente.

### Conclusão:
Este script foi criado para facilitar o processo de captura e geração de documentos importantes no contexto de medições diárias de pressão ocular em pacientes. Ele automatiza a captura de uma parte da tela, gera um PDF com informações detalhadas e o abre para visualização imediata, tornando o processo mais ágil e organizado. Além disso, o script garante que o Internet Explorer esteja sempre ativo para realizar as capturas necessárias.

---

## Arquivos

### **LOGO_HOC.png**
Este arquivo contém o logo oficial do **Hospital de Olhos e Clínicas de Caraguatatuba**, que é inserido no canto superior esquerdo de cada página gerada no PDF.

### **MEU_SCRIPT.py**
Este é o script principal responsável pela captura de tela e geração do PDF. Ele também exibe notificações visuais e lida com a ativação do Internet Explorer.

### **executar_script.vbs**
Este arquivo é um script Visual Basic que executa o script Python (`MEU_SCRIPT.py`) em segundo plano, sem abrir uma janela visível. O conteúdo do arquivo é o seguinte:

```vbs
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run """D:\Meus Documentos\Documentos\Nova pasta\EXECUTAR SCRIPT DEBUG.BAT""", 0, False
```

### **EXECUTAR SCRIPT DEBUG.BAT**
Este arquivo é um batch script que chama o script Python (`MEU_SCRIPT.py`) através do executável do Python. Ele é usado para rodar o script Python de maneira controlada. O conteúdo do arquivo é:

```bat
@echo off
start /b "" "D:\Meus Documentos\Documentos\Nova pasta\Winpython64-3.12.4.1\WPy64-31241\python-3.12.4.amd64\python.exe" "D:\Meus Documentos\Documentos\Nova pasta\MEU_SCRIPT.py"
```

---

## Como Usar

1. **Instale as dependências:**
   - `mss`: Para capturar a tela.
   - `pyautogui`: Para interagir com o mouse.
   - `keyboard`: Para detectar as teclas de atalho.
   - `Pillow`: Para processar a imagem capturada.
   - `pygetwindow`: Para manipulação de janelas.

2. **Configuração Inicial:**
   - Coloque os arquivos necessários (`LOGO_HOC.png`, `MEU_SCRIPT.py`, `executar_script.vbs`, `EXECUTAR SCRIPT DEBUG.BAT`) nas pastas corretas conforme o caminho fornecido.

3. **Executando o Script:**
   - Utilize o arquivo `executar_script.vbs` para rodar o `MEU_SCRIPT.py` em segundo plano.
   - O script pode ser ativado pelas teclas de atalho F9 ou Scroll Lock.

4. **Saída:**
   - O script gera um PDF com a imagem capturada e a insere no arquivo de saída configurado, exibindo uma notificação com o status da criação do PDF.

---

## Contribuição

Contribuições são sempre bem-vindas! Se você quiser ajudar a melhorar este projeto, siga as etapas abaixo. Vamos explicar o que você precisa fazer para enviar suas melhorias, corrigir bugs ou sugerir novas funcionalidades.

### Como Contribuir:

1. **Faça um Fork do Repositório**
   
   O primeiro passo para contribuir é fazer um "fork" deste repositório. Um fork cria uma cópia do repositório no seu GitHub, permitindo que você faça alterações sem afetar o projeto original.
   
   Para fazer o fork:
   - Vá até a página do repositório no GitHub.
   - No canto superior direito, clique no botão **Fork**.
   - Isso criará uma cópia do projeto na sua conta do GitHub.

2. **Crie uma Nova Branch**

   Depois de fazer o fork e clonar o repositório para o seu computador, crie uma nova "branch" (ramificação) onde você poderá trabalhar nas suas alterações. Isso é importante porque, ao trabalhar em uma branch separada, você evita fazer alterações no código principal (a **master** ou **main branch**).
   
   Para criar uma nova branch:
   - Abra o terminal no diretório do projeto clonado.
   - Digite o comando para criar e mudar para uma nova branch:

     ```bash
     git checkout -b nome-da-nova-branch
     ```

   Substitua **nome-da-nova-branch** por um nome que faça sentido para o que você está implementando. Exemplo: `feature-corrigir-bug` ou `feature-adicionar-funcionalidade`.

3. **Faça as Suas Alterações**

   Agora que você está na sua nova branch, faça as alterações necessárias no código. Isso pode incluir:
   - Corrigir um bug.
   - Adicionar uma nova funcionalidade.
   - Melhorar a documentação (README, por exemplo).
   
   Após fazer as alterações, você pode testar o código para garantir que tudo esteja funcionando corretamente.

4. **Commit Suas Mudanças**

   Quando terminar suas alterações, você precisa **salvar** essas mudanças localmente no seu repositório (isso é chamado de "commit"). O commit é uma forma de registrar suas alterações.

   Para fazer isso:
   - Adicione os arquivos que você alterou para o commit:

     ```bash
     git add .
     ```

   - Agora, faça o commit com uma mensagem explicando o que você fez:

     ```bash
     git commit -m "Mensagem descrevendo a alteração"
     ```

   A mensagem deve ser clara e descritiva, para que qualquer pessoa possa entender o que foi alterado sem olhar o código.

5. **Faça o Push para o seu Repositório no GitHub**

   Após o commit, você precisa enviar as mudanças para o repositório do GitHub. Esse processo é chamado de **push**. Ele envia seus commits da sua máquina para o repositório remoto no GitHub.

   Para fazer isso, use o seguinte comando:

   ```bash
   git push origin nome-da-nova-branch
   ```

   Isso vai enviar a nova branch com as alterações para o seu repositório no GitHub.

6. **Abra um Pull Request**

   Agora que suas alterações estão no seu repositório no GitHub, você pode **propor** essas mudanças ao repositório original. Para isso, você abre um **Pull Request**.

   - No seu repositório no GitHub, você verá um botão **Compare & Pull Request**. Clique nele.
   - No formulário que aparecer, explique o que você fez e por que acredita que suas mudanças são importantes.
   - Clique em **Create Pull Request**.



Após isso, a equipe do projeto irá revisar suas mudanças e, se tudo estiver certo, elas serão adicionadas ao código principal do repositório.

---

## Licença

Este projeto é licenciado sob a Licença MIT - veja o arquivo [LICENSE.md](LICENSE.md) para detalhes.

---

## Autor

Criado por Nicolas Bonza Cavalari Borges.

---
