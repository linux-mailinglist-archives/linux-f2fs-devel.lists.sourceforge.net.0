Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9731A2F18BA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 15:52:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyyYv-0006Pc-4g; Mon, 11 Jan 2021 14:52:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyyYu-0006PV-Ef
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qGwuZG+FpH+mDo2MIvPkqXJt7klJaw0mPw8xG/EJcuQ=; b=X9e3UuUXaGbg/lQux0qLVf8VZ3
 secae2ZKAW13TEsVeXSvGl6o+T+sQft0l8z3vXSSQS2QUnnxv87k4dnUAbwC4pq/kfE0IUuUwW+Bk
 ej2u5ry3V6COJUrZWUqu4V+zoYs96Y+qZ4fUVvGTCGuq5EdcJVzOBDLFnsxeoenvvWN8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qGwuZG+FpH+mDo2MIvPkqXJt7klJaw0mPw8xG/EJcuQ=; b=N9IbgSIfoWjYr6qGsdCQzMu5mx
 AWAo+M0UDkzksUeOJ+TOa+wUiGy+Dd5KIMmCCG6H6hpg8voW8v4m4b0362WeBnh4ocDQ3HpPvtLk0
 KM0eDkRlvNTrGRoeSQeKNE5kl0jK1HhEN5lrwZAjyH1eqT5v/u9okv7vFwIGa3zjXfAc=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyyYs-001MO3-9Q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:52:52 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BAF3CAB7A;
 Mon, 11 Jan 2021 14:52:40 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 71E861E0807; Mon, 11 Jan 2021 15:52:40 +0100 (CET)
Date: Mon, 11 Jan 2021 15:52:40 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111145240.GC18475@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-5-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyyYs-001MO3-9Q
Subject: Re: [f2fs-dev] [PATCH v2 04/12] fat: only specify I_DIRTY_TIME when
 needed in fat_update_time()
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 08-01-21 23:58:55, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> As was done for generic_update_time(), only pass I_DIRTY_TIME to
> __mark_inode_dirty() when the inode's timestamps were actually updated
> and lazytime is enabled.  This avoids a weird edge case where
> I_DIRTY_TIME could be set in i_state when lazytime isn't enabled.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/fat/misc.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/fat/misc.c b/fs/fat/misc.c
> index f1b2a1fc2a6a4..18a50a46b57f8 100644
> --- a/fs/fat/misc.c
> +++ b/fs/fat/misc.c
> @@ -329,22 +329,23 @@ EXPORT_SYMBOL_GPL(fat_truncate_time);
>  
>  int fat_update_time(struct inode *inode, struct timespec64 *now, int flags)
>  {
> -	int iflags = I_DIRTY_TIME;
> -	bool dirty = false;
> +	int dirty_flags = 0;
>  
>  	if (inode->i_ino == MSDOS_ROOT_INO)
>  		return 0;
>  
> -	fat_truncate_time(inode, now, flags);
> -	if (flags & S_VERSION)
> -		dirty = inode_maybe_inc_iversion(inode, false);
> -	if ((flags & (S_ATIME | S_CTIME | S_MTIME)) &&
> -	    !(inode->i_sb->s_flags & SB_LAZYTIME))
> -		dirty = true;
> +	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
> +		fat_truncate_time(inode, now, flags);
> +		if (inode->i_sb->s_flags & SB_LAZYTIME)
> +			dirty_flags |= I_DIRTY_TIME;
> +		else
> +			dirty_flags |= I_DIRTY_SYNC;
> +	}
> +
> +	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
> +		dirty_flags |= I_DIRTY_SYNC;
>  
> -	if (dirty)
> -		iflags |= I_DIRTY_SYNC;
> -	__mark_inode_dirty(inode, iflags);
> +	__mark_inode_dirty(inode, dirty_flags);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(fat_update_time);
> -- 
> 2.30.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
