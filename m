Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8453B8D76C0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  2 Jun 2024 17:30:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sDnA1-0003ks-Jf;
	Sun, 02 Jun 2024 15:30:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3-49cZgkbAMY4ABwmxxq3m11up.s00sxq64q3o0z5qz5.o0y@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sDn9t-0003kf-0G for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Jun 2024 15:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WOcPbj2g/KS87dFDOfGs2GB8jKiVY1KgyNHsqEeYjUo=; b=E4a1zgIrWwrv9Od4PAMbciW2/i
 4CKY5AN6m4kw2t5SdIuN4hFlaNGZNAXGk7OJDu7B9KRi6kx4Okxs+bIVqoyQI1p1/CvsmjnP6zCkM
 iMulUsH28CDKmthF9GA2w5fnUevAB/1E+uJzRArmwFkbj5ScyhsDiftM0UVezmFryzRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WOcPbj2g/KS87dFDOfGs2GB8jKiVY1KgyNHsqEeYjUo=; b=b
 JB+TaFXHlBm0+rtif+U6FM2s+h9RNBq6I4IpPc0HjRoa+KfyyLqA42xe2mmkev5MnPJBop2axzD8E
 tA8Oqyfyc91yN7whAwTBw1NvgIi4iE1ZEvb4pXG+aFC3FdNnDyU+O9JEhPIw7qQMpqBIiXAeEaU9P
 F9tt2S6bOrY19jBU=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sDn9t-0005Om-He for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Jun 2024 15:30:09 +0000
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-37485947af7so31617625ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 02 Jun 2024 08:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717342203; x=1717947003;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WOcPbj2g/KS87dFDOfGs2GB8jKiVY1KgyNHsqEeYjUo=;
 b=ayiMABp3Ui5ALY+rxWPhJucxedtN+DzBuyUSaQ7or4iLD6Hyzk8Cgv42STHvep5h36
 LzWr/1j6ZNSGdUcR/Loioyi6sR9w2ldJZXAoygkzjJ+bBppdZBjnjOS9k5Pfd9cVNkAy
 7ZRua8gx2I02/4Kb1kCESytLyjVPGlEFwE6snD6UoXUdkjQiIan8vJ0dIQalD/AALLSt
 3cGhso3joV0e2aVBnykIGIjLoL9m1C/svlddx1jmvKp4s4461PA/XgmHJ9h3Zaubw3XM
 b7wgalWYR8n7U2DtZZrECHBqMr/HAQqD1zb5UptAO8eaIPFWW1RIJNrCYUBDgizGO8/j
 J6UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBue9hkfE+mIw4Islp5/bL4z6BpUK6bvO5hCb1U4i1K294E2/J8PJmEmOL7kc2lNqFZtiCy7jWD3jRHxVJOtLQ7arqxk4XXyQ22EOBlF/LGW+vSbQNkQ==
X-Gm-Message-State: AOJu0Yya+Wo2YQkER7JX3r5EETWc7QrL3xoYMlf7jNy+wQuEmz34w/Nc
 pLZTrDx7xKy/lMoyFvQiH3o8SSYcgDaRPRd0BQysySnHvQrESg0bJlVEATwQyvpJCpd3zP2k7ln
 p/8voOP55demPSqt9gJwYQ2yDn8Bg+tU7glWhIiFcdpfx0zG4NK0NDNg=
X-Google-Smtp-Source: AGHT+IGNFH7WpmuoUYSt/vcWg8NsJsKafOrSf7a1UACgOj50zR9yRqd2W1/qedHtJ+vKZZZEe4RSkLMEFw7wLpooTeo7dpAzNEBM
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d9d:b0:374:9c67:1dea with SMTP id
 e9e14a558f8ab-3749c6721a2mr1304405ab.5.1717342203107; Sun, 02 Jun 2024
 08:30:03 -0700 (PDT)
Date: Sun, 02 Jun 2024 08:30:03 -0700
In-Reply-To: <e2e23c33-b318-472b-a9af-3ed787149b2d@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f971fe0619e9e3f3@google.com>
From: syzbot <syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-and-tested-by:
 syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.166.200 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.200 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sDn9t-0005Om-He
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_write_inline_data
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

Reported-and-tested-by: syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com

Tested on:

commit:         9c84cdc8 f2fs: fix return value of f2fs_convert_inline..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
console output: https://syzkaller.appspot.com/x/log.txt?x=15e10032980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=48a63c58ee55467e
dashboard link: https://syzkaller.appspot.com/bug?extid=848062ba19c8782ca5c8
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
