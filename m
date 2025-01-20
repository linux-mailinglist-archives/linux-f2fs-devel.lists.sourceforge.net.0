Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97668A167F4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2025 09:12:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tZmtj-00034I-27;
	Mon, 20 Jan 2025 08:12:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3aQWOZwkbAO4iopaQbbUhQffYT.WeeWbUkiUhSedjUdj.Sec@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tZmth-00034A-OT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Jan 2025 08:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0jHtGaaurlw347aA65AxAWQzOjmETotxR6X8Ce/SJCI=; b=UYBJR0ENErP9G3hBKuE7QvSNxl
 YN64LxIfWnFX93uMLRFgEYV2mwV+id4b7tQTAyn6LG7RcRL5AoLiP3WGlgzTAagsCshOR4pu17lcz
 vsFZZTZm8PVJ+bQ1tp7FRbGM+ZfvdDBWnGJjhRalquWM/dW9OBXkpIs6xN5wYZuftKUM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0jHtGaaurlw347aA65AxAWQzOjmETotxR6X8Ce/SJCI=; b=S
 SrT8m2zpHW30D3Ud6NT9akT5vaxGLTRtgW6BueFFkjEUTavuU1Edy6cG+zjOgKwfhdA+psmMsdTEQ
 5GbIYeyMiUhaIt2Z1SHz8XT3bVNM6yjq5FkjbupQYy4tGnHTS3bkM4EY6RGkMhKucVdPP1vfDnAeg
 vtu2SstCg7LK2XC4=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tZmth-00080M-19 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Jan 2025 08:12:37 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3ce81a40f5cso69421025ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jan 2025 00:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737360746; x=1737965546;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0jHtGaaurlw347aA65AxAWQzOjmETotxR6X8Ce/SJCI=;
 b=X86r5oGfGpof/SI/r6iJL6mUdRUCRkNZRXQIeuVczlhaOCKnRuGOzKmvgExDt9Shnr
 yt/RApXaukcid5499E5Vuj6KMVwNd2Idf5WFgO6JbeXCaMkgK4wXFezCbTgwry8auAgw
 xZA7BQklM2dI+b2H/epJ6rtLndY89p7ITz9b23IbeOTyE4WqSiXrQE4qCPSp6+0bcW1h
 lamBOMGydEnA0yiqlQSZTh/0oojZSzKs7WGkfUkoMje0NzOcN9k+nd2OaSXGAqtphck6
 IF084dQeGp3NZ+rJ5VpSR6NXnlEp6Ly6Tk3Y3lbDimjqRQVJRM4XUsr1woW5yEg9swGL
 oUww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUzJ+TlZOYbjBd7uV8lTThpyoZ63bmKV02iNv29zQuypqbQDVo6lIz/dY7HWix3LCZDvWi+luU6bsz60gj6BkF@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzxa4UGtUuyqSeJoTVDtccvw0dSKVpkheypOUlULpyiRUP9O9MO
 mJK6QLh1QHOdFa2M/xQHxvceEh16ev/72e6W9FdAcetUrnErCCK+ur45lAqMEw1boaSS3BxXABS
 9GamYhHReaHJCidV5bwBZSw6giqE1joS3gniGe2MVsCLKvCqfcAf05D0=
X-Google-Smtp-Source: AGHT+IFLtXFG9mvvSoLBFWxrlHR8zX/Z+Lco4OyYIb2C6MtInQaHoKI05Mm15k23HXfZCo4QncJ5gcRFnsyhevrKAFmP0ya76xa4
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2492:b0:3cf:5c1:5ff8 with SMTP id
 e9e14a558f8ab-3cf744b936cmr108125335ab.19.1737360745864; Mon, 20 Jan 2025
 00:12:25 -0800 (PST)
Date: Mon, 20 Jan 2025 00:12:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <678e0569.050a0220.303755.006b.GAE@google.com>
From: syzbot <syzbot+listb3ca2fa8712aa4561883@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 3 new
 issues were detected and 0 were fixed. In total, 13 issues are still open
 and 49 have already been fixed. 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1tZmth-00080M-19
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Jan 2025)
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
In total, 13 issues are still open and 49 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1231    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 107     Yes   WARNING in f2fs_unlink
                  https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
<3> 61      No    INFO: task hung in f2fs_file_open
                  https://syzkaller.appspot.com/bug?extid=6b03a52da637aa5db978
<4> 37      Yes   WARNING in f2fs_rename2
                  https://syzkaller.appspot.com/bug?extid=82064afd8bd59070fc22
<5> 12      No    kernel BUG in new_curseg (2)
                  https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
<6> 7       No    WARNING: locking bug in f2fs_getxattr (2)
                  https://syzkaller.appspot.com/bug?extid=44090b62afaabafe828a
<7> 6       Yes   UBSAN: array-index-out-of-bounds in inline_xattr_addr
                  https://syzkaller.appspot.com/bug?extid=e4876215632c2d23b481

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
