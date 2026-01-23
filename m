Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODVkJEf+c2nu0wAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Jan 2026 00:03:35 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3677B5CB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Jan 2026 00:03:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QAt9BiStU07jkrQ80Sd8uSTqQ2z7wj/1dzfVi+YdTOk=; b=YU1FlUvjO5RUPvyKiCh/VlICWs
	aM3oX8XKDEjemErKQXkHYPnEHclnU/ZGKxMPM1B2GDrJ2t7EvaWxK3n/Ecl2HHo/NEJmeUWE6hPtn
	23Kn77z3yQ0Fvu/6FwHihrY/SZ2ZDURFtbOCNXwS2Or+YbW/9fj7w/x+qMAdO4zD8dUg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjQBZ-0008Bv-SQ;
	Fri, 23 Jan 2026 23:03:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3hvZzaQkbAJUHNO9zAA3GzEE72.5DD5A3JH3G1DCI3CI.1DB@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vjQBY-0008Bp-1Z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 23:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ytTrfe4tsGH8G4Jp2Llgrh2yIUm2a5iTgzzCncZOEcY=; b=HZGI+gW4Sb/aNHv0hR82iOZkaw
 c+e0FFCXCUZnVfFyHRenZ6b1zUUPE2geJyIROalWURYfmJZmKEuSI1vUsBqLDcJhfkT5F1m+ExGfl
 N6hBbEtAOF5rTgpF59b+cohhlDdAsnk9qLul0QuvAKRysh9GqNYejThHgiZ5pLGjS+TQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ytTrfe4tsGH8G4Jp2Llgrh2yIUm2a5iTgzzCncZOEcY=; b=f
 DgfuOd0KRX266BnmHMT+l/kzRdDXpSM0pnhH7YPt2s6ezZdQXDZWBuiU+DygpNTZj6ldql0eJtBAz
 mu8ZpwShLDAO+gAWcBFbR3SWPw81Dy3UQxspSRE44F2O2Rkszvs4Lm9rfal2LFdEXpVjBM2hjaAq4
 o6wMF49rkN080OpI=;
Received: from mail-pf1-f205.google.com ([209.85.210.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vjQBX-0005x2-E5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 23:03:23 +0000
Received: by mail-pf1-f205.google.com with SMTP id
 d2e1a72fcca58-82181fdf3d5so1415809b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Jan 2026 15:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769209393; x=1769814193;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ytTrfe4tsGH8G4Jp2Llgrh2yIUm2a5iTgzzCncZOEcY=;
 b=WzGkv+xGHbFEBpMhoKCGDf7GMECj0eCWwfpk3N/mub7V3cgKVyNsIpdYaRJ4OnFRpS
 Tq722Xi1lGw5jq/mmivTj0ZlZavDqwkvxI86OYBAB1k0+MvbcEGoxlrv0a2AZAXqrB3v
 8/rS77PDBCNp+rwNTJ8Q/QMHO3aUBqNozXzszO9rlsoqKaCIR9Nk2+Y3Z60bFka1lBAe
 2pxR2nn0+mE7cgyZWA84LxzJXxJpHCZxsi8++L2p9JgKI4ecH6n0pk1p/YgE8ZjH7MHk
 kTkgSMf4dyqjDfxEM0f/XbZ4rmvrVzh7Mcy2NPh8n3646IhnbgHNWRqv/EwionjBPvz8
 IkUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWezMgW6TkafM7pu15/wJhOgxA3z0pKgPsR4TcB4ATRzeUsKIk40KaIeCAfwnmaFgxgdJazq+suB9/FauC12+B@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxIxMUs6vhKeSEY1e0+KzRQZ0HpZwQDQkt+6d5V1/Bd7TvUFDPz
 E9hkJZ1IAyv8UquUJKwVFTErOZ9Ofc34zZgL9w++BUXBhUBxErmdOa2p5MNe+wOH8J8QCl5IvP+
 Umy5CCnvWRqsNWadVMLlXlZcONhM0Oadi0HSETr6O1EaRpMnKWTQDgP2WEHg=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:22a8:b0:662:c301:a278 with SMTP id
 006d021491bc7-662cab5f892mr2035600eaf.45.1769207430780; Fri, 23 Jan 2026
 14:30:30 -0800 (PST)
Date: Fri, 23 Jan 2026 14:30:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6973f686.a70a0220.35de72.0009.GAE@google.com>
From: syzbot <syzbot+5dd7feff22865a110a30@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 59e4d31a0470
 Merge branches 'for-next/core' and 'for-next/.. git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.205 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vjQBX-0005x2-E5
Subject: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in process_one_work (5)
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
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=8a8594efdc14f07a];
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
	TAGGED_FROM(0.00)[5dd7feff22865a110a30];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,storage.googleapis.com:url,appspotmail.com:email,googlegroups.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REDIRECTOR_URL(0.00)[goo.gl];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: BE3677B5CB
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    59e4d31a0470 Merge branches 'for-next/core' and 'for-next/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12454e3a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a8594efdc14f07a
dashboard link: https://syzkaller.appspot.com/bug?extid=5dd7feff22865a110a30
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ba2b9a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15da1852580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/746a1d5c4188/disk-59e4d31a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2eefade79f10/vmlinux-59e4d31a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/140624ef24ed/Image-59e4d31a.gz.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/d9aeb36c73e1/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=179533fa580000)
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/2795c5404b6f/mount_6.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=11856bfc580000)
mounted in repro #3: https://storage.googleapis.com/syzbot-assets/c5955f1ccd09/mount_11.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=10ba2b9a580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5dd7feff22865a110a30@syzkaller.appspotmail.com

INFO: task kworker/u8:14:3572 blocked for more than 143 seconds.
Workqueue: writeback wb_workfn (flush-7:1)
 writeback_sb_inodes+0x73c/0x16b4 fs/fs-writeback.c:2030
 __writeback_inodes_wb+0xec/0x228 fs/fs-writeback.c:2107
 wb_writeback+0x3c8/0xd70 fs/fs-writeback.c:2218
 wb_check_old_data_flush fs/fs-writeback.c:2322 [inline]
 wb_do_writeback fs/fs-writeback.c:2375 [inline]
 wb_workfn+0xa08/0xdc0 fs/fs-writeback.c:2403
 process_one_work+0x7c0/0x1558 kernel/workqueue.c:3257
      Not tainted syzkaller #0
Call trace:
 __down_write_common kernel/locking/rwsem.c:1317 [inline]
 __down_write kernel/locking/rwsem.c:1326 [inline]
 down_write+0xb4/0xc0 kernel/locking/rwsem.c:1591
 process_one_work+0x7c0/0x1558 kernel/workqueue.c:3257
 process_scheduled_works kernel/workqueue.c:3340 [inline]
 worker_thread+0x958/0xed8 kernel/workqueue.c:3421
 kthread+0x5fc/0x75c kernel/kthread.c:463
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:844
1 lock held by khungtaskd/32:
4 locks held by kworker/u8:2/41:
4 locks held by kworker/u8:3/42:
2 locks held by pr/ttyAMA-1/43:
 #2: ffff0000d49500e0 (&type->s_umount_key#54){.+.+}-{4:4}, at: super_trylock_shared+0x24/0xdc fs/super.c:563
 #2: ffff0000cb9880e0 (&type->s_umount_key#54){.+.+}-{4:4}, at: super_trylock_shared+0x24/0xdc fs/super.c:563
4 locks held by kworker/u8:20/6003:
 #3: ffff0000e0531510 (&sbi->gc_lock){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2313 [inline]
 #3: ffff0000e0531510 (&sbi->gc_lock){+.+.}-{4:4}, at: f2fs_balance_fs+0x4c0/0x6d8 fs/f2fs/segment.c:464
 #0: ffff0000d535d0a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x3c/0x4c drivers/tty/tty_ldsem.c:340
 #0: ffff0000c1ff2948 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work+0x63c/0x1558 kernel/workqueue.c:3231
 #1: ffff80009ee57be0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work+0x6d0/0x1558 kernel/workqueue.c:3231


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
