Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 415303DB1C8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jul 2021 05:10:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9Iux-0000D6-47; Fri, 30 Jul 2021 03:10:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1m9Iuv-0000Cz-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 03:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VZszAH/rREzJOZrqNADJLxpJLixw3DIJrPuSszYI9H4=; b=BmN86pnjcBgPKkuFR/K1UNynTg
 iomQwSvcPziwmk1bjTmAJkp6R1GOst5Ef7p7nqdujbkK2kFbrecPnBbUjHOpSI475A+0cb7sRGknr
 1znLsYQ6gwrjnuvT5/lJIUsJlfxlSzEZYuk2fBGCvP4vPD/SqfS2GltCrTeIGKh/CpBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VZszAH/rREzJOZrqNADJLxpJLixw3DIJrPuSszYI9H4=; b=M2rNBsWm0OcBxECzA30iXfJP95
 UNXNIvZSXPOObETJKikGkHK4E+fQVRicb5cuNQfelpk4atREQ6lhMPVrkAdlSlYXV9r+SuW2w06Wv
 2D1b326EF20HVPh47Pf7WjkU9rq96yPCdkvOnLG60GLmMFASqut10V+jkJI+4+zNX1Sw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9Iuu-007FV6-2Z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 03:10:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 60C4C60232
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Jul 2021 03:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627614623;
 bh=r+SkMgvksDDOhKhfZfsKEYkvJ+Dk86TQL8LOgrXy2No=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MJfhmmnJH4/Qr69LCXm+rypkBghJ1q4e4luAxj4nfKg/VCalkvdPhd/xGcCMhprWg
 uzJWBNa3E+gI0RUTIEBWBwgV4Xq1buhMuRX0NhwPiZLhgW98nX+/Abfh4gtOc58gs9
 /tkNEAgE+tK0gvrY00zqekOSkDgNZn2j3A8WRIKZS0CXx+FTcWQgEloIsc5SZoezZp
 JC0mn/HgU4ZVpl9E8D4FtFmymWjoApDvPwqiMh0vFa9OSZvd3dQ7HwygtiYfACjOwt
 bf2j4yrV12OuM44scXvUto0tZ1SZemSYkYoIOTaPtQd3KiUiP0n9Gg+Yy1wFSs6h9d
 tnemhgq0chm8A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4CF8A60EE0; Fri, 30 Jul 2021 03:10:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 30 Jul 2021 03:10:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leftzheng@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213877-202145-mlT0bD8aab@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213877-202145@https.bugzilla.kernel.org/>
References: <bug-213877-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9Iuu-007FV6-2Z
Subject: [f2fs-dev] [Bug 213877] Mount multiple SMR block devices exceed
 certain number cause system non-response
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=213877

--- Comment #2 from James Z (leftzheng@gmail.com) ---
[1.] Brief
With this patch, memory usage dropped from 1.5G per SMR disk to about 1G.
The read/write function works fine on disks with plenty of free space. However,
on a near-full disk, read operations cause panic.

[2.] A small shell script or example program which triggers the problem
[James@DataT01 /mnt/03]$ touch 123

[3.] Kernel Output
[51671.050646] BUG: kernel NULL pointer dereference, address: 0000000000000000
[51671.050652] #PF: supervisor read access in kernel mode
[51671.050654] #PF: error_code(0x0000) - not-present page
[51671.050656] PGD 0 P4D 0 
[51671.050660] Oops: 0000 [#1] SMP NOPTI
[51671.050663] CPU: 4 PID: 52263 Comm: f2fs_ckpt-8:96 Tainted: G        W      
  5.13.4-200.fc34.x86_64 #1
[51671.050666] Hardware name: Micro-Star International Co., Ltd. MS-7B79/X470
GAMING PRO MAX (MS-7B79), BIOS M.60 06/11/2020
[51671.050668] RIP: 0010:f2fs_issue_discard.isra.0+0x77/0x170 [f2fs]
[51671.050700] Code: 00 00 00 8b 40 48 8b bb 5c 04 00 00 41 29 c0 8d 4f ff 44
21 c1 89 c8 f7 d1 83 e1 07 c1 e8 03 48 03 42 18 ba 01 00 00 00 d3 e2 <0f> be 08
41 89 c8 41 09 d0 44 88 00 85 d1 75 07 83 ab 90 04 00 00
[51671.050702] RSP: 0018:ffffbe70c1893ca0 EFLAGS: 00010212
[51671.050705] RAX: 0000000000000000 RBX: ffff9f734424f000 RCX:
0000000000000007
[51671.050707] RDX: 0000000000000080 RSI: 0000000008270001 RDI:
0000000000000200
[51671.050709] RBP: 00000027ffffffd8 R08: 0000000008260000 R09:
0000000000000000
[51671.050711] R10: 000000000003de00 R11: 0000000000000004 R12:
0000000008270001
[51671.050713] R13: 0000000000000000 R14: 0000000008270000 R15:
ffff9f7345933840
[51671.050715] FS:  0000000000000000(0000) GS:ffff9f7456900000(0000)
knlGS:0000000000000000
[51671.050717] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[51671.050719] CR2: 0000000000000000 CR3: 0000000144932000 CR4:
0000000000350ee0
[51671.050721] Call Trace:
[51671.050726]  f2fs_clear_prefree_segments+0x439/0x6f0 [f2fs]
[51671.050750]  ? __raw_callee_save___native_queued_spin_unlock+0x11/0x1e
[51671.050756]  f2fs_write_checkpoint+0xccf/0x11d0 [f2fs]
[51671.050782]  __checkpoint_and_complete_reqs+0x78/0x160 [f2fs]
[51671.050803]  issue_checkpoint_thread+0x38/0xb0 [f2fs]
[51671.050823]  ? finish_wait+0x80/0x80
[51671.050827]  ? __checkpoint_and_complete_reqs+0x160/0x160 [f2fs]
[51671.050846]  kthread+0x127/0x150
[51671.050850]  ? set_kthread_struct+0x40/0x40
[51671.050852]  ret_from_fork+0x22/0x30
[51671.050858] Modules linked in: binfmt_misc f2fs nls_utf8 hfsplus hfs
crc32_generic lz4hc_compress lz4_compress isofs snd_seq_dummy snd_hrtimer
xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tftp nf_conntrack_tftp
bridge stp llc bonding tls nft_objref nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw
iptable_security rfkill ip_set nf_tables nfnetlink ip6table_filter ip6_tables
iptable_filter snd_hda_codec_realtek snd_hda_codec_generic sunrpc ledtrig_audio
snd_hda_codec_hdmi intel_rapl_msr intel_rapl_common snd_hda_intel
snd_intel_dspcfg vfat edac_mce_amd snd_intel_sdw_acpi fat snd_hda_codec kvm_amd
ppdev kvm snd_hda_core snd_hwdep irqbypass rapl snd_seq snd_seq_device pcspkr
wmi_bmof k10temp snd_pcm joydev
[51671.050910]  i2c_piix4 snd_timer snd soundcore parport_pc parport gpio_amdpt
gpio_generic acpi_cpufreq zram ip_tables radeon i2c_algo_bit drm_ttm_helper ttm
drm_kms_helper cec crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel drm sp5100_tco ixgbe ccp mdio dca r8169 wmi fuse
[51671.050932] CR2: 0000000000000000
[51671.050935] ---[ end trace 76f29393379353e4 ]---
[51671.050936] RIP: 0010:f2fs_issue_discard.isra.0+0x77/0x170 [f2fs]
[51671.050958] Code: 00 00 00 8b 40 48 8b bb 5c 04 00 00 41 29 c0 8d 4f ff 44
21 c1 89 c8 f7 d1 83 e1 07 c1 e8 03 48 03 42 18 ba 01 00 00 00 d3 e2 <0f> be 08
41 89 c8 41 09 d0 44 88 00 85 d1 75 07 83 ab 90 04 00 00
[51671.050960] RSP: 0018:ffffbe70c1893ca0 EFLAGS: 00010212
[51671.050962] RAX: 0000000000000000 RBX: ffff9f734424f000 RCX:
0000000000000007
[51671.050964] RDX: 0000000000000080 RSI: 0000000008270001 RDI:
0000000000000200
[51671.050966] RBP: 00000027ffffffd8 R08: 0000000008260000 R09:
0000000000000000
[51671.050967] R10: 000000000003de00 R11: 0000000000000004 R12:
0000000008270001
[51671.050969] R13: 0000000000000000 R14: 0000000008270000 R15:
ffff9f7345933840
[51671.050971] FS:  0000000000000000(0000) GS:ffff9f7456900000(0000)
knlGS:0000000000000000
[51671.050973] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[51671.050974] CR2: 0000000000000000 CR3: 0000000144932000 CR4:
0000000000350ee0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
