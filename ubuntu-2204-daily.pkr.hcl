source "vmware-iso" "primatecTB" {
  // Docs: https://www.packer.io/plugins/builders/vmware/iso

  // VM Info:
  vm_name       = "Primatectestbench"
  guest_os_type = "ubuntu64Guest"
  version       = "16"
  headless      = false
  // Virtual Hardware Specs
  memory        = 8172
  cpus          = 2
  cores         = 2
  disk_size     = 81920
  sound         = true
  disk_type_id  = 0
  
  // ISO Details
  iso_urls =[
          "file:/Users/SBS/Downloads/jammy-live-server-amd64.iso",
          "https://cdimage.ubuntu.com/ubuntu-server/jammy/daily-live/current/jammy-live-server-amd64.iso"]
  iso_checksum = "sha256:1a8a89a6c72a636984cf615ccbc210aaf4559b4d4e5dca89ce2c05aef960e1da"
  iso_target_path   = "/Users/SBS/Downloads"
  output_directory  = "/Users/SBS/Downloads/Ubuntu-22.04-Build"
  snapshot_name     = "clean"  
  http_directory    = "http"
  ssh_username      = "vmadmin"
  ssh_password      = "MyP@ssw0rd-22!"
  shutdown_command  = "sudo shutdown -P now"

  boot_wait = "5s"
  boot_command = [
    "c<wait>",
    "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"",
    "<enter><wait>",
    "initrd /casper/initrd",
    "<enter><wait>",
    "boot",
    "<enter>"
  ]
}

build {
  sources = ["sources.vmware-iso.primatecTB"]
}
