Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B1F815E58
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Dec 2023 10:36:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEnZO-0003Xh-8r;
	Sun, 17 Dec 2023 09:36:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3BcF-ZQkbALQmsteUffYlUjjcX.aiiafYomYlWihnYhn.Wig@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rEnZM-0003X1-46 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 09:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QYt+ikegC5rVi/qGr8IiLcMnutjmAb6NTg3JW6/hHH0=; b=Ql45Gu8axvKtyJ6JANktFd9tW0
 /h30FZF2nFyVzidoQkoKiwFM+ttZ0bqE9nkImMVn0QMwtfx8mseOqVRVIGPRWGDJECXHUyOH4JaS6
 jomQxgZrN5IkNIYVnzHZ1by5DXevZjnXsTay7Ym9p8ppGtHQWipKEG/f+0GuLv0D0pl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QYt+ikegC5rVi/qGr8IiLcMnutjmAb6NTg3JW6/hHH0=; b=L
 EhLMI23GD288HqEvb034j3VMyIdZyrnGoa+iA6a5R3VY8t6vO0ujeZGyr+29V9KwYysW2T63Yzdpt
 YBxLZjeIKaueVL+X6MBWC0rZTT+N7izhCc5WEO/sj18XW5QdVAG9yfx+iRnLfxKZdQdtT+JNpiG4/
 Z0t3FlueyPSWzDT0=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEnZI-0008BW-Iz for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 09:36:20 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-35f8344e3c8so36513275ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Dec 2023 01:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702805766; x=1703410566;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QYt+ikegC5rVi/qGr8IiLcMnutjmAb6NTg3JW6/hHH0=;
 b=A0CHoDZKNvdUpcWhPcYTr5wmzYkI8mnPk2DYQbf3w9sUPCMKZJFsDQSjqimlEvAjRX
 ecCjsLnHzBLBKxRhCiSwMIqIfSUHp0+j1clUBn9CaVHMVLoCOcmPVszzeOQnG62p25q9
 T7oX2Lz5WhhdZV0Jm3wQ6McWLomAyrRCvo4cAflCh/cZnLtm0L5u4I8deFxuTkXqHOL+
 3r88U3qDPRsicnOFnUq1YCXy7aezMS+7WWPRjCAZHXeo/iWqtQ0RR+irbw33yGDkKO4O
 V2nxFHEtcoAf3vQngxy0W5vPHLBsVZK4XuIVWhiagkXgaRz1/mG5O/alCeNvWXpZ/iRv
 E3uA==
X-Gm-Message-State: AOJu0YwVuTMvibxgjxtiZXx19bIpVNVpvBHiEgoEcikYExv9NkowV9aV
 IjnYwlr782RfS5SzWdi/MifwWhPCQQJqwEwFjtPs1HVMFGWz
X-Google-Smtp-Source: AGHT+IEJAguZt+Gv2Y76sjvdueN6ZFAUUjgQ3bitOLfHS8oC6v8p3BLP5V9wsQgaUv5l1IktXBdwbNZHY16qZ2kMSl2kME9KRaTW
MIME-Version: 1.0
X-Received: by 2002:a92:1e06:0:b0:35f:4dfd:c224 with SMTP id
 e6-20020a921e06000000b0035f4dfdc224mr473921ile.0.1702805765999; Sun, 17 Dec
 2023 01:36:05 -0800 (PST)
Date: Sun, 17 Dec 2023 01:36:05 -0800
In-Reply-To: <CAOQ4uxjjo=qwwWcRXhv_D+KFfnPa_CEOrPbbZtzLroiOO7eYDg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cdd406060cb15c9c@google.com>
From: syzbot <syzbot+8608bb4553edb8c78f41@syzkaller.appspotmail.com>
To: amir73il@gmail.com, chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phillip@squashfs.org.uk, 
 reiserfs-devel@vger.kernel.org, squashfs-devel@lists.sourceforge.net, 
 syzkaller-bugs@googlegroups.com, terrelln@fb.com, viro@zeniv.linux.org.uk
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-and-tested-by:
 syzbot+8608bb4553edb8c78f41@syzkaller.appspotmail.com
 Content analysis details:   (3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEnZI-0008BW-Iz
Subject: Re: [f2fs-dev] [syzbot] [reiserfs?] [squashfs?] BUG: Dentry still
 in use in unmount
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

Reported-and-tested-by: syzbot+8608bb4553edb8c78f41@syzkaller.appspotmail.com

Tested on:

commit:         79f938ea ovl: fix dentry reference leak after changes ..
git tree:       https://github.com/amir73il/linux ovl-fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=171ae01ae80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=52c9552def2a0fdd
dashboard link: https://syzkaller.appspot.com/bug?extid=8608bb4553edb8c78f41
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
