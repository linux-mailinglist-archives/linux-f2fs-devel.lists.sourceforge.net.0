Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D40B696CC5F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Sep 2024 03:48:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sm1bu-0003KI-MF;
	Thu, 05 Sep 2024 01:48:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sm1bu-0003KC-4P
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 01:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6jMRurBtysEchK4/Dg90e2vVJyHFwiWm64ACbmYTf28=; b=e6siJZsOWhA0MWCTLzfDoplEsJ
 9vvyiBakFQITL3xN626x5ZnGj+YV1KSk0sk++viSa25d1972sbi/zJ87GhcB1Nu4GYJbuUmY4G96q
 FnfIHl2w5E94qyO3eyLYHhUmifnlFnFuqzCmT1xbynzkdA/L08VYND6mHtLZi6zQ9Oxw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6jMRurBtysEchK4/Dg90e2vVJyHFwiWm64ACbmYTf28=; b=MZ6fLW5oddAl4PC5F0HaOntq/w
 f1+r2Crlp19+c5ttEQfIDA5LuuGKjyIyQTY/EPSLRuoX6OcjU5yxMxdzbW3WraoWk0ArFK64sJICF
 ZvArIlytret0l4SktGEz76z06QXEyoTd7q8PhGzCh8jj3dlf7FEW84kkFpH9AWRURUz8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sm1bs-0008Gl-JL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 01:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7F465C4B6A;
 Thu,  5 Sep 2024 01:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7784C4CEC9;
 Thu,  5 Sep 2024 01:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725500901;
 bh=kQQS/C3UUqrDEJUP8rfugi4K1dvCHH+BDTi4eVD5ZW8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=oOkhyNt+guXF/NzDiiVszJyEHybtrItyXhPEaFipkbw18iV6uM+wKDitwKbqeZLMN
 sEPI4V9JA8aDFyy6bIvgrdJNZ50sYeQ6JReFLWBeQ9vRw/Xy8G7Lw05JZacM9Xerbp
 P4IWZu9FfSo/3+PakOKNEPtR67FzkyEJZG03sc7svEnClkI8NN5erP+WxAy3XCBSLb
 PlqXXs9Ri93WBWx0gbDpWbbXyXAJtjn2C8Y5OqmaVCSoWI4oOFYCZ/7yoOrLcoQHHI
 z1dqCPq8OSyIMfFYQ/zeNFtjpzpr4OArnlB213mc4R89Mr9MP4dZ3lAFwFUXSk6XL6
 /2VcSAcl0qc8Q==
Message-ID: <63c5c38b-4824-4bca-9698-b0d746e9f22a@kernel.org>
Date: Thu, 5 Sep 2024 09:48:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+9aff3b6811f0a00daffa@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <000000000000f963fc061fc96998@google.com>
Content-Language: en-US
In-Reply-To: <000000000000f963fc061fc96998@google.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz invalid Becuase commit "f2fs: atomic: fix to not allow
 GC to pollute atomic_file" has been dropped from linux-next git repo. On
 2024/8/16 17:16, syzbot wrote: > Hello, > > syzbot found the following issue
 on: > > HEAD commit: 9e6869691724 Add linux-next specific files for 20240812
 > git tree: linux-next > console output: ht [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sm1bs-0008Gl-JL
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_release_file (2)
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz invalid

Becuase commit "f2fs: atomic: fix to not allow GC to pollute atomic_file" has
been dropped from linux-next git repo.

On 2024/8/16 17:16, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    9e6869691724 Add linux-next specific files for 20240812
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=1203caf3980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=61ba6f3b22ee5467
> dashboard link: https://syzkaller.appspot.com/bug?extid=9aff3b6811f0a00daffa
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/f1b086192f50/disk-9e686969.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b457920fb52e/vmlinux-9e686969.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/e63ba9cce98a/bzImage-9e686969.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9aff3b6811f0a00daffa@syzkaller.appspotmail.com
> 
> F2FS-fs (loop0): Try to recover 1th superblock, ret: 0
> F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
> syz.0.98: attempt to access beyond end of device
> loop0: rw=2049, sector=45096, nr_sectors = 8 limit=40427
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.11.0-rc3-next-20240812-syzkaller #0 Not tainted
> ------------------------------------------------------
> syz.0.98/5917 is trying to acquire lock:
> ffff88807896ad30 (&sb->s_type->i_mutex_key#26){++++}-{3:3}, at: inode_lock include/linux/fs.h:799 [inline]
> ffff88807896ad30 (&sb->s_type->i_mutex_key#26){++++}-{3:3}, at: f2fs_release_file+0x9b/0x100 fs/f2fs/file.c:1940
> 
> but task is already holding lock:
> ffff88807896b308 (&fi->i_gc_rwsem[WRITE]){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2196 [inline]
> ffff88807896b308 (&fi->i_gc_rwsem[WRITE]){++++}-{3:3}, at: f2fs_commit_atomic_write+0x105/0x1510 fs/f2fs/segment.c:388
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #1 (&fi->i_gc_rwsem[WRITE]){++++}-{3:3}:
>         lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5762
>         down_write+0x99/0x220 kernel/locking/rwsem.c:1579
>         f2fs_down_write fs/f2fs/f2fs.h:2196 [inline]
>         f2fs_setattr+0xb80/0x12d0 fs/f2fs/file.c:1060
>         notify_change+0xb9d/0xe70 fs/attr.c:535
>         do_truncate+0x220/0x310 fs/open.c:65
>         handle_truncate fs/namei.c:3395 [inline]
>         do_open fs/namei.c:3745 [inline]
>         path_openat+0x2ced/0x3470 fs/namei.c:3900
>         do_filp_open+0x235/0x490 fs/namei.c:3927
>         do_sys_openat2+0x13e/0x1d0 fs/open.c:1416
>         do_sys_open fs/open.c:1431 [inline]
>         __do_sys_creat fs/open.c:1507 [inline]
>         __se_sys_creat fs/open.c:1501 [inline]
>         __x64_sys_creat+0x123/0x170 fs/open.c:1501
>         do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>         do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>         entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> -> #0 (&sb->s_type->i_mutex_key#26){++++}-{3:3}:
>         check_prev_add kernel/locking/lockdep.c:3136 [inline]
>         check_prevs_add kernel/locking/lockdep.c:3255 [inline]
>         validate_chain+0x18e0/0x5900 kernel/locking/lockdep.c:3871
>         __lock_acquire+0x137a/0x2040 kernel/locking/lockdep.c:5145
>         lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5762
>         down_write+0x99/0x220 kernel/locking/rwsem.c:1579
>         inode_lock include/linux/fs.h:799 [inline]
>         f2fs_release_file+0x9b/0x100 fs/f2fs/file.c:1940
>         __fput+0x24a/0x8a0 fs/file_table.c:425
>         task_work_run+0x24f/0x310 kernel/task_work.c:228
>         get_signal+0x16ad/0x1810 kernel/signal.c:2690
>         arch_do_signal_or_restart+0x96/0x830 arch/x86/kernel/signal.c:337
>         exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
>         exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
>         __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
>         syscall_exit_to_user_mode+0xc9/0x370 kernel/entry/common.c:218
>         do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
>         entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> other info that might help us debug this:
> 
>   Possible unsafe locking scenario:
> 
>         CPU0                    CPU1
>         ----                    ----
>    lock(&fi->i_gc_rwsem[WRITE]);
>                                 lock(&sb->s_type->i_mutex_key#26);
>                                 lock(&fi->i_gc_rwsem[WRITE]);
>    lock(&sb->s_type->i_mutex_key#26);
> 
>   *** DEADLOCK ***
> 
> 1 lock held by syz.0.98/5917:
>   #0: ffff88807896b308 (&fi->i_gc_rwsem[WRITE]){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2196 [inline]
>   #0: ffff88807896b308 (&fi->i_gc_rwsem[WRITE]){++++}-{3:3}, at: f2fs_commit_atomic_write+0x105/0x1510 fs/f2fs/segment.c:388
> 
> stack backtrace:
> CPU: 0 UID: 0 PID: 5917 Comm: syz.0.98 Not tainted 6.11.0-rc3-next-20240812-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
>   check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2189
>   check_prev_add kernel/locking/lockdep.c:3136 [inline]
>   check_prevs_add kernel/locking/lockdep.c:3255 [inline]
>   validate_chain+0x18e0/0x5900 kernel/locking/lockdep.c:3871
>   __lock_acquire+0x137a/0x2040 kernel/locking/lockdep.c:5145
>   lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5762
>   down_write+0x99/0x220 kernel/locking/rwsem.c:1579
>   inode_lock include/linux/fs.h:799 [inline]
>   f2fs_release_file+0x9b/0x100 fs/f2fs/file.c:1940
>   __fput+0x24a/0x8a0 fs/file_table.c:425
>   task_work_run+0x24f/0x310 kernel/task_work.c:228
>   get_signal+0x16ad/0x1810 kernel/signal.c:2690
>   arch_do_signal_or_restart+0x96/0x830 arch/x86/kernel/signal.c:337
>   exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
>   exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
>   __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
>   syscall_exit_to_user_mode+0xc9/0x370 kernel/entry/common.c:218
>   do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f1c8c1779f9
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f1c8d01f038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: fffffffffffffffb RBX: 00007f1c8c305f80 RCX: 00007f1c8c1779f9
> RDX: 0000000000000000 RSI: 000000000000f502 RDI: 0000000000000004
> RBP: 00007f1c8c1e58ee R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000000 R14: 00007f1c8c305f80 R15: 00007ffdbf6238f8
>   </TASK>
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
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
