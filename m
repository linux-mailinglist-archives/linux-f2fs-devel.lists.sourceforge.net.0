Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED57DCE6C44
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Dec 2025 13:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8fR/CwnhNolc0yvQch+vinlDYnt0tfxj/kY3Qj3pbws=; b=Vgi9FzfsrSq750HartiHd9b5+q
	vfqsnFBEg8uBmr/rbEMRmw3LUrRzxnvJEvInLAOnDw5j/HmlJLyEKvZHROvzGi4RRY17SILjBYRMy
	rnVPrvYFEP4fJ7AkVyDlQyWFjrwmw+PEbrWNI6/7BATP1abYu0BRJKrVbt6UBTrfr/Ho=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaCjg-0003d7-KT;
	Mon, 29 Dec 2025 12:52:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3hHlSaQkbABMBHI3t44xAt881w.z77z4xDBxAv76Cx6C.v75@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vaCjf-0003d1-So for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Dec 2025 12:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UiPM2cAXyfvdxGowciJiuCa8Xscg+zxabWemcI/m3OM=; b=kAUPpGol0PVsFad+6qfaekM7dw
 ndqJXBR6hHOCXGpMsXEcQyRpMxtt+FcmvZRLtQRu+OYBVI2g7BzbjRmmShkpFivhXrYK69t85xsDP
 bMvoQ+wppx5VBYrhi1aoGWibzBC+EdjI2Nzp6ZnOlJw0CALc6Z0mjiLgYFQIkUOIpSyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UiPM2cAXyfvdxGowciJiuCa8Xscg+zxabWemcI/m3OM=; b=B
 D5NWi8Zmn+WN+UJAEJdieJj72ybXqGLfNGMWpu6/SNQTjXhz5i0BNoypNTg4SNuVKGZiVx0W7om2C
 AfCBUKUXn5ZP/UERNVlqEKi1zhxEofSOYFryUCpsYTDicKBbrCPd2nZkaR9yBuWJf5UijzTIstT52
 wLr3+JrDyoCTBlUo=;
Received: from mail-ot1-f77.google.com ([209.85.210.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vaCjf-00026K-69 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Dec 2025 12:52:31 +0000
Received: by mail-ot1-f77.google.com with SMTP id
 46e09a7af769-7c70546acd9so19033474a34.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Dec 2025 04:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767012740; x=1767617540;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UiPM2cAXyfvdxGowciJiuCa8Xscg+zxabWemcI/m3OM=;
 b=xBh8FWqfTZd5Sus9zPkrpcXp9txhHg+aDmcefJpw8eLnH42l+WIQFZH6p3q/gzxCP0
 E+aw/nFh6NhcgWzEjjKoskAHqBz8RAo2IC3/iY4UGQcc8h7iKPf+Q/NOvHO6IbQily1n
 X8S28guhL/yikY5aZXTrPwfgs4k3+ZMoqZE0+8Mftwea/UoMUryOKU80QoTbipwZKEo3
 BPxMwRdZRslg6zw8SKPrJlMerKODAFln+NzWGMqhjQz0tHQRTgwdDKonWyFYjN3aNI7n
 S8qAsB+LmAi9XgszfLGRugRXUAhKd/m8Xg1n2kyTnbGik3IjbTy66Vv/i+jaeRGjW31R
 36TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAAaueanIrwJHES6f0O0Y+YfSi2a1XhKQuJbGG9h99+ZikrLKkdjSRze3hKE2PNGqzu+T9OIIpFVqcjsrCGTC1@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzIkZDcQJUFEYnVfbVmJVniTUQo7Ff07NhkuGmDBPQgEe7xOHPm
 aMnLyLBLdf2Yu+86S5TYRUJ8uqWOkNyciMaNDVRVrnBd3FNm4HeaoNh4bgeJmTI0SZ1gb1R3/1A
 uY9+T+CzfOCRHHCHIcZWry6NJPftqv+w+jxKoTtKdd45gbL/UBMjI/H/kl5Y=
X-Google-Smtp-Source: AGHT+IHFyrtM2x3EJ5t5V09gwnZNBBTj45c5GUx/lUc44bdMrPqyoDjWpRVLS5oXseEK/PIfX1aAgAB+JAlTVMdnPjcYK2FNNFl3
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16a7:b0:65d:a21:d1ee with SMTP id
 006d021491bc7-65d0ea5b641mr14538146eaf.23.1767012740592; Mon, 29 Dec 2025
 04:52:20 -0800 (PST)
Date: Mon, 29 Dec 2025 04:52:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69527984.050a0220.3b1790.000b.GAE@google.com>
From: syzbot <syzbot+c0a575209250b34549be@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: ccd1cdca5cd4
 Merge tag 'nfsd-6.19-1' of git://git.kernel.o.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=136b2f1a580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.77 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vaCjf-00026K-69
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_put_super (4)
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

syzbot found the following issue on:

HEAD commit:    ccd1cdca5cd4 Merge tag 'nfsd-6.19-1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=136b2f1a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f2b6fe1fdf1a00b
dashboard link: https://syzkaller.appspot.com/bug?extid=c0a575209250b34549be
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f9756bdd2faf/disk-ccd1cdca.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f03680f500a5/vmlinux-ccd1cdca.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ed5a6d62c5ac/bzImage-ccd1cdca.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c0a575209250b34549be@syzkaller.appspotmail.com

F2FS-fs (loop5): detect filesystem reference count leak during umount, type: 2, count: -1
------------[ cut here ]------------
kernel BUG at fs/f2fs/super.c:2008!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5980 Comm: syz-executor Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:f2fs_put_super+0x1165/0x1170 fs/f2fs/super.c:2008
Code: fd 41 bf 0c 00 00 00 48 89 df 44 89 fe e8 23 3f 00 00 48 89 df 31 f6 48 c7 c2 00 da 33 8b 44 89 f9 49 89 c0 e8 7c 70 fd ff 90 <0f> 0b 66 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc900056579a0 EFLAGS: 00010246
RAX: b18dcddbdfba5600 RBX: ffff88805e754000 RCX: b18dcddbdfba5600
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90005657b98 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff52000acaebd R12: ffff88805e754000
R13: dffffc0000000000 R14: 00000000ffffffff R15: 0000000000000002
FS:  000055556c854500(0000) GS:ffff888126cef000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fad42ebb000 CR3: 0000000029164000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 generic_shutdown_super+0x135/0x2c0 fs/super.c:643
 kill_block_super+0x44/0x90 fs/super.c:1722
 kill_f2fs_super+0x39f/0x6c0 fs/f2fs/super.c:5454
 deactivate_locked_super+0xbc/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1318
 task_work_run+0x1d4/0x260 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:44 [inline]
 exit_to_user_mode_loop+0xef/0x4e0 kernel/entry/common.c:75
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:159 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:194 [inline]
 do_syscall_64+0x2b7/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f142cea0a77
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffc21036858 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007f142cf23d7d RCX: 00007f142cea0a77
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc21036910
RBP: 00007ffc21036910 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffc210379a0
R13: 00007f142cf23d7d R14: 000000000002714a R15: 00007ffc210379e0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_put_super+0x1165/0x1170 fs/f2fs/super.c:2008
Code: fd 41 bf 0c 00 00 00 48 89 df 44 89 fe e8 23 3f 00 00 48 89 df 31 f6 48 c7 c2 00 da 33 8b 44 89 f9 49 89 c0 e8 7c 70 fd ff 90 <0f> 0b 66 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc900056579a0 EFLAGS: 00010246
RAX: b18dcddbdfba5600 RBX: ffff88805e754000 RCX: b18dcddbdfba5600
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90005657b98 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff52000acaebd R12: ffff88805e754000
R13: dffffc0000000000 R14: 00000000ffffffff R15: 0000000000000002
FS:  000055556c854500(0000) GS:ffff888126def000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fab7d2756c0 CR3: 0000000029164000 CR4: 00000000003526f0


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
