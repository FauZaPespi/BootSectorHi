# 🖥️ Bootloader Hi!

Un mini projet d’**OSDev** qui affiche un message **avant même que l’OS démarre**.  
Il s’agit d’un **boot sector program** : le BIOS charge les 512 premiers octets du disque (MBR) en mémoire, puis exécute ce code.

---

## Preview

<img width="716" height="217" alt="Demo" src="https://github.com/user-attachments/assets/989ad603-9087-48fe-94af-7a035ee47426" />

---

## 🚀 Fonctionnement

Ordre d’exécution sur la machine :
1. Le matériel démarre (Power On).
2. Le BIOS initialise le système.
3. Le BIOS charge le **boot sector (512 octets)** à l’adresse `0x7C00`.
4. Notre code s’exécute → affiche `Hi !` et `FauZa make this project`.

---

## 🛠️ Compilation & Test

### 1. Assembler le bootloader
```bash
nasm -f bin boot.asm -o boot.bin
````

### 2. Lancer dans QEMU

```bash
qemu-system-x86_64 -fda boot.bin
```

👉 L’écran doit afficher :

```
Hi !FauZa make this project
```

---

## ⚡ Notes

* Le fichier `boot.bin` fait **exactement 512 octets** et se termine par la signature `0xAA55` requise par le BIOS.

---

## 🎯 Objectif du projet

* Comprendre comment un CPU passe du **hardware brut** → à un **OS complet**.
* Apprendre à manipuler le **pré-OS**.
---


`README générée à l'aide de FrozenReadme`

