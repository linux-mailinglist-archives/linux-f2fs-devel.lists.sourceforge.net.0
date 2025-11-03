Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAEFC2BFC2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 14:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hXGXm4rU06vz6gWpsQzQgFJsJktvJEnHfOFOdq2N12Q=; b=CIRH6j5wKAfNLqLApzokSX6NEh
	IPXs6uf94BpWyKE+kubczoiCP/Lrg2pyq+KDk8lHnoXUn7PTvRu2aKSKimJHtURcDhx21uTMVB3j0
	z9UqxBVitOQ9NEOQWj9rRTxNAOwRLYvewViCM8cOs5/w6AqAurVDY2r5He9JzNxiuQfo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFuKd-0007EG-EO;
	Mon, 03 Nov 2025 13:10:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3yqkIaQkbAI8BHI3t44xAt881w.z77z4xDBxAv76Cx6C.v75@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vFuKb-0007E6-Vi for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 13:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VL7x8R2BK+VALfhl69aR2ef06obUa6CZ6jh58ZHWalo=; b=EAdYf5ONOgcOw0J9VcH0+q7E+K
 9DJyrjmV1klmpMn8cvY69IJ0K8g7k0rtTJBIgXi2oyhzuITmzI1aXDkQBl+Qakb2M3nAt73f5/vO1
 qbr929gfG9+MkYx2lKxk1Hifc88EXPN/0O2n70xP2teWWqcyqxLPdmtbYUBBTMbZbGH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VL7x8R2BK+VALfhl69aR2ef06obUa6CZ6jh58ZHWalo=; b=S
 BZYVvTw3zQEL/VpQSNvyQCrEClAP2F7H4QJLN5Qy9byjSxZtpuzJDfQBUzd8ogqweiSxwWR3Iwow3
 VeGQ8+6Ws9P7xnkniUJSCoy5OReRzyt+Dobke39t/qrk8RtcInhrHszzaHXc3YQkRNflYw7F6b+46
 gNIsgSp0tjyA5QV0=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vFuKb-0006jP-FN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 13:10:45 +0000
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-4332249d8baso54803695ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Nov 2025 05:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762175435; x=1762780235;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VL7x8R2BK+VALfhl69aR2ef06obUa6CZ6jh58ZHWalo=;
 b=gxvlDM21fgtsrWoosH0IZBGIWGl96G+2xltDVpv+0YYmUo0l1O1VOjsOiMgRMJHjpr
 eT+ECUmXgktMlmYjAy7/VZbszbF9VYPKUIcC+BRVJUEmOivrnfU/Dd7ciijrGUQyLwR6
 YdPA8ZjebfP2wamPiAmeKGnZuM2phKNaSqKLL1So4KlflrKHQgosqrWdv04L7ECpjzAP
 demKy5qiL0nWNVqyNwrZIFZJHjlkNczXUWFyAM+FtLur8uJgIQY3luJYiyrEmhsyzGYR
 DjNYurMk7shY0h6QCq6V/gFl3JHRDPOfOA9RZKkvtjLE9+99+7QmX63hY7odqFZQ5HVP
 E5Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD7HCHlRHumhQp34CK59r+8L1ME1Up5lYTXCDcjLdtG7M+K9SJevB4OstAK1WyjVF2M7SVJy+wR3iOLBNOPhSN@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwHvCzb05Ljo9hNmWOW+FC7ogzTV+q61fzMnnXGt3fReX4ckj7p
 HYvMO6fjvyZJrAg7u9aLEaTQpiPMcxJoBmcPpZ8jyL9MZHlP97QjfJOtFFxAclTnyNux+6/9wwr
 EgFatjhY1wr5Mu5Q7TIrjNtXDGwV+oRmPzcfHQxaXngGbsTF1t84e3IeJXc0=
X-Google-Smtp-Source: AGHT+IFZPezBQoxUtz5l3cjCzp9qzPrhtDLwkqWEgtBsfR6oBXgBjo1B55DjRjj9w2mcKQvel4P3FIXqgvU65veqbmSiiLWjLg0O
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c2d:b0:433:3095:909c with SMTP id
 e9e14a558f8ab-433309591e1mr33407455ab.20.1762175434831; Mon, 03 Nov 2025
 05:10:34 -0800 (PST)
Date: Mon, 03 Nov 2025 05:10:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6908a9ca.050a0220.29fc44.0045.GAE@google.com>
From: syzbot <syzbot+list6d5e07b82ce5d672a81d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 4 new
 issues were detected and 0 were fixed. In total, 11 issues are still open
 and 68 have already been fixed. 
 Content analysis details:   (3.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [209.85.166.200 listed in psbl.surriel.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
X-Headers-End: 1vFuKb-0006jP-FN
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Nov 2025)
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

Hello f2fs maintainers/developers,

This is a 31-day syzbot report for the f2fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/f2fs

During the period, 4 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 68 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1330    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 1315    Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<3> 914     Yes   WARNING in get_data
                  https://syzkaller.appspot.com/bug?extid=f5d91b1897d5b094c6b4
<4> 155     Yes   INFO: task hung in f2fs_issue_checkpoint (2)
                  https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a
<5> 133     Yes   kernel BUG in f2fs_write_end_io
                  https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
<6> 10      No    kernel BUG in __update_extent_tree_range
                  https://syzkaller.appspot.com/bug?extid=24124df3170c3638b35f
<7> 5       No    possible deadlock in f2fs_do_truncate_blocks
                  https://syzkaller.appspot.com/bug?extid=14b90e1156b9f6fc1266
<8> 3       No    kernel BUG in f2fs_do_truncate_blocks
                  https://syzkaller.appspot.com/bug?extid=1867a378155795cb1680

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
