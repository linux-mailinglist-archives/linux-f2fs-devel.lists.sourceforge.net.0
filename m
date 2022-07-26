Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6047581A99
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jul 2022 21:57:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oGQgi-00064k-PQ; Tue, 26 Jul 2022 19:57:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oGQgh-00064e-L0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jul 2022 19:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qZ0pOuICWxutf2vF4X0UbKQ2gXjsq6tNj/iZYNEU0ss=; b=Y3aWom/Epn448EK2CuU/mqwlQA
 OYnENAydzFCsulXlO8Zi7hXfPNu9CfofAgAqbgzRuD6qLSFPW0HlkCi+QeZxHUpw9tTorW49vknPi
 53i5+JSydfkFcGo9KPUxdN2TyjWLCcNtLyzXKXE8eV2zBpgainPN/WykIH21DTT2kiWY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qZ0pOuICWxutf2vF4X0UbKQ2gXjsq6tNj/iZYNEU0ss=; b=h
 frpwhfmfFwdo16zyeUPbVUE3rCoxEXzqRr/DKu+t1A0wd7rHOLZ/JIUmsXDqXVz9KE2xDzkwqlVhk
 63Twwu5HpllIA9dYT3ZYun3D0NkUV5GQBW5MBwGI1Gna8c8atyh8xiNrKSiCVCZ8XPlGVYnWYoKZr
 q3+nj7BLnOQpMt1c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oGQgg-00BJSs-0f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jul 2022 19:57:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94006615E8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Jul 2022 19:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6359DC433B5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Jul 2022 19:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658865464;
 bh=QL3Y+7dGUK5ewP7dD5tpTF8sV1yK3WdSGa6+E9CbPoY=;
 h=From:To:Subject:Date:From;
 b=A8qFN71eD4mWKivCX6dfogz4VEl6vdQrYBUyiQMdoYAGmDeZvLwma+iG5nMVSTkFA
 imSUYVZFc03VwvcHLyRYdd9NaUZCNxuRdHyaFKVrKSsHVRBW8ejYq2EFOkz6rA3j4H
 TWb84MH+L/rUpeeG7pT2WLQYvZIQtaNfwUuSCNuxYq6kKLulHeS7GOXW33/xGeniE0
 8V4uV415yqcKGu1zV+v36ikGopo5NwyoOWP3G9xoj02hf50SOOOdkbvFIf6MdHccbF
 j/G5zR4b/qWUWX3HdjNTvu8Pca6dPK0A5OkA2T9TOMRTIJOXk3vv3cOAmY6fgVeldy
 k21771xBN4+XQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 48BB1C433E6; Tue, 26 Jul 2022 19:57:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 26 Jul 2022 19:57:43 +0000
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
Message-ID: <bug-216285-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216285 Bug ID:
 216285 Summary: KASAN: slab-out-of-bounds in mutex_lock and NULL pointer
 deference at fs/f2fs/segment.c: f2fs_update_meta_page() when mount a crafted
 f2fs image Product: File System Version: [...] 
 Content analysis details:   (-4.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.0 HEXHASH_WORD           Multiple instances of word + hexadecimal hash
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oGQgg-00BJSs-0f
Subject: [f2fs-dev] [Bug 216285] New: KASAN: slab-out-of-bounds in
 mutex_lock and NULL pointer deference at fs/f2fs/segment.c:
 f2fs_update_meta_page() when mount a crafted f2fs image
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

https://bugzilla.kernel.org/show_bug.cgi?id=216285

            Bug ID: 216285
           Summary: KASAN: slab-out-of-bounds in mutex_lock and NULL
                    pointer deference at fs/f2fs/segment.c:
                    f2fs_update_meta_page() when mount a crafted f2fs
                    image
           Product: File System
           Version: 2.5
    Kernel Version: 5.15-5.19-rc8
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

Created attachment 301488
  --> https://bugzilla.kernel.org/attachment.cgi?id=301488&action=edit
crafted image and .config

- Overview 
KASAN: slab-out-of-bounds in mutex_lock and NULL pointer deference at
fs/f2fs/segment.c:f2fs_update_meta_page() when mount a crafted f2fs image

- Reproduce 
tested on kernel 5.15.57, 5.19-rc8

# mkdir mnt
# mount tmp1.img mnt

-Kernel dump
[  185.716899] ------------[ cut here ]------------
[  185.716900] WARNING: CPU: 3 PID: 1155 at fs/f2fs/segment.c:719
__locate_dirty_segment+0x89f/0xb70 [f2fs]
[  185.716921] Modules linked in: f2fs crc32_generic joydev input_leds
serio_raw qemu_fw_cfg xfs autofs4 raid10 raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx raid1 raid0 multipath linear qxl drm_ttm_helper ttm
drm_kms_helper hid_generic usbhid syscopyarea sysfillrect crct10dif_pclmul
crc32_pclmul sysimgblt fb_sys_fops hid ghash_clmulni_intel drm aesni_intel
crypto_simd psmouse cryptd
[  185.716948] CPU: 3 PID: 1155 Comm: mount Tainted: G        W        
5.19.0-rc8 #1
[  185.716950] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.13.0-1ubuntu1.1 04/01/2014
[  185.716951] RIP: 0010:__locate_dirty_segment+0x89f/0xb70 [f2fs]
[  185.716971] Code: ff ff e8 d4 59 0c c8 e9 8c f8 ff ff e8 ca 59 0c c8 e9 fc
f8 ff ff e8 c0 59 0c c8 e9 2f f9 ff ff e8 b6 59 0c c8 e9 62 f9 ff ff <0f> 0b 48
83 c4 18 4c 89 e7 5b 5d 41 5c 41 5d 41 5e 41 5f e9 29 f7
[  185.716973] RSP: 0018:ffff888122d7f4d8 EFLAGS: 00010206
[  185.716974] RAX: 0000000000000019 RBX: ffff888118930d00 RCX:
0000000000000019
[  185.716976] RDX: 000000000000000f RSI: 0000000000000008 RDI:
ffff88811db4e670
[  185.716977] RBP: 000000000000000f R08: ffff888100bcea00 R09:
ffffed1020179d41
[  185.716978] R10: ffff888100bcea07 R11: ffffed1020179d40 R12:
ffff88814fa24000
[  185.716979] R13: ffff8881247b0258 R14: 0000000000000000 R15:
ffff88814fa24080
[  185.716981] FS:  00007f60badb8840(0000) GS:ffff888293780000(0000)
knlGS:0000000000000000
[  185.716982] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  185.716984] CR2: 0000559740896c48 CR3: 000000011bae6002 CR4:
0000000000370ee0
[  185.716986] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  185.716987] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  185.716989] Call Trace:
[  185.716991]  <TASK>
[  185.716993]  locate_dirty_segment+0x42b/0x570 [f2fs]
[  185.717014]  f2fs_do_replace_block+0x869/0x18a0 [f2fs]
[  185.717035]  f2fs_replace_block+0xeb/0x180 [f2fs]
[  185.717056]  ? f2fs_do_replace_block+0x18a0/0x18a0 [f2fs]
[  185.717076]  recover_data+0x1abd/0x6f50 [f2fs]
[  185.717098]  ? pagecache_get_page+0x50/0x160
[  185.717101]  ? check_index_in_prev_nodes+0x2860/0x2860 [f2fs]
[  185.717121]  ? __get_meta_page+0x1c4/0x1710 [f2fs]
[  185.717141]  ? __add_ino_entry+0x430/0x430 [f2fs]
[  185.717159]  ? filemap_map_pages+0x1390/0x1390
[  185.717162]  ? pagecache_get_page+0x50/0x160
[  185.717164]  ? f2fs_ra_meta_pages_cond+0x136/0x370 [f2fs]
[  185.717183]  f2fs_recover_fsync_data+0x12ce/0x3250 [f2fs]
[  185.717204]  ? _raw_write_unlock+0x39/0x70
[  185.717206]  ? proc_register+0x2d4/0x4c0
[  185.717209]  ? f2fs_space_for_roll_forward+0x1d0/0x1d0 [f2fs]
[  185.717230]  ? proc_create_single_data+0xbf/0x120
[  185.717233]  ? f2fs_remove_orphan_inode+0x10/0x10 [f2fs]
[  185.717252]  ? f2fs_register_sysfs+0x37f/0x490 [f2fs]
[  185.717274]  f2fs_fill_super+0x4459/0x6190 [f2fs]
[  185.717295]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[  185.717313]  ? mutex_unlock+0x80/0xd0
[  185.717315]  ? __mutex_unlock_slowpath.isra.0+0x2d0/0x2d0
[  185.717318]  ? sget+0x3a4/0x490
[  185.717321]  mount_bdev+0x2cf/0x3b0
[  185.717323]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[  185.717341]  ? f2fs_sync_fs+0x230/0x230 [f2fs]
[  185.717359]  legacy_get_tree+0xed/0x1d0
[  185.717361]  ? security_capable+0x53/0xa0
[  185.717363]  vfs_get_tree+0x81/0x2b0
[  185.717366]  ? ns_capable_common+0x57/0xe0
[  185.717368]  path_mount+0x47e/0x19d0
[  185.717371]  ? finish_automount+0x5f0/0x5f0
[  185.717373]  ? user_path_at_empty+0x45/0x60
[  185.717375]  ? kmem_cache_free+0xd3/0x3b0
[  185.717378]  ? slab_post_alloc_hook+0x48/0x2d0
[  185.717380]  do_mount+0xce/0xf0
[  185.717383]  ? path_mount+0x19d0/0x19d0
[  185.717385]  ? _copy_from_user+0x50/0x80
[  185.717387]  ? memdup_user+0x4e/0xa0
[  185.717389]  __x64_sys_mount+0x12c/0x1a0
[  185.717392]  do_syscall_64+0x38/0x90
[  185.717394]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  185.717397] RIP: 0033:0x7f60bb017c7e
[  185.717398] Code: 48 8b 0d 15 c2 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d e2 c1 0c 00 f7 d8 64 89 01 48
[  185.717400] RSP: 002b:00007fff9fdd3e58 EFLAGS: 00000246 ORIG_RAX:
00000000000000a5
[  185.717402] RAX: ffffffffffffffda RBX: 00007f60bb149204 RCX:
00007f60bb017c7e
[  185.717403] RDX: 000055db59fe3670 RSI: 000055db59fec290 RDI:
000055db59febe40
[  185.717404] RBP: 000055db59fe3460 R08: 0000000000000000 R09:
00007f60bb0e4c00
[  185.717406] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[  185.717407] R13: 000055db59febe40 R14: 000055db59fe3670 R15:
000055db59fe3460
[  185.717409]  </TASK>
[  185.717410] ---[ end trace 0000000000000000 ]---
[  185.717441] F2FS-fs (loop5): recover_data: ino = d (i_size: recover)
recovered = 42, err = 0
[  185.717445] F2FS-fs (loop5): recover_inode: ino = d, name =
Es3yhcX39Mydt60WMDsgZfJcOh0RMFJ, inline = 1
[  185.717484] ------------[ cut here ]------------
[  185.717485] WARNING: CPU: 3 PID: 1155 at fs/f2fs/segment.c:3512
f2fs_do_replace_block+0xd7e/0x18a0 [f2fs]
[  185.717508] Modules linked in: f2fs crc32_generic joydev input_leds
serio_raw qemu_fw_cfg xfs autofs4 raid10 raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx raid1 raid0 multipath linear qxl drm_ttm_helper ttm
drm_kms_helper hid_generic usbhid syscopyarea sysfillrect crct10dif_pclmul
crc32_pclmul sysimgblt fb_sys_fops hid ghash_clmulni_intel drm aesni_intel
crypto_simd psmouse cryptd
[  185.717535] CPU: 3 PID: 1155 Comm: mount Tainted: G        W        
5.19.0-rc8 #1
[  185.717537] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.13.0-1ubuntu1.1 04/01/2014
[  185.717538] RIP: 0010:f2fs_do_replace_block+0xd7e/0x18a0 [f2fs]
[  185.717559] Code: 5c 04 00 00 41 83 c4 01 41 83 fc 08 75 c6 89 54 24 10 0f
0b 48 89 df 41 bf c0 03 00 00 e8 ca d8 fd ff 8b 54 24 10 89 54 24 10 <0f> 0b be
08 00 00 00 48 8d 7b 48 e8 42 3e 0a c8 f0 80 4b 48 04 4c
[  185.717562] RSP: 0018:ffff888122d7f568 EFLAGS: 00010206
[  185.717564] RAX: 0000000000000019 RBX: ffff88814fa24000 RCX:
0000000000000000
[  185.717566] RDX: 000000000000000f RSI: 1ffff110248f604b RDI:
0000000000000000
[  185.717567] RBP: 0000000000000177 R08: 0000000000000001 R09:
ffffed102446d726
[  185.717568] R10: ffff88812236b92f R11: ffffed102446d725 R12:
0000000000000019
[  185.717569] R13: ffff88814fa24080 R14: ffff88811db4e600 R15:
0000000000000bb8
[  185.717571] FS:  00007f60badb8840(0000) GS:ffff888293780000(0000)
knlGS:0000000000000000
[  185.717572] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  185.717574] CR2: 0000559740896c48 CR3: 000000011bae6002 CR4:
0000000000370ee0
[  185.717577] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  185.717578] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  185.717579] Call Trace:
[  185.717580]  <TASK>
[  185.717581]  ? _raw_write_lock+0x81/0xe0
[  185.717584]  ? f2fs_inode_dirtied+0xf9/0x2b0 [f2fs]
[  185.717603]  f2fs_replace_block+0xeb/0x180 [f2fs]
[  185.717624]  ? f2fs_reserve_new_blocks+0xa5b/0x11f0 [f2fs]
[  185.717645]  ? f2fs_do_replace_block+0x18a0/0x18a0 [f2fs]
[  185.717665]  recover_data+0x1abd/0x6f50 [f2fs]
[  185.717687]  ? pagecache_get_page+0x50/0x160
[  185.717690]  ? check_index_in_prev_nodes+0x2860/0x2860 [f2fs]
[  185.717710]  ? __get_meta_page+0x1c4/0x1710 [f2fs]
[  185.717729]  ? __add_ino_entry+0x430/0x430 [f2fs]
[  185.717747]  ? filemap_map_pages+0x1390/0x1390
[  185.717751]  ? pagecache_get_page+0x50/0x160
[  185.717753]  ? f2fs_ra_meta_pages_cond+0x136/0x370 [f2fs]
[  185.717771]  f2fs_recover_fsync_data+0x12ce/0x3250 [f2fs]
[  185.717793]  ? _raw_write_unlock+0x39/0x70
[  185.717795]  ? proc_register+0x2d4/0x4c0
[  185.717798]  ? f2fs_space_for_roll_forward+0x1d0/0x1d0 [f2fs]
[  185.717819]  ? proc_create_single_data+0xbf/0x120
[  185.717822]  ? f2fs_remove_orphan_inode+0x10/0x10 [f2fs]
[  185.717842]  ? f2fs_register_sysfs+0x37f/0x490 [f2fs]
[  185.717863]  f2fs_fill_super+0x4459/0x6190 [f2fs]
[  185.717884]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[  185.717902]  ? mutex_unlock+0x80/0xd0
[  185.717904]  ? __mutex_unlock_slowpath.isra.0+0x2d0/0x2d0
[  185.717907]  ? sget+0x3a4/0x490
[  185.717910]  mount_bdev+0x2cf/0x3b0
[  185.717912]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[  185.717930]  ? f2fs_sync_fs+0x230/0x230 [f2fs]
[  185.717948]  legacy_get_tree+0xed/0x1d0
[  185.717950]  ? security_capable+0x53/0xa0
[  185.717952]  vfs_get_tree+0x81/0x2b0
[  185.717986]  ? ns_capable_common+0x57/0xe0
[  185.717989]  path_mount+0x47e/0x19d0
[  185.717992]  ? finish_automount+0x5f0/0x5f0
[  185.717995]  ? user_path_at_empty+0x45/0x60
[  185.717997]  ? kmem_cache_free+0xd3/0x3b0
[  185.718000]  ? slab_post_alloc_hook+0x48/0x2d0
[  185.718002]  do_mount+0xce/0xf0
[  185.718005]  ? path_mount+0x19d0/0x19d0
[  185.718007]  ? _copy_from_user+0x50/0x80
[  185.718009]  ? memdup_user+0x4e/0xa0
[  185.718012]  __x64_sys_mount+0x12c/0x1a0
[  185.718014]  do_syscall_64+0x38/0x90
[  185.718017]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  185.718019] RIP: 0033:0x7f60bb017c7e
[  185.718021] Code: 48 8b 0d 15 c2 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d e2 c1 0c 00 f7 d8 64 89 01 48
[  185.718023] RSP: 002b:00007fff9fdd3e58 EFLAGS: 00000246 ORIG_RAX:
00000000000000a5
[  185.718025] RAX: ffffffffffffffda RBX: 00007f60bb149204 RCX:
00007f60bb017c7e
[  185.718027] RDX: 000055db59fe3670 RSI: 000055db59fec290 RDI:
000055db59febe40
[  185.718028] RBP: 000055db59fe3460 R08: 0000000000000000 R09:
00007f60bb0e4c00
[  185.718029] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[  185.718031] R13: 000055db59febe40 R14: 000055db59fe3670 R15:
000055db59fe3460
[  185.718033]  </TASK>
[  185.718034] ---[ end trace 0000000000000000 ]---
[  185.718035]
==================================================================
[  185.718108] BUG: KASAN: slab-out-of-bounds in mutex_lock+0x7f/0xe0
[  185.718138] Write of size 8 at addr ffff8881247b13b8 by task mount/1155

[  185.718173] CPU: 3 PID: 1155 Comm: mount Tainted: G        W        
5.19.0-rc8 #1
[  185.718206] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.13.0-1ubuntu1.1 04/01/2014
[  185.718240] Call Trace:
[  185.718252]  <TASK>
[  185.718262]  dump_stack_lvl+0x45/0x5e
[  185.718282]  print_report.cold+0xf3/0x67f
[  185.718302]  ? mutex_lock+0x7f/0xe0
[  185.718318]  kasan_report+0xa9/0x120
[  185.718336]  ? __rdgsbase_inactive+0x11/0x20
[  185.718360]  ? mutex_lock+0x7f/0xe0
[  185.718378]  kasan_check_range+0x144/0x1c0
[  185.718409]  mutex_lock+0x7f/0xe0
[  185.718425]  ? __mutex_lock_slowpath+0x10/0x10
[  185.718445]  ? f2fs_do_replace_block+0xd80/0x18a0 [f2fs]
[  185.718488]  f2fs_do_replace_block+0x4e9/0x18a0 [f2fs]
[  185.718529]  ? _raw_write_lock+0x81/0xe0
[  185.718547]  ? f2fs_inode_dirtied+0xf9/0x2b0 [f2fs]
[  185.718605]  f2fs_replace_block+0xeb/0x180 [f2fs]
[  185.718645]  ? f2fs_reserve_new_blocks+0xa5b/0x11f0 [f2fs]
[  185.718688]  ? f2fs_do_replace_block+0x18a0/0x18a0 [f2fs]
[  185.718730]  recover_data+0x1abd/0x6f50 [f2fs]
[  185.718771]  ? pagecache_get_page+0x50/0x160
[  185.718790]  ? check_index_in_prev_nodes+0x2860/0x2860 [f2fs]
[  185.718834]  ? __get_meta_page+0x1c4/0x1710 [f2fs]
[  185.718873]  ? __add_ino_entry+0x430/0x430 [f2fs]
[  185.718911]  ? filemap_map_pages+0x1390/0x1390
[  185.718945]  ? pagecache_get_page+0x50/0x160
[  185.718964]  ? f2fs_ra_meta_pages_cond+0x136/0x370 [f2fs]
[  185.719003]  f2fs_recover_fsync_data+0x12ce/0x3250 [f2fs]
[  185.719046]  ? _raw_write_unlock+0x39/0x70
[  185.719064]  ? proc_register+0x2d4/0x4c0
[  185.719083]  ? f2fs_space_for_roll_forward+0x1d0/0x1d0 [f2fs]
[  185.719126]  ? proc_create_single_data+0xbf/0x120
[  185.719147]  ? f2fs_remove_orphan_inode+0x10/0x10 [f2fs]
[  185.719188]  ? f2fs_register_sysfs+0x37f/0x490 [f2fs]
[  185.719229]  f2fs_fill_super+0x4459/0x6190 [f2fs]
[  185.719284]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[  185.719320]  ? mutex_unlock+0x80/0xd0
[  185.719337]  ? __mutex_unlock_slowpath.isra.0+0x2d0/0x2d0
[  185.719359]  ? sget+0x3a4/0x490
[  185.719374]  mount_bdev+0x2cf/0x3b0
[  185.719999]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[  185.720639]  ? f2fs_sync_fs+0x230/0x230 [f2fs]
[  185.721278]  legacy_get_tree+0xed/0x1d0
[  185.721882]  ? security_capable+0x53/0xa0
[  185.722549]  vfs_get_tree+0x81/0x2b0
[  185.723127]  ? ns_capable_common+0x57/0xe0
[  185.723700]  path_mount+0x47e/0x19d0
[  185.724264]  ? finish_automount+0x5f0/0x5f0
[  185.724817]  ? user_path_at_empty+0x45/0x60
[  185.725355]  ? kmem_cache_free+0xd3/0x3b0
[  185.725897]  ? slab_post_alloc_hook+0x48/0x2d0
[  185.726518]  do_mount+0xce/0xf0
[  185.727062]  ? path_mount+0x19d0/0x19d0
[  185.727608]  ? _copy_from_user+0x50/0x80
[  185.728157]  ? memdup_user+0x4e/0xa0
[  185.728705]  __x64_sys_mount+0x12c/0x1a0
[  185.729253]  do_syscall_64+0x38/0x90
[  185.729799]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  185.730429] RIP: 0033:0x7f60bb017c7e
[  185.730982] Code: 48 8b 0d 15 c2 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d e2 c1 0c 00 f7 d8 64 89 01 48
[  185.732178] RSP: 002b:00007fff9fdd3e58 EFLAGS: 00000246 ORIG_RAX:
00000000000000a5
[  185.732793] RAX: ffffffffffffffda RBX: 00007f60bb149204 RCX:
00007f60bb017c7e
[  185.733415] RDX: 000055db59fe3670 RSI: 000055db59fec290 RDI:
000055db59febe40
[  185.734078] RBP: 000055db59fe3460 R08: 0000000000000000 R09:
00007f60bb0e4c00
[  185.734740] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[  185.735362] R13: 000055db59febe40 R14: 000055db59fe3670 R15:
000055db59fe3460
[  185.736019]  </TASK>

[  185.737232] Allocated by task 1155:
[  185.737832]  kasan_save_stack+0x1e/0x40
[  185.737835]  __kasan_kmalloc+0xa9/0xe0
[  185.737838]  __kmalloc+0x18e/0x340
[  185.737840]  f2fs_init_write_merge_io+0x5c/0x460 [f2fs]
[  185.737860]  f2fs_fill_super+0x1ab9/0x6190 [f2fs]
[  185.737879]  mount_bdev+0x2cf/0x3b0
[  185.737881]  legacy_get_tree+0xed/0x1d0
[  185.737883]  vfs_get_tree+0x81/0x2b0
[  185.737885]  path_mount+0x47e/0x19d0
[  185.737887]  do_mount+0xce/0xf0
[  185.737889]  __x64_sys_mount+0x12c/0x1a0
[  185.737894]  do_syscall_64+0x38/0x90
[  185.737896]  entry_SYSCALL_64_after_hwframe+0x63/0xcd

[  185.738571] The buggy address belongs to the object at ffff8881247b1000
                which belongs to the cache kmalloc-1k of size 1024
[  185.739810] The buggy address is located 952 bytes inside of
                1024-byte region [ffff8881247b1000, ffff8881247b1400)

[  185.741678] The buggy address belongs to the physical page:
[  185.742374] page:0000000070dda483 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x1247b0
[  185.742404] head:0000000070dda483 order:3 compound_mapcount:0
compound_pincount:0
[  185.742406] flags:
0x17ffffc0010200(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
[  185.742429] raw: 0017ffffc0010200 0000000000000000 dead000000000122
ffff888100042dc0
[  185.742432] raw: 0000000000000000 0000000080100010 00000001ffffffff
0000000000000000
[  185.742433] page dumped because: kasan: bad access detected

[  185.743104] Memory state around the buggy address:
[  185.743750]  ffff8881247b1280: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00
[  185.744411]  ffff8881247b1300: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
fc
[  185.745069] >ffff8881247b1380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
fc
[  185.745725]                                         ^
[  185.746487]  ffff8881247b1400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
fc
[  185.747157]  ffff8881247b1480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
fc
[  185.747814]
==================================================================
[  185.748513] Disabling lock debugging due to kernel taint
[  185.748547] BUG: kernel NULL pointer dereference, address: 0000000000000000
[  185.749279] #PF: supervisor read access in kernel mode
[  185.750048] #PF: error_code(0x0000) - not-present page
[  185.750915] PGD 0 P4D 0 
[  185.751642] Oops: 0000 [#1] PREEMPT SMP KASAN NOPTI
[  185.752363] CPU: 2 PID: 1155 Comm: mount Tainted: G    B   W        
5.19.0-rc8 #1
[  185.753114] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.13.0-1ubuntu1.1 04/01/2014
[  185.753968] RIP: 0010:memcpy_erms+0x6/0x10
[  185.754871] Code: fe ff ff cc eb 1e 0f 1f 00 48 89 f8 48 89 d1 48 c1 e9 03
83 e2 07 f3 48 a5 89 d1 f3 a4 c3 cc cc cc cc 66 90 48 89 f8 48 89 d1 <f3> a4 c3
cc cc cc cc 0f 1f 00 48 89 f8 48 83 fa 20 72 7e 40 38 fe
[  185.756547] RSP: 0018:ffff888122d7f4c0 EFLAGS: 00010202
[  185.757551] RAX: ffff88812236f000 RBX: ffff88812236f000 RCX:
0000000000001000
[  185.758540] RDX: 0000000000001000 RSI: 0000000000000000 RDI:
ffff88812236f000
[  185.759794] RBP: ffffea000488dbc0 R08: 0000000000000001 R09:
0000000000000000
[  185.760805] R10: ffff88812236ffff R11: ffffed102446dfff R12:
0000000000000000
[  185.761740] R13: ffff88814fa24080 R14: ffff88814fa24000 R15:
ffff8881247b13b8
[  185.762832] FS:  00007f60badb8840(0000) GS:ffff888293700000(0000)
knlGS:0000000000000000
[  185.763849] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  185.764860] CR2: 0000000000000000 CR3: 000000011bae6005 CR4:
0000000000370ee0
[  185.765802] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  185.766827] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  185.767772] Call Trace:
[  185.768695]  <TASK>
[  185.769557]  f2fs_update_meta_page+0x84/0x570 [f2fs]
[  185.770530]  change_curseg.constprop.0+0x159/0xbd0 [f2fs]
[  185.771441]  f2fs_do_replace_block+0x5c7/0x18a0 [f2fs]
[  185.772338]  ? _raw_write_lock+0x81/0xe0
[  185.773147]  f2fs_replace_block+0xeb/0x180 [f2fs]
[  185.774076]  ? f2fs_reserve_new_blocks+0xa5b/0x11f0 [f2fs]
[  185.775041]  ? f2fs_do_replace_block+0x18a0/0x18a0 [f2fs]
[  185.775950]  recover_data+0x1abd/0x6f50 [f2fs]
[  185.776852]  ? pagecache_get_page+0x50/0x160
[  185.777705]  ? check_index_in_prev_nodes+0x2860/0x2860 [f2fs]
[  185.778654]  ? __get_meta_page+0x1c4/0x1710 [f2fs]
[  185.779523]  ? __add_ino_entry+0x430/0x430 [f2fs]
[  185.780355]  ? filemap_map_pages+0x1390/0x1390
[  185.781142]  ? pagecache_get_page+0x50/0x160
[  185.781919]  ? f2fs_ra_meta_pages_cond+0x136/0x370 [f2fs]
[  185.782765]  f2fs_recover_fsync_data+0x12ce/0x3250 [f2fs]
[  185.783565]  ? _raw_write_unlock+0x39/0x70
[  185.784343]  ? proc_register+0x2d4/0x4c0
[  185.785106]  ? f2fs_space_for_roll_forward+0x1d0/0x1d0 [f2fs]
[  185.785926]  ? proc_create_single_data+0xbf/0x120
[  185.786980]  ? f2fs_remove_orphan_inode+0x10/0x10 [f2fs]
[  185.788114]  ? f2fs_register_sysfs+0x37f/0x490 [f2fs]
[  185.789143]  f2fs_fill_super+0x4459/0x6190 [f2fs]
[  185.790196]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[  185.791275]  ? mutex_unlock+0x80/0xd0
[  185.792296]  ? __mutex_unlock_slowpath.isra.0+0x2d0/0x2d0
[  185.793070]  ? sget+0x3a4/0x490
[  185.793837]  mount_bdev+0x2cf/0x3b0
[  185.794681]  ? f2fs_commit_super+0x740/0x740 [f2fs]
[  185.795431]  ? f2fs_sync_fs+0x230/0x230 [f2fs]
[  185.796170]  legacy_get_tree+0xed/0x1d0
[  185.796877]  ? security_capable+0x53/0xa0
[  185.797568]  vfs_get_tree+0x81/0x2b0
[  185.798272]  ? ns_capable_common+0x57/0xe0
[  185.798977]  path_mount+0x47e/0x19d0
[  185.799609]  ? finish_automount+0x5f0/0x5f0
[  185.800233]  ? user_path_at_empty+0x45/0x60
[  185.800853]  ? kmem_cache_free+0xd3/0x3b0
[  185.801467]  ? slab_post_alloc_hook+0x48/0x2d0
[  185.802117]  do_mount+0xce/0xf0
[  185.802785]  ? path_mount+0x19d0/0x19d0
[  185.803380]  ? _copy_from_user+0x50/0x80
[  185.803963]  ? memdup_user+0x4e/0xa0
[  185.804536]  __x64_sys_mount+0x12c/0x1a0
[  185.805111]  do_syscall_64+0x38/0x90
[  185.805689]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  185.806303] RIP: 0033:0x7f60bb017c7e
[  185.806945] Code: 48 8b 0d 15 c2 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d e2 c1 0c 00 f7 d8 64 89 01 48
[  185.808194] RSP: 002b:00007fff9fdd3e58 EFLAGS: 00000246 ORIG_RAX:
00000000000000a5
[  185.808834] RAX: ffffffffffffffda RBX: 00007f60bb149204 RCX:
00007f60bb017c7e
[  185.809478] RDX: 000055db59fe3670 RSI: 000055db59fec290 RDI:
000055db59febe40
[  185.810164] RBP: 000055db59fe3460 R08: 0000000000000000 R09:
00007f60bb0e4c00
[  185.810869] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[  185.811511] R13: 000055db59febe40 R14: 000055db59fe3670 R15:
000055db59fe3460
[  185.812154]  </TASK>
[  185.812787] Modules linked in: f2fs crc32_generic joydev input_leds
serio_raw qemu_fw_cfg xfs autofs4 raid10 raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx raid1 raid0 multipath linear qxl drm_ttm_helper ttm
drm_kms_helper hid_generic usbhid syscopyarea sysfillrect crct10dif_pclmul
crc32_pclmul sysimgblt fb_sys_fops hid ghash_clmulni_intel drm aesni_intel
crypto_simd psmouse cryptd
[  185.815760] CR2: 0000000000000000
[  185.816493] ---[ end trace 0000000000000000 ]---
[  185.817225] RIP: 0010:memcpy_erms+0x6/0x10
[  185.817955] Code: fe ff ff cc eb 1e 0f 1f 00 48 89 f8 48 89 d1 48 c1 e9 03
83 e2 07 f3 48 a5 89 d1 f3 a4 c3 cc cc cc cc 66 90 48 89 f8 48 89 d1 <f3> a4 c3
cc cc cc cc 0f 1f 00 48 89 f8 48 83 fa 20 72 7e 40 38 fe
[  185.819586] RSP: 0018:ffff888122d7f4c0 EFLAGS: 00010202
[  185.820369] RAX: ffff88812236f000 RBX: ffff88812236f000 RCX:
0000000000001000
[  185.821163] RDX: 0000000000001000 RSI: 0000000000000000 RDI:
ffff88812236f000
[  185.821960] RBP: ffffea000488dbc0 R08: 0000000000000001 R09:
0000000000000000
[  185.822850] R10: ffff88812236ffff R11: ffffed102446dfff R12:
0000000000000000
[  185.823647] R13: ffff88814fa24080 R14: ffff88814fa24000 R15:
ffff8881247b13b8
[  185.824445] FS:  00007f60badb8840(0000) GS:ffff888293700000(0000)
knlGS:0000000000000000
[  185.825258] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  185.826106] CR2: 0000000000000000 CR3: 000000011bae6005 CR4:
0000000000370ee0
[  185.826991] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  185.827811] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
