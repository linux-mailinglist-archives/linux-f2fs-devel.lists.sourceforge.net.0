Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3214285BC4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Oct 2020 11:18:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQ5ah-0000u8-DF; Wed, 07 Oct 2020 09:18:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <324d9XwkbAOIWcdOEPPIVETTMH.KSSKPIYWIVGSRXIRX.GSQ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1kQ5ag-0000tO-1L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 09:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=siXcRoWiOT6IB9ZzaXzxLDjCcyJ5bZ2i3vOd6vwCjbw=; b=YhjL28D5D1p1+tMzI+GvpnIddq
 XdJWisOfPJeQ3eQGEsLEf/dX7jF/bB4gl20hmczQND/D7gyrJEMBOt3FP5vOMh14BPMkKoLIZV0fY
 SvJ+ATte73JftHtpuGf3cXrQEfEl/LSqFG274x7XdLXTUeOie+8DQTdyL3ELtLh1OmKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=siXcRoWiOT6IB9ZzaXzxLDjCcyJ5bZ2i3vOd6vwCjbw=; b=C
 gkIg9ybKoPpfMe3/tCGPVFCaCythQ/VRU43LQdoIljC0GmtdqgjkWoxWMtRRgGZyjwUufdBm8gn9i
 8ZXyZwoBwZkB1kJFon3z8cUIhBGvKzPv0jvOBoZYclWubalLyBZDVtfOLATOKJipmedFFdIt2XA3D
 cdSCRkJMzshfNY3w=;
Received: from mail-il1-f206.google.com ([209.85.166.206])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kQ5ab-001tdS-03
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 09:18:29 +0000
Received: by mail-il1-f206.google.com with SMTP id z8so1050783ilh.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Oct 2020 02:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=siXcRoWiOT6IB9ZzaXzxLDjCcyJ5bZ2i3vOd6vwCjbw=;
 b=uI8e3xwe/K5J+RZXYW5qV8kyl+u0qONmC1XRQvuAN5YztsN1rcYnmOPgO8+FKnchLU
 X//h77Sc5Htm2ummY/tg8dVq8YEh/g1rMPMHl9qhcqvbbUFgEp2XgwEdjk9wPUzbuAAX
 ka/AMJLoB2TaZl0cwNQxeWvGsEeotM+Eb7pwLhS+Anl7sxC7kKFGIEet5CNYkNOp2gjW
 qswCPLoo1FhJ8SrB7kLu+gwogsqdAOdMhZLnKNfctXjwe0ysf0fYYX0ZcmUT1CCflEgQ
 aOMrU/6KZy7PgVE8Aa4vOOnhd8V0wFXZNOpE5Cb9y3O65/7/tb/ulZ4LmK2fitQdwry7
 TWOg==
X-Gm-Message-State: AOAM532AfGjdy5EslCY7k89Lx/lILFAA4AEM8q9TQOAYPeWvDARFa27W
 sW6ebSsPL6NeoW3i7mlGgUR1RxJ7w3+qW7/amUbHfEMC/6Y8
X-Google-Smtp-Source: ABdhPJwRwQWBq/XDdggILHJlcQJx0ogR/9jrp5LVj/8pJOUvdHwJXhwKqwA5ycytcwbJQgu8c4O6XYyQI5PNgqcyIvh+6jgeRGpJ
MIME-Version: 1.0
X-Received: by 2002:a5d:9e47:: with SMTP id i7mr1641257ioi.52.1602062299375;
 Wed, 07 Oct 2020 02:18:19 -0700 (PDT)
Date: Wed, 07 Oct 2020 02:18:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000432c5405b1113296@google.com>
From: syzbot <syzbot+ee250ac8137be41d7b13@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 viro@zeniv.linux.org.uk
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.206 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.206 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
X-Headers-End: 1kQ5ab-001tdS-03
Subject: [f2fs-dev] INFO: task can't die in corrupted
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

HEAD commit:    a804ab08 Add linux-next specific files for 20201006
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17fe30bf900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=26c1b4cc4a62ccb
dashboard link: https://syzkaller.appspot.com/bug?extid=ee250ac8137be41d7b13
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1336413b900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f7392b900000

The issue was bisected to:

commit eede846af512572b1f30b34f9889d7df64c017d4
Author: Jaegeuk Kim <jaegeuk@kernel.org>
Date:   Fri Oct 2 21:17:35 2020 +0000

    f2fs: f2fs_get_meta_page_nofail should not be failed

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10a8aafb900000
console output: https://syzkaller.appspot.com/x/log.txt?x=14a8aafb900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ee250ac8137be41d7b13@syzkaller.appspotmail.com
Fixes: eede846af512 ("f2fs: f2fs_get_meta_page_nofail should not be failed")

INFO: task syz-executor178:6870 can't die for more than 143 seconds.
task:syz-executor178 state:R
 stack:26960 pid: 6870 ppid:  6869 flags:0x00004006
Call Trace:

Showing all locks held in the system:
1 lock held by khungtaskd/1179:
 #0: ffffffff8a554da0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6242
1 lock held by systemd-journal/3920:
1 lock held by in:imklog/6769:
 #0: ffff88809eebc130 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:930
1 lock held by syz-executor178/6870:
 #0: ffff8880925120e0 (&type->s_umount_key#47/1){+.+.}-{3:3}, at: alloc_super+0x201/0xaf0 fs/super.c:229

=============================================

Kernel panic - not syncing: hung_task: blocked tasks
CPU: 0 PID: 1179 Comm: khungtaskd Not tainted 5.9.0-rc8-next-20201006-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fb lib/dump_stack.c:118
 panic+0x382/0x7fb kernel/panic.c:231
 check_hung_uninterruptible_tasks kernel/hung_task.c:257 [inline]
 watchdog.cold+0x23e/0x248 kernel/hung_task.c:339
 kthread+0x3af/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
