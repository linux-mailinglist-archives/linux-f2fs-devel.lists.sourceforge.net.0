Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 222F89A372D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2024 09:32:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1hST-000840-MX;
	Fri, 18 Oct 2024 07:31:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <30Q4SZwkbAHYmsteUffYlUjjcX.aiiafYomYlWihnYhn.Wig@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1t1hSR-00083u-VZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 07:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GzXkhfT9/F2JC3M0BsEDAkKgZtNlAin3Z8M1bsi6SHM=; b=PLCOIjinpSVGPNzVKcjAWfmrYk
 rAHXmdFvCvvV2V33HSz5fIp00se5sX0pwPu66i81tvZEixeFbxmclQ5qCiZYcFJRK/EWtO5Q60Mbd
 QDRv9rL58cgbyNhhE4rDXj72ya5HMNflQlP5svi2Jp9+sakkQBNZEtfdqiDD+I25NDgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GzXkhfT9/F2JC3M0BsEDAkKgZtNlAin3Z8M1bsi6SHM=; b=a
 rafYfe3WmogViDexdRi6BA9YB/dPn1QkXVLrhBrJ/miL/1QI0UQtTdOxiTjLqswOUdKUGnpzc+IlU
 N1jeqgL6vuA/gg0lUTZp9C2m7pvkmis2TgZe2NX7aEsmEMw5K7q9Jx5HefJV7ozzg+7xX00Oo6TlL
 KfiopYgH86SAwrM0=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t1hSR-0001Tk-9I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 07:31:35 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3a3c70e58bfso15432645ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Oct 2024 00:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729236689; x=1729841489;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GzXkhfT9/F2JC3M0BsEDAkKgZtNlAin3Z8M1bsi6SHM=;
 b=Uq2k4x++KIDJPO9g1hcZkk6wEW5Ur1FkWWMzcN1cmhPZjGc+eE6Iarde8LRbVE0k8x
 Imiy4a97PIFC7a7E1T1ZhqlsODfqdcNJXmZ3Wd7gYrvKPW6I78LGtOU+2OeNfH0Sm4qy
 gPjubT74HCX5RZDrckoBLwPGMU2GVIWVTa3Q2k6bub5QauZ6xJSDlMS/mXFISQhTMUzE
 /HdcMieRLlHVy+ofG7n26yH+A7ZOSXzLMgrquLKgMAfxY0jy8Tt4JCJFrYDFMZ6nhPad
 IfHEEMfWSGNLH0E6DgvPnTsO9Rm3OOEtUwsOqv7FYZL/gWW4ybuSfUDe12UEheHcgmJE
 hbSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgNs+ZcAEEdTVvYIucFLwwci3fJLLSoCam4P2/HsSwLeMfSdPFGobTUEOAeaLFMF7Jb5X0YSH/uQaQLYH9nddW@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw5U8Ox7LVEAkV9IB3B3uRa/bl4c//2x3vpS4SUdei+xMFaXfGR
 tb3k4PlsrJkKXlRgLyhN0lvxJt8lx7xfO//I0QiWa+ZEIZJFvkJLbvJGoUOcLnBE2QBrbdSAWmH
 LvX3E0Za3GVRDnuLzKHWC1j9K/PkRUwphB13gQZKbEiT/kDebe1frrHI=
X-Google-Smtp-Source: AGHT+IFySUjvgG3Fl/szHy+Coj3vJjzvXk/L63ixiuhUZyvUQfFUQNj8qSben04A5CXrGYP1+XPl4tfLrEs3JS28u6E47iL5hN9j
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1389:b0:3a0:90c7:f1b with SMTP id
 e9e14a558f8ab-3a3f40623e0mr15094615ab.12.1729236689484; Fri, 18 Oct 2024
 00:31:29 -0700 (PDT)
Date: Fri, 18 Oct 2024 00:31:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67120ed1.050a0220.10f4f4.000d.GAE@google.com>
From: syzbot <syzbot+list5742c28e505b5188ee8a@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 3 new
 issues were detected and 0 were fixed. In total, 7 issues are still open
 and 47 have been fixed so far. 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 -1.2 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
X-Headers-End: 1t1hSR-0001Tk-9I
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Oct 2024)
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

During the period, 3 new issues were detected and 0 were fixed.
In total, 7 issues are still open and 47 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1071    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 70      No    INFO: task hung in vfs_rename
                  https://syzkaller.appspot.com/bug?extid=6165bc9800cd6e1fe958
<3> 2       Yes   possible deadlock in f2fs_evict_inode
                  https://syzkaller.appspot.com/bug?extid=7988d9999219aea9f2db

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
