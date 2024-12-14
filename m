Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D89F1B80
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Dec 2024 01:50:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tMGMb-000669-UG;
	Sat, 14 Dec 2024 00:50:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3TtZcZwkbAK8hnoZPaaTgPeeXS.VddVaTjhTgRdciTci.Rdb@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tMGMa-000663-VN for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Dec 2024 00:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fBLcU77vbmh0JWc6/g8EnwEOkvr08+fPCnf/UWJ2z/k=; b=ik4yMJCLz8XprAaWGQ5ehO78SK
 6UQPUNqLLoPpd6vPeGSwuQCTgzWwWHaFXMmf2xg7U5uR9ADXaRzHXvZ1TKduWpLdUhKqtEf83EWQ7
 Pp8nAIVTDdfW7RjlCU9YpOvyKqrGYVEl6ERXeTFQ8HpQcbvX4F+Gh7RX5n3Wya2ZzJf8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fBLcU77vbmh0JWc6/g8EnwEOkvr08+fPCnf/UWJ2z/k=; b=g
 RpJJbSU+AcSvzJ0320ICA8CIY1l0rWvVOjgpr3LaSQxDypV3/F/kcEbpi9sgijwXblShYAiqRDM5V
 /0BSu7803E+NdsvMG2yiwkWM3u3bfvDbFuvF9oG794agGT6Psm+WJYtpnfdJe6GFgO9EHlQa2Z6pU
 ZcVJSu8yK+Z7SO1c=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tMGMa-0002Pz-RT for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Dec 2024 00:50:33 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3a814406be9so41457515ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Dec 2024 16:50:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734137422; x=1734742222;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fBLcU77vbmh0JWc6/g8EnwEOkvr08+fPCnf/UWJ2z/k=;
 b=IgmiJ++YzjxbKV+aQ/xsep332RQqrD3Sb/QYcaYrwjCC/oxj9YNS9Xjk7rpm2LvXc6
 alYVbuUkmmrQOLldJS311VHzgmmYQ9MkIgCAEnlDtFhEA3QNvXX/xKWa67/bs79f+z4g
 uCwkdMtavUXGNxi1xKVD9v8m+8aV4b1BKF+Ughq4D/ERnDwvWdRn2AAidTWJzwac3XjC
 JcykCPtl/eK+qq+YdQ91p07LMcogt406DkPY/YP+KGhTQ4nLfIlC6dyhW4qZ7GShCciF
 kdP8qLpnCM/fjmctij0QeQ0lx6sXSwQAngjwR2HXsnjbMGmFOtthqJV9I6PFh1Yp6z0O
 UZHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHSiTtfNu17Rz/dzODsTiA4EP553+gqT/NbH8CEuN9Uo6OSgX88aUn33zd6dr2fcH8rlPo5nlDeaOkldhuO4np@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxGvfdzXxCL++Aik+4v43ejaEOxqhXwgzziwdVN4N2cZjBMMUaN
 adBSz5i5IwnATY9vthAm9N/FeDDQN9mzBsQdY/myet6UGXwXGpuxa5eAygiR9Oc31ThgfpFTBz3
 TtDUHeGXjuxNmsGxTLXUhDtP7wFD+kNPZ7pmCjJhJJ62haizZZBGnYIg=
X-Google-Smtp-Source: AGHT+IEZs0zqBvel2J7o7SU5ibN0aq8rTNSCje/SGK9RjrxXSqkh2wKXDjfbYTC3ZSBRmrYmXpge0CnYcZN8Y9o7C41lD4RswOWJ
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1845:b0:3a7:e732:472a with SMTP id
 e9e14a558f8ab-3afed372bd5mr44103305ab.2.1734137422148; Fri, 13 Dec 2024
 16:50:22 -0800 (PST)
Date: Fri, 13 Dec 2024 16:50:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675cd64e.050a0220.37aaf.00bb.GAE@google.com>
From: syzbot <syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com>
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
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 7cb1b4663150
 Merge tag 'locking_urgent_for_v6.13_rc3' of g.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=103bc544580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.205 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in bl.score.senderscore.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tMGMa-0002Pz-RT
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in new_curseg (2)
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

HEAD commit:    7cb1b4663150 Merge tag 'locking_urgent_for_v6.13_rc3' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=103bc544580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fee25f93665c89ac
dashboard link: https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-7cb1b466.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/13e083329dab/vmlinux-7cb1b466.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fe3847d08513/bzImage-7cb1b466.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2746!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5323 Comm: syz.0.0 Not tainted 6.13.0-rc2-syzkaller-00018-g7cb1b4663150 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:get_new_segment fs/f2fs/segment.c:2746 [inline]
RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2876
Code: fe fd e9 1a fa ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 4c fa ff ff 48 89 df e8 59 37 fe fd e9 3f fa ff ff e8 0f d8 97 fd 90 <0f> 0b e8 07 d8 97 fd 90 0f 0b e8 ff d7 97 fd 90 0f 0b e8 f7 d7 97
RSP: 0018:ffffc9000d22f528 EFLAGS: 00010293
RAX: ffffffff84078631 RBX: 0000000000000018 RCX: ffff88801cf80000
RDX: 0000000000000000 RSI: 0000000000000018 RDI: 0000000000000018
RBP: dffffc0000000000 R08: ffffffff84077465 R09: fffff52001a45e94
R10: dffffc0000000000 R11: fffff52001a45e94 R12: 0000000000000018
R13: ffff888011d6d101 R14: 0000000000000018 R15: ffff888052d722d8
FS:  00007ff3577bc6c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc8f62ba00 CR3: 000000004320a000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3210
 f2fs_allocate_new_section fs/f2fs/segment.c:3224 [inline]
 f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3238
 f2fs_expand_inode_data+0x696/0xca0 fs/f2fs/file.c:1830
 f2fs_fallocate+0x537/0xa10 fs/f2fs/file.c:1940
 vfs_fallocate+0x569/0x6e0 fs/open.c:327
 do_vfs_ioctl+0x258c/0x2e40 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff357d7ff19
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff3577bc058 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ff357f46160 RCX: 00007ff357d7ff19
RDX: 00000000200000c0 RSI: 0000000040305828 RDI: 0000000000000004
RBP: 00007ff357df3cc8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007ff357f46160 R15: 00007ffc8f62c1e8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:get_new_segment fs/f2fs/segment.c:2746 [inline]
RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2876
Code: fe fd e9 1a fa ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 4c fa ff ff 48 89 df e8 59 37 fe fd e9 3f fa ff ff e8 0f d8 97 fd 90 <0f> 0b e8 07 d8 97 fd 90 0f 0b e8 ff d7 97 fd 90 0f 0b e8 f7 d7 97
RSP: 0018:ffffc9000d22f528 EFLAGS: 00010293
RAX: ffffffff84078631 RBX: 0000000000000018 RCX: ffff88801cf80000
RDX: 0000000000000000 RSI: 0000000000000018 RDI: 0000000000000018
RBP: dffffc0000000000 R08: ffffffff84077465 R09: fffff52001a45e94
R10: dffffc0000000000 R11: fffff52001a45e94 R12: 0000000000000018
R13: ffff888011d6d101 R14: 0000000000000018 R15: ffff888052d722d8
FS:  00007ff3577bc6c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc8f62ba00 CR3: 000000004320a000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
