Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A669855F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 21:16:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSOCG-0003L7-PH;
	Wed, 15 Feb 2023 20:16:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3fj3tYwkbANMHNO9zAA3GzEE72.5DD5A3JH3G1DCI3CI.1DB@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pSOCF-0003L1-OZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 20:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aGJcTiHWrNKcFZ/FgYQDSHGLDwlxXSUlxi8IsS9UpjM=; b=Y2i8NwikhZ3LK3aCRclfYsV88P
 25f/smwfi4qs4TtVvAw/3NOZJ+rgtpJxk44Z0P6bj/J5GFWpOdoJenTrNRut0S83VtG1vcwcc0pSK
 0Xgo1rMICrzItTfN1tA1/quA9ajl+8e3TI7zbq8XKIQl23tAIR+UfPZdJdmjPNKCPgjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aGJcTiHWrNKcFZ/FgYQDSHGLDwlxXSUlxi8IsS9UpjM=; b=L
 vWY2ZxSOE+NCerMuBJsu+q15WVz3XJFwQmD48O1jH1qfspO//cEe/ie0rO7xkZQ0w/5n8e1mRwkbY
 vW1Bk85ncTmaXMFHELaEMrlXNwSYmmLJa2ivxZJuxDyF138Jz+VCiOkZTSVTGEN6RXnXIINQmueCK
 HcfFhX+MGDZqIK7s=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pSOCA-000570-Tt for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 20:16:07 +0000
Received: by mail-il1-f208.google.com with SMTP id
 n18-20020a056e02101200b0030f2b79c2ffso12578ilj.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Feb 2023 12:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aGJcTiHWrNKcFZ/FgYQDSHGLDwlxXSUlxi8IsS9UpjM=;
 b=aFUBZj2Q7j8sZ/8iSlEJDxIv4ots65AskLE6GQ+LSuU948ZYVI1oTRqaXqN2zZVkmH
 g+bQUmzxTU2hnFGvO4DaqCcFEiLQvtnoc8PtWP2hyt7LPdyoJrKTIaeDXLF4Z01jAOiG
 gfqueuLUGJeTZDZu1jlAqTQLJrdK9MA6SFedz1Q3ng/pT8xdvT/pDl6A9tO1PECV+Zmp
 GNddESjM3hd9FaMuiDvZKz+0VmXBMsq450cEgLVWna8IK+5wiOEcxdm0Zd+pvxgU8Cax
 kyi8bYdwB9DWyyjzLiJVOrXPic/hPGNmCDSM/ssrpT/FFLqLtNpKoJuWVwhKwH+WILQC
 GT1w==
X-Gm-Message-State: AO0yUKWjgU3SH0OyF4qIizVOVNvJJZHeNwvb5sgp4xqvt4uUwFn34bRt
 IgcgvKwlDEhB5u97tWLGoKBJ65OGaJeRB4YOF2IWKRM0qAXM
X-Google-Smtp-Source: AK7set86i67dgAHYMXiQrl4jCFk5zyk/kVFx65aTW8VBAM0Flhxmc4ILyIoNouAVn2FLO0hKbWr+idG8IS0MjFFGK8gUMP3Dj/2m
MIME-Version: 1.0
X-Received: by 2002:a5e:c009:0:b0:73b:1230:331c with SMTP id
 u9-20020a5ec009000000b0073b1230331cmr1063621iol.98.1676492158111; Wed, 15 Feb
 2023 12:15:58 -0800 (PST)
Date: Wed, 15 Feb 2023 12:15:58 -0800
In-Reply-To: <000000000000a8c57205f1450921@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008d9bd305f4c2bf45@google.com>
From: syzbot <syzbot+9b7be0f1263ed2dbfbba@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: e1c04510f521 Merge tag 'pm-6.2-rc9' of git://git.kernel.or..
 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=172c6577480000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.208 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1pSOCA-000570-Tt
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in
 f2fs_abort_atomic_write
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

HEAD commit:    e1c04510f521 Merge tag 'pm-6.2-rc9' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=172c6577480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8d9381ac81f4ac15
dashboard link: https://syzkaller.appspot.com/bug?extid=9b7be0f1263ed2dbfbba
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138e3977480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c3d836334e11/disk-e1c04510.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4cab8c36cdb8/vmlinux-e1c04510.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7f796941fe64/bzImage-e1c04510.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/d6504ac6876e/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9b7be0f1263ed2dbfbba@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/inode.c:1763!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 5237 Comm: syz-executor.0 Not tainted 6.2.0-rc8-syzkaller-00021-ge1c04510f521 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/21/2023
RIP: 0010:iput+0x68/0x80 fs/inode.c:1763
Code: ff 83 e3 40 48 89 de e8 b6 b6 9b ff 48 85 db 75 14 e8 dc b9 9b ff 48 89 ef e8 24 f7 ff ff 5b 5d e9 cd b9 9b ff e8 c8 b9 9b ff <0f> 0b e8 31 cd e9 ff eb c5 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
RSP: 0018:ffffc90004ddfbe0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000040 RCX: 0000000000000000
RDX: ffff88801e0f9d40 RSI: ffffffff81e54e48 RDI: 0000000000000007
RBP: ffff888072e68000 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000040 R11: 0000000000000000 R12: ffff888072e278e0
R13: 0000000000000000 R14: ffff888072e68000 R15: 0000000000000000
FS:  00007f2cbc74c700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2cb2b58000 CR3: 0000000027d2f000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 f2fs_abort_atomic_write+0xea/0x4f0 fs/f2fs/segment.c:196
 f2fs_ioc_commit_atomic_write+0x19f/0x260 fs/f2fs/file.c:2157
 __f2fs_ioctl+0x26f0/0xaaf0 fs/f2fs/file.c:4154
 f2fs_ioctl+0x18e/0x220 fs/f2fs/file.c:4242
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f2cbba8c0f9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2cbc74c168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f2cbbbac050 RCX: 00007f2cbba8c0f9
RDX: 0000000000000000 RSI: 000000000000f502 RDI: 0000000000000004
RBP: 00007f2cbbae7ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fffc60048ef R14: 00007f2cbc74c300 R15: 0000000000022000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:iput+0x68/0x80 fs/inode.c:1763
Code: ff 83 e3 40 48 89 de e8 b6 b6 9b ff 48 85 db 75 14 e8 dc b9 9b ff 48 89 ef e8 24 f7 ff ff 5b 5d e9 cd b9 9b ff e8 c8 b9 9b ff <0f> 0b e8 31 cd e9 ff eb c5 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
RSP: 0018:ffffc90004ddfbe0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000040 RCX: 0000000000000000
RDX: ffff88801e0f9d40 RSI: ffffffff81e54e48 RDI: 0000000000000007
RBP: ffff888072e68000 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000040 R11: 0000000000000000 R12: ffff888072e278e0
R13: 0000000000000000 R14: ffff888072e68000 R15: 0000000000000000
FS:  00007f2cbc74c700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2cbc74c718 CR3: 0000000027d2f000 CR4: 0000000000350ee0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
