Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 735092531A9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Aug 2020 16:44:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kAweW-0001Zq-7v; Wed, 26 Aug 2020 14:43:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kAweU-0001ZY-Ot
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Aug 2020 14:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5+qtskjr3f0uw7MAukdMX7YXrVmQwia/EW4XdMS8O1E=; b=DPkQwD8WEagaNPCt6uu3aEc2Fx
 urM+ZaupvRtgwEJqlHcngLcWpGwd/0Z4dgy1v6XYzBxt+RukxlB5ZfqleVARaU5UTMEanObvzkgyE
 /HubZcW80MepsTD4qmvKOik7Dv1aC1SRFvsR9q4seyRzyS7SzD5Wgx/WRwZcCs+GRX4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5+qtskjr3f0uw7MAukdMX7YXrVmQwia/EW4XdMS8O1E=; b=da+oDUaqwLz+LYeRa48mcywLSt
 /D8eoNOysNSwbvZteG/F24ZWlk+0iPfF1FMrKOus8amuhsT3lI1dHQLVtVojrVSLV7Al+iDO5BxNZ
 8EM/HvFc5wWXljm9usjU3lMVXc1OCzTzbAGJ00gNMpm2t8DkFkGAMgafedoebos7xpQE=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kAweT-001N2g-0t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Aug 2020 14:43:50 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0627AC46;
 Wed, 26 Aug 2020 14:29:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id DE0881E12AF; Wed, 26 Aug 2020 16:28:57 +0200 (CEST)
Date: Wed, 26 Aug 2020 16:28:57 +0200
From: Jan Kara <jack@suse.cz>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200826142857.GA8760@quack2.suse.cz>
References: <20200819200731.2972195-1-krisman@collabora.com>
 <20200819200731.2972195-2-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819200731.2972195-2-krisman@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kAweT-001N2g-0t
Subject: Re: [f2fs-dev] [PATCH 1/2] direct-io: defer alignment check until
 after EOF check
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
Cc: Jamie Liu <jamieliu@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 19-08-20 16:07:30, Gabriel Krisman Bertazi wrote:
> From: Jamie Liu <jamieliu@google.com>
> 
> Prior to commit 9fe55eea7e4b ("Fix race when checking i_size on direct
> i/o read"), an unaligned direct read past end of file would trigger EOF,
> since generic_file_aio_read detected this read-at-EOF condition and
> skipped the direct IO read entirely, returning 0. After that change, the
> read now reaches dio_generic, which detects the misalignment and returns
> EINVAL.
> 
> This consolidates the generic direct-io to follow the same behavior of
> filesystems.  Apparently, this fix will only affect ocfs2 since other
> filesystems do this verification before calling do_blockdev_direct_IO,
> with the exception of f2fs, which has the same bug, but is fixed in the
> next patch.
> 
> it can be verified by a read loop on a file that does a partial read
> before EOF (On file that doesn't end at an aligned address).  The
> following code fails on an unaligned file on filesystems without
> prior validation without this patch, but not on btrfs, ext4, and xfs.
> 
>   while (done < total) {
>     ssize_t delta = pread(fd, buf + done, total - done, off + done);
>     if (!delta)
>       break;
>     ...
>   }
> 
> Fix this regression by moving the misalignment check to after the EOF
> check added by commit 74cedf9b6c60 ("direct-io: Fix negative return from
> dio read beyond eof").
> 
> Signed-off-by: Jamie Liu <jamieliu@google.com>
> Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Looks sane to me but I'd note that your patch also makes unaligned 0-length
reads succeed (probably don't care). Also your patch makes unaligned DIO reads
write-out page cache before returning EINVAL - that actually looks a bit
strange. Not that it would be outright bug but it seems strange to wait
couple of seconds doing writeback only to return EINVAL... So I'd maybe
restructure the code like:

	if (dio->flags & DIO_LOCKING && iov_iter_rw(iter) == READ)
		inode_lock(inode)
	dio->i_size = i_size_read(inode);
	... i_size checks ...
	... alignment checks ...
	if (dio->flags & DIO_LOCKING && iov_iter_rw(iter) == READ)
		... writeout ...

What do you think?
								Honza

> ---
>  fs/direct-io.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/direct-io.c b/fs/direct-io.c
> index 183299892465..77400b033d63 100644
> --- a/fs/direct-io.c
> +++ b/fs/direct-io.c
> @@ -1160,19 +1160,6 @@ do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
>  	struct blk_plug plug;
>  	unsigned long align = offset | iov_iter_alignment(iter);
>  
> -	/*
> -	 * Avoid references to bdev if not absolutely needed to give
> -	 * the early prefetch in the caller enough time.
> -	 */
> -
> -	if (align & blocksize_mask) {
> -		if (bdev)
> -			blkbits = blksize_bits(bdev_logical_block_size(bdev));
> -		blocksize_mask = (1 << blkbits) - 1;
> -		if (align & blocksize_mask)
> -			goto out;
> -	}
> -
>  	/* watch out for a 0 len io from a tricksy fs */
>  	if (iov_iter_rw(iter) == READ && !count)
>  		return 0;
> @@ -1217,6 +1204,24 @@ do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
>  		goto out;
>  	}
>  
> +	/*
> +	 * Avoid references to bdev if not absolutely needed to give
> +	 * the early prefetch in the caller enough time.
> +	 */
> +
> +	if (align & blocksize_mask) {
> +		if (bdev)
> +			blkbits = blksize_bits(bdev_logical_block_size(bdev));
> +		blocksize_mask = (1 << blkbits) - 1;
> +		if (align & blocksize_mask) {
> +			if (iov_iter_rw(iter) == READ && dio->flags & DIO_LOCKING)
> +				inode_unlock(inode);
> +			kmem_cache_free(dio_cache, dio);
> +			retval = -EINVAL;
> +			goto out;
> +		}
> +	}
> +
>  	/*
>  	 * For file extending writes updating i_size before data writeouts
>  	 * complete can expose uninitialized blocks in dumb filesystems.
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
