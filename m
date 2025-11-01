Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ABFC275C4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 01 Nov 2025 03:11:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=IKd90zyUqVAtt3+8Bt0w3ce3a9oWlDHHj2MSgw0mvKg=; b=HisErSG1fRfgECmo5Jtm9RFe29
	amIm7FwOWdW+4xKJirFJJyRp0wiBUpJsmW+EhwI8w3XBAcY9UfctXuXcbKM1bA9FxfPkWn7TDlB/S
	Fzg9ruaYY6WQAHSjjH0LAI4jpkBj0JIpGcrmY7zna3nxiZj3W9rM8+92h6cCCdgo9HF0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vF15b-0008QE-UC;
	Sat, 01 Nov 2025 02:11:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3UGwFaQkbAI09FG1r22v8r66zu.x55x2vB9v8t54Av4A.t53@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vF15b-0008Q6-2J for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 02:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y8wH2JlkS8rwz4h7Dq6s8besfCrkPbJyaWFvQHAG38c=; b=gD/xzYvbPwanzFgc+Ac7C5S01r
 wfCU+5e6lMBY3EtOdcwDaiUayeGLeBV6bqn4gw9ooGeADBE64HZOPG9D79pW7aVsH3e4Qe72iBf0+
 cZitKAQbgyCo5MHqyESB+rJor73ERbwgJaCduutRZE0Sx/wwMH/EPUhQsadT3MaVVbe0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Y8wH2JlkS8rwz4h7Dq6s8besfCrkPbJyaWFvQHAG38c=; b=j
 BHQe0/zxo8BM/JpQtFHC4TykO7dO/hdVW57bEkAooqUeWfe51dEn3cQxRHKaejo/a5G1/sKT4XnZE
 TIXeDzq2nbpHukZaO4vnn4uU8bUbR8hRJilEDRusEodcQju4Idmc/6eOY+wbgdwdf9mXqpzt5gnVs
 oQiJSd7AZZL5LfW0=;
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vF15a-0003iO-Gc for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 02:11:35 +0000
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-9374627bb7eso455281639f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 31 Oct 2025 19:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761963089; x=1762567889;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8wH2JlkS8rwz4h7Dq6s8besfCrkPbJyaWFvQHAG38c=;
 b=omBg4jmUGbjZ7q4LevCpUa/3dS5Ze+rr+gTQlhTSKN4XMa4ejZl9JBKQmtEI33kYT4
 bHSfHDOyYeZl49242goiHPxycqSijSxLoOvVbQHaWnMnBSksgKyKZ7eJ9CSoHAkauGDW
 wTmqAtuVj/GjBZmwbnzYxjsbaAgEdzCnMgNPtVru5CPLP8I3URLRY4vnppFgjo3JbrsO
 /jqUFCR54MY7W4EsSexbBp1/35XPOQm8rG5PsWCAB06B0BttEOpJC4TaedQZMvhZkeS0
 dMfUUPjn49/0r0OLeVJmFwjmbFhOk1B+FJsW1g58Sn3eevOFbR1Qh11xux303f62oBuK
 F9pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYB7HZ2lkpFRTo62AcHbQcJh6NvDFFv96e92pvRJGduS5Bm0+klE8kFBr9NjTyB3yxO+3YQrz8rytjnQTM6Pzd@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yws+Sx+nrTkx8lbQIQ11EeJp/R5ZwCTLyf0BGGRwR6ADJwn1Fma
 TDz0HrwLD43LipwzqjJLuuMSEWpHjjg3MY3A5Ath6fIKiIvzHSibauYjXOswClIM+K7ntD8Oxw8
 RAXCzjhfK6Df6J6kXNrQjoetkL7tT9c6Z3WfJnZAyWakrP17ma2R6i0PHJzw=
X-Google-Smtp-Source: AGHT+IEzesGSsLWX/EFccy4sTErr4FvPtAfe/c1E2omwJKxtrILDrP3iAzGkXHjWDghJqUY1wFYh1OAqdHkvq30NnOikP4OVaNgf
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4a:b0:422:a9aa:7ff4 with SMTP id
 e9e14a558f8ab-4330cf069bdmr81980165ab.11.1761963088808; Fri, 31 Oct 2025
 19:11:28 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:11:28 -0700
In-Reply-To: <68cc0578.050a0220.28a605.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69056c50.a70a0220.1e08cc.006c.GAE@google.com>
From: syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>
To: brauner@kernel.org, chao@kernel.org, djwong@kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 98bd8b16ae57 Add linux-next specific files for 20251031 git tree:
 linux-next console output:
 https://syzkaller.appspot.com/x/log.txt?x=163b2bcd980000
 kernel config: https://syzkaller.apps [...] 
 Content analysis details:   (2.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: storage.googleapis.com]
 [URI: syzkaller.appspot.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
X-Headers-End: 1vF15a-0003iO-Gc
Subject: Re: [f2fs-dev] [syzbot] [iomap?] kernel BUG in folio_end_read (2)
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

HEAD commit:    98bd8b16ae57 Add linux-next specific files for 20251031
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=163b2bcd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=63d09725c93bcc1c
dashboard link: https://syzkaller.appspot.com/bug?extid=3686758660f980b402dc
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=176fc342580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10403f34580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/975261746f29/disk-98bd8b16.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ad565c6cf272/vmlinux-98bd8b16.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1816a55a8d5f/bzImage-98bd8b16.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/d6d9eee31fdb/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=17803f34580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3686758660f980b402dc@syzkaller.appspotmail.com

 vms_complete_munmap_vmas+0x206/0x8a0 mm/vma.c:1279
 do_vmi_align_munmap+0x364/0x440 mm/vma.c:1538
 do_vmi_munmap+0x253/0x2e0 mm/vma.c:1586
 __vm_munmap+0x207/0x380 mm/vma.c:3196
 __do_sys_munmap mm/mmap.c:1077 [inline]
 __se_sys_munmap mm/mmap.c:1074 [inline]
 __x64_sys_munmap+0x60/0x70 mm/mmap.c:1074
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
------------[ cut here ]------------
kernel BUG at mm/filemap.c:1530!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 5989 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
RIP: 0010:folio_end_read+0x1e9/0x230 mm/filemap.c:1530
Code: 79 c7 ff 48 89 df 48 c7 c6 20 6d 74 8b e8 9f df 2e ff 90 0f 0b e8 d7 79 c7 ff 48 89 df 48 c7 c6 40 63 74 8b e8 88 df 2e ff 90 <0f> 0b e8 c0 79 c7 ff 48 89 df 48 c7 c6 20 6d 74 8b e8 71 df 2e ff
RSP: 0018:ffffc90003f8e268 EFLAGS: 00010246
RAX: c6904ff3387db700 RBX: ffffea0001b5ef00 RCX: 0000000000000000
RDX: 0000000000000007 RSI: ffffffff8d780a1b RDI: 00000000ffffffff
RBP: 0000000000000000 R08: ffffffff8f7d7477 R09: 1ffffffff1efae8e
R10: dffffc0000000000 R11: fffffbfff1efae8f R12: 1ffffd400036bde1
R13: 1ffffd400036bde0 R14: ffffea0001b5ef08 R15: 00fff20000004060
FS:  0000555572333500(0000) GS:ffff888125fe2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f57d6844000 CR3: 0000000075586000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 iomap_readahead+0x96a/0xbc0 fs/iomap/buffered-io.c:547
 iomap_bio_readahead include/linux/iomap.h:608 [inline]
 erofs_readahead+0x1c3/0x3c0 fs/erofs/data.c:383
 read_pages+0x17a/0x580 mm/readahead.c:163
 page_cache_ra_order+0x924/0xe70 mm/readahead.c:518
 filemap_readahead mm/filemap.c:2658 [inline]
 filemap_get_pages+0x7ff/0x1df0 mm/filemap.c:2704
 filemap_read+0x3f6/0x11a0 mm/filemap.c:2800
 __kernel_read+0x4cf/0x960 fs/read_write.c:530
 integrity_kernel_read+0x89/0xd0 security/integrity/iint.c:28
 ima_calc_file_hash_tfm security/integrity/ima/ima_crypto.c:480 [inline]
 ima_calc_file_shash security/integrity/ima/ima_crypto.c:511 [inline]
 ima_calc_file_hash+0x85e/0x16f0 security/integrity/ima/ima_crypto.c:568
 ima_collect_measurement+0x428/0x8f0 security/integrity/ima/ima_api.c:293
 process_measurement+0x1121/0x1a40 security/integrity/ima/ima_main.c:405
 ima_file_check+0xd7/0x120 security/integrity/ima/ima_main.c:656
 security_file_post_open+0xbb/0x290 security/security.c:2652
 do_open fs/namei.c:3977 [inline]
 path_openat+0x2f26/0x3830 fs/namei.c:4134
 do_filp_open+0x1fa/0x410 fs/namei.c:4161
 do_sys_openat2+0x121/0x1c0 fs/open.c:1437
 do_sys_open fs/open.c:1452 [inline]
 __do_sys_openat fs/open.c:1468 [inline]
 __se_sys_openat fs/open.c:1463 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1463
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0b08d8efc9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffec6a5d268 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f0b08fe5fa0 RCX: 00007f0b08d8efc9
RDX: 0000000000121140 RSI: 0000200000000000 RDI: ffffffffffffff9c
RBP: 00007f0b08e11f91 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000000013d R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0b08fe5fa0 R14: 00007f0b08fe5fa0 R15: 0000000000000004
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:folio_end_read+0x1e9/0x230 mm/filemap.c:1530
Code: 79 c7 ff 48 89 df 48 c7 c6 20 6d 74 8b e8 9f df 2e ff 90 0f 0b e8 d7 79 c7 ff 48 89 df 48 c7 c6 40 63 74 8b e8 88 df 2e ff 90 <0f> 0b e8 c0 79 c7 ff 48 89 df 48 c7 c6 20 6d 74 8b e8 71 df 2e ff
RSP: 0018:ffffc90003f8e268 EFLAGS: 00010246
RAX: c6904ff3387db700 RBX: ffffea0001b5ef00 RCX: 0000000000000000
RDX: 0000000000000007 RSI: ffffffff8d780a1b RDI: 00000000ffffffff
RBP: 0000000000000000 R08: ffffffff8f7d7477 R09: 1ffffffff1efae8e
R10: dffffc0000000000 R11: fffffbfff1efae8f R12: 1ffffd400036bde1
R13: 1ffffd400036bde0 R14: ffffea0001b5ef08 R15: 00fff20000004060
FS:  0000555572333500(0000) GS:ffff888125ee2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b30063fff CR3: 0000000075586000 CR4: 00000000003526f0


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
