Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBDF9021C7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jun 2024 14:42:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sGeM1-0006dQ-B7;
	Mon, 10 Jun 2024 12:42:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3rvRmZgkbAG0djkVLWWPcLaaTO.RZZRWPfdPcNZYePYe.NZX@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sGeLz-0006dJ-TR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jun 2024 12:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GpbMG2ETbMXj0gKo4wncWYWe1zxrquQJ0AP9UvXGvVE=; b=XxQuk2lQ/nv19Ph1mfRs0gLQpH
 zUbiRNUNZalJle0PHivIPgbwJDPayfgP75O22/Zah/SkT3NQxug3qhM5PJICntchY1+WyDbsoW9mN
 /q/lZpQxEJtsCHtPqB1z0sptAaBkbH/ynjIJ+7vquWLvF0vXe4lu5dj4yShX3F0h8xgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GpbMG2ETbMXj0gKo4wncWYWe1zxrquQJ0AP9UvXGvVE=; b=d
 lhpiwOPnlD5yVjwsX7VJXVM3qCtWx0S83xlYdWSh81sBrubTscWSU1zisaC79tu3132nmDHcQ8bE+
 BiMzzSGSrj+v190o0n0Rq/y1k0mx9Wsm5B9lM04UQIJa4OUTHZc+6cbMviDJDgfwLDMG/4LZejuXd
 hFwi2/3L0Z1o0eNs=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sGeM1-0008JE-7N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jun 2024 12:42:29 +0000
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-7ea8fc6bd4dso558133139f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Jun 2024 05:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718023343; x=1718628143;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GpbMG2ETbMXj0gKo4wncWYWe1zxrquQJ0AP9UvXGvVE=;
 b=JRekN1k56JsT21pnuart/3RnieEv7E5I2YHT2K1Vohd5SHi5Sc/ALmSAucUoU+dZCy
 e66dZhDlFRQFlVNVBv+AIu1tHRxlkK5RW6sPQCHd7PJP33uO3jqKpTTdJZQk5bb0wj/Z
 IDvlxrhwCXoCM2CZaWvdf7wgndsEeEmn8PhdMfyT4+JlkG8/tcd6CXhmCr/Ux6/fb2ax
 DqKjvUJoqpHRSV9p5RI6aVD1q9HsY1GZ2VED4jRi9H0pBo67mHM/eYuDcFvjFYRNcw7S
 C1pvfq9tHzYCyMciJPlIwrtUBRSNaxMOT92dpyT4xivhX5DG3oLyc1yaZCfqVg2N2+St
 6ZbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLHBe7EMk/Jqwe8HHXq5zplXbnuWOBzBjKJkwJq93JE9y/5tH15CwO1aEUBrfdgG4+lEEsN7Qm82UeMD/NKe2E68fnIJoel9lsDAXEG+4rOZ+KgfTnfQ==
X-Gm-Message-State: AOJu0YyC9S7GEFPyZiuNjEgws5JwaHMxi1HIna8YnYBVW/5xREXXL+X3
 M8RCJJOVfTnnl5LJF7qi5DXHaHLcfamsLNt1JDzjOvQo2W/2nJhcIYcIH7Ki7g0p7HpwyDsFlkc
 Knv5x+p61vg4NoU3nAx/4y4Tp+THp+KCXifPQlkUQw7VmPx8gS9rl9z8=
X-Google-Smtp-Source: AGHT+IE9eZkNwX3TDsRRc1uDgc5CwSX0gyxWB9reSsooOC4mXuId0I6CFMMKG2mOGqlr+pZ9+G2QcNCZskuvhBtFk3pxpcNNSNla
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6c0e:b0:7eb:8ba1:af5 with SMTP id
 ca18e2360f4ac-7eb8ba11289mr11869939f.1.1718023342383; Mon, 10 Jun 2024
 05:42:22 -0700 (PDT)
Date: Mon, 10 Jun 2024 05:42:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000009f2fc061a887b35@google.com>
From: syzbot <syzbot+listd51a233164f971537e0f@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 3 new
 issues were detected and 0 were fixed. In total, 7 issues are still open
 and 37 have been fixed so far. 
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
 for more information. [209.85.166.69 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.69 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.69 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sGeM1-0008JE-7N
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Jun 2024)
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

Hello f2fs maintainers/developers,

This is a 31-day syzbot report for the f2fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/f2fs

During the period, 3 new issues were detected and 0 were fixed.
In total, 7 issues are still open and 37 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 43      No    WARNING: locking bug in f2fs_getxattr
                  https://syzkaller.appspot.com/bug?extid=8f9e913ccc308e66c407
<2> 11      Yes   kernel BUG in f2fs_vm_page_mkwrite
                  https://syzkaller.appspot.com/bug?extid=f195123a45ad487ca66c
<3> 3       No    WARNING in f2fs_getxattr
                  https://syzkaller.appspot.com/bug?extid=3c58b51b764fa1f423b1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
