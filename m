Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2927A93D600
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 17:23:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXMmo-00060o-Ur;
	Fri, 26 Jul 2024 15:23:14 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Vr-jZgkbAJ8RXYJ9KKDQ9OOHC.FNNFKDTRDQBNMSDMS.BNL@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sXMmn-00060Y-Ed for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 15:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wrSzqyiMZx4ozjypR+uiSnGPSDS1DfBLU8iYnkXnm8o=; b=UBeg+fQU7EoYqoQT77Jz5CeXPa
 WXOdsCV86U5Xy5HLuTbGgGDD2rzpIfl5As+MhH6QLmLkWeOrouMI79q0i2idMYdZNEdde4Wy2kA1u
 HhPcsJJZ9AgAF8FfMrEYlfnXPRu4Jogn+qAnsyNOXq0Syp6z+kxt21OND9LmI1rirflk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wrSzqyiMZx4ozjypR+uiSnGPSDS1DfBLU8iYnkXnm8o=; b=H
 4ntlTBsCGbBXlkyBlBQ3fsUIf1/1+d8qT2zPH+LFGJ1/aXRkdjGbvZ6XOYXgKwuKvuKESkyD3QP4Y
 AWRhjwTCykx5dST1XC0x1e/spQpBdKQ5fbX1iB+aHUj67rYDkzA5nHwrybM82BKTKfCRLUaInFWtz
 MlJq78fA5nQ4Knzc=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sXMmm-0004ti-Qp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 15:23:13 +0000
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-81f87561de0so194158139f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jul 2024 08:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722007382; x=1722612182;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wrSzqyiMZx4ozjypR+uiSnGPSDS1DfBLU8iYnkXnm8o=;
 b=usb/NEEgXQq33cxigiKN3i/uEPLY7hvV66/FmB92n9O/mrDwx7QUzpvOGOgpfH5P9Y
 0fx0TUu0BPeigpxG0g15bN5z76C0uKKgdvj70XQpAyIl1wZdFFaL5F/FMu1likZ4TlJq
 8SMkzKdAG2X/03DiVDw3Nrc6GKx6d69tXtluYZKJ8/yer6uVYnrDdTWOUnsxJ8chLv8q
 DC7afVmzwzotIqPjgcMd0S502Mj6rHaXvnYmgCHxTJNCo3rtQsDmugZ6vbjmtfWkVvzu
 TRBUqoMBIeKle5secl1uLxNWRZzVfeBgmzS2AS7tWFfZmBm/RCttwHEN8M3dgpSw0oLf
 kjCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU8FoIPyjOqHG3WVF9B8mSSeLCqvIiogy4FUagSx3hOYdgfLDk6PIPDq2juWIGiTo7OI0UXog9G1lXT22pypLBZbv/1jLRAXMT8wvYKA9aXVkvgMZ/Iw==
X-Gm-Message-State: AOJu0Yw772UBsY6s220qR+rt2Vxi/U6gDhCk5sPvMS0uotA9a7jJSpWj
 l7svqXPlPInsiNtjN86RJPyO8bJd22aiwAfn15+42Y4pnN9OQAcbhOMfX5Fi54sOSWR6i5Bpy+a
 jNuYPiz09AYK/LEAI5MZOxXVW+Gw1f+LdVnYX7qHkeDUDFWG9Z+kRkpc=
X-Google-Smtp-Source: AGHT+IEitdjrvQfgUSlHI9A5b/o7wbVGbHXJfvr5OeY9BfiBEWaDu7+L2Zu4oFY+y+iyX8y9suRRcOHcvVDTWq93/LtY+DN37WYn
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4120:b0:4c0:9a3e:c24d with SMTP id
 8926c6da1cb9f-4c29b6da7acmr341864173.0.1722007382122; Fri, 26 Jul 2024
 08:23:02 -0700 (PDT)
Date: Fri, 26 Jul 2024 08:23:02 -0700
In-Reply-To: <000000000000b90a8e061e21d12f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004ff2dc061e281637@google.com>
From: syzbot <syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com>
To: brauner@kernel.org, chao@kernel.org, frank.li@vivo.com, jack@suse.cz, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot has bisected this issue to: commit
 b62e71be2110d8b52bf5faf3c3ed7ca1a0c113a5
 Author: Chao Yu <chao@kernel.org> Date: Sun Apr 23 15:49:15 2023 +0000 f2fs:
 support errors=remount-ro|continue|panic mountoption 
 Content analysis details:   (2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: goo.gl]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.72 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.72 listed in sa-accredit.habeas.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
X-Headers-End: 1sXMmm-0004ti-Qp
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING in rcu_sync_dtor
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

syzbot has bisected this issue to:

commit b62e71be2110d8b52bf5faf3c3ed7ca1a0c113a5
Author: Chao Yu <chao@kernel.org>
Date:   Sun Apr 23 15:49:15 2023 +0000

    f2fs: support errors=remount-ro|continue|panic mountoption

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=119745f1980000
start commit:   1722389b0d86 Merge tag 'net-6.11-rc1' of git://git.kernel...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=139745f1980000
console output: https://syzkaller.appspot.com/x/log.txt?x=159745f1980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b698a1b2fcd7ef5f
dashboard link: https://syzkaller.appspot.com/bug?extid=20d7e439f76bbbd863a7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1237a1f1980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115edac9980000

Reported-by: syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com
Fixes: b62e71be2110 ("f2fs: support errors=remount-ro|continue|panic mountoption")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
