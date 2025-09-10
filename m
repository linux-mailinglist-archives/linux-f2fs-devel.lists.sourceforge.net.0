Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4FAB5098A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Sep 2025 02:08:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ViF/Lx16ImRijHIi+5xXqTLGqJlqTN5hkI+SUx9ePe8=; b=AqeNcfKcab/Bn4SbcG/S+5SPtY
	8+R40jKnMyVIT3ERgKkre/IaBGWQ4LJA2lm/kvS5rdeCTzE1/TINXaaJvXDvzE0PCBCbGqYSTxWJH
	EzOET/+r8D9Ak/JlV/rxjLq6t4+Sx/XjaoOpreVtwbAJW8gBDoBiobitMvz40Dr5rz+E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uw8Ni-0007RJ-OI;
	Wed, 10 Sep 2025 00:08:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3YsHAaAkbADUjpqbRccViRggZU.XffXcVljViTfekVek.Tfd@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uw8Nh-0007RC-AB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Sep 2025 00:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B48eG2pE6UmtGQsdEorhi4Kz49vrL4LIBEaiUoQ1ack=; b=bIQ/e8fyncQBAA3/ztijvn0BmW
 nwn/pIJ4SWcgBZrgQFmTDKaHpiqJi/nuNTg0M9Lq9rVl4EipFNg4Bw8V6u8TTL7ZVD1JmPGIrIGux
 8ynTfVrZeEb795Z/d/Fac30qrTHLPzLezJEhW+BXYTs+dbNmDqarKYTdnGppkrnhsvAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=B48eG2pE6UmtGQsdEorhi4Kz49vrL4LIBEaiUoQ1ack=; b=S
 t/zu5Bere3eruQkdTgttaboq1gEjosIzxNjZ+MgAuNcDcJP5zrh91btsIBJqcMlfEb8vwWXVQvptz
 cwfC1sLVaZV0IuduszNCGx6TdJdE3Bck5YMTMG4olBVfaAmNrQdRTnL8lIvAYT3c+2pLHpC75aOlm
 OxMeoaRPhpyxMeNo=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uw8Ng-0005KT-Rv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Sep 2025 00:08:13 +0000
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-4141a91a7daso11605035ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 09 Sep 2025 17:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757462882; x=1758067682;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B48eG2pE6UmtGQsdEorhi4Kz49vrL4LIBEaiUoQ1ack=;
 b=fEKKVe96Jw0cnljr1Zu5lQ6ReMuVdlYOAv+Moad+PXfv23Cq4225sZagBkugPQoVpK
 5WO5HTOajDd19WWt7gv0oivX4gyVnHRpJoGBmaPNDixZ2OhnB52hfLznOjV2dmJN4vDD
 miozJVWrVyJXO0uD+U+oXWFI6tnWWOdmLjbVa+jqvx1OaNDMPUlpUbMkCeHycffY/Jvj
 gGO14ceL1yOuZfHGuej0WgfUqi5q4kK4C+A28P2jrzuYQTRkWUZeOaLNqgvQyMQy5/Cl
 OFqHnJAGvRNga1UmyQqKWKZz1HUN9XlXpuT3gNmCkaMvttRhII8hx8+sIppW5d0rOZL7
 U8sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC9bskTF4pTXykPxWBKYurqhOvkx5nYUQH44EUUn1YgFY4t6F5QQTDMFkXJmpWxMiO5xpG94kC7PNSle7R+T6Y@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzHeP285tqnEaWbVsgckK6a79gaCFp+cvz1kKyK2CDXTnBdIkXQ
 dct0ijux+n0xMimbZHI9siL7C50F2FT28z0Cwm6zOLdWT0IAHXoQ14wvR3d//RTD0HcFsUPyAf3
 X5d/CQ4guXKv8Pc0y2KvSRExwuCl0gjSqOnIhQom08/saoTQRnb374nkTzbA=
X-Google-Smtp-Source: AGHT+IEc3Xlig2C+ezYLq6Le2Uydz707fZ7kOaTGcnmjiUoX5GndFDgFeAd1y0BFHSGOllVSy39Jjf/rLsye3GnwZSdtWkrgHRNj
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:168e:b0:3f6:69ec:ea1e with SMTP id
 e9e14a558f8ab-3fd963dc775mr179254695ab.23.1757462882139; Tue, 09 Sep 2025
 17:08:02 -0700 (PDT)
Date: Tue, 09 Sep 2025 17:08:02 -0700
In-Reply-To: <68c09802.050a0220.3c6139.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c0c162.050a0220.3c6139.0016.GAE@google.com>
From: syzbot <syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot has bisected this issue to: commit
 c240c87bcd44a1a2375fc8ef8c645d1f1fe76466
 Author: Chao Yu <chao@kernel.org> Date: Tue May 21 06:23:18 2024 +0000 f2fs:
 fix to do sanity check on blocks for inline_data inode 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
X-Headers-End: 1uw8Ng-0005KT-Rv
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in clear_inode (4)
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

commit c240c87bcd44a1a2375fc8ef8c645d1f1fe76466
Author: Chao Yu <chao@kernel.org>
Date:   Tue May 21 06:23:18 2024 +0000

    f2fs: fix to do sanity check on blocks for inline_data inode

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17754b12580000
start commit:   f777d1112ee5 Merge tag 'vfs-6.17-rc6.fixes' of git://git.k..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14f54b12580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10f54b12580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=429771c55b615e85
dashboard link: https://syzkaller.appspot.com/bug?extid=90266696fe5daacebd35
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15a43562580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=164dad62580000

Reported-by: syzbot+90266696fe5daacebd35@syzkaller.appspotmail.com
Fixes: c240c87bcd44 ("f2fs: fix to do sanity check on blocks for inline_data inode")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
