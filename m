Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6267ECB0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Jan 2023 18:41:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLSjZ-0005jP-27;
	Fri, 27 Jan 2023 17:41:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <31wzUYwkbAGYWcdOEPPIVETTMH.KSSKPIYWIVGSRXIRX.GSQ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pLSjX-0005jI-3D for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Jan 2023 17:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=miKO8nRIAl/PPu614CPsgHa5rh/GvcHtJLm9Wlk+k9s=; b=MPaEb3g3OEdXAdmoAFQrWOmggq
 axrof8/NZE3u6d62GJCGKU55zwI3Ed+iEZORUVIHAdod6CGiE4Dqzha+Q++ebKa3sVW++qCXr4Mzp
 fUCIg3wprL+JHcqE18ltWJeBvtrHJ6QnEwY8AbP85PTsttTH2oHd0D5+auO9KFK03pGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=miKO8nRIAl/PPu614CPsgHa5rh/GvcHtJLm9Wlk+k9s=; b=k
 wXsFo8TKIU4peKJVAG//l1+B0f6zODvpKMNzqF0byPGU1vnpNp5JJ1XyOaKVsZ77u56sX1UQuPecL
 lfal8oobSNkx/wQNR/jIkAZ6Q9xUmGbeHqe0vAUgHA63izexUtIQUjCIdTZg3axEwJYEACEZyu38e
 abUEzXAjGhZzB47c=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pLSjU-0002yj-Is for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Jan 2023 17:41:50 +0000
Received: by mail-il1-f199.google.com with SMTP id
 u7-20020a056e021a4700b0030f4631a1e9so3487382ilv.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Jan 2023 09:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=miKO8nRIAl/PPu614CPsgHa5rh/GvcHtJLm9Wlk+k9s=;
 b=y/6t90PtyTi33XVYMGMCa5ftH0jo6R2VMzI9Cv3OQZLDKL/bUDn+JTtplk3Z7TAPfc
 PMaI9vXODy9CkJ3TJ17i/e0PUioEIwznzYcBwIVhWLNrFTT7CLxyOw3m9/M8KBvlVR4W
 A3MLVZ2JeLUTbSIGxPwPTQyRaq0NAnNoRNSPLR0te/BhfTKis4Lsu4ke6aYu/EW0kbxL
 JIvc+Zm4lK4EH3EedkONUYboiWIwqWAIoQ4NM/fy+GlL3/lNl4abX2dVkbTDHMnREUkG
 rlV6MPdjhSsbo7LgEGQPxjOO/E6Y+8gV/g+0dJNFKX1fEbSa2FWmB9HOKU1XjaQ7esMR
 VNoA==
X-Gm-Message-State: AFqh2kqBzbqEgQklqOqMXMu7oO/8zKUzdFLeS9HC3FwYiCqtJuOUT30z
 gyK3iB1QnJliHd4c4Nr+zICWapTbY5Y+b+tuNI6PpZZxaY9n
X-Google-Smtp-Source: AMrXdXu7OX/QUqJfC/WAyUx+HnKc2Nt4wn5iS3QQof5w6mH0iHQtjF68B/52N/IQgbdE3jJhxl1RM4pd5Da+WTx74lXf6KKxzUXr
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216b:b0:30c:5f8d:886f with SMTP id
 s11-20020a056e02216b00b0030c5f8d886fmr4750534ilv.7.1674841303048; Fri, 27 Jan
 2023 09:41:43 -0800 (PST)
Date: Fri, 27 Jan 2023 09:41:43 -0800
In-Reply-To: <0000000000003d19f805f25b3c71@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ec6bdf05f3426051@google.com>
From: syzbot <syzbot+15d87e3695975269de2c@syzkaller.appspotmail.com>
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
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 1dc22be1f91f Merge branch 'for-next/core' into for-kernelci git
 tree: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
X-Headers-End: 1pLSjU-0002yj-Is
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in __destroy_extent_tree
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

HEAD commit:    1dc22be1f91f Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=121135cd480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e8cf742d9a45bfb6
dashboard link: https://syzkaller.appspot.com/bug?extid=15d87e3695975269de2c
compiler:       Debian clang version 13.0.1-6~deb11u1, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1322f625480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=154ae485480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ae0fce51809c/disk-1dc22be1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2e13fba82ffb/vmlinux-1dc22be1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8d97a32221e2/Image-1dc22be1.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/6bb4c8db9bf2/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+15d87e3695975269de2c@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/extent_cache.c:1191!
Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 4444 Comm: syz-executor879 Not tainted 6.2.0-rc5-syzkaller-17295-g1dc22be1f91f #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __destroy_extent_tree+0x2dc/0x324 fs/f2fs/extent_cache.c:1191
lr : __destroy_extent_tree+0x2dc/0x324 fs/f2fs/extent_cache.c:1191
sp : ffff80000ff0ba90
x29: ffff80000ff0bac0 x28: ffff0000caf45200 x27: 0000000000000000
x26: ffff0000ca1c2000 x25: ffff0000caf77000 x24: 0000000000000001
x23: ffff0000ca1c2bf0 x22: 0000000000000001 x21: ffff0000caf75120
x20: ffff0000caf44bf0 x19: 0000000000000000 x18: 0000000000000109
x17: 0000000000000000 x16: ffff80000dd97118 x15: ffff0000c9558000
x14: 00000000000000c0 x13: 00000000ffffffff x12: ffff0000c9558000
x11: ff8080000937af04 x10: 0000000000000000 x9 : ffff80000937af04
x8 : ffff0000c9558000 x7 : ffff80000937ae40 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : ffff0000c9558000 x1 : 0000000000000001 x0 : 0000000000000000
Call trace:
 __destroy_extent_tree+0x2dc/0x324 fs/f2fs/extent_cache.c:1191
 f2fs_destroy_extent_tree+0x24/0x40 fs/f2fs/extent_cache.c:1204
 f2fs_evict_inode+0x180/0x97c fs/f2fs/inode.c:789
 evict+0xec/0x334 fs/inode.c:664
 iput_final fs/inode.c:1747 [inline]
 iput+0x2c4/0x324 fs/inode.c:1773
 f2fs_abort_atomic_write+0x60/0x2c0 fs/f2fs/segment.c:196
 f2fs_ioc_abort_atomic_write fs/f2fs/file.c:2182 [inline]
 __f2fs_ioctl+0x1338/0x3320 fs/f2fs/file.c:4156
 f2fs_ioctl+0x74/0xbc fs/f2fs/file.c:4242
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __arm64_sys_ioctl+0xd0/0x140 fs/ioctl.c:856
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x104 arch/arm64/kernel/syscall.c:193
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
Code: 17ffffed 97bce56a d4210000 97bce568 (d4210000) 
---[ end trace 0000000000000000 ]---



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
