Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E7DB29180
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Aug 2025 06:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Lw68U3/iM4ttLOUqZYIqpw4CXKfAHVaeB3pT8kneG5U=; b=DG8Xgt+G+NcO7DaUgxkC2tKMeL
	tg56oMk6zMXpXM140nucxJejV3Mw0waih5IEsNGJTT13pWq0IXDGsA4TjuaJjTvACxMfyfLIa54Jk
	x/z+ZT9wm5J0nuiYmd0VZ53brXM+bVH7FYS1STNLCc//KvpIHq1y4rVSyy4fSy0QVBDU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unUlc-0000uO-CN;
	Sun, 17 Aug 2025 04:13:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <30VahaAkbAFAAGH2s33w9s770v.y66y3wCAw9u65Bw5B.u64@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1unUlb-0000uI-Cv for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Aug 2025 04:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=896C+BBvPR7FNworOurkczGjL2QsirgbJSwhGVznuBw=; b=YvH9pPN7X4ayB9b6zomCjoBGNy
 WUyw+wMxUkVhqtry2RHj8kQe3ekPp4CPw4+tT4MkZWNhZcaLAQJs3LodrbwfUi4AVbMZNxSbkmOzI
 iHgFxzzpMIoc/fY1JGIR3RnpM1q/2UMeAQSZ8v/YQj8UBtazoXJw1dbAzht9vqr6QW88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=896C+BBvPR7FNworOurkczGjL2QsirgbJSwhGVznuBw=; b=M
 wntTABf1rSZy7VorYeoaeswaWblrF6KCQntRNktfa3UGNN413SOSVI3Z4OVgcNO/CwUBu8hHYG39s
 wrYiXWEGptkxvcE23pRIhAl+oeopBgA3BT2KZhr2LoWw8FGGQmYf9RxTJY8A6W0Ks5sPhPXUVsDJ6
 GPvoHgmmy+waBuE4=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1unUla-0008EA-UW for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Aug 2025 04:13:11 +0000
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3e56feb2b0dso94817955ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 16 Aug 2025 21:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755403985; x=1756008785;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=896C+BBvPR7FNworOurkczGjL2QsirgbJSwhGVznuBw=;
 b=K1f7anL/wHiq7gHLpWsFyvAFsUGhFzgYRiXEH+gVuHT0761Y1onlDsYy4oh1S7o7mX
 R8AUxF6yev4muaFYotQtNpgUb6Dqd+L4SlNiR07Y+TBRXdf8tWRALdx/LY/gnmfKDyns
 v/qvyk+qdWbh+hYh2nnSVke7e3VHEAh6F82mjxrh4tAKB9jFvwo1xdTuwzuCX7r+9xrJ
 22/GdIwUpT1v+AYFEOoqLvePk6uA5z6KiphzAQsJilqudHPhc+4yptX8XyLJ5pbNVOEx
 3ncFftF4m/VkshSZiid9r30dnXCwxAsB4v02XB6Gt/PJP88o+PqOoFovl9fQlWAKPbb3
 VsXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYssA2ktGFKn1NqiNmv6ZhPBiuYF17STc+OR3WWfngLvjkxXiFILo1MKzttoGLG0KQFOia+OvdBVnOiUKMVZWZ@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyto1ANoS3S8YYK16wxhzITiOBHa44xfapqHW3NsVSsNSkNqxKj
 HCScv1fDi53YZ9FISnm4GCwusw9E6E0fIoc6Wr5ixdopYUftoinEP4z55DUgir2UC6x4YKqgPOX
 uAjlKfYQd/dubePRbmHVe2Mww/NDu3nMJYZqvY4VJBqGAMAnux/mikQKqr6M=
X-Google-Smtp-Source: AGHT+IF4kc7jnWsVJTPS1jcDq22ltdTyrdLstJput6bS2W1uwx0AbFK13ZSSA/Gq+HHKdDOz/KBsuR0WReD/z5F3X/P8xPcv6HmU
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2709:b0:3e5:4e02:a561 with SMTP id
 e9e14a558f8ab-3e583905a1bmr73539875ab.22.1755403985292; Sat, 16 Aug 2025
 21:13:05 -0700 (PDT)
Date: Sat, 16 Aug 2025 21:13:05 -0700
In-Reply-To: <e5ee313b-8770-446c-9dfd-472740f01bc1@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68a156d1.050a0220.e29e5.0059.GAE@google.com>
From: syzbot <syzbot+d371efea57d5aeab877b@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 sandeen@redhat.com, syzkaller-bugs@googlegroups.com
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-by:
 syzbot+d371efea57d5aeab877b@syzkaller.appspotmail.com
 Tested-by: syzbot+d371efea57d5aeab877b@syzkaller.appspotmail.com 
 Content analysis details:   (2.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
X-Headers-End: 1unUla-0008EA-UW
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] general protection fault in
 f2fs_check_opt_consistency
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

Reported-by: syzbot+d371efea57d5aeab877b@syzkaller.appspotmail.com
Tested-by: syzbot+d371efea57d5aeab877b@syzkaller.appspotmail.com

Tested on:

commit:         b3b0143b f2fs: fix to avoid NULL pointer dereference i..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=108473a2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=13f39c6a0380a209
dashboard link: https://syzkaller.appspot.com/bug?extid=d371efea57d5aeab877b
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
