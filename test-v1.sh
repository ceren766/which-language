"""
mini-todo SPEC Test Senaryolari
Ogrenci: [Ceren Cenikli] (251478097)
Proje: mini-todo
"""
import subprocess
import os
import shutil
import pytest

# --- Yardimci Fonksiyon ---
def run_cmd(args):
    """Komutu calistir, stdout dondur."""
    # SPEC'e gore dosya adi todo.py 
    result = subprocess.run(
        ["python3", "todo.py"] + args,
        capture_output=True,
        text=True
    )
    return result.stdout.strip()

def setup_function():
    """Her testten once temiz baslangic[cite: 4, 6]."""
    if os.path.exists(".todo_data"):
        shutil.rmtree(".todo_data")

# --- init testleri ---
def test_init_creates_environment():
    """Yeni veri ortami olusturma kontrolu[cite: 6, 7]."""
    output = run_cmd(["init"])
    assert os.path.exists(".todo_data"), ".todo_data dizini olusturulmali [cite: 6]"
    assert os.path.exists(".todo_data/registry.txt"), "registry.txt olusturulmali [cite: 6]"
    assert "[SYSTEM] New data environment created" in output [cite: 7]

def test_init_already_active():
    """Zaten aktif olan ortamda hata mesaji kontrolu[cite: 7]."""
    run_cmd(["init"])
    output = run_cmd(["init"])
    assert "[SYSTEM] Environment is already active" in output [cite: 7]

# --- add testleri ---
def test_add_valid_entry():
    """Gecerli formatta gorev ekleme (Açıklama sonra Öncelik)[cite: 8, 10]."""
    run_cmd(["init"])
    # SPEC: python todo.py add "Task description" <priority> 
    output = run_cmd(["add", "Buy coffee", "1"])
    assert "[SUCCESS] Entry #1 has been registered" in output [cite: 10]

def test_add_data_format():
    """Dosyaya kaydedilen verinin boru (|) formatina uygunlugu[cite: 17, 18]."""
    run_cmd(["init"])
    run_cmd(["add", "Finish lab", "2"])
    with open(".todo_data/registry.txt", "r") as f:
        line = f.readline()
        # id|status|priority|date|description [cite: 18]
        assert "1|ACTIVE|2|" in line [cite: 18]
        assert "Finish lab" in line [cite: 18]

# --- list testleri ---
def test_list_empty_storage():
    """Depo bosken verilen log mesaji[cite: 11]."""
    run_cmd(["init"])
    output = run_cmd(["list"])
    assert "[LOG] Storage is currently empty" in output [cite: 11]

def test_list_categories():
    """Listelemede kategori basliklarinin varligi[cite: 10]."""
    run_cmd(["init"])
    run_cmd(["add", "Test task", "3"])
    output = run_cmd(["list"])
    assert "--- ACTIVE ---" in output [cite: 10]

# --- done testleri ---
def test_done_success():
    """Gorevin durumunu CLOSED olarak guncelleme[cite: 12, 13]."""
    run_cmd(["init"])
    run_cmd(["add", "Daily goal", "1"])
    output = run_cmd(["done", "1"])
    assert "[UPDATE] Entry #1 is now marked as CLOSED" in output [cite: 13]

def test_done_not_found():
    """Olmayan ID icin hata mesaji[cite: 14]."""
    run_cmd(["init"])
    output = run_cmd(["done", "5"])
    assert "[FATAL] Entry #5 could not be located" in output [cite: 14]

# --- delete testleri ---
def test_delete_success():
    """Gorevin kalici olarak silinmesi[cite: 15, 16]."""
    run_cmd(["init"])
    run_cmd(["add", "Temporary task", "2"])
    output = run_cmd(["delete", "1"])
    assert "[REMOVED] Entry #1 has been permanently erased" in output [cite: 16]

def test_delete_unknown_id():
    """Silme isleminde bilinmeyen ID hatasi[cite: 16]."""
    run_cmd(["init"])
    output = run_cmd(["delete", "99"])
    assert "[FATAL] Purge failed: Unknown ID" in output [cite: 16]

# --- hata yonetimi testleri ---
def test_uninitialized_error():
    """Init yapilmadan komut calistirma hatasi[cite: 19]."""
    output = run_cmd(["add", "No init", "1"])
    assert "[FATAL] Data environment not found" in output [cite: 19]

def test_unknown_command_error():
    """Tanimsiz komut hatasi[cite: 20]."""
    run_cmd(["init"])
    output = run_cmd(["fly"])
    assert "[ERROR] Unknown command: fly" in output [cite: 20]
