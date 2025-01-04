Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C2A016BA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Jan 2025 21:31:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tUAng-00088x-Cg;
	Sat, 04 Jan 2025 20:31:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3hpp5ZwkbAOMXdePFQQJWFUUNI.LTTLQJZXJWHTSYJSY.HTR@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tUAne-00088e-7i for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Jan 2025 20:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TawJqxFkG0sJydy2ftO+462SsxIaxbD3wY6nFlK90fM=; b=LNoIFHP4AWpTpx40jRm+pNuVFj
 yMCOw26VoS+94N0RLRz/Pucm52HPqhcvvGvzEqTJ2rbsU9GY9G6Ay73S5FkdjrYxystlVeaZB4eCv
 7qLOMTcksdeU1QEX6qj9f/UHP+jQUCaUKMca1mRBgQGmvJJwqXPcqcrnqsjmCxY+6dBo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TawJqxFkG0sJydy2ftO+462SsxIaxbD3wY6nFlK90fM=; b=j
 SpsUGiPOzjW4YO5tHfeENRkYmyoWhWKaAtXtyhvQfBOwUO+bB6JUPUg+oYTeXatoGGCiRuxt/Tptk
 69D1MXaRGxGmVHRp8q6RHmybyhfivpmcv/QEJtQCeK2VhwG23BX0mkxNZdyRrmCDAq6RCDA21Tm8Z
 dGsHjeS/qaa7t+Zk=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tUAnc-0002kq-Cu for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Jan 2025 20:31:10 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3ac005db65eso130559555ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 04 Jan 2025 12:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736022662; x=1736627462;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TawJqxFkG0sJydy2ftO+462SsxIaxbD3wY6nFlK90fM=;
 b=o5ghayG6BcWvvzSqx2ik/94h3A0kis0p0fcsdQmwomtjMILk+6PV+BPMdbw/XEAk+q
 c/jPktTZDYNi401U++cK6kT3CYI6aNFWHEo5fnBvA55iXofanzJy4TKqq3DXNvnaQSUg
 CJA309TulE8B0l8Y1KFTzWlecO8PLmzBr2HRpJeQ0OAO0V70Z+Z/hvg9bgn8hGB6AwQp
 DG7J2ohOU/uj6yLSnUVJl61xy0v/LomslYO6tFP2gcMAhbjKNJpVy7HgXqz/GA6C7zjl
 Cra9pAfQqpRa9+pTVbTr4R3E2XWLMiow4mFD607yZ0McA9wFMSKm4/4ZYBzmltmt48NO
 V5fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5BLdsTFA01/VpIYvhANbZHXH2vCnxB4OI3MqOqd/sfTfD+1jgrv7pvgepP/9wkt1Zha4H3zIhEzQZpnuvArp9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzQ2pSY+k6MwB+cZtQ8Maf9YvK3odrSz/g7YqQkoDhDtTxXRKfq
 nK+8vp0rjC5lhkz9zVGZPx7zNWqAi+ME3bttjxwXb4f92PzBlN36Z12T7zU6vpIv+G720MXIz8t
 11gfgK7sZjydY87YLgC+W/v+jfnhf1sKUXkDE1w3euTJHHSbnHmVTAaw=
X-Google-Smtp-Source: AGHT+IEKgeOBhN4AUbtS6D8mtflQLUsRC0+40Q4pTSlJLV9Q9SjtBWaoufV196MRcrdZueXFXrvvGYyxEhZjsgDSPuAKN9/WFv88
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5a4:b0:3cd:df49:45d5 with SMTP id
 e9e14a558f8ab-3cddf49465bmr21136415ab.8.1736022662647; Sat, 04 Jan 2025
 12:31:02 -0800 (PST)
Date: Sat, 04 Jan 2025 12:31:02 -0800
In-Reply-To: <6776a683.050a0220.3a8527.0042.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67799a86.050a0220.380ff0.0005.GAE@google.com>
From: syzbot <syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com>
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
 Content preview: syzbot has bisected this issue to: commit
 388a2a0640e16a8887f0d47dab207f344fbdb913
 Author: Chao Yu <chao@kernel.org> Date: Thu Jun 6 09:55:51 2024 +0000 f2fs:
 remove redundant sanity check in sanity_check_inode() 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.198 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.198 listed in sa-accredit.habeas.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
X-Headers-End: 1tUAnc-0002kq-Cu
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-out-of-bounds Read in
 f2fs_getxattr
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

commit 388a2a0640e16a8887f0d47dab207f344fbdb913
Author: Chao Yu <chao@kernel.org>
Date:   Thu Jun 6 09:55:51 2024 +0000

    f2fs: remove redundant sanity check in sanity_check_inode()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=175f1418580000
start commit:   63676eefb7a0 Merge tag 'sched_ext-for-6.13-rc5-fixes' of g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14df1418580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10df1418580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba7cde9482d6bb6
dashboard link: https://syzkaller.appspot.com/bug?extid=f5e74075e096e757bdbf
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1676430f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e34edf980000

Reported-by: syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com
Fixes: 388a2a0640e1 ("f2fs: remove redundant sanity check in sanity_check_inode()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
