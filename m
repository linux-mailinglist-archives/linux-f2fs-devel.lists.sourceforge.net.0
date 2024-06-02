Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C988D7384
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  2 Jun 2024 05:46:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sDcAo-0004eb-9v;
	Sun, 02 Jun 2024 03:46:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3_OpbZgkbAHsrxyjZkkdqZoohc.fnnfkdtrdqbnmsdms.bnl@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sDcAh-0004dw-VR for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Jun 2024 03:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jdZaO1NNvfMfg/xJ1g6VKs8HYRcpBdNPd/3YBF7Tpo0=; b=fIVkfgfY91+i26eB6oJxxlnefC
 j/OmHVE7NL50DWexDnPNDO7lnd++VBbK54VmXH93svvbisdoxKogwtaGyp8JW1BHRAqUiOcNGQ3Pw
 SkckVNZMTl1s9/nw0sGK/IZAGjfrZG/nZQU1dE8UGgme4Ldp0swWBUnMYBCvvhq8Bzbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jdZaO1NNvfMfg/xJ1g6VKs8HYRcpBdNPd/3YBF7Tpo0=; b=k
 fdjTlw+tATom9B97Ks27lrHgBl/6UMcXbxNqSuJunLAKgRh7RGarAQ7iGjF3gEHWo+R3PLI4oYnXs
 ZdRwjd2b68VfbJcgV1Vjo66sZFOMkwIUZv9bIZLiGjNRoTJT0lhrZSZgC+IJ4kCi+NmEd+gUQha36
 G1ZrZNywI9t9/d1E=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sDcAi-00052I-75 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Jun 2024 03:46:16 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-36da6da1d98so35381625ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Jun 2024 20:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717299965; x=1717904765;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jdZaO1NNvfMfg/xJ1g6VKs8HYRcpBdNPd/3YBF7Tpo0=;
 b=oXeZJn3FdOJa7ih/FcnxxbThl3FGMt4DY6CCGpfIN9ylROcr3Blr92cJ2TXOpEhncP
 F7seZitRRmCH54h/B0nn6w2S6OwYKM3Grwjrsj16sX5hhXkXwGcxZ4PFOqLLkFPq1XnS
 atG6D4ho2NtBEyz0Lf3vPCXEMXNDnsLH1tfIb3RNj3wS44bAVqM9kBu6XoUe1QErneTw
 OAvQkLUxJ52hdWRsZJEuu3cwkrA9UMaTo1YcRRglKB9egKwM+65uJIgm7iekr7czU8an
 qdti4UiJ7LzJWpoC1zzRM9C5Sqlf/4+T0S0ZQP7/q9QkYZm/3AChfDSs5JIDNdTq2Ucc
 GkTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgiUUZ8F+9j/ow/BUZ71C1vwHJqP2Bqp8aoeUnMb2/S/IbhsnMQZNk+7WVpcBX6pgJBWrEZc46Tp1idTPFjBhlEiEPa6L3aQvYU1qGlT6p55bH+CbVPw==
X-Gm-Message-State: AOJu0YyRVGO6SygJeLtfcJV3PoUR6JacnbFxbyQbFHp6gTi6gfGGz03K
 bY15t4Sp5+Q2UG70/aha+q83/O7fPfIPDOuHE/4SiWe7i+ntz7ZrtgdFxKqI3bc4Oc882jMwGok
 zDD6fkHTcqAuEgBP+0XqU6Gv7Sw6omb5IveonGuyJH1wj2jAMnMvbN0I=
X-Google-Smtp-Source: AGHT+IFLEZ8vWRTHlOpAJT+955J8E1QvkBjpgAL78/rciAqlnjDb7I+dtmrtkT88HzP37E5s9e878wmClXICvmsrokVjjTtXjn3L
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e08:b0:374:5eee:dc2f with SMTP id
 e9e14a558f8ab-3748b8f23b6mr5680435ab.0.1717299964841; Sat, 01 Jun 2024
 20:46:04 -0700 (PDT)
Date: Sat, 01 Jun 2024 20:46:04 -0700
In-Reply-To: <d586a439-4f58-4409-8a60-6a00614ec346@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000609f770619e00ec5@google.com>
From: syzbot <syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com>
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
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: kernel BUG in f2fs_write_inline_data loop0:
 detected capacity change from 0 to 40427 F2FS-fs (loop0): Invalid
 log_blocksize
 (268), supports only 12 F2FS-fs (loop0): Can't find valid F2FS filesystem
 in 1th superblock F2FS-fs (loop0): Foun [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.198 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.198 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.166.198 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sDcAi-00052I-75
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_write_inline_data
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

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
kernel BUG in f2fs_write_inline_data

loop0: detected capacity change from 0 to 40427
F2FS-fs (loop0): Invalid log_blocksize (268), supports only 12
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Try to recover 1th superblock, ret: 0
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
------------[ cut here ]------------
kernel BUG at fs/f2fs/inline.c:276!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 1 PID: 5967 Comm: syz-executor Not tainted 6.9.0-syzkaller-10227-g9ee8c306dc6b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
RIP: 0010:f2fs_write_inline_data+0x781/0x790 fs/f2fs/inline.c:276
Code: ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c e3 fc ff ff 48 89 df e8 cf da 09 fe e9 d6 fc ff ff e8 75 68 96 07 e8 30 03 a4 fd 90 <0f> 0b e8 28 03 a4 fd 90 0f 0b 0f 1f 44 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc9000352eb20 EFLAGS: 00010293
RAX: ffffffff83f22ec0 RBX: 0000000000000001 RCX: ffff888024a21e00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc9000352ec50 R08: ffffffff83f22985 R09: 1ffff1100d23c095
R10: dffffc0000000000 R11: ffffed100d23c096 R12: ffffc9000352eba8
R13: 1ffff1100d23c095 R14: ffffc9000352eba0 R15: ffffc9000352ebb0
FS:  00007efdd7bfa6c0(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020002000 CR3: 000000007ac94000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_write_single_data_page+0xbb6/0x1e90 fs/f2fs/data.c:2888
 f2fs_write_cache_pages fs/f2fs/data.c:3187 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3342 [inline]
 f2fs_write_data_pages+0x1efe/0x3a90 fs/f2fs/data.c:3369
 do_writepages+0x359/0x870 mm/page-writeback.c:2634
 filemap_fdatawrite_wbc+0x125/0x180 mm/filemap.c:397
 __filemap_fdatawrite_range mm/filemap.c:430 [inline]
 file_write_and_wait_range+0x1aa/0x290 mm/filemap.c:788
 f2fs_do_sync_file+0x68a/0x1ae0 fs/f2fs/file.c:276
 generic_write_sync include/linux/fs.h:2806 [inline]
 f2fs_file_write_iter+0x7bd/0x24e0 fs/f2fs/file.c:4977
 call_write_iter include/linux/fs.h:2114 [inline]
 new_sync_write fs/read_write.c:497 [inline]
 vfs_write+0xa72/0xc90 fs/read_write.c:590
 ksys_write+0x1a0/0x2c0 fs/read_write.c:643
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x240 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7efdd6e7cee9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007efdd7bfa0c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007efdd6fb3fa0 RCX: 00007efdd6e7cee9
RDX: 0000000000002000 RSI: 0000000020000040 RDI: 0000000000000006
RBP: 00007efdd6ec947f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007efdd6fb3fa0 R15: 00007ffd0e21ca28
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_write_inline_data+0x781/0x790 fs/f2fs/inline.c:276
Code: ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c e3 fc ff ff 48 89 df e8 cf da 09 fe e9 d6 fc ff ff e8 75 68 96 07 e8 30 03 a4 fd 90 <0f> 0b e8 28 03 a4 fd 90 0f 0b 0f 1f 44 00 00 90 90 90 90 90 90 90
RSP: 0018:ffffc9000352eb20 EFLAGS: 00010293
RAX: ffffffff83f22ec0 RBX: 0000000000000001 RCX: ffff888024a21e00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc9000352ec50 R08: ffffffff83f22985 R09: 1ffff1100d23c095
R10: dffffc0000000000 R11: ffffed100d23c096 R12: ffffc9000352eba8
R13: 1ffff1100d23c095 R14: ffffc9000352eba0 R15: ffffc9000352ebb0
FS:  00007efdd7bfa6c0(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020002000 CR3: 000000007ac94000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         9ee8c306 f2fs: fix to truncate preallocated blocks in ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
console output: https://syzkaller.appspot.com/x/log.txt?x=12ab0a4a980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=48a63c58ee55467e
dashboard link: https://syzkaller.appspot.com/bug?extid=848062ba19c8782ca5c8
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
