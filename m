Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC559787D50
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 03:47:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZLvF-0004cW-Gr;
	Fri, 25 Aug 2023 01:47:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3MgjoZAkbABE9FG1r22v8r66zu.x55x2vB9v8t54Av4A.t53@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qZLvE-0004cQ-ND for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 01:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yL3CxA8tkredETolFyabWDYx09slvthywe8GQXa4Z3o=; b=JCnZL7Xsxnl7VNDkcBHaz2idGM
 pZff62ocaw6huyJ0N2YnVdHOTW+dM3L9FCNSSv5uV+n49sZdBF92lJIoN1hJf1ev40/KhbAM7iRf4
 Om+ciz+qk/QTzydPt6nRS6ywiEYJU53ie0YlEVyGJnLiEeDdoEpSJamNUYXgu6+Ec224=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yL3CxA8tkredETolFyabWDYx09slvthywe8GQXa4Z3o=; b=n
 QRRhQFhrZroa3qpg/vYUXq9oZkd65gmJf+kovPa4rJZb+qtjcuUSzMQbjAWyZMaHI0U3YuOM4GuYi
 1Lh23qWi0CDTaYcXfpr+y3cFtUX7aYxJS3UMJWxA1ftutbEcBsuWOKHdx7pjCDAasw+HBCUQ/r4xO
 Z8SgB65N5finMj6o=;
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZLvE-00En3e-G5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 01:47:37 +0000
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-68beecae979so530541b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Aug 2023 18:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692928051; x=1693532851;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yL3CxA8tkredETolFyabWDYx09slvthywe8GQXa4Z3o=;
 b=FiqAZVlJIsgSTtWk68zIky78UccYZYIv0gTglaUMzKEbB64uJFNwX5i/nrRO7kLK46
 XOlX58kWpBB2YJuED3Q6hW4yzVQLS4BsBzEXSg3DRL8F1pid7NykutJrWP6FEnelK7/S
 j1BREHD4jk7jE+ZpG7xzjW22Jp2jkfVBjcH8l2tT55NMFAUBf98Y8kpDYr4Y+FfiZvQe
 pVklyVzLuy3gwzWpm0rdQqa1qsxPvAZauH1RlFI+YbwpZfUhFNyO0Dp3PtlBI9Z+tmOl
 4/uCZq7q9RSMYixqLUv+KAzFpRXhWe76qPL6CzxHMxs7BJGmdiR/y77GRYDGuqqkd+Cv
 LGtQ==
X-Gm-Message-State: AOJu0Yzg6muFjr/kR8s1mCEKjXuSrCueE+FTul0L/u9NzBn+CMFJit6e
 pXMx4g+C/v5P8ru5e17oKPsDhgryDVWEe3xLHlpDEKL1tn9F
X-Google-Smtp-Source: AGHT+IHg3bDM5yKFOpPTzd7kkvqQoXbDuznp//mZjuaO1aV0GJPmJQ+Bx0uMRcAb34HUuxUo0oZ6iIfylc09D1Op6ph0vpyQHdTX
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:14c1:b0:68c:585:905e with SMTP id
 w1-20020a056a0014c100b0068c0585905emr205773pfu.3.1692928050960; Thu, 24 Aug
 2023 18:47:30 -0700 (PDT)
Date: Thu, 24 Aug 2023 18:47:30 -0700
In-Reply-To: <8680b259-528b-32a9-73ee-ce6a6406f13d@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001ba17a0603b5871e@google.com>
From: syzbot <syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com>
To: chao@kernel.org, hdanton@sina.com, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-and-tested-by:
 syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.198 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.198 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qZLvE-00En3e-G5
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com

Tested on:

commit:         5c13e238 f2fs: avoid false alarm of circular locking
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev
console output: https://syzkaller.appspot.com/x/log.txt?x=121bdfcfa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ff9844b1e911216
dashboard link: https://syzkaller.appspot.com/bug?extid=a4976ce949df66b1ddf1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
