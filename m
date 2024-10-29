Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC789B3FB6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 02:24:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5ay2-0000FV-Nw;
	Tue, 29 Oct 2024 01:24:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3NTkgZwkbAGgYefQGRRKXGVVOJ.MUUMRKaYKXIUTZKTZ.IUS@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1t5ay1-0000FG-GA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 01:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pza8fv03chPqDNHxEx/n7Z2S/Tob43rTHTAsxVaziRY=; b=NT20epE/W2lo9S/vblwIu2p6M5
 E5nVijZKm41wC+++scnZf+azeinWxiAyEB30Rgm/8Ajqx0Y4/tz61KzxZ8TG5foprOaySImjZiYpg
 F7NU7lHF1IqL5iXAXtUdMZaXmz4W6trF5wRb1Ni0MhKrue7orxZ+oPjlqtfh+f2HRQB4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Pza8fv03chPqDNHxEx/n7Z2S/Tob43rTHTAsxVaziRY=; b=S
 Tyl8Je7BrUW4yQBTJKVHyu+0toYUoJdeGHgCai1SZUU+i/703kea4PGn70OwcU6Qc7Pv8Q+MtjueD
 qPvuh16UpY0k9cwEFSciTF+n4bXJ7gDUFXcsG0p+QjYYbPw54ZgYQsyQUX4T9Y/2a2MQEWj9xhYBI
 9VG2vigjuyVZ6IQA=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t5axz-0005L8-SQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 01:24:17 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3a4ed20b313so25506075ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 18:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730165045; x=1730769845;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pza8fv03chPqDNHxEx/n7Z2S/Tob43rTHTAsxVaziRY=;
 b=BdovCLjhamajde+lnP3WCy3hyOJoi6Dhxxnek/qtRHsZMAa8S4ZZceX9RfUTx5MgAY
 TZa4/cClJZ5/Nak4vFld79rUml3JUn2KFG1SsKk2GI9rvQxMddkxRV5vphtwy5iJgTwz
 6s5OEaP30gkUur+dl5NUdE8TRph2cMeeB1sw0AGPHTWvlspikAExM1hWhg+32Mxkph6L
 Q5eRov9W2exIDk7ufz9rJdpH5+tKbq0EgWRh0YoY5mixJOEsjfXLlJKlRhrP9pTFmP8z
 SN+sI4Gqs7r3vEx9vr2gLLgRC0QtaXDJH/rGTOlIeNN5Q8KDmGkW84J9jDfluT3MaDuU
 Qz6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA64+0kYIWq7QOPSjUOI2MoFt9ST5AzklDQ352QyeyQ//MLMTiuL03+sIN9iCJe4WSoNDyiwIJXZbkiW41FBR9@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy2nifIg0ZH4D7JThCZ9daq8XUpl/P0HnqXIUbBc1F0HY2TUBPd
 LHkirsIv79a1TeysvAC4TquAvcb7/Z9NKHNwqYFEwkB4Ed6kIU3LRyeY62+WWcZsYFVrNaZkYMI
 6a+KoKvCWJ0CynFvBNVz8S6478DmGnVhrmOjtyaIwmi5kZLdhXf/UALg=
X-Google-Smtp-Source: AGHT+IFk6HngVtguoegUK7h6Gm+3fic5/2LT7SUDrHG0y8JninBG223XyHaZkrHm6toBNOXKOf7JG48QwE9EaACMyyMqn6Yh7MC1
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc1:b0:3a3:c07e:e21b with SMTP id
 e9e14a558f8ab-3a4ed2649c2mr83060675ab.1.1730165045111; Mon, 28 Oct 2024
 18:24:05 -0700 (PDT)
Date: Mon, 28 Oct 2024 18:24:05 -0700
In-Reply-To: <89abba10-6924-47c2-ba53-93e2c44e2196@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67203935.050a0220.11b624.04b9.GAE@google.com>
From: syzbot <syzbot+7988d9999219aea9f2db@syzkaller.appspotmail.com>
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
 syzbot+7988d9999219aea9f2db@syzkaller.appspotmail.com
 Tested-by: syzbot+7988d9999219aea9f2db@syzkaller.appspotmail.com 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1t5axz-0005L8-SQ
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_evict_inode
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

Reported-by: syzbot+7988d9999219aea9f2db@syzkaller.appspotmail.com
Tested-by: syzbot+7988d9999219aea9f2db@syzkaller.appspotmail.com

Tested on:

commit:         a7d2e35e f2fs: fix to parse temperature correctly in f..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
console output: https://syzkaller.appspot.com/x/log.txt?x=15eb70e7980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfbd94c114a3d407
dashboard link: https://syzkaller.appspot.com/bug?extid=7988d9999219aea9f2db
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
