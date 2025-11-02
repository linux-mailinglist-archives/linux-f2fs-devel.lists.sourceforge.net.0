Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C54C289E6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 02 Nov 2025 06:39:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=d48M9k8RKTyX+DFqdwhxFiWIpdslBOtes5oPWK7YeL4=; b=mUGbfHGKvO0b2xi5CaonkY4G97
	uXFRMsJjgS3flZBVWcpUf+uVVDN54qqwCLK7kldvz1OQbWgPf9Psg/um6IrFzD4Vj3MzOiUwpNJ4q
	9Vz+Clg8vlVNQTPL2J1knBWJgRUQ4f5daiiG2JS72U7yDuZupJ+DWttS1pHyoE76JTCw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFQo7-0003MW-CY;
	Sun, 02 Nov 2025 05:39:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3du4GaQkbAL0v12ndoohudsslg.jrrjohxvhufrqwhqw.frp@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vFQo5-0003MN-Pq for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Nov 2025 05:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Type:To:From:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I5gofQLv9ATheBLZFs5eVxjk1NYdTx1xDPMzfJ3PQe4=; b=S5MLQ5xAp0TtEp8p7yvPXgyawM
 kstna31F4DpF0u8GHyxeA+3WmH2c9htAXSab9GETVkANMLXAmRz87QhrxbCqCAQGTkxzasWIdK9lc
 vQ3YEyzL6nxtpUvCGz/yQ5qI37RP79hv0ggh0KFRaYriBEooU0IoJvpBf5O2+Seb10hs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Type:To:From:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=I5gofQLv9ATheBLZFs5eVxjk1NYdTx1xDPMzfJ3PQe4=; b=V
 xHQxSMnKLqCh+kS8ThfdwVq98Y06cX+sZaG2kpr5suZDQ94kUgoUxx3V/TXYIidEcwU4wpljt8UJm
 TQZF1QPgVrJk0LRxjqvg/FHIdBRWL948E9RxpLovv3Vofz2KXuoajazK0rDsB/yRZ8JBdNBQozN/x
 C8qPrALqvmOVGS9g=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vFQo5-0004xR-9g for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Nov 2025 05:39:13 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-432f8352633so98346075ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Nov 2025 22:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762061942; x=1762666742;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I5gofQLv9ATheBLZFs5eVxjk1NYdTx1xDPMzfJ3PQe4=;
 b=EHTb8BrcFWe2FM7Lu4Xrc9ufgXr73OJqjRHEbKO0HMnXggeJLA5AHdnJbWRStfpvHB
 PdI5+fnDjO2Pl+jZkzL1HoKW9utbcLzUuhUHgHZKzUhmxs8cAlHvf45t+xwdcxt1N1hT
 ebHKKisZ8Vwe0L24T5OFkUt6ogVRotIucwEPcNLPOoJ0xyJcfPUAdgma/Gx1Tx0bUfji
 HuCyochEaya1zA3oPGUFOr4SMjpK6TvzZkoCjEi7fTH8ECdzKxd22bTQPN67dPvLKW3a
 RAN6tabzpkb0dPlVQK3M309uoGl20ApNWdup4pKuIaAbslPbLshN33x11RfLjrw1pFeK
 kttQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbNsccuryU9cJe8TJrPwT9ZUCILnvCXViDUOr/8xXTXpcPQjKj4EpHPacRbWtH4/+AhFcgZuudjae+YcLXABJx@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwJRw2wympcUD2poJtREWpyU9XSiWebZERqOWqSl8krDtuW27Mc
 d7A9MhPc2VeErbaDsXhMyyFm7fydTCUDFOghXGCZIIlCZLZYtFsuXB82C2SIhhH4NG5nhDTzP3D
 o7OEJ6Ge8dKSMDtwrYBJ0WaTHo7pEf7KEj2eZXqvVksbkRsDTC+BlhgaWx7U=
X-Google-Smtp-Source: AGHT+IHCp5x9Csze7ts1+FeJTWPJ23oGo3DuAx7NFNbgLSzgUoEWPJQbXpSqgSY8kC3XvptviGA3Mx7pJPxr111i/n4AQSQen7Gh
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4c18:b0:433:2389:e0ad with SMTP id
 e9e14a558f8ab-4332389e21fmr37683605ab.8.1762061942596; Sat, 01 Nov 2025
 22:39:02 -0700 (PDT)
Date: Sat, 01 Nov 2025 22:39:02 -0700
In-Reply-To: <68cc0578.050a0220.28a605.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6906ee76.050a0220.29fc44.0016.GAE@google.com>
From: syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>
To: brauner@kernel.org, chao@kernel.org, djwong@kernel.org, jaegeuk@kernel.org,
 joannelkoong@gmail.com, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 5.5 (+++++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot has bisected this issue to: commit
 51311f045375984dabdf8cc523e80d39a4c3dd5a
 Author: Joanne Koong <joannelkoong@gmail.com> Date: Fri Sep 26 00:26:02 2025
 +0000 iomap: track pending read bytes more optimally 
 Content analysis details:   (5.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [209.85.166.197 listed in psbl.surriel.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1vFQo5-0004xR-9g
Subject: [f2fs-dev] [SPAM] Re: [syzbot] [iomap?] kernel BUG in
 folio_end_read (2)
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

commit 51311f045375984dabdf8cc523e80d39a4c3dd5a
Author: Joanne Koong <joannelkoong@gmail.com>
Date:   Fri Sep 26 00:26:02 2025 +0000

    iomap: track pending read bytes more optimally

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=103a0012580000
start commit:   98bd8b16ae57 Add linux-next specific files for 20251031
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=123a0012580000
console output: https://syzkaller.appspot.com/x/log.txt?x=143a0012580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=63d09725c93bcc1c
dashboard link: https://syzkaller.appspot.com/bug?extid=3686758660f980b402dc
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=176fc342580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10403f34580000

Reported-by: syzbot+3686758660f980b402dc@syzkaller.appspotmail.com
Fixes: 51311f045375 ("iomap: track pending read bytes more optimally")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
