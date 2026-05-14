Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEc6MbQvBmrLfwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2026 22:25:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ECB546B4E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2026 22:25:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C4b0u8VrZhw34U3rP5Gm/72qvLNxQo4I6ISdnYSRhbE=; b=UghJWJhpniBb8Qzq/WNPI5OekE
	MNVDzkbbY2MNV0amL4QEUXlALDToYf+oAVp52HadCY4NYS3BYV/ohx1TzjsnTeuI8lEhwWZ2JOLF6
	1gSoFuUeZwhhIVdAZvMDh4ye9PUKdFmU2MIifmQCQZIeeMAlaIjU4aRY8CHJ7LOvgDH8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wNccL-0003qN-U4;
	Thu, 14 May 2026 20:25:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3XC4GagkbACkXdePFQQJWFUUNI.LTTLQJZXJWHTSYJSY.HTR@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1wNccL-0003qF-0h for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 May 2026 20:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/jU1oy8BI9LHdTj/QqStWzAsOZvfYuSa+bxSV24WCt8=; b=f3a+7ahVqwKvxoz9lXjdtA6bXq
 7A1TOmtJquzjmU700EaG87+cypN0RsIYW8Fn+jD1MyFnw+AZFnqhsLaO/XiFGOyCzYbgNXwHQgZJs
 +hpnDE8awUSVrZRYBPtpyxgdXy5ob8Z2yREkIpeprSL2/D0LTn7trKyXhjUUX/F6lVeg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/jU1oy8BI9LHdTj/QqStWzAsOZvfYuSa+bxSV24WCt8=; b=B
 Uk+7PitV59PSmfkWG9pblSPUYyPJmANFejR6lCTL3zldNH3zDbk7R2Luinsm6qd1CLRqYkvkJFgne
 p9DtAUgBuvv/4hBN2pDCb9YIQFii66ul35FE93eTqRYkOJzpkLlBZUNi6LbR41ZRUNkV7kvuS8Sr0
 Ft3lEFHHfmGeF+YY=;
Received: from mail-qt1-f207.google.com ([209.85.160.207])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wNccJ-0001fS-7V for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 May 2026 20:25:13 +0000
Received: by mail-qt1-f207.google.com with SMTP id
 d75a77b69052e-516458449d4so36209191cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 May 2026 13:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778790306; x=1779395106;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/jU1oy8BI9LHdTj/QqStWzAsOZvfYuSa+bxSV24WCt8=;
 b=T8ylqnAogeLbMZ0OAIb3sCj4twRR8CSY0hVPTr+R2FDfPXdj3Q76rFfvN25smg3rcB
 mtRl83kkHtQ+bO7cZg3LQx6dt0c7SkK3+fGTTQkpixwUFeYmEib6QPr2M4FCfWdewz8e
 NjEXfqnUKlwkdmWVtnRuqb1fEg5inZgEZYvjCjlEo0OppWHjA+47Jx47alJJNSJ/xgXi
 YSn6jFM6uY3gUZabS2bcwSAEwa6epJjd8xnLog4k2MmcpOGpt2Bdn431zlzjHessnB+f
 14V2LhSQyxH5J5DWdz06dMYZWLXwzl4SlvHvNccHCvFAkxKUZ9EksLvD2ruvOWhmSdzm
 Gieg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8K0utLadLsw4UjEyu0FhPOfp24z9p6SPSj2BkLYVl4fCNSbAl//nfWFMM3Cty5s6S7yBHT1gtqDvb7/V/SJIVl@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwLIP0IcD/faAWiZhZT6uDeil2VXoqL8GajABf0DAFbVCxj+Tfo
 ck583ACFW3IZ50eHif1mOjPkosfhCca0iMNDIeN7muzasQ3KzxPI4jGPZ834ss6tucRyocw5UE4
 GITMhXOshBHTPgH5g7qwvU7J/NW8jmqBKeVvw58YGP8aJ/6f5TdhaQpI0fdI=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f013:b0:696:8325:f7f5 with SMTP id
 006d021491bc7-69c94330876mr681089eaf.4.1778789980928; Thu, 14 May 2026
 13:19:40 -0700 (PDT)
Date: Thu, 14 May 2026 13:19:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a062e5c.170a0220.196691.0007.GAE@google.com>
From: syzbot <syzbot+4af46ee83100e99bce09@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: aa54b1d27fe0
 rxrpc: Also unshare DATA/RESPONSE packets whe.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=14adabce580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.207 listed in wl.mailspike.net]
X-Headers-End: 1wNccJ-0001fS-7V
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_write_end_io (2)
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
X-Rspamd-Queue-Id: 25ECB546B4E
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
	TAGGED_FROM(0.00)[4af46ee83100e99bce09];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
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

HEAD commit:    aa54b1d27fe0 rxrpc: Also unshare DATA/RESPONSE packets whe..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14adabce580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2e8ebfec4636d32
dashboard link: https://syzkaller.appspot.com/bug?extid=4af46ee83100e99bce09
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1643c3ce580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12adabce580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/418e3ed628cf/disk-aa54b1d2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a35b53d0ab2f/vmlinux-aa54b1d2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/03c3fa0081b4/bzImage-aa54b1d2.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/13e397c7f935/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=158fad06580000)
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/2f91edde40dc/mount_8.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4af46ee83100e99bce09@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/data.c:388!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 31 Comm: ksoftirqd/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
RIP: 0010:f2fs_write_end_io+0x16df/0x1740 fs/f2fs/data.c:388
Code: 20 3c 9b 8b e8 12 0a f7 fc 90 0f 0b e8 0a cc 93 fd 48 8b 3c 24 48 c7 c6 20 3c 9b 8b e8 fa 09 f7 fc 90 0f 0b e8 f2 cb 93 fd 90 <0f> 0b e8 ea cb 93 fd 48 8b 3c 24 48 c7 c6 20 3c 9b 8b e8 da 09 f7
RSP: 0018:ffffc90000a5fb18 EFLAGS: 00010246
RAX: ffffffff8430aade RBX: ffffea0000d91c40 RCX: ffff88801d6b0000
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000100
R10: dffffc0000000000 R11: fffffbfff1f11dff R12: 0000000036471000
R13: ffffea0000d91c80 R14: 000000000000000b R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888126276000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007eff6352cff8 CR3: 000000002caa2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 blk_update_request+0x57e/0xe60 block/blk-mq.c:1016
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1178
 blk_complete_reqs block/blk-mq.c:1253 [inline]
 blk_done_softirq+0x10a/0x160 block/blk-mq.c:1258
 handle_softirqs+0x1de/0x6d0 kernel/softirq.c:622
 run_ksoftirqd+0x52/0x180 kernel/softirq.c:1076
 smpboot_thread_fn+0x541/0xa50 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_write_end_io+0x16df/0x1740 fs/f2fs/data.c:388
Code: 20 3c 9b 8b e8 12 0a f7 fc 90 0f 0b e8 0a cc 93 fd 48 8b 3c 24 48 c7 c6 20 3c 9b 8b e8 fa 09 f7 fc 90 0f 0b e8 f2 cb 93 fd 90 <0f> 0b e8 ea cb 93 fd 48 8b 3c 24 48 c7 c6 20 3c 9b 8b e8 da 09 f7
RSP: 0018:ffffc90000a5fb18 EFLAGS: 00010246
RAX: ffffffff8430aade RBX: ffffea0000d91c40 RCX: ffff88801d6b0000
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000100
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000100
R10: dffffc0000000000 R11: fffffbfff1f11dff R12: 0000000036471000
R13: ffffea0000d91c80 R14: 000000000000000b R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888126276000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007eff6352cff8 CR3: 000000002caa2000 CR4: 00000000003526f0


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
