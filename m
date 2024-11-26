Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 563969D9D43
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2024 19:21:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tG0BY-0006Mc-FT;
	Tue, 26 Nov 2024 18:21:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3jxFGZwkbAAw4ABwmxxq3m11up.s00sxq64q3o0z5qz5.o0y@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tG0BX-0006MU-JJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Nov 2024 18:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qoOBTuXmZMONzSpeUHAe5nMhij4O/OjASPmXiAfcFJ0=; b=C772pBd00djCiKG6nb/XDRasyN
 4GGUlmOJKkU8p895UPKDY1v5PYA/R323MSfixV2x0v2t/kHLxM+77RwfIDatZ9UQKlJO9mEWbYhab
 HeEPGhgD7RkYvLGEtsjB5+ZP4nR5aTpE6DeSejGw9JCt/Qy8MjhzWxtxQ2YHGy68xSpE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qoOBTuXmZMONzSpeUHAe5nMhij4O/OjASPmXiAfcFJ0=; b=c
 QLQ43IUuuifg9dADOwVXzUcfjmkjTj3LThJGG+b11GsYZgB9Sjc2KUL5qbMwfJfVbO0feNpVM8U6B
 cEIE+trovsQI10H/LY3flCoBe+peHjgg7/cyeh1B/qrl7z0R7+aOK02TNtkJr6vnqM3nbMruIkX2l
 Bht1w4wNewhwA2i0=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tG0BW-000751-Ci for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Nov 2024 18:21:14 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3a77085a3d7so328355ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Nov 2024 10:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732645263; x=1733250063;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qoOBTuXmZMONzSpeUHAe5nMhij4O/OjASPmXiAfcFJ0=;
 b=Qze/lRHvCMzmyA+rtnvtk/icL2yyDc3EPr0EmK1AUMB5EZqABpoCuRkfp6kTnKwRxD
 sorJWwsHaTJLfcYOzFmtzAYsI9zv+3XJQyGibEY6Ewv1tJwDbCMLD63cepvCak5DlB1m
 9D99MrSm+t8Y0P94RW9DWggPZHIjpNHSRibnm2UVsHdW7zKclQOMRWXJeyp2pDvNeCNB
 YeVP253fFYraKJ+PWOJmM8RsAqFIw2XOtjWRNYLvznSaQuL3Rqa+hRvZRVag6r0Ejd7M
 TUxNgkxhuxoKBJ1ZDGFNIL6RcO/RNHHsXAK08/GQUo2W8sJsGutikZanEeqsgirLJCLo
 JV8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0bBTugcxbqro8jg+48kw2OtNveiE85hZpgWbzpUs4M/CDw9WxYJhOZ0ifmeZRoh5kTdjMYP52GA1n4flDpMi5@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx7OOtF448slBtxTikGmM5AqQrhAr5rIdeq6K4VRg+UfT/VmJnh
 z7a+iVye6d/oGct1j3KefPqx7Gj07p2plHEqAJ6BSyiui+719BZ9d/GtqteUlcgPTycCkUUSDDE
 nRFoYhSfBbuVz+aYm1ll69/6e5DJ9I6795XAFdFAnwdJL85ilXUuNfhs=
X-Google-Smtp-Source: AGHT+IHr6y+DblGQxKReJZn1KE5Jw+j2+buY/3AUa/LxGVAj+eCSoMZ3vbMBxMwGDLazwUo8ZaHvFCD/unJNQDa9ElLxKRsPw7/x
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:168b:b0:3a7:abdb:4a37 with SMTP id
 e9e14a558f8ab-3a7c523e8acmr1911585ab.8.1732645263694; Tue, 26 Nov 2024
 10:21:03 -0800 (PST)
Date: Tue, 26 Nov 2024 10:21:03 -0800
In-Reply-To: <20241126172834.78149-1-leocstone@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6746118f.050a0220.21d33d.001d.GAE@google.com>
From: syzbot <syzbot+82064afd8bd59070fc22@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, leocstone@gmail.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, yuchao0@huawei.com
X-Spam-Score: 1.9 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-by:
 syzbot+82064afd8bd59070fc22@syzkaller.appspotmail.com
 Tested-by: syzbot+82064afd8bd59070fc22@syzkaller.appspotmail.com 
 Content analysis details:   (1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.198 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.198 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
X-Headers-End: 1tG0BW-000751-Ci
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING in f2fs_rename2
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

Reported-by: syzbot+82064afd8bd59070fc22@syzkaller.appspotmail.com
Tested-by: syzbot+82064afd8bd59070fc22@syzkaller.appspotmail.com

Tested on:

commit:         7eef7e30 Merge tag 'for-6.13/dm-changes' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=172a0dc0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b5a5b40f7e7e7d63
dashboard link: https://syzkaller.appspot.com/bug?extid=82064afd8bd59070fc22
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14279530580000

Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
