Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30211440D9B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Oct 2021 10:23:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mh73b-0004Ef-SS; Sun, 31 Oct 2021 09:23:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mh73X-0004Dl-6I
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 09:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gsCzkcXMiMZR+Nj/Hjmd+4tyzEygrfLxKqzCDdrmvao=; b=GgGgfzIvDLXK+Eu/1O6Ozh03y5
 yIqM0FFYV2G3a5CZu9un5jLB8QuQsRmj9pJsTc4x2W3ZoAggpfo2qXTbjpRj1kG4fHx35YoyhbSM9
 wZ2EVklwcfFJXS0yl1ColCBISz1aUl8zJKvgsMCVX+MEAy/maxU04XhpeZTUGvmFvvkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gsCzkcXMiMZR+Nj/Hjmd+4tyzEygrfLxKqzCDdrmvao=; b=Q
 o/fzxGVYBlldP6wpVM8m1T5W1EHRN3sZD0le2PHVArnX6YSmpZa7wgGXbJYgWgz8al/SBE+Y8bBbI
 GtnyjvOaivhhOVcpxr1O1rBMC4J7eJ1THtUHsfsVmQyJStUxUeBSyjH8qUXt5xJapw9/q/19SYRHi
 RtO+j1m89aM7+DAg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mh6xh-008Yoa-IP
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 09:23:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C50561054
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 31 Oct 2021 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635670868;
 bh=/md2R2tUQUewCDNDQ8kv88qazI7Oe5amFNOE9FA3aZs=;
 h=From:To:Subject:Date:From;
 b=m0eqt7F6z829g3TTh3fcRaX3RXRiclZd1DbD/TjOnpvCyOp8iaE5ckbmQxDankH1/
 flbgOlX9OOiOcesGeYAzzT1NzZtP0Nrt6h/fMMbSCY0MrTx0k4FncM4oui1nYTjzVX
 LstgivKL4OP3WVOfmJMPECa8iaWTJfjAlw01Yz14AJgsRFIdbQ0WR5aY6nlitbNiQ9
 /CAhsA7NjYaOgBd+OMhuzOsoIuOcJdrUFCiWrO7x5M9ASOBMOLIBA1yaEQE4IBnMok
 vRu710zMqatRLgImwWz9IWbanhKjMb8L3jTnb/UlSe4/jfn1Va87edMIAeuUWlArol
 StYY0JgI+krtQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 62A8560F00; Sun, 31 Oct 2021 09:01:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 31 Oct 2021 09:01:08 +0000
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
Message-ID: <bug-214893-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Headers-End: 1mh6xh-008Yoa-IP
Subject: [f2fs-dev] [Bug 214893] New: F2FS BUG: KASAN: stack-out-of-bounds
 in update_stack_state+0x5f2/0x750
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

https://bugzilla.kernel.org/show_bug.cgi?id=214893

            Bug ID: 214893
           Summary: F2FS BUG: KASAN: stack-out-of-bounds in
                    update_stack_state+0x5f2/0x750
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

Created attachment 299375
  --> https://bugzilla.kernel.org/attachment.cgi?id=299375&action=edit
out.c

I tested the Linux kernel under version 4.15.7, and encounter a kernel bug when
I try to umount the f2fs file system. The following script triggers a KASAN
stack-out-of-bounds in f2fs file system, which only contains the commands
related to file operation and mount operation.

#!/bin/bash

dd if=/dev/zero of=f2fs-0.img bs=1M count=1405
mkfs.f2fs -a 0 -o 5 -t 1 -z 2 -q f2fs-0.img

g++ -std=c++11 -static "out.c" -o "./runner" -pthread

loop_dev="/dev/loop0"
losetup "$loop_dev" f2fs-0.img

./runner

umount /root/mnt
losetup -d $loop_dev
---------------------------------------
File "out.c" realizes the file operation and mount operation by C++ language.

Core dump:
4,1050,989316005,-;CPU: 0 PID: 6028 Comm: runner-1 Not tainted 4.15.7 #1
4,1051,989316013,-;Hardware name: LENOVO 20J6A00NHH/20J6A00NHH, BIOS R0FET24W
(1.04 ) 12/21/2016
4,1052,989316028,-;RIP: 0010:mempool_alloc+0x116/0x3c0
4,1053,989316037,-;RSP: 0018:ffff8807c2a871f8 EFLAGS: 00010293
4,1054,989316050,-;RAX: dffffc0000000004 RBX: 1ffff100f8550e46 RCX:
ffffffffa6c720af
4,1055,989316067,-;RDX: 0000000000000000 RSI: 0000000001408800 RDI:
0000000000000000
4,1056,989316081,-;RBP: ffff8807c2a872d8 R08: 0000000000000001 R09:
0000000000000000
4,1057,989316086,-;R10: 0000000000000002 R11: 000000000b3edd8a R12:
0000000000000000
4,1058,989316090,-;R13: dffffc0000000000 R14: ffff8806d58b5a50 R15:
0000000000000020
4,1059,989316095,-;FS:  0000000001f2a8c0(0000) GS:ffff8807e7600000(0000)
knlGS:0000000000000000
4,1060,989316100,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,1061,989316104,-;CR2: 00000000007d15e4 CR3: 000000068ef22001 CR4:
00000000003606f0
4,1062,989316108,-;Call Trace:
4,1063,989316120,-; ? remove_element.isra.4+0x210/0x210
4,1064,989316127,-; ? mem_cgroup_uncharge+0x160/0x160
4,1065,989316134,-; ? release_pages+0x4e0/0xd10
4,1066,989316140,-; ? unlock_page+0x7d/0xa0
4,1067,989316182,-; __submit_bio+0x498/0xa50 [f2fs]
4,1068,989316228,-; __submit_merged_bio+0x1bb/0x760 [f2fs]
4,1069,989316258,-; __submit_merged_write_cond+0x21f/0x740 [f2fs]
4,1070,989316263,-; ? pagevec_move_tail+0xc0/0xc0
4,1071,989316297,-; f2fs_write_cache_pages+0xf81/0x1250 [f2fs]
4,1072,989316356,-; ? __write_data_page+0x1bd0/0x1bd0 [f2fs]
4,1073,989316384,-; ? unwind_dump+0x3d0/0x3d0
4,1074,989316418,-; ? radix_tree_next_chunk+0x72d/0xab0
4,1075,989316452,-; ? kernel_text_address+0x1b6/0x1e0
4,1076,989316478,-; ? __kernel_text_address+0x1a/0x60
4,1077,989316558,-; __f2fs_write_data_pages+0x801/0xb90 [f2fs]
4,1078,989316578,-; ? find_get_pages_range_tag+0x67d/0xb70
4,1079,989316632,-; ? f2fs_write_data_page+0x40/0x40 [f2fs]
4,1080,989316657,-; ? find_lock_entry+0x180/0x180
4,1081,989316716,-; f2fs_write_data_pages+0x9b/0xc0 [f2fs]
4,1082,989316782,-; ? f2fs_write_data_pages+0x9b/0xc0 [f2fs]
4,1083,989316905,-; ? __f2fs_write_data_pages+0xb90/0xb90 [f2fs]
4,1084,989316949,-; do_writepages+0x123/0x1c0
4,1085,989316981,-; __filemap_fdatawrite_range+0x2c4/0x3c0
4,1086,989317012,-; ? delete_from_page_cache_batch+0xb20/0xb20
4,1087,989317100,-; ? __write_data_page+0x1bd0/0x1bd0 [f2fs]
4,1088,989317112,-; filemap_fdatawrite+0x33/0x40
4,1089,989317158,-; sync_dirty_inodes+0x1e6/0x880 [f2fs]
4,1090,989317220,-; block_operations+0x168/0x8a0 [f2fs]
4,1091,989317270,-; ? f2fs_sync_inode_meta+0x3c0/0x3c0 [f2fs]
4,1092,989317309,-; ? read_node_page+0x235/0x370 [f2fs]
4,1093,989317349,-; write_checkpoint+0x252/0x4ec0 [f2fs]
4,1094,989317394,-; ? write_checkpoint+0x252/0x4ec0 [f2fs]
4,1095,989317457,-; ? f2fs_set_page_dirty_nobuffers+0x2b9/0x440 [f2fs]
4,1096,989317503,-; ? f2fs_set_node_page_dirty+0x361/0x430 [f2fs]
4,1097,989317554,-; f2fs_sync_fs+0x285/0x460 [f2fs]
4,1098,989317611,-; ? trace_event_raw_event_f2fs__page+0x710/0x710 [f2fs]
4,1099,989317628,-; ? radix_tree_lookup+0x29/0x40
4,1100,989317669,-; f2fs_do_sync_file+0x50a/0x1ac0 [f2fs]
4,1101,989317712,-; ? __f2fs_ioc_setflags+0x320/0x320 [f2fs]
4,1102,989317724,-; ? kmem_cache_free+0xc0/0x390
4,1103,989317733,-; ? putname+0x12c/0x180
4,1104,989317780,-; f2fs_sync_file+0x14d/0x1b0 [f2fs]
4,1105,989317819,-; ? f2fs_do_sync_file+0x1ac0/0x1ac0 [f2fs]
4,1106,989317833,-; vfs_fsync_range+0x131/0x290
4,1107,989317842,-; ? __fget_light+0x195/0x230
4,1108,989317850,-; do_fsync+0x5f/0xb0
4,1109,989317856,-; ? SyS_syncfs+0x140/0x140
4,1110,989317862,-; SyS_fsync+0x23/0x30
4,1111,989317871,-; do_syscall_64+0x1c3/0x570
4,1112,989317880,-; ? do_page_fault+0x5f/0x380
4,1113,989317886,-; ? prepare_exit_to_usermode+0x105/0x1e0
4,1114,989317897,-; entry_SYSCALL_64_after_hwframe+0x3d/0xa2
4,1115,989317904,-;RIP: 0033:0x49a340
4,1116,989317908,-;RSP: 002b:00007ffc7e5f53c8 EFLAGS: 00000246 ORIG_RAX:
000000000000004a
4,1117,989317935,-;RAX: ffffffffffffffda RBX: 0000000000400328 RCX:
000000000049a340
4,1118,989317941,-;RDX: 000000000055a6e8 RSI: 0000000000000000 RDI:
0000000000000062
4,1119,989317968,-;RBP: 00007ffc7e5f53f0 R08: 0000000000000000 R09:
000000000000012b
4,1120,989317978,-;R10: 0000000000000122 R11: 0000000000000246 R12:
000000000049c030
4,1121,989317992,-;R13: 000000000049c0c0 R14: 0000000000000000 R15:
0000000000000000
4,1122,989318005,-;Code: 89 85 40 ff ff ff 48 8d 85 78 ff ff ff 48 89 85 30 ff
ff ff 48 83 c0 18 48 89 85 28 ff ff ff e8 c1 36 e1 ff 48 8b 85 40 ff ff ff <80>
38 00 0f 85 68 02 00 00 48 8b 85 48 ff ff ff 4d 8b 74 24 20 
1,1123,989318122,-;RIP: mempool_alloc+0x116/0x3c0 RSP: ffff8807c2a871f8
4,1124,989318128,-;---[ end trace 00cfe425f6a4df85 ]---
3,1125,989318981,-;==================================================================
3,1126,989318990,-;BUG: KASAN: stack-out-of-bounds in
update_stack_state+0x5f2/0x750
3,1127,989318995,-;Read of size 8 at addr ffff8807c2a87c90 by task
runner-1/6028
3,1128,989318997,-;
4,1129,989319003,-;CPU: 0 PID: 6028 Comm: runner-1 Tainted: G      D         
4.15.7 #1
4,1130,989319007,-;Hardware name: LENOVO 20J6A00NHH/20J6A00NHH, BIOS R0FET24W
(1.04 ) 12/21/2016
4,1131,989319010,-;Call Trace:
4,1132,989319016,-; dump_stack+0xd8/0x124
4,1133,989319022,-; print_address_description+0x95/0x400
4,1134,989319028,-; kasan_report+0x21c/0x3f0
4,1135,989319033,-; ? update_stack_state+0x5f2/0x750
4,1136,989319039,-; __asan_report_load8_noabort+0x29/0x40
4,1137,989319045,-; update_stack_state+0x5f2/0x750
4,1138,989319050,-; ? unwind_dump+0x3d0/0x3d0
4,1139,989319056,-; ? unwind_dump+0x3d0/0x3d0
4,1140,989319061,-; ? unwind_next_frame+0x215/0xb90
4,1141,989319067,-; unwind_next_frame+0x215/0xb90
4,1142,989319073,-; ? __filemap_fdatawrite_range+0x2c4/0x3c0
4,1143,989319079,-; ? update_stack_state+0x750/0x750
4,1144,989319085,-; ? __unwind_start+0x1f0/0x3e0
4,1145,989319090,-; __save_stack_trace+0xb2/0x170
4,1146,989319125,-; ? free_pgtables+0x289/0x3c0
4,1147,989319204,-; save_stack_trace+0x27/0x40
4,1148,989319229,-; save_stack+0x4b/0x170
4,1149,989319241,-; ? save_stack+0x4b/0x170
4,1150,989319255,-; ? kasan_slab_free+0x99/0x110
4,1151,989319266,-; ? kmem_cache_free+0xc0/0x390
4,1152,989319293,-; ? unlink_anon_vmas+0x4a0/0x730
4,1153,989319304,-; ? free_pgtables+0x289/0x3c0
4,1154,989319316,-; ? pagevec_lru_move_fn+0x1f9/0x290
4,1155,989319327,-; ? alloc_pages_current+0xeb/0x2d0
4,1156,989319339,-; ? PageHuge+0xf6/0x150
4,1157,989319350,-; ? unlock_page_memcg+0x39/0x50
4,1158,989319364,-; ? __tlb_remove_page_size+0xdf/0x410
4,1159,989319378,-; ? page_remove_rmap+0x483/0x9f0
4,1160,989319389,-; ? _cond_resched+0x2c/0xb0
4,1161,989319402,-; ? unmap_page_range+0x1df2/0x2440
4,1162,989319409,-; ? __slab_free+0xd0/0x400
4,1163,989319414,-; ? __slab_free+0xd0/0x400
4,1164,989319421,-; ? anon_vma_interval_tree_remove+0xb7f/0x11b0
4,1165,989319426,-; ? __put_anon_vma+0xb1/0x290
4,1166,989319431,-; ? kmem_cache_free+0x339/0x390
4,1167,989319436,-; kasan_slab_free+0x99/0x110
4,1168,989319442,-; ? unlink_anon_vmas+0x4a0/0x730
4,1169,989319447,-; kmem_cache_free+0xc0/0x390
4,1170,989319452,-; unlink_anon_vmas+0x4a0/0x730
4,1171,989319458,-; free_pgtables+0x289/0x3c0
4,1172,989319464,-; exit_mmap+0x1f0/0x550
4,1173,989319469,-; ? SyS_munmap+0x50/0x50
4,1174,989319476,-; ? mm_update_next_owner+0x51a/0x900
4,1175,989319482,-; mmput+0x106/0x460
4,1176,989319487,-; do_exit+0x87b/0x3140
4,1177,989319492,-; ? putname+0x12c/0x180
4,1178,989319499,-; ? mm_update_next_owner+0x900/0x900
4,1179,989319504,-; ? vfs_fsync_range+0x131/0x290
4,1180,989319509,-; ? __fget_light+0x195/0x230
4,1181,989319514,-; ? do_fsync+0x5f/0xb0
4,1182,989319519,-; ? SyS_syncfs+0x140/0x140
4,1183,989319524,-; ? SyS_fsync+0x23/0x30
4,1184,989319530,-; ? do_syscall_64+0x1c3/0x570
4,1185,989319535,-; rewind_stack_do_exit+0x17/0x20
4,1186,989319539,-;RIP: 0033:0x49a340
4,1187,989319543,-;RSP: 002b:00007ffc7e5f53c8 EFLAGS: 00000246 ORIG_RAX:
000000000000004a
4,1188,989319548,-;RAX: ffffffffffffffda RBX: 0000000000400328 RCX:
000000000049a340
4,1189,989319552,-;RDX: 000000000055a6e8 RSI: 0000000000000000 RDI:
0000000000000062
4,1190,989319556,-;RBP: 00007ffc7e5f53f0 R08: 0000000000000000 R09:
000000000000012b
4,1191,989319560,-;R10: 0000000000000122 R11: 0000000000000246 R12:
000000000049c030
4,1192,989319563,-;R13: 000000000049c0c0 R14: 0000000000000000 R15:
0000000000000000
3,1193,989319567,-;
3,1194,989319570,-;The buggy address belongs to the page:
0,1195,989319575,-;page:ffffea001f0aa1c0 count:0 mapcount:0 mapping:         
(null) index:0x0
0,1196,989319579,-;flags: 0x17ffffc0000000()
1,1197,989319586,-;raw: 0017ffffc0000000 0000000000000000 0000000000000000
00000000ffffffff
1,1198,989319592,-;raw: 0000000000000000 dead000000000200 0000000000000000
0000000000000000
1,1199,989319596,-;page dumped because: kasan: bad access detected
3,1200,989319598,-;
3,1201,989319600,-;Memory state around the buggy address:
3,1202,989319605,-; ffff8807c2a87b80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00
3,1203,989319610,-; ffff8807c2a87c00: 00 00 00 00 00 00 00 00 00 f1 f1 f1 00 00
00 00
3,1204,989319615,-;>ffff8807c2a87c80: f3 f3 f3 f3 f1 f1 f1 f1 00 00 00 00 00 00
00 00
3,1205,989319618,-;                         ^
3,1206,989319622,-; ffff8807c2a87d00: 00 00 00 00 00 00 00 00 00 f2 f2 f2 00 00
00 00
3,1207,989319627,-; ffff8807c2a87d80: 00 00 00 00 00 00 00 00 f3 f3 f3 f3 00 00
00 00
3,1208,989319629,-;==================================================================

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
