Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A276B5EE9D0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Sep 2022 01:01:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odg3g-0000zs-8V;
	Wed, 28 Sep 2022 23:01:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1odg3f-0000zm-O7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 23:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xDjrJEy4PV/WG6MvQmYy917H1buBxbYg09+dEde1FUo=; b=HvMENfqkpfMs4cjZHpLbbQl6w7
 5FT3ro7/ZcRzfVy/3WfTm+MoSutuOphK9DQUALoQIxUksSbJp7QBQgmNiZht9b+Oh3/Y+EoRwOOcn
 A4Be3cYhSJsHDicKJaLGqiinMncPN1bUOaitsBZGzDLojQzqQHvKqCTjNuK/n9L5QDLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xDjrJEy4PV/WG6MvQmYy917H1buBxbYg09+dEde1FUo=; b=n
 ROTCrjxbb5s4wBbBxYekfeb/dyGh6rzqx+V4BCxjp0uFm8P6PzE4m/vbO84MPs0bRvqABscdFk0Wp
 /zbw+JFbWTxm7/SbH4cB72dhoCcYkzFSjFEZmoT1NHsw3Qy88NdmLNG5UL2gvhUdmizlfK1pF39vf
 KdhnPxBreisUpqMI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odg3q-005zeY-C1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 23:01:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F6B861F7F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Sep 2022 23:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3C33C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Sep 2022 23:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664406102;
 bh=IbYymPsc3s3On/5qkpytYFSjBFXIVpbfGp6tWSGozjY=;
 h=From:To:Subject:Date:From;
 b=toLQVX08YmfE98Y8kGR3zYYwDViObQmF0cWqUYuFzq8W/hfzOcnKDo7iAM8Mixp2k
 t8/JGp3PLC+Viv5xB7us5dZbrHEV440l0qrPaOVnUEYWPZ/ovwKgmtvH7RTYrN/9Sj
 0aql0RM6v5QjMlp3rOQ9PlL9Bno5sXUWqiSmo1mGsPxHbGZPtBoVLn6cQLMmsQmSv+
 v8gKZOk8Gd/xdijOXU+Xuk6pcp32SmDnWBLZgPM/3WeKyvZsPLX23tIlR8uEQTeSvQ
 f/crWa88tG8h+XC7pbVq0qD0617t85xTDe6Diua8ghBfl4vlyt/62nu3055/o6IXq4
 872+3XBAU2+Xw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9D993C433E4; Wed, 28 Sep 2022 23:01:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 28 Sep 2022 23:01:42 +0000
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
Message-ID: <bug-216542-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -4.9 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216542 Bug ID:
 216542 Summary: KASAN: slab-out-of-bounds in fs/f2fs/segment.c:reset_curseg()
 when mount and operate on crafted image Product: File System Version: 2.5
 Kernel Version: 5.15.71, 6.0-rc7 Hardwa [...] 
 Content analysis details:   (-4.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 HEXHASH_WORD           Multiple instances of word + hexadecimal hash
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1odg3q-005zeY-C1
Subject: [f2fs-dev] [Bug 216542] New: KASAN: slab-out-of-bounds in
 fs/f2fs/segment.c:reset_curseg() when mount and operate on crafted image
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

https://bugzilla.kernel.org/show_bug.cgi?id=216542

            Bug ID: 216542
           Summary: KASAN: slab-out-of-bounds in
                    fs/f2fs/segment.c:reset_curseg() when mount and
                    operate on crafted image
           Product: File System
           Version: 2.5
    Kernel Version: 5.15.71, 6.0-rc7
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

Created attachment 301893
  --> https://bugzilla.kernel.org/attachment.cgi?id=301893&action=edit
poc and .config

- Overview 
KASAN: slab-out-of-bounds in fs/f2fs/segment.c:reset_curseg() when mount and
operate on crafted image

- Reproduce 
Tested on kernel 5.15.71, 6.0-rc7

# mkdir test_crash
# cd test_crash 
# unzip f2fs_8.zip
# mkdir mnt
# ./single_test.sh f2fs 8

-Kernel dump
[  106.444489]  </TASK>
[  106.444665] F2FS-fs (loop5): Inconsistent error blkaddr:5120, sit bitmap:0
[  106.444869] CPU: 0 PID: 1092 Comm: tmp8 Not tainted 6.0.0-rc7 #1
[  106.444872] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.15.0-1 04/01/2014
[  106.444874] Call Trace:
[  106.444875]  <TASK>
[  106.444877]  dump_stack_lvl+0x45/0x5e
[  106.444883]  f2fs_is_valid_blkaddr.cold+0x93/0x192 [f2fs]
[  106.444922]  __write_node_page+0x605/0x1690 [f2fs]
[  106.444947]  ? xas_find_marked+0x3ea/0xb50
[  106.444951]  ? read_node_page+0x630/0x630 [f2fs]
[  106.444974]  ? percpu_counter_add_batch+0x79/0x130
[  106.444978]  ? folio_clear_dirty_for_io+0x174/0x4b0
[  106.444982]  f2fs_sync_node_pages+0xefa/0x1700 [f2fs]
[  106.445006]  ? f2fs_flush_inline_data+0x9a0/0x9a0 [f2fs]
[  106.445027]  ? f2fs_fsync_node_pages+0x1540/0x15d0 [f2fs]
[  106.445049]  ? mempool_alloc+0x102/0x2e0
[  106.445051]  ? stack_trace_save+0x91/0xd0
[  106.445055]  ? __stack_depot_save+0x34/0x540
[  106.445058]  ? down_write+0xad/0x120
[  106.445063]  ? down_write_killable+0x130/0x130
[  106.445066]  ? f2fs_do_sync_file+0xf91/0x1af0 [f2fs]
[  106.445089]  ? f2fs_do_sync_file+0xf91/0x1af0 [f2fs]
[  106.445112]  block_operations+0x537/0xae0 [f2fs]
[  106.445139]  ? f2fs_sync_inode_meta+0x280/0x280 [f2fs]
[  106.445163]  ? unwind_next_frame+0x11ee/0x1ba0
[  106.445169]  ? down_write_killable+0x130/0x130
[  106.445173]  ? is_bpf_text_address+0x1f/0x30
[  106.445177]  ? kernel_text_address+0xca/0xd0
[  106.445181]  f2fs_write_checkpoint+0x408/0x4c80 [f2fs]
[  106.445204]  ? arch_stack_walk+0x9e/0xf0
[  106.445209]  ? stack_trace_save+0x91/0xd0
[  106.445213]  f2fs_gc+0x1c27/0x3300 [f2fs]
[  106.445237]  ? f2fs_start_bidx_of_node+0x20/0x20 [f2fs]
[  106.445261]  ? bio_add_page+0x111/0x170
[  106.445265]  ? _raw_spin_lock_irqsave+0xf0/0xf0
[  106.445268]  ? __bio_alloc+0x3b0/0x680 [f2fs]
[  106.445290]  ? down_write+0xad/0x120
[  106.445294]  ? down_write_killable+0x130/0x130
[  106.445297]  ? f2fs_balance_fs+0x8d9/0x1490 [f2fs]
[  106.445330]  f2fs_balance_fs+0x8d9/0x1490 [f2fs]
[  106.445358]  ? f2fs_balance_fs_bg+0xce0/0xce0 [f2fs]
[  106.445380]  ? __lookup_nat_cache+0x21/0x260 [f2fs]
[  106.445405]  ? set_node_addr+0x319/0xc60 [f2fs]
[  106.445428]  __write_node_page+0x10a8/0x1690 [f2fs]
[  106.445455]  ? read_node_page+0x630/0x630 [f2fs]
[  106.445478]  ? percpu_counter_add_batch+0x79/0x130
[  106.445483]  ? folio_clear_dirty_for_io+0x174/0x4b0
[  106.445486]  f2fs_fsync_node_pages+0x6f5/0x15d0 [f2fs]
[  106.445512]  ? f2fs_move_node_page+0x3d0/0x3d0 [f2fs]
[  106.445538]  ? __get_node_page+0x166/0xc00 [f2fs]
[  106.445560]  ? f2fs_update_inode_page+0x15d/0x5d0 [f2fs]
[  106.445581]  ? f2fs_write_inode+0x194/0xce0 [f2fs]
[  106.445602]  ? __mark_inode_dirty+0x3f2/0x880
[  106.445605]  f2fs_do_sync_file+0xf92/0x1af0 [f2fs]
[  106.445625]  ? redirty_blocks+0x860/0x860 [f2fs]
[  106.445647]  ? __fget_light+0x57/0x510
[  106.445651]  ? __ia32_sys_read+0xb0/0xb0
[  106.445655]  do_fsync+0x38/0x70
[  106.445659]  __x64_sys_fdatasync+0x32/0x50
[  106.445661]  do_syscall_64+0x38/0x90
[  106.445665]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  106.445668] RIP: 0033:0x7f6dbd57173d
[  106.445672] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 23 37 0d 00 f7 d8 64 89 01 48
[  106.445675] RSP: 002b:00007ffe44b6b2f8 EFLAGS: 00000213 ORIG_RAX:
000000000000004b
[  106.445678] RAX: ffffffffffffffda RBX: 000055eb4be6a420 RCX:
00007f6dbd57173d
[  106.445680] RDX: 00007f6dbd57173d RSI: 0000000000000320 RDI:
0000000000000004
[  106.445681] RBP: 00007ffe44b70320 R08: 00007ffe44b70418 R09:
00007ffe44b70418
[  106.445683] R10: 00007ffe44b70418 R11: 0000000000000213 R12:
000055eb4be690a0
[  106.445685] R13: 00007ffe44b70410 R14: 0000000000000000 R15:
0000000000000000
[  106.445687]  </TASK>
[  106.445964] ------------[ cut here ]------------
[  106.445967] WARNING: CPU: 0 PID: 1092 at fs/f2fs/segment.c:2447
new_curseg+0xaff/0x1710 [f2fs]
[  106.446009] Modules linked in: f2fs crc32_generic joydev input_leds
serio_raw qemu_fw_cfg xfs autofs4 raid10 raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx raid1 raid0 multipath linear qxl drm_ttm_helper ttm
hid_generic usbhid crct10dif_pclmul hid crc32_pclmul drm_kms_helper
ghash_clmulni_intel aesni_intel syscopyarea sysfillrect sysimgblt fb_sys_fops
crypto_simd drm cryptd psmouse
[  106.446056] CPU: 0 PID: 1092 Comm: tmp8 Not tainted 6.0.0-rc7 #1
[  106.446059] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.15.0-1 04/01/2014
[  106.446061] RIP: 0010:new_curseg+0xaff/0x1710 [f2fs]
[  106.446086] Code: cc cc 4c 89 c7 e8 c1 11 b6 d2 0f b6 55 00 89 c1 38 14 24
7c 08 84 d2 0f 85 4b 09 00 00 41 3b 87 8c 04 00 00 72 1e 89 4c 24 70 <0f> 0b be
08 00 00 00 49 8d 7f 48 e8 91 cb 08 d2 f0 41 80 4f 48 04
[  106.446088] RSP: 0018:ffffc90000aff690 EFLAGS: 00010246
[  106.446090] RAX: 0000000000000018 RBX: 0000000000000000 RCX:
0000000000000018
[  106.446092] RDX: 0000000000000000 RSI: 0000000000000018 RDI:
ffff888103184378
[  106.446094] RBP: ffffed1029834c91 R08: ffff888103184370 R09:
0000000000000000
[  106.446096] R10: 0000000000000003 R11: 0000000000000000 R12:
0000000000000000
[  106.446097] R13: ffff88811ce306c0 R14: dffffc0000000000 R15:
ffff88814c1a6000
[  106.446099] FS:  00007f6dbd64c540(0000) GS:ffff88828e400000(0000)
knlGS:0000000000000000
[  106.446101] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  106.446103] CR2: 00007fbbd8004018 CR3: 0000000120048002 CR4:
0000000000370ef0
[  106.446108] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  106.446109] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  106.446111] Call Trace:
[  106.446113]  <TASK>
[  106.446116]  allocate_segment_by_default+0x2ce/0x460 [f2fs]
[  106.446139]  f2fs_allocate_data_block+0x1483/0x3680 [f2fs]
[  106.446163]  ? __mod_memcg_lruvec_state+0x114/0x260
[  106.446169]  do_write_page+0x1a1/0x710 [f2fs]
[  106.446191]  ? folio_account_redirty+0x470/0x470
[  106.446195]  f2fs_do_write_node_page+0x7a/0x110 [f2fs]
[  106.446217]  ? f2fs_do_write_meta_page+0x5d0/0x5d0 [f2fs]
[  106.446238]  ? kmem_cache_alloc+0x13b/0x4e0
[  106.446244]  __write_node_page+0x6d3/0x1690 [f2fs]
[  106.446267]  ? read_node_page+0x630/0x630 [f2fs]
[  106.446291]  ? percpu_counter_add_batch+0x79/0x130
[  106.446297]  ? folio_clear_dirty_for_io+0x174/0x4b0
[  106.446301]  f2fs_fsync_node_pages+0x6f5/0x15d0 [f2fs]
[  106.446325]  ? f2fs_move_node_page+0x3d0/0x3d0 [f2fs]
[  106.446349]  ? __get_node_page+0x166/0xc00 [f2fs]
[  106.446374]  ? f2fs_update_inode_page+0x15d/0x5d0 [f2fs]
[  106.446397]  ? f2fs_write_inode+0x194/0xce0 [f2fs]
[  106.446417]  ? __mark_inode_dirty+0x3f2/0x880
[  106.446422]  f2fs_do_sync_file+0xf92/0x1af0 [f2fs]
[  106.446454]  ? redirty_blocks+0x860/0x860 [f2fs]
[  106.446497]  ? __fget_light+0x57/0x510
[  106.446500]  ? __ia32_sys_read+0xb0/0xb0
[  106.446505]  do_fsync+0x38/0x70
[  106.446509]  __x64_sys_fdatasync+0x32/0x50
[  106.446511]  do_syscall_64+0x38/0x90
[  106.446516]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  106.446521] RIP: 0033:0x7f6dbd57173d
[  106.446523] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 23 37 0d 00 f7 d8 64 89 01 48
[  106.446525] RSP: 002b:00007ffe44b6b2f8 EFLAGS: 00000213 ORIG_RAX:
000000000000004b
[  106.446528] RAX: ffffffffffffffda RBX: 000055eb4be6a420 RCX:
00007f6dbd57173d
[  106.446530] RDX: 00007f6dbd57173d RSI: 0000000000000320 RDI:
0000000000000004
[  106.446531] RBP: 00007ffe44b70320 R08: 00007ffe44b70418 R09:
00007ffe44b70418
[  106.446533] R10: 00007ffe44b70418 R11: 0000000000000213 R12:
000055eb4be690a0
[  106.446535] R13: 00007ffe44b70410 R14: 0000000000000000 R15:
0000000000000000
[  106.446538]  </TASK>
[  106.446543] ---[ end trace 0000000000000000 ]---
[  106.446643] ------------[ cut here ]------------
[  106.446644] WARNING: CPU: 0 PID: 1092 at fs/f2fs/segment.c:2501
new_curseg+0x1093/0x1710 [f2fs]
[  106.446682] Modules linked in: f2fs crc32_generic joydev input_leds
serio_raw qemu_fw_cfg xfs autofs4 raid10 raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx raid1 raid0 multipath linear qxl drm_ttm_helper ttm
hid_generic usbhid crct10dif_pclmul hid crc32_pclmul drm_kms_helper
ghash_clmulni_intel aesni_intel syscopyarea sysfillrect sysimgblt fb_sys_fops
crypto_simd drm cryptd psmouse
[  106.446724] CPU: 0 PID: 1092 Comm: tmp8 Tainted: G        W         
6.0.0-rc7 #1
[  106.446727] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.15.0-1 04/01/2014
[  106.446729] RIP: 0010:new_curseg+0x1093/0x1710 [f2fs]
[  106.446757] Code: d2 89 c6 f7 f1 89 f5 89 44 24 64 e9 02 f3 ff ff 0f 0b be
08 00 00 00 48 8d 7b 48 e8 17 c6 08 d2 f0 80 4b 48 04 e9 4d f1 ff ff <0f> 0b 48
89 df e8 93 7e fe ff e9 e7 f7 ff ff 48 89 f7 e8 c6 c2 08
[  106.446759] RSP: 0018:ffffc90000aff690 EFLAGS: 00010247
[  106.446762] RAX: 0000000000000001 RBX: ffff88814c1a6000 RCX:
ffffffffc1025e8e
[  106.446764] RDX: 0000000000000000 RSI: 0000000000000008 RDI:
ffff8881031847d0
[  106.446765] RBP: ffff8881031847d0 R08: 0000000000000001 R09:
ffffed10206308fb
[  106.446767] R10: ffff8881031847d7 R11: ffffed10206308fa R12:
ffff888139c149e0
[  106.446769] R13: ffff88811ce306c0 R14: 0000000000000018 R15:
0000000000000018
[  106.446771] FS:  00007f6dbd64c540(0000) GS:ffff88828e400000(0000)
knlGS:0000000000000000
[  106.446773] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  106.446775] CR2: 00007fbbd8004018 CR3: 0000000120048002 CR4:
0000000000370ef0
[  106.446779] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  106.446781] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  106.446782] Call Trace:
[  106.446784]  <TASK>
[  106.446787]  allocate_segment_by_default+0x2ce/0x460 [f2fs]
[  106.446821]  f2fs_allocate_data_block+0x1483/0x3680 [f2fs]
[  106.446850]  ? __mod_memcg_lruvec_state+0x114/0x260
[  106.446857]  do_write_page+0x1a1/0x710 [f2fs]
[  106.446879]  ? folio_account_redirty+0x470/0x470
[  106.446884]  f2fs_do_write_node_page+0x7a/0x110 [f2fs]
[  106.446906]  ? f2fs_do_write_meta_page+0x5d0/0x5d0 [f2fs]
[  106.446929]  ? kmem_cache_alloc+0x13b/0x4e0
[  106.446935]  __write_node_page+0x6d3/0x1690 [f2fs]
[  106.446958]  ? read_node_page+0x630/0x630 [f2fs]
[  106.446988]  ? percpu_counter_add_batch+0x79/0x130
[  106.446992]  ? folio_clear_dirty_for_io+0x174/0x4b0
[  106.446995]  f2fs_fsync_node_pages+0x6f5/0x15d0 [f2fs]
[  106.447024]  ? f2fs_move_node_page+0x3d0/0x3d0 [f2fs]
[  106.447049]  ? __get_node_page+0x166/0xc00 [f2fs]
[  106.447072]  ? f2fs_update_inode_page+0x15d/0x5d0 [f2fs]
[  106.447093]  ? f2fs_write_inode+0x194/0xce0 [f2fs]
[  106.447116]  ? __mark_inode_dirty+0x3f2/0x880
[  106.447119]  f2fs_do_sync_file+0xf92/0x1af0 [f2fs]
[  106.447138]  ? redirty_blocks+0x860/0x860 [f2fs]
[  106.447163]  ? __fget_light+0x57/0x510
[  106.447166]  ? __ia32_sys_read+0xb0/0xb0
[  106.447170]  do_fsync+0x38/0x70
[  106.447173]  __x64_sys_fdatasync+0x32/0x50
[  106.447175]  do_syscall_64+0x38/0x90
[  106.447179]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  106.447182] RIP: 0033:0x7f6dbd57173d
[  106.447184] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 23 37 0d 00 f7 d8 64 89 01 48
[  106.447186] RSP: 002b:00007ffe44b6b2f8 EFLAGS: 00000213 ORIG_RAX:
000000000000004b
[  106.447189] RAX: ffffffffffffffda RBX: 000055eb4be6a420 RCX:
00007f6dbd57173d
[  106.447190] RDX: 00007f6dbd57173d RSI: 0000000000000320 RDI:
0000000000000004
[  106.447192] RBP: 00007ffe44b70320 R08: 00007ffe44b70418 R09:
00007ffe44b70418
[  106.447194] R10: 00007ffe44b70418 R11: 0000000000000213 R12:
000055eb4be690a0
[  106.447196] R13: 00007ffe44b70410 R14: 0000000000000000 R15:
0000000000000000
[  106.447198]  </TASK>
[  106.447199] ---[ end trace 0000000000000000 ]---
[  106.447203]
==================================================================
[  106.447496] BUG: KASAN: slab-out-of-bounds in reset_curseg+0x498/0x4c0
[f2fs]
[  106.447705] Write of size 4 at addr ffff888139c11bc0 by task tmp8/1092

[  106.448100] CPU: 0 PID: 1092 Comm: tmp8 Tainted: G        W         
6.0.0-rc7 #1
[  106.448338] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.15.0-1 04/01/2014
[  106.448599] Call Trace:
[  106.448855]  <TASK>
[  106.449129]  dump_stack_lvl+0x45/0x5e
[  106.449410]  print_report.cold+0xf3/0x68d
[  106.449738]  ? reset_curseg+0x498/0x4c0 [f2fs]
[  106.450130]  kasan_report+0xa8/0x130
[  106.450423]  ? reset_curseg+0x498/0x4c0 [f2fs]
[  106.450836]  reset_curseg+0x498/0x4c0 [f2fs]
[  106.451196]  new_curseg+0xa5b/0x1710 [f2fs]
[  106.451552]  allocate_segment_by_default+0x2ce/0x460 [f2fs]
[  106.451968]  f2fs_allocate_data_block+0x1483/0x3680 [f2fs]
[  106.452429]  ? __mod_memcg_lruvec_state+0x114/0x260
[  106.452797]  do_write_page+0x1a1/0x710 [f2fs]
[  106.453212]  ? folio_account_redirty+0x470/0x470
[  106.453608]  f2fs_do_write_node_page+0x7a/0x110 [f2fs]
[  106.454030]  ? f2fs_do_write_meta_page+0x5d0/0x5d0 [f2fs]
[  106.454466]  ? kmem_cache_alloc+0x13b/0x4e0
[  106.454944]  __write_node_page+0x6d3/0x1690 [f2fs]
[  106.455422]  ? read_node_page+0x630/0x630 [f2fs]
[  106.455900]  ? percpu_counter_add_batch+0x79/0x130
[  106.456361]  ? folio_clear_dirty_for_io+0x174/0x4b0
[  106.456840]  f2fs_fsync_node_pages+0x6f5/0x15d0 [f2fs]
[  106.457363]  ? f2fs_move_node_page+0x3d0/0x3d0 [f2fs]
[  106.457866]  ? __get_node_page+0x166/0xc00 [f2fs]
[  106.458375]  ? f2fs_update_inode_page+0x15d/0x5d0 [f2fs]
[  106.458942]  ? f2fs_write_inode+0x194/0xce0 [f2fs]
[  106.459472]  ? __mark_inode_dirty+0x3f2/0x880
[  106.459996]  f2fs_do_sync_file+0xf92/0x1af0 [f2fs]
[  106.460549]  ? redirty_blocks+0x860/0x860 [f2fs]
[  106.461114]  ? __fget_light+0x57/0x510
[  106.461668]  ? __ia32_sys_read+0xb0/0xb0
[  106.462230]  do_fsync+0x38/0x70
[  106.462842]  __x64_sys_fdatasync+0x32/0x50
[  106.463420]  do_syscall_64+0x38/0x90
[  106.464006]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  106.464643] RIP: 0033:0x7f6dbd57173d
[  106.465395] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 23 37 0d 00 f7 d8 64 89 01 48
[  106.467076] RSP: 002b:00007ffe44b6b2f8 EFLAGS: 00000213 ORIG_RAX:
000000000000004b
[  106.467828] RAX: ffffffffffffffda RBX: 000055eb4be6a420 RCX:
00007f6dbd57173d
[  106.468651] RDX: 00007f6dbd57173d RSI: 0000000000000320 RDI:
0000000000000004
[  106.469547] RBP: 00007ffe44b70320 R08: 00007ffe44b70418 R09:
00007ffe44b70418
[  106.470398] R10: 00007ffe44b70418 R11: 0000000000000213 R12:
000055eb4be690a0
[  106.471261] R13: 00007ffe44b70410 R14: 0000000000000000 R15:
0000000000000000
[  106.472060]  </TASK>

[  106.473684] Allocated by task 1073:
[  106.474521]  kasan_save_stack+0x1e/0x40
[  106.474527]  __kasan_kmalloc+0xa9/0xe0
[  106.474529]  __kmalloc_node+0x19d/0x3e0
[  106.474532]  f2fs_build_segment_manager+0x9d8/0x9e30 [f2fs]
[  106.474569]  f2fs_fill_super+0x3754/0x61e0 [f2fs]
[  106.474605]  mount_bdev+0x2cf/0x3b0
[  106.474607]  legacy_get_tree+0xed/0x1d0
[  106.474610]  vfs_get_tree+0x81/0x2b0
[  106.474613]  path_mount+0x47e/0x19d0
[  106.474616]  do_mount+0xce/0xf0
[  106.474619]  __x64_sys_mount+0x12c/0x1a0
[  106.474622]  do_syscall_64+0x38/0x90
[  106.474625]  entry_SYSCALL_64_after_hwframe+0x63/0xcd

[  106.475548] The buggy address belongs to the object at ffff888139c11800
                which belongs to the cache kmalloc-1k of size 1024
[  106.477168] The buggy address is located 960 bytes inside of
                1024-byte region [ffff888139c11800, ffff888139c11c00)

[  106.479518] The buggy address belongs to the physical page:
[  106.480524] page:000000008e583202 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x139c10
[  106.480541] head:000000008e583202 order:3 compound_mapcount:0
compound_pincount:0
[  106.480543] flags:
0x17ffffc0010200(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
[  106.480548] raw: 0017ffffc0010200 dead000000000100 dead000000000122
ffff888100042dc0
[  106.480552] raw: 0000000000000000 0000000000100010 00000001ffffffff
0000000000000000
[  106.480553] page dumped because: kasan: bad access detected

[  106.481335] Memory state around the buggy address:
[  106.482122]  ffff888139c11a80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00
[  106.482867]  ffff888139c11b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00
[  106.483583] >ffff888139c11b80: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
fc
[  106.484293]                                            ^
[  106.485005]  ffff888139c11c00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
fc
[  106.485731]  ffff888139c11c80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
fc
[  106.486445]
==================================================================
[  106.487203] Disabling lock debugging due to kernel taint
[  106.487255] F2FS-fs (loop5): Inconsistent error blkaddr:5120, sit bitmap:0
[  106.487992] CPU: 0 PID: 1092 Comm: tmp8 Tainted: G    B   W         
6.0.0-rc7 #1
[  106.487996] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.15.0-1 04/01/2014
[  106.487998] Call Trace:
[  106.488000]  <TASK>
[  106.488001]  dump_stack_lvl+0x45/0x5e
[  106.488008]  f2fs_is_valid_blkaddr.cold+0x93/0x192 [f2fs]
[  106.488038]  __write_node_page+0x605/0x1690 [f2fs]
[  106.488061]  ? xas_find_marked+0x3ea/0xb50
[  106.488065]  ? read_node_page+0x630/0x630 [f2fs]
[  106.488087]  ? percpu_counter_add_batch+0x79/0x130
[  106.488090]  ? folio_clear_dirty_for_io+0x174/0x4b0
[  106.488094]  f2fs_sync_node_pages+0xefa/0x1700 [f2fs]
[  106.488116]  ? f2fs_flush_inline_data+0x9a0/0x9a0 [f2fs]
[  106.488137]  ? f2fs_fsync_node_pages+0x1540/0x15d0 [f2fs]
[  106.488156]  ? 0xffffffffc0f0d000
[  106.488160]  ? down_write+0xad/0x120
[  106.488163]  ? down_write_killable+0x130/0x130
[  106.488166]  ? f2fs_do_sync_file+0xf91/0x1af0 [f2fs]
[  106.488184]  ? f2fs_do_sync_file+0xf91/0x1af0 [f2fs]
[  106.488202]  block_operations+0x537/0xae0 [f2fs]
[  106.488223]  ? f2fs_sync_inode_meta+0x280/0x280 [f2fs]
[  106.488242]  ? unwind_next_frame+0x11ee/0x1ba0
[  106.488247]  ? down_write_killable+0x130/0x130
[  106.488250]  ? is_bpf_text_address+0x1f/0x30
[  106.488253]  ? kernel_text_address+0xca/0xd0
[  106.488257]  f2fs_write_checkpoint+0x408/0x4c80 [f2fs]
[  106.488276]  ? arch_stack_walk+0x9e/0xf0
[  106.488280]  ? stack_trace_save+0x91/0xd0
[  106.488284]  f2fs_gc+0x1c27/0x3300 [f2fs]
[  106.488306]  ? f2fs_start_bidx_of_node+0x20/0x20 [f2fs]
[  106.488325]  ? bio_add_page+0x111/0x170
[  106.488329]  ? _raw_spin_lock_irqsave+0xf0/0xf0
[  106.488331]  ? __bio_alloc+0x3b0/0x680 [f2fs]
[  106.488351]  ? down_write+0xad/0x120
[  106.488353]  ? down_write_killable+0x130/0x130
[  106.488357]  ? f2fs_balance_fs+0x8d9/0x1490 [f2fs]
[  106.488378]  f2fs_balance_fs+0x8d9/0x1490 [f2fs]
[  106.488400]  ? f2fs_balance_fs_bg+0xce0/0xce0 [f2fs]
[  106.488422]  ? __lookup_nat_cache+0x21/0x260 [f2fs]
[  106.488443]  ? set_node_addr+0x319/0xc60 [f2fs]
[  106.488464]  __write_node_page+0x10a8/0x1690 [f2fs]
[  106.488485]  ? read_node_page+0x630/0x630 [f2fs]
[  106.488506]  ? percpu_counter_add_batch+0x79/0x130
[  106.488510]  ? folio_clear_dirty_for_io+0x174/0x4b0
[  106.488513]  f2fs_fsync_node_pages+0x6f5/0x15d0 [f2fs]
[  106.488535]  ? f2fs_move_node_page+0x3d0/0x3d0 [f2fs]
[  106.488555]  ? __get_node_page+0x166/0xc00 [f2fs]
[  106.488576]  ? f2fs_update_inode_page+0x15d/0x5d0 [f2fs]
[  106.488596]  ? f2fs_write_inode+0x194/0xce0 [f2fs]
[  106.488616]  ? __mark_inode_dirty+0x3f2/0x880
[  106.488620]  f2fs_do_sync_file+0xf92/0x1af0 [f2fs]
[  106.488640]  ? redirty_blocks+0x860/0x860 [f2fs]
[  106.488659]  ? __fget_light+0x57/0x510
[  106.488662]  ? __ia32_sys_read+0xb0/0xb0
[  106.488665]  do_fsync+0x38/0x70
[  106.488668]  __x64_sys_fdatasync+0x32/0x50
[  106.488671]  do_syscall_64+0x38/0x90
[  106.488675]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  106.488678] RIP: 0033:0x7f6dbd57173d
[  106.488681] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 23 37 0d 00 f7 d8 64 89 01 48
[  106.488683] RSP: 002b:00007ffe44b6b2f8 EFLAGS: 00000213 ORIG_RAX:
000000000000004b
[  106.488687] RAX: ffffffffffffffda RBX: 000055eb4be6a420 RCX:
00007f6dbd57173d
[  106.488689] RDX: 00007f6dbd57173d RSI: 0000000000000320 RDI:
0000000000000004
[  106.488691] RBP: 00007ffe44b70320 R08: 00007ffe44b70418 R09:
00007ffe44b70418
[  106.488693] R10: 00007ffe44b70418 R11: 0000000000000213 R12:
000055eb4be690a0
[  106.488694] R13: 00007ffe44b70410 R14: 0000000000000000 R15:
0000000000000000
[  106.488697]  </TASK>
[  106.488803] general protection fault, probably for non-canonical address
0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
[  106.490373] KASAN: null-ptr-deref in range
[0x0000000000000000-0x0000000000000007]
[  106.491405] CPU: 0 PID: 1092 Comm: tmp8 Tainted: G    B   W         
6.0.0-rc7 #1
[  106.492392] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.15.0-1 04/01/2014
[  106.493382] RIP: 0010:update_sit_entry+0x34d/0x10b0 [f2fs]
[  106.494285] Code: 4c 8b 65 08 f7 d1 b8 01 00 00 00 41 c1 ea 03 83 e1 07 4d
01 d4 d3 e0 4c 89 e2 89 c1 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04
02 4c 89 e2 83 e2 07 41 83 ff 01 0f 85 53 04 00 00 38 d0
[  106.496518] RSP: 0018:ffffc90000aff730 EFLAGS: 00010246
[  106.497479] RAX: dffffc0000000000 RBX: ffff88814c1a6000 RCX:
0000000000000080
[  106.498469] RDX: 0000000000000000 RSI: 0000000000000008 RDI:
ffff888139c11bc8
[  106.499411] RBP: ffff888139c11bc0 R08: ffff8881214de000 R09:
0000000000004000
[  106.500448] R10: 0000000000000000 R11: 0000000000000001 R12:
0000000000000000
[  106.501340] R13: 0000000000000200 R14: 0000000000000018 R15:
0000000000000001
[  106.502253] FS:  00007f6dbd64c540(0000) GS:ffff88828e400000(0000)
knlGS:0000000000000000
[  106.503212] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  106.504117] CR2: 00007fbbd8004018 CR3: 0000000120048002 CR4:
0000000000370ef0
[  106.505038] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  106.505953] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  106.506865] Call Trace:
[  106.507746]  <TASK>
[  106.508599]  ? f2fs_fsync_node_pages+0x6f5/0x15d0 [f2fs]
[  106.509475]  f2fs_allocate_data_block+0x549/0x3680 [f2fs]
[  106.510343]  ? __mod_memcg_lruvec_state+0x114/0x260
[  106.511246]  do_write_page+0x1a1/0x710 [f2fs]
[  106.512110]  ? folio_account_redirty+0x470/0x470
[  106.512999]  f2fs_do_write_node_page+0x7a/0x110 [f2fs]
[  106.513907]  ? f2fs_do_write_meta_page+0x5d0/0x5d0 [f2fs]
[  106.514831]  ? kmem_cache_alloc+0x13b/0x4e0
[  106.515724]  __write_node_page+0x6d3/0x1690 [f2fs]
[  106.516640]  ? read_node_page+0x630/0x630 [f2fs]
[  106.517558]  ? percpu_counter_add_batch+0x79/0x130
[  106.518451]  ? folio_clear_dirty_for_io+0x174/0x4b0
[  106.519344]  f2fs_fsync_node_pages+0x6f5/0x15d0 [f2fs]
[  106.520249]  ? f2fs_move_node_page+0x3d0/0x3d0 [f2fs]
[  106.521150]  ? __get_node_page+0x166/0xc00 [f2fs]
[  106.522045]  ? f2fs_update_inode_page+0x15d/0x5d0 [f2fs]
[  106.522941]  ? f2fs_write_inode+0x194/0xce0 [f2fs]
[  106.523826]  ? __mark_inode_dirty+0x3f2/0x880
[  106.524694]  f2fs_do_sync_file+0xf92/0x1af0 [f2fs]
[  106.525570]  ? redirty_blocks+0x860/0x860 [f2fs]
[  106.526457]  ? __fget_light+0x57/0x510
[  106.527354]  ? __ia32_sys_read+0xb0/0xb0
[  106.528612]  do_fsync+0x38/0x70
[  106.529461]  __x64_sys_fdatasync+0x32/0x50
[  106.530321]  do_syscall_64+0x38/0x90
[  106.531176]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  106.532020] RIP: 0033:0x7f6dbd57173d
[  106.532836] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 23 37 0d 00 f7 d8 64 89 01 48
[  106.534505] RSP: 002b:00007ffe44b6b2f8 EFLAGS: 00000213 ORIG_RAX:
000000000000004b
[  106.535353] RAX: ffffffffffffffda RBX: 000055eb4be6a420 RCX:
00007f6dbd57173d
[  106.536185] RDX: 00007f6dbd57173d RSI: 0000000000000320 RDI:
0000000000000004
[  106.537008] RBP: 00007ffe44b70320 R08: 00007ffe44b70418 R09:
00007ffe44b70418
[  106.537812] R10: 00007ffe44b70418 R11: 0000000000000213 R12:
000055eb4be690a0
[  106.538599] R13: 00007ffe44b70410 R14: 0000000000000000 R15:
0000000000000000
[  106.539365]  </TASK>
[  106.540114] Modules linked in: f2fs crc32_generic joydev input_leds
serio_raw qemu_fw_cfg xfs autofs4 raid10 raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx raid1 raid0 multipath linear qxl drm_ttm_helper ttm
hid_generic usbhid crct10dif_pclmul hid crc32_pclmul drm_kms_helper
ghash_clmulni_intel aesni_intel syscopyarea sysfillrect sysimgblt fb_sys_fops
crypto_simd drm cryptd psmouse
[  106.543722] ---[ end trace 0000000000000000 ]---
[  106.544578] RIP: 0010:update_sit_entry+0x34d/0x10b0 [f2fs]
[  106.545454] Code: 4c 8b 65 08 f7 d1 b8 01 00 00 00 41 c1 ea 03 83 e1 07 4d
01 d4 d3 e0 4c 89 e2 89 c1 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04
02 4c 89 e2 83 e2 07 41 83 ff 01 0f 85 53 04 00 00 38 d0
[  106.547251] RSP: 0018:ffffc90000aff730 EFLAGS: 00010246
[  106.548159] RAX: dffffc0000000000 RBX: ffff88814c1a6000 RCX:
0000000000000080
[  106.549071] RDX: 0000000000000000 RSI: 0000000000000008 RDI:
ffff888139c11bc8
[  106.550003] RBP: ffff888139c11bc0 R08: ffff8881214de000 R09:
0000000000004000
[  106.550936] R10: 0000000000000000 R11: 0000000000000001 R12:
0000000000000000
[  106.551862] R13: 0000000000000200 R14: 0000000000000018 R15:
0000000000000001
[  106.552780] FS:  00007f6dbd64c540(0000) GS:ffff88828e400000(0000)
knlGS:0000000000000000
[  106.553717] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  106.554651] CR2: 00007fbbd8004018 CR3: 0000000120048002 CR4:
0000000000370ef0
[  106.555685] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  106.556624] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
