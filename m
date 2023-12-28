Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E321D81F711
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Dec 2023 11:51:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rInyY-0004zj-MT;
	Thu, 28 Dec 2023 10:50:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1rInyX-0004zd-JV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 10:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AlG5s033yWJpN218gk0hjIu+YllQLpgD2y1CYJxNGc0=; b=ArP6WOwWlc/bf71VfrdqRn8xrP
 MLrTLbuWADAb3UkO1YI8gRgisPDVugBXH71GDOLkmv+2k2hPXLcHEnMpNJCQla8OsuJjvJ5gDgiLo
 nGOifrSC+m01WdWHqdsDUw4e5IdFoQ0RnwK2s9cF8wja0ZQp3J41r+K8G0gmLRERDnnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AlG5s033yWJpN218gk0hjIu+YllQLpgD2y1CYJxNGc0=; b=Y26nesQm77B2u65OqrnG+GqmMN
 FG23OvAMooy44G36KrKPWAtgYEB4AjKnhEWtGaURGO8cUBJH/EGAqwH+mBYX4S6TPH5u6UHOxZJnv
 dYoAM1vTPifofu+tszjZzbbflqWPPR21RuEGhCN+2HtXnjTbS+G0vgF3UqMqbVlmfJ1k=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rInyT-0007MG-My for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 10:50:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0A4A5B80D9D;
 Thu, 28 Dec 2023 10:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D88C433C7;
 Thu, 28 Dec 2023 10:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703760639;
 bh=BPxPOKTaZnluFeSzgfExNeB7kZWJYat+UJLHwDn2Rig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rU23jokBsrTIsxPfYmNIo9Xnj10xyocVaTrcpX7nEltRKTr9sMmIM31539OQOErIB
 wO+EI/Dce0SrS+TxgxagIadHeq/btyUM2L+r8H6fEZ/QXeBYe3GjB+ddI7ky/zdFpu
 Jbww5cKdCaPPzkFsrvcoteN2n2cntNKgN+lFQv8GHWelw6dM65ZJJAg9Y5AydqbxG6
 AuiZhSW1ZKkZa5dc6cjkyyzWDqSPHv2/W4TMSgg73kHZ4YUkw/nG5BrvE22SX05hbz
 kEUVX9gV0khXZsUJ+czZTzndgCJ6ysMkFwXN6KOspnN8ujArhc6D4iLx2p+u3PT/zu
 Pi9T8etG2rnDA==
Date: Thu, 28 Dec 2023 11:50:32 +0100
From: Christian Brauner <brauner@kernel.org>
To: syzbot <syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com>
Message-ID: <20231228-arterien-nachmachen-d74aec52820e@brauner>
References: <0000000000001825ce06047bf2a6@google.com>
 <00000000000007d6a9060d441adc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00000000000007d6a9060d441adc@google.com>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Dec 24, 2023 at 08:40:05AM -0800, syzbot wrote: >
 syzbot suspects this issue was fixed by commit: > > commit
 fd1464105cb37a3b50a72c1d2902e97a71950af8
 > Author: Jan Kara <jack@suse.cz> > Date: [...] 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rInyT-0007MG-My
Subject: Re: [f2fs-dev] [syzbot] [reiserfs?] possible deadlock in super_lock
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
Cc: axboe@kernel.dk, hdanton@sina.com, mcanal@igalia.com, jack@suse.cz,
 reiserfs-devel@vger.kernel.org, daniel.vetter@ffwll.ch,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 mairacanal@riseup.net, terrelln@fb.com, yukuai3@huawei.com,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, jinpu.wang@ionos.com,
 hch@lst.de, christian@brauner.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Dec 24, 2023 at 08:40:05AM -0800, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit fd1464105cb37a3b50a72c1d2902e97a71950af8
> Author: Jan Kara <jack@suse.cz>
> Date:   Wed Oct 18 15:29:24 2023 +0000
> 
>     fs: Avoid grabbing sb->s_umount under bdev->bd_holder_lock
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14639595e80000
> start commit:   2cf0f7156238 Merge tag 'nfs-for-6.6-2' of git://git.linux-..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=710dc49bece494df
> dashboard link: https://syzkaller.appspot.com/bug?extid=062317ea1d0a6d5e29e7
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107e9518680000
> 
> If the result looks correct, please mark the issue as fixed by replying with:
> 
> #syz fix: fs: Avoid grabbing sb->s_umount under bdev->bd_holder_lock
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Fwiw, this was always a false-positive. But we also reworked the locking
that even the false-positive cannot be triggered anymore. So yay!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
