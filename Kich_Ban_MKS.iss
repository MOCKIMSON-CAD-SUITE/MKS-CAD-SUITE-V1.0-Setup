[Setup]
; --- THÔNG TIN PHẦN MỀM ---
; --- Các thông tin thương mại hiển thị trong Control Panel ---
AppPublisher=Moc Kim Son
AppPublisherURL=https://mayxego.vn
AppSupportURL=https://mayxego.vn
AppUpdatesURL=https://mayxego.vn
AppName=MKS CAD Suite
AppVersion=1.0.0
AppCopyright=Copyright (C) 2026 Xuong co khi Moc Kim Son
[Setup]
; (Các cài đặt cũ của sếp như AppName, AppVersion... giữ nguyên)

; 1. Chỉ cho phép chạy bộ cài trên các máy tính Windows 64-bit
ArchitecturesAllowed=x64

; 2. Lệnh CỐT LÕI: Ép bộ cài hoạt động hoàn toàn ở chế độ 64-bit
ArchitecturesInstallIn64BitMode=x64

; --- ĐƯỜNG DẪN CÀI ĐẶT (Tự động chui vào thư mục Plugin của AutoCAD) ---
DefaultDirName={userappdata}\Autodesk\ApplicationPlugins\MKS_CAD_Suite.bundle
DisableDirPage=yes

; --- THÔNG TIN KHÁC ---
DefaultGroupName=MKS CAD Suite
DisableProgramGroupPage=yes
OutputBaseFilename=MKS_CAD_Suite_Setup_V1.0
Compression=lzma
SolidCompression=yes
PrivilegesRequired=lowest

; === ĐƯỜNG DẪN LOGO CHO BỘ CÀI VÀ CONTROL PANEL (Sửa tại đây) ===
; File icon thực tế cho chính bộ cài .exe (Inno Setup lấy từ bundle của sếp)
SetupIconFile=MKS_CAD_Suite.bundle\Logo-MKS-55x55.ico

; File icon hiển thị trong Add/Remove Programs (Control Panel) - lấy từ thư mục cài đặt sau khi cài
UninstallDisplayIcon={app}\Logo-MKS-55x55.ico
[Registry]
; 1. GỠ SẠCH REGISTRY: Xóa tận gốc toàn bộ khóa bản quyền, ngôn ngữ và bộ đệm Version
Root: HKCU; Subkey: "Software\MKS_CAD_Suite"; Flags: uninsdeletekey

[UninstallDelete]
; 2. GỠ SẠCH FILE UPDATE BỊ BỎ QUÊN: Bắt buộc xóa toàn bộ nội dung trong thư mục cài đặt
Type: filesandordirs; Name: "{app}\*"

; 3. XÓA THƯ MỤC GỐC: Xóa luôn cái vỏ thư mục MKS_CAD_Suite.bundle
Type: dirifempty; Name: "{app}"

; 4. GỠ SẠCH RÁC WINDOWS: Quét sạch các file sinh ngầm trong thư mục Temp của Windows
Type: files; Name: "{localappdata}\Temp\mks_*"

[InstallDelete]
Type: filesandordirs; Name: "{userappdata}\Autodesk\ApplicationPlugins\MKS_CAD_Suite.bundle"

[Files]
; --- GOM TOÀN BỘ FILE TỪ BUNDLE CỦA SẾP ---
; Dấu * nghĩa là lấy toàn bộ ruột của thư mục MKS_CAD_Suite.bundle
Source: "MKS_CAD_Suite.bundle\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs