Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E006DD2F4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 08:36:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pm7bq-0007gc-In;
	Tue, 11 Apr 2023 06:36:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3xP80ZAkbAL8x34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pm7bg-0007gK-UF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 06:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MWBfGC8qUn5cdld8DfvyB++HgPa+SWhqOK3mDeu+k4o=; b=lLh87ndWabpq5aVWhMa7bFgXZ+
 6Fvq1QzVBEBXgK10THEFI+DDX2WV5GucDjFN662WrsykGo0IByV9g346UCoshhM8IOMRtRLG/ac9q
 TGtg6Oj0CZroo3zUGmyJYZ183xMydVxde8IWMDsPKdcqzwSccIIwrrIyAN6qROqNh6kk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MWBfGC8qUn5cdld8DfvyB++HgPa+SWhqOK3mDeu+k4o=; b=I
 7AYkTTEA3U8Y9iIccTv3tPWg0VJUzw13pHsaitOZ9WW6d6zBQuY/9vASmTJb2eJJsvKnuMtNFyYkC
 kHfwCW/ahxEjHSmpnnnrcIdCuA5S3U1uJ50kR60+KWSS2knbib/SHu7nS3pt67qbknIabtXOHXDK7
 IzQRr9y61ihfdSE4=;
Received: from mail-io1-f79.google.com ([209.85.166.79])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pm7bd-003o3r-Ut for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 06:35:55 +0000
Received: by mail-io1-f79.google.com with SMTP id
 c2-20020a6bcc02000000b0075c4c68b5d3so1343431iog.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 23:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681194948; x=1683786948;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MWBfGC8qUn5cdld8DfvyB++HgPa+SWhqOK3mDeu+k4o=;
 b=VCsy55pvZ/dLt8fCyM1VpKmBTNEqeLvcuaQd9HWJ4SluUhgnQOW+2iJ3BdzXoOCdQw
 6D3XzeIpG3wAlfiuVX0z2ZoGVzf+PTdGDTxxpneLNH1IVzemTeEHyxTTB68NTR37Inwd
 AlL9A3UYRg7YATUDXWu6wsFdQnw1eZjBEPG0QFyfDhTNcmIZAWY/8gP/xPnarFbwLm2Z
 E6i+ySMl1DOo/VXsSzo4BdESUQksAq95Fr6RT90UgEQMR8j1+cZUP17y6qzRn/lXhaZK
 T0sdtBhJgQ/ITeYI2l4wc2SL/Z8nz03xbFVNtmkAejMSAz472B9+QiUDKTwAo0lh0P8t
 h6Wg==
X-Gm-Message-State: AAQBX9eQE/nAeIQ4RTd6B2kR+yDHhnUgQ0ZTpT7iqsYpuDj/PuwjKGCf
 +ZKkuKsstJsqA6sh2LA4P4p0nE3Yp0rxe6IOvPegiibIA+EI
X-Google-Smtp-Source: AKy350bEeigu1zU8GTZHFwnwbbpO7b7Fa+obU8bmiVRRBKmtbn0P5ggmhv5h0/R7YIubfbfAqNdvBGfD3UFSTULmvkl02C89Dybm
MIME-Version: 1.0
X-Received: by 2002:a02:29c9:0:b0:40b:bd5e:7e2e with SMTP id
 p192-20020a0229c9000000b0040bbd5e7e2emr3163779jap.6.1681194948352; Mon, 10
 Apr 2023 23:35:48 -0700 (PDT)
Date: Mon, 10 Apr 2023 23:35:48 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b1e3f505f909b306@google.com>
From: syzbot <syzbot+4420fa19a8667ff0b057@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 99ddf2254feb
 Merge tag 'trace-v6.3-rc5' of git://git.kerne.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=157372b5c80000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.79 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.79 listed in list.dnswl.org]
X-Headers-End: 1pm7bd-003o3r-Ut
Subject: [f2fs-dev] [syzbot] [f2fs?] general protection fault in
 __replace_atomic_write_block
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

HEAD commit:    99ddf2254feb Merge tag 'trace-v6.3-rc5' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=157372b5c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5666fa6aca264e42
dashboard link: https://syzkaller.appspot.com/bug?extid=4420fa19a8667ff0b057
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/907a43450c5c/disk-99ddf225.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a142637e5396/vmlinux-99ddf225.xz
kernel image: https://storage.googleapis.com/syzbot-assets/447736ad6200/bzImage-99ddf225.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4420fa19a8667ff0b057@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 PID: 10867 Comm: syz-executor.1 Not tainted 6.3.0-rc5-syzkaller-00032-g99ddf2254feb #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/30/2023
RIP: 0010:__replace_atomic_write_block+0xf6b/0x1b40 fs/f2fs/segment.c:260
Code: 98 20 06 00 00 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 e4 40 10 fe 4c 8b 33 48 8b 54 24 40 48 89 d0 48 c1 e8 03 <42> 0f b6 04 38 84 c0 0f 85 ff 02 00 00 44 8b 3a 0f 1f 44 00 00 e8
RSP: 0018:ffffc9001575f5a0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888036d63b90 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc9001575f6d8
RBP: ffffc9001575f790 R08: dffffc0000000000 R09: ffffc9001575f6c8
R10: 0000000000000000 R11: dffffc0000000001 R12: 1ffff92002aebeda
R13: ffffc9001575f6c0 R14: ffff888036d62c88 R15: dffffc0000000000
FS:  00007f035f153700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1ce021a000 CR3: 000000002a4e8000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __complete_revoke_list fs/f2fs/segment.c:273 [inline]
 __f2fs_commit_atomic_write fs/f2fs/segment.c:363 [inline]
 f2fs_commit_atomic_write+0x1342/0x15e0 fs/f2fs/segment.c:381
 f2fs_ioc_commit_atomic_write fs/f2fs/file.c:2165 [inline]
 __f2fs_ioctl+0x3a5e/0xb5b0 fs/f2fs/file.c:4169
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f035e48c169
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f035f153168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f035e5ac120 RCX: 00007f035e48c169
RDX: 0000000000000000 RSI: 000000000000f502 RDI: 0000000000000007
RBP: 00007f035e4e7ca1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc598c6e9f R14: 00007f035f153300 R15: 0000000000022000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__replace_atomic_write_block+0xf6b/0x1b40 fs/f2fs/segment.c:260
Code: 98 20 06 00 00 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 e4 40 10 fe 4c 8b 33 48 8b 54 24 40 48 89 d0 48 c1 e8 03 <42> 0f b6 04 38 84 c0 0f 85 ff 02 00 00 44 8b 3a 0f 1f 44 00 00 e8
RSP: 0018:ffffc9001575f5a0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888036d63b90 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc9001575f6d8
RBP: ffffc9001575f790 R08: dffffc0000000000 R09: ffffc9001575f6c8
R10: 0000000000000000 R11: dffffc0000000001 R12: 1ffff92002aebeda
R13: ffffc9001575f6c0 R14: ffff888036d62c88 R15: dffffc0000000000
FS:  00007f035f153700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005555556ff848 CR3: 000000002a4e8000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	98                   	cwtl
   1:	20 06                	and    %al,(%rsi)
   3:	00 00                	add    %al,(%rax)
   5:	48 89 d8             	mov    %rbx,%rax
   8:	48 c1 e8 03          	shr    $0x3,%rax
   c:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
  11:	74 08                	je     0x1b
  13:	48 89 df             	mov    %rbx,%rdi
  16:	e8 e4 40 10 fe       	callq  0xfe1040ff
  1b:	4c 8b 33             	mov    (%rbx),%r14
  1e:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
  23:	48 89 d0             	mov    %rdx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 ff 02 00 00    	jne    0x336
  37:	44 8b 3a             	mov    (%rdx),%r15d
  3a:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  3f:	e8                   	.byte 0xe8


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
