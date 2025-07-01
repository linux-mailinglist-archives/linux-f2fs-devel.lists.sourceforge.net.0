Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC85AEF332
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 11:24:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Omm6VqLmj/WS6RxvavPjIfEXHSOSnBGzUdc5vVNDJig=; b=iBhHH91W9KYEGY+z3T4yEV2Zgt
	3aNldsVJuEISqO7q9KAJNbjAyokn+5OTSwI6i4K0fLMkbmsy7QAZoXhprGA+0TfoQw2bz60oUZBpq
	dpCGz1Mj2waclGD30BuybA7P2y1vohWzX6MTeJmZM+qXxucffxT3R+r9yk6Ypc1CjVYE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWXEL-00039P-1F;
	Tue, 01 Jul 2025 09:24:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3UqljaAkbAH0tz0lbmmfsbqqje.hpphmfvtfsdpoufou.dpn@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uWXEJ-00039G-Uf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 09:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5HQkRjM+wMVmwrM75e3vmov9+3qgHon/V+9yiB5mGt8=; b=bRRJj/EIeg5FjfYXht5vVDDSAx
 3H45RVHUILp9ex9upLA5E+RA7gVD8l50MffMUFI73Bu23+V31LjXO73bc1WudlXVMnJLl7lVexn+o
 b53bc5l8wTrbVCnAR0K0lwrbkutymlxTOthrA/Mge8iz5qn3RjTipyDIkT+TeoSB0+z0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5HQkRjM+wMVmwrM75e3vmov9+3qgHon/V+9yiB5mGt8=; b=k
 CJOOLUTecIeWtG781wDwpQ8elmxwxCii76Q1RM+ISqkImy9ja4JBNNKQuMm+Dnsu/XKb97n0iuCLB
 9TCA0fxmle95E/AZaIe4/xv2CXi0HR2rXfbWGzCCHc0FeK4ZUq7KuJO9WG/L9PWmEHzd1z/hKEBIS
 pLMYgdh8qjeqWijg=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uWXEJ-0007a2-DU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 09:24:43 +0000
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-87595d00ca0so535560439f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Jul 2025 02:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751361874; x=1751966674;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5HQkRjM+wMVmwrM75e3vmov9+3qgHon/V+9yiB5mGt8=;
 b=YYHhPdglGZQz9fu7h7zbR5bFiQW0R32x6uXqT8v/3/k1OTe6IaHrypYBiiRCLXYoWB
 qr+mxwfJ05DQsN/rVobQaDLYShnv9vOPsWQqlsBJEam1Xn4zw4orNEMgGVKdzrk9S45x
 D2s3WNdAN0PZ15xL813IVbPiYMUy+HBmJsk9FWEV3ff/4D1tktTnwVyUUYJ4b4+OPVd+
 uBzcRnnb8WhPXPSj1denWjV18hiQG7a6my5wzxMT+ZwHnuL5/FQcxyYN1dgrQndLyRu0
 ttS6EO9aoPPUWZUp/wqmjc+blmuVoCp1x/Lxzw457wvvqMX4GBMjb0VCZEde4CbV8Jqw
 MbSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4OWIX6UghcRGNryA4b9lRju6ww2eCffUfdi2WzkbcahbKiV2EeMQmF9OOEBNXM5ebIUT9YVzDYzO50vU4+XyQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwO+f/ui0yzaPu95xrAsnWnQQRujqA1I1TjsxC481oo1O5tNcdo
 PrC88ZtL2JlhG12VBnI+XqNQkz42c3bpqcAOEyEFbUICC1byQYIfvNepRJDCubtFW8WwP2xPTtK
 5DjKG3gf7IAO7ZCuPnW13YmL4hodjifOw5d9Z//P5ujbzd1uvulTkki6Wv8U=
X-Google-Smtp-Source: AGHT+IE6c+AGnTS3ZbMGH35CG/yju3u/WvJ2LXQ90c2nXToItc6Ymhz58/GBqgiJSh8iXnNkDFwQH247cEdand4Avtz+3PNng2HW
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6d82:b0:86a:24a7:cecb with SMTP id
 ca18e2360f4ac-87688580104mr2075632839f.4.1751361874347; Tue, 01 Jul 2025
 02:24:34 -0700 (PDT)
Date: Tue, 01 Jul 2025 02:24:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6863a952.a70a0220.3b7e22.18db.GAE@google.com>
From: syzbot <syzbot+list8c6bf11f7f6a30f5a841@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 2 new
 issues were detected and 1 were fixed. In total, 14 issues are still open
 and 61 have already been fixed. 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1uWXEJ-0007a2-DU
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Jul 2025)
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
In total, 14 issues are still open and 61 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4275    Yes   kernel BUG in f2fs_sync_node_pages
                  https://syzkaller.appspot.com/bug?extid=bcdfadd9bda9988fa52a
<2> 1277    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<3> 796     Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<4> 34      No    INFO: task hung in sb_start_write (2)
                  https://syzkaller.appspot.com/bug?extid=b3fba2e269970207b61d

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
