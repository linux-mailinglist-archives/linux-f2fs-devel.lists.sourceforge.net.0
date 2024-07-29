Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328693F0A5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2024 11:11:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYMPR-000386-NX;
	Mon, 29 Jul 2024 09:11:13 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1sYMPQ-000380-FU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 09:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YuYatmd3clTxaLD7TvQLfwmK4XbsSCKeDc9eo8olJWU=; b=AcW5GesNVvvpbXoGZjNHngqRdf
 cWWjtcOVRTMDm99Kbz88jei+vvTOpEBxmvNRPS8xBDLXb5hP+sTGsPUJzcFuElDb1Oh7s/eNH7TW7
 YFcZQkdRBfSsP4rzTZ/eM4VFCSKr2QXroNlmJwXxZN5uiKN7O1KIcbzhc+yhuBWYVaC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YuYatmd3clTxaLD7TvQLfwmK4XbsSCKeDc9eo8olJWU=; b=a8JosP0UEVMwPehPwyyMogPSDF
 Kgwn3jmnwr4uLls6Mc0f8Ocj4EKEpWucRwpPRyNZsVOcA2YFYl8GDvZ0tEoKfuWTCbITZH4ihlYJz
 Es7EyjjMaR8gglvw5SziGg4Tvh4A4xObYtERYA+uPSUdk5nhmNeNzbS9SFcduJsTEyeI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYMPO-0001sE-Ll for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 09:11:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 54505615F9;
 Mon, 29 Jul 2024 09:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA12DC4AF0B;
 Mon, 29 Jul 2024 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722244260;
 bh=xVnMBh/aez2MOmOwqxtLn5QGRZA8Jl3rF19QRIJ2IQk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G/pjLPvITN4go8z7Ltk2CncC08ns95Rs4oL9LM14dVLHhP8oVdgmL9yC72O057BzU
 tjsvRpYnd+5afErtDbXnj20utAF9T51uS0OxRjoTVfcvHrJHSW3IX1NqgsXoMFm7gN
 GvnUsMp4kedFae2KFJ5Un9k2RnBhdngO+3dtVMXcLymXuPtLTkXVPDvR/M+CGwJmXg
 x5h8/6c5JdgX35oRXqFyYkFDjfU0QoJx1kjJ/rBbKcDwIEnjsJzsf6QnAYA73xHR6R
 5yWHWsWEWtaShsF3lwcZh0x4SWwmZVqVcqImXBQ4HRajTVJ2LFYst45BA9JR/wOoAM
 DzzYnZcUPaaZA==
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 29 Jul 2024 11:10:09 +0200
Message-ID: <20240729-himbeeren-funknetz-96e62f9c7aee@brauner>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0000000000004ff2dc061e281637@google.com>
References: 
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2865; i=brauner@kernel.org;
 h=from:subject:message-id; bh=xVnMBh/aez2MOmOwqxtLn5QGRZA8Jl3rF19QRIJ2IQk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQtj5mxPzxu6b6GjxN+hv+pOBF54kUQ/4X5TJLMLB5vv
 J+qpvG+7yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhItSnDPxWpm1+2syT0aHtb
 GUn/0xfxe79hRsj3JSHdcp+mMLt+bWJk+FPF9ZZt+fH5tw5N0mPJe9a1xGaxk98DvfgLHwwylbo
 TmAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 26, 2024 at 08:23:02AM GMT,
 syzbot wrote: > syzbot has bisected this issue to: > > commit
 b62e71be2110d8b52bf5faf3c3ed7ca1a0c113a5
 > Author: Chao Yu <chao@kernel.org> > Date: Sun Apr 23 15 [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: goo.gl]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sYMPO-0001sE-Ll
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
Cc: Christian Brauner <brauner@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
 jack@suse.cz, paulmck@kernel.org, frank.li@vivo.com,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Hillf Danton <hdanton@sina.com>, Oleg Nesterov <oleg@redhat.com>,
 rcu@vger.kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 syzbot <syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 26, 2024 at 08:23:02AM GMT, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit b62e71be2110d8b52bf5faf3c3ed7ca1a0c113a5
> Author: Chao Yu <chao@kernel.org>
> Date:   Sun Apr 23 15:49:15 2023 +0000
> 
>     f2fs: support errors=remount-ro|continue|panic mountoption
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=119745f1980000
> start commit:   1722389b0d86 Merge tag 'net-6.11-rc1' of git://git.kernel...
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=139745f1980000
> console output: https://syzkaller.appspot.com/x/log.txt?x=159745f1980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b698a1b2fcd7ef5f
> dashboard link: https://syzkaller.appspot.com/bug?extid=20d7e439f76bbbd863a7
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1237a1f1980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115edac9980000
> 
> Reported-by: syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com
> Fixes: b62e71be2110 ("f2fs: support errors=remount-ro|continue|panic mountoption")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Thanks to Paul and Oleg for point me in the right direction and
explaining that rcu sync warning.

That patch here is remounting a superblock read-only directly by raising
SB_RDONLY without the involvement of the VFS at all. That's pretty
broken and is likely to cause trouble if done wrong. The rough order of
operations to transition rw->ro usualy include checking that the
filsystem is unfrozen, and marking all mounts read-only, then calling
into the filesystem so it can do whatever it wants to do.

In any case, all of this requires holding sb->s_umount. Not holding
sb->s_umount will end up confusing freeze_super() (Thanks to Oleg for
noticing!). When freeze_super() is called on a non-ro filesystem it will
acquire
percpu_down_write(SB_FREEZE_WRITE+SB_FREEZE_PAGEFAULT+SB_FREEZE_FS) and
thaw_super() needs to call
sb_freeze_unlock(SB_FREEZE_FS+SB_FREEZE_PAGEFAULT+SB_FREEZE_WRITE) but
because you just raise SB_RDONLY you end up causing thaw_super() to skip
that step causing the bug in rcu_sync_dtor() to be noticed.

Btw, ext4 has similar logic where it raises SB_RDONLY without checking
whether the filesystem is frozen.

So I guess, this is technically ok as long as that emergency SB_RDONLY raising
in sb->s_flags is not done while the fs is already frozen. I think ext4 can
probably never do that. Jan?

My guess is that something in f2fs can end up raising SB_RDONLY after
the filesystem is frozen and so it causes this bug. I suspect this is coming
from the gc_thread() which might issue a f2fs_stop_checkpoint() while the fs is
already about to be frozen but before the gc thread is stopped as part of the
freeze.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
