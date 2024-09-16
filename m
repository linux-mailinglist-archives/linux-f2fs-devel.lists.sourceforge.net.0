Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB097A263
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Sep 2024 14:35:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqAx5-00059S-Vw;
	Mon, 16 Sep 2024 12:35:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3DSboZgkbADgmsteUffYlUjjcX.aiiafYomYlWihnYhn.Wig@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sqAx4-00059A-3L for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 12:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dwY9h5Q5x6R+zn5FfpHHLLD1pG8RAJIsVnvThQ4msJ8=; b=DkL3+pZERgPqDJo4ZfGgMxs39P
 DOyG6poFNHd/Zgv0dvo5AhkNOsYDEH8N3ejGHqFGWNy6XhO7rn/UsnnOxOGm4hfNU2boZXueMILuY
 h6A16J9Nsp/PrFKUdE0kmXUWgE+odZZLKAFeXM4peiJ5mfxbASGS1WnzWj7I+hFxbq+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dwY9h5Q5x6R+zn5FfpHHLLD1pG8RAJIsVnvThQ4msJ8=; b=l
 vLn2gCyvSUUa9/svBxtqaaQmLF/i/gunjWCT1lS4GLAQ+QBYn34J8LHecq1481CMvIGW6vAP6orjC
 mJaurfTLrDRKczk0nUfHofPUm1FMGh5LTvHvnxyqaXZNOtiMuvgFsltn6lw1TYvTvcI+TUiZtdCVB
 QkiaoDCW7zQOiGkg=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sqAx1-00084c-Jd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 12:35:34 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-39f6f16ed00so73121145ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Sep 2024 05:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726490126; x=1727094926;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dwY9h5Q5x6R+zn5FfpHHLLD1pG8RAJIsVnvThQ4msJ8=;
 b=pGJ82r/xKAkRUm7NcJgOJ3/16rnfJhtuqrx7QXKGs2rbxNm//JQrh9L1y+dPEjFtMo
 YXBMjnIrtqZaBkKr2NVIN+5NyvuJ7GMbaw/mPf381zjqYwD1zb6YxNI27inAx5FG3Eau
 gyDCBB32F9VY158AnYe5CAMcyJvllVRuGr1B7lRIZ7EhCKIQ23s77LCUw/oFQDfjqOFU
 ic1v2k/Y5h7WMFwt8Vl9G8FnX3plMcA3EXTr0X30fmjJSvqEszXJxq2IqO9uDY/JW4NS
 Kae3Cy2jmtTeldPG9VHcavQpbtStT/Qpv1hvOlhoxiN6noOmSXj4HPF5hWd+sx7zS2lZ
 adOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5qVtJopWK5tXuW0axu/ddTQUM7E7XwEf0+Ea+dcvXksxuahiiuB+hXzaPF0ifr7ceRq4+3KJu7UTW/R61Q3W6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyYkt7EiPL3IkqgAGmqI5tMLhNdNEg3L3/L7I8/NgY4reni3CMI
 lP5J9Ww45nKzR7VJopAJoRPQ5fIDkiiuy9JllvjsMud5aJVXYNNg99NJ23jOVMosufdhOW/Euuv
 othSV1QKGbmOVSnWHgeCpjlTuL2fQdpbVU1Qgk64EJu6Ac/syh3YXdOg=
X-Google-Smtp-Source: AGHT+IEqSamn73OAR8wii+icocxFfo8TX+A/fJcNjvyIr/koS2bA4c+aRXkcl0Ydw3NjKK2ngwtXsky0jQtb4WoiiL9QxMXZIQkB
MIME-Version: 1.0
X-Received: by 2002:a92:cdaa:0:b0:3a0:ab86:9293 with SMTP id
 e9e14a558f8ab-3a0ab86a6b5mr6662125ab.26.1726490125861; Mon, 16 Sep 2024
 05:35:25 -0700 (PDT)
Date: Mon, 16 Sep 2024 05:35:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a918c606223bce75@google.com>
From: syzbot <syzbot+list1835a579772406839600@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 1 new
 issues were detected and 0 were fixed. In total, 8 issues are still open
 and 41 have been fixed so far. 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 FROM_LOCAL_DIGITS      From: localpart has long digit sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
X-Headers-End: 1sqAx1-00084c-Jd
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Sep 2024)
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

During the period, 1 new issues were detected and 0 were fixed.
In total, 8 issues are still open and 41 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 903     Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 55      No    INFO: task hung in f2fs_file_open
                  https://syzkaller.appspot.com/bug?extid=6b03a52da637aa5db978
<3> 5       Yes   KASAN: null-ptr-deref Write in f2fs_stop_gc_thread
                  https://syzkaller.appspot.com/bug?extid=1a8e2b31f2ac9bd3d148

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
