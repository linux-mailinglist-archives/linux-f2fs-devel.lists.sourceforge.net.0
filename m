Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E8B40CA8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Sep 2025 20:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C1xV8b1hDEzoUbmn80dpNWm6AiO6fpBstZldjV89m9Q=; b=f2HI2MZu196ZC8BWMXDi8vMjPj
	5IqAmzoXUjpO9BFhpTsOxIlPO/AQCDoew/wDM1DKHQpXg+5LtC2YfKj3Whc8zqLN2oe4kAzQzjbt1
	tbXA5evSWXHUTmf8fwTMfj0QUIGeAXJH6UWQBsu8ZaoBhP8biMJyZG0kinJQTxQNKQqI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utVLU-0002U6-RF;
	Tue, 02 Sep 2025 18:03:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <34ba2aAkbAHYmsteUffYlUjjcX.aiiafYomYlWihnYhn.Wig@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1utVLT-0002Tr-7c for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 18:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Osa16BAe0oPttsuktQJPR9uoZh+5UDs3WW7uk5/b//U=; b=NJcOmpbGGwbQrlBPMpj6srFtPS
 CNPi50WOlcgys6CGZa86MrLuH0/ZmA17LAVpJTuHhuTFI9JCln6IjWbdEu2gQQLqYUS4ddWl1jmzq
 MeF0fN6cLv/XQk2H8FeT31VEU6AphRGwuLBHd1Qluxh2OFvwIN0/2acUw1V/UJBDKIyQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Osa16BAe0oPttsuktQJPR9uoZh+5UDs3WW7uk5/b//U=; b=U
 7yT3XuKgE1S9c1nThQC/joUH6+gixNSszD36bb5oprUhUo6zwEaWDsTOyIIUuWDoinR+iV4rclonZ
 dhB0EvWDGH+SY8vHk6t1xySLcOfrcgqeK+/hDxn16VYv3znx4zbyElKyJBSmyDIZxikaGUD8gjHSE
 gwA01FeO+o2IeXMs=;
Received: from mail-ot1-f69.google.com ([209.85.210.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1utVLS-0005C5-Pv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 18:03:03 +0000
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-74381f3b806so5591108a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Sep 2025 11:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756836177; x=1757440977;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Osa16BAe0oPttsuktQJPR9uoZh+5UDs3WW7uk5/b//U=;
 b=JrpKkM2b7Ucack+dJkCHbJ8cP1h30NOwr0Isr9PQAZjMQt6vyCBhLsbXlT9OG54aEg
 fdZIT74xyGwFqcuD17DJnWJAu7/8iw+RQhgLYLgAMz6n3R4HcBqLK+ejCJQVeF6bku7p
 BmjQHFdwEW1mpKM1Coff5Tn/l1nLfsXeRbI4lA33ld2akw5sshQolcjLrbRYWnQOaIT0
 7Ys/VwBL+43NdRBcN8xfSa4sVdO8BTj3e8mpUB0HDD1O+Snl/s1e24g9/TcdJ6W1pB/D
 toEzzH/S1lrb8MI9QDAOEWKA9fZt8gYui/IOApQzaOMbmFW2Zl5u/9CWmw1NJzOGCo6+
 CBPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMCyxPR2pIHDBwOAeR03O6deAUNHeJSErmi/hKwqPPqe2lY67X1F/WlCChczhyj5Bt38upmQJwrZBz9fd3G2RW@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwyBAC/h+eLTVJ8v6Z3ZPt/ZGIHVH664MzxI2j/gGIA4i5mUnA9
 nT3gmtOnppCV1LDjmQRdqB8HEM/wi3lFG+jquWDmI8lUUCtSO7Ne97uAI/1tAldKH9aWnD6Pr5J
 PWJS5jcmpwY3JAPf9MpFfzgfymGh5DkBs+77zEumhAInQYRFmayJWXGADvTc=
X-Google-Smtp-Source: AGHT+IE0aLMHTHvzdjyedkAA9IhTemTUqBrycikGy0pxsSkflnUQVyEIXRP/pHtC26uBzz/R5qakBZqRZJ7h81hMXsMcSLeMwD1t
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2196:b0:3f0:40fd:9d1c with SMTP id
 e9e14a558f8ab-3f40066c444mr170838375ab.9.1756804833293; Tue, 02 Sep 2025
 02:20:33 -0700 (PDT)
Date: Tue, 02 Sep 2025 02:20:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68b6b6e1.050a0220.3db4df.01cb.GAE@google.com>
From: syzbot <syzbot+listf2b14a23ee18fa1ce2ab@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 4 new
 issues were detected and 0 were fixed. In total, 9 issues are still open
 and 63 have already been fixed. 
 Content analysis details:   (1.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1utVLS-0005C5-Pv
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Sep 2025)
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
In total, 9 issues are still open and 63 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1301    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 1006    Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<3> 81      Yes   INFO: task hung in f2fs_issue_checkpoint (2)
                  https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a

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
