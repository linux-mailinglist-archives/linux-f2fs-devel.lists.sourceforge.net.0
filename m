Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C590C2F01B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 04 Nov 2025 03:43:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=YHdxHEnzq90yPyQ8B4R8/X1hyIezBIVbbhXlqNwlMv4=; b=jAmtILwHhW3G6h3R94cJ7LlfHo
	oYpEeK9z7BDeXvzESBCaAHzKm0kURoof87hDl/C6hBP0/y8S46S9MgyNtSKEZJ6QstzvZOJwa43iY
	0Dwi65iflCQE5jLY6SRGsZwnCVX+7HPxN3KcSFOF8DkJ7a8fjTKbtdDJPg4YI/Z995UA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vG70n-00045O-A5;
	Tue, 04 Nov 2025 02:43:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3NmgJaQkbAHsrxyjZkkdqZoohc.fnnfkdtrdqbnmsdms.bnl@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vG70m-00045I-GF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 02:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NBIw0SYrhKhi35dC1UwvoNNnW3Il9lAar0bIukFldbU=; b=HnILev8tqgcDfDPnE3+eduLovD
 kWkrMrEMFB6MHECfR7bmm/qX9Zw6yWgZOPER68XNyPkIJ9afBDBT4X2Yux+NnREg/pM4xLtNg5tE1
 wvYW+7fYwkMWBMbAa0krTkMcNuPBdcvHczniLL22CWGLdyENHL/v7AAhOl040T7C8BBM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NBIw0SYrhKhi35dC1UwvoNNnW3Il9lAar0bIukFldbU=; b=E
 /m3bvHurgGp75AhL75wDD1ThVWG/WOslkxZgyY/4rT711KY+UACe8ftEeYgZdPHvwctLx0YKL4Xjs
 Tvzu9pCEnEU98A9jdQWmLwIwwsMn98d3hSv7zI0BTKu12XdHkW0qCQyouyD5+bNHBIPTZh6BwUKpM
 6FmCZrEvlY+WuJwA=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vG70l-0005vB-SE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 02:43:08 +0000
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-94109728fadso492442139f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Nov 2025 18:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762224182; x=1762828982;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NBIw0SYrhKhi35dC1UwvoNNnW3Il9lAar0bIukFldbU=;
 b=dCHEsf+eT/+ECWM8RiuOYz5YLlk4bmDlQSnSLBtvzxoeII0WfLtwqpCMwQgAPzjOTZ
 8opy9UInCk3aUeAIPjZJZZ41Uymnf0nQKU/OJlxRMjP4gbVhUCRcDRlNROqu6K2j5vF9
 u/yt71rjfENNv3J5uc3pW1yHfy6NNgU/J0QX4yKjUmb2IDaduvMqrkGqLx0Qq4v9TGR0
 2acJL0Z63nl59P+QdKQSI5228+IytXIpNL824Buov01gRsVNfozw0D1MkKRwMh/LVLVV
 roQ5ZZrSBYOEj6ZaVYEjXdZmzvxgCd0aSEWnKjujWwHsEM8JKi8gpkx2HqTReDU7dSVC
 mJZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFXygWXLtWl8YB7kbmHobAQr/6oBKHtAypgkXzzyjfGKzfcX3PwzokK5a5WKZwbGNYykBjW3Q5SSZKoWrKiRVh@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyULGQIvbnHvor6kLuE7dISQwwinA//R68lXzFq9gxL/bxzVLjF
 eKePVXCUoNMmlyfQSdO/9YcamUS9m9loduwC+PyvbCV2kgDcIX1INvKJ358vEpneNZXVdA9qHvK
 owOcCeQYlC+R2gpkgjs3tzfmhhvS2Pz5DmV9vH+AIkCWRHDw9WhahpQXH+9c=
X-Google-Smtp-Source: AGHT+IE4zHEzVucOPYL+xz6/nTZPc+2B+jS+5ktcuCcpH5NHB6J00PeRw7cjAnyYOnMky1QPFtvntV155LaF0SvX5p90Y5mObxH1
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3416:b0:948:27b1:3d0f with SMTP id
 ca18e2360f4ac-94827b13dd6mr1845011939f.15.1762224182127; Mon, 03 Nov 2025
 18:43:02 -0800 (PST)
Date: Mon, 03 Nov 2025 18:43:02 -0800
In-Reply-To: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69096836.a70a0220.88fb8.0006.GAE@google.com>
From: syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>
To: brauner@kernel.org, chao@kernel.org, djwong@kernel.org, jaegeuk@kernel.org,
 joannelkoong@gmail.com, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: WARNING in get_data loop0: detected capacity
 change from 0 to 16 [ cut here ] WARNING:
 kernel/printk/printk_ringbuffer.c:1278
 at get_data+0x48a/0x840 kernel/printk/printk_ringbuffer.c:1278, CPU#1: [...]
 Content analysis details:   (2.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
X-Headers-End: 1vG70l-0005vB-SE
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

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in get_data

loop0: detected capacity change from 0 to 16
------------[ cut here ]------------
WARNING: kernel/printk/printk_ringbuffer.c:1278 at get_data+0x48a/0x840 kernel/printk/printk_ringbuffer.c:1278, CPU#1: syz.0.585/7652
Modules linked in:
CPU: 1 UID: 0 PID: 7652 Comm: syz.0.585 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
RIP: 0010:get_data+0x48a/0x840 kernel/printk/printk_ringbuffer.c:1278
Code: 83 c4 f8 48 b8 00 00 00 00 00 fc ff df 41 0f b6 04 07 84 c0 0f 85 ee 01 00 00 44 89 65 00 49 83 c5 08 eb 13 e8 a7 19 1f 00 90 <0f> 0b 90 eb 05 e8 9c 19 1f 00 45 31 ed 4c 89 e8 48 83 c4 28 5b 41
RSP: 0018:ffffc900035170e0 EFLAGS: 00010293
RAX: ffffffff81a1eee9 RBX: 00003fffffffffff RCX: ffff888033255b80
RDX: 0000000000000000 RSI: 00003fffffffffff RDI: 0000000000000000
RBP: 0000000000000012 R08: 0000000000000e55 R09: 000000325e213cc7
R10: 000000325e213cc7 R11: 00001de4c2000037 R12: 0000000000000012
R13: 0000000000000000 R14: ffffc90003517228 R15: 1ffffffff1bca646
FS:  00007f44eb8da6c0(0000) GS:ffff888125fda000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f44ea9722e0 CR3: 0000000066344000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 copy_data kernel/printk/printk_ringbuffer.c:1857 [inline]
 prb_read kernel/printk/printk_ringbuffer.c:1966 [inline]
 _prb_read_valid+0x672/0xa90 kernel/printk/printk_ringbuffer.c:2143
 prb_read_valid+0x3c/0x60 kernel/printk/printk_ringbuffer.c:2215
 printk_get_next_message+0x15c/0x7b0 kernel/printk/printk.c:2978
 console_emit_next_record kernel/printk/printk.c:3062 [inline]
 console_flush_one_record kernel/printk/printk.c:3194 [inline]
 console_flush_all+0x4cc/0xb10 kernel/printk/printk.c:3268
 __console_flush_and_unlock kernel/printk/printk.c:3298 [inline]
 console_unlock+0xbb/0x190 kernel/printk/printk.c:3338
 vprintk_emit+0x4c5/0x590 kernel/printk/printk.c:2423
 _printk+0xcf/0x120 kernel/printk/printk.c:2448
 _erofs_printk+0x349/0x410 fs/erofs/super.c:33
 erofs_fc_fill_super+0x1591/0x1b20 fs/erofs/super.c:746
 get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1692
 vfs_get_tree+0x92/0x2b0 fs/super.c:1752
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3641 [inline]
 do_new_mount+0x302/0xa10 fs/namespace.c:3717
 do_mount fs/namespace.c:4040 [inline]
 __do_sys_mount fs/namespace.c:4228 [inline]
 __se_sys_mount+0x313/0x410 fs/namespace.c:4205
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f44ea99076a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f44eb8d9e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f44eb8d9ef0 RCX: 00007f44ea99076a
RDX: 0000200000000180 RSI: 00002000000001c0 RDI: 00007f44eb8d9eb0
RBP: 0000200000000180 R08: 00007f44eb8d9ef0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00002000000001c0
R13: 00007f44eb8d9eb0 R14: 00000000000001a1 R15: 0000200000000080
 </TASK>


Tested on:

commit:         98231209 Add linux-next specific files for 20251103
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1370a292580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=43cc0e31558cb527
dashboard link: https://syzkaller.appspot.com/bug?extid=3686758660f980b402dc
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
