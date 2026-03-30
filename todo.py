import os
import sys

# V1 GÖREVLERİ:
# 1. .todo_data/ dizini ve registry.txt otomatik oluşturma (init) eklendi.
# 2. CLOSED statüsündeki görevleri temizleyen 'clear' fonksiyonu yazıldı.
# 3. Veri formatı pipe (|) ayırıcısı ile standart hale getirildi.

DATA_DIR = ".todo_data"
DATA_FILE = os.path.join(DATA_DIR, "registry.txt")

def init():
    """Dizini ve kayıt dosyasını oluşturur."""
    if not os.path.exists(DATA_DIR):
        os.makedirs(DATA_DIR)
    if not os.path.exists(DATA_FILE):
        with open(DATA_FILE, "w") as f:
            pass
    print("[INIT] Todo system is ready.")

def clear():
    """Tamamlanmış (CLOSED) görevleri dosyadan siler."""
    if not os.path.exists(DATA_FILE): return
    
    with open(DATA_FILE, "r") as f:
        lines = f.readlines()
    
    # Sadece ACTIVE olanları tut
    active_tasks = [line for line in lines if "|ACTIVE|" in line]
    deleted_count = len(lines) - len(active_tasks)
    
    with open(DATA_FILE, "w") as f:
        f.writelines(active_tasks)
        
    print(f"[CLEANUP] {deleted_count} completed tasks have been removed.")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        command = sys.argv[1]
        if command == "init":
            init()
        elif command == "clear":
            clear()
