Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA4CF25D0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 05 Jan 2026 09:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QqbQJyoROgXVYI6TYv1t2LT5cBOMum2J8fF9kk9m3VY=; b=bITMnJNHe4ZJZsF6tgZRpR7xOK
	IvQ3mHPBiWgnIgpnwB+ZS6nrMMYrao1r+HiYNma04zA8BPm7rTxhxi4/G3zh+hnGAWWxyoQofb58x
	sfuXczoC/NZILaHBmO4r2DABVU4C3SyjOvyk0xPcxD4gYg4liaDZzIHG4kibT8FDy/Hs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcfpI-0006ei-GA;
	Mon, 05 Jan 2026 08:20:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3QnRbaQkbAOkdjkVLWWPcLaaTO.RZZRWPfdPcNZYePYe.NZX@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vcfpG-0006dj-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 08:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bMExAptZ5CPCI27TfXQAsUvqUKJcdxrvNY1j8w2j91E=; b=kjTqxyB6l5nNK8w3p0vZz6gjCl
 eWHkqYK2zA75PVdLRabVBHmoO6+ZevMXjUOQFWI5OXP7Rmvm+oINWFi+rcYQDQ31vYB3WlYOXgR42
 Ot20WhMM4hw6CCphflnndkqsHRb2p1S/2y2cIsYWc5J/rbzCEGq9usVbO4kW2L/VS+7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bMExAptZ5CPCI27TfXQAsUvqUKJcdxrvNY1j8w2j91E=; b=a
 ACqxanIwp9yFL+cqhK/3MseMwZJRL9a8Kyh62EWlqbeijICu9eIn8+oHjjW9yfafjRMrLRxAMkdTU
 qO5KjbHBpLToTfBsx11Z+0I5qg3QgDrp63GHiyDdW16cbdFJQ8PS11UiB+WxsZ2jmhATAYxd69nBc
 0xb/qQV95RZOvyzo=;
Received: from mail-oo1-f72.google.com ([209.85.161.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vcfpE-0007w4-VC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 08:20:29 +0000
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-65b2cd67cceso27778530eaf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 Jan 2026 00:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767601218; x=1768206018;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bMExAptZ5CPCI27TfXQAsUvqUKJcdxrvNY1j8w2j91E=;
 b=u8wO7RBwajediRwrsGbYNCem2FsOXYKt9Bc3JcN842LqjF2KhPLpzL+hrVHdEgucJb
 6thjzP+VviTNPz7YDXtVDuynZWGiS1w9Q2XPc4PUpbFj9gqBXx1wOA6A2V6quC/WwI5I
 sCCc6xprSovAGKKwxqaaV/vqTsYsequCX1oaIIFZP25oq7QeuDXJIq9zTqi0KKlGw92h
 x21VwWwh/OHeMLsWO2O8D6yjEOLjKUZUZ2sIalH9oEU/xq4A/rttA7PJChD3PxS2BKe9
 J8JQMKRc3mAB+K9uwuu294yXB8T01YEy1vLUpxEMpH2aDB+pbgWTBlrxKXeWpfUoOM3j
 DlSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN8tRvk7JWy79BjIIEq63/BBKhHlFMP97Dph97Z4j6bkJ3xF4ptGnt8jEsObKmXkr9PPcTW1LCcJKPirUYGWQ9@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx3Bd+I7sVoQrUQQzbZ4QF0/Nw1xYwMorRBvU6UsAoBQTmcIrQt
 5ho/mVeP77FoAnq4/faX0kqdoPEJBnx7vPpDLXm5xR2moiuNMyvQdaGVU5UkXfbagjteqHU2Clu
 Br9Wsupqe40JzrExTk7gMd5nIzoN7zYqkCBw6btherzXfxgwhhYHuaCFn/6c=
X-Google-Smtp-Source: AGHT+IFXaST1uC3WD96NTyoYvkWSADcTTSKAzNGwIaNsz3qkUTwLUbENlJ54E2Jl7DSkONip4euxKdPS/aPZFlwhY94c0Pn2VKqB
MIME-Version: 1.0
X-Received: by 2002:a4a:ea91:0:b0:65e:f5db:f478 with SMTP id
 006d021491bc7-65ef5dc0810mr6433357eaf.22.1767601218371; Mon, 05 Jan 2026
 00:20:18 -0800 (PST)
Date: Mon, 05 Jan 2026 00:20:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <695b7442.050a0220.1c9965.0025.GAE@google.com>
From: syzbot <syzbot+list884476540f5c2dd44b51@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 2 new
 issues were detected and 0 were fixed. In total, 9 issues are still open
 and 72 have already been fixed. 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.72 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vcfpE-0007w4-VC
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Jan 2026)
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

During the period, 2 new issues were detected and 0 were fixed.
In total, 9 issues are still open and 72 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1435    Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<2> 1345    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<3> 205     Yes   INFO: task hung in f2fs_issue_checkpoint (2)
                  https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a
<4> 1       No    kernel BUG in f2fs_put_super (4)
                  https://syzkaller.appspot.com/bug?extid=c0a575209250b34549be

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
