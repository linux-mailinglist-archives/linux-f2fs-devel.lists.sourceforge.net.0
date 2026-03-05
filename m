Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPCPFjvKqWkAFAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 19:23:55 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B03216F3B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 19:23:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g+8NylPSFp/OQCvOGq71h1FcHLYbIgThmLbvZO0AoW4=; b=a9A+GZiytk4wMB9UYec8vDevf6
	Du9GYOKPvLZNfrm1d0BqOG/VUnK/fSRnM4y+tmffXHETWgiALg5wGW5upr76o8j5Aep3HiyZYPPWa
	cJhF8E8y0zkenildinHNGDebh+HG9E2OUTTYMcC72IEhlz3cD4WGu+LH2KGMAyfvovlo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyDMQ-0006tq-To;
	Thu, 05 Mar 2026 18:23:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3JsqpaQkbALUntufVggZmVkkdY.bjjbgZpnZmXjioZio.Xjh@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vyDMP-0006ti-Ix for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 18:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8O7RDofQKy3AbszOHr79CkOMt4ZCcu+WsAS0omFrwRQ=; b=FXY0Ao1X0sgy+PSPbrYWTYh7OM
 TqtbUTqn0bftW85usKk+v3YKF2b9XAw4JnyWxQpiwzNvFiLdtrdZHX+CuOHFFJwwP3IGFK3FooDMY
 YxZaJW0KEANz32nQiZoZuCChUMNcEkSgbz4/npVH7yCO4kJ1WSSHPli5d9S0yi46cWVo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8O7RDofQKy3AbszOHr79CkOMt4ZCcu+WsAS0omFrwRQ=; b=N
 qjO3ejW12cK7HWiYJd9A4aXgOSetGsl/msM3JND87NtA0HPM/gpg9SWz1WoQ4XCOvVlbt5Q32+1jP
 lPXxKVVsXa9SCrOvLdMhV5C0IvakPhbZFgmsmu96mps/77fIuLf4+AT3yEwiv2f264UAo8zjQeEJg
 fgHuAXYQ3AXHmub4=;
Received: from mail-oo1-f72.google.com ([209.85.161.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vyDMP-0008F1-1e for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 18:23:45 +0000
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-679c5ed0942so99763324eaf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 05 Mar 2026 10:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772735014; x=1773339814;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8O7RDofQKy3AbszOHr79CkOMt4ZCcu+WsAS0omFrwRQ=;
 b=qdjWeucgPwNecCLdkTaJzsnZ3rKpY90kFAWzcbysbZTQHXpquVC1zOVN7ekXE/Yuwy
 c1DZMEZa3nMeXFHCeNl2zT5Tb4Pud5csW+R/E/B/UxmPDbmOJ83iZa0ot7hkzWHkdGUU
 G5MJW+ARyYFbK3OYw3ZJL7SfKtyQLz6EWNqldFtfrEVNVt9i9Bd/m8Fijri51YX+anNa
 09IIQ2ftsr8fXt5pOqoMCLxJyvbc0Her7WLFw4fZggrKt9dV6cX3B+TH46hm0ezi9aSV
 XqecIpp77fgGHhT8xYuhyeqMjeFNslifG1HUE4tJ7wXHTYqUDcnmij1VEhkzx4Jd+lhx
 7sbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7LO3pHJcqhs+pEkO3ZnK2F1BCeHNDvix04Z8o+LLcVKuFEsAB9ZLtz1FkeEZTj2yXn49C/cW4mhcXakYALbKL@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx7j6Kxw0wjzh7CwoceFu0/kv9qO4qYELGs/LoX9KlFNFxj421A
 DgY3NIRCZg6heTFiHABuCNFCnNmV2X70ivAlMT9/wtnxXdVj+5cFZXnHZasrY/HS6Fd1mUkKg34
 BIyithtH0OqV6ojI+w8Ytq6VFKjJy+nBn1vngjUBSA8F1f2OXn2HXrTSIUKM=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:818b:b0:679:e70d:fb81 with SMTP id
 006d021491bc7-67b99c56d90mr457459eaf.20.1772735014472; Thu, 05 Mar 2026
 10:23:34 -0800 (PST)
Date: Thu, 05 Mar 2026 10:23:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69a9ca26.a70a0220.305d9a.0000.GAE@google.com>
From: syzbot <syzbot+9aac813cdc456cdd49f8@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: eb71ab2bf722
 Merge tag 'bpf-fixes' of git://git.kernel.org.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=11c430ba580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.72 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vyDMP-0008F1-1e
Subject: [f2fs-dev] [syzbot] [f2fs?] KMSAN: uninit-value in
 f2fs_sanity_check_node_footer
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
X-Rspamd-Queue-Id: 92B03216F3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=10f867da86e38691];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[9aac813cdc456cdd49f8];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
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
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    eb71ab2bf722 Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11c430ba580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=10f867da86e38691
dashboard link: https://syzkaller.appspot.com/bug?extid=9aac813cdc456cdd49f8
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fcbe8b5437ef/disk-eb71ab2b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/245a6565a05b/vmlinux-eb71ab2b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a83b065baa80/bzImage-eb71ab2b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9aac813cdc456cdd49f8@syzkaller.appspotmail.com

syz.2.464: attempt to access beyond end of device
loop2: rw=0, sector=126984, nr_sectors = 8 limit=32735
=====================================================
BUG: KMSAN: uninit-value in f2fs_sanity_check_node_footer+0x374/0xa20 fs/f2fs/node.c:1520
 f2fs_sanity_check_node_footer+0x374/0xa20 fs/f2fs/node.c:1520
 f2fs_finish_read_bio+0xe1e/0x1d60 fs/f2fs/data.c:177
 f2fs_read_end_io+0x6ab/0x2220 fs/f2fs/data.c:-1
 bio_endio+0x1006/0x1160 block/bio.c:1792
 submit_bio_noacct+0x533/0x2960 block/blk-core.c:891
 submit_bio+0x57a/0x620 block/blk-core.c:926
 blk_crypto_submit_bio include/linux/blk-crypto.h:203 [inline]
 f2fs_submit_read_bio+0x12c/0x360 fs/f2fs/data.c:557
 f2fs_submit_page_bio+0xee2/0x1450 fs/f2fs/data.c:775
 read_node_folio+0x384/0x4b0 fs/f2fs/node.c:1481
 __get_node_folio+0x5db/0x15d0 fs/f2fs/node.c:1576
 f2fs_get_inode_folio+0x40/0x50 fs/f2fs/node.c:1623
 do_read_inode fs/f2fs/inode.c:425 [inline]
 f2fs_iget+0x1209/0x9380 fs/f2fs/inode.c:596
 f2fs_fill_super+0x8f5a/0xb2e0 fs/f2fs/super.c:5184
 get_tree_bdev_flags+0x6e6/0x920 fs/super.c:1694
 get_tree_bdev+0x38/0x50 fs/super.c:1717
 f2fs_get_tree+0x35/0x40 fs/f2fs/super.c:5436
 vfs_get_tree+0xb3/0x5d0 fs/super.c:1754
 fc_mount fs/namespace.c:1193 [inline]
 do_new_mount_fc fs/namespace.c:3763 [inline]
 do_new_mount+0x885/0x1dd0 fs/namespace.c:3839
 path_mount+0x7a2/0x20b0 fs/namespace.c:4159
 do_mount fs/namespace.c:4172 [inline]
 __do_sys_mount fs/namespace.c:4361 [inline]
 __se_sys_mount+0x704/0x7f0 fs/namespace.c:4338
 __x64_sys_mount+0xe4/0x150 fs/namespace.c:4338
 x64_sys_call+0x39f0/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 __alloc_frozen_pages_noprof+0x6f7/0x1020 mm/page_alloc.c:5273
 alloc_pages_mpol+0x328/0x860 mm/mempolicy.c:2484
 alloc_frozen_pages_noprof mm/mempolicy.c:2555 [inline]
 alloc_pages_noprof mm/mempolicy.c:2575 [inline]
 folio_alloc_noprof+0x108/0x360 mm/mempolicy.c:2585
 filemap_alloc_folio_noprof+0xd9/0x480 mm/filemap.c:1013
 __filemap_get_folio_mpol+0xb43/0x1960 mm/filemap.c:2006
 __filemap_get_folio include/linux/pagemap.h:774 [inline]
 filemap_grab_folio include/linux/pagemap.h:854 [inline]
 f2fs_grab_cache_folio fs/f2fs/f2fs.h:3048 [inline]
 __get_node_folio+0x56d/0x15d0 fs/f2fs/node.c:1572
 f2fs_get_inode_folio+0x40/0x50 fs/f2fs/node.c:1623
 do_read_inode fs/f2fs/inode.c:425 [inline]
 f2fs_iget+0x1209/0x9380 fs/f2fs/inode.c:596
 f2fs_fill_super+0x8f5a/0xb2e0 fs/f2fs/super.c:5184
 get_tree_bdev_flags+0x6e6/0x920 fs/super.c:1694
 get_tree_bdev+0x38/0x50 fs/super.c:1717
 f2fs_get_tree+0x35/0x40 fs/f2fs/super.c:5436
 vfs_get_tree+0xb3/0x5d0 fs/super.c:1754
 fc_mount fs/namespace.c:1193 [inline]
 do_new_mount_fc fs/namespace.c:3763 [inline]
 do_new_mount+0x885/0x1dd0 fs/namespace.c:3839
 path_mount+0x7a2/0x20b0 fs/namespace.c:4159
 do_mount fs/namespace.c:4172 [inline]
 __do_sys_mount fs/namespace.c:4361 [inline]
 __se_sys_mount+0x704/0x7f0 fs/namespace.c:4338
 __x64_sys_mount+0xe4/0x150 fs/namespace.c:4338
 x64_sys_call+0x39f0/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 0 UID: 0 PID: 8292 Comm: syz.2.464 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
=====================================================


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
