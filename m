Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB35AC639B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 May 2025 10:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=J2tx8ws3+8zXqnMWT2pK1Ew/dDOl+hSVCRAWQ+p7WwM=; b=VVIAjQ8YI4mZBT0/K3SDXQZjpG
	ucgCbi2eI/EH1RUk59nKCNecBW4DaOpCTSx5bx/wEkOx2sLmFviI7K+Xk3RKmAexcCGVme98KAkwh
	vCnNMm5VKGN5o4NnQreg4xm/bYdRd0hq8XtUV9FNa1HvzM7w8brvn6mhy/aAAUmPsCBs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKBlm-0001oe-IF;
	Wed, 28 May 2025 08:04:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3ccM2aAkbABwKQRC2DD6J2HHA5.8GG8D6MK6J4GFL6FL.4GE@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uKBll-0001oW-Ab for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 08:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MWDhC9r9oehNAeAGxW4ZZpblr+pALrjlJXaJu5GfEiI=; b=D0u6Ll56TkFoR2V59lETYDUr+T
 1Bo5Np9HhQ6K+MvCc/sg6H3ED/EsCBiA4rxEVBFnFkYt1Gu45Ns57hNWCFOhajrNHJJYpTTNVDBzV
 65A7fhamaTicN/vWAMKnCh+/QZLIDFYr0b/o/wPhI1fHmzd5o7bFydnvy+j2MUOSPro4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MWDhC9r9oehNAeAGxW4ZZpblr+pALrjlJXaJu5GfEiI=; b=i
 w1dJFasPvbXtOGx3g7WSRuhKUgUHJgnD5FUHPmRFtu0xDKUR/2CgBSwFmmS73sPYfAYhGuJE1voud
 vB/g/BEQIcb5eDXF3crrolNG8fdy9WzdO0q6cPAaTwK8r4BacHbyEDmhkvzvRNWb9ofql8aPEJPnZ
 kLIHi3Ch/HYMacQ8=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uKBlk-00007s-Gk for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 May 2025 08:04:13 +0000
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-869e9667f58so847778339f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 May 2025 01:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748419442; x=1749024242;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MWDhC9r9oehNAeAGxW4ZZpblr+pALrjlJXaJu5GfEiI=;
 b=AcLYMROOZHKTTIieoF2fV0GqMZGtYSe4T1OIsPihHEnqlPurySyteHUdb5rKRPzXjT
 dU7BSfeMLWL68OiM8p+0T6PeHTs5eZYGiQ68QdK4ca2z+BdbArTH59UxYzseCGswQx2c
 z76bKhpuPtyqM2TfwQBykd2X5saxMdGW78eya0EJ8msh5+O4WccpCo3zPfrmVeKY/uRA
 zC2dO21Jfi2L4YzYx7ZILuIh713UNKA1poV6piwVfzVK/RUqtk97G9QLHqQiTB0ux2cp
 XJy95E/b1wM0EZg1PurPyWrYdYU8a3TFkS6vpTlIxiJ4yAb65AwaU2dpv+Z2hCxdrIFJ
 iK/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1sOBYkC4JCbAuVXJ6B81zrY5N/rV4vv5SUk0xUM+YCP8QJweFZTYxZxG1nvslXEWzbPN4Aja21/b6Gqz95E2W@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx8HmGIzQcvA4UUREN3eStEA5HcmrstqkRfZv++9X9HRQf+Q8fr
 XX9GolEQP81ZFnRKBZtJJuH4hVJbyNJuuqXg0sRwtsCxezxyVKRZBnWjONkOp+4V0cfcwD1pcQ2
 QpwvW+usaAHXEQE3wLBxIgdTslopgox8hd8Sow8xBLco5w+cuKFgF8N/crSM=
X-Google-Smtp-Source: AGHT+IEWDo3N5Y8nJt4+xEYmCWGJ5P4xfnzlN1fx3ds89XYRyy+o3hQXbMe2tox95EQkf7Cfu+qZRRLsC7xzQomT57mTkOqhoTy7
MIME-Version: 1.0
X-Received: by 2002:a05:6602:371a:b0:85b:3a51:2923 with SMTP id
 ca18e2360f4ac-86cbb8b7b35mr1789997039f.14.1748419441880; Wed, 28 May 2025
 01:04:01 -0700 (PDT)
Date: Wed, 28 May 2025 01:04:01 -0700
In-Reply-To: <68c2c045-c0d4-4896-b3e5-ba3d767f7110@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6836c371.a70a0220.253bc2.00c4.GAE@google.com>
From: syzbot <syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Headers-End: 1uKBlk-00007s-Gk
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-out-of-bounds Read in
 build_sit_entries
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

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         8b56d4fb f2fs: fix to do sanity check on section ckpt_..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=171403f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d25f4819d9920a3e
dashboard link: https://syzkaller.appspot.com/bug?extid=1fa48dc6faf1ff972d7d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
