Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBED6F6CF4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 15:31:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puZ3Q-0007il-TH;
	Thu, 04 May 2023 13:31:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3qbNTZAkbAIg4ABwmxxq3m11up.s00sxq64q3o0z5qz5.o0y@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1puZ3Q-0007if-0Q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 13:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yVwBEos5iu7/7J5iO/o1soHBlv2P/o3LvFqCNG0issM=; b=W5kjcHYuiFZmnczNu+TSVLBG/S
 78FUgXOIyZxH8OG0M7SqE5cT8tA2UUayl8VOUzWyyGDqiJpxkmzNxpsycuzq3uqZqEmtB4/x3TmK6
 IqT9BYkGHjMMWlXTKRgzrcLyc/Cz9lWyrp+YDxMExdHVS/7wPWvwZn6RYt1zDcvDoPAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yVwBEos5iu7/7J5iO/o1soHBlv2P/o3LvFqCNG0issM=; b=g
 2a0w1asE0KmI2cm1wHo+Z0KlqWgGYdkvYnPhpKAMcAfhAevF3/FwoFKjmT/vnsMmAmyIKYyuUIuWq
 AhnU/zDHlCnh5hiiOuKphS38RjfJrbI+l3lVEGFUvEED3+30+TVmWBPOdc3prwZ+ShHi61fR5cO7D
 neQO3lsgLBvnFxfk=;
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puZ3P-0005VC-EF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 13:31:27 +0000
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-7606d443ba6so27417439f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 04 May 2023 06:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683207082; x=1685799082;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yVwBEos5iu7/7J5iO/o1soHBlv2P/o3LvFqCNG0issM=;
 b=II9vuF3rzLV6S75ydlSIaMfmDnF9WAUQV5zfCbucltHMZl4v8ahjwZZ7/0E0Otd7UP
 7t5m6KFWAnk70QvLZ9GwjWdRSOno0Sa92b0D8BG/CRVOuGDIlNUwpxqaFiE0mH4/w31x
 NfFpfOAkJ+0+S+t4w9YXDJ7GgWFZpR/tEiRmwuDvwcIASrYu4LnkRPW9/A9LRQPXARTg
 PwtZSxECl8yNyRBWoyrG/f3rg4whwWuntznwgJZRK+xYZwJH+grCUK2I2jngV0GreJP8
 h9JcZNjB6NOR54X3Qz3B/6gVH8d8BG1g+6Uqt6278XKZxKjBXEuvWXJh7lQXtpmf5vn1
 I10Q==
X-Gm-Message-State: AC+VfDwOEcor3iUzZGsoo91f9jOiKJJrl9/hP5Vs+p/QZOtALR0zlnkR
 mjspQBmIIJElSVLSDwSQvhSkKmlaf3RCWdyPw11KVm0gT+C8
X-Google-Smtp-Source: ACHHUZ6HupuhWKorQTNyrYyET7P6ooqBC7PUYwkkiIVJKVyMN7QnPrgbhC+psr9Yh1NWkqdeopoSP95IVRVzcAlLaCZ5RvC47QLG
MIME-Version: 1.0
X-Received: by 2002:a5d:94d1:0:b0:763:dd01:e143 with SMTP id
 y17-20020a5d94d1000000b00763dd01e143mr12018818ior.2.1683207081855; Thu, 04
 May 2023 06:31:21 -0700 (PDT)
Date: Thu, 04 May 2023 06:31:21 -0700
In-Reply-To: <fb9b6de8-1efc-eeea-7acb-09d291590576@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000032909d05fade30c8@google.com>
From: syzbot <syzbot+eb6201248f684e99b9f8@syzkaller.appspotmail.com>
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
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: no output from test machine Tested on: 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
X-Headers-End: 1puZ3P-0005VC-EF
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
 to user space in f2fs_write_single_data_page
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
no output from test machine



Tested on:

commit:         2adb872d f2fs: fix potential deadlock due to unpaired ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
console output: https://syzkaller.appspot.com/x/log.txt?x=114b5338280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=86e4eb913e90d4b2
dashboard link: https://syzkaller.appspot.com/bug?extid=eb6201248f684e99b9f8
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
