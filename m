Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD997813E3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Aug 2023 21:51:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qX5Va-0004kt-Vw;
	Fri, 18 Aug 2023 19:51:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qX5VZ-0004kj-Pq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Aug 2023 19:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RDbj00EoQ9tt6GPilGkc5/oSHaDs4tbWkS11hmkgmJ0=; b=cHAMrNlh7gYtAoCAVXvrghp8ER
 4UxPJkuOYZ/9OKuCQ8nsXUlG6ig8x1I9SlxvbhjfqMlLj84BrWuEaHhNeRsGvVhUrj5mcQs3n1at1
 P0yOm607UWEi83fl7xYGAFkREKPUCXGnyqGEEpU49kcMr/biJAhEn3zPqWWnIi2trSSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RDbj00EoQ9tt6GPilGkc5/oSHaDs4tbWkS11hmkgmJ0=; b=lEe6j17e+fYxmeu9qKrOLQT2MA
 91p4zaBQtcKdYEnjANZbPJaIuq5NJ18G9ycR6JBI/AHbRMjZdl5OlXctw8miKu+KKN6Qde4+0erjh
 +0B2mz/NdnL6gVmT3fCakGR4lTN6ncR6xfuMJ/gBLqJWQmrbxpF4Z4VHmahJuaOKBYBg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qX5VX-008yKd-PL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Aug 2023 19:51:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DBAD61E71;
 Fri, 18 Aug 2023 19:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699F3C433C7;
 Fri, 18 Aug 2023 19:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692388292;
 bh=HoOtSgniUSBX6Itb+CYcmDEGHCgM3gVlFPO7oTlh8Fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vue8ldVDx+hpirTPek6RuUG+wG9uEpTYJlFbJbBQntWPI6bJPf7viRE98H//WHxLs
 q4AHh8AJkgJKbab14a527SlDY7y2i8prXF17K3Cl5/mYf8nJyNqoNPAptTyARnvACo
 8Z8QttphQdSQ8aAPPq1m4be3s4qbTg/CHoAfN62lFaKCAQWspEBebbF56uAzYMrLSZ
 zKkyZavBZIhBHPy7vQK2+bHktn2BkJL5UtVV6k9CKD7BAvgut0pSb97rcBFgwVQ0oN
 8QixYSAHDvVNPB0nXv3va6FF2yAqiQFnE2XVM55bepB5uCpoXLOrRHsJlhbDNfscG7
 8qPSJL1nLIA5Q==
Date: Fri, 18 Aug 2023 12:51:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: syzbot <syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com>
Message-ID: <ZN/Lwr/Gg8n+vhw3@google.com>
References: <0000000000005921ef05ffddc3b7@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0000000000005921ef05ffddc3b7@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test: github.com/jaegeuk/f2fs/tree/g-dev-test g-dev-test
 On 07/06, syzbot wrote: > Hello, > > syzbot found the following issue on:
 > > HEAD commit: a452483508d7 Merge tag 's390-6.5-2' of git://git.kernel.or..
 > git tree: upstream > console output: https://s [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qX5VX-008yKd-PL
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in f2fs_getxattr
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
Cc: linux-fsdevel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz test: github.com/jaegeuk/f2fs/tree/g-dev-test g-dev-test

On 07/06, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a452483508d7 Merge tag 's390-6.5-2' of git://git.kernel.or..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=161917a0a80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=15873d91ff37a949
> dashboard link: https://syzkaller.appspot.com/bug?extid=e5600587fa9cbf8e3826
> compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5a4997524374/disk-a4524835.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/a0d32791e67c/vmlinux-a4524835.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/ff545ba23349/bzImage-a4524835.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com
> 
> F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
> F2FS-fs (loop0): Found nat_bits in checkpoint
> F2FS-fs (loop0): Try to recover 1th superblock, ret: 0
> F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.4.0-syzkaller-12155-ga452483508d7 #0 Not tainted
> ------------------------------------------------------
> syz-executor.0/5180 is trying to acquire lock:
> ffff88803c1b90a0 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
> ffff88803c1b90a0 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_getxattr+0xb8/0x1460 fs/f2fs/xattr.c:532
> 
> but task is already holding lock:
> ffff88803c0196d8 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
> ffff88803c0196d8 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_do_tmpfile+0x25/0x170 fs/f2fs/dir.c:838
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #1 (&fi->i_sem){+.+.}-{3:3}:
>        down_write+0x3a/0x50 kernel/locking/rwsem.c:1573
>        f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
>        f2fs_add_inline_entry+0x3a8/0x760 fs/f2fs/inline.c:644
>        f2fs_add_dentry+0xba/0x1e0 fs/f2fs/dir.c:784
>        f2fs_do_add_link+0x21e/0x340 fs/f2fs/dir.c:827
>        f2fs_add_link fs/f2fs/f2fs.h:3554 [inline]
>        f2fs_create+0x32c/0x530 fs/f2fs/namei.c:377
>        lookup_open fs/namei.c:3492 [inline]
>        open_last_lookups fs/namei.c:3560 [inline]
>        path_openat+0x13e7/0x3180 fs/namei.c:3790
>        do_filp_open+0x234/0x490 fs/namei.c:3820
>        do_sys_openat2+0x13e/0x1d0 fs/open.c:1407
>        do_sys_open fs/open.c:1422 [inline]
>        __do_sys_open fs/open.c:1430 [inline]
>        __se_sys_open fs/open.c:1426 [inline]
>        __x64_sys_open+0x225/0x270 fs/open.c:1426
>        do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>        do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> -> #0 (&fi->i_xattr_sem){.+.+}-{3:3}:
>        check_prev_add kernel/locking/lockdep.c:3142 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3261 [inline]
>        validate_chain kernel/locking/lockdep.c:3876 [inline]
>        __lock_acquire+0x39ff/0x7f70 kernel/locking/lockdep.c:5144
>        lock_acquire+0x1e3/0x520 kernel/locking/lockdep.c:5761
>        down_read+0x47/0x2f0 kernel/locking/rwsem.c:1520
>        f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
>        f2fs_getxattr+0xb8/0x1460 fs/f2fs/xattr.c:532
>        __f2fs_get_acl+0x52/0x8e0 fs/f2fs/acl.c:179
>        f2fs_acl_create fs/f2fs/acl.c:377 [inline]
>        f2fs_init_acl+0xd7/0x9a0 fs/f2fs/acl.c:420
>        f2fs_init_inode_metadata+0x824/0x1190 fs/f2fs/dir.c:558
>        f2fs_do_tmpfile+0x34/0x170 fs/f2fs/dir.c:839
>        __f2fs_tmpfile+0x1f9/0x380 fs/f2fs/namei.c:884
>        f2fs_ioc_start_atomic_write+0x4a3/0x9e0 fs/f2fs/file.c:2099
>        __f2fs_ioctl+0x1b5c/0xb770
>        vfs_ioctl fs/ioctl.c:51 [inline]
>        __do_sys_ioctl fs/ioctl.c:870 [inline]
>        __se_sys_ioctl+0xf8/0x170 fs/ioctl.c:856
>        do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>        do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> other info that might help us debug this:
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(&fi->i_sem);
>                                lock(&fi->i_xattr_sem);
>                                lock(&fi->i_sem);
>   rlock(&fi->i_xattr_sem);
> 
>  *** DEADLOCK ***
> 
> 5 locks held by syz-executor.0/5180:
>  #0: ffff888078fb2410 (sb_writers#16){.+.+}-{0:0}, at: mnt_want_write_file+0x61/0x200 fs/namespace.c:447
>  #1: ffff88803c018a28 (&sb->s_type->i_mutex_key#23){+.+.}-{3:3}, at: inode_lock include/linux/fs.h:771 [inline]
>  #1: ffff88803c018a28 (&sb->s_type->i_mutex_key#23){+.+.}-{3:3}, at: f2fs_ioc_start_atomic_write+0x1b2/0x9e0 fs/f2fs/file.c:2060
>  #2: ffff88803c019008 (&fi->i_gc_rwsem[WRITE]){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
>  #2: ffff88803c019008 (&fi->i_gc_rwsem[WRITE]){+.+.}-{3:3}, at: f2fs_ioc_start_atomic_write+0x276/0x9e0 fs/f2fs/file.c:2074
>  #3: ffff88802b7e03b0 (&sbi->cp_rwsem){.+.+}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
>  #3: ffff88802b7e03b0 (&sbi->cp_rwsem){.+.+}-{3:3}, at: f2fs_lock_op fs/f2fs/f2fs.h:2151 [inline]
>  #3: ffff88802b7e03b0 (&sbi->cp_rwsem){.+.+}-{3:3}, at: __f2fs_tmpfile+0x1ce/0x380 fs/f2fs/namei.c:879
>  #4: ffff88803c0196d8 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
>  #4: ffff88803c0196d8 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_do_tmpfile+0x25/0x170 fs/f2fs/dir.c:838
> 
> stack backtrace:
> CPU: 1 PID: 5180 Comm: syz-executor.0 Not tainted 6.4.0-syzkaller-12155-ga452483508d7 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
>  check_noncircular+0x375/0x4a0 kernel/locking/lockdep.c:2195
>  check_prev_add kernel/locking/lockdep.c:3142 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3261 [inline]
>  validate_chain kernel/locking/lockdep.c:3876 [inline]
>  __lock_acquire+0x39ff/0x7f70 kernel/locking/lockdep.c:5144
>  lock_acquire+0x1e3/0x520 kernel/locking/lockdep.c:5761
>  down_read+0x47/0x2f0 kernel/locking/rwsem.c:1520
>  f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
>  f2fs_getxattr+0xb8/0x1460 fs/f2fs/xattr.c:532
>  __f2fs_get_acl+0x52/0x8e0 fs/f2fs/acl.c:179
>  f2fs_acl_create fs/f2fs/acl.c:377 [inline]
>  f2fs_init_acl+0xd7/0x9a0 fs/f2fs/acl.c:420
>  f2fs_init_inode_metadata+0x824/0x1190 fs/f2fs/dir.c:558
>  f2fs_do_tmpfile+0x34/0x170 fs/f2fs/dir.c:839
>  __f2fs_tmpfile+0x1f9/0x380 fs/f2fs/namei.c:884
>  f2fs_ioc_start_atomic_write+0x4a3/0x9e0 fs/f2fs/file.c:2099
>  __f2fs_ioctl+0x1b5c/0xb770
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:870 [inline]
>  __se_sys_ioctl+0xf8/0x170 fs/ioctl.c:856
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7fc9e168c389
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fc9e2476168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007fc9e17abf80 RCX: 00007fc9e168c389
> RDX: 0000000000000000 RSI: 000000000000f501 RDI: 0000000000000005
> RBP: 00007fc9e16d7493 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007fffcc104f8f R14: 00007fc9e2476300 R15: 0000000000022000
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the bug is already fixed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to change bug's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the bug is a duplicate of another bug, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
