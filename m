Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8370A967
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 May 2023 18:59:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q0Pvk-0006fy-9j;
	Sat, 20 May 2023 16:59:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3a_toZAkbADAeklWMXXQdMbbUP.SaaSXQgeQdOaZfQZf.OaY@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1q0PrN-0005We-0e for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 May 2023 16:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iR+Mev6mqwJYOKc7k8OaTu9UD8vOFEdqohU0fITChcA=; b=mjWkjVdxiCAsRzuw+K/ABUYc0U
 hWf3WBm3WX34idaNJsoEXnKKE3M2NB3gmLrQc4E2teUGk+cTX+U25o9/5TOySxX7gEipGZTz+E01I
 ytMsiDaAY78rMb0IbXTV71m0bf8HkaoChG1xxyZnJirzOQZizkbCNOKDJFvkiLapeKkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iR+Mev6mqwJYOKc7k8OaTu9UD8vOFEdqohU0fITChcA=; b=h
 68m1FU7XL7JZvMXND3JKg6MLoK2QJAkxDCqjF5iRy99POPZQHOIg1YKOGSsX766Yt1hqIHCcBlasH
 1so6FBb9bQKhR4GqSbOLXjd4583zX2SeuOl++SJda4yUtvuOwFBnvtlIEDoROp+NAJUAENZP3QEAI
 Z2/3lWtgm56J55SU=;
Received: from mail-io1-f78.google.com ([209.85.166.78])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q0PrM-00EMlS-Ly for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 May 2023 16:55:13 +0000
Received: by mail-io1-f78.google.com with SMTP id
 ca18e2360f4ac-763c3442563so63680839f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 20 May 2023 09:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684601707; x=1687193707;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iR+Mev6mqwJYOKc7k8OaTu9UD8vOFEdqohU0fITChcA=;
 b=YMWi9yKDT2nFYgQjFYfFy8QjE72bSegO8F4lV99aHhHlWFHMLXK60Ai8PbgW3zXdau
 YOGNxAkzg1OqPFnIbUK3Jg1txCnGzh7bsWmhp0MfeqzRSpeeoicBWNRAwpAgzZ0Q4GR/
 0qwUqmCF+BLoE8L0K7pSlQ7zEsTHYhqiEgTvQdL3gM0/ysDzJrLM5VD76KbYS0hQ4D4n
 VoYdSFJ2XkNIi1FtuvPo2B10e4/00mb1lMkRnNr1SnHArTGBUW9t8h9Fzxcuc1HOH/7F
 EMc5R7wpGuHb7CgdDxPBtUuTtWJDvJzzjyIkMpAufF4Ozf0dhKYtcOFFuATvgw29mPW0
 wvZg==
X-Gm-Message-State: AC+VfDyHYcILAzjt0BksKLMsz00zxRvAjwrDYXsuJJq5It4F+XgHJ6+d
 GwUtp1T1IdB4vyxmmwBiMdc65bZxiaZXBuLk11XQphX0u+bD
X-Google-Smtp-Source: ACHHUZ7P72GS3ZpOe/xeExsK6LC3T14A1FN8ycKeUosRtvx1LZAsN0ujMYs/CXP496pUTNac0u+x3ZPI1lr5GRoFLTNuhkJih36l
MIME-Version: 1.0
X-Received: by 2002:a92:ce49:0:b0:331:4e48:32be with SMTP id
 a9-20020a92ce49000000b003314e4832bemr2825228ilr.4.1684601707056; Sat, 20 May
 2023 09:55:07 -0700 (PDT)
Date: Sat, 20 May 2023 09:55:07 -0700
In-Reply-To: <0000000000007c47b505f909f71d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000056580b05fc22e607@google.com>
From: syzbot <syzbot+d015b6c2fbb5c383bf08@syzkaller.appspotmail.com>
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
 HEAD commit: d635f6cc934b Merge tag 'drm-fixes-2023-05-20' of git://ano..
 git tree: upstream console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=177b7d29280000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.78 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q0PrM-00EMlS-Ly
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] general protection fault in
 __drop_extent_tree
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

HEAD commit:    d635f6cc934b Merge tag 'drm-fixes-2023-05-20' of git://ano..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=177b7d29280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bda401fa9c6b4502
dashboard link: https://syzkaller.appspot.com/bug?extid=d015b6c2fbb5c383bf08
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=157567a6280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13d301f9280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8dcff8d58d55/disk-d635f6cc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b0fda3221672/vmlinux-d635f6cc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9541aa11c888/bzImage-d635f6cc.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/7626bc33593c/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d015b6c2fbb5c383bf08@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000009: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000048-0x000000000000004f]
CPU: 1 PID: 5010 Comm: syz-executor252 Not tainted 6.4.0-rc2-syzkaller-00290-gd635f6cc934b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/28/2023
RIP: 0010:__lock_acquire+0x69/0x2000 kernel/locking/lockdep.c:4942
Code: df 0f b6 04 30 84 c0 0f 85 5a 16 00 00 83 3d d1 e1 ea 0c 00 0f 84 02 11 00 00 83 3d 70 33 74 0b 00 74 2b 4c 89 f0 48 c1 e8 03 <80> 3c 30 00 74 12 4c 89 f7 e8 59 38 78 00 48 be 00 00 00 00 00 fc
RSP: 0018:ffffc90003a6faf8 EFLAGS: 00010006
RAX: 0000000000000009 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 0000000000000048
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: dffffc0000000001 R12: 0000000000000001
R13: 0000000000000000 R14: 0000000000000048 R15: ffff88807d47d940
FS:  00007fcf413a3700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055664a01b058 CR3: 000000007ddb9000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire+0x1e3/0x520 kernel/locking/lockdep.c:5691
 __raw_write_lock include/linux/rwlock_api_smp.h:209 [inline]
 _raw_write_lock+0x2e/0x40 kernel/locking/spinlock.c:300
 __drop_extent_tree+0x3ac/0x660 fs/f2fs/extent_cache.c:1100
 f2fs_drop_extent_tree+0x17/0x30 fs/f2fs/extent_cache.c:1116
 f2fs_insert_range+0x2d5/0x3c0 fs/f2fs/file.c:1664
 f2fs_fallocate+0x4e4/0x6d0 fs/f2fs/file.c:1838
 vfs_fallocate+0x54b/0x6b0 fs/open.c:324
 ksys_fallocate fs/open.c:347 [inline]
 __do_sys_fallocate fs/open.c:355 [inline]
 __se_sys_fallocate fs/open.c:353 [inline]
 __x64_sys_fallocate+0xbd/0x100 fs/open.c:353
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fcf413f7459
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 41 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fcf413a32f8 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007fcf414817a0 RCX: 00007fcf413f7459
RDX: 0000000000000000 RSI: 0000000000000020 RDI: 0000000000000005
RBP: 00007fcf4144e7f8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000010000 R11: 0000000000000246 R12: 00007fcf4144e6c0
R13: 0030656c69662f2e R14: 4b55cd3db08b6c4e R15: 00007fcf414817a8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__lock_acquire+0x69/0x2000 kernel/locking/lockdep.c:4942
Code: df 0f b6 04 30 84 c0 0f 85 5a 16 00 00 83 3d d1 e1 ea 0c 00 0f 84 02 11 00 00 83 3d 70 33 74 0b 00 74 2b 4c 89 f0 48 c1 e8 03 <80> 3c 30 00 74 12 4c 89 f7 e8 59 38 78 00 48 be 00 00 00 00 00 fc
RSP: 0018:ffffc90003a6faf8 EFLAGS: 00010006
RAX: 0000000000000009 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 0000000000000048
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: dffffc0000000001 R12: 0000000000000001
R13: 0000000000000000 R14: 0000000000000048 R15: ffff88807d47d940
FS:  00007fcf413a3700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055664a01b058 CR3: 000000007ddb9000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	df 0f                	fisttps (%rdi)
   2:	b6 04                	mov    $0x4,%dh
   4:	30 84 c0 0f 85 5a 16 	xor    %al,0x165a850f(%rax,%rax,8)
   b:	00 00                	add    %al,(%rax)
   d:	83 3d d1 e1 ea 0c 00 	cmpl   $0x0,0xceae1d1(%rip)        # 0xceae1e5
  14:	0f 84 02 11 00 00    	je     0x111c
  1a:	83 3d 70 33 74 0b 00 	cmpl   $0x0,0xb743370(%rip)        # 0xb743391
  21:	74 2b                	je     0x4e
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1) <-- trapping instruction
  2e:	74 12                	je     0x42
  30:	4c 89 f7             	mov    %r14,%rdi
  33:	e8 59 38 78 00       	callq  0x783891
  38:	48                   	rex.W
  39:	be 00 00 00 00       	mov    $0x0,%esi
  3e:	00 fc                	add    %bh,%ah


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
