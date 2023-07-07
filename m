Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9B74B33D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jul 2023 16:45:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHmiK-0000v1-QK;
	Fri, 07 Jul 2023 14:45:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3CCWoZAkbAB8NTUF5GG9M5KKD8.BJJBG9PN9M7JIO9IO.7JH@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qHmiH-0000uu-96 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jul 2023 14:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=faKZ0VTkrZreCkMMkV/w1MPosNwfKMr16O7H/usv77c=; b=cO56GLwKzW2vlGKkQ7Up8W11UQ
 xhMwSAo7HxLyZGEULdAPwEqweYNi1pjQgzzo3hhqLOlpI7jKXjwu8ZMXglyxCOYYrxKxEt/CP6qhp
 ydTdliYr1CFEgW/ik6ngTJg21qZ1YZrIL1aDLHDe7dScsHezhC9WGcW4joZbNd99qVRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=faKZ0VTkrZreCkMMkV/w1MPosNwfKMr16O7H/usv77c=; b=L
 Ep9MZUd0vUVl5HyWmoW/rUmtfYeuxsgXQJq/uNfd/eSOcc+y8Lpd0S8njwzGpUcegXvbjSM9YO98y
 RXlCnbxmo9zHKZMh+5Ay/D6H7mk/5isXM+abmf3kc03F4cQrZmeE1rHWl0v/FPqnEKmc9vomhbW/M
 l267Q/akDRYJKfzY=;
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qHmiD-000i70-HF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jul 2023 14:45:37 +0000
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1b855dc0f0cso30364865ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 07 Jul 2023 07:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688741128; x=1691333128;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=faKZ0VTkrZreCkMMkV/w1MPosNwfKMr16O7H/usv77c=;
 b=WuALK6Z/aFeACdZdeCJgLgLjrX4VjLXcm1dqAWbeO5Vs3rtLkv4PFIm9NQdaKrrIyj
 JfwgnOUmNtiDKsYYSgT8K3UtIKUiybVRzad+Ezhkd5sF9Ir+tIj9seXmEaXbCGUARUpP
 S1x1Q7PvzdyvM3ZNvZmn5wQvgLLFimUYXzre77yIFVpqnsLN85+OW23j25rpK1R5lkaN
 KLvHV7D5v5Bj0sUUmVrVu1rTm9T6xqFY+YlUYzynu/BkvavmrhMIg18THJTHHwc/5XDI
 7Dbb4gNvtCyaYRLVOuNK8ruyQSx0QJQQJSZBZQFPtXEJMmw6zLydrZQXeoBtEVzqhsA5
 Kj5g==
X-Gm-Message-State: ABy/qLaxEqfWWmWvN9ayT+0gX4Q2T8FRCX7WcqwyzmMGonPMvFpPjrWO
 d9f5U4nAenDtOCXWlv6Ec2q6cXRy8S4xrgJhrsJv5j3u9yAo
X-Google-Smtp-Source: APBJJlGcoqmtq9dZ2KJii6DburbTcLjXYhE/WlTYXTej235pqTl7vDbZOS50awBLW5giYdO8BGKF+iPVXKutQjDtW/j39Ci5SfBp
MIME-Version: 1.0
X-Received: by 2002:a17:903:2149:b0:1b6:a2e4:c8f8 with SMTP id
 s9-20020a170903214900b001b6a2e4c8f8mr5275199ple.2.1688741128024; Fri, 07 Jul
 2023 07:45:28 -0700 (PDT)
Date: Fri, 07 Jul 2023 07:45:27 -0700
In-Reply-To: <ZKgfG5yE+VoMiVsZ@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000db85105ffe6af2c@google.com>
From: syzbot <syzbot+e1246909d526a9d470fa@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, chao@kernel.org, hughd@google.com, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-and-tested-by:
 syzbot+e1246909d526a9d470fa@syzkaller.appspotmail.com
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.200 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.200 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qHmiD-000i70-HF
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_evict_inode
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

Reported-and-tested-by: syzbot+e1246909d526a9d470fa@syzkaller.appspotmail.com

Tested on:

commit:         14245406 f2fs: flush inode if atomic file is aborted
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
console output: https://syzkaller.appspot.com/x/log.txt?x=16961190a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=20a954c5f553cc85
dashboard link: https://syzkaller.appspot.com/bug?extid=e1246909d526a9d470fa
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
