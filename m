Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oImMCI5dBWpvVgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2026 07:28:46 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E70553DFFD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2026 07:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MBdDX6h8ez2RAJk7KOnUiMKc/gA9OyA+PZOi0cOR5q8=; b=DhNy/jzuzNBZglXslwOL5wDCJf
	6cGzO7PjiVLuw5YuyxlLIdIl29X60y8yWfj5OPFiQLh+SUFxM4LakAU+NL0Y0gOyeqIZ1F4+ZG/4j
	IafQJIzU6lwo3mF7fzIwCdM7gdwTzjICfQk1o7pZuPtbvpk0d9zsJcShFezNumMGTpz8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wNOcd-0004YB-Gk;
	Thu, 14 May 2026 05:28:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3dl0FagkbAJ0PVWH7IIBO7MMFA.DLLDIBRPBO9LKQBKQ.9LJ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1wNOcc-0004Y3-JL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 May 2026 05:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rGKLmcXgAz+cHoHGT/zmwSWSQzX/M0B0YH8CUyeHKD0=; b=jPXfRfrQUnrG2yGhFC69wsm759
 uNsa1Kuwi96PEiDXZfim5htxN3lgnLGsapfq/1a2+6CZpGPJ/DgBPX3KTzpEKSG4/GIYRmjqroA+Q
 W39PD9wcRGPbySMUbkNrHlGyQNEGvj0giiRSuasOagcdEyDJaHJe/yL7OQljzyQaC2Y4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rGKLmcXgAz+cHoHGT/zmwSWSQzX/M0B0YH8CUyeHKD0=; b=e
 OG2z5QEkzJIS+B4PNjEAuS59gchGxR3rcL6hW4wGYQzHCW98+Lkp74vYaIsUyXjz1qXPezmbwlPUE
 mbsETIJrvxhSLQR5QkEeYNI28Jofdld1RF06g52vmYrknLxrkYmkUYy1t3A5t1cen9uVrLOpqreQf
 7D4eu0aPnMV4rE7Q=;
Received: from mail-oo1-f78.google.com ([209.85.161.78])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wNOca-0001Hd-KT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 May 2026 05:28:34 +0000
Received: by mail-oo1-f78.google.com with SMTP id
 006d021491bc7-696906ddd6eso3085252eaf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 May 2026 22:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778736502; x=1779341302;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rGKLmcXgAz+cHoHGT/zmwSWSQzX/M0B0YH8CUyeHKD0=;
 b=nloQK1TwwmvVdrIgh0C81+ImyYl25dhDpYBo1zDjABJEMXhv97dNgY31O3oQIgmRIS
 PdHI7vlKiyB4vExpStT1Vlft3tXksCLZz+YT6WkVXzn8k+YVO14EBarALvnVrDL2ZVJ2
 ADsgB6TlCka5cmnMHdgbNKFmi5XkIzknepuBa9mxUCIRS8KYZixZcdarNW2xXb54OjPV
 5rbpxrO5NJw5wOBvL7t+uOgY33ZNJjx1wOifx6+FW6o1AfBB73kXqcCiMl35LzGsFOiN
 2/CcHLvhhhQcVmhldQjK8Nc3GVdThukT36bXzt3Bg/7Hl0WqakyHtcTjoa+fgSV8+Sud
 VW1g==
X-Forwarded-Encrypted: i=1;
 AFNElJ83yplQs32wV6sxeRmqlBmiaDMUKTJge1mgV/YfIdAbjipY7ZR7XnRyl/k3Jj783KYwF65XIzSsJUY4ZLVWAWA/@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzfZl/q9oqsK3CRrlpaQOnc+2qMuiHeZKsJOpp9SW7SR4Mp6maM
 zc0bWlamhZcM0Y6YfQFhIRSdH4E4OaRHMoVyU95mM3pK5o7mlRsO9EnexP6WHd94KhBcM4r6iiX
 e5iOPL/xJIexlKQhaSIqaGaNp+Vep6O5etJgXn0BXqopwiaNfGR/RoFVzZF4=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:150f:b0:696:2cb1:a007 with SMTP id
 006d021491bc7-69b78d5b3d2mr3548681eaf.24.1778736502502; Wed, 13 May 2026
 22:28:22 -0700 (PDT)
Date: Wed, 13 May 2026 22:28:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a055d76.050a0220.d11c8.0003.GAE@google.com>
From: syzbot <syzbot+8b8205b83afd5cbdabaf@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: ec8957276674
 Merge tag 'hwmon-for-v7.1-rc3' of git://git.k.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=1030f1ce580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.78 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wNOca-0001Hd-KT
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_put_super (5)
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
X-Rspamd-Queue-Id: 2E70553DFFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=f2e8ebfec4636d32];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[8b8205b83afd5cbdabaf];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[storage.googleapis.com:url,googlegroups.com:email,goo.gl:url,syzkaller.appspot.com:url,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REDIRECTOR_URL(0.00)[goo.gl];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    ec8957276674 Merge tag 'hwmon-for-v7.1-rc3' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1030f1ce580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2e8ebfec4636d32
dashboard link: https://syzkaller.appspot.com/bug?extid=8b8205b83afd5cbdabaf
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/cd85c29cb989/disk-ec895727.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/753d9d274777/vmlinux-ec895727.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3f65991d8333/bzImage-ec895727.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8b8205b83afd5cbdabaf@syzkaller.appspotmail.com

F2FS-fs (loop3): Stopped filesystem due to reason: 3
F2FS-fs (loop3): detect filesystem reference count leak during umount, type: 2, count: -1
------------[ cut here ]------------
kernel BUG at fs/f2fs/super.c:2061!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 5607 Comm: syz-executor Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
RIP: 0010:f2fs_put_super+0x1451/0x1460 fs/f2fs/super.c:2061
Code: fd 41 bf 0d 00 00 00 4c 89 ef 44 89 fe e8 47 3f 00 00 4c 89 ef 31 f6 48 c7 c2 40 04 9b 8b 44 89 f9 49 89 c0 e8 80 4a fd ff 90 <0f> 0b 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc90004f67900 EFLAGS: 00010246
RAX: c02b1e247a139300 RBX: 1ffff11007f8a85a RCX: c02b1e247a139300
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90004f67b58 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff520009ecea9 R12: dffffc0000000000
R13: ffff88803fc54000 R14: 00000000ffffffff R15: 0000000000000002
FS:  000055555e19c500(0000) GS:ffff888126276000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1d7b1dc000 CR3: 000000003f6c6000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 generic_shutdown_super+0x13d/0x2d0 fs/super.c:646
 kill_block_super+0x44/0x90 fs/super.c:1725
 kill_f2fs_super+0x402/0x730 fs/f2fs/super.c:5534
 deactivate_locked_super+0xbc/0x130 fs/super.c:476
 cleanup_mnt+0x437/0x4d0 fs/namespace.c:1312
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:67 [inline]
 exit_to_user_mode_loop+0xf3/0x4d0 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:238 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
 do_syscall_64+0x33e/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5dfa74e017
Code: a2 c7 05 dc 06 25 00 00 00 00 00 eb 96 e8 e1 12 00 00 90 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffea8646e48 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007f5dfa7e2120 RCX: 00007f5dfa74e017
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffea8646f00
RBP: 00007ffea8646f00 R08: 00007ffea8647f00 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffea8647f90
R13: 00007f5dfa7e2120 R14: 00000000000438b6 R15: 00007ffea8647fd0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_put_super+0x1451/0x1460 fs/f2fs/super.c:2061
Code: fd 41 bf 0d 00 00 00 4c 89 ef 44 89 fe e8 47 3f 00 00 4c 89 ef 31 f6 48 c7 c2 40 04 9b 8b 44 89 f9 49 89 c0 e8 80 4a fd ff 90 <0f> 0b 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc90004f67900 EFLAGS: 00010246
RAX: c02b1e247a139300 RBX: 1ffff11007f8a85a RCX: c02b1e247a139300
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90004f67b58 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff520009ecea9 R12: dffffc0000000000
R13: ffff88803fc54000 R14: 00000000ffffffff R15: 0000000000000002
FS:  000055555e19c500(0000) GS:ffff888126276000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1d7b1dc000 CR3: 000000003f6c6000 CR4: 00000000003526f0


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
