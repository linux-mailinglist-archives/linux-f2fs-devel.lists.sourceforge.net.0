Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B79C2C68
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Nov 2024 13:01:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9k9h-0002DV-Cn;
	Sat, 09 Nov 2024 12:01:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1t9k9f-0002DO-4U
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Nov 2024 12:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qOn8+zP/BWeXgylpJDYXhEYZa3CXMFerWlk6Dn+VgNA=; b=Mt3baGeV3oSpQYAaud1xF29qXE
 IhplR1Jonk0sITnJA/zWiFtnUvtEEnl/SPxfQ1uLZlEFiAjyCGzWtstknpt1xVmw7C+sJoKG94HW+
 6fZuZykOG3//MiGht0xQ4g5byLMKRdMKTmr+A/yr3kxfuyaU+91rkOCXemow+yi3vQSE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qOn8+zP/BWeXgylpJDYXhEYZa3CXMFerWlk6Dn+VgNA=; b=H
 CNRBWONOBGHYG1MZmiwaj9DtnPlY48234xFM3YuO09UPKnDJh/6KCZXP1A9f6qEDoUqerXldAm/qq
 4YdMtjNUUHaVW5+4BihsdnLqGsADXr99bF/Obtq6c2dMNntti/YxfWNLfouqaAoYS7pfe1FAiPep3
 8BIcDncSrRX9VO7c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t9k9d-0001PN-Te for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Nov 2024 12:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF2175C04C9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  9 Nov 2024 12:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28945C4CECE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  9 Nov 2024 12:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731153675;
 bh=yS043fdSmTCPgWdAZ0fdTK0qzwyRfsZO4OAVxr6gEjo=;
 h=From:To:Subject:Date:From;
 b=u28WlYCfzjO5p6heWa5V7v4T76zbtyRE3ZAh8cPBmvhDmQQL5juK2jbAamNqiegq+
 Cc/eP7ONIBDDLCO8LUA9fHknX0RrmkQZRMSzQzZ/xO1X22LNM3pDqL6JLEvh65IlZE
 idMu+uET/RjwF9EkDEItqsHKAIodcRnIk+ssVKiRSBx+hh8rS5sltv6GewlhqZKIae
 +tlskqhJHRMQaXw33G/ptb5J+MiPYm2Xa9LEp+tmiPtSCV+InZZUnkX3fR2KAeRe+D
 +Z4fdgabQRw8OJ/pUBdzvAjLD55LEyuYlQA80U+FHAOfOBSzMJBx+SvHG+ULorvuiJ
 6SYtetW9tuxqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2015EC53BC2; Sat,  9 Nov 2024 12:01:15 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 09 Nov 2024 12:01:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: piergiorgio.sartor@nexgo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=219484 Bug ID:
 219484 Summary: f2fs discard causes kernel NULL pointer dereferencing Product:
 File System Version: 2.5 Hardware: Intel OS: Linux Status: NEW Severity:
 blocking Priority: P3 Component: f2fs A [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9k9d-0001PN-Te
Subject: [f2fs-dev] [Bug 219484] New: f2fs discard causes kernel NULL
 pointer dereferencing
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

https://bugzilla.kernel.org/show_bug.cgi?id=219484

            Bug ID: 219484
           Summary: f2fs discard causes kernel NULL pointer dereferencing
           Product: File System
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: piergiorgio.sartor@nexgo.de
        Regression: No

Hi everybody,
this issue was reported to Fedora Bugzilla and to the f2fs-devel mailing list,
to no avail.
I'm trying my luck here now.
I've to say this is really an issue, since it's blocking any kernel upgrade.

Fedora Bugzilla reference: https://bugzilla.redhat.com/show_bug.cgi?id=2305521

Working up to 6.9.12, after not anymore.

Some explanation.
I've a small script for backup over LV.
The FS is f2fs on top of LV.
The script creates a snapshot, mount it, performs a backup copy, remove the
snapshot.
LVM is configured to issue discards on LV removal.
Kernel up to 6.9.x works fine, after that I get a NULL pointer dereferencing in
f2fs on snapshot *creation* (new information, previously was "removal").
Furthermore, it depends on the order of snapshot.
There are 3 LV, "root", "home" and "data". Sometimes, if the snapshot is first
done for "root", the others work. Not always.
"root" is the smallest LV.
If the the first snapshot is "home" (largest LV), there is always a crash.

Unfortunately, I cannot test on this machine, so if not already fixed, I'll
have some difficulties to test kernel patches.
I'm considering to setup something else, but it is not really straightforward
(because is not always happening).

Details also here: https://bugzilla.redhat.com/show_bug.cgi?id=2305521

Kernel trace below:

Aug 17 10:06:41 kernel: F2FS-fs (dm-6): recover fsync data on readonly fs
Aug 17 10:06:41 kernel: F2FS-fs (dm-6): Mounted with checkpoint version =
adc5452
Aug 17 10:07:27 kernel: ------------[ cut here ]------------
Aug 17 10:07:27 kernel: WARNING: CPU: 2 PID: 969 at fs/f2fs/segment.c:1330
__submit_discard_cmd+0x27d/0x400 [f2fs]
Aug 17 10:07:27 kernel: Modules linked in: rpcrdma rdma_cm iw_cm ib_cm ib_core
dimlib nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4
+nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_tables ebtable_nat
ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security
iptable_nat nf_nat
+nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw
iptable_security ip_set ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter ip_tables
+qrtr hwmon_vid vfat fat spi_nor mtd x86_pkg_temp_thermal intel_powerclamp
coretemp iTCO_wdt mei_hdcp kvm_intel mei_pxp intel_pmc_bxt iTCO_vendor_support
ee1004
+intel_rapl_msr kvm eeepc_wmi asus_wmi sparse_keymap platform_profile rfkill
r8169 intel_cstate wmi_bmof processor_thermal_device_pci_legacy realtek
processor_thermal_device
+spi_intel_pci spi_intel i2c_i801 mei_me i2c_smbus processor_thermal_wt_hint
mei processor_thermal_rfim idma64 processor_thermal_rapl intel_rapl_common
+processor_thermal_wt_req processor_thermal_power_floor
Aug 17 10:07:27 kernel:  processor_thermal_mbox intel_soc_dts_iosf
intel_pmc_core int3403_thermal int340x_thermal_zone intel_vsec pmt_telemetry
int3400_thermal acpi_pad
+pmt_class acpi_thermal_rel acpi_tad nfsd auth_rpcgss nfs_acl lockd grace
sunrpc fuse loop nfnetlink f2fs crc32_generic lz4hc_compress lz4_compress
dm_crypt i915
+crct10dif_pclmul crc32_pclmul crc32c_intel polyval_generic ghash_clmulni_intel
sha512_ssse3 sdhci_pci cqhci sdhci i2c_algo_bit drm_buddy ttm sha256_ssse3
+spi_pxa2xx_platform uas mmc_core drm_display_helper usb_storage sha1_ssse3
dw_dmac cec video pinctrl_jasperlake wmi
Aug 17 10:07:27 kernel: CPU: 2 PID: 969 Comm: f2fs_discard-25 Not tainted
6.10.3-200.fc40.x86_64 #1
Aug 17 10:07:27 kernel: Hardware name: ASUSTeK COMPUTER INC. MINIPC
PN41-S1/PN41-S1, BIOS 0405 07/07/2022
Aug 17 10:07:27 kernel: RIP: 0010:__submit_discard_cmd+0x27d/0x400 [f2fs]
Aug 17 10:07:27 kernel: Code: 8b 00 3b 46 10 0f 83 ee 00 00 00 48 c7 44 24 50
00 00 00 00 44 39 6c 24 2c 0f 83 a1 fe ff ff 8b 6c 24 2c 31 d2 e9 9e fe ff ff
<0f> 0b 48 8b 44
+24 48 f0 80 08 04 e9 e9 fe ff ff 65 8b 15 48 3c 53
Aug 17 10:07:27 kernel: RSP: 0018:ffffbfe1c07dfd30 EFLAGS: 00010246
Aug 17 10:07:27 kernel: RAX: 0000000000000000 RBX: ffff9b28055be018 RCX:
000000001d46ffff
Aug 17 10:07:27 kernel: RDX: 000000001d470000 RSI: 000000001d470000 RDI:
ffff9b28004c2580
Aug 17 10:07:27 kernel: RBP: 0000000000000000 R08: ffffbfe1c07dfd80 R09:
ffffbfe1c07dfe78
Aug 17 10:07:27 kernel: R10: ffff9b2806401000 R11: ffff9b28004c2580 R12:
00000000055be000
Aug 17 10:07:27 kernel: R13: 0000000000000200 R14: ffff9b28055bc000 R15:
ffff9b28101c6d90
Aug 17 10:07:27 kernel: FS:  0000000000000000(0000) GS:ffff9b2b70900000(0000)
knlGS:0000000000000000
Aug 17 10:07:27 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 17 10:07:27 kernel: CR2: 00005589f3976000 CR3: 0000000130c4e000 CR4:
0000000000350ef0
Aug 17 10:07:27 kernel: Call Trace:
Aug 17 10:07:27 kernel:  <TASK>
Aug 17 10:07:27 kernel:  ? __submit_discard_cmd+0x27d/0x400 [f2fs]
Aug 17 10:07:27 kernel:  ? __warn.cold+0x8e/0xe8
Aug 17 10:07:27 kernel:  ? __submit_discard_cmd+0x27d/0x400 [f2fs]
Aug 17 10:07:27 kernel:  ? report_bug+0xff/0x140
Aug 17 10:07:27 kernel:  ? handle_bug+0x3c/0x80
Aug 17 10:07:27 kernel:  ? exc_invalid_op+0x17/0x70
Aug 17 10:07:27 kernel:  ? asm_exc_invalid_op+0x1a/0x20
Aug 17 10:07:27 kernel:  ? __submit_discard_cmd+0x27d/0x400 [f2fs]
Aug 17 10:07:27 kernel:  __issue_discard_cmd+0x1ca/0x350 [f2fs]
Aug 17 10:07:27 kernel:  issue_discard_thread+0x191/0x480 [f2fs]
Aug 17 10:07:27 kernel:  ? __pfx_autoremove_wake_function+0x10/0x10
Aug 17 10:07:27 kernel:  ? __pfx_issue_discard_thread+0x10/0x10 [f2fs]
Aug 17 10:07:27 kernel:  kthread+0xcf/0x100
Aug 17 10:07:27 kernel:  ? __pfx_kthread+0x10/0x10
Aug 17 10:07:27 kernel:  ret_from_fork+0x31/0x50
Aug 17 10:07:27 kernel:  ? __pfx_kthread+0x10/0x10
Aug 17 10:07:27 kernel:  ret_from_fork_asm+0x1a/0x30
Aug 17 10:07:27 kernel:  </TASK>
Aug 17 10:07:27 kernel: ---[ end trace 0000000000000000 ]---
Aug 17 10:07:27 kernel: BUG: kernel NULL pointer dereference, address:
0000000000000010
Aug 17 10:07:27 kernel: #PF: supervisor write access in kernel mode
Aug 17 10:07:27 kernel: #PF: error_code(0x0002) - not-present page
Aug 17 10:07:27 kernel: PGD 1069f9067 P4D 1069f9067 PUD 0
Aug 17 10:07:27 kernel: Oops: Oops: 0002 [#1] PREEMPT SMP NOPTI
Aug 17 10:07:27 kernel: CPU: 2 PID: 969 Comm: f2fs_discard-25 Tainted: G       
W          6.10.3-200.fc40.x86_64 #1
Aug 17 10:07:27 kernel: Hardware name: ASUSTeK COMPUTER INC. MINIPC
PN41-S1/PN41-S1, BIOS 0405 07/07/2022
Aug 17 10:07:27 kernel: RIP: 0010:__submit_discard_cmd+0x203/0x400 [f2fs]
Aug 17 10:07:27 kernel: Code: 89 4c 24 20 e8 ee 2e db ca 84 c0 74 14 48 8b 4c
24 20 4c 89 63 08 49 89 5f 28 49 89 4f 30 4c 89 21 48 8b 7c 24 50 8b 44 24 44
<09> 47 10 4c 89
+7f 40 48 c7 47 38 a0 f8 af c0 e8 29 8f d0 ca f0 41
Aug 17 10:07:27 kernel: RSP: 0018:ffffbfe1c07dfd30 EFLAGS: 00010202
Aug 17 10:07:27 kernel: RAX: 0000000000000000 RBX: ffff9b28055be018 RCX:
ffff9b28055be018
Aug 17 10:07:27 kernel: RDX: ffff9b28055be018 RSI: ffff9b28055be018 RDI:
0000000000000000
Aug 17 10:07:27 kernel: RBP: 0000000000000000 R08: ffff9b28055be018 R09:
ffffbfe1c07dfe78
Aug 17 10:07:27 kernel: R10: ffff9b2806401000 R11: ffff9b28004c2580 R12:
ffff9b28101c6db8
Aug 17 10:07:27 kernel: R13: 0000000000000200 R14: ffff9b28055bc000 R15:
ffff9b28101c6d90
Aug 17 10:07:27 kernel: FS:  0000000000000000(0000) GS:ffff9b2b70900000(0000)
knlGS:0000000000000000
Aug 17 10:07:27 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 17 10:07:27 kernel: CR2: 0000000000000010 CR3: 0000000130c4e000 CR4:
0000000000350ef0
Aug 17 10:07:27 kernel: Call Trace:
Aug 17 10:07:27 kernel:  <TASK>
Aug 17 10:07:27 kernel:  ? __die_body.cold+0x19/0x27
Aug 17 10:07:27 kernel:  ? page_fault_oops+0x15a/0x2f0
Aug 17 10:07:27 kernel:  ? __submit_discard_cmd+0x27d/0x400 [f2fs]
Aug 17 10:07:27 kernel:  ? exc_page_fault+0x7e/0x180
Aug 17 10:07:27 kernel:  ? asm_exc_page_fault+0x26/0x30
Aug 17 10:07:27 kernel:  ? __submit_discard_cmd+0x203/0x400 [f2fs]
Aug 17 10:07:27 kernel:  __issue_discard_cmd+0x1ca/0x350 [f2fs]
Aug 17 10:07:27 kernel:  issue_discard_thread+0x191/0x480 [f2fs]
Aug 17 10:07:27 kernel:  ? __pfx_autoremove_wake_function+0x10/0x10
Aug 17 10:07:27 kernel:  ? __pfx_issue_discard_thread+0x10/0x10 [f2fs]
Aug 17 10:07:27 kernel:  kthread+0xcf/0x100
Aug 17 10:07:27 kernel:  ? __pfx_kthread+0x10/0x10
Aug 17 10:07:27 kernel:  ret_from_fork+0x31/0x50
Aug 17 10:07:27 kernel:  ? __pfx_kthread+0x10/0x10
Aug 17 10:07:27 kernel:  ret_from_fork_asm+0x1a/0x30
Aug 17 10:07:27 kernel:  </TASK>
Aug 17 10:07:27 kernel: Modules linked in: rpcrdma rdma_cm iw_cm ib_cm ib_core
dimlib nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4
+nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_tables ebtable_nat
ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security
iptable_nat nf_nat
+nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw
iptable_security ip_set ebtable_filter ebtables ip6table_filter ip6_tables
iptable_filter ip_tables
+qrtr hwmon_vid vfat fat spi_nor mtd x86_pkg_temp_thermal intel_powerclamp
coretemp iTCO_wdt mei_hdcp kvm_intel mei_pxp intel_pmc_bxt iTCO_vendor_support
ee1004
+intel_rapl_msr kvm eeepc_wmi asus_wmi sparse_keymap platform_profile rfkill
r8169 intel_cstate wmi_bmof processor_thermal_device_pci_legacy realtek
processor_thermal_device
+spi_intel_pci spi_intel i2c_i801 mei_me i2c_smbus processor_thermal_wt_hint
mei processor_thermal_rfim idma64 processor_thermal_rapl intel_rapl_common
+processor_thermal_wt_req processor_thermal_power_floor
Aug 17 10:07:27 kernel:  processor_thermal_mbox intel_soc_dts_iosf
intel_pmc_core int3403_thermal int340x_thermal_zone intel_vsec pmt_telemetry
int3400_thermal acpi_pad
+pmt_class acpi_thermal_rel acpi_tad nfsd auth_rpcgss nfs_acl lockd grace
sunrpc fuse loop nfnetlink f2fs crc32_generic lz4hc_compress lz4_compress
dm_crypt i915
+crct10dif_pclmul crc32_pclmul crc32c_intel polyval_generic ghash_clmulni_intel
sha512_ssse3 sdhci_pci cqhci sdhci i2c_algo_bit drm_buddy ttm sha256_ssse3
+spi_pxa2xx_platform uas mmc_core drm_display_helper usb_storage sha1_ssse3
dw_dmac cec video pinctrl_jasperlake wmi
Aug 17 10:07:27 kernel: CR2: 0000000000000010
Aug 17 10:07:27 kernel: ---[ end trace 0000000000000000 ]---
Aug 17 10:07:27 kernel: RIP: 0010:__submit_discard_cmd+0x203/0x400 [f2fs]
Aug 17 10:07:27 kernel: Code: 89 4c 24 20 e8 ee 2e db ca 84 c0 74 14 48 8b 4c
24 20 4c 89 63 08 49 89 5f 28 49 89 4f 30 4c 89 21 48 8b 7c 24 50 8b 44 24 44
<09> 47 10 4c 89
+7f 40 48 c7 47 38 a0 f8 af c0 e8 29 8f d0 ca f0 41
Aug 17 10:07:27 kernel: RSP: 0018:ffffbfe1c07dfd30 EFLAGS: 00010202
Aug 17 10:07:27 kernel: RAX: 0000000000000000 RBX: ffff9b28055be018 RCX:
ffff9b28055be018
Aug 17 10:07:27 kernel: RDX: ffff9b28055be018 RSI: ffff9b28055be018 RDI:
0000000000000000
Aug 17 10:07:27 kernel: RBP: 0000000000000000 R08: ffff9b28055be018 R09:
ffffbfe1c07dfe78
Aug 17 10:07:27 kernel: R10: ffff9b2806401000 R11: ffff9b28004c2580 R12:
ffff9b28101c6db8
Aug 17 10:07:27 kernel: R13: 0000000000000200 R14: ffff9b28055bc000 R15:
ffff9b28101c6d90
Aug 17 10:07:27 kernel: R13: 0000000000000200 R14: ffff9b28055bc000 R15:
ffff9b28101c6d90
Aug 17 10:07:27 kernel: FS:  0000000000000000(0000) GS:ffff9b2b70900000(0000)
knlGS:0000000000000000
Aug 17 10:07:27 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 17 10:07:27 kernel: CR2: 0000000000000010 CR3: 0000000130c4e000 CR4:
0000000000350ef0
Aug 17 10:07:27 kernel: note: f2fs_discard-25[969] exited with irqs disabled
Aug 17 10:07:27 kernel: ------------[ cut here ]------------


Thanks,

bye,

pg

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
