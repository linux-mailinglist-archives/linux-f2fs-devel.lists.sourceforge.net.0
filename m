Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5B5AF98F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Sep 2022 03:56:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVkJ0-0000rS-SR;
	Wed, 07 Sep 2022 01:56:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oVkIy-0000rL-VD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 01:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F7s34P/a/arqEylXoGAt9WXxipWTOhtwRx6lJBDIPxc=; b=TDdTGLrjJWe0gns5VP7CyPJrUT
 aWGUhX8jDg+nCIO31e6HKiX30v+VGJsxYAmfCmYznVc36rRhID5SRmE2IDoWNfAlqYUK4ZvDIocSz
 20x+MA6CnEv6MPTU/RytZkYs0hRGyocu49hfq4mhR3RS1s7a2xlWX77Hqky1gRnMfPTo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=F7s34P/a/arqEylXoGAt9WXxipWTOhtwRx6lJBDIPxc=; b=P
 MvKS1z6Z4Y27d2X31q2y6/qHsUciTYdtM4B4JLeS9dlo8yGUHfVJXo66h919pSiMmC0wiwtVwxr7B
 ydBfzJpAnxFUVDv5ADHVWZ42gSg7tJ7EDB4lNzAQxblnFFVpS5+EhYhoXf2YYbSNNKL/RY7dxsr3D
 JfV1CBWGG7e/kCr8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVkIw-0007nT-4E for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 01:56:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D24FB61648
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Sep 2022 01:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42437C433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Sep 2022 01:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662515787;
 bh=U5It2Cz8ndkrXP1slFmbB3s3q5H745fqOkBokN84chc=;
 h=From:To:Subject:Date:From;
 b=LbPbXzaPIDb0gho6JM4amP6/WJTj0haF/c9Ndem5A+dhbD4VjYGYJBcUodMYjTa1D
 +ub7bfgLZ6z/koq+AtAzydD6VFhONnt52PaDnqA6MM3xB6VmjMQ3ZiF5mbCM9uuF8S
 RFYPqZ1GsDoLfkLD+XocFZOQB0EZIarOWD3t2NYZt7vDz4b2RhrvkoS7TlwGlLsr52
 lAmZkkqzVzOh1EKzjp1jP8o75EFKdw5xUp7H0Fkr4o+7UtDK820Rjf2IqO4dB8w65X
 3BOukiPod4iss0z5pudIwOaYj8efBzC8qVlxT3XsSp5tILyE++RzcsE7F9H7Yc/JMB
 G4hnVnS4TEB4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 29CFBC433E4; Wed,  7 Sep 2022 01:56:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 07 Sep 2022 01:56:26 +0000
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
Message-ID: <bug-216456-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216456 Bug ID:
 216456 Summary: KASAN: use-after-free in check_index_in_prev_nodes when mount
 a crafted f2fs image Product: File System Version: 2.5 Kernel Version: 5.19.X
 - 6.0-rc4 Hardware: All OS: Linux T [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oVkIw-0007nT-4E
Subject: [f2fs-dev] [Bug 216456] New: KASAN: use-after-free in
 check_index_in_prev_nodes when mount a crafted f2fs image
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

https://bugzilla.kernel.org/show_bug.cgi?id=216456

            Bug ID: 216456
           Summary: KASAN: use-after-free in check_index_in_prev_nodes
                    when mount a crafted f2fs image
           Product: File System
           Version: 2.5
    Kernel Version: 5.19.X - 6.0-rc4
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

Created attachment 301759
  --> https://bugzilla.kernel.org/attachment.cgi?id=301759&action=edit
corrupted image and poc

- Overview 
BUG: KASAN: use-after-free in check_index_in_prev_nodes when mount a crafted
f2fs image

- Reproduce 
tested on kernel 5.19.X - 6.0-rc4, might need to unzip the file and run several
times to trigger

# mkdir mnt
# mount tmp8.img mnt

-Kernel dump
[   49.354691] loop5: detected capacity change from 0 to 131072
[   49.594237] F2FS-fs (loop5): recover_inode: ino = 6, name = hln, inline = 1
[   49.594282] F2FS-fs (loop5): recover_data: ino = 6 (i_size: recover)
recovered = 0, err = 0
[   49.594286] F2FS-fs (loop5): recover_inode: ino = 6, name = hln, inline = 1
[   49.594312] F2FS-fs (loop5): recover_data: ino = 6 (i_size: recover)
recovered = 0, err = 0
[   49.594315] F2FS-fs (loop5): recover_inode: ino = 6, name = hln, inline = 1
[   49.594402] F2FS-fs (loop5): recover_data: ino = 6 (i_size: recover)
recovered = 1, err = 0
[   49.594532] F2FS-fs (loop5): Bitmap was wrongly set, blk:5634
[   49.594595] ------------[ cut here ]------------
[   49.594597] WARNING: CPU: 3 PID: 1013 at fs/f2fs/segment.c:2198
update_sit_entry+0xa55/0x10b0 [f2fs]
[   49.594633] Modules linked in: f2fs crc32_generic input_leds joydev
serio_raw qemu_fw_cfg xfs autofs4 raid10 raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx raid1 raid0 multipath linear qxl drm_ttm_helper ttm
drm_kms_helper hid_generic usbhid hid syscopyarea sysfillrect sysimgblt
crct10dif_pclmul fb_sys_fops crc32_pclmul drm ghash_clmulni_intel aesni_intel
psmouse crypto_simd cryptd
[   49.594670] CPU: 3 PID: 1013 Comm: mount Not tainted 6.0.0-rc4 #1
[   49.594673] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.15.0-1 04/01/2014
[   49.594676] RIP: 0010:update_sit_entry+0xa55/0x10b0 [f2fs]
[   49.594697] Code: c6 0f 85 35 05 00 00 8b 45 48 e9 8d f6 ff ff 44 89 ca 48
c7 c6 40 f0 08 c1 48 89 df 89 4c 24 10 4c 89 54 24 08 e8 2d 82 05 00 <0f> 0b 48
89 df e8 51 9d ff ff 48 89 ea 4c 8b 54 24 08 48 b8 00 00
[   49.594699] RSP: 0018:ffffc90000687478 EFLAGS: 00010286
[   49.594702] RAX: 0000000000000000 RBX: ffff888118bd2000 RCX:
0000000000000000
[   49.594703] RDX: 0000000000000001 RSI: 0000000000000004 RDI:
fffff520000d0e7f
[   49.594705] RBP: ffff888131617878 R08: 0000000000000031 R09:
ffffed10526f5092
[   49.594706] R10: ffff8882937a848b R11: ffffed10526f5091 R12:
0000000000000001
[   49.594708] R13: 0000000000000200 R14: 0000000000000003 R15:
0000000000000001
[   49.594709] FS:  00007fd92b755840(0000) GS:ffff888293780000(0000)
knlGS:0000000000000000
[   49.594711] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   49.594715] CR2: 00007fb5e1c703b8 CR3: 0000000145eb4002 CR4:
0000000000370ee0
[   49.594718] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   49.594719] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   49.594722] Call Trace:
[   49.594723]  <TASK>
[   49.594725]  f2fs_do_replace_block+0xa98/0x1890 [f2fs]
[   49.594747]  ? f2fs_remove_dirty_inode+0x91/0x530 [f2fs]
[   49.594768]  f2fs_replace_block+0xeb/0x180 [f2fs]
[   49.594788]  ? call_rcu+0x26e/0x5d0
[   49.594791]  ? f2fs_do_replace_block+0x1890/0x1890 [f2fs]
[   49.594811]  ? free_inode_nonrcu+0x20/0x20
[   49.594815]  ? call_rcu+0x26e/0x5d0
[   49.594817]  recover_data+0x1a69/0x6ae0 [f2fs]
[   49.594839]  ? f2fs_put_page.constprop.0+0x4c0/0x4c0 [f2fs]
[   49.594859]  ? __get_meta_page+0x1c4/0x880 [f2fs]
[   49.594878]  ? filemap_map_pages+0x1390/0x1390
[   49.594883]  ? pagecache_get_page+0x50/0x150
[   49.594886]  f2fs_recover_fsync_data+0x120d/0x1fc0 [f2fs]
[   49.594906]  ? _raw_write_unlock+0x39/0x70
[   49.594909]  ? proc_register+0x2d4/0x4c0
[   49.594912]  ? f2fs_space_for_roll_forward+0x1d0/0x1d0 [f2fs]
[   49.594931]  ? proc_create_single_data+0xbf/0x120
[   49.594933]  ? f2fs_remove_orphan_inode+0x10/0x10 [f2fs]
[   49.594953]  ? f2fs_register_sysfs+0x37f/0x490 [f2fs]
[   49.594974]  f2fs_fill_super+0x4665/0x61e0 [f2fs]
[   49.594995]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[   49.595013]  ? mutex_unlock+0x80/0xd0
[   49.595015]  ? __mutex_unlock_slowpath.isra.0+0x2d0/0x2d0
[   49.595018]  ? sget+0x3a4/0x490
[   49.595021]  mount_bdev+0x2cf/0x3b0
[   49.595022]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[   49.595040]  ? __bpf_trace_f2fs__rw_start+0x10/0x10 [f2fs]
[   49.595058]  legacy_get_tree+0xed/0x1d0
[   49.595061]  ? security_capable+0x53/0xa0
[   49.595064]  vfs_get_tree+0x81/0x2b0
[   49.595067]  ? ns_capable_common+0x57/0xe0
[   49.595070]  path_mount+0x47e/0x19d0
[   49.595073]  ? kasan_quarantine_put+0x55/0x180
[   49.595076]  ? finish_automount+0x5f0/0x5f0
[   49.595079]  ? user_path_at_empty+0x45/0x60
[   49.595081]  ? kmem_cache_free+0x1c2/0x4e0
[   49.595084]  ? slab_post_alloc_hook+0x48/0x2d0
[   49.595087]  do_mount+0xce/0xf0
[   49.595089]  ? path_mount+0x19d0/0x19d0
[   49.595092]  ? _copy_from_user+0x50/0x80
[   49.595095]  ? memdup_user+0x4e/0xa0
[   49.595098]  __x64_sys_mount+0x12c/0x1a0
[   49.595101]  do_syscall_64+0x38/0x90
[   49.595103]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   49.595106] RIP: 0033:0x7fd92b9b4c7e
[   49.595110] Code: 48 8b 0d 15 c2 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d e2 c1 0c 00 f7 d8 64 89 01 48
[   49.595112] RSP: 002b:00007ffc28ddba78 EFLAGS: 00000246 ORIG_RAX:
00000000000000a5
[   49.595114] RAX: ffffffffffffffda RBX: 00007fd92bae6204 RCX:
00007fd92b9b4c7e
[   49.595116] RDX: 000055fd9bb49e80 RSI: 000055fd9bb4a270 RDI:
000055fd9bb49e20
[   49.595117] RBP: 000055fd9bb41460 R08: 0000000000000000 R09:
00007fd92ba81d60
[   49.595119] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[   49.595120] R13: 000055fd9bb49e20 R14: 000055fd9bb49e80 R15:
000055fd9bb41460
[   49.595122]  </TASK>
[   49.595125] ---[ end trace 0000000000000000 ]---
[   49.595556]
==================================================================
[   49.595595] BUG: KASAN: use-after-free in recover_data+0x63ae/0x6ae0 [f2fs]
[   49.595649] Read of size 4 at addr ffff8881464dcd80 by task mount/1013

[   49.595686] CPU: 3 PID: 1013 Comm: mount Tainted: G        W         
6.0.0-rc4 #1
[   49.595717] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.15.0-1 04/01/2014
[   49.595748] Call Trace:
[   49.595762]  <TASK>
[   49.595773]  dump_stack_lvl+0x45/0x5e
[   49.595792]  print_report.cold+0xf3/0x68d
[   49.595813]  ? f2fs_update_data_blkaddr+0x60/0x60 [f2fs]
[   49.595854]  ? recover_data+0x63ae/0x6ae0 [f2fs]
[   49.595893]  kasan_report+0xa8/0x130
[   49.595910]  ? recover_data+0x63ae/0x6ae0 [f2fs]
[   49.595948]  recover_data+0x63ae/0x6ae0 [f2fs]
[   49.595986]  ? f2fs_put_page.constprop.0+0x4c0/0x4c0 [f2fs]
[   49.596027]  ? __get_meta_page+0x1c4/0x880 [f2fs]
[   49.596065]  ? filemap_map_pages+0x1390/0x1390
[   49.596088]  ? pagecache_get_page+0x50/0x150
[   49.596108]  f2fs_recover_fsync_data+0x120d/0x1fc0 [f2fs]
[   49.596149]  ? _raw_write_unlock+0x39/0x70
[   49.596168]  ? proc_register+0x2d4/0x4c0
[   49.596186]  ? f2fs_space_for_roll_forward+0x1d0/0x1d0 [f2fs]
[   49.596227]  ? proc_create_single_data+0xbf/0x120
[   49.596248]  ? f2fs_remove_orphan_inode+0x10/0x10 [f2fs]
[   49.596288]  ? f2fs_register_sysfs+0x37f/0x490 [f2fs]
[   49.596329]  f2fs_fill_super+0x4665/0x61e0 [f2fs]
[   49.596368]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[   49.596404]  ? mutex_unlock+0x80/0xd0
[   49.596422]  ? __mutex_unlock_slowpath.isra.0+0x2d0/0x2d0
[   49.596445]  ? sget+0x3a4/0x490
[   49.596460]  mount_bdev+0x2cf/0x3b0
[   49.596476]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[   49.596512]  ? __bpf_trace_f2fs__rw_start+0x10/0x10 [f2fs]
[   49.596551]  legacy_get_tree+0xed/0x1d0
[   49.596570]  ? security_capable+0x53/0xa0
[   49.596589]  vfs_get_tree+0x81/0x2b0
[   49.596606]  ? ns_capable_common+0x57/0xe0
[   49.596625]  path_mount+0x47e/0x19d0
[   49.596643]  ? kasan_quarantine_put+0x55/0x180
[   49.596662]  ? finish_automount+0x5f0/0x5f0
[   49.596681]  ? user_path_at_empty+0x45/0x60
[   49.596700]  ? kmem_cache_free+0x1c2/0x4e0
[   49.596719]  ? slab_post_alloc_hook+0x48/0x2d0
[   49.597351]  do_mount+0xce/0xf0
[   49.597977]  ? path_mount+0x19d0/0x19d0
[   49.598594]  ? _copy_from_user+0x50/0x80
[   49.599204]  ? memdup_user+0x4e/0xa0
[   49.599792]  __x64_sys_mount+0x12c/0x1a0
[   49.600370]  do_syscall_64+0x38/0x90
[   49.600937]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   49.601505] RIP: 0033:0x7fd92b9b4c7e
[   49.602073] Code: 48 8b 0d 15 c2 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d e2 c1 0c 00 f7 d8 64 89 01 48
[   49.603264] RSP: 002b:00007ffc28ddba78 EFLAGS: 00000246 ORIG_RAX:
00000000000000a5
[   49.603879] RAX: ffffffffffffffda RBX: 00007fd92bae6204 RCX:
00007fd92b9b4c7e
[   49.604503] RDX: 000055fd9bb49e80 RSI: 000055fd9bb4a270 RDI:
000055fd9bb49e20
[   49.605132] RBP: 000055fd9bb41460 R08: 0000000000000000 R09:
00007fd92ba81d60
[   49.605763] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[   49.606392] R13: 000055fd9bb49e20 R14: 000055fd9bb49e80 R15:
000055fd9bb41460
[   49.607021]  </TASK>

[   49.608256] The buggy address belongs to the physical page:
[   49.608880] page:0000000023fd2496 refcount:0 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x1464dc
[   49.608890] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
[   49.608894] raw: 0017ffffc0000000 dead000000000100 dead000000000122
0000000000000000
[   49.608897] raw: 0000000000000000 0000000000000000 00000000ffffffff
0000000000000000
[   49.608899] page dumped because: kasan: bad access detected

[   49.609510] Memory state around the buggy address:
[   49.610140]  ffff8881464dcc80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff
[   49.610782]  ffff8881464dcd00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff
[   49.611453] >ffff8881464dcd80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff
[   49.612072]                    ^
[   49.612688]  ffff8881464dce00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff
[   49.613322]  ffff8881464dce80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
ff
[   49.614023]
==================================================================
[   49.614807] Disabling lock debugging due to kernel taint
[   49.615758] F2FS-fs (loop5): Bitmap was wrongly set, blk:6144
[   49.616809] ------------[ cut here ]------------
[   49.616814] WARNING: CPU: 1 PID: 1013 at fs/f2fs/segment.c:2198
update_sit_entry+0xa55/0x10b0 [f2fs]
[   49.616893] Modules linked in: f2fs crc32_generic input_leds joydev
serio_raw qemu_fw_cfg xfs autofs4 raid10 raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx raid1 raid0 multipath linear qxl drm_ttm_helper ttm
drm_kms_helper hid_generic usbhid hid syscopyarea sysfillrect sysimgblt
crct10dif_pclmul fb_sys_fops crc32_pclmul drm ghash_clmulni_intel aesni_intel
psmouse crypto_simd cryptd
[   49.616954] CPU: 1 PID: 1013 Comm: mount Tainted: G    B   W         
6.0.0-rc4 #1
[   49.616960] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.15.0-1 04/01/2014
[   49.616963] RIP: 0010:update_sit_entry+0xa55/0x10b0 [f2fs]
[   49.617003] Code: c6 0f 85 35 05 00 00 8b 45 48 e9 8d f6 ff ff 44 89 ca 48
c7 c6 40 f0 08 c1 48 89 df 89 4c 24 10 4c 89 54 24 08 e8 2d 82 05 00 <0f> 0b 48
89 df e8 51 9d ff ff 48 89 ea 4c 8b 54 24 08 48 b8 00 00
[   49.617006] RSP: 0018:ffffc90000687478 EFLAGS: 00010286
[   49.617010] RAX: 0000000000000000 RBX: ffff888118bd2000 RCX:
0000000000000000
[   49.617012] RDX: 0000000000000001 RSI: ffffffff9d263020 RDI:
fffff520000d0e7f
[   49.617014] RBP: ffff8881316178a0 R08: 0000000000000031 R09:
ffffed10526d68b9
[   49.617016] R10: ffff8882936b45c7 R11: ffffed10526d68b8 R12:
0000000000000001
[   49.617019] R13: 0000000000000200 R14: 0000000000000004 R15:
0000000000000001
[   49.617021] FS:  00007fd92b755840(0000) GS:ffff888293680000(0000)
knlGS:0000000000000000
[   49.617024] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   49.617026] CR2: 00007fceac022008 CR3: 0000000145eb4004 CR4:
0000000000370ee0
[   49.617032] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   49.617034] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   49.617036] Call Trace:
[   49.617038]  <TASK>
[   49.617042]  f2fs_do_replace_block+0xa98/0x1890 [f2fs]
[   49.617080]  ? asm_common_interrupt+0x1/0x40
[   49.617089]  f2fs_replace_block+0xeb/0x180 [f2fs]
[   49.617123]  ? f2fs_do_replace_block+0x1890/0x1890 [f2fs]
[   49.617158]  recover_data+0x1a69/0x6ae0 [f2fs]
[   49.617196]  ? f2fs_put_page.constprop.0+0x4c0/0x4c0 [f2fs]
[   49.617231]  ? __get_meta_page+0x1c4/0x880 [f2fs]
[   49.617265]  ? filemap_map_pages+0x1390/0x1390
[   49.617274]  ? pagecache_get_page+0x50/0x150
[   49.617280]  f2fs_recover_fsync_data+0x120d/0x1fc0 [f2fs]
[   49.617315]  ? _raw_write_unlock+0x39/0x70
[   49.617320]  ? proc_register+0x2d4/0x4c0
[   49.617325]  ? f2fs_space_for_roll_forward+0x1d0/0x1d0 [f2fs]
[   49.617360]  ? proc_create_single_data+0xbf/0x120
[   49.617365]  ? f2fs_remove_orphan_inode+0x10/0x10 [f2fs]
[   49.617415]  ? f2fs_register_sysfs+0x37f/0x490 [f2fs]
[   49.617455]  f2fs_fill_super+0x4665/0x61e0 [f2fs]
[   49.617496]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[   49.617530]  ? mutex_unlock+0x80/0xd0
[   49.617535]  ? __mutex_unlock_slowpath.isra.0+0x2d0/0x2d0
[   49.617539]  ? sget+0x3a4/0x490
[   49.617542]  mount_bdev+0x2cf/0x3b0
[   49.617545]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[   49.617577]  ? __bpf_trace_f2fs__rw_start+0x10/0x10 [f2fs]
[   49.617610]  legacy_get_tree+0xed/0x1d0
[   49.617616]  ? security_capable+0x53/0xa0
[   49.617622]  vfs_get_tree+0x81/0x2b0
[   49.617627]  ? ns_capable_common+0x57/0xe0
[   49.617632]  path_mount+0x47e/0x19d0
[   49.617638]  ? kasan_quarantine_put+0x55/0x180
[   49.617643]  ? finish_automount+0x5f0/0x5f0
[   49.617647]  ? user_path_at_empty+0x45/0x60
[   49.617650]  ? kmem_cache_free+0x1c2/0x4e0
[   49.617656]  ? slab_post_alloc_hook+0x48/0x2d0
[   49.617661]  do_mount+0xce/0xf0
[   49.617666]  ? path_mount+0x19d0/0x19d0
[   49.617670]  ? _copy_from_user+0x50/0x80
[   49.617675]  ? memdup_user+0x4e/0xa0
[   49.617682]  __x64_sys_mount+0x12c/0x1a0
[   49.617686]  do_syscall_64+0x38/0x90
[   49.617692]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   49.617696] RIP: 0033:0x7fd92b9b4c7e
[   49.617701] Code: 48 8b 0d 15 c2 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d e2 c1 0c 00 f7 d8 64 89 01 48
[   49.617704] RSP: 002b:00007ffc28ddba78 EFLAGS: 00000246 ORIG_RAX:
00000000000000a5
[   49.617709] RAX: ffffffffffffffda RBX: 00007fd92bae6204 RCX:
00007fd92b9b4c7e
[   49.617711] RDX: 000055fd9bb49e80 RSI: 000055fd9bb4a270 RDI:
000055fd9bb49e20
[   49.617713] RBP: 000055fd9bb41460 R08: 0000000000000000 R09:
00007fd92ba81d60
[   49.617715] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[   49.617717] R13: 000055fd9bb49e20 R14: 000055fd9bb49e80 R15:
000055fd9bb41460
[   49.617721]  </TASK>
[   49.617723] ---[ end trace 0000000000000000 ]---
[   49.617878] F2FS-fs (loop5): recover_data: ino = 6 (i_size: recover)
recovered = 8, err = -2
[   49.618311] F2FS-fs (loop5): Cannot recover all fsync data errno=-2
[   49.638221] F2FS-fs (loop5): Mounted with checkpoint version = 7548c2ec

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
