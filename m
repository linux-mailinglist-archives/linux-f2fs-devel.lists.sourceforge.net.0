Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A96037123F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 May 2023 11:45:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2U0n-0002jh-7M;
	Fri, 26 May 2023 09:45:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q2U0m-0002ja-2R
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 09:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OJFFuTQTeL4a8LnvAyb/C4a2ikJ6qYKlnVVVrvRfmDc=; b=WC1QVYT6z3LP3Kq1gg68EMmOaZ
 078SWIcYJ3i8ft2ipMXqrqb2zGGsnslREWvRgb6COZYBjDEyxdPJDtMrGFJSRd0RmVZExIrJZgzsi
 tnb63x2Yh8XC4LFa6DGTXoNNQ68IACS30rPM9co63YqjRS7UsJy68uh5Z+pjcdqzZs5k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OJFFuTQTeL4a8LnvAyb/C4a2ikJ6qYKlnVVVrvRfmDc=; b=QXKGzuPvFFhcG60kV9NuCpIPrG
 OFxYued2aVfl3y0G4gDmrq65cm3U0ejcHes6ra8tAgR3vto7yUshJ5ozIve1K7kjC7o9s1vCXwrHp
 ROObZJjecGk+rVz/bwX3F/fWDIqIYnZ5wo9LHHohpph1MN64Jcxeg6YkjhDEeDQm5zWg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2U0l-0039NW-H6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 09:45:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C23E647CD;
 Fri, 26 May 2023 09:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F78CC433EF;
 Fri, 26 May 2023 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685094321;
 bh=6757u1vv3qshvT3KML6a5/JeJbMP77tgbtC+voZYxM8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xit6rovGa1EEW81ZgpfaqNZHoUIw5HguySJ17Cp/3hX/NBNlh7jaa1cllWG2iirET
 8v8OyP2+bIXqFTB3fsUEY1VBIgMGeEu2nqemQIOXTQ8Kx9tdMUs1oXJaYc9dr8T9nL
 so0FIOgiJK+d3KseP1t373HUh0NxXheGkUqLb68U7mM4JIAby9t9oS6pI8438c/DSa
 7WLuGXVk5VzdxgQC/ybMoa8F8JOUh8+IjbcF5sA1Rx1sNATtns9Khfau7r0SRc4ahp
 ZydAbOSB4xf7KBz2DMlBM4Hw1+RI+zWuwQxMj0kAqXo82MAEOA/VoQRJnmuFr7KRET
 g9JugSYtsWCyg==
Date: Fri, 26 May 2023 11:45:15 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230526-polarstern-herrichten-32fc46c63bfc@brauner>
References: <20230525100654.15069-1-jack@suse.cz>
 <20230525101624.15814-4-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230525101624.15814-4-jack@suse.cz>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 25, 2023 at 12:16:10PM +0200, Jan Kara wrote:
 > Currently the locking order of inode locks for directories that are not
 > in ancestor relationship is not defined because all operations tha [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2U0l-0039NW-H6
Subject: Re: [f2fs-dev] [PATCH 4/6] fs: Establish locking order for
 unrelated directories
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
Cc: Ted Tso <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>,
 "Darrick J. Wong" <djwong@kernel.org>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Al Viro <viro@ZenIV.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 25, 2023 at 12:16:10PM +0200, Jan Kara wrote:
> Currently the locking order of inode locks for directories that are not
> in ancestor relationship is not defined because all operations that
> needed to lock two directories like this were serialized by
> sb->s_vfs_rename_mutex. However some filesystems need to lock two
> subdirectories for RENAME_EXCHANGE operations and for this we need the
> locking order established even for two tree-unrelated directories.
> Provide a helper function lock_two_inodes() that establishes lock
> ordering for any two inodes and use it in lock_two_directories().
> 
> CC: stable@vger.kernel.org
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  fs/inode.c    | 34 ++++++++++++++++++++++++++++++++++
>  fs/internal.h |  2 ++
>  fs/namei.c    |  4 ++--
>  3 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 577799b7855f..2015fa50d34a 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -1103,6 +1103,40 @@ void discard_new_inode(struct inode *inode)
>  }
>  EXPORT_SYMBOL(discard_new_inode);
>  
> +/**
> + * lock_two_inodes - lock two inodes (may be regular files but also dirs)
> + *
> + * Lock any non-NULL argument. The caller must make sure that if he is passing
> + * in two directories, one is not ancestor of the other.  Zero, one or two
> + * objects may be locked by this function.
> + *
> + * @inode1: first inode to lock
> + * @inode2: second inode to lock
> + * @subclass1: inode lock subclass for the first lock obtained
> + * @subclass2: inode lock subclass for the second lock obtained
> + */
> +void lock_two_inodes(struct inode *inode1, struct inode *inode2,
> +		     unsigned subclass1, unsigned subclass2)
> +{
> +	if (!inode1 || !inode2)
> +		goto lock;

Before this change in

lock_two_nondirectories(struct inode *inode1, struct inode *inode2)

the swap() would cause the non-NULL inode to always be locked with
I_MUTEX_NONDIR2. Now it can be either I_MUTEX_NORMAL or I_MUTEX_NONDIR2.
Is that change intentional?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
