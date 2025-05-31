Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008DAC9D58
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Jun 2025 01:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1Ai8YlJOdjMKASq22wmIBUraWBKbrJLw0sYAkJ/Qcls=; b=GPaRRzqquOTPKq3lDWA4zD+uxR
	rj4djKE/SYOcq6I/V6AAg30mhltEUWqykJs34umkD6+rygvaPoBqC3h/nEN7Ye0jTNlukDzuvGfnF
	kXVailmuPcfUIEHqz2ETcAN/Mwt37dq1KWkfXvvnM3FiWdXb9QnR2scqBhC/8+3aTA3I=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uLVUp-00067l-FJ;
	Sat, 31 May 2025 23:20:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3oo47aAkbAPUpvwhXiiboXmmfa.dlldibrpboZlkqbkq.Zlj@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uLVUo-00067d-9y for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 May 2025 23:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yZhhLbnZ0PG4eSSt9FnuW1K8TROo5OM3uq9fTUJ0/Ws=; b=ZaXmipdUlPjT8L+0NcrApOgS/4
 HTl2Rhk6pmRxwSdTElQc4/B0iDyiuROvL+u2V1rCigla6VLhLXjojaeKUOzj0EQi9S6PXmX4gsx3m
 nXgSo88a8pv9+o57uWS6OVuUOKrp6uVqyUf2+3RMiBcxcZBv061E6xqm3a0y//HOUyYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yZhhLbnZ0PG4eSSt9FnuW1K8TROo5OM3uq9fTUJ0/Ws=; b=O
 J6R1UG9Li193MUkjZyvPC/NMnEkbgebl9p8zYut1XynChoy+aDdfLSmVMLD0vDk8Pn4VEZA1CxZ/5
 9kNxcgHuWWmstK82Qynoj7MFZ9CgNnD2Qa0Ts8xBVL/4vwBabjLYgAMj3OqrH0bJ+BfFWmqYGV0go
 l+1ABRA/VHcTFynI=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uLVUm-0007MJ-DI for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 May 2025 23:20:10 +0000
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3dc8ab29f1eso40759605ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 31 May 2025 16:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748733602; x=1749338402;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yZhhLbnZ0PG4eSSt9FnuW1K8TROo5OM3uq9fTUJ0/Ws=;
 b=GoSKDNjP9KqdzGGFZANxmq33/9h0VZNSjgkT0qqz2l8AJAv7IsmUaqJoLoY6+E6ZxB
 5QjH+dPxAR7JVuXyDU4o3AsBueA9lJ0MkoFXg33AXzEEpy1pi2oGz8zovYinIq9O0m4l
 Oel+sQWeY3iQJbJmj5smzxm7TZvymj5fTF5koq4T8MV6VPMhkAfZsxVhlK+X7zBO7f/i
 +07bkfLwx20s3pBgfY6wbDghH7cQLoLponcXEFQSaU65c7j/kupjMo+dpOuE3zrc9qHL
 q0NRU67JNsIHCTQ9HNABv2TyTdJ4CNIMaTOq+VTwWCneq43MHdIrF9ssarUT5rJ9TgXz
 wIbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDi+AfUiLUPptZuWCBCkIPrcoEGW4yxj9lYMOJMF42+Ctj5LdXpcw6Nq+CiBZ2iicRnPTs8q5pjIMXEys9ibzF@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyrJMbXac4rG5D9jUSet25E2GoMTClNd94CcfuDSxwvd7F6JbEY
 PuD8ixWwogLt4EN1dUZ1udJGNn37ldCOPui6soQEvXCbTNxKgvmkWfUrFfsbbYZs/0zw/V2g0Xj
 DH2j2rBr5Hf1tCxV1EIUzNMFM9+NErvMq4vJC2SYd7iW76N5T2hEoqXgJabE=
X-Google-Smtp-Source: AGHT+IGCxD3oAG4WtemqwxCGWKeXMSIRReB1CBwta6mTh7ppTS3JkVTjOWgbuFnoIN0s/mgfSawICbO9dqqQBziJHDaLHyOxRUdu
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2287:b0:3dc:8a53:c9c4 with SMTP id
 e9e14a558f8ab-3dda3342b6cmr26765825ab.6.1748733602686; Sat, 31 May 2025
 16:20:02 -0700 (PDT)
Date: Sat, 31 May 2025 16:20:02 -0700
In-Reply-To: <67b75198.050a0220.14d86d.02e2.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683b8ea2.a00a0220.d8eae.0020.GAE@google.com>
From: syzbot <syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com>
To: asmadeus@codewreck.org, chao@kernel.org, dhowells@redhat.com, hch@lst.de, 
 hdanton@sina.com, jaegeuk@kernel.org, jlayton@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netfs@lists.linux.dev, 
 syzkaller-bugs@googlegroups.com, v9fs@lists.linux.dev, willy@infradead.org
X-Spam-Score: 5.5 (+++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot has bisected this issue to: commit
 80f31d2a7e5f4efa7150c951268236c670bcb068
 Author: Christoph Hellwig <hch@lst.de> Date: Thu May 8 05:14:32 2025 +0000
 f2fs: return bool from __write_node_folio 
 Content analysis details:   (5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.199 listed in sa-trusted.bondedsender.org]
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [209.85.166.199 listed in psbl.surriel.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.199 listed in bl.score.senderscore.com]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
X-Headers-End: 1uLVUm-0007MJ-DI
Subject: Re: [f2fs-dev] [syzbot] [netfs?] kernel BUG in folio_unlock (3)
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

commit 80f31d2a7e5f4efa7150c951268236c670bcb068
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu May 8 05:14:32 2025 +0000

    f2fs: return bool from __write_node_folio

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1129d00c580000
start commit:   0f70f5b08a47 Merge tag 'pull-automount' of git://git.kerne..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1329d00c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1529d00c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=22765942f2e2ebcf
dashboard link: https://syzkaller.appspot.com/bug?extid=c0dc46208750f063d0e0
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15bfe970580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13bfe970580000

Reported-by: syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com
Fixes: 80f31d2a7e5f ("f2fs: return bool from __write_node_folio")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
