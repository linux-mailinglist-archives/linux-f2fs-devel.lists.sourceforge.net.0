Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA0F5FD5E3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Oct 2022 10:05:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oitDz-0004MQ-Jr;
	Thu, 13 Oct 2022 08:05:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <31MZHYwkbAKETZaLBMMFSBQQJE.HPPHMFVTFSDPOUFOU.DPN@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1oitDx-0004LZ-Hb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 08:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I51KfTKbgk4rY8YSX6F/YmYNBXk8I8h6VSzhs8RfJc4=; b=GtrfJobOSzuahY7IYFVC22Xq2M
 du2lWoHIKNodw6GjL5UI0SajqhE1/IRP7/Rzr2XdPW+ci3qwrc797BcpEgx4Da9UljMzG3ycgZnkr
 VvwtmAjzHUU/sk44uP5cvkZF/lRAXQdVm+CncFL/hcGy2N8BJlHGmaVXO+IxtVD62wZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=I51KfTKbgk4rY8YSX6F/YmYNBXk8I8h6VSzhs8RfJc4=; b=k
 fmhUSXA4ogOQ0ikpJ6rilhivBsxOyXaR3KFjWmY/aHvcpYoBPfjYEw+ihSmzpbM/+wt5OjjWcF+2K
 i8mzEBwq9D7F7jT98ecj73vBOPJkWTyoSCbTH+FsVBI+8iVFFgBRW8uy3h8KVokSuBa9/W+7EG+ll
 2J4aunKNW94g4Zdk=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oitDt-001yGC-UU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 08:05:49 +0000
Received: by mail-il1-f199.google.com with SMTP id
 x6-20020a056e021bc600b002fc96f780e7so945600ilv.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Oct 2022 01:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I51KfTKbgk4rY8YSX6F/YmYNBXk8I8h6VSzhs8RfJc4=;
 b=A35c0xkDTpGX6138OyWKbQ7VX9BkmrQwOHiZ/Ry91kMWKPxWGQrO7HsU+Jjfndfhp6
 6L6A2kPyTLFJkjNspFpLZFmMXaIVcjgbTCjbEroSrE9ijHIum1RgWQOOCVMuNVl6meXu
 K2wo4vdG6zz/o7vNoPsWgkMltzW0ukcS1XE455PkpZDXwvE6GKA7whMRO9ni0C8wdKrx
 TC6UGDgDRSYE7vWEbywwyDfYbJv1wKMR6ncsrdSbRh4BTtmHh46MQ5AGaZbbWET/31xG
 UgY+VPVd4Z0/lGW+7PLF0zuVz/Epumx+uxfKJT6LJ4HnMPY6KV23a+Vm3l1/zp4TOI7k
 VbmA==
X-Gm-Message-State: ACrzQf18R0xUHINQn2Wywt+1UQBIDQ1QkF1R7lDwpzN/lE1MLRkba0A0
 neeWUvpwaEtIHyKdwdi9wEJy06J3r9wqBInE1WojWq1idTkt
X-Google-Smtp-Source: AMsMyM4vvevbmpgx/vNPnuT2rCItgWUCeOmv/TzQnNComfB1jafI5+1ktBpXRHXqCZBD7PV4djBa1yzqvOHy6XMCJdN4qdlnCj5y
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2103:b0:35a:75b6:9992 with SMTP id
 n3-20020a056638210300b0035a75b69992mr16913367jaj.244.1665648340435; Thu, 13
 Oct 2022 01:05:40 -0700 (PDT)
Date: Thu, 13 Oct 2022 01:05:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a7077705eae5f90c@google.com>
From: syzbot <syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: bbed346d5a96
 Merge branch 'for-next/core' into for-kernelci git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
X-Headers-End: 1oitDt-001yGC-UU
Subject: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in f2fs_stop_discard_thread
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

HEAD commit:    bbed346d5a96 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13615406880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3a4a45d2d827c1e
dashboard link: https://syzkaller.appspot.com/bug?extid=035a381ea1afb63f098d
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15281162880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=137aa942880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8e91bc79312/disk-bbed346d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c1cb3fb3b77e/vmlinux-bbed346d.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/eb56ba4877e7/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 264192
F2FS-fs (loop0): invalid crc_offset: 0
F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Mounted with checkpoint version = 3651456e
Unable to handle kernel NULL pointer dereference at virtual address 000000000000001c
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000010899a000
[000000000000001c] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 3029 Comm: syz-executor654 Not tainted 6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __lse_atomic_fetch_add_relaxed arch/arm64/include/asm/atomic_lse.h:62 [inline]
pc : arch_atomic_fetch_add_relaxed arch/arm64/include/asm/atomic.h:49 [inline]
pc : atomic_fetch_add_relaxed include/linux/atomic/atomic-instrumented.h:117 [inline]
pc : __refcount_add include/linux/refcount.h:193 [inline]
pc : __refcount_inc include/linux/refcount.h:250 [inline]
pc : refcount_inc include/linux/refcount.h:267 [inline]
pc : get_task_struct include/linux/sched/task.h:110 [inline]
pc : kthread_stop+0x34/0x1c0 kernel/kthread.c:703
lr : __refcount_add include/linux/refcount.h:193 [inline]
lr : __refcount_inc include/linux/refcount.h:250 [inline]
lr : refcount_inc include/linux/refcount.h:267 [inline]
lr : get_task_struct include/linux/sched/task.h:110 [inline]
lr : kthread_stop+0x30/0x1c0 kernel/kthread.c:703
sp : ffff8000128abb60
x29: ffff8000128abb60 x28: 0000000000000000 x27: 000000000000007e
x26: ffff80000d30cf28 x25: ffff80000d309000 x24: 0000000000000008
x23: ffffffffffffffff x22: 0000000000000000 x21: 0000000000000000
x20: fffffffffffffff4 x19: 000000000000001c x18: 00000000000000c0
x17: ffff80000dd0b198 x16: ffff80000db49158 x15: ffff0000c665cf80
x14: 0000000000000000 x13: 00000000ffffffff x12: ffff0000c665cf80
x11: ff808000081403c0 x10: 0000000000000000 x9 : ffff8000081403c0
x8 : 0000000000000001 x7 : ffff8000095d331c x6 : 0000000000000000
x5 : 000000008010000f x4 : fffffc00032f6a20 x3 : 000000008010000f
x2 : ffff0000cbda8100 x1 : 0000000100000000 x0 : 0000000000000000
Call trace:
 __refcount_add include/linux/refcount.h:193 [inline]
 __refcount_inc include/linux/refcount.h:250 [inline]
 refcount_inc include/linux/refcount.h:267 [inline]
 get_task_struct include/linux/sched/task.h:110 [inline]
 kthread_stop+0x34/0x1c0 kernel/kthread.c:703
 f2fs_stop_discard_thread+0x3c/0x5c fs/f2fs/segment.c:1638
 kill_f2fs_super+0x5c/0x194 fs/f2fs/super.c:4522
 deactivate_locked_super+0x70/0xe8 fs/super.c:332
 deactivate_super+0xd0/0xd4 fs/super.c:363
 cleanup_mnt+0x1f8/0x234 fs/namespace.c:1186
 __cleanup_mnt+0x20/0x30 fs/namespace.c:1193
 task_work_run+0xc4/0x14c kernel/task_work.c:177
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x26c/0xbe0 kernel/exit.c:795
 do_group_exit+0x60/0xe8 kernel/exit.c:925
 __do_sys_exit_group kernel/exit.c:936 [inline]
 __se_sys_exit_group kernel/exit.c:934 [inline]
 __wake_up_parent+0x0/0x40 kernel/exit.c:934
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
 el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581
Code: 9100a293 d503201f 94057e16 52800028 (b8280275) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	9100a293 	add	x19, x20, #0x28
   4:	d503201f 	nop
   8:	94057e16 	bl	0x15f860
   c:	52800028 	mov	w8, #0x1                   	// #1
* 10:	b8280275 	ldadd	w8, w21, [x19] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
