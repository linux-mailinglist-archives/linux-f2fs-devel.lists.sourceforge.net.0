Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A80C947DE7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2024 17:22:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sazXM-00072r-3V;
	Mon, 05 Aug 2024 15:22:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3G-6wZgkbAPYqwxiYjjcpYnngb.emmejcsqcpamlrclr.amk@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sazXK-00072k-Tc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 15:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fqYQ1rnc25cZh5MXJtV/NcibaXRvGQIgXbkVXCpo9Vg=; b=b47ZIFxSFA0e8FdVWvii9uPygw
 d5FQVnOX7+c5wBJxuh9dvTSawebKLCe7bnWILHL6ft6qYxLOuYaE/10HbreoRalM1heXvwU2ZYIxA
 RlYXRKBRQ3txlkdWdgvxao0bumMq9csaJKnLaBMCFLjiIQjdQ9IxoeMSDUyx3VyiUBMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fqYQ1rnc25cZh5MXJtV/NcibaXRvGQIgXbkVXCpo9Vg=; b=C
 2cAU59ji0TfrjM5idhoVrea0Vk2ko0iUp2bqsQ3boqCL5P4VTrFkoydkgTgkDFNO43reB1tjGz7eK
 ry66f0i3EeUG4qPoLymxoIvCT+X1BoReulxgvYPsC8dkAKOD+9JvDOlwzHR8Temrtdv0B9rHWQTKq
 pzoxTz2lDnU29h+0=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sazXK-0002Kc-8A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 15:22:14 +0000
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-81f8c780fe7so1511877639f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 Aug 2024 08:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722871323; x=1723476123;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fqYQ1rnc25cZh5MXJtV/NcibaXRvGQIgXbkVXCpo9Vg=;
 b=PX/aTdkulkbRR/8/yaWz65gsAqUcgwSDbuhRfaqS1m5wDVwnYzLqrZ5g1gBeTJaaCc
 HbX4KXksbnN66wpiUIleOm6yrLgPjcV8fOJ9fwnH34wdc8gHVeAS+xgJocLWKPtr1Syh
 GaLP9aB4w4kArpxJmVRd6Z+17QaywMvwiu09o/010wdY4F1Hhhu+4c6qyIc6a0Ymvtlz
 3/7KbJ4MbTOX9HH4IuE7BeXGTW7h6cAn1ckUF56Hqc+8+rmzARMt0hPA+7m+dhEwO7aU
 rTTG/nJjmsq7bPeZcX+onALkDM/nhNLG+Xr8cAUfNyizjnvg9gvYt4xCWOA4YKYs71cb
 f/hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS+NsbReyA+vYhZXhyHUvDl6DrqxEyjgLfNdDOWyC3BjCO/DJSqlMBXTKXcwvYCcMS0KBE/sBdc3eUNlRu4RO9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwkOO5fv3+s0oYRJmOJern8RaZlpqSVqCIw2+9QyODqOG/D9tUz
 cWhlFLN8MBiScuafYqpMWhZWplCeyPk0AqM6GBOeU3Kh2JspAUZKaZ4RJ1qxJa3FQbm+6+JzWss
 DDv2W/G5eDdfTNsA1RuTwT3eYQkz0zHIG7uTcKXyBmQ9DIkxKYOSEyLA=
X-Google-Smtp-Source: AGHT+IHIVNrWhdKuYXvlWP06vdiuw1dl3ZRddzqrJ/HvcfeJ2tl/ButFA0z7NeffmCSpRGbYFawwBfu5eYDV1ordM3AX4Z51JLo3
MIME-Version: 1.0
X-Received: by 2002:a05:6638:410b:b0:4be:d44b:de24 with SMTP id
 8926c6da1cb9f-4c8d560df7amr526272173.2.1722871323340; Mon, 05 Aug 2024
 08:22:03 -0700 (PDT)
Date: Mon, 05 Aug 2024 08:22:03 -0700
In-Reply-To: <0000000000004d2e4d061a401e51@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000038c729061ef13d67@google.com>
From: syzbot <syzbot+f195123a45ad487ca66c@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -4.7 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot suspects this issue was fixed by commit: commit
 a8eb3de28e7a365690c61161e7a07a4fc7c60bbf
 Author: Chao Yu <chao@kernel.org> Date: Mon Jun 3 01:07:45 2024 +0000 f2fs:
 fix return value of f2fs_convert_inline_inode() 
 Content analysis details:   (-4.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: goo.gl]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.166.69 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
X-Headers-End: 1sazXK-0002Kc-8A
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_vm_page_mkwrite
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

syzbot suspects this issue was fixed by commit:

commit a8eb3de28e7a365690c61161e7a07a4fc7c60bbf
Author: Chao Yu <chao@kernel.org>
Date:   Mon Jun 3 01:07:45 2024 +0000

    f2fs: fix return value of f2fs_convert_inline_inode()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1055414b980000
start commit:   83814698cf48 Merge tag 'powerpc-6.10-2' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=238430243a58f702
dashboard link: https://syzkaller.appspot.com/bug?extid=f195123a45ad487ca66c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1129d362980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d4ce06980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: f2fs: fix return value of f2fs_convert_inline_inode()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
