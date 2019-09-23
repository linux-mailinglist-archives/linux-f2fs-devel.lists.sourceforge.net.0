Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1B7BB1F5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Sep 2019 12:10:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iCLIk-0004sm-BA; Mon, 23 Sep 2019 10:10:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1iCLIi-0004sf-Ma
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 10:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y/leVQOesvX/XM3KBnx/PYz9Cg0b/e+gYJOVe+q4Tjk=; b=RpWaqhiUlejS3J/Mss/WqNQzmK
 p8WpSGdDVWNVG1iv3jhlq6BCJgvWzMK5vjkX2eWoPW+mB5NOQdzCGdchJMamyxQXKXTsf+34w3Bcy
 3fYUmOAEBwTmYN7yhJ4X+RsC2nSfOKru2fRxRrpe972KBdw416+JV8S8twSpXvi3BquA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y/leVQOesvX/XM3KBnx/PYz9Cg0b/e+gYJOVe+q4Tjk=; b=cDuiH2jsYJ9+AFm1DWje00eAku
 8FjlcPvncyQLbhzHVJqXtzGdeJdQncK7DGUIKx7wj1/UogxDkswplrUNL+ecqjS92/CWzZyq2Wip+
 BD+u6NppiCK2RZ4V/rkabKkFdxFHxh8DxTRKehLtui+0LSBVGuMzzuls0UiE8Sif5BAw=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iCLIg-003uDg-OF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 10:10:36 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0A9FAF65;
 Mon, 23 Sep 2019 10:10:27 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 516001E4669; Mon, 23 Sep 2019 12:10:42 +0200 (CEST)
Date: Mon, 23 Sep 2019 12:10:42 +0200
From: Jan Kara <jack@suse.cz>
To: Goldwyn Rodrigues <rgoldwyn@suse.de>
Message-ID: <20190923101042.GA25332@quack2.suse.cz>
References: <20190911093926.pfkkx25mffzeuo32@alap3.anarazel.de>
 <20190911164517.16130-1-rgoldwyn@suse.de>
 <20190911164517.16130-3-rgoldwyn@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911164517.16130-3-rgoldwyn@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iCLIg-003uDg-OF
Subject: Re: [f2fs-dev] [PATCH 2/3] ext4: fix inode rwsem regression
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
Cc: Ted Tso <tytso@mit.edu>, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, andres@anarazel.de, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 11-09-19 11:45:16, Goldwyn Rodrigues wrote:
> From: Goldwyn Rodrigues <rgoldwyn@suse.com>
> 
> This is similar to 942491c9e6d6 ("xfs: fix AIM7 regression")
> Apparently our current rwsem code doesn't like doing the trylock, then
> lock for real scheme.  So change our read/write methods to just do the
> trylock for the RWF_NOWAIT case.
> 
> Fixes: 728fbc0e10b7 ("ext4: nowait aio support")
> Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>

Thanks for fixing this! The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

BTW, I've also added Ted as ext4 maintainer to CC.

								Honza

> ---
>  fs/ext4/file.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 70b0438dbc94..d5b2d0cc325d 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -40,11 +40,13 @@ static ssize_t ext4_dax_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	struct inode *inode = file_inode(iocb->ki_filp);
>  	ssize_t ret;
>  
> -	if (!inode_trylock_shared(inode)) {
> -		if (iocb->ki_flags & IOCB_NOWAIT)
> +	if (iocb->ki_flags & IOCB_NOWAIT) {
> +		if (!inode_trylock_shared(inode))
>  			return -EAGAIN;
> +	} else {
>  		inode_lock_shared(inode);
>  	}
> +
>  	/*
>  	 * Recheck under inode lock - at this point we are sure it cannot
>  	 * change anymore
> @@ -190,11 +192,13 @@ ext4_dax_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	struct inode *inode = file_inode(iocb->ki_filp);
>  	ssize_t ret;
>  
> -	if (!inode_trylock(inode)) {
> -		if (iocb->ki_flags & IOCB_NOWAIT)
> +	if (iocb->ki_flags & IOCB_NOWAIT) {
> +		if (!inode_trylock(inode))
>  			return -EAGAIN;
> +	} else {
>  		inode_lock(inode);
>  	}
> +
>  	ret = ext4_write_checks(iocb, from);
>  	if (ret <= 0)
>  		goto out;
> @@ -233,9 +237,10 @@ ext4_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	if (!o_direct && (iocb->ki_flags & IOCB_NOWAIT))
>  		return -EOPNOTSUPP;
>  
> -	if (!inode_trylock(inode)) {
> -		if (iocb->ki_flags & IOCB_NOWAIT)
> +	if (iocb->ki_flags & IOCB_NOWAIT) {
> +		if (!inode_trylock(inode))
>  			return -EAGAIN;
> +	} else {
>  		inode_lock(inode);
>  	}
>  
> -- 
> 2.16.4
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
