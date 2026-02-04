Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNPcDniYgmm6WgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Feb 2026 01:53:12 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A34FE022D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Feb 2026 01:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/1LoNAVl6ySuagNf/o5y5/YW5INnD6r6Uvh4ggeZGws=; b=lrq0iuv8rr9rNk6b9dm72EXv0E
	CMNIgsm5vetnir3eaSs4Iem0mGrA92eaevvReeLu2k6APUOdjPjgUn9jtdosCskFAdWrrytOi70FO
	6Ayzg26sQQova3l8Y7r5ZolryskmLWskHDMt4bNMmt+ooCPliPxDauVScrIivo5kOOyQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vnR8Z-0001c9-9F;
	Wed, 04 Feb 2026 00:52:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3WpiCaQkbAOcbhiTJUUNaJYYRM.PXXPUNdbNaLXWcNWc.LXV@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vnR8X-0001c1-9I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Feb 2026 00:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5l+3JuWEfhBcu/8mKPii3bWEnKBagb3Z3aFKH97yzjs=; b=VibB8g04MEsMKv+eTMRsRb5AvE
 sZ6xUMionV1tN0LsVCwk2V6zuNPUi7S1d8AJv+XONIiIeOzbWpJxENJb/gF0Zn3Ey/LRsJnFEb6TA
 Ts6r4zntJfQYO7lajOI/57Ayao/S3Nfo9HgI4YjtH4PDLasSW/GlJyOHObPUlvuw/y3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5l+3JuWEfhBcu/8mKPii3bWEnKBagb3Z3aFKH97yzjs=; b=S
 XRBBOMsA2HTwnBf8Popj2W6J4ADtyzDaq3I37L0zQXAwHqeVlH0kP/wfJaPc/uzvucbyoyUSAvy+j
 VtaJTikoDBcGnw+C+veGopgzNh8sQ7srq7IUeGtX/poc0cJCcpA9eRmWde70D2gpFW6IuKW4wMGLj
 Ojibm9harrF6nC/U=;
Received: from mail-oo1-f77.google.com ([209.85.161.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vnR8W-0000Db-Mk for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Feb 2026 00:52:53 +0000
Received: by mail-oo1-f77.google.com with SMTP id
 006d021491bc7-663102ea953so18471427eaf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Feb 2026 16:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770166362; x=1770771162;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5l+3JuWEfhBcu/8mKPii3bWEnKBagb3Z3aFKH97yzjs=;
 b=KXPa15+jMxBPQFREr9Cs7XTwHTqZAMI87wEhUfJR5CYCoaAagGteFpzyju/ulf23um
 pizqv6BQ1YIhYSZXg3dn/xJQNu9zGVPwzT2qsqe3rU4q0sNTcRI4cjlKVjDWyDD8RwUD
 v+2NjklgKNyEAGUttw/IaoXf8LkTClis43EpWIKeyo1sGhOzGl9a/sCPkzRMqK+JZZ1V
 6M+iSZ8qTmtMf7uQmU2dzy6+p2dQ4L+qKeyVr9DORuxVwJaymeiBEUKSJN1wk22mPVMF
 fXb59cKYSr8Vr3OkkaC/8jVsrCoPfK2ZfFwDKWzYsX7ldWoSldJDz2KjWxY4dkcD7UWa
 jB5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/J3vRzomGHpWrFy1qZOZE3UCVupvUBpo3nWl0RguBGFFrjHNOSx5OmBLQN6SXoPJP9ChXOsR7amkugnhyasRi@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw07ZEndu08dSIcWi2loCzokSWg4xyy5WNuPmLMlkVfyM0Kl+Ax
 P088BkmYlAa3qfdHwuiK6SvVsCg+22DoeGB3lizOU/g9Ti6ha9dIpCCntu7ZL6oYtR+BfiMDjAe
 9uRf6i0l76YDYBuzRinhYY610MbTxu5wbB5La5t42dncJ5nEkac3Fmt1jiv8=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:468d:b0:662:fa5a:b2f1 with SMTP id
 006d021491bc7-66a234336e6mr609697eaf.63.1770166362060; Tue, 03 Feb 2026
 16:52:42 -0800 (PST)
Date: Tue, 03 Feb 2026 16:52:42 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6982985a.a00a0220.37c87e.0017.GAE@google.com>
From: syzbot <syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: dee65f79364c
 Merge tag 'lsm-pr-20260202' of git://git.kern.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=1639fbfa580000 kernel
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.77 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vnR8W-0000Db-Mk
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in clear_inode (5)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=151a39927f1e10b4];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[fc026e87558558f75c00];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,goo.gl:url,storage.googleapis.com:url,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 8A34FE022D
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    dee65f79364c Merge tag 'lsm-pr-20260202' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1639fbfa580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=151a39927f1e10b4
dashboard link: https://syzkaller.appspot.com/bug?extid=fc026e87558558f75c00
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=114fb322580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1245fc5a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d5a48068ae28/disk-dee65f79.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2c254f049b04/vmlinux-dee65f79.xz
kernel image: https://storage.googleapis.com/syzbot-assets/12b280dac533/bzImage-dee65f79.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/bce313ec1951/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=164fb322580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com

F2FS-fs (loop0): Wrong SSA boundary, start(3584) end(4096) blocks(3072)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): Image doesn't support compression
F2FS-fs (loop0): invalid crc value
------------[ cut here ]------------
kernel BUG at fs/inode.c:782!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 6061 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
RIP: 0010:clear_inode+0x19a/0x1c0 fs/inode.c:782
Code: 4c 89 f7 e8 08 2f eb ff e9 5a ff ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 7c a2 4c 89 f7 e8 de 2f eb ff eb 98 e8 47 c7 86 ff 90 <0f> 0b e8 3f c7 86 ff 90 0f 0b e8 37 c7 86 ff 90 0f 0b e8 2f c7 86
RSP: 0018:ffffc90003e17850 EFLAGS: 00010293
RAX: ffffffff823c6d29 RBX: ffff888057a99310 RCX: ffff88802b1edac0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90003e179c0 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1e8fbef R12: dffffc0000000000
R13: 1ffff920007c2f1c R14: ffff888057a99568 R15: 0000000000000001
FS:  000055557a53e500(0000) GS:ffff8881266c9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff6ffc5bbc CR3: 0000000034a72000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 evict+0x61e/0xb10 fs/inode.c:837
 f2fs_fill_super+0x54e4/0x6e30 fs/f2fs/super.c:5147
 get_tree_bdev_flags+0x431/0x4f0 fs/super.c:1691
 vfs_get_tree+0x92/0x2a0 fs/super.c:1751
 fc_mount fs/namespace.c:1199 [inline]
 do_new_mount_fc fs/namespace.c:3636 [inline]
 do_new_mount+0x329/0xa50 fs/namespace.c:3712
 do_mount fs/namespace.c:4035 [inline]
 __do_sys_mount fs/namespace.c:4224 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4201
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff95c0cc14a
Code: 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd4f028d88 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffd4f028e10 RCX: 00007ff95c0cc14a
RDX: 0000200000000140 RSI: 00002000000001c0 RDI: 00007ffd4f028dd0
RBP: 0000200000000140 R08: 00007ffd4f028e10 R09: 0000000000000008
R10: 0000000000000008 R11: 0000000000000246 R12: 00002000000001c0
R13: 00007ffd4f028dd0 R14: 0000000000005548 R15: 0000200000000200
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:clear_inode+0x19a/0x1c0 fs/inode.c:782
Code: 4c 89 f7 e8 08 2f eb ff e9 5a ff ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 7c a2 4c 89 f7 e8 de 2f eb ff eb 98 e8 47 c7 86 ff 90 <0f> 0b e8 3f c7 86 ff 90 0f 0b e8 37 c7 86 ff 90 0f 0b e8 2f c7 86
RSP: 0018:ffffc90003e17850 EFLAGS: 00010293
RAX: ffffffff823c6d29 RBX: ffff888057a99310 RCX: ffff88802b1edac0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90003e179c0 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1e8fbef R12: dffffc0000000000
R13: 1ffff920007c2f1c R14: ffff888057a99568 R15: 0000000000000001
FS:  000055557a53e500(0000) GS:ffff8881266c9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff6ffc5bbc CR3: 0000000034a72000 CR4: 00000000003526f0


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
