Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE5B507CB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Sep 2025 23:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VWhLwocCqsbitycAgeiHGh9ahPm+KyjxPMD/3Bb9Fio=; b=M54vAxkgFa/fZJuso6cIJzcX0G
	dU1wcji7ai+/cDHN1u2P7/1dRlfPzCoO2MYUetWpRQ+OxSfiZavueQ8FBRjq7LMpPeX3fkLhogQbb
	dCg50WRqQLSTnHGLq0cid42ptc0rEmH951jymeyRgx4wbzUBgXRaxH6h8YIKaraRMdRQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uw5ct-0002JA-K5;
	Tue, 09 Sep 2025 21:11:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3ApjAaAkbAIEx34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uw5cr-0002J2-Ui for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Sep 2025 21:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K2E6uKZowa7YhpoptIPi7df6cgW2oGwc5hKKJm/fXpc=; b=koB51x+LlJpADsm3wPB3nL6/3v
 +UgL09gyPs9Z3yaHdz7FNV7Hdr4YsZ4/fpRFbb0Lc82Ri992eUrwHEuLl/sz6E64HUWo5Ew3qcsT0
 r4bgIzGxPy4ycYlALb0tm2rmYzlpOapBUIIAeReTVArza74iDQ96/V0/zczmlwkLT+jA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=K2E6uKZowa7YhpoptIPi7df6cgW2oGwc5hKKJm/fXpc=; b=R
 zXd+mp5h/tkXEPEcBsWJ1SCA8zqk0GV0AaRbCg+xYrs46kshjMZIqXUVB4Tp/GRAFBLM7J9VYSJPL
 N0lx37lZoiP0r55vry3jaeL5op6NQA6ytVaPUhsZsfiTfnSqnRLRyjcR4EyEHGopozBcmozC+M+Yc
 4LUlJ6DxxJWS+1Ic=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uw5cr-0001rU-D0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Sep 2025 21:11:41 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-414c47fbe8eso12103315ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 09 Sep 2025 14:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757452290; x=1758057090;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K2E6uKZowa7YhpoptIPi7df6cgW2oGwc5hKKJm/fXpc=;
 b=mPKHdB8LwlBB/PZChpBPWZtuPbs1KeTjvYNUFNlT+qcIIDIQQcfXNtbqJhm+xlFIfA
 5cXWjBvX/QfxrgCSMJUvUpoo/wQxZUdmEW1I/4J2TPcgrpqUTCMWz4dKsn1HS5m13XNi
 JdXkEkwZIUtc4VUNr26qQBOk3VlQ5llt+WWpwR+p8iGE1udRuUhFmmUl1GJhbQvM9rV/
 RfuzNMtbHY2csjjwuTWL+YTb2fg8+6I3iHDvapzVog3xZcj48IIv8aP6ncsfXxbNhgBt
 gmDUDiZziB9bvRfZbr3mVphFqpUDYQFF8gNzA787anrTtKiXipChpASqIRZVwqr3225t
 yXtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6pfrWxM/DrSYWzrOoRJV/6bjqL+Sem74QU9QPlE1rN48XISIbo/aLrS35Osuwt5kDZZdjmbm8gWbHsTyrkodR@lists.sourceforge.net
X-Gm-Message-State: AOJu0YycnRCIPSlxUE3WT9Ce14vxK9Y5/emI82OVTpqMgdnhGrQnoSfz
 un7AgfS8f9E0P3TZ5BPc6U5SKOxX+gVHIfTGnNVTxdp7CnsG3QZu//Uvy+0tCPG9XUzG1MgPJWT
 jN7TnqQFOSo6UiGzThK6MqLBbU/9oGoM3hbPAcqeMSa3HZD0VudsrYeTlHLQ=
X-Google-Smtp-Source: AGHT+IECe7+4JWTlUX5ahDOrF1l3veoWFm8tTRWDKu9dpqZiG+GZMcxtpuWC48N84X3BE7spBCw4vOPaGU2Eh6EcxLXqznbD0Owv
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa1:b0:3f6:56a4:1e13 with SMTP id
 e9e14a558f8ab-3fd806a3222mr186122465ab.1.1757452290676; Tue, 09 Sep 2025
 14:11:30 -0700 (PDT)
Date: Tue, 09 Sep 2025 14:11:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c09802.050a0220.3c6139.000e.GAE@google.com>
From: syzbot <syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: f777d1112ee5
 Merge tag 'vfs-6.17-rc6.fixes' of git://git.k.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=124dad62580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: storage.googleapis.com]
 [URI: goo.gl] [URI: syzkaller.appspot.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.208 listed in wl.mailspike.net]
X-Headers-End: 1uw5cr-0001rU-D0
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in clear_inode (4)
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

HEAD commit:    f777d1112ee5 Merge tag 'vfs-6.17-rc6.fixes' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=124dad62580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=429771c55b615e85
dashboard link: https://syzkaller.appspot.com/bug?extid=90266696fe5daacebd35
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15a43562580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=164dad62580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/860ff2f591a4/disk-f777d111.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/31f4ca3a76d4/vmlinux-f777d111.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c534fac91a74/bzImage-f777d111.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/6c7a25c90276/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=11a43562580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 40427
F2FS-fs (loop0): Wrong SSA boundary, start(3584) end(4096) blocks(3072)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): f2fs_convert_inline_folio: corrupted inline inode ino=3, i_addr[0]:0x1601, run fsck to fix.
------------[ cut here ]------------
kernel BUG at fs/inode.c:753!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 6097 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
RIP: 0010:clear_inode+0x169/0x190 fs/inode.c:753
Code: 4c 89 f7 e8 59 7a ec ff e9 60 ff ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 7c c0 4c 89 f7 e8 2f 7b ec ff eb b6 e8 28 40 8d ff 90 <0f> 0b e8 20 40 8d ff 90 0f 0b e8 18 40 8d ff 90 0f 0b e8 10 40 8d
RSP: 0018:ffffc9000408f890 EFLAGS: 00010293
RAX: ffffffff82311f78 RBX: ffff888022059300 RCX: ffff888024ced940
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc9000408fa00 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1e3ab47 R12: dffffc0000000000
R13: ffff888022059300 R14: ffff888022059558 R15: 0000000000000001
FS:  000055557dd70500(0000) GS:ffff8881268bf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055738e9e8660 CR3: 0000000029a1c000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 evict+0x504/0x9c0 fs/inode.c:810
 f2fs_fill_super+0x5612/0x6fa0 fs/f2fs/super.c:5047
 get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1692
 vfs_get_tree+0x8f/0x2b0 fs/super.c:1815
 do_new_mount+0x2a2/0x9e0 fs/namespace.c:3808
 do_mount fs/namespace.c:4136 [inline]
 __do_sys_mount fs/namespace.c:4347 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4324
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f865d77038a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc62ec72e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffc62ec7370 RCX: 00007f865d77038a
RDX: 0000200000000140 RSI: 00002000000000c0 RDI: 00007ffc62ec7330
RBP: 0000200000000140 R08: 00007ffc62ec7370 R09: 0000000000000008
R10: 0000000000000008 R11: 0000000000000246 R12: 00002000000000c0
R13: 00007ffc62ec7330 R14: 0000000000005531 R15: 00002000000056c0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:clear_inode+0x169/0x190 fs/inode.c:753
Code: 4c 89 f7 e8 59 7a ec ff e9 60 ff ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 7c c0 4c 89 f7 e8 2f 7b ec ff eb b6 e8 28 40 8d ff 90 <0f> 0b e8 20 40 8d ff 90 0f 0b e8 18 40 8d ff 90 0f 0b e8 10 40 8d
RSP: 0018:ffffc9000408f890 EFLAGS: 00010293
RAX: ffffffff82311f78 RBX: ffff888022059300 RCX: ffff888024ced940
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc9000408fa00 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1e3ab47 R12: dffffc0000000000
R13: ffff888022059300 R14: ffff888022059558 R15: 0000000000000001
FS:  000055557dd70500(0000) GS:ffff8881268bf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055738e9e8660 CR3: 0000000029a1c000 CR4: 00000000003526f0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

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
