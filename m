Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83172C43B8B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 09 Nov 2025 11:15:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dMXJ+QSTErcpx1WKQCu8hJlfPk/gIC0Yatw3oL0s9Eo=; b=aXiSnLDqYbm1xmwziWv8PP+6Yt
	ivSPydw5XCK+pLFJ6flkeNBpIg2G/sgX/9kw35HubQENQBI8/Rmkeyi4xeZKvvP89+IFXtXO/ZnvJ
	9lv0xJ5pC0nsePig/Ouog9mMxOxpf5RJF60BwIyYsHgQsif9mrpf1QKZE/pmoffBwDGA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vI2ST-0003dU-E4;
	Sun, 09 Nov 2025 10:15:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3xWkQaQkbACoYefQGRRKXGVVOJ.MUUMRKaYKXIUTZKTZ.IUS@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vI2SR-0003dO-US for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 09 Nov 2025 10:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NWfewmnudh1KlyEWNvuVvB5Kgj50o7QInWoa1pVfLis=; b=Uhskf+XcIC+sywHskb3HJTFa8n
 +hGTV+cc6f6yp++oR2kmnS7pX/kli9UVceG9Ajdcffzv6fqiNQLHEFLCPw/II+kYyjgWHwdR4ebz9
 XjWZ969vlhMQoUQ2pjk+JRE6wpMsqJd3bBwdTjKIkWj4xecKHjh3ClyXl4+TPFG7hCnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NWfewmnudh1KlyEWNvuVvB5Kgj50o7QInWoa1pVfLis=; b=L
 jDRu/RTzVyMfSf3GBk86QQPFtzy/umzOdcg3ob64KvjDHyQywmdx5rQEmB8yM3+wD6GhmTkYY0sP5
 sQOw3GY8GW8z4B/uYnxLI2LTTKwcZF4r3KkykWsifErnNKoww0SMDFWK8Ofb9quAoMRxUkSRwCzJt
 5n2YYeTEQRO4crd8=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vI2SR-00017o-Be for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 09 Nov 2025 10:15:39 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-433270dad0dso18365555ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 09 Nov 2025 02:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762683333; x=1763288133;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NWfewmnudh1KlyEWNvuVvB5Kgj50o7QInWoa1pVfLis=;
 b=wlL3J4/C6a9wCVfjFJRY7fY5Ltbi5Urk5g7Zf+YaUBKziTw3YFunrp3A0faZuaCFxJ
 dK85UAuxgjd8wgT/02x9AwF0VIWElLY7k73pF9Gz95ggapx7XaR7QkJmMf/nCYLdv6Ez
 5z/tTepJDrbm8Cdv1karcWCoYXLcTnoVHOyf/+hNZZAeiyzh8CWLGb7+CTgaNJvIJv21
 dEaxkKv2f/TweXT7F3l4D3wqs4DNPLEDOVsIJPMjQn29bilrc338XXLNQLgecxUgXlI4
 sSCvjplALaNNqqamUrXZcDGXEe4hIRgPcwccPh48Jgn3STuogmerfb+XojdPLiu6B0i0
 Tp/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYEoo7fqYl0TmVz/a0j/eJrofNQdCsY1T3AqSc64FpQQ6ndsVmpejYUTdGH9v5JhHmXSMiX9YZZ7S1MOHhnvdl@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx38M0zm8O78f+sc0CL+TkytXX4UXUxBcPKFIxtkSIIQpLWu10G
 N2Xf94wrHLf7ieAwpl2QiNkG/FbAY595hEt35K6jsSGNOrF6VLngNjnHOYUMwF8dLGg8UCSzlsm
 trGybDbL8qgBnQs8z7nLr8FYlUrhT7AFQhZurCu1bHG8svjeWpgW80o1tqxE=
X-Google-Smtp-Source: AGHT+IEbcKnfSa5fRGJI6MUUWScp8I9DxMyTDf8/KLrLsOwjjl8LC6bhITS7iNJ8+amgcbqzNaoHjpmnfLUcajxKRTAphhZ1AsKm
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc3:b0:433:43fb:37dd with SMTP id
 e9e14a558f8ab-43367de214emr71758115ab.5.1762683333724; Sun, 09 Nov 2025
 02:15:33 -0800 (PST)
Date: Sun, 09 Nov 2025 02:15:33 -0800
In-Reply-To: <68fc0765.a00a0220.9662e.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <691069c5.a70a0220.22f260.00aa.GAE@google.com>
From: syzbot <syzbot+f5d91b1897d5b094c6b4@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, chao@kernel.org, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, 
 ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 9c0826a5d9aa Add linux-next specific files for 20251107 git tree:
 linux-next console output:
 https://syzkaller.appspot.com/x/log.txt?x=11c44b42580000
 kernel config: https://syzkaller.apps [...] 
 Content analysis details:   (2.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.208 listed in wl.mailspike.net]
X-Headers-End: 1vI2SR-00017o-Be
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING in get_data
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

HEAD commit:    9c0826a5d9aa Add linux-next specific files for 20251107
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11c44b42580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2ebeee52bf052b8
dashboard link: https://syzkaller.appspot.com/bug?extid=f5d91b1897d5b094c6b4
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16263084580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14496a92580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/32b5c04a0baa/disk-9c0826a5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9438206c142a/vmlinux-9c0826a5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/129cd0208baa/bzImage-9c0826a5.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/be89fc48acf0/mount_3.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f5d91b1897d5b094c6b4@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (1024) and media sector size (512).
------------[ cut here ]------------
WARNING: kernel/printk/printk_ringbuffer.c:1278 at get_data+0x48a/0x840 kernel/printk/printk_ringbuffer.c:1278, CPU#1: syz.0.541/6553
Modules linked in:
CPU: 1 UID: 0 PID: 6553 Comm: syz.0.541 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
RIP: 0010:get_data+0x48a/0x840 kernel/printk/printk_ringbuffer.c:1278
Code: 83 c4 f8 48 b8 00 00 00 00 00 fc ff df 41 0f b6 04 07 84 c0 0f 85 ee 01 00 00 44 89 65 00 49 83 c5 08 eb 13 e8 87 47 1f 00 90 <0f> 0b 90 eb 05 e8 7c 47 1f 00 45 31 ed 4c 89 e8 48 83 c4 28 5b 41
RSP: 0018:ffffc9000c0eec40 EFLAGS: 00010293
RAX: ffffffff81a238a9 RBX: 00003fffffffffff RCX: ffff888026123d00
RDX: 0000000000000000 RSI: 00003fffffffffff RDI: 0000000000000000
RBP: 0000000000000012 R08: 0000000000000f4d R09: 0000003b6994bf6b
R10: 0000003b6994bf6b R11: 0000199962000021 R12: 0000000000000012
R13: 0000000000000000 R14: ffffc9000c0eed88 R15: 1ffffffff1bca6c2
FS:  000055557ac66500(0000) GS:ffff888125fc2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffec7fad000 CR3: 000000002ea20000 CR4: 00000000003526f0
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
 ntfs_inode_printk+0x5fd/0x700 fs/ntfs3/super.c:156
 ntfs_bad_inode+0x71/0x150 fs/ntfs3/fsntfs.c:910
 mi_enum_attr+0x7b9/0x9f0 fs/ntfs3/record.c:352
 ntfs_read_mft fs/ntfs3/inode.c:123 [inline]
 ntfs_iget5+0x245b/0x3860 fs/ntfs3/inode.c:542
 ntfs_fill_super+0x23ce/0x43d0 fs/ntfs3/super.c:1284
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
RIP: 0033:0x7f6530f90e6a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffec7fac3c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffec7fac450 RCX: 00007f6530f90e6a
RDX: 00002000000002c0 RSI: 0000200000000040 RDI: 00007ffec7fac410
RBP: 00002000000002c0 R08: 00007ffec7fac450 R09: 0000000000000082
R10: 0000000000000082 R11: 0000000000000246 R12: 0000200000000040
R13: 00007ffec7fac410 R14: 000000000001f853 R15: 00002000000000c0
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
