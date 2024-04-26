Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C89DD8B388C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Apr 2024 15:35:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0LjP-0003Jb-L5;
	Fri, 26 Apr 2024 13:35:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3hq0rZgkbAMc5BCxnyyr4n22vq.t11tyr75r4p106r06.p1z@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1s0LjN-0003JU-Jw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Apr 2024 13:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wuDLgNPEPbdMqePbD8KgIT6xOlVG4D1tdaDE2YInWA8=; b=jb2CK+LYYlyGj2BV7KDFdkln5k
 8JpBTMHVayjIcaipns/4X7XmmxoOOUBW52uS2Xj+QT8yMmhZxOrmEqin5H7DEx+5rXoz+bJ8r+gZI
 5wVjrwrlkRrxwbg2Do1zWscroFwbQovv/pEW1p/+DG1q0t6xNKsXQ4SRvx0u53OmC3mw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wuDLgNPEPbdMqePbD8KgIT6xOlVG4D1tdaDE2YInWA8=; b=m
 1ZIsg3nTAdyd9nJEKSlbZ52QC7vs9RjJ/nFMPsClyY8NQbYPhUt/j69sv8hdeIL5XnnP4aL5qUPmy
 UvuF3Wpdf07Bp3F/j7QjtUa4zFpEefqDR/YvNjSWt5w1kKc1FDavydS0FcZn01dScElqnHtALhH9I
 uEE+Y/KlxIYOAb0M=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s0LjM-00005L-TG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Apr 2024 13:35:13 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-36a1a2f396aso21741315ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Apr 2024 06:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714138502; x=1714743302;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wuDLgNPEPbdMqePbD8KgIT6xOlVG4D1tdaDE2YInWA8=;
 b=meS4BwDZ8g0R/K/H8u809DfuOe1vh2VB/S35tWH9jfT3h1yUtfefOM63xBjHiyIZbM
 ZziPDUq/wOiTHnAEDXrpyoCIk1b3e8s3o14QqrGHXgEULHbZh+zStES9nEOrfD8Gw6Sw
 QISIaUYP6Z/gBOFYadkXgNfwqIt96ZZy/ySa9TSSnjBogNqkBVaK//Cf7xpI/myiksaj
 yo77M/aTLm27FOyuTjWitUgfym3PoXi9yfw5fXCm5B7PCMbZiKpvOif3R37NT15tHtgn
 t4izNHCqCgMpEbvYZnK8S3OWemoJROUGMNRH0nhU4AbH1a3DUrOBXz7itKlKzCubYzZ4
 qIOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWQQeIb7/2Fk8yNOYDzZTn+YBpbPKADnAUL9/ZfvCr8aL08gHMBjDpkBdgWVxn8O7UMw6+IDPLF+V8NjiW4wjHHDLt9BQfVqMLmtnOQFwasSys5xhT3Q==
X-Gm-Message-State: AOJu0Yzv6qaoL5k8xonbK1glRCYDbajcMHu7QRL+5QX5mOPGVnEkIH7A
 L81x1F6+vyyzOdIfaRz7VwOSIJRRb0NedxBZY1FIZwZ7xKljtsaCcFNePGbJG1+0UWcN7na6T8g
 Hd1EjNGbUQJ6m9RhLX37vJu79wwZbzqs5XxAJjSaH1LkosHn03rVLgHc=
X-Google-Smtp-Source: AGHT+IEmE/D5eUWM3aazPdASVp2ndWN2Klx3oxJWUkQ8hKxgnVlM7qt0MSyaTsonzow98DrxSD3ec2fL1yp+5/rIGkUCMCzs2HRR
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d9a:b0:368:c9e2:b372 with SMTP id
 h26-20020a056e021d9a00b00368c9e2b372mr59976ila.0.1714138502468; Fri, 26 Apr
 2024 06:35:02 -0700 (PDT)
Date: Fri, 26 Apr 2024 06:35:02 -0700
In-Reply-To: <c0a1b8d8-4b54-4881-b924-406e0e2cbca5@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000892ccb0616fff80b@google.com>
From: syzbot <syzbot+3694e283cf5c40df6d14@syzkaller.appspotmail.com>
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
 syzbot+3694e283cf5c40df6d14@syzkaller.appspotmail.com
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.166.197 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1s0LjM-00005L-TG
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-out-of-bounds Read in
 f2fs_get_node_info
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

Reported-and-tested-by: syzbot+3694e283cf5c40df6d14@syzkaller.appspotmail.com

Tested on:

commit:         77d6a556 f2fs: fix to do sanity check on i_xattr_nid i..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=1535f237180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5a05c230e142f2bc
dashboard link: https://syzkaller.appspot.com/bug?extid=3694e283cf5c40df6d14
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
