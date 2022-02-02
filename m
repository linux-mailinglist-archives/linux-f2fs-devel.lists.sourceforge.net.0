Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBA64A71A1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Feb 2022 14:34:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFFmO-00081C-1a; Wed, 02 Feb 2022 13:34:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <3Yoj6YQkbAHMjpqbRccViRggZU.XffXcVljViTfekVek.Tfd@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1nFFmM-000815-LI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Feb 2022 13:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M/1U34ctxQMX21VtCVIOgMUTNahM5kENFa1u7AsdCkA=; b=ZFeaNLrpL6MDClhG2R38SCRLjR
 RwrbrH7CKr0qbJLVyylFgByDrZarJJBrxhXQblZY+JAQbdvljR6VcLDgOakxzlCU0Ps+mRy661iIh
 FGna9GFVv5aqj2DjPb7vr+8b9JSTkszLxnt0tXrfDQb7Gc7jSzlVA/NA3652LnU+nB88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M/1U34ctxQMX21VtCVIOgMUTNahM5kENFa1u7AsdCkA=; b=e
 SHrGcK3SGPWX54nJv+VsM492add+Wb/0HpMZwZR7fu+cy3B2ReJVSX0365FE6GUxOLUqvz50HpVdx
 WSfA2JhSlVtJFvnd5NjwlaQ87pGkGmvXA++Ou2Lmwsn9uORlopABOq6XVp2ENIBXm7in7t10/ec0v
 RX9Eg8qW5r6bTPtI=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nFFmK-0003GS-GL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Feb 2022 13:34:33 +0000
Received: by mail-io1-f71.google.com with SMTP id
 o189-20020a6bbec6000000b00604e5f63337so15130208iof.15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Feb 2022 05:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=M/1U34ctxQMX21VtCVIOgMUTNahM5kENFa1u7AsdCkA=;
 b=TzTGU1EVCfL7tXDkelZ+UcMon3ambksFRRIHmt1KB/UcHLdE8rz1wTjGgnQn6xXX/N
 yMxamaPuA1GBVNEQuPRdHUEdlKL+dquFAOi+l2t7/BFjBndjaLGnFiUM3Rkmc28bTBfD
 AhciNb3las5YPz/jvJInDqR7rh9wkEuWvFXTH2kpjhomT/+UZd1fBGaMsrGHz+/OwqVj
 29ZrQRsTATZZtLxBU7aoiOSUq9XbkrkShQ0V+hBJEImlv13rc/LPOTAfl1nS/Axx3UFH
 6l+ani5tEc2hR1r3IVjl8S/c0pruCkFG+4BCtXSw+wqZNm/I04CsHKPUiOWByNMwo8aM
 CGcA==
X-Gm-Message-State: AOAM5304SwpwZFjaaKtwYDubJzWpFVBHzUlqSmGGZ9bkA/Do3ycA6CTo
 wS1Fq3j+qd98tIHy+gu1AxxCxJioQJ7e/8lUbY/FfMeht7FI
X-Google-Smtp-Source: ABdhPJyLHgAj/KO2NHeKvgZuC8ezewLfPM7CY9TzyTf9FkCrjGv1rdn0Y+v2GPPgymn2hTqj07SjfrFJv91Ddn1Padf2Sr8y3eqb
MIME-Version: 1.0
X-Received: by 2002:a5d:884f:: with SMTP id t15mr16410337ios.198.1643808866941; 
 Wed, 02 Feb 2022 05:34:26 -0800 (PST)
Date: Wed, 02 Feb 2022 05:34:26 -0800
In-Reply-To: <0000000000004cede805d58728c3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000097bd8005d7091347@google.com>
From: syzbot <syzbot+0b9cadf5fc45a98a5083@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 6abab1b81b65 Add linux-next specific files for 20220202 git tree:
 linux-next console output:
 https://syzkaller.appspot.com/x/log.txt?x=178ef35bb00000
 kernel config: https://syzkaller.apps [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nFFmK-0003GS-GL
Subject: Re: [f2fs-dev] [syzbot] possible deadlock in f2fs_write_checkpoint
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

HEAD commit:    6abab1b81b65 Add linux-next specific files for 20220202
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=178ef35bb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b8d8750556896349
dashboard link: https://syzkaller.appspot.com/bug?extid=0b9cadf5fc45a98a5083
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=150341d4700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15649300700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0b9cadf5fc45a98a5083@syzkaller.appspotmail.com

F2FS-fs (loop0): Can't find valid F2FS filesystem in 2th superblock
F2FS-fs (loop0): invalid crc_offset: 0
F2FS-fs (loop0): Disable nat_bits due to incorrect cp_ver (8221872453892455638, 0)
F2FS-fs (loop0): Try to recover 2th superblock, ret: 0
F2FS-fs (loop0): Mounted with checkpoint version = 7ad43cd6
============================================
WARNING: possible recursive locking detected
5.17.0-rc2-next-20220202-syzkaller #0 Not tainted
--------------------------------------------
syz-executor316/3595 is trying to acquire lock:
ffff88801d514390 (&sem->internal_rwsem#2){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2156 [inline]
ffff88801d514390 (&sem->internal_rwsem#2){++++}-{3:3}, at: f2fs_write_checkpoint+0x535/0x5c90 fs/f2fs/checkpoint.c:1616

but task is already holding lock:
ffff88801d515398 (&sem->internal_rwsem#2){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2156 [inline]
ffff88801d515398 (&sem->internal_rwsem#2){++++}-{3:3}, at: f2fs_issue_checkpoint+0x149/0x480 fs/f2fs/checkpoint.c:1835

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&sem->internal_rwsem#2);
  lock(&sem->internal_rwsem#2);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

2 locks held by syz-executor316/3595:
 #0: ffff888074db00e0 (&type->s_umount_key#46){+.+.}-{3:3}, at: deactivate_super+0xa5/0xd0 fs/super.c:362
 #1: ffff88801d515398 (&sem->internal_rwsem#2){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2156 [inline]
 #1: ffff88801d515398 (&sem->internal_rwsem#2){++++}-{3:3}, at: f2fs_issue_checkpoint+0x149/0x480 fs/f2fs/checkpoint.c:1835

stack backtrace:
CPU: 0 PID: 3595 Comm: syz-executor316 Not tainted 5.17.0-rc2-next-20220202-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_deadlock_bug kernel/locking/lockdep.c:2956 [inline]
 check_deadlock kernel/locking/lockdep.c:2999 [inline]
 validate_chain kernel/locking/lockdep.c:3788 [inline]
 __lock_acquire.cold+0x149/0x3ab kernel/locking/lockdep.c:5027
 lock_acquire kernel/locking/lockdep.c:5639 [inline]
 lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5604
 down_write+0x90/0x150 kernel/locking/rwsem.c:1514
 f2fs_down_write fs/f2fs/f2fs.h:2156 [inline]
 f2fs_write_checkpoint+0x535/0x5c90 fs/f2fs/checkpoint.c:1616
 __write_checkpoint_sync fs/f2fs/checkpoint.c:1746 [inline]
 f2fs_issue_checkpoint+0x156/0x480 fs/f2fs/checkpoint.c:1843
 f2fs_sync_fs+0x20f/0x420 fs/f2fs/super.c:1644
 sync_filesystem.part.0+0x13c/0x1d0 fs/sync.c:66
 sync_filesystem+0x8b/0xc0 fs/sync.c:43
 generic_shutdown_super+0x70/0x400 fs/super.c:445
 kill_block_super+0x97/0xf0 fs/super.c:1394
 kill_f2fs_super+0x2b3/0x3c0 fs/f2fs/super.c:4523
 deactivate_locked_super+0x94/0x160 fs/super.c:332
 deactivate_super+0xad/0xd0 fs/super.c:363
 cleanup_mnt+0x3a2/0x540 fs/namespace.c:1159
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 exit_task_work include/linux/task_work.h:32 [inline]
 do_exit+0xb29/0x2b10 kernel/exit.c:806
 do_group_exit+0xd2/0x2f0 kernel/exit.c:935
 __do_sys_exit_group kernel/exit.c:946 [inline]
 __se_sys_exit_group kernel/exit.c:944 [inline]
 __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:944
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f93b7998639
Code: Unable to access opcode bytes at RIP 0x7f93b799860f.
RSP: 002b:00007fffe1dc7708 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f93b7a0d3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
