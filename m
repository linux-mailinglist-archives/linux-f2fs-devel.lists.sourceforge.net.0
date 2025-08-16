Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3CAB28A3E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Aug 2025 05:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pmorLkOHiYYcarSI50x61t+aSXWF7Q1jsHQolaQqNX0=; b=DIx3Z6x0zgC14Q6LbsVZ0Vj1Tf
	mMNGu9IWzKu3WRwghCHNEqhBsHwgooXgDqfeKNjYrdU7S4lx2z53zSgt0yvlqNMQYcw6Cv98T2sJg
	JsBgKLf6n0WUVQcme1e1z9/odPwVqVw7SCfAPOWgrYbBhzZwdSsuT3XgRkGHUY/7r/EY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1un7RX-0006De-RN;
	Sat, 16 Aug 2025 03:18:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3ififaAkbAEY067sittmzixxql.owwotm20mzkwv1mv1.kwu@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1un7RP-0006DS-8C for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Aug 2025 03:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qTS0YG+WjR/K90OTphXPqWiWegdcs5FpL33ZQpVQSSo=; b=IQuG15IYyULcCyphRYdfwIKZ5w
 MyNOOhQg2y+Tq2Ly5ad9L4euHmyEJIbpxPYOppiwWr3ZSJbrpRWeENdj8C3vjFW1y7CvZUzwXkFiz
 6JtHmGmmXk9ReDVw2XFxTj2oGxH+eFkkaJZiMZg+rLZ3eVx6zWqbZkkEy+VhgQ8MDjto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qTS0YG+WjR/K90OTphXPqWiWegdcs5FpL33ZQpVQSSo=; b=c
 5Yjxs+Lwi2p18UET3Q9+dxeCbT/7I7mwIyzqfm19gMzvXskjIMN2xRquwR9M7bDIKpau5wszW0d2m
 JjIR6qa8+ouUiLeCk8jdMbli7a8mAXEnXWeJzbw0zDIx3PwUPeYdkoev2bmnTILurW3V7LezJQNJP
 NFNqkbwFNzoI4lUc=;
Received: from mail-il1-f206.google.com ([209.85.166.206])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1un7RO-0003dB-8p for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Aug 2025 03:18:47 +0000
Received: by mail-il1-f206.google.com with SMTP id
 e9e14a558f8ab-3e580be9806so12272165ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 20:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755314313; x=1755919113;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qTS0YG+WjR/K90OTphXPqWiWegdcs5FpL33ZQpVQSSo=;
 b=hQm8mzqERUXOaBw4Ub+lgAKAvndFN5XM4/sMMVIR33EnsyjXkHx0D22TEl345umeth
 Nf3qcH5MRJyED5PXk6sw5/VLi+cY74sBvFMWsXI1j0suy5Z3rEPsI6FkNvcezApjdOki
 qjdMmtWqzcHh5DhzRTkgJY1BrVGxvrMgx1P0iNnXgDPkiyRhyoatUi8p30TeHWGWNxWt
 VPCsJYUQRPbEho2s+OdcPXVhZ2NOKe5PX4U6D0FMMIrzO93UDJLa264LHtGiPUj1E3Xn
 J3jrG6wYbh9CEIiS+XRWg7HHz7mledqmBQHkshGML0N8gEspg4Jv3QdXzpgY78ZFSUC6
 5h6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdE1TOSWxSN1dT5xzTN5KEcOMYjegL+TODpVOnrJx0GtJn20ze/ngZmj/yx5+oxBPmaLKXW8ivZD6Cxjc0/OH2@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw7Zvi83XfgS+ibbD/v5KGnESJJBslbKcQOpS3h3XsLBex3WTb+
 XDPZXK/9A6xy6ru8HynrJLsn98nF+C1rmdpqVwHfsxHDNn30oZgve1DYz6MWTr1rzeZp03L6sCS
 63MlINBGNftabawRs4NrKWNMfKdny73j4RkZ46+iO2625KbyONGL0c1dDo/E=
X-Google-Smtp-Source: AGHT+IHO14K/pxFu46JpzUszf2OR8j9ZNyNWhTgYR+wxmKSgPWHIr5SfnDGRc/4t7FrWSdArG/jvforGFCQ6u63+a5NRYlNsHk0F
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a85:b0:3e5:408b:b748 with SMTP id
 e9e14a558f8ab-3e57e9c1adbmr76275335ab.16.1755314313343; Fri, 15 Aug 2025
 20:18:33 -0700 (PDT)
Date: Fri, 15 Aug 2025 20:18:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <689ff889.050a0220.e29e5.0037.GAE@google.com>
From: syzbot <syzbot+d371efea57d5aeab877b@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 sandeen@redhat.com, syzkaller-bugs@googlegroups.com
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 0e39a731820a
 Merge tag 'for-6.17-rc1-tag' of git://git.ker.. git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=13344da2580000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (2.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1un7RO-0003dB-8p
Subject: [f2fs-dev] [syzbot] [f2fs?] general protection fault in
 f2fs_check_opt_consistency
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

HEAD commit:    0e39a731820a Merge tag 'for-6.17-rc1-tag' of git://git.ker..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13344da2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=13f39c6a0380a209
dashboard link: https://syzkaller.appspot.com/bug?extid=d371efea57d5aeab877b
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12c22c34580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a125a2580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e0297ec5b8e1/disk-0e39a731.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0396bfd57e65/vmlinux-0e39a731.xz
kernel image: https://storage.googleapis.com/syzbot-assets/68482d381f43/bzImage-0e39a731.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f909676ebee0/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=15344da2580000)

The issue was bisected to:

commit d185351325237da688de006a2c579e82ea97bdfe
Author: Hongbo Li <lihongbo22@huawei.com>
Date:   Thu Jul 10 12:14:13 2025 +0000

    f2fs: separate the options parsing and options checking

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=137ca5a2580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10fca5a2580000
console output: https://syzkaller.appspot.com/x/log.txt?x=177ca5a2580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d371efea57d5aeab877b@syzkaller.appspotmail.com
Fixes: d18535132523 ("f2fs: separate the options parsing and options checking")

F2FS-fs (loop0): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
Oops: gen[  107.736417][ T5848] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 5848 Comm: syz-executor263 Tainted: G        W           6.17.0-rc1-syzkaller-00014-g0e39a731820a #0 PREEMPT_{RT,(full)} 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
RIP: 0010:strcmp+0x3c/0xc0 lib/string.c:284
Code: 00 fc ff df 45 31 f6 4a 8d 04 37 48 89 c1 48 c1 e9 03 0f b6 0c 19 84 c9 75 2c 42 0f b6 2c 37 4a 8d 04 36 48 89 c1 48 c1 e9 03 <0f> b6 0c 19 84 c9 75 33 42 0f b6 0c 36 40 38 cd 75 48 49 ff c6 40
RSP: 0018:ffffc90004adf8f8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 0000000021ec2c00 RSI: 0000000000000000 RDI: ffff888021ec2c80
RBP: 0000000000000066 R08: 0000000000000000 R09: 0000000000000000
R10: ffff88803d2c9768 R11: ffffed1007a592fb R12: 1ffff1100611a891
R13: 0000000000000000 R14: 0000000000000000 R15: ffff888021ec2c80
FS:  0000555575c20480(0000) GS:ffff8881269c5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001000 CR3: 000000003d342000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 f2fs_check_quota_consistency fs/f2fs/super.c:1188 [inline]
 f2fs_check_opt_consistency+0x1378/0x2c10 fs/f2fs/super.c:1436
 __f2fs_remount fs/f2fs/super.c:2653 [inline]
 f2fs_reconfigure+0x482/0x1770 fs/f2fs/super.c:5297
 reconfigure_super+0x224/0x890 fs/super.c:1077
 do_remount fs/namespace.c:3314 [inline]
 path_mount+0xd18/0xfe0 fs/namespace.c:4112
 do_mount fs/namespace.c:4133 [inline]
 __do_sys_mount fs/namespace.c:4344 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4321
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f13267ca259
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff3d15d4a8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f13267ca259
RDX: 0000000000000000 RSI: 0000200000000040 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000200000000140 R09: 00007fff3d15d4e0
R10: 0000000000000020 R11: 0000000000000246 R12: 00007fff3d15d4e0
R13: 00007fff3d15d768 R14: 431bde82d7b634db R15: 00007f132681303b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:strcmp+0x3c/0xc0 lib/string.c:284
Code: 00 fc ff df 45 31 f6 4a 8d 04 37 48 89 c1 48 c1 e9 03 0f b6 0c 19 84 c9 75 2c 42 0f b6 2c 37 4a 8d 04 36 48 89 c1 48 c1 e9 03 <0f> b6 0c 19 84 c9 75 33 42 0f b6 0c 36 40 38 cd 75 48 49 ff c6 40
RSP: 0018:ffffc90004adf8f8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 0000000021ec2c00 RSI: 0000000000000000 RDI: ffff888021ec2c80
RBP: 0000000000000066 R08: 0000000000000000 R09: 0000000000000000
R10: ffff88803d2c9768 R11: ffffed1007a592fb R12: 1ffff1100611a891
R13: 0000000000000000 R14: 0000000000000000 R15: ffff888021ec2c80
FS:  0000555575c20480(0000) GS:ffff8881268c5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000003d342000 CR4: 00000000003526f0
----------------
Code disassembly (best guess), 4 bytes skipped:
   0:	45 31 f6             	xor    %r14d,%r14d
   3:	4a 8d 04 37          	lea    (%rdi,%r14,1),%rax
   7:	48 89 c1             	mov    %rax,%rcx
   a:	48 c1 e9 03          	shr    $0x3,%rcx
   e:	0f b6 0c 19          	movzbl (%rcx,%rbx,1),%ecx
  12:	84 c9                	test   %cl,%cl
  14:	75 2c                	jne    0x42
  16:	42 0f b6 2c 37       	movzbl (%rdi,%r14,1),%ebp
  1b:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
  1f:	48 89 c1             	mov    %rax,%rcx
  22:	48 c1 e9 03          	shr    $0x3,%rcx
* 26:	0f b6 0c 19          	movzbl (%rcx,%rbx,1),%ecx <-- trapping instruction
  2a:	84 c9                	test   %cl,%cl
  2c:	75 33                	jne    0x61
  2e:	42 0f b6 0c 36       	movzbl (%rsi,%r14,1),%ecx
  33:	40 38 cd             	cmp    %cl,%bpl
  36:	75 48                	jne    0x80
  38:	49 ff c6             	inc    %r14
  3b:	40                   	rex


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

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
