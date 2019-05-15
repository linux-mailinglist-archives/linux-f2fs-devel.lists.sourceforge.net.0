Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E96521F814
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 18:00:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQwKb-000886-Cr; Wed, 15 May 2019 16:00:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1hQwKV-00087i-28
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 16:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fYY6q+ILy2BDy4G2b9K9+jsx4zPdH3kns30/nKJoMgI=; b=FWeQBWOm31JfSCSf0lahI2wKtx
 k1MfLeD/ZS+unMuAXkuxB7c3UXMT89WumPaNDvoAhxdt73cuJWGE83RdI5w/4/XbFd8toZx6rGNMT
 KbFp4FyuTDGUTcFtGkVYm3i5Lci4B9S+w5qBSxs6bPJN0zsWqGBRm8AkvHvBT3Z9IeBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fYY6q+ILy2BDy4G2b9K9+jsx4zPdH3kns30/nKJoMgI=; b=W7TSnIcuaU0cp87janjEnvfORK
 2oeZxj3Zx1LsoKj8yaVDiDbNbT/eJUbV3BIV3VqMGVq0N4bFfRVbwkZQk6yKZL5GX5T3bY5YdNZx1
 BwgheTxcGGvvyy1R+XKAu6kRdZdUA1WCrS/iCE866+eRbJLFg/slhlrCvOIk0rr+IRgk=;
Received: from mail.wl.linuxfoundation.org ([198.145.29.98])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQwKT-000EUz-HE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 16:00:31 +0000
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 10B9F2859A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2019 16:00:23 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 0FD89285F0; Wed, 15 May 2019 16:00:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 15 May 2019 16:00:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jungyeon@gatech.edu
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203233-202145-BUe34qRa3z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203233-202145@https.bugzilla.kernel.org/>
References: <bug-203233-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: run.sh]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hQwKT-000EUz-HE
Subject: [f2fs-dev] [Bug 203233] kernel BUG at fs/f2fs/segment.c:2102!
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

https://bugzilla.kernel.org/show_bug.cgi?id=203233

--- Comment #3 from Jungyeon (jungyeon@gatech.edu) ---
- Reproduces
gcc poc_13.c
./run.sh f2fs

- Kernel messages
[   52.504977] F2FS-fs (sdb): Bitmap was wrongly set, blk:4608                  
[   52.506452] kernel BUG at fs/f2fs/segment.c:2133!                            
[   52.507469] invalid opcode: 0000 [#1] SMP PTI                
[   52.508375] CPU: 0 PID: 934 Comm: a.out Not tainted 5.1.0 #1                 
[   52.509505] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   52.511437] RIP: 0010:update_sit_entry+0x35d/0x3e0
[   52.512414] Code: c0 a9 48 c7 c6 03 1e bd a9 e8 0f 1c fe ff 0f 0b 8b 0c 24
48 8b 7d 00 48 c7 c2 e0 27 c0 a9 48 c7 c6 03 1e bd a9 e8 f3 1b fe ff <0f> 0b 8b
0c 24 48 8b 7d 00 41 83 e0
01 48 c7 c2 00 28 c0 a9 48 c7                 
[   52.516335] RSP: 0018:ffffbad9c0fd79f0 EFLAGS: 00010286
[   52.517395] RAX: 0000000000000000 RBX: ffff98d7f2542e40 RCX:
0000000000000000
[   52.518867] RDX: 0000000000000000 RSI: ffff98d7f7a163d8 RDI:
ffff98d7f7a163d8
[   52.520323] RBP: ffff98d7eba14800 R08: 000000000007b491 R09:
00000000000001b6
[   52.521900] R10: 0000000000000007 R11: ffffbad9c0fd7835 R12:
ffff98d7eba15030
[   52.523466] R13: 0000000000000001 R14: 0000000000000001 R15:
0000000000000000
[   52.524917] FS:  00007f87eb8c5700(0000) GS:ffff98d7f7a00000(0000)
knlGS:0000000000000000
[   52.526600] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   52.527796] CR2: 00007ffc596d1000 CR3: 0000000233450005 CR4:
00000000001606f0
[   52.529260] Call Trace:
[   52.529813]  ? bvec_alloc+0x81/0xe0
[   52.530558]  f2fs_allocate_data_block+0x16c/0x5a0
[   52.531539]  do_write_page+0x57/0x100
[   52.532310]  f2fs_do_write_node_page+0x33/0xa0
[   52.533401]  __write_node_page+0x270/0x4e0
[   52.534231]  f2fs_sync_node_pages+0x5df/0x670
[   52.535081]  ? writeback_single_inode+0xd1/0x100
[   52.536013]  ? iput+0x66/0x1e0
[   52.536639]  f2fs_write_checkpoint+0x364/0x13a0
[   52.537582]  ? blk_finish_plug+0x22/0x30
[   52.538416]  ? f2fs_fill_dentries+0x1dc/0x230
[   52.539314]  ? f2fs_sync_fs+0xa3/0x130
[   52.540091]  f2fs_sync_fs+0xa3/0x130
[   52.540849]  ? touch_atime+0xc1/0xd0
[   52.541607]  f2fs_do_sync_file+0x1a6/0x810
[   52.542482]  do_fsync+0x33/0x60
[   52.543133]  __x64_sys_fsync+0xb/0x10
[   52.543872]  do_syscall_64+0x43/0x110
[   52.544629]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   52.545872] RIP: 0033:0x7f87eb3e04d9
[   52.546645] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d
8f 29 2c 00 f7 d8 64 89 01 48
[   52.550584] RSP: 002b:00007ffc596cebd8 EFLAGS: 00000203 ORIG_RAX:
000000000000004a
[   52.552157] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007f87eb3e04d9
[   52.553758] RDX: 00007f87eb3e04d9 RSI: 0000000000000928 RDI:
0000000000000003
[   52.555250] RBP: 00007ffc596d2d20 R08: 00007ffc596d2e08 R09:
00007ffc596d2e08
[   52.556728] R10: 00007ffc596d2e08 R11: 0000000000000203 R12:
00000000004004e0
[   52.558211] R13: 00007ffc596d2e00 R14: 0000000000000000 R15:
0000000000000000
[   52.559752] Modules linked in:
[   52.560433] ---[ end trace dd205425e9f03f2e ]---
[   52.561419] RIP: 0010:update_sit_entry+0x35d/0x3e0
[   52.562457] Code: c0 a9 48 c7 c6 03 1e bd a9 e8 0f 1c fe ff 0f 0b 8b 0c 24
48 8b 7d 00 48 c7 c2 e0 27 c0 a9 48 c7 c6 03 1e bd a9 e8 f3 1b fe ff <0f> 0b 8b
0c 24 48 8b 7d 00 41 83 e0
01 48 c7 c2 00 28 c0 a9 48 c7
[   52.566484] RSP: 0018:ffffbad9c0fd79f0 EFLAGS: 00010286
[   52.567626] RAX: 0000000000000000 RBX: ffff98d7f2542e40 RCX:
0000000000000000
[   52.569126] RDX: 0000000000000000 RSI: ffff98d7f7a163d8 RDI:
ffff98d7f7a163d8
[   52.570620] RBP: ffff98d7eba14800 R08: 000000000007b491 R09:
00000000000001b6
[   52.572242] R10: 0000000000000007 R11: ffffbad9c0fd7835 R12:
ffff98d7eba15030
[   52.573750] R13: 0000000000000001 R14: 0000000000000001 R15:
0000000000000000
[   52.575236] FS:  00007f87eb8c5700(0000) GS:ffff98d7f7a00000(0000)
knlGS:0000000000000000
[   52.576915] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   52.578241] CR2: 00007ffc596d1000 CR3: 0000000233450005 CR4:
00000000001606f0
[   52.579763] WARNING: CPU: 0 PID: 934 at kernel/exit.c:782 do_exit+0x4a/0xbf0
[   52.581300] Modules linked in:
[   52.581980] CPU: 0 PID: 934 Comm: a.out Tainted: G      D           5.1.0 #1
[   52.583461] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   52.585442] RIP: 0010:do_exit+0x4a/0xbf0
[   52.586375] Code: 04 25 28 00 00 00 48 89 44 24 30 31 c0 e8 ce 81 06 00 48
8b 83 40 07 00 00 48 85 c0 74 0e 48 8b 10 48 39 d0 0f 84 6b 07 00 00 <0f> 0b 65
44 8b 25 f4 01 5b 57 41 81
e4 00 ff 1f 00 44 89 64 24 0c
[   52.590248] RSP: 0018:ffffbad9c0fd7ee8 EFLAGS: 00010212
[   52.591439] RAX: ffffbad9c0fd7d80 RBX: ffff98d7f661ec00 RCX:
00000000ffffffff
[   52.592877] RDX: ffff98d7ebfa4048 RSI: 0000000000000000 RDI:
ffffffffa9e4aec0
[   52.594367] RBP: 000000000000000b R08: 0000000000000000 R09:
00000000000001ef
[   52.595829] R10: 000000000000002b R11: ffffbad9c0fd7725 R12:
0000000000000246
[   52.597319] R13: 0000000000000004 R14: 0000000000000002 R15:
ffffffffa8d4a7cd
[   52.598979] FS:  00007f87eb8c5700(0000) GS:ffff98d7f7a00000(0000)
knlGS:0000000000000000
[   52.600670] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   52.601871] CR2: 00007ffc596d1000 CR3: 0000000233450005 CR4:
00000000001606f0
[   52.603353] Call Trace:
[   52.603887]  ? do_fsync+0x33/0x60
[   52.604630]  ? update_sit_entry+0x35d/0x3e0
[   52.605611]  rewind_stack_do_exit+0x17/0x20
[   52.606610] ---[ end trace dd205425e9f03f2f ]---
[   52.609523] a.out (934) used greatest stack depth: 13072 bytes left
./run.sh: line 10:   933 Segmentation fault      (core dumped) sudo ./a.out

- Error location
the same location

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
