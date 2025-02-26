Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08EA45E33
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2025 13:08:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tnGDQ-00029B-UH;
	Wed, 26 Feb 2025 12:08:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3OgS_ZwkbAIMz56rhsslyhwwpk.nvvnsl1zlyjvu0lu0.jvt@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tnGDP-000294-9n for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Feb 2025 12:08:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sjJ/MEQxUyuHDV16+PJgywoQMc7ZlV9Krg1MunFx0o0=; b=eRLajYm9eUNUyrLcQdY4lhLCG4
 Vvmizzv5wFHWn446HnM81E3JmmA2C0pF2q9DiYNUEaHxPl8u7j5S4VBRnPDLpMwkkTnUDg6QHOUQz
 nTxmYsh91r7KzLW+jJbTn1moBvRwcKYOA5fJkZoiMBZXlryGYK7skf2NNVS36GE4jzJQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sjJ/MEQxUyuHDV16+PJgywoQMc7ZlV9Krg1MunFx0o0=; b=H
 q/Vv0bnP7zXGxt5uHY4iQO/RFKuCuw61/8iUDSF+nyunaHCB7Eu+PqQPgVRFUsgat9hAbRX/V+fFg
 7JCFLbwBjIEkMj1a9U9eJ2qRv55kQGTnWEusgp8tb0h6R7lGqA7+7oMIzbDtcw4KwXb1hz8fuw6sh
 LzDl5TVkMR0NNVuk=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tnGDN-0000FK-LT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Feb 2025 12:08:38 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3d2a379bbf0so122904635ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Feb 2025 04:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740571707; x=1741176507;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sjJ/MEQxUyuHDV16+PJgywoQMc7ZlV9Krg1MunFx0o0=;
 b=s22krcGw8OERdXS3nbBTikQBUptF+A72mYXU0qpW0l71FqEXO2gpsTyVbiW8HvCCrg
 AACmTUAs1xefLwkyxrg5JlGBlKehZ1tz1Vth0BSEi0f+wdy1NWbC6hJNsG3HOM0JuaT5
 ZsN2kx1RnUcK6DlPxY2PWH9UmZiRI3/nUwm/+QHRoE/4G6iPdyc7Hhw/xhtGE3D2ZMIs
 pI3PgTyBvVNI84ps9AjpTahQBcsPiRVjVRKeNCRY8d+h5Ns2GA+b/WLF5I3H8wArErr3
 prAcg5J0QZNthi5lF6gFwlGIkWWPewrajATJVkpHGttSlhvf5vPFI63ItoxX0Gsq/g0D
 DlYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG5bgm4iKX718/8AlroB1+k29fm6hIyHzEjhAWBpb8eP4Q4n0HTOdMK7UxP12QDGdTaIDYggYJBuX+KS/NoAey@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxZb4VVSG/FJGVFPiLERl2sRarVB8/Ki9QlOkMEAv7EhhOd+65f
 MaalKsyUdlgxKhbTloW5b3fKLpKkKO4x5qld+sEsuYCREeApFiw6MUug2R1Bs07wcreBt3Hyu6B
 +0+CXmtTj1tRPJSbm0i4Z2feHuanWq8/DsnaxTyJrl7XnHbZvGvQdXk0=
X-Google-Smtp-Source: AGHT+IG6NABG+FUudq5++1rGPeYyvRYXk8TlADiLlr5ghSf9tQRr2s3pjOftfoUrSfHg678gl/ALTtrko4Uphqs5S6vPggU1hAg4
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:320d:b0:3d2:b66b:94cd with SMTP id
 e9e14a558f8ab-3d2cb43252amr218741695ab.3.1740571706989; Wed, 26 Feb 2025
 04:08:26 -0800 (PST)
Date: Wed, 26 Feb 2025 04:08:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67bf043a.050a0220.38b081.0130.GAE@google.com>
From: syzbot <syzbot+list32cc6c8959bc9c611c66@syzkaller.appspotmail.com>
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
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 2 new
 issues were detected and 0 were fixed. In total, 9 issues are still open
 and 54 have already been fixed. 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in bl.score.senderscore.com]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tnGDN-0000FK-LT
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Feb 2025)
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
In total, 9 issues are still open and 54 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1243    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 3       No    UBSAN: array-index-out-of-bounds in f2fs_truncate_inode_blocks (2)
                  https://syzkaller.appspot.com/bug?extid=51d857eed5614c310da0
<3> 2       No    kernel BUG in folio_end_read
                  https://syzkaller.appspot.com/bug?extid=92895fc54ccb69ca6fa9

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
