Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC959FA833
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Dec 2024 21:55:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPSyl-00015K-BG;
	Sun, 22 Dec 2024 20:55:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3pnxoZwkbAIMz56rhsslyhwwpk.nvvnsl1zlyjvu0lu0.jvt@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tPSyi-00015B-Sa for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Dec 2024 20:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jJmyZmeU5+Bfpj3sDePqTla+F3u8A3MC28TfYWtar3o=; b=i1SawwlmXwO3qGx0wLY9mzRdGt
 nHxled6xmTu1r65BhOLmI7y1GUKPzv77IGidjDC0MSCIrpu/L6tq6KarwYaHd4ES4cuClA6BikHYk
 EYM+57HQgpyQAHPHcMMHMkXdsC9ssmsE+oLvkChdM/n+pAftWighUQVm5YL6wziWVr7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jJmyZmeU5+Bfpj3sDePqTla+F3u8A3MC28TfYWtar3o=; b=l
 Fa5mOgNEMmQJRasfIIxVRv/DU4UPCKh5PYg1hpKUiNabviKZgkr0jP8o6wYoMNSZx7/VFZIOMlI3p
 /Mn7MGiA7ZzAzJgoCGsDmCg+Xsdglr/qzLp4RR2zoDAy90sC0rp9pB4sPTC/lDksGB9RLB5cXMvFw
 Cvg3D/HBGRgVeU9I=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tPSyh-0002ZF-US for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Dec 2024 20:55:09 +0000
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3a814406be9so68684915ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 Dec 2024 12:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734900902; x=1735505702;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jJmyZmeU5+Bfpj3sDePqTla+F3u8A3MC28TfYWtar3o=;
 b=fXxZJl02NXK3Vb2EOyKjCCeeTnwvxH05J7m+AnXjuXjf63c7KJz4DEWNCFDyon/WCX
 RcydJy0B9Xy0z4+xOlMlcH3Qi5JUC2nuV6dEZ9EBU4YapzSBzKDrnqPUnX6AQdvMlYPO
 KNeo5A6js6bHOFGRxV6w8rY9OGLcbVuZRFMN/C/7Peatk6qiDwoflAiCHHJqp0xb8VkD
 Wiw50gDyu3fK83JMhs2WfX7qXGL01aAk3GXe7rl63bHqRzUUidVxqbHqjvcZ8Dr0vl4q
 +xPHVkIW9KQGKr1MgK+Isgn7IeijOQYvw1PrOx9l05tBpt+XfLa1EFw7Hot03eEScwAS
 npXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDesrh/ia39NL8Iva+euLm2yuPJ4CeOib6pKGAAKGnPEHI8TTVYaoc+cQkMBNxAQzMuYcnIXc77QKRUKYuEXY/@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxIDXqbkElWaf3cyd3FfVtyMzPZ5O483QVWrCOujQUR7Mf81kgX
 jvBWwhhlb3RsoFU+EctxwoE7UvKkx+VdTCC+9cp0eepAx+Mq8RXfcOX5u9VPC5VlMUCbKK63As4
 523WaqaQqADq4zX5LpzLwBkxomcTppixXMh2CU7Wa+40Cn1wAE0vX6VI=
X-Google-Smtp-Source: AGHT+IHd57CnN/8lTopgrCRHQjD7ctjp9Ok8oHrRvT+xx/9MfnaWQnf9FAfD7P41FZOZolmdsXf1bRfkXMmOn3k23GYr+PcZNf3c
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d0d:b0:3a7:9347:544c with SMTP id
 e9e14a558f8ab-3c2d1b9b8f5mr90032555ab.5.1734900902216; Sun, 22 Dec 2024
 12:55:02 -0800 (PST)
Date: Sun, 22 Dec 2024 12:55:02 -0800
In-Reply-To: <3768d492-8de1-4165-948c-192054ff051b@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67687ca6.050a0220.2f3838.000b.GAE@google.com>
From: syzbot <syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-by:
 syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com
 Tested-by: syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.199 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.199 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
X-Headers-End: 1tPSyh-0002ZF-US
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 inline_xattr_addr
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

Reported-by: syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com
Tested-by: syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com

Tested on:

commit:         a108daa4 f2fs: fix to avoid out-of-bounds access in f2..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
console output: https://syzkaller.appspot.com/x/log.txt?x=17ef98c4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd60186d08e947a5
dashboard link: https://syzkaller.appspot.com/bug?extid=e4876215632c2d23b481
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
