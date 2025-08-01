Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7DAB182B2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Aug 2025 15:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0PMG+MXbkt14zc98vp8Ths8gnfPujuOmLq/yBMxquZ0=; b=hlBQkcJ9B07p3ilZ1D86XCqYpS
	NIvK3wlj4ja4RtkZ+Yk69hnYfrFuq3HnktP/bSVauNG25nIIBGqJ7wIPTbzqqVUwcbFfDPv1Ohr0H
	M/v5mlCIpOHBcO+WPM9H2b2wH3VDdsZVZC7PPvJy0RtSuU3wWU+l9WwXvGnD70HBhL+A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhq8r-0004LC-4s;
	Fri, 01 Aug 2025 13:49:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <378WMaAkbAPgx34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uhq8o-0004L4-W9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 13:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DNxgr3qm2Ys714TTlyjFVWm/rdUAMp9OJnDF2EXN9RI=; b=Glp913CZp2Si/gKYa8lqcK9x5P
 /3GnsOi8DBzXuLaKiSm+QyAPL+/RrJk9ouqUV+cqnRH+9aXiNcSBE7d3sHJuMgBWK0/HbdXicGJNv
 mRm0soG0ShlRXXgh3nL+vZCzCsBezyz1t2y8WkrvQeuiHHhhBHn0Kvx5d8uTtuY9bizk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DNxgr3qm2Ys714TTlyjFVWm/rdUAMp9OJnDF2EXN9RI=; b=J
 yISzQdP9PCOfTEnokLAQsLdTy0MDSI978kRxACWPf/1UGxBvQ+g6ia5rHgzajaYyWu+RC+Rb/pO9+
 PC0iDajpbZnvESYGDPtMLDuTcH2/AuLJ8mjIPX6fgi+wRgra34msHrK+krX1S7gUORXeQJV0RBql7
 12cK6AesfJ/Ps5u8=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uhq8o-00031c-Cw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 13:49:46 +0000
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3e410d877e8so4806105ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 Aug 2025 06:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754056175; x=1754660975;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DNxgr3qm2Ys714TTlyjFVWm/rdUAMp9OJnDF2EXN9RI=;
 b=g5rWEb6jLPicTKzHOyCKkgAxHd+HEAgmywbf2BwroPz3sRipUUqWDPGuUYwPrYFoO0
 zWlvMCRA08CK9dT374CqDZDG1s0Cdx8LzmXdhlWVIp+uwHPniHt77rkpistDMsZ+I5Db
 6nQnp69sXsRBYcCda0X2veOZO/zKSG8AE5seaJzYmPVCsZzvW9yPNsstLl/IuVbG3wgw
 D9OmejqXvQGyvf5RpQHhviq0Fx1C6hU4NfNrhiWKHmTjP438uNcAZrQxvgcra+TLHkbr
 HKXlTNMXJF/+QbSN99neQU8C51oq3wO4sy38vMZdmeB0vmEXgYP6+H26hUm7Y+oUrJPZ
 FsWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkEmRbDQ027BS9EO60JMV4ga/aFkabflnKEW6nl+qiSkdcnL7PI3Sa+pioL/ynI9YWA2IN1M2/n5zpehaYL9tZ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzwPPp3nsVWZQZ/D7oz9p6bqgPX4TGbu24mjxvLBSwMF0+daL+B
 40ZwBTXvbW1Dox117psrIRDOjkCB3b6ipsQ7tgZMCafH6EZ+Ud8dHiN95C8XGDRaL9g7RiIRj6+
 Ap19uBlWt8+wkRDtvF6Zo41rJzJspMYI85ESCZl/SuSLJQxTFt/XEVUHKVmY=
X-Google-Smtp-Source: AGHT+IE9ILAeXIH6pfNIPFq5u3zg4e/2UfOHzvv7ZY8AwDOffvHcDlLYeRPK2nIi8mbZ6ddQbIoT1/RwZQRSBhNNjbjK3kYrJzfg
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3188:b0:3e3:d304:10d6 with SMTP id
 e9e14a558f8ab-3e4059b1cefmr101472965ab.11.1754056175666; Fri, 01 Aug 2025
 06:49:35 -0700 (PDT)
Date: Fri, 01 Aug 2025 06:49:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <688cc5ef.a00a0220.26d0e1.006f.GAE@google.com>
From: syzbot <syzbot+list1cc30056768fee2fad99@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 0 new
 issues were detected and 0 were fixed. In total, 11 issues are still open
 and 61 have already been fixed. 
 Content analysis details:   (3.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [209.85.166.199 listed in psbl.surriel.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
X-Headers-End: 1uhq8o-00031c-Cw
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Aug 2025)
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

During the period, 0 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 61 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4275    Yes   kernel BUG in f2fs_sync_node_pages
                  https://syzkaller.appspot.com/bug?extid=bcdfadd9bda9988fa52a
<2> 1288    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<3> 956     Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<4> 50      Yes   INFO: task hung in f2fs_issue_checkpoint (2)
                  https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a
<5> 42      No    INFO: task hung in sb_start_write (2)
                  https://syzkaller.appspot.com/bug?extid=b3fba2e269970207b61d
<6> 39      Yes   kernel BUG in f2fs_write_end_io
                  https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a

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
