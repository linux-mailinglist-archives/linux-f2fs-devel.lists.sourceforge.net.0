Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D86309F8707
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Dec 2024 22:34:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOOAM-0005JU-Gp;
	Thu, 19 Dec 2024 21:34:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3ZJFkZwkbAFsLRSD3EE7K3IIB6.9HH9E7NL7K5HGM7GM.5HF@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tOOAJ-0005JK-D2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Dec 2024 21:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SwCSICGF+rzdEDaDvl/SI0n/eYownqdeH+N/rdTDoz8=; b=I+38gDppmJQ2rHWzh4ctFSGGvp
 3w6bx3oFWy1tw220GvX9v8hCuLMW+c9VoZt1qtx+uJZLyOpJFGmJz6LtNWIk2CN1cSgkjNM+Rw9LI
 0/JO7wqptU2/WCI59z5k7/+yaa0hYTetAT6988c9SRyrd2BihzC2VBDe9h/7I0yQttN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SwCSICGF+rzdEDaDvl/SI0n/eYownqdeH+N/rdTDoz8=; b=B
 3shslVITvkkZ/qQftvKstb1FJdX7iMmBELBCL0wVHALAFX/C0pfgZg+lJMiHi1qLlGWP1QJBNVh+V
 po7Q1kcUYah6owqkwT5wJtnitGqLXjTOhW6WM8YRh/zqBnrUKz1Bp8IizMbLcfCG8KuCF+CMxZ0Uz
 inEM1AwaPjmA7QDk=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tOOAJ-0002Mg-FU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Dec 2024 21:34:40 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3a815ab079cso22528515ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Dec 2024 13:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734644068; x=1735248868;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SwCSICGF+rzdEDaDvl/SI0n/eYownqdeH+N/rdTDoz8=;
 b=vwMYxNwFMjUzyAmOo/SvAabpBs7qH1CtBnoVbJkLIK6ag76dH56X7dveH1iKOd9nq2
 aFDOK3x/wTxvoG+x/P5C7dpz7r2puATqX3Y09X/merCDPtUojIrCyVOPTJDq//TkRe8H
 anLp8BFQ4oHsrSUmzKeb0xbINA9suSqsAGMp8zXSPJJq4qHPD+pIS5+AOeZjAu9tDKyh
 nTFcmt/pYQGTj/JKlT6aQM4Z+sHfATmy9R7BG8wRpOCh2JeGa1ORHWDsRxxrHYb4hb/P
 sFg+hqFEmwF/7gBKp/JdiadwEnGmaC13N9Vzbd9cmdpIc/+b4ELvAON2XB8kRTu0RkYt
 SS7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv06QoEWsJNCLy5Odx4rce3i9cTjDB9EfdBeYqOIsXRJ4qtkVXP3TLqsBs66THrssNuChMQV0ja8uaOmhUnO5/@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxDiBX2oDbfPJ/DJ/Z73J3/Qv55uM2Y7NdTyDXgl/WsrHMmEjBf
 XC5bElbD004n+aLXSsM74a9/DOGG3jqaQTsu/N9/caz5b5Rl8QjjhQDRGP16Mgf9zRM8dEan47N
 joTPWWPZEv6GKMeoiiQCGC4dJZVboa0iVVmgOB9uX4AMCAcrhjQjsxUU=
X-Google-Smtp-Source: AGHT+IFet/Ufw08rPIl9DVOqoNT4KDhMU/kK36z2RAFUxx1X2DgCQmvr1f/wcYj5ZmWPCvTW6Ok7bc4Y9dY3brlD9qGHpIdLeqpw
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe8:b0:3a6:c98d:86bc with SMTP id
 e9e14a558f8ab-3c2d14d21b6mr6332005ab.1.1734644068739; Thu, 19 Dec 2024
 13:34:28 -0800 (PST)
Date: Thu, 19 Dec 2024 13:34:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67649164.050a0220.1dcc64.0037.GAE@google.com>
From: syzbot <syzbot+listf3d5bbbfec0bf4bb25ee@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 4 new
 issues were detected and 0 were fixed. In total, 10 issues are still open
 and 49 have already been fixed. 
 Content analysis details:   (-0.5 points, 6.0 required)
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -1.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1tOOAJ-0002Mg-FU
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Dec 2024)
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

During the period, 4 new issues were detected and 0 were fixed.
In total, 10 issues are still open and 49 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1209    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 73      No    INFO: task hung in vfs_rename
                  https://syzkaller.appspot.com/bug?extid=6165bc9800cd6e1fe958
<3> 56      Yes   WARNING in f2fs_unlink
                  https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
<4> 16      Yes   WARNING in f2fs_rename2
                  https://syzkaller.appspot.com/bug?extid=82064afd8bd59070fc22
<5> 6       No    WARNING: locking bug in f2fs_getxattr (2)
                  https://syzkaller.appspot.com/bug?extid=44090b62afaabafe828a
<6> 6       Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<7> 6       No    kernel BUG in new_curseg (2)
                  https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43

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
