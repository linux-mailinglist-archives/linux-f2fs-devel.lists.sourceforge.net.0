Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E5D440D9A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Oct 2021 10:23:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mh73X-0001Fq-7S; Sun, 31 Oct 2021 09:23:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mh73V-0001Fj-Oh
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 09:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SHHcb+y+g8KljZvUBKYsUyZqVY82cq3BCnI/YNlbPnU=; b=F0Mr1QS2o9f3nxYfsEP+DQLcEX
 7xRye87lKJU3heJwGVfutnsC0jSTYH0DLCkvO++9reNzTj8+BUKtSTL3bYx6Cl08GD/tXPZvi9J7y
 n4U6eW8372/Y2Got17/KhoHIQ+4WGOXCNYWfRayKG5xc4hYuXfX3N+UqyrmwX9ANeEFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SHHcb+y+g8KljZvUBKYsUyZqVY82cq3BCnI/YNlbPnU=; b=Q
 PMLpvyo3FXM+tvevp4OyGLCdGA3I5zb0+ezm/ZZ5CXAY8zi/qo043ygIr9oATJq1zx6Hr/KPwrA13
 yDUajThCAv9f2hibT6yue9aKMXXwLjliAsEq+zMKWEGojC+Za592zrNZAy7daMObFbuIvav0HwOva
 oMDbNAb16yY5zsec=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mh6xh-0000qs-Hz
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 09:23:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1518560527
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 31 Oct 2021 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635670717;
 bh=cqZKCoyhCz90Yck1z08SU6lrtk/QsLNLhaUSumJBV3I=;
 h=From:To:Subject:Date:From;
 b=RwImaqWepoTpsphb9/vndHyvdkFHuxCAIvhgPqH5WT3k2phT9+XowZXytampKSzuB
 pu/KHGgIkCD14OZnQuTF5wqPSXOvlgVodzidbGz8VNA19CRClMNqIgZVruHLocgyne
 fJz29qeWv/GgpjatHXXCmIO3HhJXv8xZQSWtYQj2A6k8RUG9QlGJZXBr9UgyJX/WD0
 0moCHuDYwp2lWfUl/ktZkTwzYHZDF59+fqPRnIgGFf5RI4XHY+DjQY2qXXMe7BuGwN
 Vz/HMrDqRqfgzl+f2UoS0VNwp8x7VR30RtFcHxtU9nWyr9toGIA27PT+RvfBTwFYO0
 FysbZBEzA9miA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 013D560F00; Sun, 31 Oct 2021 08:58:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 31 Oct 2021 08:58:36 +0000
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
Message-ID: <bug-214891-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Headers-End: 1mh6xh-0000qs-Hz
Subject: [f2fs-dev] [Bug 214891] New: F2FS BUG: KASAN: stack-out-of-bounds
 in string+0x23c/0x270
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

https://bugzilla.kernel.org/show_bug.cgi?id=214891

            Bug ID: 214891
           Summary: F2FS BUG: KASAN: stack-out-of-bounds in
                    string+0x23c/0x270
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

Created attachment 299373
  --> https://bugzilla.kernel.org/attachment.cgi?id=299373&action=edit
out.c

I tested the Linux kernel under version 4.15.7, and encounter a kernel bug when
I try to umount the f2fs file system. The following script triggers a KASAN
stack-out-of-bounds in f2fs file system, which only contains the commands
related to file operation and mount operation.

#!/bin/bash

dd if=/dev/zero of=f2fs-0.img bs=1M count=1879
mkfs.f2fs -a 0 -o 9 -t 1 -z 3 -q f2fs-0.img

g++ -std=c++11 -static "out.c" -o "./runner" -pthread

loop_dev="/dev/loop0"
losetup "$loop_dev" f2fs-0.img

./runner

umount /root/mnt
losetup -d $loop_dev
---------------------------------------
File "out.c" realizes the file operation and mount operation by C++ language.

Core dump:
3,1078,681788796,-;==================================================================
3,1079,681788808,-;BUG: KASAN: stack-out-of-bounds in string+0x23c/0x270
3,1080,681788821,-;Read of size 8 at addr ffff8806b86af630 by task
kworker/u16:4/2757
3,1081,681788825,-;
4,1082,681788838,-;CPU: 4 PID: 2757 Comm: kworker/u16:4 Tainted: G      D      
   4.15.7 #1
4,1083,681788854,-;Hardware name: LENOVO 20J6A00NHH/20J6A00NHH, BIOS R0FET24W
(1.04 ) 12/21/2016
4,1084,681788866,-;Workqueue: writeback wb_workfn (flush-7:1)
4,1085,681788883,-;Call Trace:
4,1086,681788890,-; dump_stack+0xd8/0x124
4,1087,681788901,-; print_address_description+0x95/0x400
4,1088,681788911,-; kasan_report+0x21c/0x3f0
4,1089,681788920,-; ? string+0x23c/0x270
4,1090,681788927,-; __asan_report_load_n_noabort+0x24/0x30
4,1091,681788937,-; string+0x23c/0x270
4,1092,681788947,-; ? do_exit+0x12a/0x3140
4,1093,681788954,-; symbol_string+0x170/0x250
4,1094,681788960,-; ? do_exit+0x12a/0x3140
4,1095,681788967,-; ? hex_string+0x480/0x480
4,1096,681788976,-; ? radix_tree_tag_set+0x2eb/0x370
4,1097,681788985,-; ? __mark_inode_dirty+0x5fe/0xdd0
4,1098,681788995,-; ? __f2fs_write_data_pages+0x801/0xb90 [f2fs]
4,1099,681789004,-; ? put_dec_trunc8+0xc2/0x300
4,1100,681789013,-; ? put_dec+0x43/0x100
4,1101,681789023,-; ? do_exit+0x12a/0x3140
4,1102,681789029,-; pointer+0x92d/0xbe0
4,1103,681789036,-; ? address_val+0xc0/0xc0
4,1104,681789043,-; ? string+0x1af/0x270
4,1105,681789054,-; ? format_decode+0x194/0xa60
4,1106,681789064,-; vsnprintf+0x36a/0x1820
4,1107,681789071,-; ? bstr_printf+0x1060/0x1060
4,1108,681789078,-; vscnprintf+0x35/0x80
4,1109,681789085,-; vprintk_emit+0x15b/0x860
4,1110,681789092,-; ? do_exit+0x12a/0x3140
4,1111,681789103,-; vprintk_default+0x75/0x110
4,1112,681789112,-; vprintk_func+0x64/0x140
4,1113,681789118,-; printk+0xbe/0xf0
4,1114,681789125,-; ? show_regs_print_info+0x2d/0x2d
4,1115,681789135,-; ? __probe_kernel_read+0x1c2/0x220
4,1116,681789143,-; ? do_exit+0x12a/0x3140
4,1117,681789151,-; __warn+0xbb/0x280
4,1118,681789162,-; ? find_bug+0x296/0x300
4,1119,681789176,-; ? do_exit+0x12a/0x3140
4,1120,681789184,-; report_bug+0x1ac/0x280
4,1121,681789191,-; fixup_bug+0x55/0xb0
4,1122,681789202,-; do_error_trap+0xc7/0x2a0
4,1123,681789210,-; ? fixup_bug+0xb0/0xb0
4,1124,681789218,-; ? wb_workfn+0xa56/0xfd0
4,1125,681789228,-; ? wb_workfn+0xa56/0xfd0
4,1126,681789238,-; do_invalid_op+0x28/0x40
4,1127,681789243,-; invalid_op+0x58/0x80
4,1128,681789251,-;RIP: 0010:do_exit+0x12a/0x3140
4,1129,681789261,-;RSP: 0018:ffff8806b86afde0 EFLAGS: 00010202
4,1130,681789282,-;RAX: ffff8806f079c980 RBX: 000000000000000b RCX:
ffffffff923dad02
4,1131,681789298,-;RDX: 0000000000000000 RSI: 0000000000000000 RDI:
ffff8806f079d528
4,1132,681789311,-;RBP: ffff8806b86aff48 R08: 0000000000000000 R09:
ffffffff95beb528
4,1133,681789326,-;R10: ffffed00d70d5e27 R11: ffffffff973cc252 R12:
ffff8806b86afbc0
4,1134,681789343,-;R13: ffff8806b86afbd0 R14: ffff8806f079c980 R15:
0000000000000000
4,1135,681789350,-; ? do_exit+0x122/0x3140
4,1136,681789359,-; ? mm_update_next_owner+0x900/0x900
4,1137,681789371,-; ? __sched_text_start+0x8/0x8
4,1138,681789383,-; ? __wake_up_common+0x13a/0x510
4,1139,681789390,-; ? kthread+0x38e/0x460
4,1140,681789398,-; rewind_stack_do_exit+0x17/0x20
3,1141,681789401,-;
3,1142,681789410,-;The buggy address belongs to the page:
0,1143,681789431,-;page:ffffea001ae1abc0 count:0 mapcount:0 mapping:         
(null) index:0x0
0,1144,681789441,-;flags: 0x17ffffc0000000()
1,1145,681789455,-;raw: 0017ffffc0000000 0000000000000000 0000000000000000
00000000ffffffff
1,1146,681789475,-;raw: 0000000000000000 dead000000000200 0000000000000000
0000000000000000
1,1147,681789487,-;page dumped because: kasan: bad access detected
3,1148,681789490,-;
3,1149,681789500,-;Memory state around the buggy address:
3,1150,681789517,-; ffff8806b86af500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00
3,1151,681789537,-; ffff8806b86af580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 f2
3,1152,681789553,-;>ffff8806b86af600: f2 f2 f2 f2 f2 00 f2 f2 f2 f2 f2 f2 f2 00
00 00
3,1153,681789561,-;                                     ^
3,1154,681789576,-; ffff8806b86af680: 00 00 f1 f1 f1 f1 00 00 00 00 00 00 00 f3
f3 f3
3,1155,681789594,-; ffff8806b86af700: f3 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00
3,1156,681789609,-;==================================================================
0,1157,760464251,-;kasan: CONFIG_KASAN_INLINE enabled
0,1158,760464274,-;kasan: GPF could be caused by NULL-ptr deref or user memory
access
4,1159,760464307,-;general protection fault: 0000 [#2] SMP KASAN PTI
4,1160,760464326,-;Modules linked in: f2fs rfcomm bnep nls_iso8859_1 arc4
iwlmvm intel_rapl x86_pkg_temp_thermal mac80211 intel_powerclamp coretemp
snd_hda_codec_hdmi kvm_intel snd_hda_codec_realtek snd_hda_codec_generic
snd_hda_intel kvm snd_hda_codec uvcvideo iwlwifi snd_hda_core irqbypass
videobuf2_vmalloc snd_hwdep crct10dif_pclmul videobuf2_memops thinkpad_acpi
crc32_pclmul snd_pcm videobuf2_v4l2 videobuf2_core nvram ghash_clmulni_intel
cfg80211 videodev snd_seq_midi pcbc btusb media btrtl btbcm aesni_intel btintel
snd_seq_midi_event aes_x86_64 bluetooth crypto_simd snd_rawmidi glue_helper
cryptd snd_seq snd_seq_device intel_cstate snd_timer input_leds joydev
intel_rapl_perf mei_me serio_raw ecdh_generic intel_wmi_thunderbolt wmi_bmof
snd mei mac_hid soundcore shpchp intel_pch_thermal acpi_pad parport_pc
4,1161,760464820,c; ppdev lp parport autofs4 btrfs xor zstd_compress raid6_pq
nouveau i915 mxm_wmi ttm i2c_algo_bit drm_kms_helper e1000e syscopyarea
sysfillrect sysimgblt fb_sys_fops ptp drm psmouse ahci pps_core libahci wmi
video hid_generic usbhid hid
4,1162,760465042,-;CPU: 5 PID: 2752 Comm: f2fs_gc-7:1 Tainted: G    B D W      
 4.15.7 #1
4,1163,760465071,-;Hardware name: LENOVO 20J6A00NHH/20J6A00NHH, BIOS R0FET24W
(1.04 ) 12/21/2016
4,1164,760465109,-;RIP: 0010:mempool_alloc+0x116/0x3c0
4,1165,760465135,-;RSP: 0018:ffff8806cbb57530 EFLAGS: 00010293
4,1166,760465169,-;RAX: dffffc0000000004 RBX: 1ffff100d976aead RCX:
ffffffff928720af
4,1167,760465198,-;RDX: 0000000000000000 RSI: 0000000001408800 RDI:
0000000000000000
4,1168,760465227,-;RBP: ffff8806cbb57610 R08: 0000000000000001 R09:
0000000000000001
4,1169,760465256,-;R10: 0000000000000002 R11: 0000000009fad99f R12:
0000000000000000
4,1170,760465285,-;R13: dffffc0000000000 R14: ffff8806c8f4f050 R15:
0000000000000020
4,1171,760465319,-;FS:  0000000000000000(0000) GS:ffff8807e7740000(0000)
knlGS:0000000000000000
4,1172,760465348,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,1173,760465372,-;CR2: 00007fbf332e9000 CR3: 000000039680e006 CR4:
00000000003606e0
4,1174,760465389,-;Call Trace:
4,1175,760465432,-; ? remove_element.isra.4+0x210/0x210
4,1176,760465477,-; ? radix_tree_next_chunk+0x72d/0xab0
4,1177,760465517,-; ? mem_cgroup_uncharge+0x160/0x160
4,1178,760465583,-; __submit_bio+0x498/0xa50 [f2fs]
4,1179,760465649,-; __submit_merged_bio+0x1bb/0x760 [f2fs]
4,1180,760465714,-; __submit_merged_write_cond+0x21f/0x740 [f2fs]
4,1181,760465753,-; ? put_pages_list+0x370/0x370
4,1182,760465817,-; f2fs_submit_merged_write+0x36/0x50 [f2fs]
4,1183,760465877,-; sync_node_pages+0x507/0x1750 [f2fs]
4,1184,760465936,-; ? f2fs_write_node_page+0x50/0x50 [f2fs]
4,1185,760465980,-; ? map_id_up+0x215/0x3e0
4,1186,760466046,-; ? fsync_node_pages+0x14e0/0x14e0 [f2fs]
4,1187,760466084,-; ? pagecache_get_page+0x228/0x620
4,1188,760466145,-; ? f2fs_set_node_page_dirty+0x129/0x430 [f2fs]
4,1189,760466206,-; ? clear_node_page_dirty+0x410/0x410 [f2fs]
4,1190,760466266,-; ? update_inode+0x181f/0x1f80 [f2fs]
4,1191,760466334,-; ? f2fs_sync_inode_meta+0x316/0x3c0 [f2fs]
4,1192,760466372,-; ? _cond_resched+0x2c/0xb0
4,1193,760466434,-; block_operations+0x35e/0x8a0 [f2fs]
4,1194,760466495,-; ? f2fs_sync_inode_meta+0x3c0/0x3c0 [f2fs]
4,1195,760466561,-; ? f2fs_write_data_pages+0x9b/0xc0 [f2fs]
4,1196,760466619,-; ? f2fs_write_data_pages+0x9b/0xc0 [f2fs]
4,1197,760466652,-; ? wbc_detach_inode+0x510/0x700
4,1198,760466714,-; write_checkpoint+0x252/0x4ec0 [f2fs]
4,1199,760466774,-; ? write_checkpoint+0x252/0x4ec0 [f2fs]
4,1200,760466817,-; ? __filemap_fdatawrite_range+0x1cf/0x3c0
4,1201,760466859,-; ? delete_from_page_cache_batch+0xb20/0xb20
4,1202,760466904,-; ? blk_flush_plug_list+0x85a/0xc20
4,1203,760466968,-; f2fs_sync_fs+0x285/0x460 [f2fs]
4,1204,760467031,-; ? trace_event_raw_event_f2fs__page+0x710/0x710 [f2fs]
4,1205,760467096,-; f2fs_balance_fs_bg+0x3d6/0x8f0 [f2fs]
4,1206,760467160,-; ? drop_inmem_page+0x7e0/0x7e0 [f2fs]
4,1207,760467199,-; ? __clear_rsb+0x25/0x3d
4,1208,760467241,-; ? compat_start_thread+0x90/0x90
4,1209,760467305,-; gc_thread_func+0xa09/0x13b0 [f2fs]
4,1210,760467364,-; ? gc_thread_func+0xa09/0x13b0 [f2fs]
4,1211,760467429,-; ? f2fs_gc+0x2c70/0x2c70 [f2fs]
4,1212,760467460,-; ? __wake_up_common+0x13a/0x510
4,1213,760467501,-; ? woken_wake_function+0x80/0x80
4,1214,760467547,-; ? __kthread_parkme+0x127/0x1c0
4,1215,760467587,-; kthread+0x38e/0x460
4,1216,760467646,-; ? f2fs_gc+0x2c70/0x2c70 [f2fs]
4,1217,760467686,-; ? kthread_create_worker+0x100/0x100
4,1218,760467728,-; ret_from_fork+0x35/0x40
4,1219,760467755,-;Code: 89 85 40 ff ff ff 48 8d 85 78 ff ff ff 48 89 85 30 ff
ff ff 48 83 c0 18 48 89 85 28 ff ff ff e8 c1 36 e1 ff 48 8b 85 40 ff ff ff <80>
38 00 0f 85 68 02 00 00 48 8b 85 48 ff ff ff 4d 8b 74 24 20 
1,1220,760468310,-;RIP: mempool_alloc+0x116/0x3c0 RSP: ffff8806cbb57530
4,1221,760468352,-;---[ end trace 9dc3ab78fda1ade1 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
