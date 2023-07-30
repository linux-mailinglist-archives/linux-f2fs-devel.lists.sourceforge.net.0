Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B87684E3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Jul 2023 13:06:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qQ4Fo-0003XD-Um;
	Sun, 30 Jul 2023 11:06:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1qQ4Fn-0003X6-EK
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 30 Jul 2023 11:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lPWs0ie01yAKHLlU07zAXqZbEMixDw9hgCeOHzes/p4=; b=I2KYB5Rk6UrAu+nCer4CQyKApu
 WOEvrRJKIL+HTKdGDLnIUDP/2mY513/zKnZooUOh87jqJnSKHE6VwfQ18Nvkbo/Xa1uEGbfZlJUcw
 3EIjjCw4PqY6D1arxD9gZ6SNWT7mqUIR6Iuw2ypftof35Ccg5OXZpwe9yiAE54HcGcHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lPWs0ie01yAKHLlU07zAXqZbEMixDw9hgCeOHzes/p4=; b=fSMlt+CeD4Y986abLDBFzSxVqr
 b0uBXex+e2hzbG/dza9rF1aiG27m3WoxwYJhBurFWeCzf34Fr8zlY+EIjlyUUkqoI/4ynQqbZ5v2B
 19EQuuDT5u7bq1BMrb/fpzpq7QMcLjJ11tLabweiZx2dO6IsEvT+cjAtbvkT6kHOq5yU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qQ4Fi-0008Rd-Fv for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 30 Jul 2023 11:06:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E79C60C0B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 30 Jul 2023 11:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EB27C43391
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 30 Jul 2023 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690715174;
 bh=zTS4+bFQV9kgKmd+yUtShzaMo4XCMsJkVWNGVGk1Dgs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s0U+8yhVB28aVCNdHXlG6+2yeXmku0XYXLbtHKiuLBg/SlmjxBHTOo0pyo/W1L/x7
 G4KxxDdAnTJg77vYBagKeV0t/WwuuWG1F/SxMOUj1XbxILtqoaphQHdN2HcD8qVxFl
 In4Svye3u4lTn8MZ9EE3WiKjwpO5ObRzCWRnzbwv87Zoi8tjNgWNg0EHDYC8mb0JbU
 ex06nRruVdPmRQFljrMmTzDe5kJ8mVGr4e/XGB7SGyhId1kCX07o2+kojCm/vkGOrf
 YMGGg700tGBCNsgsTWGATKRgusqdE7OYTT/SMcixxQYyzeuGjtWMTGBgxUQ2rmViSM
 8Ibjucjmw0JnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4FCCAC53BD1; Sun, 30 Jul 2023 11:06:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 30 Jul 2023 11:06:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aleks_@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216050-202145-4rQB1qvIX8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 kelak
 (aleks_@gmx.net)
 changed: What |Removed |Added CC| |aleks_@gmx.net 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qQ4Fi-0008Rd-Fv
Subject: [f2fs-dev] [Bug 216050] f2fs_gc occupies 100% cpu
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

https://bugzilla.kernel.org/show_bug.cgi?id=216050

kelak (aleks_@gmx.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aleks_@gmx.net

--- Comment #175 from kelak (aleks_@gmx.net) ---
Still happens on my system with 6.4.x kernels after about 4 days (today the
second time in the last two weeks):

# uname -a
Linux pavo 6.4.6-arch1-1 #1 SMP PREEMPT_DYNAMIC Mon, 24 Jul 2023 20:19:38 +0000
x86_64 GNU/Linux

# uptime
 12:49:15 up 4 days,  1:38, 14 users,  load average: 6.09, 6.11, 6.09

# ps afux | grep f2fs
root         421  0.0  0.0      0     0 ?        D    Jul26   0:06  \_
[f2fs_ckpt-254:0]
root         422  0.0  0.0      0     0 ?        S    Jul26   0:00  \_
[f2fs_flush-254:0]
root         423  0.0  0.0      0     0 ?        S    Jul26   0:00  \_
[f2fs_discard-254:0]
root         424  6.8  0.0      0     0 ?        R    Jul26 399:26  \_
[f2fs_gc-254:0]
root         714  0.0  0.0      0     0 ?        S    Jul26   0:02  \_
[f2fs_ckpt-254:1]
root         715  0.0  0.0      0     0 ?        S    Jul26   0:00  \_
[f2fs_flush-254:1]
root         716  0.0  0.0      0     0 ?        S    Jul26   0:00  \_
[f2fs_discard-254:1]
root         725  0.0  0.0      0     0 ?        S    Jul26   0:09  \_
[f2fs_gc-254:1]

# cat /sys/kernel/debug/f2fs/status

=====[ partition info(dm-0). #0, RW, CP: Good]=====
[SBI: fs_dirty]
[SB: 1] [CP: 2] [SIT: 4] [NAT: 116] [SSA: 78] [MAIN: 39727(OverProv:569
Resv:289)]

Current Time Sec: 352033 / Mounted Time Sec: 13

Policy:
  - IPU: [ FSYNC ]

Utilization: 31% (6380179 valid blocks, 13105165 discard blocks)
  - Node: 204879 (Inode: 199852, Other: 5027)
  - Data: 6175300
  - Inline_xattr Inode: 44851
  - Inline_data Inode: 29674
  - Inline_dentry Inode: 2151
  - Compressed Inode: 0, Blocks: 0
  - Swapfile Inode: 0
  - Orphan/Append/Update Inode: 3, 0, 0

Main area: 39727 segs, 39727 secs 39727 zones
    TYPE            segno    secno   zoneno  dirty_seg   full_seg  valid_blk
  - COLD   data:    27547    27547    27547        717       8794    4862994
  - WARM   data:    27570    27570    27570         41       2263    1171156
  - HOT    data:      326      326      326         22        215     120280
  - Dir   dnode:       61       61       61         27          2      14475
  - File  dnode:      310      310      310        350         28     190066
  - Indir nodes:      261      261      261          1          0        333
  - Pinned file:       -1       -1       -1
  - ATGC   data:       -1       -1       -1

  - Valid: 11308
  - Dirty: 1152
  - Prefree: 1
  - Free: 27266 (27266)

CP calls: 5068 (BG: 4847)
  - cp blocks : 21743
  - sit blocks : 27307
  - nat blocks : 284434
  - ssa blocks : 4982
CP merge:
  - Queued :    3
  - Issued : 5069
  - Total : 5069
  - Cur time :    5(ms)
  - Peak time :  355(ms)
GC calls: 4479 (BG: 4480)
  - data segments : 1682 (0)
  - node segments : 2797 (0)
  - Reclaimed segs :
    - Normal : 4479
    - Idle CB : 0
    - Idle Greedy : 0
    - Idle AT : 0
    - Urgent High : 0
    - Urgent Mid : 0
    - Urgent Low : 0
Try to move 2023304 blocks (BG: 0)
  - data blocks : 686401 (0)
  - node blocks : 1336903 (0)
BG skip : IO: 843, Other: 8

Extent Cache (Read):
  - Hit Count: L1-1:104104223097 L1-2:40279 L2:19420
  - Hit Ratio: 99% (104104282796 / 104107306835)
  - Inner Struct Count: tree: 33955(0), node: 160

Extent Cache (Block Age):
  - Allocated Data Blocks: 1147983
  - Hit Count: L1:0 L2:0
  - Hit Ratio: 0% (0 / 0)
  - Inner Struct Count: tree: 0(0), node: 0

Balancing F2FS Async:
  - DIO (R:    0, W:    0)
  - IO_R (Data:    0, Node:    0, Meta:    0
  - IO_W (CP:    0, Data:    0, Flush: (   0 3114    1), Discard: (   0 7852))
cmd: 1954 undiscard:4539
  - atomic IO:    0 (Max.    0)
  - compress:    0, hit:       0
  - nodes:   63 in 27008
  - dents:    0 in dirs:   0 (   4)
  - datas:   30 in files:   0
  - quota datas:    0 in quota files:   0
  - meta:   26 in 1913
  - imeta:    2
  - fsync mark:  389
  - NATs:        44/      878
  - SITs:       135/    39727
  - free_nids:      3161/ 13306775
  - alloc_nids:         0

Distribution of User Blocks: [ valid | invalid | free ]
  [---------------|-|----------------------------------]

IPU: 2095 blocks
SSR: 0 blocks in 0 segments
LFS: 2563874 blocks in 5008 segments

BDF: 99, avg. vblocks: 494

Memory: 130282 KB
  - static: 11343 KB
  - cached all: 3254 KB
  - read extent cache: 2929 KB
  - block age extent cache: 0 KB
  - paged : 115684 KB

=====[ partition info(dm-1). #1, RW, CP: Good]=====
[SBI: fs_dirty need_fsck]
[SB: 1] [CP: 2] [SIT: 32] [NAT: 88] [SSA: 876] [MAIN: 447237(OverProv:1897
Resv:960)]

Current Time Sec: 352033 / Mounted Time Sec: 20

Policy:
  - IPU: [ FSYNC ]

Utilization: 60% (137479434 valid blocks, 83700313 discard blocks)
  - Node: 796398 (Inode: 673288, Other: 123110)
  - Data: 136683036
  - Inline_xattr Inode: 512050
  - Inline_data Inode: 207070
  - Inline_dentry Inode: 38713
  - Compressed Inode: 0, Blocks: 0
  - Swapfile Inode: 0
  - Orphan/Append/Update Inode: 0, 0, 0

Main area: 447237 segs, 447237 secs 447237 zones
    TYPE            segno    secno   zoneno  dirty_seg   full_seg  valid_blk
  - COLD   data:   270602   270602   270602       3627     124609   64920639
  - WARM   data:   269915   269915   269915       1012     138752   71272348
  - HOT    data:     2485     2485     2485         84        940     490021
  - Dir   dnode:     2507     2507     2507         72         71      63227
  - File  dnode:     2511     2511     2511        642        988     731964
  - Indir nodes:     2380     2380     2380         21          1       1204
  - Pinned file:       -1       -1       -1
  - ATGC   data:       -1       -1       -1

  - Valid: 265367
  - Dirty: 5452
  - Prefree: 0
  - Free: 176418 (176418)

CP calls: 4575 (BG: 6476)
  - cp blocks : 18577
  - sit blocks : 11759
  - nat blocks : 6361
  - ssa blocks : 15209
CP merge:
  - Queued :    0
  - Issued : 7154
  - Total : 7155
  - Cur time :    4(ms)
  - Peak time :  517(ms)
GC calls: 4109 (BG: 4109)
  - data segments : 4103 (0)
  - node segments : 6 (0)
  - Reclaimed segs :
    - Normal : 4109
    - Idle CB : 0
    - Idle Greedy : 0
    - Idle AT : 0
    - Urgent High : 0
    - Urgent Mid : 0
    - Urgent Low : 0
Try to move 6 blocks (BG: 0)
  - data blocks : 0 (0)
  - node blocks : 6 (0)
BG skip : IO: 1617, Other: 3

Extent Cache (Read):
  - Hit Count: L1-1:78346 L1-2:808 L2:62
  - Hit Ratio: 6% (79216 / 1314997)
  - Inner Struct Count: tree: 471059(0), node: 3

Extent Cache (Block Age):
  - Allocated Data Blocks: 7759701
  - Hit Count: L1:0 L2:0
  - Hit Ratio: 0% (0 / 0)
  - Inner Struct Count: tree: 0(0), node: 0

Balancing F2FS Async:
  - DIO (R:    0, W:    0)
  - IO_R (Data:    0, Node:    0, Meta:    0
  - IO_W (CP:    0, Data:    0, Flush: (   0 1274    1), Discard: (   0    0))
cmd: 10381 undiscard:7805628
  - atomic IO:    0 (Max.    0)
  - compress:    0, hit:       0
  - nodes:   13 in 107925
  - dents:    1 in dirs:   1 (   6)
  - datas:   30 in files:   0
  - quota datas:    0 in quota files:   0
  - meta:    6 in 9440
  - imeta:    4
  - fsync mark:    0
  - NATs:         6/    63316
  - SITs:         8/   447237
  - free_nids:      3843/  9453836
  - alloc_nids:         0

Distribution of User Blocks: [ valid | invalid | free ]
  [------------------------------|-|-------------------]

IPU: 0 blocks
SSR: 0 blocks in 0 segments
LFS: 7790262 blocks in 15215 segments

BDF: 99, avg. vblocks: 295

Memory: 620142 KB
  - static: 106987 KB
  - cached all: 43694 KB
  - read extent cache: 40481 KB
  - block age extent cache: 0 KB
  - paged : 469460 KB

# dmesg # (only F2FS relevant parts)
[    0.000000] microcode: updated early: 0x25 -> 0x26, date = 2019-11-12
[    0.000000] Linux version 6.4.6-arch1-1 (linux@archlinux) (gcc (GCC) 13.1.1
20230714, GNU ld (GNU Binutils) 2.40.0) #1 SMP PREEMPT_DYNAMIC Mon, 24 Jul 2023
20:19:38 +0000
...
[    6.988098] device-mapper: uevent: version 1.0.3
[    6.988195] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised:
dm-devel@redhat.com
[    7.023553] Key type encrypted registered
[   13.454117] F2FS-fs (dm-0): Mounted with checkpoint version = 424a2306
[   13.639655] systemd[1]: systemd 253.7-1-arch running in system mode (+PAM
+AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL
+BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK
+PCRE2 -PWQUALITY +P11KIT -QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD
+BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT default-hierarchy=unified)
...
[   20.654961] F2FS-fs (dm-1): Mounted with checkpoint version = 4bb49ae6
...
[327726.678181] INFO: task f2fs_ckpt-254:0:421 blocked for more than 122
seconds.
[327726.678191]       Not tainted 6.4.6-arch1-1 #1
[327726.678194] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[327726.678196] task:f2fs_ckpt-254:0 state:D stack:0     pid:421   ppid:2     
flags:0x00004000
[327726.678205] Call Trace:
[327726.678207]  <TASK>
[327726.678212]  __schedule+0x3e8/0x1410
[327726.678221]  ? sysvec_apic_timer_interrupt+0xe/0x90
[327726.678230]  schedule+0x5e/0xd0
[327726.678235]  schedule_preempt_disabled+0x15/0x30
[327726.678239]  rwsem_down_write_slowpath+0x203/0x690
[327726.678250]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327726.678338]  down_write+0x5b/0x60
[327726.678344]  __checkpoint_and_complete_reqs+0x7c/0x1b0 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327726.678424]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327726.678499]  issue_checkpoint_thread+0x4c/0x110 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327726.678575]  ? __pfx_autoremove_wake_function+0x10/0x10
[327726.678584]  kthread+0xe5/0x120
[327726.678590]  ? __pfx_kthread+0x10/0x10
[327726.678596]  ret_from_fork+0x29/0x50
[327726.678606]  </TASK>
[327726.678627] INFO: task kworker/u8:6:74861 blocked for more than 122
seconds.
[327726.678631]       Not tainted 6.4.6-arch1-1 #1
[327726.678633] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[327726.678635] task:kworker/u8:6    state:D stack:0     pid:74861 ppid:2     
flags:0x00004000
[327726.678643] Workqueue: writeback wb_workfn (flush-254:0)
[327726.678651] Call Trace:
[327726.678653]  <TASK>
[327726.678656]  __schedule+0x3e8/0x1410
[327726.678661]  ? ttwu_queue_wakelist+0xef/0x110
[327726.678666]  ? try_to_wake_up+0xd9/0x610
[327726.678674]  schedule+0x5e/0xd0
[327726.678679]  schedule_timeout+0x151/0x160
[327726.678687]  wait_for_completion+0x8a/0x160
[327726.678693]  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327726.678772]  f2fs_balance_fs_bg+0x12e/0x390 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327726.678856]  f2fs_write_node_pages+0x78/0x240 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327726.678938]  do_writepages+0xcf/0x1e0
[327726.678945]  __writeback_single_inode+0x3d/0x360
[327726.678951]  writeback_sb_inodes+0x1ed/0x4b0
[327726.678958]  __writeback_inodes_wb+0x4c/0xf0
[327726.678964]  wb_writeback+0x172/0x2f0
[327726.678970]  wb_workfn+0x35b/0x510
[327726.678975]  ? __schedule+0x3f0/0x1410
[327726.678979]  ? __mod_timer+0x11f/0x370
[327726.678987]  process_one_work+0x1c4/0x3d0
[327726.678996]  worker_thread+0x51/0x390
[327726.679003]  ? __pfx_worker_thread+0x10/0x10
[327726.679009]  kthread+0xe5/0x120
[327726.679015]  ? __pfx_kthread+0x10/0x10
[327726.679020]  ret_from_fork+0x29/0x50
[327726.679030]  </TASK>
[327849.560344] INFO: task f2fs_ckpt-254:0:421 blocked for more than 245
seconds.
[327849.560354]       Not tainted 6.4.6-arch1-1 #1
[327849.560357] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[327849.560359] task:f2fs_ckpt-254:0 state:D stack:0     pid:421   ppid:2     
flags:0x00004000
[327849.560367] Call Trace:
[327849.560370]  <TASK>
[327849.560374]  __schedule+0x3e8/0x1410
[327849.560383]  ? sysvec_apic_timer_interrupt+0xe/0x90
[327849.560391]  schedule+0x5e/0xd0
[327849.560395]  schedule_preempt_disabled+0x15/0x30
[327849.560399]  rwsem_down_write_slowpath+0x203/0x690
[327849.560409]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327849.560501]  down_write+0x5b/0x60
[327849.560507]  __checkpoint_and_complete_reqs+0x7c/0x1b0 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327849.560587]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327849.560662]  issue_checkpoint_thread+0x4c/0x110 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327849.560739]  ? __pfx_autoremove_wake_function+0x10/0x10
[327849.560748]  kthread+0xe5/0x120
[327849.560755]  ? __pfx_kthread+0x10/0x10
[327849.560761]  ret_from_fork+0x29/0x50
[327849.560773]  </TASK>
[327849.560797] INFO: task kworker/u8:6:74861 blocked for more than 245
seconds.
[327849.560800]       Not tainted 6.4.6-arch1-1 #1
[327849.560803] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[327849.560805] task:kworker/u8:6    state:D stack:0     pid:74861 ppid:2     
flags:0x00004000
[327849.560813] Workqueue: writeback wb_workfn (flush-254:0)
[327849.560821] Call Trace:
[327849.560824]  <TASK>
[327849.560827]  __schedule+0x3e8/0x1410
[327849.560832]  ? ttwu_queue_wakelist+0xef/0x110
[327849.560839]  ? try_to_wake_up+0xd9/0x610
[327849.560847]  schedule+0x5e/0xd0
[327849.560852]  schedule_timeout+0x151/0x160
[327849.560859]  wait_for_completion+0x8a/0x160
[327849.560867]  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327849.560947]  f2fs_balance_fs_bg+0x12e/0x390 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327849.561033]  f2fs_write_node_pages+0x78/0x240 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327849.561115]  do_writepages+0xcf/0x1e0
[327849.561123]  __writeback_single_inode+0x3d/0x360
[327849.561129]  writeback_sb_inodes+0x1ed/0x4b0
[327849.561138]  __writeback_inodes_wb+0x4c/0xf0
[327849.561144]  wb_writeback+0x172/0x2f0
[327849.561150]  wb_workfn+0x35b/0x510
[327849.561156]  ? __schedule+0x3f0/0x1410
[327849.561160]  ? __mod_timer+0x11f/0x370
[327849.561169]  process_one_work+0x1c4/0x3d0
[327849.561179]  worker_thread+0x51/0x390
[327849.561187]  ? __pfx_worker_thread+0x10/0x10
[327849.561194]  kthread+0xe5/0x120
[327849.561199]  ? __pfx_kthread+0x10/0x10
[327849.561205]  ret_from_fork+0x29/0x50
[327849.561215]  </TASK>
[327972.442481] INFO: task f2fs_ckpt-254:0:421 blocked for more than 368
seconds.
[327972.442488]       Not tainted 6.4.6-arch1-1 #1
[327972.442490] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[327972.442491] task:f2fs_ckpt-254:0 state:D stack:0     pid:421   ppid:2     
flags:0x00004000
[327972.442497] Call Trace:
[327972.442499]  <TASK>
[327972.442503]  __schedule+0x3e8/0x1410
[327972.442510]  ? sysvec_apic_timer_interrupt+0xe/0x90
[327972.442516]  schedule+0x5e/0xd0
[327972.442518]  schedule_preempt_disabled+0x15/0x30
[327972.442521]  rwsem_down_write_slowpath+0x203/0x690
[327972.442529]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327972.442588]  down_write+0x5b/0x60
[327972.442592]  __checkpoint_and_complete_reqs+0x7c/0x1b0 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327972.442639]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327972.442682]  issue_checkpoint_thread+0x4c/0x110 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327972.442727]  ? __pfx_autoremove_wake_function+0x10/0x10
[327972.442733]  kthread+0xe5/0x120
[327972.442738]  ? __pfx_kthread+0x10/0x10
[327972.442741]  ret_from_fork+0x29/0x50
[327972.442749]  </TASK>
[327972.442769] INFO: task kworker/u8:6:74861 blocked for more than 368
seconds.
[327972.442771]       Not tainted 6.4.6-arch1-1 #1
[327972.442773] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[327972.442774] task:kworker/u8:6    state:D stack:0     pid:74861 ppid:2     
flags:0x00004000
[327972.442778] Workqueue: writeback wb_workfn (flush-254:0)
[327972.442785] Call Trace:
[327972.442786]  <TASK>
[327972.442788]  __schedule+0x3e8/0x1410
[327972.442791]  ? ttwu_queue_wakelist+0xef/0x110
[327972.442795]  ? try_to_wake_up+0xd9/0x610
[327972.442800]  schedule+0x5e/0xd0
[327972.442803]  schedule_timeout+0x151/0x160
[327972.442808]  wait_for_completion+0x8a/0x160
[327972.442813]  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327972.442860]  f2fs_balance_fs_bg+0x12e/0x390 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327972.442912]  f2fs_write_node_pages+0x78/0x240 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[327972.442963]  do_writepages+0xcf/0x1e0
[327972.442968]  __writeback_single_inode+0x3d/0x360
[327972.442971]  writeback_sb_inodes+0x1ed/0x4b0
[327972.442976]  __writeback_inodes_wb+0x4c/0xf0
[327972.442979]  wb_writeback+0x172/0x2f0
[327972.442983]  wb_workfn+0x35b/0x510
[327972.442986]  ? __schedule+0x3f0/0x1410
[327972.442989]  ? __mod_timer+0x11f/0x370
[327972.442994]  process_one_work+0x1c4/0x3d0
[327972.443001]  worker_thread+0x51/0x390
[327972.443006]  ? __pfx_worker_thread+0x10/0x10
[327972.443011]  kthread+0xe5/0x120
[327972.443014]  ? __pfx_kthread+0x10/0x10
[327972.443018]  ret_from_fork+0x29/0x50
[327972.443025]  </TASK>
[328095.324600] INFO: task f2fs_ckpt-254:0:421 blocked for more than 491
seconds.
[328095.324611]       Not tainted 6.4.6-arch1-1 #1
[328095.324614] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[328095.324616] task:f2fs_ckpt-254:0 state:D stack:0     pid:421   ppid:2     
flags:0x00004000
[328095.324625] Call Trace:
[328095.324628]  <TASK>
[328095.324634]  __schedule+0x3e8/0x1410
[328095.324643]  ? sysvec_apic_timer_interrupt+0xe/0x90
[328095.324652]  schedule+0x5e/0xd0
[328095.324657]  schedule_preempt_disabled+0x15/0x30
[328095.324662]  rwsem_down_write_slowpath+0x203/0x690
[328095.324673]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328095.324759]  down_write+0x5b/0x60
[328095.324765]  __checkpoint_and_complete_reqs+0x7c/0x1b0 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328095.324839]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328095.324910]  issue_checkpoint_thread+0x4c/0x110 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328095.324981]  ? __pfx_autoremove_wake_function+0x10/0x10
[328095.324990]  kthread+0xe5/0x120
[328095.324997]  ? __pfx_kthread+0x10/0x10
[328095.325003]  ret_from_fork+0x29/0x50
[328095.325013]  </TASK>
[328095.325035] INFO: task kworker/u8:6:74861 blocked for more than 491
seconds.
[328095.325038]       Not tainted 6.4.6-arch1-1 #1
[328095.325041] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[328095.325043] task:kworker/u8:6    state:D stack:0     pid:74861 ppid:2     
flags:0x00004000
[328095.325051] Workqueue: writeback wb_workfn (flush-254:0)
[328095.325059] Call Trace:
[328095.325061]  <TASK>
[328095.325064]  __schedule+0x3e8/0x1410
[328095.325069]  ? ttwu_queue_wakelist+0xef/0x110
[328095.325076]  ? try_to_wake_up+0xd9/0x610
[328095.325084]  schedule+0x5e/0xd0
[328095.325088]  schedule_timeout+0x151/0x160
[328095.325096]  wait_for_completion+0x8a/0x160
[328095.325103]  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328095.325178]  f2fs_balance_fs_bg+0x12e/0x390 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328095.325258]  f2fs_write_node_pages+0x78/0x240 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328095.325335]  do_writepages+0xcf/0x1e0
[328095.325342]  __writeback_single_inode+0x3d/0x360
[328095.325349]  writeback_sb_inodes+0x1ed/0x4b0
[328095.325356]  __writeback_inodes_wb+0x4c/0xf0
[328095.325362]  wb_writeback+0x172/0x2f0
[328095.325368]  wb_workfn+0x35b/0x510
[328095.325374]  ? __schedule+0x3f0/0x1410
[328095.325378]  ? __mod_timer+0x11f/0x370
[328095.325387]  process_one_work+0x1c4/0x3d0
[328095.325395]  worker_thread+0x51/0x390
[328095.325403]  ? __pfx_worker_thread+0x10/0x10
[328095.325410]  kthread+0xe5/0x120
[328095.325415]  ? __pfx_kthread+0x10/0x10
[328095.325421]  ret_from_fork+0x29/0x50
[328095.325430]  </TASK>
[328218.206759] INFO: task f2fs_ckpt-254:0:421 blocked for more than 614
seconds.
[328218.206768]       Not tainted 6.4.6-arch1-1 #1
[328218.206771] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[328218.206773] task:f2fs_ckpt-254:0 state:D stack:0     pid:421   ppid:2     
flags:0x00004000
[328218.206779] Call Trace:
[328218.206781]  <TASK>
[328218.206785]  __schedule+0x3e8/0x1410
[328218.206792]  ? sysvec_apic_timer_interrupt+0xe/0x90
[328218.206798]  schedule+0x5e/0xd0
[328218.206801]  schedule_preempt_disabled+0x15/0x30
[328218.206804]  rwsem_down_write_slowpath+0x203/0x690
[328218.206812]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328218.206872]  down_write+0x5b/0x60
[328218.206877]  __checkpoint_and_complete_reqs+0x7c/0x1b0 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328218.206928]  ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328218.206975]  issue_checkpoint_thread+0x4c/0x110 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328218.207020]  ? __pfx_autoremove_wake_function+0x10/0x10
[328218.207027]  kthread+0xe5/0x120
[328218.207031]  ? __pfx_kthread+0x10/0x10
[328218.207035]  ret_from_fork+0x29/0x50
[328218.207042]  </TASK>
[328218.207064] INFO: task kworker/u8:6:74861 blocked for more than 614
seconds.
[328218.207067]       Not tainted 6.4.6-arch1-1 #1
[328218.207068] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[328218.207070] task:kworker/u8:6    state:D stack:0     pid:74861 ppid:2     
flags:0x00004000
[328218.207075] Workqueue: writeback wb_workfn (flush-254:0)
[328218.207081] Call Trace:
[328218.207082]  <TASK>
[328218.207084]  __schedule+0x3e8/0x1410
[328218.207087]  ? ttwu_queue_wakelist+0xef/0x110
[328218.207091]  ? try_to_wake_up+0xd9/0x610
[328218.207097]  schedule+0x5e/0xd0
[328218.207099]  schedule_timeout+0x151/0x160
[328218.207105]  wait_for_completion+0x8a/0x160
[328218.207109]  f2fs_issue_checkpoint+0x11f/0x200 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328218.207158]  f2fs_balance_fs_bg+0x12e/0x390 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328218.207211]  f2fs_write_node_pages+0x78/0x240 [f2fs
daaabf438da293fce6726f2a1db3018f0802cf41]
[328218.207262]  do_writepages+0xcf/0x1e0
[328218.207267]  __writeback_single_inode+0x3d/0x360
[328218.207271]  writeback_sb_inodes+0x1ed/0x4b0
[328218.207275]  __writeback_inodes_wb+0x4c/0xf0
[328218.207279]  wb_writeback+0x172/0x2f0
[328218.207282]  wb_workfn+0x35b/0x510
[328218.207286]  ? __schedule+0x3f0/0x1410
[328218.207288]  ? __mod_timer+0x11f/0x370
[328218.207294]  process_one_work+0x1c4/0x3d0
[328218.207300]  worker_thread+0x51/0x390
[328218.207305]  ? __pfx_worker_thread+0x10/0x10
[328218.207310]  kthread+0xe5/0x120
[328218.207314]  ? __pfx_kthread+0x10/0x10
[328218.207318]  ret_from_fork+0x29/0x50
[328218.207324]  </TASK>
[328218.207325] Future hung task reports are suppressed, see sysctl
kernel.hung_task_warnings

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
