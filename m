Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EC2771BDB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 09:52:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSv2e-0004oZ-IN;
	Mon, 07 Aug 2023 07:52:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <37JzQZAkbAJUHNO9zAA3GzEE72.5DD5A3JH3G1DCI3CI.1DB@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qSv2Z-0004oQ-8C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 07:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jt1EHUJ/Ui1IKUmjrZnqy7gNDh7T+l9iYKNdAfqS/e4=; b=OUtqF5OgU9vQK6OnWujLfVxIj7
 txJq6g3EdstxBpgL4NbR8iGcXefRyQGlM6wA4flefqJ4iJOCHO3goSJXO8XI7CY/C7J5G3INP6sUB
 Nb94rRyfpBB1EHelxocV7N37lq50Josa8utYxbI4HL/4ketL9r5M1qH/4HoZtqKLo1Xo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jt1EHUJ/Ui1IKUmjrZnqy7gNDh7T+l9iYKNdAfqS/e4=; b=j
 bpTd9fiLI7Is+CdaPlb0J8gZaG/RP7b8EqV+igUf4goP1ngv2XMwUtL9dRSlMEMjh1Wne5j3OlZak
 887V74BXcAGXn53q1cfQ29nJ57fsv7wrYvUvjlNCl/P63UCJSI6dR5k6la/mHDmrILpFyGBQut7yG
 p9N6Lx7lLrz2DYKE=;
Received: from mail-qt1-f198.google.com ([209.85.160.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qSv2V-0008JH-5q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 07:52:32 +0000
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-40fda0270baso50451191cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 00:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691394745; x=1691999545;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jt1EHUJ/Ui1IKUmjrZnqy7gNDh7T+l9iYKNdAfqS/e4=;
 b=Sec2rwSmiaos9BTwwGbupPzKkvXararZfElKNTYlyJBY7+gz7PwQqmuI4hIEmdxJgs
 qoGqfoUIF8F1Ddieohg1bY/6tn7yxd+9JHN2s7ukCIAfHEVMZlGrmFoTQwzq0mla7Z0v
 Z0d9SYsE/DA9GY83Bjgj76oHOAk+Uf/9BKIJqGOQVZWX4e6He6pJr5W2a9YIlaOSnibu
 SX6vbbvT6SFRPKKWVlpkde0A+HhAQzppGSTV4V1MwREmU/ZmD8umyrKK8aBtWD+O7Uj3
 mPFF8oQbbhLKBTuqyKNng1fMiwah/XgfIx1HY7v5ubnyZO9S+i5UskfBQYwSfUCx5gcb
 OKWg==
X-Gm-Message-State: AOJu0YzdY/4wpHFEnwg/IJXyGpPrbtk9L/0K4RWkQ6PYflZ26gdYYGTM
 vn3NMh18R4VvJBrpBOM/eWju0Vvp0hnKZj+eeW2sbDRH+KHJ
X-Google-Smtp-Source: AGHT+IFPD/rYsXyVYZQBmlTvhb28DZxR9f5/A/V01ZJcmvPlgZ+lzf54RZ0T61Y6YGa0sVFNOHtIdwfP/EbmBAUv2UC3Cb8W3uwY
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2015:b0:3a7:3737:60d1 with SMTP id
 q21-20020a056808201500b003a7373760d1mr14872337oiw.8.1691393260415; Mon, 07
 Aug 2023 00:27:40 -0700 (PDT)
Date: Mon, 07 Aug 2023 00:27:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007673490602502e68@google.com>
From: syzbot <syzbot+list9eec7f8f6d11cff003fa@syzkaller.appspotmail.com>
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
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 1 new
 issues were detected and 0 were fixed. In total, 11 issues are still open
 and 31 have been fixed so far. 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.198 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.198 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qSv2V-0008JH-5q
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Aug 2023)
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
In total, 11 issues are still open and 31 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 11074   Yes   possible deadlock in f2fs_add_inline_entry
                  https://syzkaller.appspot.com/bug?extid=a4976ce949df66b1ddf1
<2> 1573    Yes   possible deadlock in f2fs_getxattr
                  https://syzkaller.appspot.com/bug?extid=e5600587fa9cbf8e3826
<3> 236     Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<4> 5       Yes   UBSAN: array-index-out-of-bounds in f2fs_iget
                  https://syzkaller.appspot.com/bug?extid=601018296973a481f302

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
