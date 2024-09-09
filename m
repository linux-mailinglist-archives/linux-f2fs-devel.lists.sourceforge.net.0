Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA41971C6F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2024 16:25:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snfKI-0005vH-OG;
	Mon, 09 Sep 2024 14:25:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3PgXfZgkbAAMv12ndoohudsslg.jrrjohxvhufrqwhqw.frp@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1snfKG-0005v8-EW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 14:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Adq+B5GBvNNmL/xte6nmG1r6wi3JHJom46G+XwMIsPI=; b=WThPCZY1lmv79upKqRhjVy7CxU
 SWGbKxESXEYMfANFzcxwCPkQxqVnCIJ7ZEz4BvRu2GtjVTtfRWrPgxZm5tUuES8JItZfNeitaHWGm
 t5TMIxZ4+tE/coc5vVF+zqVc8vUViUQiZogisqswO5kC5xJPiUKjAxx/ZOkv1i7kWQQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Adq+B5GBvNNmL/xte6nmG1r6wi3JHJom46G+XwMIsPI=; b=D
 WgUJYpqxZf0qlKozYgEm0rs5V7hnIiKJQcTh9qpm+FsCEK+uRjiX2LCnXuPC5/BQdLJRbsUvud7wD
 11uu6gnzvkknKBY5tFQ18spnD+UYeQJvgTfY7I7I6iUCUgrBLmquK6mE//pUCF5gfYCE8CHe6B1Ot
 elOKgpf8Hhd5T+Ck=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1snfKG-0003dy-J1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 14:25:09 +0000
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3a04af50632so80474895ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Sep 2024 07:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725891903; x=1726496703;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Adq+B5GBvNNmL/xte6nmG1r6wi3JHJom46G+XwMIsPI=;
 b=dX8N7tZbqX78N4svQNopP/4r5vvnD5pYG/z/jLlOfIxsYAjGJt/RJGRCbDCo3MQDv4
 kWxMYyaFSmzcdrIlAJZHP2I9yL8a+WsjdCuq7OahSbrscD4ovNkpUeBoQ/wIJHiQcAcn
 oi92k6RjDjLLDE1wzJZwi7mTb94YMA0XHLVvt3PNok44gfeaaMhhISQ0Cqd4LIvmtwfZ
 O+zBjZxJXr+XOymli2updHgzm19TvXnU33FqPvTpJZiVvgkjKsKq4CCdX1VfMBltafq+
 BrWwz7LQfpGprJz5tXllXEbbdYs0LXLPD6VUqchvQd+/vl3xF/50wpdrNF1A8/nzcKB4
 6m3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz+DFxn3ACBv7OWWPbeK8Ru//9X9yyar/ZTLA6xsyxyalJCqzIAYu8u7JmlCIbcssfinT88okTgKStLlKgMs1a@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzQM7jbQxiFyBqaAGUO70kmw7TO1Ng1GEFfBVojdAnGHVVTSKmq
 rWGDCOQ5KKYXRfecpRgy9S5NFB7nFjK0RpdnSCl/2yffVW9mhEVUQyaBeaA7rYCcqRdgI3oVyXS
 ugua+Obn9z3ZuFZt0W3XZc+MtVeTl6P3mLjpd0J1BJW2LmXofl4B3STQ=
X-Google-Smtp-Source: AGHT+IHfZIhEnbX3RzUpft5NHwORi99VAh1cCynOj9QNOSAuXc21YCe2a6kjv4CNUI+U7ggDvCfzoucCexLNpTC/oMIieJ0MbyZN
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2141:b0:39b:3b8f:d181 with SMTP id
 e9e14a558f8ab-3a04f0cb52dmr132176995ab.16.1725891902626; Mon, 09 Sep 2024
 07:25:02 -0700 (PDT)
Date: Mon, 09 Sep 2024 07:25:02 -0700
In-Reply-To: <2f736900-9642-4824-9e41-e304c250857a@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c6f1ba0621b085a1@google.com>
From: syzbot <syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com>
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
 syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com
 Tested-by: syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
X-Headers-End: 1snfKG-0003dy-J1
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in new_curseg
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

Reported-by: syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com
Tested-by: syzbot+341e5f32ebafbb46b81c@syzkaller.appspotmail.com

Tested on:

commit:         1d2fe825 f2fs: fix to don't panic system for no free s..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
console output: https://syzkaller.appspot.com/x/log.txt?x=1447849f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9388102cde845084
dashboard link: https://syzkaller.appspot.com/bug?extid=341e5f32ebafbb46b81c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
