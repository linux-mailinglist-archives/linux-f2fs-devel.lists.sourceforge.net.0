Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF5874A9E3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jul 2023 06:23:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHczh-0000Vx-6c;
	Fri, 07 Jul 2023 04:22:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3yoynZAkbAK0flmXNYYReNccVQ.TbbTYRhfRePbagRag.PbZ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qHczX-0000VT-BV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jul 2023 04:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cD9gzy9rGVKFy/FcC9kmlxQffo/fkPLst1u8NEodE3k=; b=B1+v72/fr0Am+eU7O9JR6/VTej
 8xn/zZyUQ/YAO9rKULbBBqZ9Mx/6biZclNQH00JxEav9ttULLqdSLuUTs/pwY+A3j3kcckjKIqJHy
 TikwIil1F2tGkFufVcBh6nxpCehbh4n76NHlum9GYmFJWP4MHCahdw/foDfMTa2xaKg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cD9gzy9rGVKFy/FcC9kmlxQffo/fkPLst1u8NEodE3k=; b=A
 JpVcJI2HAJRuG+z5QIGqJWkCIIpMBqW2VDUCfEWxFpsGqrUWSQEcelZUlfwItH71kp+YsSkxwyi+U
 HISWVuB9TXW2+Us69HITS1PEvdGpPxZyEDmgixsjlORjIWkf3ED2ruZEUBSupglDAAgIHhGjPARkw
 cHVn09avt6IdyLcY=;
Received: from mail-il1-f207.google.com ([209.85.166.207])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qHczT-000KV2-8Z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jul 2023 04:22:47 +0000
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-3461839c3f6so6790045ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 06 Jul 2023 21:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688703754; x=1691295754;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cD9gzy9rGVKFy/FcC9kmlxQffo/fkPLst1u8NEodE3k=;
 b=W5reVR7IZED4/YBSzX7cO4i189p02mu0Qg6dywCf39iCiwEbV/0BFxN2eCQfMxu0FJ
 f+vaRPMYTGv/atGmmdNg8XpEkFwIBe28mRA2GtlXDj1XG9o+kxOISVbh8qdZozbn6hDM
 S8korpW69CbAT0LCb0aNQb1iGKb/6oguJU3wp7fPh5BaA44QQYLPWbg0doOTVniBEBnY
 vRUS4aFLLWvbxC7MH1Chjrzp7742LnJheRr8uWvoGAv/LnT0FsZQwKPU09kJIdiKwy1E
 EObEYygOeJ5lJjhQYLN64aLoilhDupumNWpY/U9uDrvppnHRsBZ7JnimZOD36F8oBR/w
 xLiQ==
X-Gm-Message-State: ABy/qLZXHGLzpkMY+IjKXAmsbCpeMCpBO8WaGsgaBc7gykr3VgYezkK9
 zb8eyGJpN2ElUYqitrrX9CdzTWAnA+jRamXwf3nOs4FlXUe/
X-Google-Smtp-Source: APBJJlHKOzNRftPB9LBFJ6v4vTr5R+EAJbb+41b4DuvAXdBCLMYbWAlFNqQ0yum6P35IeUPZ+eFZWrr8+nkATuhC3ce58u0Wr9ym
MIME-Version: 1.0
X-Received: by 2002:a17:903:41c2:b0:1b5:61d3:dae5 with SMTP id
 u2-20020a17090341c200b001b561d3dae5mr3866473ple.1.1688702154641; Thu, 06 Jul
 2023 20:55:54 -0700 (PDT)
Date: Thu, 06 Jul 2023 20:55:54 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000f188605ffdd9cf8@google.com>
From: syzbot <syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 296d53d8f84c
 Add linux-next specific files for 20230703 git tree: linux-next
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=1742e724a80000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.207 listed in list.dnswl.org]
X-Headers-End: 1qHczT-000KV2-8Z
Subject: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_add_inline_entry
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

Hello,

syzbot found the following issue on:

HEAD commit:    296d53d8f84c Add linux-next specific files for 20230703
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1742e724a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5241eb40bbf2c7cf
dashboard link: https://syzkaller.appspot.com/bug?extid=a4976ce949df66b1ddf1
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17030110a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12a2f1f0a80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/86f91798abf1/disk-296d53d8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/80ef8a306265/vmlinux-296d53d8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d2faf52c9a84/bzImage-296d53d8.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/a912111147f7/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com

F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
======================================================
WARNING: possible circular locking dependency detected
6.4.0-next-20230703-syzkaller #0 Not tainted
------------------------------------------------------
syz-executor218/5030 is trying to acquire lock:
ffff8880752cb160 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
ffff8880752cb160 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_add_inline_entry+0x2c4/0x6c0 fs/f2fs/inline.c:644

but task is already holding lock:
ffff8880752c9978 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
ffff8880752c9978 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_add_dentry+0x92/0x240 fs/f2fs/dir.c:783

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&fi->i_xattr_sem){.+.+}-{3:3}:
       down_read+0x9c/0x480 kernel/locking/rwsem.c:1520
       f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
       f2fs_getxattr+0xb96/0xfd0 fs/f2fs/xattr.c:532
       __f2fs_get_acl+0x59/0x610 fs/f2fs/acl.c:179
       f2fs_acl_create fs/f2fs/acl.c:377 [inline]
       f2fs_init_acl+0x152/0xb40 fs/f2fs/acl.c:420
       f2fs_init_inode_metadata+0x15d/0x1260 fs/f2fs/dir.c:558
       f2fs_add_regular_entry+0x776/0xb70 fs/f2fs/dir.c:740
       f2fs_add_dentry+0x1e1/0x240 fs/f2fs/dir.c:788
       f2fs_do_add_link+0x183/0x270 fs/f2fs/dir.c:827
       f2fs_add_link fs/f2fs/f2fs.h:3554 [inline]
       f2fs_mkdir+0x387/0x630 fs/f2fs/namei.c:781
       vfs_mkdir+0x242/0x460 fs/namei.c:4117
       do_mkdirat+0x28d/0x310 fs/namei.c:4140
       __do_sys_mkdir fs/namei.c:4160 [inline]
       __se_sys_mkdir fs/namei.c:4158 [inline]
       __x64_sys_mkdir+0xf6/0x140 fs/namei.c:4158
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&fi->i_sem){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3142 [inline]
       check_prevs_add kernel/locking/lockdep.c:3261 [inline]
       validate_chain kernel/locking/lockdep.c:3876 [inline]
       __lock_acquire+0x2e9d/0x5e20 kernel/locking/lockdep.c:5144
       lock_acquire kernel/locking/lockdep.c:5761 [inline]
       lock_acquire+0x1b1/0x520 kernel/locking/lockdep.c:5726
       down_write+0x92/0x200 kernel/locking/rwsem.c:1573
       f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
       f2fs_add_inline_entry+0x2c4/0x6c0 fs/f2fs/inline.c:644
       f2fs_add_dentry+0xa6/0x240 fs/f2fs/dir.c:784
       f2fs_do_add_link+0x183/0x270 fs/f2fs/dir.c:827
       f2fs_add_link fs/f2fs/f2fs.h:3554 [inline]
       f2fs_mkdir+0x387/0x630 fs/f2fs/namei.c:781
       vfs_mkdir+0x242/0x460 fs/namei.c:4117
       ovl_do_mkdir fs/overlayfs/overlayfs.h:196 [inline]
       ovl_mkdir_real+0xbc/0x390 fs/overlayfs/dir.c:146
       ovl_workdir_create+0x3d2/0x900 fs/overlayfs/super.c:309
       ovl_make_workdir fs/overlayfs/super.c:711 [inline]
       ovl_get_workdir fs/overlayfs/super.c:864 [inline]
       ovl_fill_super+0xcb6/0x5c90 fs/overlayfs/super.c:1400
       vfs_get_super+0xea/0x280 fs/super.c:1152
       vfs_get_tree+0x8d/0x350 fs/super.c:1519
       do_new_mount fs/namespace.c:3335 [inline]
       path_mount+0x136e/0x1e70 fs/namespace.c:3662
       do_mount fs/namespace.c:3675 [inline]
       __do_sys_mount fs/namespace.c:3884 [inline]
       __se_sys_mount fs/namespace.c:3861 [inline]
       __x64_sys_mount+0x283/0x300 fs/namespace.c:3861
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(&fi->i_xattr_sem);
                               lock(&fi->i_sem);
                               lock(&fi->i_xattr_sem);
  lock(&fi->i_sem);

 *** DEADLOCK ***

5 locks held by syz-executor218/5030:
 #0: ffff8880780d60e0 (&type->s_umount_key#42/1){+.+.}-{3:3}, at: alloc_super+0x22e/0xb40 fs/super.c:228
 #1: ffff8880271d6410 (sb_writers#9){.+.+}-{0:0}, at: ovl_make_workdir fs/overlayfs/super.c:707 [inline]
 #1: ffff8880271d6410 (sb_writers#9){.+.+}-{0:0}, at: ovl_get_workdir fs/overlayfs/super.c:864 [inline]
 #1: ffff8880271d6410 (sb_writers#9){.+.+}-{0:0}, at: ovl_fill_super+0xc8d/0x5c90 fs/overlayfs/super.c:1400
 #2: ffff8880752c9300 (&type->i_mutex_dir_key#6/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:806 [inline]
 #2: ffff8880752c9300 (&type->i_mutex_dir_key#6/1){+.+.}-{3:3}, at: ovl_workdir_create+0x137/0x900 fs/overlayfs/super.c:281
 #3: ffff8880786603b0 (&sbi->cp_rwsem){.+.+}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
 #3: ffff8880786603b0 (&sbi->cp_rwsem){.+.+}-{3:3}, at: f2fs_lock_op fs/f2fs/f2fs.h:2151 [inline]
 #3: ffff8880786603b0 (&sbi->cp_rwsem){.+.+}-{3:3}, at: f2fs_mkdir+0x2a2/0x630 fs/f2fs/namei.c:780
 #4: ffff8880752c9978 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
 #4: ffff8880752c9978 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_add_dentry+0x92/0x240 fs/f2fs/dir.c:783

stack backtrace:
CPU: 0 PID: 5030 Comm: syz-executor218 Not tainted 6.4.0-next-20230703-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
 check_noncircular+0x2df/0x3b0 kernel/locking/lockdep.c:2195
 check_prev_add kernel/locking/lockdep.c:3142 [inline]
 check_prevs_add kernel/locking/lockdep.c:3261 [inline]
 validate_chain kernel/locking/lockdep.c:3876 [inline]
 __lock_acquire+0x2e9d/0x5e20 kernel/locking/lockdep.c:5144
 lock_acquire kernel/locking/lockdep.c:5761 [inline]
 lock_acquire+0x1b1/0x520 kernel/locking/lockdep.c:5726
 down_write+0x92/0x200 kernel/locking/rwsem.c:1573
 f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
 f2fs_add_inline_entry+0x2c4/0x6c0 fs/f2fs/inline.c:644
 f2fs_add_dentry+0xa6/0x240 fs/f2fs/dir.c:784
 f2fs_do_add_link+0x183/0x270 fs/f2fs/dir.c:827
 f2fs_add_link fs/f2fs/f2fs.h:3554 [inline]
 f2fs_mkdir+0x387/0x630 fs/f2fs/namei.c:781
 vfs_mkdir+0x242/0x460 fs/namei.c:4117
 ovl_do_mkdir fs/overlayfs/overlayfs.h:196 [inline]
 ovl_mkdir_real+0xbc/0x390 fs/overlayfs/dir.c:146
 ovl_workdir_create+0x3d2/0x900 fs/overlayfs/super.c:309
 ovl_make_workdir fs/overlayfs/super.c:711 [inline]
 ovl_get_workdir fs/overlayfs/super.c:864 [inline]
 ovl_fill_super+0xcb6/0x5c90 fs/overlayfs/super.c:1400
 vfs_get_super+0xea/0x280 fs/super.c:1152
 vfs_get_tree+0x8d/0x350 fs/super.c:1519
 do_new_mount fs/namespace.c:3335 [inline]
 path_mount+0x136e/0x1e70 fs/namespace.c:3662
 do_mount fs/namespace.c:3675 [inline]
 __do_sys_mount fs/namespace.c:3884 [inline]
 __se_sys_mount fs/namespace.c:3861 [inline]
 __x64_sys_mount+0x283/0x300 fs/namespace.c:3861
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f0b7b784909
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcdf3d7158 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0030656c69662f2e RCX: 00007f0b7b784909
RDX: 0000000020000280 RSI: 0000000020000040 RDI: 0000000000000000
RBP: 00007f0b7b7441a0 R08: 0000000020000180 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f0b7b744230
R13: 0000000


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
