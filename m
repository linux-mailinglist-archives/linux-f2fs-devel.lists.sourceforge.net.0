Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C75A65DCF1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 20:38:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pD9am-0002Gh-V8;
	Wed, 04 Jan 2023 19:38:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3rNW1YwkbAFMDJK5v66zCvAA3y.19916zFDzCx98Ez8E.x97@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pD9al-0002Gb-SS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 19:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4klnHWgFntXJFe1mNy3ktVGZOT5lIaQUJZBRl6du9As=; b=XDpFZ7M+UL71TKdNWgW3uom4Ca
 OHvbVwKn4xJPajneCTUUFa1OCnB9Zcruz8bR7GGfELDqfCWmnFYfTVzkFjmb/bOZVouX5QI2G8jxe
 xLBxmFI2MQrJxjCv7NU/Bv6p9xbJe1YN/VHUchckm1K2P2Q23AZrtQzZTziB+V1sfK3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4klnHWgFntXJFe1mNy3ktVGZOT5lIaQUJZBRl6du9As=; b=F
 bDPkjJ4Qy4NczCdERN/UrU0QzlcxJr7Fh7Foj0M7Xa4kWEv9tyKUnJbSxd8+6teSj6YvtSHNNJ95w
 +0Lp/j/r/8ZpZ8hvJsU9nlsYULBpWGfrFiNQ5E36aMZgOUNPnSw8EWmcae/mFfNdWLbRBJijl05dD
 MrbC+dzVgp5Zd5Ws=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pD9aj-004x3l-NQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 19:38:27 +0000
Received: by mail-io1-f72.google.com with SMTP id
 be25-20020a056602379900b006f166af94d6so10001684iob.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 11:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4klnHWgFntXJFe1mNy3ktVGZOT5lIaQUJZBRl6du9As=;
 b=SQ/InBEaNSQn8HS2sVyI0he/S8hPZnAkqWksqfxhj7eqzrqd1lKwsoxCy4q8x1DVdP
 PPInP07nMA+IE3wbuYDbElbNBPstwCa0qDGnrwRSjf0bKFk+mrCYyKFhuvymfR2trwJj
 UA1ubFukjlw/T/GVhbraMEaTh3Pd4Kon/HthHNBM3tKGnInTHRZSZbLSjrA1uZoACC9Z
 5vze9YFl6Y7rWhwG0ysdOJF4UKCd7cyBFB3QXaJUavfcWWjKnauSBDfxE/f+XAdka8mO
 rWasHB4AuNdXBYos/cmAlOMkfk0YYMEmQVkcrvkT0HT1QMPoSsR06T/Xiz9yHGTUcO0c
 U4bw==
X-Gm-Message-State: AFqh2kpWXcyEf/fB9EZtOhK9z0pULpDTIip03xPSWe4Jfb/MCZa+PiRD
 k/+GPQZ9J0l27rChkUBVCvOegD0lK7Bi7rICW/Z+EcQPSCK4
X-Google-Smtp-Source: AMrXdXvyG+VLSqREN5kVIlZt67ykVaVDAsb4CMVjysJYq7UJqNBRTeukgJg3xjw94TDfvueU6efvADxCWW38A/y0GwmGafcXTngs
MIME-Version: 1.0
X-Received: by 2002:a5d:9c0a:0:b0:6a1:2c0c:6084 with SMTP id
 10-20020a5d9c0a000000b006a12c0c6084mr2993349ioe.128.1672861100139; Wed, 04
 Jan 2023 11:38:20 -0800 (PST)
Date: Wed, 04 Jan 2023 11:38:20 -0800
In-Reply-To: <00000000000099fc4705f1192c71@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a1ed5905f1755333@google.com>
From: syzbot <syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com>
To: chao@kernel.org, daehojeong@google.com, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 mingo@redhat.com, rostedt@goodmis.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot has bisected this issue to: commit
 3db1de0e582c358dd013f3703cd55b5fe4076436
 Author: Daeho Jeong <daehojeong@google.com> Date: Thu Apr 28 18:18:09 2022
 +0000 f2fs: change the current atomic write way 
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
X-Headers-End: 1pD9aj-004x3l-NQ
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: use-after-free Read in
 __update_extent_tree_range
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

commit 3db1de0e582c358dd013f3703cd55b5fe4076436
Author: Daeho Jeong <daehojeong@google.com>
Date:   Thu Apr 28 18:18:09 2022 +0000

    f2fs: change the current atomic write way

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15c77d38480000
start commit:   1b929c02afd3 Linux 6.2-rc1
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17c77d38480000
console output: https://syzkaller.appspot.com/x/log.txt?x=13c77d38480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2651619a26b4d687
dashboard link: https://syzkaller.appspot.com/bug?extid=823000d23b3400619f7c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12597238480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11ae9d7f880000

Reported-by: syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
