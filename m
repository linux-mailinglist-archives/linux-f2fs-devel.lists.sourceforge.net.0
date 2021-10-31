Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 018DB440D90
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Oct 2021 10:07:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mh6o4-0001d5-QL; Sun, 31 Oct 2021 09:07:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mh6o3-0001ci-V9
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 09:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3EXvpHhjCHbX8t3NsN8aNwSWBWRgYUP4ox6v9FC7eYg=; b=RkCdSJzUc2ZyAiCF3WKVzlLzcJ
 ajlcFlcHFlR+d7Vj0AWDFS48Unk/O/0PTmqntHpqt8chBqeqOLoUPmI4eFnXrMirI0t2lk4rM6e3y
 P3RppBR8HG9GLt+qc9j3noVd1pAyWIpb0QvES9pcd2KYQGcXYSjfuyMLaEX/GtWBADOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3EXvpHhjCHbX8t3NsN8aNwSWBWRgYUP4ox6v9FC7eYg=; b=h
 RxeKgq6tKfbVXksHk/xyax+nG5K1PPnJI73m2dAuV1wXv6g43MO18xHWGwt4wURgDCfvjNXCeCiJ2
 m/C8AU5tbhrkWI67v5d6lvNJ4sZoDMeoWfRL4GoSvMlc2fbN1NxwPw0bdQk/d+3kOfPGhGtdcghmN
 i9wL6gKYdnssRvn0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mh6k4-0008HL-QY
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 09:07:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id D35A860F56
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 31 Oct 2021 08:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635670479;
 bh=NBVXDa3awX3JOWiZUP3AReaqS56t4R+voIjw5gryxaU=;
 h=From:To:Subject:Date:From;
 b=fU1PBfu9ozfnNGYtml6c17yaraYmiSKz0ypb/gVYg2s54hXjoQuEuA6fw7JXJiRVC
 h3XXqOuDfMoJi38kdknCvxz0/mJPQZOfYbTbZCUtzT1f8m3rfB5tEGQYN7N0Ef6Mdt
 Niv/frq9ghLEQoPcvYH0mVbNtENzhP1p0Cbuiwzp3LkeyBgeK9l+32Sa1/JgN15ecR
 HkK8XsI5YjHtN+ZoXKSX9RyFI5GeNtU1j6ZGohgQ+TRuflxnM7x4Ow7Z2cRXmbPcVm
 MPjDyyBGuV/C22n134udMT74V+/ymr3l17L+stdycxkxum/v3S5EtUS+AeprrsaJQv
 /tJGcvgC8IG5w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BEA0960F00; Sun, 31 Oct 2021 08:54:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 31 Oct 2021 08:54:39 +0000
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
Message-ID: <bug-214889-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Headers-End: 1mh6k4-0008HL-QY
Subject: [f2fs-dev] [Bug 214889] New: F2FS BUG: KASAN: stack-out-of-bounds
 in tlb_gather_mmu+0x418/0x420
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

https://bugzilla.kernel.org/show_bug.cgi?id=214889

            Bug ID: 214889
           Summary: F2FS BUG: KASAN: stack-out-of-bounds in
                    tlb_gather_mmu+0x418/0x420
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

Created attachment 299371
  --> https://bugzilla.kernel.org/attachment.cgi?id=299371&action=edit
file operations and mount operations

I tested the Linux kernel under version 4.15.7, and encounter a kernel bug when
I try to umount the f2fs file system. The following script triggers a KASAN
stack-out-of-bounds in f2fs file system, which only contains the commands
related to file operation and mount operation.

#!/bin/bash
dd if=/dev/zero of=f2fs-0.img bs=1M count=1201
mkfs.f2fs -a 1 -o 0 -t 0 -z 8 -q f2fs-0.img

g++ -std=c++11 -static "out.c" -o "./runner" -pthread

loop_dev="/dev/loop0"
losetup "$loop_dev" f2fs-0.img

./runner

umount /root/mnt
losetup -d $loop_dev
---------------------------------------
File "out.c" realizes the file operation and mount operation by C++ language.

Core dump:
3,1057,658446356,-;==================================================================
3,1058,658446423,-;BUG: KASAN: stack-out-of-bounds in
tlb_gather_mmu+0x418/0x420
3,1059,658446479,-;Write of size 8 at addr ffff8806f8defba8 by task
runner-1/2949
3,1060,658446527,-;
4,1061,658446607,-;CPU: 0 PID: 2949 Comm: runner-1 Tainted: G      D         
4.15.7 #1
4,1062,658446662,-;Hardware name: LENOVO 20J6A00NHH/20J6A00NHH, BIOS R0FET24W
(1.04 ) 12/21/2016
4,1063,658446734,-;Call Trace:
4,1064,658446817,-; dump_stack+0xd8/0x124
4,1065,658446902,-; print_address_description+0x95/0x400
4,1066,658446981,-; kasan_report+0x21c/0x3f0
4,1067,658447051,-; ? tlb_gather_mmu+0x418/0x420
4,1068,658447138,-; __asan_report_store8_noabort+0x2c/0x40
4,1069,658447228,-; tlb_gather_mmu+0x418/0x420
4,1070,658447302,-; free_ldt_pgtables+0xab/0x160
4,1071,658447379,-; ? flush_ldt+0x270/0x270
4,1072,658447460,-; ? delete_from_page_cache_batch+0xb20/0xb20
4,1073,658447541,-; ? __d_instantiate+0x31d/0x480
4,1074,658447622,-; ldt_arch_exit_mmap+0x16/0x20
4,1075,658447692,-; exit_mmap+0x113/0x550
4,1076,658447772,-; ? SyS_munmap+0x50/0x50
4,1077,658447838,-; ? exit_aio+0x29b/0x390
4,1078,658447921,-; ? aio_migratepage+0x890/0x890
4,1079,658447989,-; ? taskstats_exit+0x93/0xeb0
4,1080,658448060,-; ? __percpu_up_read+0x4e/0x60
4,1081,658448150,-; ? exit_robust_list+0x243/0x280
4,1082,658448242,-; ? mm_update_next_owner+0x51a/0x900
4,1083,658448332,-; mmput+0x106/0x460
4,1084,658448424,-; do_exit+0x87b/0x3140
4,1085,658448546,-; ? mm_update_next_owner+0x900/0x900
4,1086,658448637,-; ? SyS_symlinkat+0x2f0/0x2f0
4,1087,658448730,-; ? SyS_symlinkat+0x2f0/0x2f0
4,1088,658448820,-; ? do_syscall_64+0x1c3/0x570
4,1089,658448874,-; rewind_stack_do_exit+0x17/0x20
4,1090,658448907,-;RIP: 0033:0x50cba7
4,1091,658448933,-;RSP: 002b:00007ffe9d2d5798 EFLAGS: 00000206 ORIG_RAX:
0000000000000058
4,1092,658449060,-;RAX: ffffffffffffffda RBX: 00000000030e5660 RCX:
000000000050cba7
4,1093,658449164,-;RDX: 0000000000000050 RSI: 00000000030e5660 RDI:
00000000030e5730
4,1094,658449219,-;RBP: 00007ffe9d2d57e0 R08: 0000000000000000 R09:
0000000000000050
4,1095,658449258,-;R10: 0000000000000047 R11: 0000000000000206 R12:
000000000049bde0
4,1096,658449302,-;R13: 000000000049be70 R14: 0000000000000000 R15:
0000000000000000
3,1097,658449345,-;
3,1098,658449372,-;The buggy address belongs to the page:
0,1099,658449421,-;page:ffffea001be37bc0 count:0 mapcount:0 mapping:         
(null) index:0x0
0,1100,658449461,-;flags: 0x17ffffc0000000()
1,1101,658449524,-;raw: 0017ffffc0000000 0000000000000000 0000000000000000
00000000ffffffff
1,1102,658449590,-;raw: dead000000000100 dead000000000200 0000000000000000
0000000000000000
1,1103,658449619,-;page dumped because: kasan: bad access detected
3,1104,658449648,-;
3,1105,658449673,-;Memory state around the buggy address:
3,1106,658449724,-; ffff8806f8defa80: 00 00 00 00 f2 f2 00 00 00 00 00 00 00 00
00 00
3,1107,658449775,-; ffff8806f8defb00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00
3,1108,658449847,-;>ffff8806f8defb80: 00 f1 f1 f1 f1 f1 f1 f1 00 00 00 00 00 00
00 00
3,1109,658449896,-;                                  ^
3,1110,658449946,-; ffff8806f8defc00: 00 00 00 00 f3 00 f2 f2 f2 00 00 00 00 00
00 00
3,1111,658450003,-; ffff8806f8defc80: 00 00 00 00 f1 f1 f1 f1 00 00 00 00 00 00
00 00
3,1112,658450038,-;==================================================================
12,1113,658728815,-;--- DONE
0,1114,668667614,-;kasan: CONFIG_KASAN_INLINE enabled
0,1115,668667620,-;kasan: GPF could be caused by NULL-ptr deref or user memory
access
4,1116,668667627,-;general protection fault: 0000 [#2] SMP KASAN PTI
4,1117,668667630,-;Modules linked in: f2fs rfcomm bnep nls_iso8859_1 arc4
iwlmvm mac80211 snd_hda_codec_hdmi intel_rapl snd_hda_codec_realtek
x86_pkg_temp_thermal intel_powerclamp snd_hda_codec_generic coretemp
snd_hda_intel snd_hda_codec uvcvideo kvm_intel snd_hda_core iwlwifi kvm
snd_hwdep snd_pcm videobuf2_vmalloc btusb videobuf2_memops thinkpad_acpi btrtl
videobuf2_v4l2 nvram btbcm irqbypass videobuf2_core btintel crct10dif_pclmul
snd_seq_midi snd_seq_midi_event crc32_pclmul videodev bluetooth cfg80211
ghash_clmulni_intel snd_rawmidi pcbc snd_seq aesni_intel aes_x86_64 crypto_simd
glue_helper media cryptd snd_seq_device intel_cstate intel_rapl_perf
ecdh_generic snd_timer joydev input_leds serio_raw wmi_bmof
intel_wmi_thunderbolt snd mei_me shpchp soundcore mei acpi_pad mac_hid
intel_pch_thermal parport_pc
4,1118,668667707,c; ppdev lp parport autofs4 btrfs xor zstd_compress raid6_pq
nouveau i915 mxm_wmi ttm i2c_algo_bit drm_kms_helper e1000e syscopyarea
sysfillrect sysimgblt fb_sys_fops ahci drm psmouse ptp libahci pps_core wmi
video hid_generic usbhid hid
4,1119,668667743,-;CPU: 2 PID: 72 Comm: kworker/u16:1 Tainted: G    B D        
 4.15.7 #1
4,1120,668667747,-;Hardware name: LENOVO 20J6A00NHH/20J6A00NHH, BIOS R0FET24W
(1.04 ) 12/21/2016
4,1121,668667756,-;Workqueue: writeback wb_workfn (flush-7:0)
4,1122,668667765,-;RIP: 0010:mempool_alloc+0x116/0x3c0
4,1123,668667769,-;RSP: 0018:ffff8807e2766ed0 EFLAGS: 00010293
4,1124,668667774,-;RAX: dffffc0000000004 RBX: 1ffff100fc4ecde1 RCX:
ffffffff95a720af
4,1125,668667778,-;RDX: 0000000000000000 RSI: 0000000001408800 RDI:
0000000000000000
4,1126,668667782,-;RBP: ffff8807e2766fb0 R08: 0000000000000001 R09:
0000000000000001
4,1127,668667786,-;R10: 0000000000000003 R11: 000000000a0c9483 R12:
0000000000000000
4,1128,668667790,-;R13: dffffc0000000000 R14: ffff8806b9c68790 R15:
0000000000000020
4,1129,668667795,-;FS:  0000000000000000(0000) GS:ffff8807e7680000(0000)
knlGS:0000000000000000
4,1130,668667799,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,1131,668667803,-;CR2: 0000000001ee52d8 CR3: 00000004caa0e003 CR4:
00000000003606e0
4,1132,668667807,-;Call Trace:
4,1133,668667814,-; ? remove_element.isra.4+0x210/0x210
4,1134,668667849,-; ? __set_nat_cache_dirty+0x28a/0x5c0 [f2fs]
4,1135,668667879,-; ? set_node_addr+0x150/0xc70 [f2fs]
4,1136,668667886,-; ? radix_tree_next_chunk+0x72d/0xab0
4,1137,668667893,-; ? mem_cgroup_uncharge+0x160/0x160
4,1138,668667922,-; __submit_bio+0x498/0xa50 [f2fs]
4,1139,668667952,-; __submit_merged_bio+0x1bb/0x760 [f2fs]
4,1140,668667981,-; __submit_merged_write_cond+0x21f/0x740 [f2fs]
4,1141,668667991,-; ? put_pages_list+0x370/0x370
4,1142,668668021,-; f2fs_submit_merged_write+0x36/0x50 [f2fs]
4,1143,668668050,-; sync_node_pages+0x507/0x1750 [f2fs]
4,1144,668668057,-; ? save_stack+0x4b/0x170
4,1145,668668063,-; ? kmem_cache_alloc+0x159/0x360
4,1146,668668093,-; ? fsync_node_pages+0x14e0/0x14e0 [f2fs]
4,1147,668668099,-; ? scsi_request_fn+0xa0/0x1a80
4,1148,668668105,-; ? __blk_run_queue+0x41/0x280
4,1149,668668111,-; ? queue_unplugged+0x74/0x230
4,1150,668668120,-; ? blk_flush_plug_list+0x8d4/0xc20
4,1151,668668126,-; ? blk_finish_plug+0x76/0xc0
4,1152,668668131,-; ? wb_writeback+0x8a4/0xa80
4,1153,668668136,-; ? wb_workfn+0xb14/0xfd0
4,1154,668668142,-; ? process_one_work+0x8ae/0x1590
4,1155,668668148,-; ? worker_thread+0x575/0x15d0
4,1156,668668155,-; ? ret_from_fork+0x35/0x40
4,1157,668668162,-; ? _find_next_bit+0x131/0x170
4,1158,668668167,-; ? _cond_resched+0x2c/0xb0
4,1159,668668196,-; block_operations+0x35e/0x8a0 [f2fs]
4,1160,668668225,-; ? f2fs_sync_inode_meta+0x3c0/0x3c0 [f2fs]
4,1161,668668231,-; ? find_busiest_group+0x616/0x2f90
4,1162,668668237,-; ? kasan_slab_alloc+0x1a/0x30
4,1163,668668243,-; ? kmem_cache_alloc+0x159/0x360
4,1164,668668250,-; ? update_group_capacity+0xa90/0xa90
4,1165,668668256,-; ? sg_next+0x69/0xa0
4,1166,668668284,-; write_checkpoint+0x252/0x4ec0 [f2fs]
4,1167,668668312,-; ? write_checkpoint+0x252/0x4ec0 [f2fs]
4,1168,668668319,-; ? nr_blockdev_pages+0xf4/0x160
4,1169,668668325,-; ? si_meminfo+0x102/0x200
4,1170,668668330,-; ? _find_next_bit+0x131/0x170
4,1171,668668359,-; f2fs_sync_fs+0x285/0x460 [f2fs]
4,1172,668668387,-; ? trace_event_raw_event_f2fs__page+0x710/0x710 [f2fs]
4,1173,668668418,-; f2fs_balance_fs_bg+0x3d6/0x8f0 [f2fs]
4,1174,668668448,-; ? drop_inmem_page+0x7e0/0x7e0 [f2fs]
4,1175,668668454,-; ? radix_tree_tag_set+0x2eb/0x370
4,1176,668668461,-; ? map_id_up+0x215/0x3e0
4,1177,668668493,-; f2fs_write_node_pages+0x131/0x8d0 [f2fs]
4,1178,668668522,-; ? f2fs_write_node_pages+0x131/0x8d0 [f2fs]
4,1179,668668551,-; ? f2fs_set_node_page_dirty+0x129/0x430 [f2fs]
4,1180,668668580,-; ? clear_node_page_dirty+0x410/0x410 [f2fs]
4,1181,668668609,-; ? sync_node_pages+0x1750/0x1750 [f2fs]
4,1182,668668614,-; ? set_page_dirty+0x14b/0x380
4,1183,668668642,-; ? update_inode+0x181f/0x1f80 [f2fs]
4,1184,668668671,-; ? f2fs_balance_fs+0x358/0x890 [f2fs]
4,1185,668668700,-; ? sync_node_pages+0x1750/0x1750 [f2fs]
4,1186,668668706,-; do_writepages+0x123/0x1c0
4,1187,668668711,-; ? do_writepages+0x123/0x1c0
4,1188,668668717,-; __writeback_single_inode+0xe7/0xd00
4,1189,668668723,-; writeback_sb_inodes+0x4d4/0xe80
4,1190,668668733,-; ? wbc_detach_inode+0x700/0x700
4,1191,668668759,-; __writeback_inodes_wb+0xd8/0x280
4,1192,668668768,-; wb_writeback+0x825/0xa80
4,1193,668668774,-; ? __writeback_inodes_wb+0x280/0x280
4,1194,668668781,-; ? get_nr_dirty_inodes+0xe5/0x160
4,1195,668668787,-; wb_workfn+0x53d/0xfd0
4,1196,668668792,-; ? wb_workfn+0x53d/0xfd0
4,1197,668668798,-; ? __switch_to+0x1fd/0x1530
4,1198,668668804,-; ? inode_wait_for_writeback+0x70/0x70
4,1199,668668810,-; ? __clear_rsb+0x25/0x3d
4,1200,668668815,-; ? __schedule+0x959/0x2080
4,1201,668668821,-; ? put_pwq+0x4c/0x130
4,1202,668668828,-; process_one_work+0x8ae/0x1590
4,1203,668668835,-; worker_thread+0x575/0x15d0
4,1204,668668842,-; kthread+0x38e/0x460
4,1205,668668847,-; ? rescuer_thread+0x1150/0x1150
4,1206,668668853,-; ? kthread_create_worker+0x100/0x100
4,1207,668668859,-; ret_from_fork+0x35/0x40
4,1208,668668863,-;Code: 89 85 40 ff ff ff 48 8d 85 78 ff ff ff 48 89 85 30 ff
ff ff 48 83 c0 18 48 89 85 28 ff ff ff e8 c1 36 e1 ff 48 8b 85 40 ff ff ff <80>
38 00 0f 85 68 02 00 00 48 8b 85 48 ff ff ff 4d 8b 74 24 20 
1,1209,668668963,-;RIP: mempool_alloc+0x116/0x3c0 RSP: ffff8807e2766ed0
4,1210,668668968,-;---[ end trace 0ae21dda476d29b8 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
