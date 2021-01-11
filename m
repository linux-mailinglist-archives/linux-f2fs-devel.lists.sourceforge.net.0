Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 511602F18B0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 15:50:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyyWk-0003Ta-Tu; Mon, 11 Jan 2021 14:50:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyyWj-0003TO-Hf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OlQ1wcTdwwVi5vnm20UaS/pnGw3tB/RfvLo09FtJ/FY=; b=O2CqXPW+IajhuFQC6IntdrKfX/
 Lkk1TdInOsfBPpVi53MCOi+qcJtDKx0lct/z5o1ykeYLgw9mNk60F2UXhYSswT5q1RNJ+4cHxnQqX
 HbYGkMxuMYlWZLA+WTp4J41ljPyz7+PdU3BigtEXZcX9xw1qzY4Vnyh+T4FllpvwWzkg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OlQ1wcTdwwVi5vnm20UaS/pnGw3tB/RfvLo09FtJ/FY=; b=Ei6NEyHCkpxYkt8K4kpged7uJu
 xTQNMeDPmZMvGMcI4jZRXhnelg7NeqhGP1e8JCz2+Btw92lgez3IGytWwu2KWLgoya6Ae4pgtjPxx
 K0BYkeugcU0JvSQnGOFOJLlvWCT7wIOvtkEE67WqOCdjdOcbXN+x0CCC7jDbjKo4JiKQ=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyyWi-009ZPz-66
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:50:37 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DDED9AB7A;
 Mon, 11 Jan 2021 14:50:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id AF3721E0807; Mon, 11 Jan 2021 15:50:29 +0100 (CET)
Date: Mon, 11 Jan 2021 15:50:29 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111145029.GB18475@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-4-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyyWi-009ZPz-66
Subject: Re: [f2fs-dev] [PATCH v2 03/12] fs: only specify I_DIRTY_TIME when
 needed in generic_update_time()
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

On Fri 08-01-21 23:58:54, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> generic_update_time() always passes I_DIRTY_TIME to
> __mark_inode_dirty(), which doesn't really make sense because (a)
> generic_update_time() might be asked to do only an i_version update, not
> also a timestamps update; and (b) I_DIRTY_TIME is only supposed to be
> set in i_state if the filesystem has lazytime enabled, so using it
> unconditionally in generic_update_time() is inconsistent.
> 
> As a result there is a weird edge case where if only an i_version update
> was requested (not also a timestamps update) but it is no longer needed
> (i.e. inode_maybe_inc_iversion() returns false), then I_DIRTY_TIME will
> be set in i_state even if the filesystem isn't mounted with lazytime.
> 
> Fix this by only passing I_DIRTY_TIME to __mark_inode_dirty() if the
> timestamps were updated and the filesystem has lazytime enabled.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza


> ---
>  fs/inode.c | 38 ++++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 6442d97d9a4ab..d0fa43d8e9d5c 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -1743,24 +1743,26 @@ static int relatime_need_update(struct vfsmount *mnt, struct inode *inode,
>  
>  int generic_update_time(struct inode *inode, struct timespec64 *time, int flags)
>  {
> -	int iflags = I_DIRTY_TIME;
> -	bool dirty = false;
> -
> -	if (flags & S_ATIME)
> -		inode->i_atime = *time;
> -	if (flags & S_VERSION)
> -		dirty = inode_maybe_inc_iversion(inode, false);
> -	if (flags & S_CTIME)
> -		inode->i_ctime = *time;
> -	if (flags & S_MTIME)
> -		inode->i_mtime = *time;
> -	if ((flags & (S_ATIME | S_CTIME | S_MTIME)) &&
> -	    !(inode->i_sb->s_flags & SB_LAZYTIME))
> -		dirty = true;
> -
> -	if (dirty)
> -		iflags |= I_DIRTY_SYNC;
> -	__mark_inode_dirty(inode, iflags);
> +	int dirty_flags = 0;
> +
> +	if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
> +		if (flags & S_ATIME)
> +			inode->i_atime = *time;
> +		if (flags & S_CTIME)
> +			inode->i_ctime = *time;
> +		if (flags & S_MTIME)
> +			inode->i_mtime = *time;
> +
> +		if (inode->i_sb->s_flags & SB_LAZYTIME)
> +			dirty_flags |= I_DIRTY_TIME;
> +		else
> +			dirty_flags |= I_DIRTY_SYNC;
> +	}
> +
> +	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
> +		dirty_flags |= I_DIRTY_SYNC;
> +
> +	__mark_inode_dirty(inode, dirty_flags);
>  	return 0;
>  }
>  EXPORT_SYMBOL(generic_update_time);
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
