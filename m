Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 026667250BA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 01:22:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6g05-0002dy-2S;
	Tue, 06 Jun 2023 23:22:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3kr9_ZAkbADspvwhXiiboXmmfa.dlldibrpboZlkqbkq.Zlj@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1q6g03-0002dr-JE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uaw8+zjh0NK6MTFy6PtThiP3fMKWcFKEOZLWg7Hnxbo=; b=j7+WpPGc4Apym0no+OVTDpb+jg
 5ELg7bGql3uCDzDw4BClYaoR7fkOMMxNM5coGW+uu8VvBPnAayKzxZHIlSeJHJa5zNbvIEpv4WAWD
 XlPR6weqOYsUWkBsgAf6ns1iNiQHiEy2UfiTlVBWb3lYa4jcPC3s3Y/lDXvlTKVInMzo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uaw8+zjh0NK6MTFy6PtThiP3fMKWcFKEOZLWg7Hnxbo=; b=d
 FI9EYC2JXR8E0gNpDG3RVTbLbtv5pae601DCUDBhbK/QofFht5RfHct6Nb6U2MMFZSIsWsNtRt2M2
 CrPwXZ+9yCqBAaqoNi05N5lgUgkdQzh4vWrBH34GkXi0RGJmjGIhp8v9iwdb0SwT5xNJLsgaE5jHU
 jO88ZgCHHaYADSC4=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6g00-0002wF-Gb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 23:22:04 +0000
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-777a93b3277so260812739f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Jun 2023 16:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686093715; x=1688685715;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uaw8+zjh0NK6MTFy6PtThiP3fMKWcFKEOZLWg7Hnxbo=;
 b=Lg+TdRgX4YyVy/zcJds0QRCb5bhBhYt1F7JDYBSAYV3tHU81cdSxZLQtV4TG1jjAeS
 ZjogqxLrKpugBH41SlEx0Gzwly+mWkLExJ58hYADv/aO3UAC8UBSEwpwC9NrKk7gPXmP
 Ed6zBJ7pNukehIipK/z0PbN+ilioXiFYDMOvbNfyjjMGHLKsf9/VpkA+WE6VJKa6k7J4
 xlzVIACSOei9e2kTkg9t3iasVIwBlzE4iSOJQ350j1rlJ1k9qjiIUO/gJFHAPb0upo75
 zxVybzLIz1QrPrlCqx9U6rhhvwkJR7AaA4eBLVZiBrY7WBoASSsGjLDVqxUpldTHxtvi
 cE6w==
X-Gm-Message-State: AC+VfDxHGP725wOBogqovLw+QyV/V7T/ijeSfknkV7hP2+uacsu4nBCu
 3QNIMLP7ZbWPusHJQFmPN7g73clJxFkQNafMcoUJLrY764u+
X-Google-Smtp-Source: ACHHUZ5wRd9iaUWBeihpwV1Zeu5IxbL8gN+M2f1cUzcipDPEUYYJQpDKIOkGcP2k6Q+vhdGigwER8eTNCw+0SYymmVyhWO3mEhJX
MIME-Version: 1.0
X-Received: by 2002:a92:cec6:0:b0:33c:9631:3ea6 with SMTP id
 z6-20020a92cec6000000b0033c96313ea6mr1766215ilq.4.1686093714897; Tue, 06 Jun
 2023 16:21:54 -0700 (PDT)
Date: Tue, 06 Jun 2023 16:21:54 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ef407105fd7e485e@google.com>
From: syzbot <syzbot+listf5045cc3857cd5f3f4c2@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 0 new
 issues were detected and 0 were fixed. In total, 16 issues are still open
 and 28 have been fixed so far. 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6g00-0002wF-Gb
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Jun 2023)
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

During the period, 0 new issues were detected and 0 were fixed.
In total, 16 issues are still open and 28 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 187     Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 63      Yes   kernel BUG in f2fs_evict_inode
                  https://syzkaller.appspot.com/bug?extid=e1246909d526a9d470fa
<3> 4       Yes   WARNING: lock held when returning to user space in f2fs_write_single_data_page
                  https://syzkaller.appspot.com/bug?extid=eb6201248f684e99b9f8

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
