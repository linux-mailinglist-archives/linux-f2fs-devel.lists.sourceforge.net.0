Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIJHDKs2+mm1KwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 05 May 2026 20:27:55 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 787AE4D2A59
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 05 May 2026 20:27:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ljCl1pNmNX11fxrPhC0iwZUxgsu+YbCbX3jwM7Ug0aE=; b=hi07RXFZz4mltnpAcyBIVVF3TW
	ml5JbVe5cYagSaGCboSlIS77v34D6iDKJphoR9qJ0sKIDa80MCskCJfqWMOVD/HCzeoXJNIjREHXN
	3SvdZsQW8m91uPyibOmFe9Nk5gt602kU7m7Dcl5RlOulK559BgTwhlVJEUMnfkctlg7Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKKUg-00035A-7U;
	Tue, 05 May 2026 18:27:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3lzb6aQkbAEQy45qgrrkxgvvoj.muumrk0ykxiutzktz.ius@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1wKKUe-00034x-U7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 May 2026 18:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mqyGGJBac2r6ZdLj7wL1AOUtZBS8FLQp+4/G675aVMY=; b=fR8fSuzgFLDastuU3g8RllY+1O
 AaOMHhRdS+CHH5wrqa/vDYfNpiPDaWKffrL5scCMe9OwWZ/Vvz2x9WWLE4l7KBkAkQHMKOvvm0zEk
 adDeyJ5kxBKCah3h7QyX8LsTBjM1kbQfBWmsziYnbTRjBSuwN9rv3zPh4f6yegRDTf8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mqyGGJBac2r6ZdLj7wL1AOUtZBS8FLQp+4/G675aVMY=; b=d
 4JnEoFYZ7zWg00MvA58wjvSdMxfRJSxv0ZlR8qq3RZPQZqTh+hAEzYXV5lEelvJS00e4vBg4lC9V9
 PuaEBbn8IxTaBZccbcHj4HuG0FVB9ynZd1Ne8egl8QF27bkInjFtIQqVt0y6m0NCu2jJeBjXC3Fw9
 bJ5UtqfsZrjLsuvM=;
Received: from mail-oo1-f80.google.com ([209.85.161.80])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wKKUe-0005nM-PD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 May 2026 18:27:41 +0000
Received: by mail-oo1-f80.google.com with SMTP id
 006d021491bc7-696906ddd6eso4280936eaf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 May 2026 11:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778005655; x=1778610455;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mqyGGJBac2r6ZdLj7wL1AOUtZBS8FLQp+4/G675aVMY=;
 b=ccbEQrvFdkci8llV1VFMgNTFm6MlFm7M/CFruRFVgNrN1JoTxhuriFFUKhK7BzomLR
 ppM57r33LxBJqhf8Ql1Dbex52yAuHFL46gyalbRKceOUUbI4sbAufnC2nTmc7ukMroU+
 I6pUVzxfFj0CWpwvPPO7B4UU2/50GQiBWRABN9hgD+fUriJv+UX1yV2uFFKOspTWe5Ij
 cekDPBuLS2rg3l/mayP5tK4sYGiY42IMkekgBwmydg+lZ9GufBOxEckAPp7RCMxHc0OU
 rvHu6evAxV+HwOBKFrGAaRwj5L4onjp/0ZAHkqu9kisLUAFqq043SY3rcX2zDAmzbjjd
 lMBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ85ECvIjiXFiPTUBw3wR0Fd2pthPhheI859V4brCbp5q7PNacuyW6U2yX9qHNDZa3wJ9+m0L4wknjTJiKqAunDr@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxdjkOA6Nix4hJSkV/XZdM7Jtycco3qhg2YmCsa1B7Rru8R90ad
 cFwT+baJhSI/DOW1jJkG7U4E1Z1DPcubOOpsGDAW6eAPE2Ft1Xw9O+XlAjiWMrtgCIwVdWJZe53
 AUKo+Rmcv9bVBbOc408bK200FDoVxmAVyDGrjZd59mUEPWMDtNuJ2zgPMFkI=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c6:b0:696:8325:f7f5 with SMTP id
 006d021491bc7-6998a599fe1mr2360054eaf.4.1778005655072; Tue, 05 May 2026
 11:27:35 -0700 (PDT)
Date: Tue, 05 May 2026 11:27:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69fa3697.170a0220.59368.0018.GAE@google.com>
From: syzbot <syzbot+2488d8d751b27f7ce268@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 26fd6bff2c05
 Merge tag 'mtd/fixes-for-7.1-rc2' of git://gi.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=1604bb48580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.80 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wKKUe-0005nM-PD
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_do_truncate_blocks
 (2)
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
X-Rspamd-Queue-Id: 787AE4D2A59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=7f195f6be48c12ec];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[2488d8d751b27f7ce268];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,storage.googleapis.com:url,goo.gl:url,appspotmail.com:email];
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

Hello,

syzbot found the following issue on:

HEAD commit:    26fd6bff2c05 Merge tag 'mtd/fixes-for-7.1-rc2' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1604bb48580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f195f6be48c12ec
dashboard link: https://syzkaller.appspot.com/bug?extid=2488d8d751b27f7ce268
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-26fd6bff.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c6a6df2148f4/vmlinux-26fd6bff.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9b86e0551588/bzImage-26fd6bff.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2488d8d751b27f7ce268@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 131072
F2FS-fs (loop0): QUOTA feature is enabled, so ignore qf_name
F2FS-fs (loop0): build fault injection rate: 7
F2FS-fs (loop0): build fault injection type: 0x40004
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of read_compacted_summaries fs/f2fs/segment.c:4301 [inline]
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of restore_curseg_summaries fs/f2fs/segment.c:4445 [inline]
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of build_curseg+0x105c/0x30c0 fs/f2fs/segment.c:4983
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of restore_curseg_summaries fs/f2fs/segment.c:4452 [inline]
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of build_curseg+0x18ea/0x30c0 fs/f2fs/segment.c:4983
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of build_sit_entries+0x26c/0x1f10 fs/f2fs/segment.c:5000
F2FS-fs (loop0): inject invalid blkaddr in f2fs_is_valid_blkaddr of f2fs_ra_meta_pages+0x21c/0xd60 fs/f2fs/checkpoint.c:472
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of f2fs_get_meta_folio_retry+0x27/0x80 fs/f2fs/checkpoint.c:318
F2FS-fs (loop0): inject page alloc in f2fs_grab_cache_folio of f2fs_get_meta_folio_retry+0x27/0x80 fs/f2fs/checkpoint.c:318
------------[ cut here ]------------
kernel BUG at fs/f2fs/file.c:845!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5336 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:f2fs_do_truncate_blocks+0x1115/0x1140 fs/f2fs/file.c:845
Code: fc fc 90 0f 0b e8 8b 9d 9a fd 90 0f 0b e8 83 9d 9a fd 48 89 df 48 c7 c6 60 d1 1a 8c e8 54 f1 fc fc 90 0f 0b e8 6c 9d 9a fd 90 <0f> 0b e8 64 9d 9a fd 90 0f 0b 90 e9 93 fd ff ff e8 56 9d 9a fd 90
RSP: 0018:ffffc9000e4474c0 EFLAGS: 00010283
RAX: ffffffff842b1d34 RBX: 0000000000000003 RCX: 0000000000100000
RDX: ffffc9000f03a000 RSI: 0000000000035503 RDI: 0000000000035504
RBP: ffffc9000e447608 R08: ffff8880123b0000 R09: 0000000000000002
R10: 00000000fffffffe R11: 0000000000000002 R12: 0000000000000001
R13: 0000000000000000 R14: 1ffff92001c88ea0 R15: 00000000ffff039c
FS:  00007f7e02ee36c0(0000) GS:ffff88808c887000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff0305c4000 CR3: 0000000012d4c000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 f2fs_truncate_blocks+0x10a/0x300 fs/f2fs/file.c:882
 f2fs_truncate+0x471/0x7c0 fs/f2fs/file.c:940
 f2fs_evict_inode+0xa3f/0x1ac0 fs/f2fs/inode.c:907
 evict+0x61e/0xb10 fs/inode.c:841
 f2fs_fill_super+0x5f43/0x78f0 fs/f2fs/super.c:5224
 get_tree_bdev_flags+0x431/0x4f0 fs/super.c:1694
 vfs_get_tree+0x92/0x2a0 fs/super.c:1754
 fc_mount fs/namespace.c:1193 [inline]
 do_new_mount_fc fs/namespace.c:3758 [inline]
 do_new_mount+0x341/0xd30 fs/namespace.c:3834
 do_mount fs/namespace.c:4167 [inline]
 __do_sys_mount fs/namespace.c:4383 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4360
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7e01f9e04a
Code: 48 c7 c2 e8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7e02ee2e18 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f7e02ee2ea0 RCX: 00007f7e01f9e04a
RDX: 0000200000000080 RSI: 00002000000105c0 RDI: 00007f7e02ee2e60
RBP: 0000200000000080 R08: 00007f7e02ee2ea0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00002000000105c0
R13: 00007f7e02ee2e60 R14: 0000000000010589 R15: 0000200000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_do_truncate_blocks+0x1115/0x1140 fs/f2fs/file.c:845
Code: fc fc 90 0f 0b e8 8b 9d 9a fd 90 0f 0b e8 83 9d 9a fd 48 89 df 48 c7 c6 60 d1 1a 8c e8 54 f1 fc fc 90 0f 0b e8 6c 9d 9a fd 90 <0f> 0b e8 64 9d 9a fd 90 0f 0b 90 e9 93 fd ff ff e8 56 9d 9a fd 90
RSP: 0018:ffffc9000e4474c0 EFLAGS: 00010283
RAX: ffffffff842b1d34 RBX: 0000000000000003 RCX: 0000000000100000
RDX: ffffc9000f03a000 RSI: 0000000000035503 RDI: 0000000000035504
RBP: ffffc9000e447608 R08: ffff8880123b0000 R09: 0000000000000002
R10: 00000000fffffffe R11: 0000000000000002 R12: 0000000000000001
R13: 0000000000000000 R14: 1ffff92001c88ea0 R15: 00000000ffff039c
FS:  00007f7e02ee36c0(0000) GS:ffff88808c887000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055e028509c38 CR3: 0000000012d4c000 CR4: 0000000000352ef0


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
