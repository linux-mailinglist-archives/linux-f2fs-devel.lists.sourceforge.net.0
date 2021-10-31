Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A19440DA0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Oct 2021 10:29:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mh79R-0005Zx-UZ; Sun, 31 Oct 2021 09:29:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mh79Q-0005ZN-F5
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 09:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z8OSY7zbwAo+Y1WDp+dHziBZpEt70cbz375SQual6rs=; b=l14COs3pT8ELFNAS+94Mf83Gop
 d+ekOn2fOH9XUcbvQtFseN4en4ROC/SwVyS7RZpcNBi7YfjxHjIr4uO0/HmRCqsXAmxy6+/dFQ8n3
 jiyhlgSWQYY0096YL8qQSCPMTDu3K8ZTJhQyv/kD+GlQNGh/s/OIat0giNhIOcBaGLmk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z8OSY7zbwAo+Y1WDp+dHziBZpEt70cbz375SQual6rs=; b=M
 nRJOIdnaqxEIn0mlWC58wJT3cHFuEaRmX9j6db5PQH45xYn8vzT7BHwT+n/Q1up1VkzOL2Zj+xAxF
 /3XH8nN5ijlV7Lh/QpMEFUkBCAtcp3xSelNHUicAd4NHDdeI0rDqq3dDPeHMp3oFb5bFRZAeISvG+
 JaZd3EfRpPdLAMTw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mh77N-0002D6-HH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 09:29:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 3CB0960EFF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 31 Oct 2021 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635671008;
 bh=rJW6v5eLnSfeoRaiMBk2+l81Iob30b+Vf6193wpFCAQ=;
 h=From:To:Subject:Date:From;
 b=fTZJ9V04qqxKD3XM1YZb24k9ON6COK1G2tHEtwKoneGowx1PqbvtfyCggvWW9UguR
 QBhMdkxDDATaYsslkCG8CZKmQxG8shpodemE96d7J/MkIRLg/iweCMXgEG3PtAUzw+
 JbUEWwT6NTn13rIZozxUhTIVQZ8My15z/uZSAW8jHBhIG1U1XNizzSPtn+kf/GmIMz
 h+clPDMlX/79hMUDZnLlsNAh8+VLM4EvhXIJ3eLFRZWAC7xl4Sxyz969yky4zc7eNF
 pavcSpMc2+hhZ/lEpzJZ7GaU14N3Z9pK8G6j4FVcFXdD8AawNMD/AOfSbyFMT0w6sZ
 9ybVqyYyEGh1w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 288EB60F00; Sun, 31 Oct 2021 09:03:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 31 Oct 2021 09:03:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 793679547@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214895-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Headers-End: 1mh77N-0002D6-HH
Subject: [f2fs-dev] [Bug 214895] New: F2FS BUG: KASAN: stack-out-of-bounds
 in d_shrink_add+0x17f/0x1c0
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

https://bugzilla.kernel.org/show_bug.cgi?id=214895

            Bug ID: 214895
           Summary: F2FS BUG: KASAN: stack-out-of-bounds in
                    d_shrink_add+0x17f/0x1c0
           Product: File System
           Version: 2.5
    Kernel Version: 4.15.7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: 793679547@qq.com
        Regression: No

Created attachment 299377
  --> https://bugzilla.kernel.org/attachment.cgi?id=299377&action=edit
out.c

I tested the Linux kernel under version 4.15.7, and encounter a kernel bug when
I try to umount the f2fs file system. The following script triggers a KASAN
stack-out-of-bounds in f2fs file system, which only contains the commands
related to file operation and mount operation.

#!/bin/bash

dd if=/dev/zero of=f2fs-0.img bs=1M count=2278
mkfs.f2fs -a 0 -o 16 -t 1 -z 7 -q f2fs-0.img

g++ -std=c++11 -static "out.c" -o "./runner" -pthread

loop_dev="/dev/loop0"
losetup "$loop_dev" f2fs-0.img

./runner

umount /root/mnt
losetup -d $loop_dev
---------------------------------------
File "out.c" realizes the file operation and mount operation by C++ language.

Core dump:
4,996,511831432,-;CPU: 3 PID: 72 Comm: kworker/u16:1 Not tainted 4.15.7 #1
4,997,511831443,-;Hardware name: LENOVO 20J6A00NHH/20J6A00NHH, BIOS R0FET24W
(1.04 ) 12/21/2016
4,998,511831462,-;Workqueue: writeback wb_workfn (flush-7:0)
4,999,511831485,-;RIP: 0010:mempool_alloc+0x116/0x3c0
4,1000,511831495,-;RSP: 0018:ffff8807e2767338 EFLAGS: 00010293
4,1001,511831509,-;RAX: dffffc0000000004 RBX: 1ffff100fc4ece6e RCX:
ffffffffa68720af
4,1002,511831519,-;RDX: 0000000000000000 RSI: 0000000001408800 RDI:
0000000000000000
4,1003,511831530,-;RBP: ffff8807e2767418 R08: 0000000000000001 R09:
0000000000000000
4,1004,511831540,-;R10: ffffed00f8633b16 R11: ffff8807c319d8b7 R12:
0000000000000000
4,1005,511831551,-;R13: dffffc0000000000 R14: ffff8806d063ab50 R15:
0000000000000020
4,1006,511831564,-;FS:  0000000000000000(0000) GS:ffff8807e76c0000(0000)
knlGS:0000000000000000
4,1007,511831575,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,1008,511831586,-;CR2: 00007f6db21a53cc CR3: 000000062120e006 CR4:
00000000003606e0
4,1009,511831594,-;Call Trace:
4,1010,511831616,-; ? remove_element.isra.4+0x210/0x210
4,1011,511831634,-; ? mem_cgroup_uncharge+0x160/0x160
4,1012,511831726,-; __submit_bio+0x498/0xa50 [f2fs]
4,1013,511831819,-; __submit_merged_bio+0x1bb/0x760 [f2fs]
4,1014,511831926,-; __submit_merged_write_cond+0x21f/0x740 [f2fs]
4,1015,511832038,-; f2fs_write_cache_pages+0xf81/0x1250 [f2fs]
4,1016,511832154,-; ? __write_data_page+0x1bd0/0x1bd0 [f2fs]
4,1017,511832265,-; ? build_free_nids+0x6c1/0x1170 [f2fs]
4,1018,511832339,-; ? __radix_tree_lookup+0x2c6/0x360
4,1019,511832380,-; ? _find_next_bit+0x131/0x170
4,1020,511832496,-; __f2fs_write_data_pages+0x801/0xb90 [f2fs]
4,1021,511832547,-; ? __put_user_ns+0x80/0x80
4,1022,511832773,-; ? f2fs_write_data_page+0x40/0x40 [f2fs]
4,1023,511832862,-; ? clear_node_page_dirty+0x410/0x410 [f2fs]
4,1024,511832884,-; ? set_page_dirty+0x14b/0x380
4,1025,511832988,-; f2fs_write_data_pages+0x9b/0xc0 [f2fs]
4,1026,511833064,-; ? f2fs_write_data_pages+0x9b/0xc0 [f2fs]
4,1027,511833141,-; ? __f2fs_write_data_pages+0xb90/0xb90 [f2fs]
4,1028,511833157,-; do_writepages+0x123/0x1c0
4,1029,511833175,-; __writeback_single_inode+0xe7/0xd00
4,1030,511833192,-; writeback_sb_inodes+0x4d4/0xe80
4,1031,511833209,-; ? wbc_detach_inode+0x700/0x700
4,1032,511833223,-; ? string+0x1af/0x270
4,1033,511833242,-; ? wb_io_lists_populated+0xc1/0x110
4,1034,511833257,-; ? queue_io+0x21f/0x410
4,1035,511833272,-; wb_writeback+0x2c4/0xa80
4,1036,511833288,-; ? __writeback_inodes_wb+0x280/0x280
4,1037,511833302,-; ? set_worker_desc+0x198/0x200
4,1038,511833319,-; ? current_is_workqueue_rescuer+0x140/0x140
4,1039,511833338,-; wb_workfn+0x290/0xfd0
4,1040,511833351,-; ? wb_workfn+0x290/0xfd0
4,1041,511833367,-; ? __switch_to+0x1fd/0x1530
4,1042,511833385,-; ? inode_wait_for_writeback+0x70/0x70
4,1043,511833402,-; ? __clear_rsb+0x25/0x3d
4,1044,511833416,-; ? __clear_rsb+0x15/0x3d
4,1045,511833432,-; ? __schedule+0x959/0x2080
4,1046,511833447,-; ? put_pwq+0x4c/0x130
4,1047,511833464,-; process_one_work+0x8ae/0x1590
4,1048,511833482,-; worker_thread+0x575/0x15d0
4,1049,511833500,-; kthread+0x38e/0x460
4,1050,511833515,-; ? rescuer_thread+0x1150/0x1150
4,1051,511833529,-; ? kthread_create_worker+0x100/0x100
4,1052,511833545,-; ret_from_fork+0x35/0x40
4,1053,511833556,-;Code: 89 85 40 ff ff ff 48 8d 85 78 ff ff ff 48 89 85 30 ff
ff ff 48 83 c0 18 48 89 85 28 ff ff ff e8 c1 36 e1 ff 48 8b 85 40 ff ff ff <80>
38 00 0f 85 68 02 00 00 48 8b 85 48 ff ff ff 4d 8b 74 24 20 
1,1054,511833745,-;RIP: mempool_alloc+0x116/0x3c0 RSP: ffff8807e2767338
4,1055,511833829,-;---[ end trace 08bf240f83ef61f5 ]---
3,1056,511833920,-;==================================================================
3,1057,511833966,-;BUG: KASAN: stack-out-of-bounds in d_shrink_add+0x17f/0x1c0
3,1058,511834021,-;Read of size 8 at addr ffff8807e2767b98 by task
kworker/u16:1/72
3,1059,511834074,-;
4,1060,511834198,-;CPU: 3 PID: 72 Comm: kworker/u16:1 Tainted: G      D        
 4.15.7 #1
4,1061,511834330,-;Hardware name: LENOVO 20J6A00NHH/20J6A00NHH, BIOS R0FET24W
(1.04 ) 12/21/2016
4,1062,511834470,-;Workqueue: writeback wb_workfn (flush-7:0)
4,1063,511834652,-;Call Trace:
4,1064,511834738,-; dump_stack+0xd8/0x124
4,1065,511834831,-; print_address_description+0x95/0x400
4,1066,511834927,-; kasan_report+0x21c/0x3f0
4,1067,511835028,-; ? d_shrink_add+0x17f/0x1c0
4,1068,511835127,-; __asan_report_load8_noabort+0x29/0x40
4,1069,511835233,-; d_shrink_add+0x17f/0x1c0
4,1070,511835329,-; select_collect+0xed/0x290
4,1071,511835439,-; detach_and_collect+0xce/0x100
4,1072,511835543,-; d_walk+0x1b7/0x660
4,1073,511835632,-; ? d_delete+0x330/0x330
4,1074,511835738,-; ? select_collect+0x290/0x290
4,1075,511835830,-; d_invalidate+0x195/0x300
4,1076,511835916,-; ? d_drop+0x60/0x60
4,1077,511836014,-; ? d_lookup+0x92/0xc0
4,1078,511836114,-; proc_flush_task+0x29e/0x570
4,1079,511836216,-; ? proc_map_files_readdir+0xcd0/0xcd0
4,1080,511836339,-; release_task+0xa8/0x1350
4,1081,511836432,-; ? cgroup_post_fork+0x310/0x310
4,1082,511836535,-; ? unregister_hw_breakpoint+0x41/0x50
4,1083,511836701,-; do_exit+0x17f5/0x3140
4,1084,511836826,-; ? mm_update_next_owner+0x900/0x900
4,1085,511837037,-; ? kthread+0x38e/0x460
4,1086,511837131,-; rewind_stack_do_exit+0x17/0x20
3,1087,511837204,-;
3,1088,511837250,-;The buggy address belongs to the page:
0,1089,511837336,-;page:ffffea001f89d9c0 count:0 mapcount:0 mapping:         
(null) index:0x0
0,1090,511837406,-;flags: 0x17ffffc0000000()
1,1091,511837513,-;raw: 0017ffffc0000000 0000000000000000 0000000000000000
00000000ffffffff
1,1092,511837621,-;raw: ffffea001f89d9e0 ffffea001f89d9e0 0000000000000000
0000000000000000
1,1093,511837664,-;page dumped because: kasan: bad access detected
3,1094,511837700,-;
3,1095,511837748,-;Memory state around the buggy address:
3,1096,511837835,-; ffff8807e2767a80: 00 00 00 00 00 f3 f3 f3 00 00 00 00 00 00
00 00
3,1097,511837916,-; ffff8807e2767b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f1 f1
3,1098,511838008,-;>ffff8807e2767b80: f1 f1 00 f2 f2 f2 00 f2 f2 f2 00 00 00 00
00 00
3,1099,511838058,-;                            ^
3,1100,511838138,-; ffff8807e2767c00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 f1
3,1101,511838222,-; ffff8807e2767c80: f1 f1 f1 00 00 f2 f2 f2 f2 f2 f2 00 05 f2
f2 00
3,1102,511838274,-;==================================================================

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
