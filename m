Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF329468FD4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Dec 2021 05:13:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mu5NM-0001n9-Gd; Mon, 06 Dec 2021 04:13:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mu5NK-0001n3-JI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Dec 2021 04:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rmgxib70B6VFFHPxfh4KZ6jR5ng4zB+i1rqtlFAuSWI=; b=c5hDa9zES1mrwizZ1Or75ZRfwI
 HOHydd3vk8XPVVWNFT1RVMUjJuLBUaoI8i4vkfRH8iRw2tU2wu8hlTuT6OWz1DKKE+g8W4L/ZgzD2
 3keexjr0eNTOSzXmy5bjFp9qnE1NOHhHJJqkGlEESxOdmR24x0xWxIUz34xayNsf8Bwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Rmgxib70B6VFFHPxfh4KZ6jR5ng4zB+i1rqtlFAuSWI=; b=B
 hAjLzP2/1bH3V2tL3LLLgOnLKvNzzgMT/0Xh4yu/nEY/rznkyPCPsmM48BTPv2Zt3BkfcBoBvl0c7
 7oKNAPQPtQ9rrPpGpf8Sq/1yYXRYbWjQV4e193ek3Sgr4mDRw3EW8V1C+Ho1AaosN95OsiJfyUJU7
 vZezaV3H8DDaJ4ao=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mu5NI-005iX8-MT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Dec 2021 04:13:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60CA5B80EDB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Dec 2021 04:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17889C341C4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Dec 2021 04:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638763977;
 bh=0pynGSoU7n8oGRDzW7GQlXHzZP1rki5n7WpIv7v/fJo=;
 h=From:To:Subject:Date:From;
 b=j7kE/uve0fnT9T4j4GyH9pYNjfvKQHccl/mbpy/EiFFV3hH3Iq1cO1dOKnDwxSo8B
 yWjVTQ2GqtsWmdWYmlnvp0cmQbCA2iFx08+pfFkTu/3nQr3VSome/7tnYlr3/qJYIE
 nlxU1B77xVVpYEZu1YyggO0g+HyhMwg9PM+JDXV72w38aHmyUG0/vAUqUhNSGm/8z2
 Hj3tZ8kX4ZqN+JSAYBkui0iPlZrNJMXVwh3WbfpkP8bNiZth8i22g8lVXjhIhoag/F
 oTTXNUUCgYGYTeoni1l4JwHrpcSXIm+YG2MHqeQirkRkg3dRsHCuHZ4Lc+Kf8IKBGD
 xCrSJ/72X9TOA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D5AC061106; Mon,  6 Dec 2021 04:12:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 06 Dec 2021 04:12:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wenqingliu0120@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215231-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215231 Bug ID:
 215231 Summary: kernel NULL pointer dereference triggered in
 folio_mark_dirty()
 when mount and operate on a crafted f2fs image Product: File System Version:
 2.5 Kernel Version: 5.16-rc3, 5.15 [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mu5NI-005iX8-MT
Subject: [f2fs-dev] [Bug 215231] New: kernel NULL pointer dereference
 triggered in folio_mark_dirty() when mount and operate on a crafted f2fs
 image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215231

            Bug ID: 215231
           Summary: kernel NULL pointer dereference triggered in
                    folio_mark_dirty() when mount and operate on a crafted
                    f2fs image
           Product: File System
           Version: 2.5
    Kernel Version: 5.16-rc3, 5.15.X
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: wenqingliu0120@gmail.com
        Regression: No

Created attachment 299909
  --> https://bugzilla.kernel.org/attachment.cgi?id=299909&action=edit
crafted image and .config file

- Overview 
kernel NULL pointer dereference triggered  in folio_mark_dirty() when mount and
operate on a crafted f2fs image

- Reproduce 
tested on kernel 5.16-rc3, 5.15.X under root

# mkdir mnt
# mount -t f2fs tmp1.img mnt
# touch tmp
# cp tmp mnt

- Kernel dump
[   41.932734] F2FS-fs (loop0): sanity_check_inode: inode (ino=49) extent info
[5942, 4294180864, 4] is incorrect, run fsck to fix
[   41.932743] F2FS-fs (loop0): Inconsistent error blkaddr:5942, sit bitmap:0
[   41.932811] ------------[ cut here ]------------
[   41.932811] WARNING: CPU: 0 PID: 910 at fs/f2fs/checkpoint.c:154
f2fs_is_valid_blkaddr+0x1d6/0x390 [f2fs]
[   41.932824] Modules linked in: f2fs crc32_generic joydev input_leds
serio_raw qemu_fw_cfg iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi
autofs4 btrfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx xor raid6_pq raid1 raid0 multipath
linear qxl drm_ttm_helper ttm drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops drm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel hid_generic
psmouse usbhid hid aesni_intel crypto_simd cryptd
[   41.932840] CPU: 0 PID: 910 Comm: cp Tainted: G        W         5.16.0-rc3
#2
[   41.932842] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.13.0-1ubuntu1.1 04/01/2014
[   41.932842] RIP: 0010:f2fs_is_valid_blkaddr+0x1d6/0x390 [f2fs]
[   41.932853] Code: fe ff ff 83 fb 07 0f 85 bb fe ff ff 0f b6 c8 89 ea 48 c7
c6 c8 1b 70 a0 4c 89 e7 88 04 24 e8 31 52 ff ff f0 41 80 4c 24 48 04 <0f> 0b 0f
b6 04 24 e9 92 fe ff ff 83 fa 09 0f 85 15 01 00 00 48 8b
[   41.932854] RSP: 0018:ffffc90000687968 EFLAGS: 00010206
[   41.932855] RAX: 0000000000000000 RBX: 0000000000000007 RCX:
0000000000000001
[   41.932855] RDX: 0000000000000000 RSI: ffffffff8232a839 RDI:
00000000ffffffff
[   41.932856] RBP: 0000000000001736 R08: 0000000000000000 R09:
0000000000000001
[   41.932857] R10: 00000009cb0c1476 R11: 0000000000000001 R12:
ffff888110275000
[   41.932857] R13: 0000000000004000 R14: ffff888105f460f0 R15:
ffff888110f4a000
[   41.932858] FS:  00007f3530f15800(0000) GS:ffff8882f5c00000(0000)
knlGS:0000000000000000
[   41.932859] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.932860] CR2: 0000562fdc7b15c8 CR3: 000000010319c002 CR4:
0000000000370ef0
[   41.932862] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   41.932863] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   41.932863] Call Trace:
[   41.932864]  <TASK>
[   41.932865]  f2fs_iget+0xeee/0x11b0 [f2fs]
[   41.932874]  do_garbage_collect+0xf0f/0x16a0 [f2fs]
[   41.932886]  ? _raw_spin_lock+0x13/0x30
[   41.932888]  f2fs_gc+0x1d3/0xd90 [f2fs]
[   41.932899]  ? _raw_spin_unlock+0x16/0x30
[   41.932901]  ? f2fs_balance_fs+0x13a/0x570 [f2fs]
[   41.932915]  f2fs_balance_fs+0x13a/0x570 [f2fs]
[   41.932927]  ? _raw_spin_lock+0x13/0x30
[   41.932929]  ? __d_instantiate+0x34/0xf0
[   41.932931]  f2fs_create+0x285/0x840 [f2fs]
[   41.932940]  path_openat+0xe6d/0x1040
[   41.932943]  do_filp_open+0xc5/0x140
[   41.932945]  ? __check_object_size+0xd4/0x1a0
[   41.932948]  ? _raw_spin_unlock+0x16/0x30
[   41.932949]  ? do_sys_openat2+0x23a/0x310
[   41.932950]  do_sys_openat2+0x23a/0x310
[   41.932952]  do_sys_open+0x57/0x80
[   41.932953]  do_syscall_64+0x37/0xb0
[   41.932955]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   41.932956] RIP: 0033:0x7f35303e4d5e
[   41.932957] Code: 25 00 00 41 00 3d 00 00 41 00 74 48 48 8d 05 91 0c 2e 00
8b 00 85 c0 75 69 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 <48> 3d 00
f0 ff ff 0f 87 a6 00 00 00 48 8b 4c 24 28 64 48 33 0c 25
[   41.932958] RSP: 002b:00007ffe4b2cb810 EFLAGS: 00000246 ORIG_RAX:
0000000000000101
[   41.932959] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007f35303e4d5e
[   41.932960] RDX: 00000000000000c1 RSI: 0000561d23a37cc0 RDI:
00000000ffffff9c
[   41.932961] RBP: 00007ffe4b2cbcb0 R08: 00007ffe4b2cbe70 R09:
0000000000000000
[   41.932961] R10: 00000000000001a4 R11: 0000000000000246 R12:
00007ffe4b2cbe70
[   41.932962] R13: 0000000000000000 R14: 00007ffe4b2cbe00 R15:
00007ffe4b2cc7b4
[   41.932963]  </TASK>
[   41.932964] ---[ end trace 1bf4370a7a01de20 ]---
[   41.932965] F2FS-fs (loop0): sanity_check_inode: inode (ino=49) extent info
[5942, 4294180864, 4] is incorrect, run fsck to fix
[   41.933060] F2FS-fs (loop0): f2fs_check_nid_range: out-of-range
nid=31340049, run fsck to fix.
[   41.934251] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   41.934338] #PF: supervisor instruction fetch in kernel mode
[   41.934409] #PF: error_code(0x0010) - not-present page
[   41.934484] PGD 0 P4D 0 
[   41.934561] Oops: 0010 [#1] PREEMPT SMP NOPTI
[   41.934646] CPU: 1 PID: 910 Comm: cp Tainted: G        W         5.16.0-rc3
#2
[   41.934741] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.13.0-1ubuntu1.1 04/01/2014
[   41.934893] RIP: 0010:0x0
[   41.935041] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
[   41.935174] RSP: 0018:ffffc90000687928 EFLAGS: 00010246
[   41.935314] RAX: 0000000000000000 RBX: ffffea000478be40 RCX:
0000000000000001
[   41.935456] RDX: 0017ffffc0000015 RSI: 0000000000000000 RDI:
ffffea000478be40
[   41.935604] RBP: ffff888105f44680 R08: ffffc90000687808 R09:
0000000000000000
[   41.935818] R10: 000000003ee1af28 R11: 0000000000000001 R12:
00000000fffffffe
[   41.935993] R13: ffffea000478be68 R14: 0017ffffc0000015 R15:
ffff888105f44680
[   41.936163] FS:  00007f3530f15800(0000) GS:ffff8882f5c80000(0000)
knlGS:0000000000000000
[   41.936344] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.936540] CR2: ffffffffffffffd6 CR3: 000000010319c006 CR4:
0000000000370ee0
[   41.936738] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   41.936950] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   41.937254] Call Trace:
[   41.937470]  <TASK>
[   41.937683]  folio_mark_dirty+0x33/0x50
[   41.937935]  move_data_page+0x2dd/0x460 [f2fs]
[   41.938188]  do_garbage_collect+0xc18/0x16a0 [f2fs]
[   41.938412]  ? _raw_spin_lock+0x13/0x30
[   41.938628]  f2fs_gc+0x1d3/0xd90 [f2fs]
[   41.938856]  ? _raw_spin_unlock+0x16/0x30
[   41.939078]  ? f2fs_balance_fs+0x13a/0x570 [f2fs]
[   41.939321]  f2fs_balance_fs+0x13a/0x570 [f2fs]
[   41.939568]  ? _raw_spin_lock+0x13/0x30
[   41.939802]  ? __d_instantiate+0x34/0xf0
[   41.940040]  f2fs_create+0x285/0x840 [f2fs]
[   41.940290]  path_openat+0xe6d/0x1040
[   41.940536]  do_filp_open+0xc5/0x140
[   41.940782]  ? __check_object_size+0xd4/0x1a0
[   41.941034]  ? _raw_spin_unlock+0x16/0x30
[   41.941288]  ? do_sys_openat2+0x23a/0x310
[   41.941582]  do_sys_openat2+0x23a/0x310
[   41.941842]  do_sys_open+0x57/0x80
[   41.942290]  do_syscall_64+0x37/0xb0
[   41.942607]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   41.942881] RIP: 0033:0x7f35303e4d5e
[   41.943156] Code: 25 00 00 41 00 3d 00 00 41 00 74 48 48 8d 05 91 0c 2e 00
8b 00 85 c0 75 69 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 <48> 3d 00
f0 ff ff 0f 87 a6 00 00 00 48 8b 4c 24 28 64 48 33 0c 25
[   41.943761] RSP: 002b:00007ffe4b2cb810 EFLAGS: 00000246 ORIG_RAX:
0000000000000101
[   41.944078] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007f35303e4d5e
[   41.944403] RDX: 00000000000000c1 RSI: 0000561d23a37cc0 RDI:
00000000ffffff9c
[   41.944762] RBP: 00007ffe4b2cbcb0 R08: 00007ffe4b2cbe70 R09:
0000000000000000
[   41.945195] R10: 00000000000001a4 R11: 0000000000000246 R12:
00007ffe4b2cbe70
[   41.945631] R13: 0000000000000000 R14: 00007ffe4b2cbe00 R15:
00007ffe4b2cc7b4
[   41.946058]  </TASK>
[   41.946479] Modules linked in: f2fs crc32_generic joydev input_leds
serio_raw qemu_fw_cfg iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi
autofs4 btrfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov
async_memcpy async_pq async_xor async_tx xor raid6_pq raid1 raid0 multipath
linear qxl drm_ttm_helper ttm drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops drm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel hid_generic
psmouse usbhid hid aesni_intel crypto_simd cryptd
[   41.948320] CR2: 0000000000000000
[   41.948750] ---[ end trace 1bf4370a7a01de21 ]---
[   41.949238] RIP: 0010:0x0
[   41.949648] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
[   41.950064] RSP: 0018:ffffc90000687928 EFLAGS: 00010246
[   41.950408] RAX: 0000000000000000 RBX: ffffea000478be40 RCX:
0000000000000001
[   41.950754] RDX: 0017ffffc0000015 RSI: 0000000000000000 RDI:
ffffea000478be40
[   41.951098] RBP: ffff888105f44680 R08: ffffc90000687808 R09:
0000000000000000
[   41.951439] R10: 000000003ee1af28 R11: 0000000000000001 R12:
00000000fffffffe
[   41.951778] R13: ffffea000478be68 R14: 0017ffffc0000015 R15:
ffff888105f44680
[   41.952118] FS:  00007f3530f15800(0000) GS:ffff8882f5c80000(0000)
knlGS:0000000000000000
[   41.952555] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.953157] CR2: ffffffffffffffd6 CR3: 000000010319c006 CR4:
0000000000370ee0
[   41.953687] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   41.954237] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
