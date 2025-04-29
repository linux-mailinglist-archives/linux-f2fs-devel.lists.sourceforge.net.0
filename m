Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C06AA0BFF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Apr 2025 14:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QQ5uwCHYlDUJdx4F1F6ZGZjOzbpBTiMvhwlGNHHGRVE=; b=RFWjpDVitjWrBLsiO/dMm81HUA
	m8WCFsT1pHXz7RGVoaCPHm5oQS3rluped0gp2oFj6cGNOm+JcwDO7IqL/yzuLLnXXJg2O0A6DB9kE
	E+mIqSozmW7K1hY+JUGlp4/5/gJZWj2nIrUeHeI4FjzzgDjB6DA40r201kiRqb63qisI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9kNS-00055S-Dz;
	Tue, 29 Apr 2025 12:47:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3YsoQaAkbAIEx34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1u9kNQ-00055J-NV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Apr 2025 12:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p5AG1F/C08qNE+HenMzsOFVcY2WX3zpkUBhTT5RfdXo=; b=heJO2+j4PD0UQR2tMAzR2Sva9j
 Ulc4vUi8pgxbBcxd/L3YQ5g8Q04VXlVNPIt/LrgazwJp55/IwRxp9fIlUtzSv65qScyPp5D9aBu5B
 /tkK/123HwlEB5yLBdaILwaUlKVCRLr22BNPnpYMzvcv1lnht0/35HucUK56E2TiiRIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p5AG1F/C08qNE+HenMzsOFVcY2WX3zpkUBhTT5RfdXo=; b=n
 FQXkpbgJm3dBawP2hffTGHYMsp3kC/KVHuAEd9bycuAK7LknaTIzgDCC4WLjYDTVScZzUp2jPAynu
 hJplV5g16i00TscvT/XIgJZ9vS9BgJcHTAsbXlpNJ6wEHb2GP4Z5arQ/Cko6FojYe0/W6fxDYvbkm
 CsJWlnhdkCKvU3fI=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u9kNA-0006K4-W4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Apr 2025 12:47:56 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3d44dc8a9b4so59717975ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Apr 2025 05:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745930850; x=1746535650;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p5AG1F/C08qNE+HenMzsOFVcY2WX3zpkUBhTT5RfdXo=;
 b=rDpLwiqMEghJbOU1cK5x5eu3pep5qL0s5d3gLgmHJTQ+asRjfyKDPhu5bYfuExOk1+
 IxN+2U3VoSIwA1B1C95TXh74oNZDPo76/+6926IvQKUF+ETsYV43FVdE4p25A+Vbobpd
 4ofRESIcCMHhr7rqRhmAKnlMTR8kXNvuiiamQKfKKvGVEpnfNxnArebD3HbCreplV/z/
 QxdARpUOIGvrek1XIcYsQojRXZvs1XAL6STjcaHYDnOUAl1VwbuTl+CF/JttxJ1beUQ+
 LQAlyZR9aLSnYQ2LKRy3C4E/7x/EQobfCs+b99r0FBQ9yERNO2rUdX6cvT0UUqWkJXPR
 yFZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrkVL3so/aQoEdwL7SDn894DnvOGDb4JTzzeh2QF0YSNmgdSdvqdcybrJ2H6kgpE0UyIohaRaQXqDypDOC8cPX@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywwgu1cUHpQh452NttkAX8sPFwNhFrXyzfn0g0Vum2Qon0QV5mu
 9DSH/wIfRIq43nVM9T2JXkH3HgW/BLH1yFsOTDJt25e+N4DRD4czc1eJ/ivCzVCMOO4k0tpK6ft
 /aPsV3xwHgC9UPIzJXTbjVnvPRrxjre5ji55TtNV9GJkqgeHSf/YLRRM=
X-Google-Smtp-Source: AGHT+IG0r/SNe4yPRPAB55ldyDMg+W+0ZNs1beU1qITLOCtfpKtKwVBAUoYjMoKwnMMaLxeJ87cZazC9rk1vWd1KnozqVAunaQ78
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1548:b0:862:fc1e:43c4 with SMTP id
 ca18e2360f4ac-86467d128e5mr1587812839f.7.1745930850367; Tue, 29 Apr 2025
 05:47:30 -0700 (PDT)
Date: Tue, 29 Apr 2025 05:47:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6810ca62.050a0220.16fb2c.0001.GAE@google.com>
From: syzbot <syzbot+listdf8772072a412c2cbcd4@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 3 new
 issues were detected and 0 were fixed. In total, 11 issues are still open
 and 57 have already been fixed. 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1u9kNA-0006K4-W4
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Apr 2025)
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
In total, 11 issues are still open and 57 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1248    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 696     Yes   INFO: task hung in evict (2)
                  https://syzkaller.appspot.com/bug?extid=65b1e2d8f2d618a93e96
<3> 372     Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<4> 48      No    kernel BUG in folio_end_read
                  https://syzkaller.appspot.com/bug?extid=92895fc54ccb69ca6fa9
<5> 8       Yes   kernel BUG in f2fs_write_end_io
                  https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
<6> 2       Yes   INFO: task hung in f2fs_fallocate (5)
                  https://syzkaller.appspot.com/bug?extid=d05837bec7673c4a18fe

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
