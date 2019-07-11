Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8130E657D0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 15:21:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlZ0Q-0007LZ-9O; Thu, 11 Jul 2019 13:21:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1hlZ0P-0007LK-AD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 13:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hXrgRDF1o646RLa9ikjiujfUjOjM1FcOLliaQIIeg0A=; b=Yyp25yED0an+w3jf6BHPpSn+nR
 WcltC8RuF/93Hs2JFKzvFdQo3S6tPIhVGRvcye+TB01aghwxGn9uBUn6NvT0pdegQz70fYrQO8+4G
 pJfFk+RC93Pma7+paIxVL6vqGjxguKUYDR22oRXwjWJmjtylMijxa2MAQ/MjNqTBTPus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hXrgRDF1o646RLa9ikjiujfUjOjM1FcOLliaQIIeg0A=; b=W
 QvM7znA2/Dq0Rakw473RBQEJfOUFQ8E7jKzGVbl1xiyKbZwHBmQcBlae1ApXqRCAx5dHWc8qId47A
 5fGKIDpkI8bhjdUWgvhoqEm4VZUaG4zFTkc8GRQTbymlkFqJHw/OehoobfRIBBL2A+s7UX80PndZ3
 Qo7z5zVSJIfDcrKY=;
Received: from mail.wl.linuxfoundation.org ([198.145.29.98])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hlZ0N-00FfSN-Js
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 13:21:01 +0000
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 6C31A2886F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jul 2019 13:20:52 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 60CA328891; Thu, 11 Jul 2019 13:20:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 11 Jul 2019 13:20:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: midwinter1993@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204137-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hlZ0N-00FfSN-Js
Subject: [f2fs-dev] [Bug 204137] New: F2FS: kernel BUG at
 fs/f2fs/segment.c:2375!
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

https://bugzilla.kernel.org/show_bug.cgi?id=204137

            Bug ID: 204137
           Summary: F2FS: kernel BUG at fs/f2fs/segment.c:2375!
           Product: File System
           Version: 2.5
    Kernel Version: 5.1.3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: midwinter1993@gmail.com
        Regression: No

The following script triggers a bug in f2fs under kernel 5.1.3

```
#!/bin/bash

DISK=bingo.img
MOUNT_DIR=/root/mnt

dd if=/dev/zero of=$DISK bs=1M count=105
mkfs.f2fs -a 1 -o 19 -t 1 -z 1 -f -q $DISK


mkdir -pv $MOUNT_DIR

mount $DISK $MOUNT_DIR -o
"noinline_dentry,flush_merge,noextent_cache,mode=lfs,io_bits=7,fsync_mode=strict"

for (( i = 0; i < 4096; i++ )); do
    name=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10`
    mkdir $MOUNT_DIR/$name
done

umount $MOUNT_DIR
```

--- Core dump ---
[   30.151113] ------------[ cut here ]------------
[   30.151670] kernel BUG at fs/f2fs/segment.c:2375!
[   30.152273] invalid opcode: 0000 [#1] SMP KASAN PTI
[   30.152914] CPU: 0 PID: 2190 Comm: runner-1 Not tainted 5.1.3 #8
[   30.153743] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   30.155075] RIP: 0010:new_curseg+0x845/0x870
[   30.155667] Code: e8 e0 88 87 ff 44 0f af ad e0 03 00 00 89 df 44 89 ee e8
fe 4e 71 ff 44 39 eb 0f 83 89 fa ff ff e9 13 fd ff ff e8 fb 4d 71 ff <0f> 0b e8
f4 4d 71 ff 44 89 e0 31 d2 41 f7 f7 89 04 24 e9 b8 f9 ff
[   30.158171] RSP: 0018:ffff88810bb7ed68 EFLAGS: 00010293
[   30.158889] RAX: ffff888108911980 RBX: 000000000000002c RCX:
ffffffff8c0fd7b5
[   30.159850] RDX: 0000000000000000 RSI: 000000000000002c RDI:
0000000000000004
[   30.160812] RBP: ffff88810bd92a80 R08: ffff888108911980 R09:
ffffed102176fda3
[   30.161777] R10: ffffed102176fda2 R11: 0000000000000003 R12:
000000000000002c
[   30.162746] R13: 000000000000002c R14: 0000000000000000 R15:
000000000000002c
[   30.163703] FS:  00000000029c08c0(0000) GS:ffff88811b400000(0000)
knlGS:0000000000000000
[   30.164785] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   30.165563] CR2: 0000000002d25068 CR3: 000000010a5ce000 CR4:
00000000000006f0
[   30.166535] Call Trace:
[   30.166888]  allocate_segment_by_default+0x23a/0x720
[   30.167570]  ? f2fs_is_valid_blkaddr+0x9d/0x460
[   30.168191]  ? new_curseg+0x870/0x870
[   30.168702]  ? ktime_get_real_seconds+0x5/0x10
[   30.169311]  ? update_sit_entry+0x570/0x9b0
[   30.169888]  f2fs_allocate_data_block+0x446/0xf50
[   30.170539]  do_write_page+0x1d1/0x360
[   30.171058]  f2fs_outplace_write_data+0xd7/0x210
[   30.171688]  ? f2fs_do_write_node_page+0x190/0x190
[   30.172340]  ? __enqueue_entity+0xae/0xe0
[   30.172894]  f2fs_do_write_data_page+0x43b/0xf30
[   30.173530]  ? f2fs_should_update_outplace+0x1c0/0x1c0
[   30.174234]  ? __switch_to_asm+0x34/0x70
[   30.174783]  ? __switch_to_asm+0x40/0x70
[   30.175323]  ? __switch_to_asm+0x34/0x70
[   30.175865]  ? finish_task_switch+0x145/0x370
[   30.176467]  ? __switch_to_asm+0x34/0x70
[   30.177006]  ? __switch_to_asm+0x40/0x70
[   30.177548]  __write_data_page+0x10e7/0x1140
[   30.178137]  ? page_mapped+0xf8/0x1f0
[   30.178651]  ? f2fs_do_write_data_page+0xf30/0xf30
[   30.179305]  ? page_referenced+0x3d0/0x3d0
[   30.179871]  f2fs_write_cache_pages+0x3ba/0xb40
[   30.180496]  ? __write_data_page+0x1140/0x1140
[   30.181104]  ? deref_stack_reg+0x20/0xd0
[   30.181645]  ? __read_once_size_nocheck.constprop.0+0x10/0x10
[   30.182398]  ? __se_sys_keyctl+0x241/0x3e0
[   30.182971]  ? _raw_spin_lock+0x75/0xd0
[   30.183501]  ? _raw_spin_lock_irq+0xd0/0xd0
[   30.184075]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   30.184774]  ? __sanitizer_cov_trace_switch+0x45/0x70
[   30.185466]  ? f2fs_remove_dirty_inode+0x2a9/0x2e0
[   30.186124]  f2fs_write_data_pages+0x796/0x8b0
[   30.186742]  ? f2fs_write_cache_pages+0xb40/0xb40
[   30.187356]  ? __kasan_slab_free+0x1ba/0x220
[   30.187946]  ? f2fs_write_cache_pages+0xb40/0xb40
[   30.188592]  do_writepages+0xbb/0x1e0
[   30.189099]  ? f2fs_mkdir+0x1ed/0x340
[   30.189607]  ? page_writeback_cpu_online+0x10/0x10
[   30.190263]  ? __f2fs_setxattr+0x15e/0xf70
[   30.190836]  ? __find_xattr+0xf0/0xf0
[   30.191348]  __filemap_fdatawrite_range+0x142/0x1d0
[   30.192032]  ? delete_from_page_cache_batch+0x650/0x650
[   30.192765]  ? _raw_spin_lock_irq+0xd0/0xd0
[   30.193348]  f2fs_sync_dirty_inodes+0x167/0x490
[   30.193974]  f2fs_write_checkpoint+0x462/0x2f70
[   30.194606]  ? __read_once_size_nocheck.constprop.0+0x10/0x10
[   30.195389]  ? lsm_ipc_alloc.isra.0+0x80/0x80
[   30.195988]  ? __orc_find+0x63/0xc0
[   30.196471]  ? unwind_next_frame+0x8a8/0x9b0
[   30.197059]  ? stack_access_ok+0x35/0x90
[   30.197597]  ? f2fs_wait_on_all_pages_writeback+0x1a0/0x1a0
[   30.198357]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   30.199078]  ? __is_insn_slot_addr+0x7e/0xa0
[   30.199661]  ? kernel_text_address+0xdc/0xf0
[   30.200245]  ? __kernel_text_address+0x9/0x30
[   30.200841]  ? unwind_get_return_address+0x2a/0x40
[   30.201495]  ? __save_stack_trace+0x8a/0xf0
[   30.202066]  f2fs_gc+0xc0b/0x1c20
[   30.202532]  ? f2fs_start_bidx_of_node+0x40/0x40
[   30.203161]  ? f2fs_add_dentry+0x17a/0x200
[   30.203720]  ? node_tag_clear.isra.0+0x5d/0x110
[   30.204338]  ? mutex_lock+0x89/0xd0
[   30.204820]  ? __mutex_lock_slowpath+0x10/0x10
[   30.205428]  ? f2fs_balance_fs+0x3fa/0xa90
[   30.205988]  f2fs_balance_fs+0x3fa/0xa90
[   30.206532]  f2fs_mkdir+0x31b/0x340
[   30.207013]  vfs_mkdir+0x23b/0x340
[   30.207483]  do_mkdirat+0x124/0x200
[   30.207965]  ? __ia32_sys_mknod+0x50/0x50
[   30.208514]  ? __do_page_fault+0x766/0xa40
[   30.209076]  do_syscall_64+0x8a/0x230
[   30.209582]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   30.210267] RIP: 0033:0x50eb67
[   30.210696] Code: 1f 40 00 b8 89 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 2d
f5 f8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 53 00 00 00 0f 05 <48> 3d 01
f0 ff ff 0f 83 0d f5 f8 ff c3 66 2e 0f 1f 84 00 00 00 00
[   30.213160] RSP: 002b:00007ffcd6d874d8 EFLAGS: 00000202 ORIG_RAX:
0000000000000053
[   30.214209] RAX: ffffffffffffffda RBX: 0000000000400328 RCX:
000000000050eb67
[   30.215173] RDX: 0000000000000094 RSI: 00000000000001fd RDI:
0000000002b39200
[   30.216142] RBP: 00007ffcd6d875c0 R08: 0000000000000000 R09:
0000000000000094
[   30.217105] R10: 000000000000000a R11: 0000000000000202 R12:
000000000049e500
[   30.218068] R13: 000000000049e590 R14: 0000000000000000 R15:
0000000000000000
[   30.219036] Modules linked in:
[   30.219462] Dumping ftrace buffer:
[   30.219928]    (ftrace buffer empty)
[   30.220458] ---[ end trace 74e918d8713b04a2 ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
