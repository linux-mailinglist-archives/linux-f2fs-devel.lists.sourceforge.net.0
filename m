Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5718E82C863
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 01:32:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rORww-0006Gk-Oz;
	Sat, 13 Jan 2024 00:32:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3FdqhZQkbAIQ067sittmzixxql.owwotm20mzkwv1mv1.kwu@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rORwu-0006GR-Lo for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 00:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SUJfhQNq3k44Bhu7wRHeos2LdxFuSpP3eGtz8/pCacg=; b=A3aQNzPSDCOAdSX+wo/x28utZa
 jl5CzrjOyvDGeOU+Y98OnpSm2AFhUAuCEe/DDvoZrbPYKXA1H57EeVNvEU+ZwqTRj/g6x+5W1q7yw
 3B8pvz0VPEmwam7dHR989x2d+A3JmADk8TJtdfBL/tgA5G6OQSO9gtBjGUZTw6vfJSKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SUJfhQNq3k44Bhu7wRHeos2LdxFuSpP3eGtz8/pCacg=; b=b
 daJsL6Z+E1Q8Aw2f2wyLcvVDUZ1+YyWeJF20QbaMeSKDuePlOnX/7t/OxNl31AXm8BPJqOGHfOAoP
 XK7W8Qr7G1QTQLXJbLNZ7/Sh+sTzkL+JeS6+hDHNiVX+qIpwuQRNUcL3ALu553M96n77wV6OahDB8
 tP1ozitPjisLU6cA=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rORwt-0005Fk-3Y for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 00:32:32 +0000
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-7bef3fcd7a0so297807839f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jan 2024 16:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705105941; x=1705710741;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SUJfhQNq3k44Bhu7wRHeos2LdxFuSpP3eGtz8/pCacg=;
 b=YukmkpALzEcZhN1dJIhVuXIJ1moBCruf65XjfGzLKBLi/atnoBTevjSm/ljNxi78um
 QESObA1gg6StrVLrrBwIU9Qn3qtjoFWrxcbVhefrgaEJxgeaLYnbrxsFnfZ54rqorU0S
 J3EVKtvEqWPOFJKD9WHS2M2hFQQrEEdlgzJzImiaBc8OYybxdW2qo/cBg+pTLZ+tBTmb
 //SPIHkSFu0jgv2K0rG4HfR4SYwhLjiVfWX6+s3QAVipRNoj/XXjBRVPfnlAZylK7z3n
 WqHx7mO0SpHdFzk/vv8GE/KBMUorY5+TEvm4qU77ZLe2TVchGSkTjicH77GZG8VfZxSM
 vpJQ==
X-Gm-Message-State: AOJu0YzCEYj4c/H4dkf87zDp7by5q0JIprem35d05NG99guGKwBMTgzt
 r2FQy+hLBzHqh/yOoDJXSMBauhSaddVLH1BAFq336dFeU3Fv
X-Google-Smtp-Source: AGHT+IGMYsqdW4+qgJesxKl5q4xqrIVz35ju8Q7MKxyY5EQLhVKafywG2E7N5x6zfX9SCYfmrQ6u4hU+9eQiIbAZH9CNG2k9OeyF
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a65:b0:35f:b420:47e3 with SMTP id
 w5-20020a056e021a6500b0035fb42047e3mr295289ilv.5.1705105941083; Fri, 12 Jan
 2024 16:32:21 -0800 (PST)
Date: Fri, 12 Jan 2024 16:32:21 -0800
In-Reply-To: <0000000000006cb174060ec34502@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ec3dd2060ec8e941@google.com>
From: syzbot <syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 70d201a40823 Merge tag 'f2fs-for-6.8-rc1' of git://git.ker..
 git tree: upstream console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=176d9debe80000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rORwt-0005Fk-3Y
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 kill_f2fs_super
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    70d201a40823 Merge tag 'f2fs-for-6.8-rc1' of git://git.ker..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=176d9debe80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4607bc15d1c4bb90
dashboard link: https://syzkaller.appspot.com/bug?extid=8f477ac014ff5b32d81f
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=112b660be80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c1df5de80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4faf0f99e43c/disk-70d201a4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/23f59e40d2ef/vmlinux-70d201a4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a0bc6007f0a4/bzImage-70d201a4.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/cf767215e29c/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 63271
F2FS-fs (loop0): Mismatch start address, segment0(512) cp_blkaddr(605)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): SIT is corrupted node# 0 vs 1
F2FS-fs (loop0): Failed to initialize F2FS segment manager (-117)
==================================================================
BUG: KASAN: slab-use-after-free in destroy_device_list fs/f2fs/super.c:1606 [inline]
BUG: KASAN: slab-use-after-free in kill_f2fs_super+0x618/0x690 fs/f2fs/super.c:4932
Read of size 4 at addr ffff888023bdd77c by task syz-executor275/5046

CPU: 0 PID: 5046 Comm: syz-executor275 Not tainted 6.7.0-syzkaller-06264-g70d201a40823 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/17/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x163/0x540 mm/kasan/report.c:488
 kasan_report+0x142/0x170 mm/kasan/report.c:601
 destroy_device_list fs/f2fs/super.c:1606 [inline]
 kill_f2fs_super+0x618/0x690 fs/f2fs/super.c:4932
 deactivate_locked_super+0xc1/0x130 fs/super.c:477
 mount_bdev+0x222/0x2d0 fs/super.c:1665
 legacy_get_tree+0xef/0x190 fs/fs_context.c:662
 vfs_get_tree+0x8c/0x2a0 fs/super.c:1784
 do_new_mount+0x2be/0xb40 fs/namespace.c:3352
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b
RIP: 0033:0x7fb05d646c7a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 5e 04 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffedf4214a8 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffedf4214c0 RCX: 00007fb05d646c7a
RDX: 00000000200000c0 RSI: 0000000020007f80 RDI: 00007ffedf4214c0
RBP: 0000000000000010 R08: 00007ffedf421500 R09: 0000000000007e73
R10: 0000000000000010 R11: 0000000000000286 R12: 0000000000000004
R13: 00007ffedf421500 R14: 0000000000000003 R15: 0000000001ee4e54
 </TASK>

Allocated by task 5046:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x70 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:372 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:389
 kasan_kmalloc include/linux/kasan.h:211 [inline]
 kmalloc_trace+0x1d6/0x360 mm/slub.c:4012
 kmalloc include/linux/slab.h:590 [inline]
 kzalloc include/linux/slab.h:711 [inline]
 f2fs_fill_super+0xce/0x8170 fs/f2fs/super.c:4397
 mount_bdev+0x206/0x2d0 fs/super.c:1663
 legacy_get_tree+0xef/0x190 fs/fs_context.c:662
 vfs_get_tree+0x8c/0x2a0 fs/super.c:1784
 do_new_mount+0x2be/0xb40 fs/namespace.c:3352
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

Freed by task 5046:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x70 mm/kasan/common.c:68
 kasan_save_free_info+0x4e/0x60 mm/kasan/generic.c:634
 poison_slab_object+0xa6/0xe0 mm/kasan/common.c:241
 __kasan_slab_free+0x34/0x60 mm/kasan/common.c:257
 kasan_slab_free include/linux/kasan.h:184 [inline]
 slab_free_hook mm/slub.c:2121 [inline]
 slab_free mm/slub.c:4299 [inline]
 kfree+0x14a/0x380 mm/slub.c:4409
 f2fs_fill_super+0x6b04/0x8170 fs/f2fs/super.c:4882
 mount_bdev+0x206/0x2d0 fs/super.c:1663
 legacy_get_tree+0xef/0x190 fs/fs_context.c:662
 vfs_get_tree+0x8c/0x2a0 fs/super.c:1784
 do_new_mount+0x2be/0xb40 fs/namespace.c:3352
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

The buggy address belongs to the object at ffff888023bdc000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 6012 bytes inside of
 freed 8192-byte region [ffff888023bdc000, ffff888023bde000)

The buggy address belongs to the physical page:
page:ffffea00008ef600 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x23bd8
head:ffffea00008ef600 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000840(slab|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffffff()
raw: 00fff00000000840 ffff888012c42280 0000000000000000 0000000000000001
raw: 0000000000000000 0000000080020002 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4713, tgid 4713 (start-stop-daem), ts 38918540171, free_ts 38307438771
 set_page_owner include/linux/page_owner.h:31 [inline]
 post_alloc_hook+0x1e6/0x210 mm/page_alloc.c:1533
 prep_new_page mm/page_alloc.c:1540 [inline]
 get_page_from_freelist+0x33ea/0x3570 mm/page_alloc.c:3311
 __alloc_pages+0x255/0x680 mm/page_alloc.c:4567
 __alloc_pages_node include/linux/gfp.h:238 [inline]
 alloc_pages_node include/linux/gfp.h:261 [inline]
 alloc_slab_page+0x5f/0x160 mm/slub.c:2190
 allocate_slab mm/slub.c:2354 [inline]
 new_slab+0x84/0x2f0 mm/slub.c:2407
 ___slab_alloc+0xd17/0x13d0 mm/slub.c:3540
 __slab_alloc mm/slub.c:3625 [inline]
 __slab_alloc_node mm/slub.c:3678 [inline]
 slab_alloc_node mm/slub.c:3850 [inline]
 kmalloc_trace+0x25d/0x360 mm/slub.c:4007
 kmalloc include/linux/slab.h:590 [inline]
 kzalloc include/linux/slab.h:711 [inline]
 tomoyo_print_bprm security/tomoyo/audit.c:26 [inline]
 tomoyo_init_log+0x11cd/0x2040 security/tomoyo/audit.c:264
 tomoyo_supervisor+0x386/0x11f0 security/tomoyo/common.c:2089
 tomoyo_audit_env_log security/tomoyo/environ.c:36 [inline]
 tomoyo_env_perm+0x178/0x210 security/tomoyo/environ.c:63
 tomoyo_environ security/tomoyo/domain.c:672 [inline]
 tomoyo_find_next_domain+0x1383/0x1cf0 security/tomoyo/domain.c:878
 tomoyo_bprm_check_security+0x114/0x170 security/tomoyo/tomoyo.c:102
 security_bprm_check+0x63/0xa0 security/security.c:1187
 search_binary_handler fs/exec.c:1725 [inline]
 exec_binprm fs/exec.c:1779 [inline]
 bprm_execve+0x95f/0x18a0 fs/exec.c:1854
 do_execveat_common+0x580/0x720 fs/exec.c:1962
 do_execve fs/exec.c:2036 [inline]
 __do_sys_execve fs/exec.c:2112 [inline]
 __se_sys_execve fs/exec.c:2107 [inline]
 __x64_sys_execve+0x92/0xa0 fs/exec.c:2107
page last free pid 4699 tgid 4699 stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1140 [inline]
 free_unref_page_prepare+0x959/0xa80 mm/page_alloc.c:2346
 free_unref_page+0x37/0x3f0 mm/page_alloc.c:2486
 discard_slab mm/slub.c:2453 [inline]
 __put_partials+0xeb/0x130 mm/slub.c:2922
 put_cpu_partial+0x17b/0x250 mm/slub.c:2997
 __slab_free+0x2fe/0x410 mm/slub.c:4166
 qlink_free mm/kasan/quarantine.c:160 [inline]
 qlist_free_all+0x6d/0xd0 mm/kasan/quarantine.c:176
 kasan_quarantine_reduce+0x14b/0x160 mm/kasan/quarantine.c:283
 __kasan_slab_alloc+0x23/0x70 mm/kasan/common.c:324
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slub.c:3813 [inline]
 slab_alloc_node mm/slub.c:3860 [inline]
 __do_kmalloc_node mm/slub.c:3980 [inline]
 __kmalloc+0x1dd/0x490 mm/slub.c:3994
 kmalloc include/linux/slab.h:594 [inline]
 tomoyo_add_entry security/tomoyo/common.c:2023 [inline]
 tomoyo_supervisor+0xe06/0x11f0 security/tomoyo/common.c:2095
 tomoyo_audit_net_log security/tomoyo/network.c:367 [inline]
 tomoyo_audit_unix_log security/tomoyo/network.c:406 [inline]
 tomoyo_unix_entry security/tomoyo/network.c:574 [inline]
 tomoyo_check_unix_address+0x59b/0x880 security/tomoyo/network.c:605
 tomoyo_socket_bind_permission+0x21c/0x340 security/tomoyo/network.c:744
 security_socket_bind+0x71/0xa0 security/security.c:4424
 __sys_bind+0x1ba/0x2e0 net/socket.c:1843
 __do_sys_bind net/socket.c:1858 [inline]
 __se_sys_bind net/socket.c:1856 [inline]
 __x64_sys_bind+0x7a/0x90 net/socket.c:1856
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x230 arch/x86/entry/common.c:83

Memory state around the buggy address:
 ffff888023bdd600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888023bdd680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888023bdd700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff888023bdd780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888023bdd800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
