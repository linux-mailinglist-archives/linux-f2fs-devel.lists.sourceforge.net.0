Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A2D4A7DE4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Feb 2022 03:23:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFRmJ-0003wH-GQ; Thu, 03 Feb 2022 02:23:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <3izz7YQkbAAg067sittmzixxql.owwotm20mzkwv1mv1.kwu@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1nFRmH-0003wB-SJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 02:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iWXNcqjV+9WEs5XX+yhW5rJvRY74SPW4WH9BDVS3ajc=; b=akXdYAOtb+qSvtxihvjWt3kvVi
 KZXIjV+ML0Ao1eLcLsC6ZDcEkm03bc2m0XrLjhAw2fTh+UQ3tKrs755LenuyYqlqkmkGgY6A1GKLM
 LVTBimeRqA1uGM1y8CelNZEyRwIGSxL3cou3aJkdof3Zbpv99Q8BX1ImDH+xg8vH1tBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iWXNcqjV+9WEs5XX+yhW5rJvRY74SPW4WH9BDVS3ajc=; b=J
 nNnirvLgAnW5P2XySQ+1VB8US5ZMd4/Ze/IR0xGqD7fhuzuSKkSXtbjrRtal/MGaiEkR1tPRppevF
 Wq7Rfe/OZP8GoTBe2XFheDD6WdAt1mYgZgtrbq8BCwxkwCu/dZ8RMI1ZTBEpXuAhz1fxqxspToJKs
 /3moaxTLNqov2Czc=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nFRmC-00EFKt-Ru
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 02:23:16 +0000
Received: by mail-il1-f199.google.com with SMTP id
 m3-20020a056e02158300b002b6e3d1f97cso760452ilu.19
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Feb 2022 18:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=iWXNcqjV+9WEs5XX+yhW5rJvRY74SPW4WH9BDVS3ajc=;
 b=f8z8/XBdWVSq+02gAoih8Z4UHTlEOMSTAf9C6KkSTuUXGoo7iKMcqiQBVsKwifOlsm
 74KeDJn/g1vGBoVFmVlKZm68/FkJI3jUd3yJv0bg2AKdet/pO0yEjBjmt1zJWuif69+Z
 i6pJt0CsqRIUQNN3UMHcIbkXur0R0ht7SoS5LSblOiFUe7Z5b1E7/VY5gsCi1EEy5DAq
 d0ObcFPUjyAEXLESYiRUAkTUW3om9kS90QKoA2EHASH83WZVrO2RZqsKNkFoIY/eRiAJ
 ClPug/xL9Bt3LHfT2a1SOOAqrgQnnxS5YnFpGmx1Xdgtaps2TWSlfNGtd5xrYkf3q//k
 fg8w==
X-Gm-Message-State: AOAM5331YedvtSfsq3DAROhqxWcy5XG9eGr63mc7aRk8xouXhphsQ633
 GdsOWKrK/WElBEvepc5CV00nVeW9vrws88FlHdYwawxGGXrq
X-Google-Smtp-Source: ABdhPJxmD986HllkBDWd17NvypWwYJvhmSpWp2Dm6GbGriKJ6SNo3PTO5JIteeKeiumH9TUjTtJ5uoY1D4vEC9YouQ6xLo+QnkvO
MIME-Version: 1.0
X-Received: by 2002:a02:6d11:: with SMTP id m17mr16852812jac.317.1643854987198; 
 Wed, 02 Feb 2022 18:23:07 -0800 (PST)
Date: Wed, 02 Feb 2022 18:23:07 -0800
In-Reply-To: <0000000000004cede805d58728c3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009303f605d713d014@google.com>
From: syzbot <syzbot+0b9cadf5fc45a98a5083@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, timmurray@google.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot has bisected this issue to: commit
 e4544b63a7ee49e7fbebf35ece0a6acd3b9617ae
 Author: Tim Murray <timmurray@google.com> Date: Fri Jan 7 20:48:44 2022 +0000
 f2fs: move f2fs to use reader-unfair rwsems 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nFRmC-00EFKt-Ru
Subject: Re: [f2fs-dev] [syzbot] possible deadlock in f2fs_write_checkpoint
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

commit e4544b63a7ee49e7fbebf35ece0a6acd3b9617ae
Author: Tim Murray <timmurray@google.com>
Date:   Fri Jan 7 20:48:44 2022 +0000

    f2fs: move f2fs to use reader-unfair rwsems

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=108e6078700000
start commit:   6abab1b81b65 Add linux-next specific files for 20220202
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=128e6078700000
console output: https://syzkaller.appspot.com/x/log.txt?x=148e6078700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b8d8750556896349
dashboard link: https://syzkaller.appspot.com/bug?extid=0b9cadf5fc45a98a5083
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12de9cb8700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11953798700000

Reported-by: syzbot+0b9cadf5fc45a98a5083@syzkaller.appspotmail.com
Fixes: e4544b63a7ee ("f2fs: move f2fs to use reader-unfair rwsems")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
