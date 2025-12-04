Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C86CA5AB8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Dec 2025 00:06:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j5OjR2pFitd3bLG4AG10D2gBFn/x5x6yoLug4JotAZQ=; b=NnxpzRtDRbKZcAEkTPw34qbNzw
	bPUSBUf0jMkc7VU4rzzUbdxM8Kj27tIST+V4KEsyERBq4eq0POOxbcYw+zhWtYAhUvZ7LcD+dL+tz
	y2pyyZxQv2tavFQDPKw05OJphabj+cs/A3ApiAWTiCLPUQwcwS+qQcwVDSRCgl+QoIvM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vRIPC-0006N7-B7;
	Thu, 04 Dec 2025 23:06:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <38hMyaQkbADMhnoZPaaTgPeeXS.VddVaTjhTgRdciTci.Rdb@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vRIPA-0006N1-MD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Dec 2025 23:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JrDn4SrAPlW6nxqY1X1LvyMF6tCg3vEuM4PBO9cdrjg=; b=HwS0VpsfP34RDpDcKMyPhFYmPR
 yzPuJ9wjdghckNj2VFLEZX6Kvl8+0nLZnPXB08o43nbkRyAscpcHn86SZSuS+0eUYYIT7/8XQTYHN
 dpNlMt0LGCr8EOm6Ip03QSbZwGwyV+vndky+2P5WPQuUuqlri/HG28rLIdjAI9syTscU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JrDn4SrAPlW6nxqY1X1LvyMF6tCg3vEuM4PBO9cdrjg=; b=m
 9T7rKa49HuLqee20GgsE0cHfOux+vplUHEPBuJV3LwvVYzpgqlkdPf7FtOOC62YkbEJM7pUg7zYMO
 a/Bx4DndLJgl9HMyZYmUloKXciVniuYQoUe2LKNma35vj3hx5UrJYHXnYo66sJoYSgKg/jZrlVbLf
 JBmcPBQ7c9+3dXjA=;
Received: from mail-oo1-f70.google.com ([209.85.161.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vRIP9-0004r2-TH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Dec 2025 23:06:32 +0000
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-657a467228eso1974331eaf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 04 Dec 2025 15:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764889586; x=1765494386;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JrDn4SrAPlW6nxqY1X1LvyMF6tCg3vEuM4PBO9cdrjg=;
 b=TWUP9s8rpVf2xZcwZ3DIYIIeoiG2ZFPsM3auoQ0H1lmNvqQdrItIlXf0aovXFbJ/Ol
 1mxuwHK7KNJPzZTT5/J2BmX8L+ffjIu1Mh/yCxTsj6l7gmmqYW/E7xZu4ag6DmA4oRUh
 pPXwsV69UXjiWhrv2qPP32AaSYb3n1p1XeTv4dAO9Le+NBQRbeOnzBx+qrXrZ4Ub+NtI
 LdQVHOxM0nl4SFEZcJEPy0dHaNHXZVl3wvS7vf9/t/r2I70GgbgfeFbTO88v74bvjSQx
 GVBUkvzkedKdUPagzRvXuBNR6hg1z3K3v0XoCfn83ZNzRmeJZBRTLJzecw+whOY2GxIh
 uvDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8XGeeD3j84pdRLrZgcdfj6ykeIG/lXKAA0z9osyejLrRoiBGQefOlE2/gVmmySgbjq2HFiSfupU0AjRzB/y4r@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxHF6AjqDKNgYWVgsAOqukvDUFQMnUnJFgSNCj/yDgUrD0QMMPr
 G5MvsfDvAk6CQvdQqu2nnFFA+9IoPh3/9JuIg3wtri+SkpJWQwCFpXLZLO4JsbAIK5afOi5ZHR6
 FnJt0rf6AClYvZAS8tx5sSgtCxcrBL8VjYEyXPuJ4Yc5JNzAOY5J5OxLVyiA=
X-Google-Smtp-Source: AGHT+IF+1dHbsKEL/8A+vt2cHXJ9P3FQSuGBem1Jy20yOMx2sE/Reqdy761OQeyMYXecqtwM911BdGtIUPotflV2RReT2EVWOFCY
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2126:b0:450:3c6f:24fc with SMTP id
 5614622812f47-4536e504770mr4237196b6e.31.1764889586363; Thu, 04 Dec 2025
 15:06:26 -0800 (PST)
Date: Thu, 04 Dec 2025 15:06:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <693213f2.a70a0220.d98e3.01df.GAE@google.com>
From: syzbot <syzbot+listc7d821de60dcb991fe2c@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 1 new
 issues were detected and 0 were fixed. In total, 6 issues are still open
 and 69 have already been fixed. 
 Content analysis details:   (0.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.70 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vRIP9-0004r2-TH
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Dec 2025)
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
In total, 6 issues are still open and 69 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1367    Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<2> 1336    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<3> 183     Yes   INFO: task hung in f2fs_issue_checkpoint (2)
                  https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a
<4> 1       No    KASAN: slab-use-after-free Read in seq_show_option
                  https://syzkaller.appspot.com/bug?extid=e818dd42ada3b583bed1

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
