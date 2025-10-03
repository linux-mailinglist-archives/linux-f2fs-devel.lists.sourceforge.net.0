Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CACBB5FC1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Oct 2025 08:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SF7y3tBXra8otfJsi95teOT4821S5AIGwdmVKx4eIrk=; b=IKiHbLTbMujd1Zt1/bJZXdOzW1
	QShi7zuO6uLw8Sh4xDkijFKiKO7jOL5f6o2K2a1NxOKMXa764GfnbEJBvJI1F8GhtlU+7wf6TZkCW
	6ml92CCwg01mx5WMp2jbrQe5dZkb8PfCxSUl6DmAG6cbXYaN1DSuozDoGYTG2DqMqNCA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4ZQE-0004al-4R;
	Fri, 03 Oct 2025 06:37:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3K2_faAkbANQIOPA0BB4H0FF83.6EE6B4KI4H2EDJ4DJ.2EC@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1v4ZQD-0004ac-Gp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 06:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gokwsh0d0oDpxymMzb3OOmlfkoX3qLWYpgmbEKkWVwc=; b=ev+W7q76oCIGSqJXzpft9rSQ3n
 xKJvL81Vt1IN0t+2lXp/1dAO9vGWwrkPchdqinuhzZ53G/UhnZymPYNB2Ju62nr5CLlTKMJ8Wq7xa
 BWV+RI5taJ4Whbto2p6tVIqH7hhLd3UyfDqBNiI2SB/gVLv/YHW4lgBVSI2a/Dusk6rw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Gokwsh0d0oDpxymMzb3OOmlfkoX3qLWYpgmbEKkWVwc=; b=L
 JNmUqBlpwjXhDDwwHnorngBUbwGiUR/PmBzSZcjCFv8qZsA7VcHjANa/q6HTrQmwlPuXZ+edOdttm
 WVf3gvPt+11F+XYlYXS0btbFhQCBWeY/5cCb+8kf1O4UzjEe9WSvsMORvPdHGgc0XZefB+roQDrKk
 rjnAD/38VE4IxSzs=;
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v4ZQD-0002Bt-S3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 06:37:42 +0000
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-930db3a16c9so186202639f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Oct 2025 23:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759473451; x=1760078251;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gokwsh0d0oDpxymMzb3OOmlfkoX3qLWYpgmbEKkWVwc=;
 b=U/tz+jIveYkoCY+R6PQN7q9b9X5OxhWIq/gfavn0df0NQdhiOYhgY3XDDBemdw7wF3
 R175Th79ieORoucr4H+ze6cxidEcqIVcHFLmC44nYYeZ7O3DjNKhNJCtQy9bONpNZoV1
 ldhDDUJOgFfNWsnmYHt68zLDhfnvTd93BIV7xJ4IJdmQ1wkMyGT1860LcElokNMVPhrn
 NJmXtfj4vyP7Ve1qcJDrspV98pfRFdEAnx2xedNorBkj2hHXN2wLQswtjXxMh9PZ26vG
 o9waxikHHgUNG7lscUCeUDdhzDH3aeaFbqjjh925YLnvakLzUmWK1Tbg2QAW9bh3lMV5
 XNRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH2eh9Wc9EzZBUd12h3Zq8+qwn60G2w79ErIckzsmkJpIg6Phvrs5zWJs+8B0bZwhYJoI15fKfqYAlDU4pr5Co@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy9HWR6t0NXpO+GGYsQ669O8qjWBEn74XLcA/ymN+4msNIaURD6
 LXi0ahJZPDKY//Wtmo4L3axkz9F5mIXSg4xtRRGBCO5UceWkiHoZCdS3ZZHhaguES5W6eXvZsg0
 bczWaXd6I2V3tvO6D8rBLCSSDwq9pxeIB++H1Mcxb7WK1z15+GM7cewrXFpc=
X-Google-Smtp-Source: AGHT+IFaCJDjzvPpZIb57jL+swJb3ZtEUzdgQTwOs60R/UvyZ+vSsgRX4xw2xMrVtd6oL6w2U5i6Qdf7JHOeR337zRN9xXd1IDwK
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3488:b0:42e:2c30:2854 with SMTP id
 e9e14a558f8ab-42e7ad963d8mr23838445ab.20.1759473451156; Thu, 02 Oct 2025
 23:37:31 -0700 (PDT)
Date: Thu, 02 Oct 2025 23:37:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68df6f2b.050a0220.2c17c1.0019.GAE@google.com>
From: syzbot <syzbot+list32c51e896548995ecc55@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 2 new
 issues were detected and 0 were fixed. In total, 8 issues are still open
 and 64 have already been fixed. 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
X-Headers-End: 1v4ZQD-0002Bt-S3
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Oct 2025)
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

During the period, 2 new issues were detected and 0 were fixed.
In total, 8 issues are still open and 64 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1317    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 1179    Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<3> 109     Yes   INFO: task hung in f2fs_issue_checkpoint (2)
                  https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a
<4> 76      Yes   kernel BUG in f2fs_write_end_io
                  https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a

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
