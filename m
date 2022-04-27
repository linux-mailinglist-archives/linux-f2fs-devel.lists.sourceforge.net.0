Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B39AF511BE5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 17:30:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njjcA-0002bd-Pm; Wed, 27 Apr 2022 15:30:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1njjc9-0002b4-Ug
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 15:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s6HylUh+OEKV39VXfb/ISAqlwry5Bfreh7mgEO/7xWo=; b=Qn6WwfaCEcUcnDRzFKwNCwysK9
 x/5UtJWRis+x2+rBjHWpKu/5o8rV5FSDJ38yZJDlB6tDFBn94shDeImYpsmoIlPwv93PtivzEQAlv
 Y0jPqr9sjlYzzXg+BoJFfb/dRrgeDaWt5rBG1X+9k7TFjVGNvSJHfYP2rzxAXOa59Ltw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=s6HylUh+OEKV39VXfb/ISAqlwry5Bfreh7mgEO/7xWo=; b=P
 V2J9SgBZuYRo6iY4Drsin3e/0ZS9pDmst5KAYyiLpjW0wEcNASY+kz/R/1fl7jzzXsDhOKH7Pwo9/
 DN8kzwvaFyZ8vL/jT+9IF0pOrjR95yfuq4yX9WPRy0zZSN6IOhtUtK1WkY8UxWMKQvGriUdWrxgGz
 Qw8uksckKLTtWKUI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njjc4-00Bs1o-DT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 15:30:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EBDFEB82871
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 15:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B5AAC385A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 15:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651073388;
 bh=9YU0hWTFJY8m8kDy0w6WufmEmPFdDakwiFKvD6iBy5E=;
 h=From:To:Subject:Date:From;
 b=LD54r4bSRvo87dRdrYLN+jZQwvVBF1eg3knfjlfvnINiNdqX80pRlnLd4pjmN11zD
 Iu4ulb98xOxcAJ5s6HqCKqEGRoceBq/qE7yXb83APHkHPbGwqi+g1Y+CktRgMUj/Ev
 hnQI1fK95qIJd/aNOx9S4Cu8umT6TR0gT8Rgyvdp3aHa4ZM/dl9OZE2s5yfhqSLI8C
 Mj0zPqfV2+I4pQMrsNTCFGqeoqsVCx9NOqHNVZhQHnLLkqTUZn5ETLIGaFTCgaZoKy
 VCyenP/EtNlxGXJcAGZfLK2b7LCIQFUk0p/nxSoOoaAnIpCZUtf2yDUgNLhCcvWS8J
 tkRBAUZDrxCTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 70AAEC05FCE; Wed, 27 Apr 2022 15:29:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Apr 2022 15:29:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215905-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215905 Bug ID:
 215905 Summary: BUG: KASAN: slab-out-of-bounds in
 f2fs_allocate_data_block+0x23d0/0x31f0
 Product: File System Version: 2.5 Kernel Version: 5.17 Hardware: All OS:
 Linux Tree: Mainline Status: [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njjc4-00Bs1o-DT
Subject: [f2fs-dev] [Bug 215905] New: BUG: KASAN: slab-out-of-bounds in
 f2fs_allocate_data_block+0x23d0/0x31f0
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

https://bugzilla.kernel.org/show_bug.cgi?id=215905

            Bug ID: 215905
           Summary: BUG: KASAN: slab-out-of-bounds in
                    f2fs_allocate_data_block+0x23d0/0x31f0
           Product: File System
           Version: 2.5
    Kernel Version: 5.17
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: yanming@tju.edu.cn
        Regression: No

Created attachment 300829
  --> https://bugzilla.kernel.org/attachment.cgi?id=300829&action=edit
case.c

I have encountered a KASAN bug in F2FS file system in kernel v5.17.

I have uploaded the system call sequence as case.c, and a fuzzed image can be
found in google net disk
(https://drive.google.com/file/d/1PKPI0AojESKJLWKaWeBg-nRPNlEPELFb/view?usp=sharing).

The kernel should enable CONFIG_KASAN=y and CONFIG_KASAN_INLINE=y. You can
reproduce the bug by running the following commands:

gcc -o case case.c
losetup /dev/loop0 case.img
mount -o
"background_gc=sync,discard,no_heap,nouser_xattr,active_logs=2,inline_data,fastboot,data_flush,checkpoint=disable,noquota,fsync_mode=strict,test_dummy_encryption"
-t f2fs /dev/loop0 /root/mnt
./case

The kernel log is shown below:

3,904,146667379,-;==================================================================
3,905,146667387,-;BUG: KASAN: slab-out-of-bounds in
f2fs_allocate_data_block+0x23d0/0x31f0
3,906,146667396,-;Read of size 4 at addr ffff88810ae96bc4 by task case/2167
3,907,146667399,-;
3,908,146667402,-;CPU: 1 PID: 2167 Comm: case Not tainted 5.17.0 #4
3,909,146667405,-;Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A14
09/14/2015
3,910,146667408,-;Call Trace:
3,911,146667410,-; <TASK>
3,912,146667412,-; dump_stack_lvl+0x34/0x44
3,913,146667417,-; print_address_description.constprop.0+0x21/0x150
3,914,146667423,-; ? f2fs_allocate_data_block+0x23d0/0x31f0
3,915,146667426,-; ? f2fs_allocate_data_block+0x23d0/0x31f0
3,916,146667429,-; kasan_report.cold+0x7f/0x11b
3,917,146667434,-; ? f2fs_allocate_data_block+0x23d0/0x31f0
3,918,146667437,-; f2fs_allocate_data_block+0x23d0/0x31f0
3,919,146667441,-; ? _raw_read_lock_bh+0x40/0x40
3,920,146667445,-; ? _raw_spin_lock_irqsave+0x88/0xe0
3,921,146667449,-; do_write_page+0x18d/0x710
3,922,146667453,-; f2fs_outplace_write_data+0x151/0x250
3,923,146667457,-; ? f2fs_do_write_node_page+0x110/0x110
3,924,146667461,-; f2fs_convert_inline_page+0x6f7/0x1300
3,925,146667465,-; ? f2fs_read_inline_data+0x5c0/0x5c0
3,926,146667469,-; ? __get_node_page+0x13c/0xd30
3,927,146667472,-; f2fs_convert_inline_inode+0x99c/0xf40
3,928,146667476,-; ? f2fs_convert_inline_page+0x1300/0x1300
3,929,146667479,-; ? selinux_mount+0x220/0x220
3,930,146667484,-; ? setattr_prepare+0xd5/0x640
3,931,146667487,-; f2fs_setattr+0xb28/0x12e0
3,932,146667491,-; notify_change+0x5a5/0xcc0
3,933,146667494,-; ? down_write_killable+0x120/0x120
3,934,146667498,-; ? do_truncate+0xeb/0x190
3,935,146667501,-; do_truncate+0xeb/0x190
3,936,146667504,-; ? __x64_sys_openat2+0x2a0/0x2a0
3,937,146667508,-; ? __fget_light+0x52/0x500
3,938,146667511,-; ? ksys_read+0xe8/0x1c0
3,939,146667515,-; ? vfs_write+0x7b0/0x7b0
3,940,146667518,-; do_sys_ftruncate+0x2b2/0x4b0
3,941,146667522,-; do_syscall_64+0x3b/0x90
3,942,146667526,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
3,943,146667529,-;RIP: 0033:0x7fd670d5976d
3,944,146667532,-;Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 8b 0d f3 36 0d 00 f7 d8 64 89 01 48
3,945,146667536,-;RSP: 002b:00007fff4da961a8 EFLAGS: 00000203 ORIG_RAX:
000000000000004d
3,946,146667540,-;RAX: ffffffffffffffda RBX: 000055b2f5995b60 RCX:
00007fd670d5976d
3,947,146667543,-;RDX: 00007fd670d5976d RSI: 0000000000073460 RDI:
0000000000000003
3,948,146667545,-;RBP: 00007fff4de963e0 R08: 00007fff4de964d8 R09:
00007fff4de964d8
3,949,146667547,-;R10: 00007fff4de964d8 R11: 0000000000000203 R12:
000055b2f59950a0
3,950,146667549,-;R13: 00007fff4de964d0 R14: 0000000000000000 R15:
0000000000000000
3,951,146667552,-; </TASK>
3,952,146667555,-;
3,953,146667558,-;Allocated by task 2157:
4,954,146667572,-; kasan_save_stack+0x1e/0x40
4,955,146667575,-; __kasan_kmalloc+0x81/0xa0
4,956,146667577,-; f2fs_fill_super+0xea/0x64f0
4,957,146667580,-; mount_bdev+0x2c0/0x3a0
4,958,146667583,-; legacy_get_tree+0xea/0x1d0
4,959,146667598,-; vfs_get_tree+0x7f/0x2b0
4,960,146667601,-; path_mount+0x47e/0x19b0
4,961,146667613,-; do_mount+0xc5/0xe0
4,962,146667616,-; __x64_sys_mount+0x127/0x190
4,963,146667619,-; do_syscall_64+0x3b/0x90
4,964,146667621,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
3,965,146667624,-;
3,966,146667625,-;The buggy address belongs to the object at
ffff88810ae96000\x0a which belongs to the cache kmalloc-4k of size 4096
3,967,146667628,-;The buggy address is located 3012 bytes inside of\x0a
4096-byte region [ffff88810ae96000, ffff88810ae97000)
3,968,146667631,-;The buggy address belongs to the page:
4,969,146667633,-;page:00000000d3f90f20 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x10ae90
4,970,146667636,-;head:00000000d3f90f20 order:3 compound_mapcount:0
compound_pincount:0
4,971,146667638,-;flags: 0x200000000010200(slab|head|node=0|zone=2)
4,972,146667643,-;raw: 0200000000010200 dead000000000100 dead000000000122
ffff888100043040
4,973,146667645,-;raw: 0000000000000000 0000000000040004 00000001ffffffff
0000000000000000
4,974,146667646,-;page dumped because: kasan: bad access detected
3,975,146667648,-;
3,976,146667649,-;Memory state around the buggy address:
3,977,146667651,-; ffff88810ae96a80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00
3,978,146667653,-; ffff88810ae96b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00
3,979,146667656,-;>ffff88810ae96b80: 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
fc fc
3,980,146667657,-;                                           ^
3,981,146667660,-; ffff88810ae96c00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc
fc fc
3,982,146667662,-; ffff88810ae96c80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc
fc fc
3,983,146667664,-;==================================================================

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
