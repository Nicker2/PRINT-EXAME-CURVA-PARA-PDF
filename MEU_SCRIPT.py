import mss
import numpy as np
from PIL import Image
import keyboard
import os
import pygetwindow as gw
import time
import subprocess
import tkinter as tk
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch
from datetime import datetime
import pyautogui
import shutil
from tkinter import simpledialog
from tkinter import messagebox
import random
import math


# Caminhos para salvar o PDF e a imagem
pdf_path_f9 = "D:\\Meus Documentos\\Área de Trabalho\\EXAMES CURVA\\01 MEDIDA CURVA - PACIENTE - FUNCIONARIO.pdf"
pdf_path_f8 = "D:\\Meus Documentos\\Área de Trabalho\\EXAMES CURVA\\01 MEDIDA CURVA - NOMEPACIENTE - NICOLAS BORGES 2110691 TE.pdf"
pdf_path_scroll_lock = "D:\\Meus Documentos\\Área de Trabalho\\EXAMES CURVA\\01 MEDIDA CURVA - PACIENTE - FUNCIONARIO.pdf"  # Caminho do PDF para Scroll Lock
image_path = "D:\\Meus Documentos\\Documentos\\Nova pasta\\IMAGEMTEMP\\captura.bmp"

# Lista para armazenar notificações
notifications = []

def is_ie_open():
    return any("Internet Explorer" in window.title for window in gw.getAllWindows())

def open_ie():
    subprocess.Popen(["C:\\Program Files\\Internet Explorer\\iexplore.exe"])

def activate_ie():
    for window in gw.getAllWindows():
        if "Internet Explorer" in window.title:
            if not window.isActive:  # Verifica se a janela não está ativa
                try:
                    window.activate()
                    window.maximize()
                    return True
                except Exception as e:
                    print(f"Erro ao ativar a janela: {e}")
                    show_notification("Erro ao ativar a janela do Internet Explorer", bg_color="orange", text_color="white")
                    return False
            return True  # A janela já está ativa
    show_notification("Internet Explorer não encontrado", bg_color="orange", text_color="white")
    return False

def click_middle_of_screen():
    screen_width, screen_height = pyautogui.size()
    middle_x = screen_width // 2
    middle_y = screen_height // 2
    pyautogui.click(middle_x, middle_y)

def press_end():
    keyboard.press_and_release('end')

def capture_screen(x, y, width, height):
    with mss.mss() as sct:
        monitor = {"top": y, "left": x, "width": width, "height": height}
        img = sct.grab(monitor)

        img_np = np.array(img)
        img_pil = Image.fromarray(img_np[..., :3][..., ::-1])
        img_pil.save(image_path, "BMP")

def create_pdf(image_path, pdf_path, additional_text=None):
    c = canvas.Canvas(pdf_path, pagesize=A4)
    c.setTitle("MEDIDA DE CURVA TENSIONAL DIÁRIA")

    # Adiciona a logo no canto superior esquerdo
    logo_path = "D:\\Meus Documentos\\Documentos\\Nova pasta\\IMAGEMTEMP\\LOGO_HOC.png"
    logo_x = 20  # Coordenada x no canto superior esquerdo
    logo_y = A4[1] - 0.8 * inch  # Coordenada y no topo da página (inch é 1 polegada = 72 unidades)
    c.drawImage(logo_path, logo_x, logo_y, width=100, height=50, preserveAspectRatio=True, anchor='nw')

    # Título centralizado
    c.setFont("Helvetica-Bold", 22)
    text = "MEDIDA DE CURVA TENSIONAL DIÁRIA"
    text_width = c.stringWidth(text, "Helvetica-Bold", 22)
    x = (A4[0] - text_width) / 2
    y = A4[1] - 100
    c.drawString(x, y, text)

    # Data e hora
    now = datetime.now()
    date_time_text = f"Data: {now.strftime('%d/%m/%Y')}  Hora: {now.strftime('%H:%M:%S')}"
    c.setFont("Helvetica-Bold", 22)
    date_time_width = c.stringWidth(date_time_text, "Helvetica-Bold", 22)
    y -= 35
    x = (A4[0] - date_time_width) / 2
    c.drawString(x, y, date_time_text)

    # Texto adicional (opcional)
    if additional_text:
        right_text = "Right Eye"
        left_text = "Left Eye"
        right_x = 150
        left_x = A4[0] - 180
        c.setFont("Helvetica-Bold", 16)
        c.drawString(right_x, y - 50, right_text)
        c.drawString(left_x, y - 50, left_text)

    # Imagem capturada centralizada
    c.drawImage(image_path, 0, A4[1] - 220 - 150, width=623, height=170, preserveAspectRatio=True, anchor='n')
    c.showPage()
    c.save()

def show_notification(message, bg_color="red", text_color="white", width=450, height=150):
    root = tk.Tk()
    root.attributes('-topmost', True)
    root.overrideredirect(True)
    root.geometry(f"{width}x{height}+500+200")
    root.config(bg=bg_color)

    label = tk.Label(root, text=message, font=("Helvetica", 24), fg=text_color, bg=bg_color)
    label.pack(expand=True)

    root.update()
    notifications.append(root)  # Adiciona a notificação à lista
    return root

def hide_all_notifications():
    for root in notifications:
        if root and root.winfo_exists():
            root.destroy()
    notifications.clear()


# Definir as variáveis globais
start_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
end_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
transition_factor = 0  # Fator de transição de 0 a 1

def rename_pdf(pdf_path):
# Janela do Tkinter personalizada
    def on_rename():
        new_name = entry.get()
        if new_name:
            new_path = os.path.join(os.path.dirname(pdf_path), f"{new_name}.pdf")
            try:
                os.rename(pdf_path, new_path)
                #messagebox.showinfo("Sucesso", f"Arquivo renomeado para:\n{new_name}.pdf")
                root.destroy()
                os.startfile(os.path.dirname(new_path))  # Abre a pasta contendo o arquivo
            except Exception as e:
                messagebox.showerror("Erro", f"Erro ao renomear o arquivo:\n{e}")

    def on_cancel():
        root.destroy()



    # Função para interpolar entre duas cores
    def interpolate_color(color1, color2, factor):
        return (
            int(color1[0] + (color2[0] - color1[0]) * factor),
            int(color1[1] + (color2[1] - color1[1]) * factor),
            int(color1[2] + (color2[2] - color1[2]) * factor)
        )

    # Função para gerar cores suaves (dentro do intervalo de 150 a 200)
    def generate_soft_color():
        # Gera componentes de cor no intervalo entre 150 e 200
        r = random.randint(150, 200)
        g = random.randint(150, 200)
        b = random.randint(150, 200)

        # Garante que os valores de R, G e B não sejam muito próximos (evitando cinza)
        while abs(r - g) < 40 and abs(g - b) < 40 and abs(b - r) < 40:
            # Regenera as cores se estiverem muito próximas (cinza)
            r = random.randint(150, 200)
            g = random.randint(150, 200)
            b = random.randint(150, 200)

        return r, g, b

    # Função para atualizar a cor de fundo com transição suave
    def smooth_bg_transition(start_color, end_color, transition_factor, label, button_frame):
        # Interpolando entre start_color e end_color com base no fator de transição
        new_color = interpolate_color(start_color, end_color, transition_factor)
        color_hex = f'#{new_color[0]:02x}{new_color[1]:02x}{new_color[2]:02x}'

        # Aplicando a cor de fundo no root e nos componentes internos
        root.config(bg=color_hex)
        label.config(bg=color_hex)
        button_frame.config(bg=color_hex)

        # Atualizando o fator de transição
        transition_factor += 0.01
        if transition_factor > 1:
            transition_factor = 0  # Resetando o fator e trocando as cores
            start_color = end_color
            end_color = generate_soft_color()  # Gera novas cores suaves para a transição

        # Chama a função novamente após 20 milissegundos (para suavidade)
        root.after(30, lambda: smooth_bg_transition(start_color, end_color, transition_factor, label, button_frame))

    root = tk.Tk()
    root.title("Renomear PDF")
    root.geometry("750x250")

    # Definindo as cores de início e fim
    start_color = generate_soft_color()  # Cor inicial suave
    end_color = generate_soft_color()  # Cor final suave
    transition_factor = 0  # Fator de transição de 0 a 1

    # Obtém o tamanho da tela
    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()

    # Obtém as dimensões da janela
    window_width = 750
    window_height = 250

    # Calcula as posições X e Y para centralizar a janela
    x_position = (screen_width // 2) - (window_width // 2)
    y_position = (screen_height // 2) - (window_height // 2)

    # Define a geometria da janela com a posição centralizada
    root.geometry(f"{window_width}x{window_height}+{x_position}+{y_position}")

    root.attributes('-topmost', True)
    #root.config(bg="lightblue")

    # Texto explicativo
    label = tk.Label(root, text="Escreva o nome do arquivo\nExemplo:\n01 MEDIDA CURVA - PACIENTE - FUNCIONARIO 123456 TE",
                     font=("Helvetica", 18, "bold"), bg="lightblue", fg="black")
    label.pack(pady=20)

    # Campo de texto preenchido com o nome padrão
    entry = tk.Entry(root, font=("Helvetica", 18), width=45)
    entry.insert(0, "01 MEDIDA CURVA - PACIENTE - FUNCIONARIO")
    entry.pack(pady=10)

    # Botões OK e Cancelar
    button_frame = tk.Frame(root, bg="lightblue")
    button_frame.pack(pady=10)

    ok_button = tk.Button(button_frame, text="OK", font=("Helvetica", 16, "bold"), command=on_rename)
    ok_button.pack(side="left", padx=20)
    root.bind('<Return>', lambda event: ok_button.invoke())

    # Iniciar o efeito de transição suave
    smooth_bg_transition(start_color, end_color, transition_factor, label, button_frame)

    cancel_button = tk.Button(button_frame, text="Cancelar", font=("Helvetica", 16, "bold"), command=on_cancel)
    cancel_button.pack(side="right", padx=20)
    # Configurando o ESC para cancelar
    root.bind('<Escape>', lambda event: cancel_button.invoke())

    # Garantir que a janela seja exibida e ganhe foco
    root.after(20, root.deiconify)  # Mostrar a janela

    # Garantir que o foco seja dado após a janela ser renderizada
    root.after(20, lambda: entry.focus())  # Atrasar o foco para o carregamento

    # Selecionar a parte específica do texto
    root.after(20, lambda: entry.select_range(18, tk.END))  # Selecionar o texto de "PACIENTE - FUNCIONARIO"

    root.mainloop()

def on_f9(event):
    global notification_capture
    notification_capture = show_notification("TIRANDO PRINT PRA PDF", bg_color="red", text_color="white", width=450, height=150)

    if is_ie_open():
        if activate_ie():
            click_middle_of_screen()
            press_end()
            time.sleep(0.5)
            capture_screen(x, y, width, height)
            create_pdf(image_path, pdf_path_f9)
            hide_all_notifications()  # Esconde todas as notificações

            notification_pdf = show_notification("PDF CRIADO COM SUCESSO", bg_color="green", text_color="white", width=450, height=150)
            #time.sleep(1)
            os.startfile(pdf_path_f9)
            time.sleep(1)
            hide_all_notifications()  # Esconde todas as notificações
            print(f"PDF criado com sucesso em: {pdf_path_f9}")
            rename_pdf(pdf_path_f9)
        else:
            hide_all_notifications()  # Esconde todas as notificações
            error_notification = show_notification("ERRO AO ATIVAR IE", bg_color="orange", text_color="white", width=450, height=150)
            time.sleep(1)
            hide_all_notifications()  # Esconde todas as notificações
            print("Não foi possível ativar a janela do Internet Explorer.")
    else:
        hide_all_notifications()  # Esconde todas as notificações
        error_notification = show_notification("IE NÃO ABERTO", bg_color="orange", text_color="white", width=450, height=150)
        time.sleep(1)
        hide_all_notifications()  # Esconde todas as notificações
        print("O Internet Explorer não está aberto. Abrindo agora...")
        open_ie()
        time.sleep(1)

def on_f8(event):
    global notification_capture
    notification_capture = show_notification("TIRANDO PRINT PRA PDF", bg_color="red", text_color="white", width=450, height=150)

    if is_ie_open():
        if activate_ie():
            click_middle_of_screen()
            press_end()
            time.sleep(0.5)
            capture_screen(x, y, width, height)
            create_pdf(image_path, pdf_path_f8)
            hide_all_notifications()  # Esconde todas as notificações

            notification_pdf = show_notification("PDF CRIADO COM SUCESSO", bg_color="green", text_color="white", width=450, height=150)
            time.sleep(1)
            hide_all_notifications()  # Esconde todas as notificações
            os.startfile(pdf_path_f8)
            time.sleep(1)
            print(f"PDF criado com sucesso em: {pdf_path_f8}")
            hide_all_notifications()  # Esconde todas as notificações
            rename_pdf(pdf_path_f8)
        else:
            hide_all_notifications()  # Esconde todas as notificações
            error_notification = show_notification("ERRO AO ATIVAR IE", bg_color="orange", text_color="white", width=450, height=150)
            time.sleep(1)
            hide_all_notifications()  # Esconde todas as notificações
            print("Não foi possível ativar a janela do Internet Explorer.")
    else:
        hide_all_notifications()  # Esconde todas as notificações
        error_notification = show_notification("IE NÃO ABERTO", bg_color="orange", text_color="white", width=450, height=150)
        time.sleep(1)
        hide_all_notifications()  # Esconde todas as notificações
        print("O Internet Explorer não está aberto. Abrindo agora...")
        open_ie()
        time.sleep(1)

def on_scroll_lock(event):
    global notification_capture
    notification_capture = show_notification("TIRANDO PRINT PRA PDF", bg_color="red", text_color="white", width=450, height=150)

    if is_ie_open():
        if activate_ie():
            click_middle_of_screen()
            press_end()
            time.sleep(0.5)
            x_scroll_lock = 372
            y_scroll_lock = 464
            width_scroll_lock = 606  # 978 - 372
            height_scroll_lock = 131  # 595 - 464

            capture_screen(x_scroll_lock, y_scroll_lock, width_scroll_lock, height_scroll_lock)
            create_pdf(image_path, pdf_path_scroll_lock, additional_text=True)
            hide_all_notifications()  # Esconde todas as notificações

            notification_pdf = show_notification("PDF CRIADO COM SUCESSO", bg_color="green", text_color="white", width=450, height=150)
            #time.sleep(1)
            os.startfile(pdf_path_scroll_lock)
            time.sleep(1)
            print(f"PDF criado com sucesso em: {pdf_path_scroll_lock}")
            hide_all_notifications()  # Esconde todas as notificações
            rename_pdf(pdf_path_scroll_lock)
        else:
            hide_all_notifications()  # Esconde todas as notificações
            error_notification = show_notification("ERRO AO ATIVAR IE", bg_color="orange", text_color="white", width=450, height=150)
            time.sleep(1)
            hide_all_notifications()  # Esconde todas as notificações
            print("Não foi possível ativar a janela do Internet Explorer.")
    else:
        hide_all_notifications()  # Esconde todas as notificações
        error_notification = show_notification("IE NÃO ABERTO. ABRINDO AGORA...", bg_color="orange", text_color="white", width=650, height=150)
        open_ie()
        time.sleep(1)
        hide_all_notifications()  # Esconde todas as notificações

def main():
    global x, y, width, height
    x = 364  # Posição x
    y = 504  # Posição y
    width = 623  # Largura da captura
    height = 170  # Altura da captura

    print("Pressione F9 para capturar a tela e salvar como 01 MEDIDA CURVA - PACIENTE - FUNCIONARIO.pdf")
    print("Pressione F8 para capturar a tela e salvar como '01 MEDIDA CURVA - NOMEPACIENTE - NICOLAS BORGES 2110691 TE.pdf'")
    print("Pressione Scroll Lock para capturar a tela e salvar como '01 MEDIDA CURVA - PACIENTE - FUNCIONARIO.pdf'")

    keyboard.on_press_key('f9', on_f9)
    keyboard.on_press_key('f8', on_f8)
    keyboard.on_press_key('scroll lock', on_scroll_lock)

    # Mantenha o programa em execução
    keyboard.wait()

if __name__ == "__main__":
    main()
