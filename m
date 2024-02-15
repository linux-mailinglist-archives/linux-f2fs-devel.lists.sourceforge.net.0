Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AD1856457
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Feb 2024 14:28:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rabn6-0006iM-JS;
	Thu, 15 Feb 2024 13:28:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3dxHOZQkbAAg067sittmzixxql.owwotm20mzkwv1mv1.kwu@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rabn4-0006iF-9W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 13:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YOyAVj8iZnfLPO2Tj57CukZdvRkebiNy5RkDdicIJsY=; b=gBdKwWVWDexjGURupI9IQc4cX/
 8MtWu/wB1Oyt45bE86ZEz3HDf5S/onOvP3AoV6mYrGKEUZHuVNLc5ztO5Wf/ziQRbgM7yMTs5x6pD
 8D3h2X5UjFoIryi6tqnu77ZNhqRWfYAWh5JAwbL70WjBtAsOk+iqhJWAivPHUyxX84io=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YOyAVj8iZnfLPO2Tj57CukZdvRkebiNy5RkDdicIJsY=; b=P
 1izMpbgxqq6c12jjjeG2DaTE4lQox4ybaU1aRqup10ZWdfd3qgIsfCEvx5myPmQUmyiyNlzGwxdy8
 C0kkGOLNi6aJo3flgNwwzZEmGtZJX6R4mhINtzylpefrL6y5V72RXU6KkYPOtR4YiJOOwn4eL+Hk7
 uxTZVrP5QDmqlAPw=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rabmz-0003BG-PV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 13:28:36 +0000
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-363bedeec4fso7370985ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Feb 2024 05:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708003703; x=1708608503;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YOyAVj8iZnfLPO2Tj57CukZdvRkebiNy5RkDdicIJsY=;
 b=FG6R94B9WCnIPDJnglhXFt3wnSJCW+z3/N7tQS5/DI6Qs/JrStG6eA3EgONeqkGAKW
 1OishQ7HsxuGA1jz+mbvowqPsghEXw/3HJQEH+0sU6ezNiQ9iZHUEkbJMIE+SA3u2oEA
 LC+HPe7O6vJ91AgcN36vttsxQRlhDkXJDHuIiBl0IV3J9F+GYzihCyOUAEWvnXmC4hU9
 ePa0FkPE5E8d7spuQcf0J4hRi/Mc7x+N0RiXdTdeHOHJf+jlxgFpUYT4z0HgJwyTC8J3
 /QC5SB8gTx4yHQD1R48mxuC6i5HFYV6IaQxXLo7MRumstHetH7WNoUhKJo8ZEirI4BgT
 ip1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi2NVrNf++ucL6mNXFsy5/Q+SQ/DY3GiNwSb6iXlPkiPI7JsBIgFzstZBidMOQ07CuXhjbW5SxRVDWM1gDwcv5XZ16lmXZRGtEp4f/G547hvc4RDeVDw==
X-Gm-Message-State: AOJu0YwrsjPcz7YqaT6qrq987gecY307SNx+/MdIhSwsl6bapFluyX/B
 HjAm18kXHQruC2plX+ANk/MWp5syvDCMOWDoaxkkp7Ohrkbcqvi8OJ+pZ4mfAsy3tnVebyP8kjb
 s4TWlVmsFi5Nt1LbfpQRSTmx8h1Yri06R+9IMBcry882Zn6TTEFzr4Ic=
X-Google-Smtp-Source: AGHT+IEREh9yEaNckCxDoksWb7wYynsZ3OGb1J//mCCzUvWZ9+ATJgsqnYvz2H3RflTF2wLmuskGIv7izrXcerbLZ2tV4ESMUnDv
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d1e:b0:363:c25b:75e4 with SMTP id
 i30-20020a056e021d1e00b00363c25b75e4mr143497ila.5.1708003703797; Thu, 15 Feb
 2024 05:28:23 -0800 (PST)
Date: Thu, 15 Feb 2024 05:28:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000a40fa06116b9aeb@google.com>
From: syzbot <syzbot+list794268f47f12e7406f24@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 0 new
 issues were detected and 0 were fixed. In total, 3 issues are still open
 and 35 have been fixed so far. 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.200 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rabmz-0003BG-PV
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Feb 2024)
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
In total, 3 issues are still open and 35 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 314     Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 17      Yes   kernel BUG in f2fs_evict_inode (2)
                  https://syzkaller.appspot.com/bug?extid=31e4659a3fe953aec2f4
<3> 13      Yes   KASAN: slab-use-after-free Read in f2fs_filemap_fault
                  https://syzkaller.appspot.com/bug?extid=763afad57075d3f862f2

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
