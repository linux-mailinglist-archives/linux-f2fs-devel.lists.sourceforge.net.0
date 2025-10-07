Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E058FBC21F5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Oct 2025 18:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xFNaeC3rlA5/9JJvo50wSa6zsMQm5JhHXxpOuVrQ0pY=; b=KjM5S5ClbHoIBAyY9L14p1dwOm
	ngaKm1Wefvy0F7QiRORV1gFyaEgRvb3xLGatdW8qYPjcpYSa3Tu6s3Kn7rjA7gRukQTAF187UyRnW
	98muHbQSh2uVppvKe/pQrqm7gonmprwp726hZB3d0r1vHlNQauYozM7i7cMIBHVvohTc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6Ae2-0004TF-3g;
	Tue, 07 Oct 2025 16:34:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3EUHlaAkbAHYmsteUffYlUjjcX.aiiafYomYlWihnYhn.Wig@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1v6Ae0-0004Sx-2y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Oct 2025 16:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxCneZz9zHSpXS0Thh06erzTU2YOStwxJfkdZ/ivVt0=; b=S4Fq2PxEUcBw04MStpDesU0/Ee
 FRIFyiuwjdy7mMk0QmR9m3eVNW77uLmNgPUNMKiJVGebN1pGpQ45CRalIe0FByVmBJevoKTWHVwXp
 Cl9X+iwB048AhOFPmAoUbwrVw7dHEOKf3+w5f6qeeVuHnqQv+cZTPUVcIOk638o94HrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BxCneZz9zHSpXS0Thh06erzTU2YOStwxJfkdZ/ivVt0=; b=e
 eYmNh91caoSxTEoOrq+lAT52SdScVetBOaEWhUHSAOvJ914Fpy6XXAiwcWT6kRhzFJa38E0CB0MHs
 BEwgJFupDu/N7BM8ada39moMzIiYNFfvW/uEmuI7SgQNWZtKggOERmleMo4Bmky363J0d0oYWQ5bK
 wcVrP93Lv9Y3xS6s=;
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v6Adz-000189-LS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Oct 2025 16:34:32 +0000
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-919d48f1869so1529185739f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Oct 2025 09:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759854866; x=1760459666;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BxCneZz9zHSpXS0Thh06erzTU2YOStwxJfkdZ/ivVt0=;
 b=vMiLUhOdQz0TviGYM6jERj1HmFmJ4KInDZfoNuWG8x3hr00j0YT6KzKjRwNPRvGY5a
 OPXYtvYn+f+KcOS6gCjVD9yHDE4DnP3QNV6p6/GuJeWdJbm+UanMEGlnHsSXJSUjuwpg
 L29xutlFN6o5ZMYugGArwmVAiCutvynTeGag97zHHsEkoj8iMVZ9C+JFldYZgfBcmSOY
 zmweUPxz/CXxEzN0T8NYYK8tod4MdstusOWz29n+zgtwc/g3qZjXPNQwk38fRZZd0Gd1
 00Vr4LtFSw5wm5h8MrrKWQwHqt4ao5R4nTAw0oiyv3rnWEVKbDHr6SBrnXXBqQOmDP7/
 oP4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAkWlo/4FHsKtP+sal4CKKljiOZ9JcgDbKgXbSb5jOyLfqkXXY97CVe1P2N496EAEO56zM+dhQcAcXpilQSeGp@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwMyk33qVvbO4m2b3ZbuiLkbCb/9OAcnB57muxKrJoN25BTIVuy
 Cciu88Hr7jz4tDaX9DeRkgtzi1tvWdbEZxtlvPbVz2thcJV6H4y+7DjKRyIScHRuUgYZyZrYyCv
 +8bM6BMryaZirnK27koCGLIi6/bp87hDlp5c7KJuQO0DQLfrCwBt4hgRwWKA=
X-Google-Smtp-Source: AGHT+IECmnNG93Sg16BBWk0/HcXV7w3PBbLJ0VUE368vFL/PKWCVTqRMrjEhDRAt6hyBPj5eOWJhXiZcJ2sR9RQPwj/MEDEhV4ib
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2dcf:b0:93b:bb32:a2a5 with SMTP id
 ca18e2360f4ac-93bbb32a327mr1064496639f.17.1759854865944; Tue, 07 Oct 2025
 09:34:25 -0700 (PDT)
Date: Tue, 07 Oct 2025 09:34:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e54111.a00a0220.298cc0.047e.GAE@google.com>
From: syzbot <syzbot+635fba516c2c7858f799@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: ba9dac987319
 Merge tag 'libnvdimm-for-6.18' of git://git.k.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=122ab92f980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1v6Adz-000189-LS
Subject: [f2fs-dev] [syzbot] [f2fs?] BUG: sleeping function called from
 invalid context in f2fs_drop_inode
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

HEAD commit:    ba9dac987319 Merge tag 'libnvdimm-for-6.18' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=122ab92f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c1486b135ff0ff9b
dashboard link: https://syzkaller.appspot.com/bug?extid=635fba516c2c7858f799
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-ba9dac98.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d1fa0e7fa86d/vmlinux-ba9dac98.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fbfd63ebd788/bzImage-ba9dac98.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+635fba516c2c7858f799@syzkaller.appspotmail.com

BUG: sleeping function called from invalid context at fs/inode.c:1928
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 5328, name: syz.0.0
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
1 lock held by syz.0.0/5328:
 #0: ffff88801fcd9b80 (&sb->s_type->i_lock_key#35){+.+.}-{3:3}, at: spin_lock include/linux/spinlock.h:351 [inline]
 #0: ffff88801fcd9b80 (&sb->s_type->i_lock_key#35){+.+.}-{3:3}, at: f2fs_drop_inode+0x67e/0x950 fs/f2fs/super.c:1822
Preemption disabled at:
[<0000000000000000>] 0x0
CPU: 0 UID: 0 PID: 5328 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 __might_resched+0x495/0x610 kernel/sched/core.c:8925
 iput+0x2b/0xc50 fs/inode.c:1928
 f2fs_drop_inode+0x686/0x950 fs/f2fs/super.c:1823
 iput_final fs/inode.c:1884 [inline]
 iput+0x6d9/0xc50 fs/inode.c:1966
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 dput+0x19f/0x2b0 fs/dcache.c:911
 __fput+0x68e/0xa70 fs/file_table.c:476
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xe9/0x130 kernel/entry/common.c:43
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0xfa0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb96098eec9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd5e7bbf08 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007fb960be7da0 RCX: 00007fb96098eec9
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007fb960be7da0 R08: 0000000000018f14 R09: 000000125e7bc1ff
R10: 0000000000de6eb8 R11: 0000000000000246 R12: 0000000000015259
R13: 00007fb960be6090 R14: ffffffffffffffff R15: 00007ffd5e7bc020
 </TASK>
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5328 at fs/inode.c:1933 iput+0x38c/0xc50 fs/inode.c:1933
Modules linked in:
CPU: 0 UID: 0 PID: 5328 Comm: syz.0.0 Tainted: G        W           syzkaller #0 PREEMPT(full) 
Tainted: [W]=WARN
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:iput+0x38c/0xc50 fs/inode.c:1933
Code: 80 3d a0 88 49 0d 01 0f 85 b2 00 00 00 e8 4c 82 80 ff 4c 89 f7 be 10 00 00 00 e8 af 84 06 00 e9 2c fd ff ff e8 35 82 80 ff 90 <0f> 0b 90 e9 70 fd ff ff e8 27 82 80 ff 90 0f 0b 90 e9 d7 fe ff ff
RSP: 0018:ffffc9000d47fbb0 EFLAGS: 00010293
RAX: ffffffff823e919b RBX: 0000000000000001 RCX: ffff888000394900
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000001
RBP: ffff88801fcd9bb8 R08: ffffffff9297b047 R09: 1ffffffff252f608
R10: dffffc0000000000 R11: fffffbfff252f609 R12: ffff88801fcd9ce8
R13: dffffc0000000000 R14: ffff88801fcd9ae8 R15: 1ffffffff1f3c766
FS:  00005555645a1500(0000) GS:ffff88808d30c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb960bd75f0 CR3: 00000000127cb000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 f2fs_drop_inode+0x686/0x950 fs/f2fs/super.c:1823
 iput_final fs/inode.c:1884 [inline]
 iput+0x6d9/0xc50 fs/inode.c:1966
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 dput+0x19f/0x2b0 fs/dcache.c:911
 __fput+0x68e/0xa70 fs/file_table.c:476
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xe9/0x130 kernel/entry/common.c:43
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0xfa0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb96098eec9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd5e7bbf08 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007fb960be7da0 RCX: 00007fb96098eec9
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007fb960be7da0 R08: 0000000000018f14 R09: 000000125e7bc1ff
R10: 0000000000de6eb8 R11: 0000000000000246 R12: 0000000000015259
R13: 00007fb960be6090 R14: ffffffffffffffff R15: 00007ffd5e7bc020
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
