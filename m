Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7C741C9C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jun 2023 01:50:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qEev9-0007VD-No;
	Wed, 28 Jun 2023 23:50:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <398GcZAkbABoIOPA0BB4H0FF83.6EE6B4KI4H2EDJ4DJ.2EC@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qEev8-0007V6-14 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jun 2023 23:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=204g8cjo1gxXYSclnNAUMWrF8i0lTo+TqOMIY9rPY+E=; b=hiGAgmQ9Y3XbIOdn2LBogiE5PP
 tWOgPF5JNreriNy3Y/qMJ200ZmM0cTj5VqlSHnSTpErtQqJTvvWIFvytAi+q3tnY5RsPF+pHbqgnv
 gJ1lcvayf4cxstW02C9jMJL/tyDMfv8SMQYfbuWYWYHvXQS8ZTGPhcgEEcdlyRWKSj88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=204g8cjo1gxXYSclnNAUMWrF8i0lTo+TqOMIY9rPY+E=; b=k
 xNWK5tCEylVnTXU6qJmKWYDV0m2JDKEzi2ZuEVvZc+w9ObJiQxyG5EE6xXfbzZ9U1cQDdEf6JJ11v
 d4Vs9VzvGNosrrRYIEsUWCAr+d9v+d347RP7actH8JgrDUsiM8GJotXAo1dLxT7X6kstw4KyRsLIz
 uG8tp3WgWl6OTd8w=;
Received: from mail-oa1-f77.google.com ([209.85.160.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qEev6-0007Uo-Ms for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jun 2023 23:49:58 +0000
Received: by mail-oa1-f77.google.com with SMTP id
 586e51a60fabf-1ad52c741c1so150298fac.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Jun 2023 16:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687996191; x=1690588191;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=204g8cjo1gxXYSclnNAUMWrF8i0lTo+TqOMIY9rPY+E=;
 b=LiFg9+2j2UOLcZimwePEYOgOJzBhG21mvLf5UQ2zvLdn1vUzcHVPS/2hT2qkvusix/
 c+TAfqsKTqxFJLUNrM7s5KdICVRg35lKF9lhyrQR/L9/8bqvtg3g9sn7NJueAAWRa/g/
 RYhB5wYv1WuPyxYxTAqpNuo80353aANRBP/Q/Z5T1OVPh8PfOTCGwZ6xEwQ/hR/7HlSD
 q3WaWkKV/KdfkgevrcFAONLQnzIQBI92bQeq1Fw2EiZVK9F8g/cXBTXYGTTPfD6IaOOA
 YN+q7sBm1eIXZIYThVzbCClzsm48jlF49u8ntb/kOKnAozD09E0f7k20TndtN2IAMHFW
 1Ptw==
X-Gm-Message-State: AC+VfDze0IUd3BeKEFlPtAWZpBOXmHDw7W/9C6HxUI3qUgHVM2AERf4x
 9oE3N215GB/sdt1pn91lHlYzxZ5U1nAFnpffuTse9Kj82c/O
X-Google-Smtp-Source: ACHHUZ6KaC9MUmBiW25LUCCAeaphhMLl3bWt/UXVWuy02O42S6BwitXj9VfrZem3hFKgQ6gWHWmkZfK94nLBIS4Ax+fgtCC3FaGA
MIME-Version: 1.0
X-Received: by 2002:a05:6870:d799:b0:1ad:4a75:39b8 with SMTP id
 bd25-20020a056870d79900b001ad4a7539b8mr8952484oab.7.1687994871264; Wed, 28
 Jun 2023 16:27:51 -0700 (PDT)
Date: Wed, 28 Jun 2023 16:27:51 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000af3d3105ff38ee3c@google.com>
From: syzbot <syzbot+f4649be1be739e030111@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: a92b7d26c743
 Merge tag 'drm-fixes-2023-06-23' of git://ano.. git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=107e3e50a80000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.77 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.77 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qEev6-0007Uo-Ms
Subject: [f2fs-dev] [syzbot] [f2fs?] general protection fault in
 f2fs_drop_extent_tree
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

HEAD commit:    a92b7d26c743 Merge tag 'drm-fixes-2023-06-23' of git://ano..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=107e3e50a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2cbd298d0aff1140
dashboard link: https://syzkaller.appspot.com/bug?extid=f4649be1be739e030111
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1564afb0a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166928c7280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/53d1be238f30/disk-a92b7d26.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/04748ac79920/vmlinux-a92b7d26.xz
kernel image: https://storage.googleapis.com/syzbot-assets/78634d05a96b/bzImage-a92b7d26.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/dcc03ca9e012/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f4649be1be739e030111@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000009: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000048-0x000000000000004f]
CPU: 0 PID: 5015 Comm: syz-executor425 Not tainted 6.4.0-rc7-syzkaller-00226-ga92b7d26c743 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
RIP: 0010:__lock_acquire+0xe01/0x5f30 kernel/locking/lockdep.c:4956
Code: 00 00 3b 05 01 b0 59 0f 0f 87 7a 09 00 00 41 be 01 00 00 00 e9 84 00 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 0f 85 9e 33 00 00 49 81 3c 24 20 38 16 90 0f 84 cd f2
RSP: 0018:ffffc90003b6f9d8 EFLAGS: 00010016
RAX: dffffc0000000000 RBX: 1ffff9200076df6c RCX: 0000000000000000
RDX: 0000000000000009 RSI: 0000000000000000 RDI: 0000000000000048
RBP: ffff88802834d940 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000048
R13: 0000000000000000 R14: 0000000000000048 R15: 0000000000000000
FS:  00007f2b8ef07700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2b8efac0c8 CR3: 00000000235f8000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 lock_acquire kernel/locking/lockdep.c:5705 [inline]
 lock_acquire+0x1b1/0x520 kernel/locking/lockdep.c:5670
 __raw_write_lock include/linux/rwlock_api_smp.h:209 [inline]
 _raw_write_lock+0x2e/0x40 kernel/locking/spinlock.c:300
 __drop_extent_tree fs/f2fs/extent_cache.c:1100 [inline]
 f2fs_drop_extent_tree+0xf0/0x3a0 fs/f2fs/extent_cache.c:1116
 f2fs_insert_range fs/f2fs/file.c:1664 [inline]
 f2fs_fallocate+0xce5/0x36d0 fs/f2fs/file.c:1838
 vfs_fallocate+0x48b/0xe40 fs/open.c:324
 ksys_fallocate fs/open.c:347 [inline]
 __do_sys_fallocate fs/open.c:355 [inline]
 __se_sys_fallocate fs/open.c:353 [inline]
 __x64_sys_fallocate+0xd3/0x140 fs/open.c:353
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f2b8ef5b459
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 41 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2b8ef072f8 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007f2b8efe57a0 RCX: 00007f2b8ef5b459
RDX: 0000000000000000 RSI: 0000000000000020 RDI: 0000000000000005
RBP: 00007f2b8efb27f8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000010000 R11: 0000000000000246 R12: 00007f2b8efb26c0
R13: 0030656c69662f2e R14: 4b55cd3db08b6c4e R15: 00007f2b8efe57a8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__lock_acquire+0xe01/0x5f30 kernel/locking/lockdep.c:4956
Code: 00 00 3b 05 01 b0 59 0f 0f 87 7a 09 00 00 41 be 01 00 00 00 e9 84 00 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 0f 85 9e 33 00 00 49 81 3c 24 20 38 16 90 0f 84 cd f2
RSP: 0018:ffffc90003b6f9d8 EFLAGS: 00010016
RAX: dffffc0000000000 RBX: 1ffff9200076df6c RCX: 0000000000000000
RDX: 0000000000000009 RSI: 0000000000000000 RDI: 0000000000000048
RBP: ffff88802834d940 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000048
R13: 0000000000000000 R14: 0000000000000048 R15: 0000000000000000
FS:  00007f2b8ef07700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2b8efac0c8 CR3: 00000000235f8000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	3b 05 01 b0 59 0f    	cmp    0xf59b001(%rip),%eax        # 0xf59b009
   8:	0f 87 7a 09 00 00    	ja     0x988
   e:	41 be 01 00 00 00    	mov    $0x1,%r14d
  14:	e9 84 00 00 00       	jmpq   0x9d
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	4c 89 e2             	mov    %r12,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 9e 33 00 00    	jne    0x33d2
  34:	49 81 3c 24 20 38 16 	cmpq   $0xffffffff90163820,(%r12)
  3b:	90
  3c:	0f                   	.byte 0xf
  3d:	84 cd                	test   %cl,%ch
  3f:	f2                   	repnz


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
