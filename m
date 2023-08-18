Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D2781480
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Aug 2023 23:02:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qX6cF-0002TB-08;
	Fri, 18 Aug 2023 21:02:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3atzfZAkbAM8DJK5v66zCvAA3y.19916zFDzCx98Ez8E.x97@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qX6cC-0002T5-Oa for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Aug 2023 21:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aWW738wflJMJQYkrTGuTeXh48bPLNcNnl4v0SBsNOIk=; b=jE7af4t0pnjKz3NfD84o0RnpJj
 0s9Ei47FZ5+bUn7EJkHquEdBMGdv4pnMmOcgqXnrYnaFT7dmXckBqs6JvxPZSN/LoAsG3895E/Qp6
 8j4JDwGF3Zt8CaZn1KSnqIQqbIt5fjOLb0nDq3yRpIDVulo7onme+X9/Vafl+LJN6Rbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aWW738wflJMJQYkrTGuTeXh48bPLNcNnl4v0SBsNOIk=; b=G
 M0wNdcLmO5N6vOOnHb9x2qCh0tK5yjVDeXGVLKIcBF0E7YT0SCkgVBusoScVC92s2zmKrRXKPQFUC
 9DJ7SnfZKc39NX5cjfwdYz0LE+UtodLhm2R9oe03CFpvvmucW08sb18f4rA9Jkpbh1CC657iLHHVa
 I5LS8uqEC4khyoaI=;
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qX6cC-0005VE-3o for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Aug 2023 21:02:40 +0000
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1bbd260ca2dso20479345ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Aug 2023 14:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692392554; x=1692997354;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aWW738wflJMJQYkrTGuTeXh48bPLNcNnl4v0SBsNOIk=;
 b=fAO/+by20S8FBYkXlp/YUJMk6wHaoBtN6iy8m0vWtkDmzYCLuS5CVXSc7PbMY1HZ5x
 jcs2DHbNi32GsiyLgMiBoZQQW2IHchc0ZA9wXRA6sRflvCqv4l/7i8DDa36pi70QvKT8
 9DcAPnPjHtxYb0sBWBUdA46nsOFZdnjwI8Ov5us8JuEeKCAePgT8pikwXstuc2GIW2G9
 Auioj36ozq94tgw2Ib0NuoXWH+5yuTYdKotD86mtx/mmUu5d3nrKjkmZTKuYALXaTJcd
 NjzpCRtFGDgzEUDsgRQRLRPv/zra/LKD7dr+ljbQkAFrETPOOCX57YG0LOOkk/tnKUGk
 XegA==
X-Gm-Message-State: AOJu0YxART7xT343MrLLwB9lDhi7N67qpaUkEGFauhsz4A+ZgCAk58Cr
 9CDVf0e/R5EDOQujpB/wtVrvMyjPAw6FhtJChHkpO+jRDOSR
X-Google-Smtp-Source: AGHT+IHk0yW+EK5vHIwTnuAVqCAY+wJiyUxOLlBYD4Hlfjx5UFV9syogBVOAY8hPuQW7qBhKAa1vptZ/vYoigV2PuSU/8wo1lLoU
MIME-Version: 1.0
X-Received: by 2002:a17:902:e809:b0:1bf:1a9e:85f6 with SMTP id
 u9-20020a170902e80900b001bf1a9e85f6mr175690plg.7.1692392554387; Fri, 18 Aug
 2023 14:02:34 -0700 (PDT)
Date: Fri, 18 Aug 2023 14:02:34 -0700
In-Reply-To: <ZN/RRbknKhqeH8vj@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000066175060338d99f@google.com>
From: syzbot <syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-and-tested-by:
 syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.200 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.200 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qX6cC-0005VE-3o
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in f2fs_getxattr
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

Reported-and-tested-by: syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com

Tested on:

commit:         261546ae f2fs: avoid false alarm of circular locking
git tree:       https://github.com/jaegeuk/f2fs.git g-dev-test
console output: https://syzkaller.appspot.com/x/log.txt?x=16c22b3ba80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d0f369ef5fb88c9
dashboard link: https://syzkaller.appspot.com/bug?extid=e5600587fa9cbf8e3826
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
