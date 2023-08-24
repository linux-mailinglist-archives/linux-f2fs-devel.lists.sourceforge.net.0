Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8DE7874AB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Aug 2023 17:55:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZCgO-0006h2-DU;
	Thu, 24 Aug 2023 15:55:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3dX3nZAkbADwqwxiYjjcpYnngb.emmejcsqcpamlrclr.amk@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qZCgN-0006gw-Ba for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Aug 2023 15:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+aXdP1B+FgxdGCzykCKzGTnnvyJ+Lx6s4rg1obN7Qbk=; b=KDTDEw0Y5s4f78T6hxb7wUYCb9
 PWzS6ES/RSyFV5A8tzB4JnAgoxedTjj+AG8YopF9NPJm7JPmXawDeBwC5KmB74NKeoqsyV1bu6frf
 A3lLeIFr4nxaoUJHhHGdy03/VjgO+uxzKI6jaEZYIlaRt3ppWU+5gG6XcEEoAaWlIgeY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+aXdP1B+FgxdGCzykCKzGTnnvyJ+Lx6s4rg1obN7Qbk=; b=b
 s/jNiK7/MDVUqE7njRm2Jz6GcSmNqWahLGjDWy08HAoYGBqFIrR0ObxsajfH5j1cuKDO7zUo7jdDc
 ovFGo38/sj10ziOxm6onA8GoeI7eBKbnAfg2cYlCvmXqkyLw6KNqtFYKo0OgttFYOfxbHFBhEMVzf
 Ke9zObZjyyrdHLqk=;
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZCgN-0003hB-3Z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Aug 2023 15:55:39 +0000
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1bf75ca4e4fso834375ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Aug 2023 08:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692892533; x=1693497333;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+aXdP1B+FgxdGCzykCKzGTnnvyJ+Lx6s4rg1obN7Qbk=;
 b=fyj4POEw/IhlS999iNPFwJKi+ySr8wpEgXWchKLM78cin35VbPa2kPnpOBOh8ElO7v
 8JgLdj0cjh+oGbxA9Hgns+UELNpGm9KJvXJ3tU30znOlwQoY/67gkJJNqrtbEAQ+kneM
 XACUNDc7jXEn5GfWPeNdAbYFmYAXNEm7LD/31PurPExlopg38FNrbuapaVWsyfV/QWcq
 byoQX9OnaTkLXK06TGNLTtZvOKuCOkVKop6bgLigks6n2ObbElfrLwBProDmZ+St2AXW
 Rg+ZohWzmHavlIlgaPet68+vvPOHcPZez8MsCzhd0R2j0yvWaC8XjiqraNL2r/iRxWG3
 sO7w==
X-Gm-Message-State: AOJu0YzDn9js1NjAQkRpeKfYTBr04bSRF2HfT/iRFVgTbafhJI0AqD4H
 9H/E1TVUd3mB/dF42bhBnm0tEsbmdO9zDNlvfS/AENfbdeXM
X-Google-Smtp-Source: AGHT+IGlMDpByqwKN1nPkwOZ6cneGx5U8uHqYAq4mzi8Dm1fiSg/5r5iCD6/x3lo/kY24VLtNZrGpmu0TbdY75CrMu5ucsZiquhn
MIME-Version: 1.0
X-Received: by 2002:a17:902:f551:b0:1bc:e37:aa5c with SMTP id
 h17-20020a170902f55100b001bc0e37aa5cmr6759816plf.1.1692892533578; Thu, 24 Aug
 2023 08:55:33 -0700 (PDT)
Date: Thu, 24 Aug 2023 08:55:33 -0700
In-Reply-To: <0000000000000f188605ffdd9cf8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001b658e0603ad424d@google.com>
From: syzbot <syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com>
To: chao@kernel.org, hdanton@sina.com, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot has bisected this issue to: commit
 5eda1ad1aaffdfebdecf7a164e586060a210f74f
 Author: Jaegeuk Kim <jaegeuk@kernel.org> Date: Wed Jun 28 08:00:56 2023 +0000
 f2fs: fix deadlock in i_xattr_sem and inode page lock 
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.197 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.197 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qZCgN-0003hB-3Z
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_add_inline_entry
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

commit 5eda1ad1aaffdfebdecf7a164e586060a210f74f
Author: Jaegeuk Kim <jaegeuk@kernel.org>
Date:   Wed Jun 28 08:00:56 2023 +0000

    f2fs: fix deadlock in i_xattr_sem and inode page lock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=167691b7a80000
start commit:   cacc6e22932f tpm: Add a helper for checking hwrng enabled
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=157691b7a80000
console output: https://syzkaller.appspot.com/x/log.txt?x=117691b7a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=171b698bc2e613cf
dashboard link: https://syzkaller.appspot.com/bug?extid=a4976ce949df66b1ddf1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103c6bb3a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17bb51c7a80000

Reported-by: syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com
Fixes: 5eda1ad1aaff ("f2fs: fix deadlock in i_xattr_sem and inode page lock")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
