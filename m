Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE743244
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 04:53:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbFrS-0007pW-8v; Thu, 13 Jun 2019 02:53:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3jLoBXQkbAPUpvwhXiiboXmmfa.dlldibrpboZlkqbkq.Zlj@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1hbFrR-0007pO-3z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 02:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Np5gXReZhEQY+f0111rtDnwU/KIuuZ02Fmiq9/XZl1M=; b=IsdVt6epgmvOHtH4Ts1yU5VzTE
 XyGgHoehBE0cODwae0shbyfONjJZ7J261VzjPfYR/DkBCLi7C5ccyOHkNi3SPsgckMEZYSh3OMvm5
 L0WA2p9x8x92gYg5dvDyRnqJhZIme2r84r9d/nfvcRfUP/SR4/FtF2xFNITtoqDXCvi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Np5gXReZhEQY+f0111rtDnwU/KIuuZ02Fmiq9/XZl1M=; b=U
 pQrDcPhnmGPLCoSNMb7knQecX+PN1wTu1LCsV+yEkexueFv2/Vxfp0QOxR3qOe0tGCIqwErSEVpyw
 iNEzJ+8agVw5VIVQKhF3ZwYFPx6Nq75+nUD6uPjUe6BGR2as39V9Zkk90SGHdfEsCa6sBJKQTBj8i
 Gblnx73FivszXzyM=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hbFrO-00AzFt-2g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 02:53:07 +0000
Received: by mail-io1-f72.google.com with SMTP id r27so13825877iob.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Jun 2019 19:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=Np5gXReZhEQY+f0111rtDnwU/KIuuZ02Fmiq9/XZl1M=;
 b=eZS0m/09Cwo9EsOUdu8ZlQLvPGHIp0Mp5wTMXwjZIKL7BA/hFZC04PJrQu59/N2/Ix
 Rup7dZtQWyqZ5e5qJgdtFT9aV638blhq1baWkY9TMGvxa1caEPA4UO56ZNpDppHLhgt4
 fW5dG7HkxX2iZQSl2bwV/Laq1zmxSr6dcUiDHiWy0WfxGTamZWzM+V35z6qJy28C/r6y
 eC3lCr7DIPtmP8LSJNvIMAzmVACfvsXjY5puYs3SpvKM4N/EKydCVU3GNIFMbA0/Fgpx
 8GsXux37Aj6vTpgThN91xc+Bh2rbyXDU+NcUhzqRPAbyhnqY4pzqlGDojB11IlBRsX/c
 m3+Q==
X-Gm-Message-State: APjAAAWzUkOdL1tosKfjTfAe6zmF1vXF6bvYyUPOxoT/ObgJIbutBGbs
 QmyTI53hvziOXGSe2egPjYZY9BYDLIJjQpBT9trT5h+XWdlt
X-Google-Smtp-Source: APXvYqx5IsSM2NAOI/iAdm4c3z4Q0KMokZxWs1UI+Ut9ao7lxnz24tDe4bNCdFgQ1DgRpytXrLHrXA/sEafV/s9VWjsSAD+q/q20
MIME-Version: 1.0
X-Received: by 2002:a24:9d15:: with SMTP id f21mr1753140itd.13.1560394380348; 
 Wed, 12 Jun 2019 19:53:00 -0700 (PDT)
Date: Wed, 12 Jun 2019 19:53:00 -0700
In-Reply-To: <000000000000a861f6058b2699e0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c0103a058b2ba0ec@google.com>
From: syzbot <syzbot+8ab2d0f39fb79fe6ca40@syzkaller.appspotmail.com>
To: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk, yuchao0@huawei.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.72 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
X-Headers-End: 1hbFrO-00AzFt-2g
Subject: Re: [f2fs-dev] INFO: task syz-executor can't die for more than 143
 seconds.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot has bisected this bug to:

commit 4ddc1b28aac57a90c6426d55e0dea3c1b5eb4782
Author: Chao Yu <yuchao0@huawei.com>
Date:   Wed Jul 25 23:19:48 2018 +0000

     f2fs: fix to restrict mount condition when without CONFIG_QUOTA

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=142f4e49a00000
start commit:   81a72c79 Add linux-next specific files for 20190612
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=122f4e49a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8aa46bbce201b8b6
dashboard link: https://syzkaller.appspot.com/bug?extid=8ab2d0f39fb79fe6ca40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1250ae3ea00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1568557aa00000

Reported-by: syzbot+8ab2d0f39fb79fe6ca40@syzkaller.appspotmail.com
Fixes: 4ddc1b28aac5 ("f2fs: fix to restrict mount condition when without  
CONFIG_QUOTA")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
