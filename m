Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818BB51121
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Sep 2025 10:25:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cCz2AIjdMICy3yXndzHVoS+5j1L/KTdGX8vhpVYQ5tE=; b=hLsh581qMEcxDZzTvNslL+5T+n
	qemPQxbGjaPidVyIwwK/x3WPrugDSda2YEyORlAVLP24INIi4fYF2D++1ZMvUEIsm6uV01V9sXYXe
	2a9f2GNfPZczG7HSSDUOA3Ql5sJvHIt1ODIEW0LmfLZRjKjIsnv8bNJx2DhudoRTP9XY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwG8j-0003pY-FF;
	Wed, 10 Sep 2025 08:25:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <33TXBaAkbAJoMSTE4FF8L4JJC7.AIIAF8OM8L6IHN8HN.6IG@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uwG8f-0003oi-U4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Sep 2025 08:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hxc/JtKgRHZU0gkUlf9aCALhtXAK3Tp4d8mrq81N/6g=; b=BxOoI18A6gomPkh2DrXSBGxp9o
 ZVxILiVONMiOjex/mY+kAzgqFs7t7ccBkXsuLhjqByh6D9RYWYctGy31ZCetzMRK8brHfWVFwEfsX
 jHAmERP15p4JM4NFyWzwN/KVtO0A5FVbCcfHMKsE4jyEDvQ01ohEPzRLt6D9vCagdxdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Hxc/JtKgRHZU0gkUlf9aCALhtXAK3Tp4d8mrq81N/6g=; b=m
 a3I07aYxav1F89NeSkiOyWslgoX94xlgVnzdITt0hxX0b4PBVYODOh2rQw2E72uk7p35lXuETpIBe
 FZHPNCiWD/79AkB+ySuKzL7qWZ08KawTTMwnlT/QBuQjGlr9rK/mc4Gtq3kXGTPEZxDlSQ6gCCkBK
 JFLbTe9GSbCV5ZmY=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uwG8e-0007Dt-GR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Sep 2025 08:25:13 +0000
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-40194dd544eso48615065ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Sep 2025 01:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757492702; x=1758097502;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hxc/JtKgRHZU0gkUlf9aCALhtXAK3Tp4d8mrq81N/6g=;
 b=bvCGYESGFmYfkAJfv3IPJdyoi1y+MpShHBoTUfVZ+0YmdmaotB0nCSi7JMkV+U6V+D
 BLk46VbqvR177chQoAXmR5kZHDYfRTbrQ55BE7nCggvAesZQvb5cdyWSElD6zZkJULEs
 /nyO9fy9VCqvt2IlYke9WPKnGpjxQIfgi+HZbYgLXqCYZvjc3uyP2OPddMyzku/y3abR
 N8iEihD3IgviYgeUH31iUQFaRvUgk0lXwFnxQiSlXr96OdnAqxjFwt+ne4TiT1M9Nnkc
 mIaqsi0EzTPrH/iEu+jRmuLTBiRAPwuHV4KbTwhWORpeWrqzl1iqzINUo1zKSL4djnyE
 hZLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOoNXAUj8nc6BfKWnRqmXajxusfTISvw3+I+sGzjQkc00Wcj0ZvigvRWVLxkOfFXfaYr9twBe/j8HEFE3Sv2Rh@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwJgFZGEfflOoxiUDY5+xMO7YHjiEqomz3L5+6xMGVqcbncCKDB
 +r28zVSqRk53Yr9VO0MGNBtIWZDQ/Y7INMQ9jhMLjxyz6XtNPj25nILWt0eNVrbAmaBFVSnPuD7
 /eu0NVz7Az8sDGSPtDhMP/K8Q9DV3XUMFZHLEk72Vp9ATBry73TJXg14ZHn8=
X-Google-Smtp-Source: AGHT+IHAnUHV6J8O/T06NJEqAmxLdN8PYws2buCV0rG9JlZLwkfMvBYOfSOLQ6n6pKsRHj28HodUh1CDUPHfcBRGOv89LddVcUG0
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3810:b0:3f7:8b02:285c with SMTP id
 e9e14a558f8ab-3fd88115010mr258419125ab.29.1757492701777; Wed, 10 Sep 2025
 01:25:01 -0700 (PDT)
Date: Wed, 10 Sep 2025 01:25:01 -0700
In-Reply-To: <8ccaa1f0-3263-41a9-b2e5-bf540be979c7@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c135dd.050a0220.2ff435.0009.GAE@google.com>
From: syzbot <syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-by:
 syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com
 Tested-by: syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
X-Headers-End: 1uwG8e-0007Dt-GR
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in clear_inode (4)
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com
Tested-by: syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com

Tested on:

commit:         29c29fdc f2fs: fix to truncate first page in error pat..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=16da7562580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=edacbd86461ffabe
dashboard link: https://syzkaller.appspot.com/bug?extid=90266696fe5daacebd35
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
