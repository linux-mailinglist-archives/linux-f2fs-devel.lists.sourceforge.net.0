Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE4E7F4447
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Nov 2023 11:49:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5kmm-0003HM-D4;
	Wed, 22 Nov 2023 10:48:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3A81dZQkbAEY067sittmzixxql.owwotm20mzkwv1mv1.kwu@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1r5kml-0003HF-1L for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 10:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KEa5dCxl6pESrXC5qpG46AnVrTQTNBV9WlYgIg05mbo=; b=lGtv/6DHGiCf7b20a4DD9MOG6R
 BqdtuJBdluVqHtcgcl2ZY+fxt0nfBjAGHc3JU63t09aQFQiBF8x2d3tafHJ7shFgxckxvR8n0qxV4
 FDWDQisQM5PV9GQqJ8uKto3dkvziAiFmCkniif8v+yJcGauhffW5fi31MmO31XYoXTWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KEa5dCxl6pESrXC5qpG46AnVrTQTNBV9WlYgIg05mbo=; b=G
 /4bq2Ugk+Zn7ANL8QDmYAG5VNqjV0rdJxuXYba58mCaS8yZvq7+R92/0QA75/3AFOH9I8bHyAV8Z+
 e00EHjwKWvuWbqNtRj/S+2Qz9bUBkQMRItdBUT58090QlOCf7dI8ltTSYyHAWbXcEBVqCP+KQKVJa
 q4YQmoYa6AyPDW0Q=;
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r5kmj-00077E-Pv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 10:48:46 +0000
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-5c1d1212631so9666841a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Nov 2023 02:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700650120; x=1701254920;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KEa5dCxl6pESrXC5qpG46AnVrTQTNBV9WlYgIg05mbo=;
 b=JQv4jX60sNo83pcanvAAEVroJlzDCpTGumqcx1sEIRHKNZa1J5ugSsi96D8cb7+s9D
 flJUPlIqsiUMCP4254/TfCH68HRkec8GvIAFh/BeYEUj1s/hiNcgX0J6BkPMleGIsNhs
 rUwGtXPxwJ909qihl+aWBddhKXJ42dPTvcGpxoMJcfMEnRo+16ndFb7bEVK5LNHJwgFi
 hwY7iD37v8sgEMq7+AeJIRsdFKdDKX9K5L9fxUYstAJry+HIo73nUwu4PHaaTqgwLML6
 VldiddPXDV35/Z7eIW4urVrJv0KGZrPEJAsrK8vf51E+x7ffe1EIac6mucEbRfhCXud1
 Vk3w==
X-Gm-Message-State: AOJu0YxlS8UlcmILhCOZ0YTqHufHwaN2KV8o552zoR5O3KpwfsymFymO
 lOH7/O7W+a7v+yBe//0ExkVmc1cvqq9qm+hwu5jBdql9FbK8
X-Google-Smtp-Source: AGHT+IHiOp2h/Vp6GVyBdvHa4oWfw2RVdXX2xB3H3tL+Q5mrUZQ0kkT4DyXhPAOMv8bKckGvHcqVRoMYSAEN/Qed+A6fRT64ShX9
MIME-Version: 1.0
X-Received: by 2002:a63:db17:0:b0:5bd:bcde:c677 with SMTP id
 e23-20020a63db17000000b005bdbcdec677mr341171pgg.2.1700646147844; Wed, 22 Nov
 2023 01:42:27 -0800 (PST)
Date: Wed, 22 Nov 2023 01:42:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000087f5e5060aba893e@google.com>
From: syzbot <syzbot+lista1e65ffd6781d1c11435@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 1 new
 issues were detected and 0 were fixed. In total, 4 issues are still open
 and 34 have been fixed so far. 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.199 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.199 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5kmj-00077E-Pv
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Nov 2023)
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

During the period, 1 new issues were detected and 0 were fixed.
In total, 4 issues are still open and 34 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 290     Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 86      Yes   INFO: task hung in f2fs_issue_checkpoint
                  https://syzkaller.appspot.com/bug?extid=8c1c6ffb39e290968f8d
<3> 10      Yes   kernel BUG in f2fs_evict_inode (2)
                  https://syzkaller.appspot.com/bug?extid=31e4659a3fe953aec2f4

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
