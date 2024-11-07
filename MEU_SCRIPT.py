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

# Caminhos para salvar o PDF e a imagem
pdf_path_f9 = "D:\\Meus Documentos\\Área de Trabalho\\EXAMES CURVA\\01 MEDIDA CURVA - PACIENTE - FUNCIONARIO.pdf"
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

def on_f9(event):
    global notification_capture
    notification_capture = show_notification("TIRANDO PRINT PRA PDF", bg_color="red", text_color="white", width=450, height=150)

    if is_ie_open():
        if activate_ie():
            click_middle_of_screen()
            press_end()
            time.sleep(0.05)
            capture_screen(x, y, width, height)
            create_pdf(image_path, pdf_path_f9)
            hide_all_notifications()  # Esconde todas as notificações

            notification_pdf = show_notification("PDF CRIADO COM SUCESSO", bg_color="green", text_color="white", width=450, height=150)
            time.sleep(1)
            os.startfile(pdf_path_f9)
            hide_all_notifications()  # Esconde todas as notificações
            print(f"PDF criado com sucesso em: {pdf_path_f9}")
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
            time.sleep(0.05)
            x_scroll_lock = 372
            y_scroll_lock = 464
            width_scroll_lock = 606  # 978 - 372
            height_scroll_lock = 131  # 595 - 464

            capture_screen(x_scroll_lock, y_scroll_lock, width_scroll_lock, height_scroll_lock)
            create_pdf(image_path, pdf_path_scroll_lock, additional_text=True)
            hide_all_notifications()  # Esconde todas as notificações

            notification_pdf = show_notification("PDF CRIADO COM SUCESSO", bg_color="green", text_color="white", width=450, height=150)
            time.sleep(1)
            os.startfile(pdf_path_scroll_lock)
            hide_all_notifications()  # Esconde todas as notificações
            print(f"PDF criado com sucesso em: {pdf_path_scroll_lock}")
        else:
            hide_all_notifications()  # Esconde todas as notificações
            error_notification = show_notification("ERRO AO ATIVAR IE", bg_color="orange", text_color="white", width=450, height=150)
            time.sleep(1)
            hide_all_notifications()  # Esconde todas as notificações
            print("Não foi possível ativar a janela do Internet Explorer.")
    else:
        hide_all_notifications()  # Esconde todas as notificações
        error_notification = show_notification("IE NÃO ABERTO. ABRINDO AGORA...", bg_color="orange", text_color="white", width=450, height=150)
        open_ie()
        time.sleep(1)
        hide_all_notifications()  # Esconde todas as notificações

# Configuração do listener de teclado
keyboard.add_hotkey('f9', on_f9)
keyboard.add_hotkey('scrolllock', on_scroll_lock)

# Manter o script rodando
keyboard.wait()
