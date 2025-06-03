Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A67ACC50D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 13:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aCLssoSLu/C9dOY1FxkqyNIndxqPT+pYzjIM0GSJGvc=; b=Wr9MbSkyRJX1E2CDETMbsV1MWa
	o5zlAURVSaNFNgfOG0Q/GIOLfOm2C0xUDg8NhH8Mf0cIDvMhilL5pfGnqHFtWDYXBwoT5rZGxXKFP
	211y/ByyZTw7mWD72bd5tn3AT4fAok80P/9r7NRpsCKcXKlmckA9vc8K9wqx6x79Pxrs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMPYM-0006YH-68;
	Tue, 03 Jun 2025 11:11:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Wtg-aAkbAE89FG1r22v8r66zu.x55x2vB9v8t54Av4A.t53@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uMPYH-0006Y7-2F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 11:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MPvTW/GDXyB87H7GHZi01anQCBOqwa/W7+aatqdbldE=; b=Vfc1B9idvwV9HM/9D6VQNHhJad
 8AjOYFBIXSo/fXpLo2Ti2C69zOrt7Mlu9a6P+VDnWr5V75aMb6ZwFNkRvf4cFMbaenyycMmGPyhaf
 cdFSQHFBsl9mdbGMpHbElVbTZ211ab2pDwOW5F6xLEUdKgH3Cejq4MT/MKP9rR3dQkhE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MPvTW/GDXyB87H7GHZi01anQCBOqwa/W7+aatqdbldE=; b=M
 fEVCE3sBKxW5C+IVAFbkfYIvwYA1+hrCWC/QbFEIB/BDzsgtE/l73/eszK37A8sWoc1OO2vX+L/8I
 OEXGDO/PfQeJcDPSXhLIYNM+6S8ZDVTKpQS36IMJHcKgETiKXvEQGCCcPx+1mJ4cSFIty+GVlJDEJ
 yoWU1wP/FCoAyG2k=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uMPYG-0002WC-Bu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 11:11:29 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3da6fe2a552so105813605ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Jun 2025 04:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748949082; x=1749553882;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MPvTW/GDXyB87H7GHZi01anQCBOqwa/W7+aatqdbldE=;
 b=xBNblTzR9Fm0LIXqd03ek9klHF54QHptcbbYW31Tn15A4wda5yfWFxXV9fDxVYzCIq
 AFkUTg2x+jOgZtqg56C/fTSI/2q5CnTiNdCByKxzErwx4/oitdLkMP4bciOuZea12zN9
 zExwf+tlKHJFW+2OwzXNXtu40D3sFv6YP2DQ1nYkcLm1exfxFlM6IurSW35VV+AMZ/JB
 +JkwIAxtizvyshQPKCsbLIhzXBKIBCTWMllVtqm9e2uIeGnPP2Dvfkleb1rQi5UwqxFa
 /iJ/3e5i2eAybrkIppFipZtY7HTr0pJXrO2V+m08LE3H/K5mFNNtxto5GYlgjWsZaxIi
 BVig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGVGXljp3u0MithZS/98NcBMQ/A9VaUzlGmmS/BgJfc5vw41NBpUDP3lSsSLDzTy6RZuiffode6wHHsAObi1bn@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzipZkf88NNqd5bMpBwenypv60Px6iXxqSxaGW9H+Ez5AhP1evp
 MPoBe426gojfyuWuzcBhH9DJgxQuaN6FSrH/2/LRODqgbN0AqV99yLcOFYwdY0rNEvMaEvQFePJ
 RSof1x/3T2VhMovbRT9y3mm6GaA/hnfkPFxTAg575910TK1QtNjQmCDGuC14=
X-Google-Smtp-Source: AGHT+IG7Tvi3QKY5gAg4SwQGiBTh/690T41K815KYJQlCx3j/jEBGd2bwCUuW04k8bnZjuaP5T3eSsk6vIyScuGs4Ig+nocIuP8Y
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2293:b0:3dd:9164:906f with SMTP id
 e9e14a558f8ab-3dda331b28emr126586965ab.7.1748949082749; Tue, 03 Jun 2025
 04:11:22 -0700 (PDT)
Date: Tue, 03 Jun 2025 04:11:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683ed85a.050a0220.55ceb.000d.GAE@google.com>
From: syzbot <syzbot+list64bdbbb0bb97345969ec@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Headers-End: 1uMPYG-0002WC-Bu
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (May 2025)
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

During the period, 2 new issues were detected and 1 were fixed.
In total, 13 issues are still open and 60 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1270    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 703     Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<3> 80      Yes   INFO: task hung in do_truncate (3)
                  https://syzkaller.appspot.com/bug?extid=effe7da6578cd423f98f
<4> 81      No    kernel BUG in folio_end_read
                  https://syzkaller.appspot.com/bug?extid=92895fc54ccb69ca6fa9
<5> 15      Yes   kernel BUG in f2fs_write_end_io
                  https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
<6> 3       Yes   kernel BUG in f2fs_invalidate_blocks (2)
                  https://syzkaller.appspot.com/bug?extid=240643026e8cd9ddfaf2

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
