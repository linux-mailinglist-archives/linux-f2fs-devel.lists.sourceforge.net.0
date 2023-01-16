Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D8B66B701
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jan 2023 06:56:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHITP-0004jC-F6;
	Mon, 16 Jan 2023 05:55:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <35ubEYwkbAOsflmXNYYReNccVQ.TbbTYRhfRePbagRag.PbZ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pHITN-0004j2-Pj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 05:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Neb0M9m1wuS/EiJZKNK8tyTuZyiCOJ+/j+azaSqhRls=; b=KRcNJ9zLd+2RTEOGCAJo+qxbSb
 Z6Kyp7hr3kl2ek9XC1zIt4g2QkU09+a+BBphNlmdmeKF1b4+Mkk9lBs/WCj6WPUH+mHRqRxs5AUI4
 JsVKmvjNx2khQiMopT9Y+jTqpQl3hYq4gPbPLdh/fhARhy2R88Zf2MdcVMeYkM42ZHBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Neb0M9m1wuS/EiJZKNK8tyTuZyiCOJ+/j+azaSqhRls=; b=B
 60ARQwX2mW4WRigB8UN72qZr+nIcmz2frbVyM9U/AJnkjvT5s62PLBibvfCFKG8IXNfxWAeG7iosw
 1oVHa4jLHvhF5GuZ9n0F+gRMqh7qkOlhDuoq3GTRckCSGG1lZMqCv5Ihl+c3DkIPXl/3Yj5bPBCUL
 mX0NDB4SHNSvbLko=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pHITL-005PEN-LB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 05:55:56 +0000
Received: by mail-io1-f72.google.com with SMTP id
 h17-20020a5d9e11000000b007049a892316so3526964ioh.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 15 Jan 2023 21:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Neb0M9m1wuS/EiJZKNK8tyTuZyiCOJ+/j+azaSqhRls=;
 b=J58VaXBeChbGAUtJtq5yyZcHmIp6vuEcMHE+ueR6auiBqR/NgiM0izsIrAjqe1kkKd
 8mbY9F9KG0K+eHazrkwx6brJoD55o8fazuPWsoU8En7fBvVq37mjSa0Nd+RUIx8o8C2c
 uOqNGulufZKy9shlCf9sryqbVa3NLMRW5ZdkEDY6AQRYQLiciLq5ZzcUboPaSvuS8LAz
 neQAHQTgwTuEQpqRw4sDxTENSDKdewEu8W4um1tlkMA8pMSk1xtfH7weg2l1oX3Z048W
 r7H8sto0+gYUAD8A1u3b8ier7IgAk3mnblaKbnhdoSyol9mkLF35uHco/FM26pDJqa/n
 2uuw==
X-Gm-Message-State: AFqh2krCBQViPlwxo4zTl/fF6SH8LmiM5pA54DgKxBtpotCH+gx3HTkA
 gMOnQdfDSrhSkAE9fjKAS0fREXD7IIGMl67e0gsM2QYshfxF
X-Google-Smtp-Source: AMrXdXuY6j0pIfj/op015EDT3XMTEE1KPDhSOnmOINBlGwf8rd77Zae3Fd9SY0PUzKGdBWgDB/Lqv8CnhQ6l1esLbjvFWhn1GYkH
MIME-Version: 1.0
X-Received: by 2002:a92:1a0b:0:b0:30d:8f68:cd9 with SMTP id
 a11-20020a921a0b000000b0030d8f680cd9mr4810898ila.274.1673848550134; Sun, 15
 Jan 2023 21:55:50 -0800 (PST)
Date: Sun, 15 Jan 2023 21:55:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003d19f805f25b3c71@google.com>
From: syzbot <syzbot+15d87e3695975269de2c@syzkaller.appspotmail.com>
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
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 5a41237ad1d4
 gcc: disable -Warray-bounds for gcc-11 too git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=11ffa85a480000 kernel config:
 https://syzkaller.appspo [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
X-Headers-End: 1pHITL-005PEN-LB
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in __destroy_extent_tree
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

HEAD commit:    5a41237ad1d4 gcc: disable -Warray-bounds for gcc-11 too
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11ffa85a480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2b6ecad960fc703e
dashboard link: https://syzkaller.appspot.com/bug?extid=15d87e3695975269de2c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+15d87e3695975269de2c@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/extent_cache.c:1191!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 3 PID: 7706 Comm: syz-executor.3 Not tainted 6.2.0-rc3-syzkaller-00009-g5a41237ad1d4 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
RIP: 0010:__destroy_extent_tree+0x64a/0x7f0 fs/f2fs/extent_cache.c:1191
Code: 04 00 00 00 49 8d 9c 07 e8 0c 00 00 48 89 df e8 fc 00 22 fe f0 ff 03 48 8b 3c 24 e8 20 1c 5b 06 e9 93 fc ff ff e8 a6 fa d3 fd <0f> 0b e8 9f fa d3 fd e8 6a 1f 59 06 31 ff 89 c3 89 c6 e8 3f f7 d3
RSP: 0018:ffffc90027ee79c0 EFLAGS: 00010246
RAX: 0000000000040000 RBX: 0000000000000000 RCX: ffffc90007712000
RDX: 0000000000040000 RSI: ffffffff83ad57ba RDI: 0000000000000005
RBP: ffff8880754b0000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: ffff888044fd2000 R14: 0000000000000001 R15: ffff8880700e4000
FS:  0000000000000000(0000) GS:ffff88802c900000(0063) knlGS:00000000f7fa4b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00007f2dd53c836b CR3: 000000006d4f3000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_destroy_extent_tree+0x17/0x30 fs/f2fs/extent_cache.c:1204
 f2fs_evict_inode+0x38b/0x1df0 fs/f2fs/inode.c:789
 evict+0x2ed/0x6b0 fs/inode.c:664
 iput_final fs/inode.c:1747 [inline]
 iput.part.0+0x59b/0x880 fs/inode.c:1773
 iput+0x5c/0x80 fs/inode.c:1763
 f2fs_abort_atomic_write+0xea/0x4f0 fs/f2fs/segment.c:196
 f2fs_release_file+0xc8/0xf0 fs/f2fs/file.c:1869
 __fput+0x27c/0xa90 fs/file_table.c:320
 task_work_run+0x16f/0x270 kernel/task_work.c:179
 get_signal+0x1c7/0x2450 kernel/signal.c:2635
 arch_do_signal_or_restart+0x79/0x5c0 arch/x86/kernel/signal.c:306
 exit_to_user_mode_loop kernel/entry/common.c:168 [inline]
 exit_to_user_mode_prepare+0x15f/0x250 kernel/entry/common.c:203
 __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
 syscall_exit_to_user_mode+0x1d/0x50 kernel/entry/common.c:296
 __do_fast_syscall_32+0x72/0xf0 arch/x86/entry/common.c:181
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x70/0x82
RIP: 0023:0xf7fa9549
Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
RSP: 002b:00000000f7fa45cc EFLAGS: 00000296 ORIG_RAX: 00000000000000bb
RAX: 00000000002dc7fb RBX: 0000000000000004 RCX: 0000000000000005
RDX: 0000000000000000 RSI: 0000000001000fc4 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000296 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__destroy_extent_tree+0x64a/0x7f0 fs/f2fs/extent_cache.c:1191
Code: 04 00 00 00 49 8d 9c 07 e8 0c 00 00 48 89 df e8 fc 00 22 fe f0 ff 03 48 8b 3c 24 e8 20 1c 5b 06 e9 93 fc ff ff e8 a6 fa d3 fd <0f> 0b e8 9f fa d3 fd e8 6a 1f 59 06 31 ff 89 c3 89 c6 e8 3f f7 d3
RSP: 0018:ffffc90027ee79c0 EFLAGS: 00010246
RAX: 0000000000040000 RBX: 0000000000000000 RCX: ffffc90007712000
RDX: 0000000000040000 RSI: ffffffff83ad57ba RDI: 0000000000000005
RBP: ffff8880754b0000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: ffff888044fd2000 R14: 0000000000000001 R15: ffff8880700e4000
FS:  0000000000000000(0000) GS:ffff88802c900000(0063) knlGS:00000000f7fa4b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00007f2dd53c836b CR3: 000000006d4f3000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	03 74 c0 01          	add    0x1(%rax,%rax,8),%esi
   4:	10 05 03 74 b8 01    	adc    %al,0x1b87403(%rip)        # 0x1b8740d
   a:	10 06                	adc    %al,(%rsi)
   c:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
  10:	10 07                	adc    %al,(%rdi)
  12:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
  16:	10 08                	adc    %cl,(%rax)
  18:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
  1c:	00 00                	add    %al,(%rax)
  1e:	00 00                	add    %al,(%rax)
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
* 2a:	5d                   	pop    %rbp <-- trapping instruction
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	retq
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
