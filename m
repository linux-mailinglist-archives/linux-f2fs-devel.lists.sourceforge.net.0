Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A93AD9FCB80
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Dec 2024 16:02:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tQpNM-0001qd-II;
	Thu, 26 Dec 2024 15:02:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <37G9tZwkbAMM178tjuun0jyyrm.pxxpun31n0lxw2nw2.lxv@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tQpNK-0001qX-SW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Dec 2024 15:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3jg0AXb1agEeteMLZZrTmx+gq8ycGYHMAF8XRKY34JM=; b=ReH4XUOwpiaz5Unpj3mizsBfNg
 h8hKsSKYzKuAcDCmSflJhN9KNzFW5kurauuLuGLGS0rQUXo+wUIdTF6e70vzxJ04MMEWVOfI4yZXI
 y27iSG7jVli8J6DUw6gW96kEsFTO+fS8DIvIma1X2vN1aYVwEUu1uaoWIoYpLSlAPD5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3jg0AXb1agEeteMLZZrTmx+gq8ycGYHMAF8XRKY34JM=; b=Q
 VPti4G/bQE63GtokENecYJ+k7QC07k2TwAR9sSL09IDCz6Dw2DY0WGNWftoQk/xNB5QLsCROAkMil
 I3KDDgYpYLYs4FTJDKKFr+dmC/HLCdDYTXgN9tJJTnudkD6CvoyYl5WeBcidiSeuGSEJz/N5n1l79
 SSdb9eS02fHqbtMQ=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tQpNK-0003H2-9r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Dec 2024 15:02:10 +0000
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-844db0decffso578012539f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Dec 2024 07:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735225324; x=1735830124;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3jg0AXb1agEeteMLZZrTmx+gq8ycGYHMAF8XRKY34JM=;
 b=m9nk4JqPNM+NHGoJ8sXeCH4hUgmhFQwSOaiyl073v9uHFl5PCAtEsWuB6co7RN2Ivz
 qITrq3sVzz3or5FWMtBfXCvF9x7Y7pe/vNZmL4gahhWRhP8wQiRdDtr3o4F1jYL4g1V+
 1jb6QVVyd9MJ+wnWRTUCiK31spxQ0xZHnyDcPCoQE4W8l+qAcbr1Athxr/DrQxMsHZ/j
 HSexeoSiFW1VBtgNmqDKu3IcDFRdFEQKtCI+gGcL+Ah3TcfduOV3Ft+tgQn9Ewc+vf5D
 NrhHYojGzyxjwpP0gMPuSDe/CL1evFk33XJpPIuPU7pp/eosZ+9pWgQUjVm/L+VsZHWX
 06jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK/8v1owYG4cX0Re/9wMqqnskyFGQejryic+2oIDQHtOXZbaLFyL40sPbHPZvOxE4TrOaPL6XGPCzx/ZJXP06X@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywsaqj7Ba+HwIHLZAQ4bMwuAmSAPVDfhFwTzMwK0BiH8VD4uDrf
 ebhmOse9AoH9vxp0q+fNPHLdqD9bVbxamN1OYWG1gnmwVYhtoPssga+ODjlps2XjHbSvpJL3+Q/
 W9YwbZdz8IBKvXP+g8AK35Z6a1pEZg+fT2ZSr/LKZ5faTe6LqhtgDhO0=
X-Google-Smtp-Source: AGHT+IFz8MYCu7kPcgeMX1wNiJHs8wnteV3DY/so8G2prd2KrW5gQloihU4Ckv6Vd6IsDK+pO6k09QiU0K8utYVDU4RpKU9kno1l
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e06:b0:3a7:cff5:16d6 with SMTP id
 e9e14a558f8ab-3c2fe4458fbmr182717565ab.3.1735225324620; Thu, 26 Dec 2024
 07:02:04 -0800 (PST)
Date: Thu, 26 Dec 2024 07:02:04 -0800
In-Reply-To: <ff5f7b3f-8e93-46d0-b60a-b2f0fa370bd7@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676d6fec.050a0220.2f3838.046b.GAE@google.com>
From: syzbot <syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-by:
 syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com
 Tested-by: syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.69 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.69 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.69 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
X-Headers-End: 1tQpNK-0003H2-9r
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 read_inline_xattr
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

Reported-by: syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com
Tested-by: syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com

Tested on:

commit:         6f121821 f2fs: fix to avoid return invalid mtime from ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
console output: https://syzkaller.appspot.com/x/log.txt?x=12fbe2f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c852e3d1d7c1a6
dashboard link: https://syzkaller.appspot.com/bug?extid=69f5379a1717a0b982a1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
