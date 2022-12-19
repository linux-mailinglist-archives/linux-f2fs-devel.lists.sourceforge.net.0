Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E2650913
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Dec 2022 10:08:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7C8c-0004YM-02;
	Mon, 19 Dec 2022 09:08:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3EiqgYwkbAAs39Avlwwp2l00to.rzzrwp53p2nzy4py4.nzx@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1p7C8Z-0004YD-G4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Dec 2022 09:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/0IFu5r4+F7D14UR9MEQvuAXQT7FSJIFLCsKF+v3qiU=; b=Gj2Tkg8sajRL8rNXNehsCeHSPk
 SGOjTz1yAquAc7G3IwSb5TJBHogx1tW6FH/R5Bs5U+oRxa5lE45tkdMozMZcqRMoOzJnxZ566u+wR
 XxwZ8hQ8cf+kwb3CrKySD93J71OZ+QrQJR5RAIqR02T/FxkeyzKarK2Gxp7AkN7wG288=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/0IFu5r4+F7D14UR9MEQvuAXQT7FSJIFLCsKF+v3qiU=; b=c
 RAHX/z5zK5bQnLUoJvUDoS3cJ7nD27qKUs2yPxhhigo5QujJUJp6AvD8HknK022YHKAiLNYFtOT1N
 CJ4MzXYuGPSG7uahcfZHlN5ZKTu4enEeeRY9NDMbvbFdFO29HBYWtJlNypkFzJeTX8c95RC8A2mZp
 0hnkr/So6iwzBNs8=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p7C8W-004Wvh-7Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Dec 2022 09:08:43 +0000
Received: by mail-il1-f197.google.com with SMTP id
 l13-20020a056e021c0d00b003034e24b866so6346741ilh.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Dec 2022 01:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/0IFu5r4+F7D14UR9MEQvuAXQT7FSJIFLCsKF+v3qiU=;
 b=DS9eSCuTkBxO6JUlVEHm3F6CzRbsHwL27bD2K7ID2Ivk2rzX8ULPn22d92x1U5bycO
 a8oIGPqqUJ414TUHpwQKiovIWYaAaZAbdrKbfqCCGbxfbbfvlw3ZyFloaoL9pZLudYwH
 dzWy43IZagEqzvbmSdV9bZkzb5SAZ+eBVLPnRj/YqlSPYZomCtJXeAWEcQsrZsBm8Ni+
 6KacI0N1476rReuySbVcS0aBpLb+aulbLV4NlBvYbdU4Ws98J11ekn5w0bkjGPpvWlAf
 tDavxQYFEY8az7woREhXq8ZlWYWFrwxHkZqYb2ynrFkitKIX9MKGqWS9IM0UMNUdPdDH
 rHNw==
X-Gm-Message-State: ANoB5pkUJ/hm+JwWLDfw08gQmGJtEv9NjWuAsvHdsArTqCp1j3lfVSdg
 8JLBSb8RoHDRHIhZ61UUzhmvuoYac6lTrzaCT0O17DAosXjT
X-Google-Smtp-Source: AA0mqf4zQyrdIslyyVPl9xgpjBXtCORArAcwuxr9pUG5/cE1pjlzsjFG4U/vSwBBfhvgQyLFptCBy0/fwhZ6WECImxld57EZn+zR
MIME-Version: 1.0
X-Received: by 2002:a05:6638:345b:b0:38a:c192:48b2 with SMTP id
 q27-20020a056638345b00b0038ac19248b2mr2065099jav.203.1671440914688; Mon, 19
 Dec 2022 01:08:34 -0800 (PST)
Date: Mon, 19 Dec 2022 01:08:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fbb00605f02aa99c@google.com>
From: syzbot <syzbot+00e671c059932a115ea4@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: a5541c0811a0
 Merge branch 'for-next/core' into for-kernelci git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
X-Headers-End: 1p7C8W-004Wvh-7Y
Subject: [f2fs-dev] [syzbot] [f2fs?] BUG: unable to handle kernel NULL
 pointer dereference in f2fs_release_folio
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

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=14e39af7880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=00e671c059932a115ea4
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+00e671c059932a115ea4@syzkaller.appspotmail.com

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000f4f
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000239c25000
[0000000000000f4f] pgd=0800000239ac9003, p4d=0800000239ac9003, pud=080000023986f003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 25727 Comm: syz-executor.0 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : f2fs_release_folio+0x74/0x180 fs/f2fs/data.c:3698
lr : generic_test_bit include/asm-generic/bitops/generic-non-atomic.h:128 [inline]
lr : folio_test_dirty include/linux/page-flags.h:479 [inline]
lr : f2fs_release_folio+0x5c/0x180 fs/f2fs/data.c:3694
sp : ffff8000213cb580
x29: ffff8000213cb580 x28: 0000000000000001 x27: dead000000000100
x26: fffffc0004e8ed48 x25: ffff0000ca783468 x24: ffff8000213cba78
x23: 0000000000000001 x22: ffffffffffffffff x21: ffff0000ca783240
x20: 0000000000000000 x19: fffffc0004e8ed40 x18: 00000000000000c0
x17: ffff80000dda8198 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000002 x13: 0000000000000003 x12: 0000000000040000
x11: ff8080000931aeec x10: 0000000000000002 x9 : ffff0001f9be4ec0
x8 : ffff000139c2b000 x7 : ffff80000841b904 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000213cb5c0
x2 : ffff000116d8d000 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 F2FS_SB fs/f2fs/f2fs.h:1995 [inline]
 F2FS_I_SB fs/f2fs/f2fs.h:2000 [inline]
 F2FS_M_SB fs/f2fs/f2fs.h:2005 [inline]
 f2fs_release_folio+0x74/0x180 fs/f2fs/data.c:3697
 filemap_release_folio+0xc0/0x238 mm/filemap.c:3948
 shrink_folio_list+0xdbc/0x337c mm/vmscan.c:1982
 shrink_inactive_list+0x30c/0x54c mm/vmscan.c:2489
 shrink_list mm/vmscan.c:2728 [inline]
 shrink_lruvec+0x218/0x5b4 mm/vmscan.c:5923
 shrink_node_memcgs+0x13c/0x2c4 mm/vmscan.c:6110
 shrink_node+0xb4/0x600 mm/vmscan.c:6141
 shrink_zones+0x1bc/0x408 mm/vmscan.c:6379
 do_try_to_free_pages+0xd0/0x42c mm/vmscan.c:6441
 try_to_free_mem_cgroup_pages+0x174/0x244 mm/vmscan.c:6756
 try_charge_memcg+0x1a8/0x650 mm/memcontrol.c:2681
 try_charge mm/memcontrol.c:2823 [inline]
 mem_cgroup_charge_skmem+0x50/0x150 mm/memcontrol.c:7209
 sock_reserve_memory+0x88/0x144 net/core/sock.c:1018
 sk_setsockopt+0xb54/0x1694 net/core/sock.c:1518
 sock_setsockopt+0x48/0x60 net/core/sock.c:1542
 __sys_setsockopt+0x21c/0x31c net/socket.c:2248
 __do_sys_setsockopt net/socket.c:2263 [inline]
 __se_sys_setsockopt net/socket.c:2260 [inline]
 __arm64_sys_setsockopt+0x30/0x44 net/socket.c:2260
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
Code: 2a1f03e0 f9400115 f94016a8 f9433d16 (b94f52d7) 
---[ end trace 0000000000000000 ]---
pstore: crypto_comp_compress failed, ret = -22!
pstore: crypto_comp_compress failed, ret = -22!
pstore: crypto_comp_compress failed, ret = -22!
pstore: crypto_comp_compress failed, ret = -22!
pstore: crypto_comp_compress failed, ret = -22!
pstore: crypto_comp_compress failed, ret = -22!
----------------
Code disassembly (best guess):
   0:	2a1f03e0 	mov	w0, wzr
   4:	f9400115 	ldr	x21, [x8]
   8:	f94016a8 	ldr	x8, [x21, #40]
   c:	f9433d16 	ldr	x22, [x8, #1656]
* 10:	b94f52d7 	ldr	w23, [x22, #3920] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
