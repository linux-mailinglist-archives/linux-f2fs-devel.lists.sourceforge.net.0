Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7609596A212
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 17:21:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slVLI-0007Dg-Gu;
	Tue, 03 Sep 2024 15:21:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3XinXZgkbAEs5BCxnyyr4n22vq.t11tyr75r4p106r06.p1z@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1slVLG-0007DT-GU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 15:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pdhWR+G8uLjBKfvU6iFCSQyIIWpyU5h8YmkzUpZmhvQ=; b=MXoi27aTZkDjI1sY1dEVtn3zWZ
 Cimq51VD8QUUCJ+v7vPzkudhiz3gK6Rm2xPXp5tgwi4SRpXpbzMDQ9NaKxybVg/Kx9b8YLt43HiTJ
 dE1a4OctkcrkBDaafQNlakgtN9ax0rxSL2qTxo3Kn0VWRxmDpUCo4/q9eWBCv/WL6DR8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pdhWR+G8uLjBKfvU6iFCSQyIIWpyU5h8YmkzUpZmhvQ=; b=O
 Zxv+UL1QYXCNrUc+iL19S4bSuQCgc1j+Kj8yP4IOn5ZGVytGxknNOvKktAA9ReNTTO2SvZXYdsYGA
 2DFMr2ZUXaLJAyVT5tpjDb3KG3raUUsZ/NWjnm5YOOxIOFurVb5qEsG0EkzZgSbJU7Chw8pFJIE3C
 9UQI714lFr/ElPks=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1slVLF-0005ZT-MS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 15:21:14 +0000
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-82a124bc41aso655557639f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Sep 2024 08:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725376863; x=1725981663;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pdhWR+G8uLjBKfvU6iFCSQyIIWpyU5h8YmkzUpZmhvQ=;
 b=iycwluOUEaw//zV7m7kZ5wKJQwUzTo3xu8umK2RVbIRbMtNIKVTFz8tbHz4GdqR7/8
 Vjo6lv0L73xQUUpuhDoB/yEf/XyK8SJsT7QHCVKzr3VMOUUR1tKjspT5oLpPEy0riFMQ
 VbMWAaAYuViYDil7m7hTj2Gm7pDvynBzla0gIl3xPLR8r6Mx3VxMpZkle0gch5fiIvXp
 EtIRkBunYdziQJwzPKYtIkEG4k5vI+nyGAxWkTmr/PAEkoIIAACytBrjjWK/434TNusv
 kibXkdTjJy79lwiw/r51+vyu1dmyXAn4evbZA6yWdfbEnS8weStYfUU+c7az+c4e9L8j
 lJnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUu7S3+pTHM1mK0ncUS0sm/OpidNoVXS/lWwMxwS4uqp0o24P9PkYyBiZbqWZxMEHxfhkScC46Q2sRHX2buw+J@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz2UbwxWWn4eVm85hYcraoiLmJ1bpNqeYbsQDRlH9kvnKyH5ZQa
 QR2vP4FbHC5njNlMpN9IQHMJOuVoRVOBq9yksBIiWsiczOu+b11Hjb7SCQqvJnzZcp65CkT+R5X
 PSyNTTeQQm7qaxh72YjYUWtNPeu1K5xFnJyTI9te7YuKCZMA4Fbf6uQg=
X-Google-Smtp-Source: AGHT+IGuYDrHt//evjliRlOW0PwEhQcMUXOrsfLe+oymCy5dcfAwaEBvDhuYp5TPwilcadbw76Ma+1wpUBvjZysjrMFhUGCA373t
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8506:b0:4ce:8f9c:c601 with SMTP id
 8926c6da1cb9f-4d017c6028bmr843346173.0.1725376862815; Tue, 03 Sep 2024
 08:21:02 -0700 (PDT)
Date: Tue, 03 Sep 2024 08:21:02 -0700
In-Reply-To: <10d4a49b-c596-418e-969c-0830d678de87@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000320e90621389b3f@google.com>
From: syzbot <syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-by:
 syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com
 Tested-by: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slVLF-0005ZT-MS
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_evict_inode (3)
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

Reported-by: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com
Tested-by: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com

Tested on:

commit:         69dc8fbb f2fs: get rid of online repaire on corrupted ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
console output: https://syzkaller.appspot.com/x/log.txt?x=166e6963980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9358cc4a2e37fd30
dashboard link: https://syzkaller.appspot.com/bug?extid=ebea2790904673d7c618
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
