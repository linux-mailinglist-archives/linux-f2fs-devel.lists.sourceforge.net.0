Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B348311FB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jan 2024 04:59:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rQJYy-0006GX-Ck;
	Thu, 18 Jan 2024 03:59:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rQJYw-0006GA-He
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jan 2024 03:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=glE1zsOgW1iHcqk8PRm1Txuz3rqb8boJNdeCLIBqg7k=; b=AP1YnJ4+q5vrddQcW0drkctohP
 Uhp7BT/L2c/6M0MlNdjRGaYkJjkn+GQ9iHfwefqgZu2Fg7hWDOtFvKp6cnz9t2YI/Z6XYnuoTWqRU
 cfRuRU6AMshy32VA7DNoIp3nJ7hW5bUbqJNH8raDnpYfTfhaZeGVSfIH4/fN2tnnPeOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=glE1zsOgW1iHcqk8PRm1Txuz3rqb8boJNdeCLIBqg7k=; b=i5Gq3G7YpUCsJnlEQzUyAC1fvG
 6l3dDG+yh0cHmirYFo884pZwOob6X4d14i7jM5DRAMwXbvU0DS8aA8b5Kx1wKPKBUBqOsyj90bjrP
 Y1YUowKzCICGzCbLICQ0Ofisq9HNCylEkT30r45Y9Ghu3i2GUxuikRDvhMWvZX9kZWrI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rQJYt-0002VV-Lp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Jan 2024 03:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 21EC66176A;
 Thu, 18 Jan 2024 03:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ACCC433C7;
 Thu, 18 Jan 2024 03:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705550356;
 bh=EisvP7808GQ7Gd+G+RGaBK/S/ilhFW8YlA8hHIV+KLY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IqFavts6afhViVUETjFIIPgQNjDJ5ZJz/RUuuVZKAblZLKKAZ+5HzRlF4TFRxxcsP
 mu+wpF9nNVwul9Y5ixlvKS7TC5NmPt5FMMM8T7TOx9DQC/NOgXtNbe7CejvaK2vw2g
 YqurD4C21Y6lh6oFBBrrkMKe7fuEoCI7VCJLycfVCuc+cXJnmEHK4GdJWxv7ut1OxT
 5KxPRyZU9U3KinUxzhOI8p3uOtXHZKctnsA7Fxgt0oE/aYV3oMq9qWC7McbSowM/P8
 dVk+UOMu6Hv112qGQrMevEBEriYWL5fyddc+duD4ZYbsn2VGl5FfXRd3PRVhd/OoIW
 Dq7shWO2x3Z4A==
Date: Wed, 17 Jan 2024 19:59:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: syzbot <syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com>
Message-ID: <20240118035914.GD1103@sol.localdomain>
References: <0000000000006cb174060ec34502@google.com>
 <000000000000d65af9060ece0537@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000d65af9060ece0537@google.com>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 12, 2024 at 10:38:04PM -0800, syzbot wrote: >
 syzbot has bisected this issue to: > > commit
 275dca4630c165edea9abe27113766bc1173f878
 > Author: Eric Biggers <ebiggers@google.com> > Date: We [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rQJYt-0002VV-Lp
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 kill_f2fs_super
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
Cc: hdanton@sina.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 12, 2024 at 10:38:04PM -0800, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 275dca4630c165edea9abe27113766bc1173f878
> Author: Eric Biggers <ebiggers@google.com>
> Date:   Wed Dec 27 17:14:28 2023 +0000
> 
>     f2fs: move release of block devices to after kill_block_super()
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16071613e80000
> start commit:   70d201a40823 Merge tag 'f2fs-for-6.8-rc1' of git://git.ker..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=15071613e80000
> console output: https://syzkaller.appspot.com/x/log.txt?x=11071613e80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4607bc15d1c4bb90
> dashboard link: https://syzkaller.appspot.com/bug?extid=8f477ac014ff5b32d81f
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=112b660be80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c1df5de80000
> 
> Reported-by: syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com
> Fixes: 275dca4630c1 ("f2fs: move release of block devices to after kill_block_super()")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz fix: f2fs: fix double free of f2fs_sb_info


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
