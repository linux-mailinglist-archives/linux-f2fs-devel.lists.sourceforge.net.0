Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1240228806C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 04:40:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQiKZ-0004eR-89; Fri, 09 Oct 2020 02:40:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3hM1_XwkbACEPVWH7IIBO7MMFA.DLLDIBRPBO9LKQBKQ.9LJ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1kQiKW-0004eJ-UA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 02:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/vPsdNPBvKtbX2yFfD1uwNT/06XdsG2XB3HXtY9anCU=; b=kA8Y/KqbQ6+tv50plcIkt1qwfa
 eOSfD67tDXXcazf/tvKiQtW0+irK1HNPX9EVFyf7gr0+ZqzC47OyGXVLoXcuXWywxF6AQyqYzMGZM
 tTv59YpKzJTqENnUaaCszj6pOahiNh52WJ6ccqvGOTvfRidtTUiZgklAgvUSvrj0rdIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/vPsdNPBvKtbX2yFfD1uwNT/06XdsG2XB3HXtY9anCU=; b=i
 hLryik2sSE5ohtYVbwNM0PZJbZSq2DUV4B58mb4vdpEMLl41uQP8GWJ4one/okiX3MMaGY5B6ulAE
 0udfHVaqTgcQvHpKA0w0ZwnqTGS1ahBC4RVj/IS3T3ZivwPwEaPLwBdXpkmusQSIEhSfdNnXrk+XZ
 H0Cag71hWAsxW27g=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kQiKS-007rx9-83
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 02:40:24 +0000
Received: by mail-il1-f205.google.com with SMTP id x10so5764788ilm.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Oct 2020 19:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=/vPsdNPBvKtbX2yFfD1uwNT/06XdsG2XB3HXtY9anCU=;
 b=A4iyl8c4W9+wN92b4xf13h6MluZxmPl9uAd8bP3jwdDJsFFcGjX27AJzB8oZNblfT7
 r/OAVJCtV4FHOw0yXpm24HpZ7YB+ID8Fr1OMuMVCZNKq7k1HIytO9tuQZ1ZFM3+NPMeS
 YXnntjQ9Eg+a0NgbQWM8DcoXpbHViuUj+IjbEP5MkED6U9WavpdRCdz8WzmBP1s4bHQg
 5PSvt7eAudJ9jK7pXib+jTwTJg0vpssF9ZGW698RXgrquqNvs6DOIl76Prnx3J/6H+zL
 746SHJRdNa0rzkxQCal1DBDRjsRqiu+70hJo9rMJB//ujiiW0vdcgu9Slkd5NAd6dfbC
 qEjw==
X-Gm-Message-State: AOAM533ijHoZ93xO0/STYa+QoB00KtTuTGJPGy6REQK6B7cWnNCjxIlF
 RZf+0OgQLlWDAuBNwPCR2MrTa7QxQ7G6b2c2hvIPILvWTb2b
X-Google-Smtp-Source: ABdhPJwtkYMALivaBfrUViip7NgYrqa7K9OXqz214KzVWdtu39kWhABMAytxVEbDrR/IiTJNPDuHyM2I0Jvcf+BF+qyKKnXvhScE
MIME-Version: 1.0
X-Received: by 2002:a92:9a8d:: with SMTP id c13mr9258613ill.233.1602211204976; 
 Thu, 08 Oct 2020 19:40:04 -0700 (PDT)
Date: Thu, 08 Oct 2020 19:40:04 -0700
In-Reply-To: <00000000000085be6f05b12a1366@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bb48fb05b133ddf5@google.com>
From: syzbot <syzbot+05139c4039d0679e19ff@syzkaller.appspotmail.com>
To: Su.Chung@amd.com, alexander.deucher@amd.com, chao@kernel.org, 
 drosen@google.com, ebiggers@kernel.org, jaegeuk@kernel.org, jun.lei@amd.com, 
 krisman@collabora.com, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, su.chung@amd.com, 
 sunpeng.li@amd.com, syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk, 
 yuchao0@huawei.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.205 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.205 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
X-Headers-End: 1kQiKS-007rx9-83
Subject: Re: [f2fs-dev] general protection fault in utf8_casefold
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

syzbot has bisected this issue to:

commit 91db9311945f01901ddb9813ce11364de214a156
Author: Su Sung Chung <Su.Chung@amd.com>
Date:   Mon Jul 8 15:31:39 2019 +0000

    drm/amd/display: refactor gpio to allocate hw_container in constructor

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1012ee8b900000
start commit:   c85fb28b Merge tag 'arm64-fixes' of git://git.kernel.org/p..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1212ee8b900000
console output: https://syzkaller.appspot.com/x/log.txt?x=1412ee8b900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=de7f697da23057c7
dashboard link: https://syzkaller.appspot.com/bug?extid=05139c4039d0679e19ff
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12316e00500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16e80420500000

Reported-by: syzbot+05139c4039d0679e19ff@syzkaller.appspotmail.com
Fixes: 91db9311945f ("drm/amd/display: refactor gpio to allocate hw_container in constructor")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
