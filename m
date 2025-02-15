Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0ECA36DCD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Feb 2025 12:42:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tjGZ4-0006lc-Rc;
	Sat, 15 Feb 2025 11:42:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tjGZ3-0006lQ-OD
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Feb 2025 11:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z+XfaPwkKGbn8tU3KPgfJ2ohEiM2pQTKRN7a7YuI/bg=; b=aE0YVXLrn+AchKhYg16ydgn16k
 t/kjR4gmN7XsxguL8QFxO3rMQ4bEMDsDOMqZgULgw8LKWX+r54RB8aYDXtsZFEB+Cc4znNNoPIEvJ
 UL0Pw0wf2Ui9tFVFtFc8iJuWd12w86vgjCyJYPY+2HxcsLWbKkEavqY6iQ6AEc64nJEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z+XfaPwkKGbn8tU3KPgfJ2ohEiM2pQTKRN7a7YuI/bg=; b=D
 Xw1+OgcbwE1Ej/rFwh/hOIwe5ggDKhtAQdvpIpn9Sisi3V+mVO5vjWRpr0mvkh97kysOV1yktLN0+
 PVnPoRz2tPvQtUV95O1nEI9NIruURPPjKRrmfFetxP7H5Q4kAjc1ccBexmJ7B01nqmb0G7R6H4XlU
 izGvbiD/VwRoxe80=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tjGZ3-0002sU-FW for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Feb 2025 11:42:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 93256A401C2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 15 Feb 2025 11:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 682CFC4CEE6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 15 Feb 2025 11:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739619738;
 bh=DYRu6bYzBG5P31k1VXT0F/xUuuxwWTyh4rUSqNkeffE=;
 h=From:To:Subject:Date:From;
 b=XucxanCzWqqDkhKiS3QcT1TIGSscM+Gs6xtoqmwX4OJ7iNUoD2tC/NhLnYSQH4NrF
 cn/N7XH67EMfLHkSOZraDszzGvj6ERkHffphohRBHtTTs9mEKYclyW3zVjCO8SzEUp
 xx6fFSNh15uYaKirt8kqstXRkW/s9ycZMLOsAB+wc9zn+LuDwGqwPZ9b7zqInbZ85O
 Y+/LW3Qwtdb6V4j7srmcrWU/NvcJ/srC2poxMFcoTzH4CDzMbYxr+8VNU+GKH71bZn
 EMbisiUC39t8EvdXggLdEVmLP1L6eCaRklsGKZ6bsAKAWLCYcXhfnunxycbQeV7OVM
 +elExLhaVo5Yg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 57EE0C3279E; Sat, 15 Feb 2025 11:42:18 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 15 Feb 2025 11:42:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219784-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=219784 Bug ID:
 219784 Summary: RIP: 0010:__list_add_valid_or_report.cold+0x4f/0x60 Product:
 File System Version: 2.5 Hardware: All OS: Linux Status: NEW Severity: normal
 Priority: P3 Component: f2fs Assigne [...] 
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tjGZ3-0002sU-FW
Subject: [f2fs-dev] [Bug 219784] New: RIP:
 0010:__list_add_valid_or_report.cold+0x4f/0x60
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: bugzilla-daemon--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: bugzilla-daemon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=219784

            Bug ID: 219784
           Summary: RIP: 0010:__list_add_valid_or_report.cold+0x4f/0x60
           Product: File System
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Hello Kernel Team,

I notice this today with 6.13.2 kernel version.

My setup is:

- Disk - BTRFS root partition and F2FS home partition:
# df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  1,6G     0  1,6G   0% /dev
tmpfs          tmpfs      16G   12K   16G   1% /dev/shm
tmpfs          tmpfs     7,7G  6,2M  7,7G   1% /run
/dev/nvme0n1p2 btrfs     255G  115G  132G  47% /
efivarfs       efivarfs  128K   48K   76K  39% /sys/firmware/efi/efivars
tmpfs          tmpfs     1,0M     0  1,0M   0%
/run/credentials/systemd-journald.service
tmpfs          tmpfs      16G  1,5M   16G   1% /run/wrappers
/dev/nvme0n1p1 vfat      611M   32M  580M   6% /boot
/dev/nvme0n1p3 f2fs      658G   82G  576G  13% /home
tmpfs          tmpfs     1,0M     0  1,0M   0%
/run/credentials/getty@tty1.service
tmpfs          tmpfs     3,1G   35M  3,1G   2% /run/user/1000
- OS: NixOS
- Application: Yandex Browser



[Vi feb 14 19:45:28 2025] list_add corruption. next->prev should be prev
(ffff9cf4ce73de70), but was ffff9cee00856210. (next=ffffecd94d7a4fc8).
[Vi feb 14 19:45:28 2025] ------------[ cut here ]------------
[Vi feb 14 19:45:28 2025] kernel BUG at lib/list_debug.c:29!
[Vi feb 14 19:45:28 2025] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[Vi feb 14 19:45:28 2025] CPU: 10 UID: 1000 PID: 4047 Comm: ThreadPoolForeg
Tainted: P           O       6.13.2 #1-NixOS
[Vi feb 14 19:45:28 2025] Tainted: [P]=PROPRIETARY_MODULE, [O]=OOT_MODULE
[Vi feb 14 19:45:28 2025] Hardware name: ASUSTeK COMPUTER INC. ROG Zephyrus G14
GA401QM_GA401QM/GA401QM, BIOS GA401QM.415 08/11/2023
[Vi feb 14 19:45:28 2025] RIP: 0010:__list_add_valid_or_report.cold+0x4f/0x60
[Vi feb 14 19:45:28 2025] Code: 0f 0b 48 89 d1 48 89 c6 4c 89 c2 48 c7 c7 68 aa
c0 9f e8 1d 90 fe ff 90 0f 0b 48 89 c1 48 c7 c7 10 aa c0 9f e8 0b 90 fe ff 90
<0f> 0b 48 c7 c7 e8 a9 c0 9f e8 fc 8f fe ff 90 0f 0b 48 89 fe 48 c7
[Vi feb 14 19:45:28 2025] RSP: 0018:ffffbc3b87db38b0 EFLAGS: 00010246
[Vi feb 14 19:45:28 2025] RAX: 0000000000000075 RBX: ffff9cf4ce73de40 RCX:
0000000000000000
[Vi feb 14 19:45:28 2025] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[Vi feb 14 19:45:28 2025] RBP: ffff9cf4ee2fb500 R08: 0000000000000000 R09:
0000000000000000
[Vi feb 14 19:45:28 2025] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000001
[Vi feb 14 19:45:28 2025] R13: ffffecd954befc40 R14: 0000000000000001 R15:
ffffecd94d7a4fc8
[Vi feb 14 19:45:28 2025] FS:  00007f63ac1fc6c0(0000) GS:ffff9cf4ce700000(0000)
knlGS:0000000000000000
[Vi feb 14 19:45:28 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Vi feb 14 19:45:28 2025] CR2: 00007fe43bffdaf0 CR3: 000000020bc88000 CR4:
0000000000f50ef0
[Vi feb 14 19:45:28 2025] PKRU: 55555554
[Vi feb 14 19:45:28 2025] Call Trace:
[Vi feb 14 19:45:28 2025]  <TASK>
[Vi feb 14 19:45:28 2025]  ? __die_body.cold+0x19/0x2d
[Vi feb 14 19:45:28 2025]  ? die+0x2e/0x50
[Vi feb 14 19:45:28 2025]  ? do_trap+0xda/0x120
[Vi feb 14 19:45:28 2025]  ? do_error_trap+0x6a/0xa0
[Vi feb 14 19:45:28 2025]  ? __list_add_valid_or_report.cold+0x4f/0x60
[Vi feb 14 19:45:28 2025]  ? exc_invalid_op+0x51/0x80
[Vi feb 14 19:45:28 2025]  ? __list_add_valid_or_report.cold+0x4f/0x60
[Vi feb 14 19:45:28 2025]  ? asm_exc_invalid_op+0x1a/0x20
[Vi feb 14 19:45:28 2025]  ? __list_add_valid_or_report.cold+0x4f/0x60
[Vi feb 14 19:45:28 2025]  free_unref_page_commit+0x7b/0x390
[Vi feb 14 19:45:28 2025]  ? srso_alias_return_thunk+0x5/0xfbef5
[Vi feb 14 19:45:28 2025]  free_unref_folios+0x347/0x7d0
[Vi feb 14 19:45:28 2025]  folios_put_refs+0x121/0x1e0
[Vi feb 14 19:45:28 2025]  invalidate_inode_pages2_range+0x307/0x3a0
[Vi feb 14 19:45:28 2025]  fuse_open+0x1d8/0x2a0 [fuse]
[Vi feb 14 19:45:28 2025]  ? __pfx_fuse_open+0x10/0x10 [fuse]
[Vi feb 14 19:45:28 2025]  do_dentry_open+0x346/0x5e0
[Vi feb 14 19:45:28 2025]  vfs_open+0x2e/0xf0
[Vi feb 14 19:45:28 2025]  path_openat+0x841/0x12f0
[Vi feb 14 19:45:28 2025]  ? srso_alias_return_thunk+0x5/0xfbef5
[Vi feb 14 19:45:28 2025]  ? schedule+0x27/0xf0
[Vi feb 14 19:45:28 2025]  ? srso_alias_return_thunk+0x5/0xfbef5
[Vi feb 14 19:45:28 2025]  ? futex_wait_queue+0x65/0x90
[Vi feb 14 19:45:28 2025]  do_filp_open+0xd8/0x1a0
[Vi feb 14 19:45:28 2025]  ? srso_alias_return_thunk+0x5/0xfbef5
[Vi feb 14 19:45:28 2025]  do_sys_openat2+0xb4/0xe0
[Vi feb 14 19:45:28 2025]  __x64_sys_openat+0x55/0xb0
[Vi feb 14 19:45:28 2025]  do_syscall_64+0xb7/0x210
[Vi feb 14 19:45:28 2025]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[Vi feb 14 19:45:28 2025] RIP: 0033:0x7f63b3d69e45
[Vi feb 14 19:45:28 2025] Code: 8b 55 d0 48 89 45 b0 75 a0 44 89 55 9c e8 e3 21
f8 ff 44 8b 55 9c 89 da 4c 89 e6 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05
<48> 3d 00 f0 ff ff 77 33 44 89 c7 89 45 9c e8 38 22 f8 ff 8b 45 9c
[Vi feb 14 19:45:28 2025] RSP: 002b:00007f63ac1f99e0 EFLAGS: 00000293 ORIG_RAX:
0000000000000101
[Vi feb 14 19:45:28 2025] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007f63b3d69e45
[Vi feb 14 19:45:28 2025] RDX: 0000000000000000 RSI: 0000290c1cb49cc0 RDI:
00000000ffffff9c
[Vi feb 14 19:45:28 2025] RBP: 00007f63ac1f9a50 R08: 0000000000000000 R09:
0000000000000000
[Vi feb 14 19:45:28 2025] R10: 0000000000000000 R11: 0000000000000293 R12:
0000290c1cb49cc0
[Vi feb 14 19:45:28 2025] R13: 0000000000000000 R14: 0000000000008021 R15:
0000290c1c4676f8
[Vi feb 14 19:45:28 2025]  </TASK>
[Vi feb 14 19:45:28 2025] Modules linked in: snd_usb_audio snd_usbmidi_lib
snd_ump snd_rawmidi mc sctp ip6_udp_tunnel udp_tunnel ccm qrtr snd_seq_dummy
snd_hrtimer snd_seq snd_seq_device xfrm_user xfrm_algo xt_addrtype overlay
xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 nft_compat
nft_chain_nat nf_tables af_packet sch_fq_codel input_leds msr uinput
nvidia_drm(PO) nvidia_modeset(PO) nvidia_uvm(PO) f2fs snd_sof_amd_acp70
nls_iso8859_1 snd_sof_amd_acp63 nls_cp437 snd_sof_amd_vangogh crc32_generic
snd_sof_amd_rembrandt lz4hc_compress vfat hid_asus fat snd_sof_amd_renoir
lz4_compress amdgpu snd_sof_amd_acp snd_sof_pci mt7921e snd_sof_xtensa_dsp
mt7921_common snd_sof mt792x_lib mt76_connac_lib snd_sof_utils snd_pci_ps mt76
snd_hda_codec_realtek snd_soc_acpi_amd_match snd_amd_sdw_acpi soundwire_amd
soundwire_generic_allocation nvidia(PO) soundwire_bus snd_soc_sdca
snd_hda_codec_generic mac80211 snd_hda_scodec_component snd_soc_core
snd_hda_codec_hdmi snd_compress edac_mce_amd ac97_bus edac_core
snd_pcm_dmaengine
[Vi feb 14 19:45:28 2025]  snd_hda_intel joydev amdxcp intel_rapl_msr atkbd
drm_exec snd_rpl_pci_acp6x libps2 amd_atl snd_intel_dspcfg mousedev snd_acp_pci
vivaldi_fmap snd_intel_sdw_acpi intel_rapl_common gpu_sched
snd_acp_legacy_common drm_buddy ee1004 crct10dif_pclmul snd_hda_codec
drm_suballoc_helper cfg80211 snd_pci_acp6x crc32_pclmul asus_nb_wmi
snd_hda_core polyval_clmulni drm_display_helper polyval_generic snd_pci_acp5x
snd_hwdep asus_wmi drm_ttm_helper ghash_clmulni_intel ucsi_acpi
snd_rn_pci_acp3x snd_pcm platform_profile cec ttm snd_acp_config i2c_piix4
i8042 sha512_ssse3 typec_ucsi loop sha256_ssse3 hid_multitouch snd_soc_acpi
mac_hid sha1_ssse3 i2c_algo_bit sparse_keymap cpufreq_ondemand aesni_intel
snd_timer wmi_bmof rfkill gf128mul evdev crypto_simd snd cryptd roles
snd_pci_acp3x tpm_crb video rapl k10temp i2c_smbus tiny_power_button libarc4
crc16 soundcore thermal typec battery button ac wmi rtc_cmos xt_nat
asus_wireless amd_pmc i2c_hid_acpi tpm_tis nf_nat i2c_hid led_class
tpm_tis_core serio nf_conntrack
[Vi feb 14 19:45:28 2025]  nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter veth tun
tap macvlan bridge stp llc kvm_amd ccp kvm fuse efi_pstore configfs nfnetlink
efivarfs tpm libaescfb ecdh_generic ecc rng_core dmi_sysfs ip_tables autofs4
hid_generic usbhid hid xhci_pci nvme xhci_hcd nvme_core nvme_auth dm_mod dax
btrfs blake2b_generic libcrc32c crc32c_generic crc32c_intel xor raid6_pq
[Vi feb 14 19:45:28 2025] ---[ end trace 0000000000000000 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
