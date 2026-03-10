Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIG0GRJyr2m6YQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:21:22 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F4B2437C2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3a/ZGl8bBxz3Bw3kWX477zAmB3qcmqqBdn8dhzrqJGE=; b=WcsJ6FFEJjNLTxowSTToprTRAY
	ThwQICeDr10fpkX2TpS1zJThR4FGKTHwSGJuu78XBvvsn+peylyvlmeBllurYQwvpaKoOTDv0DGDd
	mi1QHnYvpV0g3rx1MWM49bwdpvpJNxf4QqoghxAvszPI/01ixoAL1a+UimB/rWVugG3w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzlmd-0001BP-SQ;
	Tue, 10 Mar 2026 01:21:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzlmc-0001BG-7A
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ue/+4vugTbsUA3av1O8LJ52peEBND5xVtdJjGtbeAKU=; b=GAzV4gJqklTZXmrCAmEilsoaSH
 BG13N/2O7mZnRg26+O8BF5ZNgw9IJJ/GPwdFMaL7Z/KJzWOmSshDvvyV/d2B+zlN+h8md3ueacJMs
 bC+BinAsWRbFOS2Va7AJL2KMn6i16+N+j5fF46clrgGvLq4lQloE6rHkVPYqjnAyD09o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ue/+4vugTbsUA3av1O8LJ52peEBND5xVtdJjGtbeAKU=; b=DhasVYns/LgME2c5Yx7i9uGN5y
 0sk4l62MsLxUDgfyq/XVbwooMP5Sk51xtCIaEOU/aYk9fKtPs2Qt2gBB7+iEi0yvbs5Iex2ODz7kI
 GEUkbPgHnsN25HutuzyypSKgGvLccs3ESETpOwB7kLDcKzVTeRh1J9euzGWVu2l+Y4kw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzlmb-0007rT-Jr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F23D860054;
 Tue, 10 Mar 2026 01:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E068C4CEF7;
 Tue, 10 Mar 2026 01:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773105667;
 bh=oA3hK8MkgazMf9tD9rTUUnpBrKcDiBaGBl2eU5JNzeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=asENmNkriGpocEWNYAgWuB6DQpx8xLvAGRSfYVvjG0mQMp+SaRM+WrgOTQX1O/tx4
 0m2ZhZ2HCLJzi7+dENZ/PfAuQ0purdd3bdWpeFa6jT2tM5Z9oVSKsNhwKX7YUgM+GS
 tq1VOmC/nXWCpK8GpYlCm5ZvrGCiAVQ+6yXc1wYSCCftGv8XBvJxBRZott4rZEVmVy
 jfwD3e/b479yj0hoxGb9o2gZomxcDQ927PlBzy7ybcV0iJnAn9LcY1dbPkCMin6yNY
 Rf7wpuS+Jl/OVs9aCLKLOKQxvJ6HjUA3+YCffePiMZ/6xRtlMpAE+MbNcONU7it8zJ
 ku4E8vFro6ahg==
Date: Mon, 9 Mar 2026 18:21:05 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310012105.GE1105363@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-18-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-18-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:32PM +0100, Andrey Albershteyn
 wrote: > Use read ioends for fsverity verification. Do not issues fsverity
 > metadata I/O through the same workqueue due to risk of a deadl [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzlmb-0007rT-Jr
Subject: Re: [f2fs-dev] [PATCH v4 17/25] xfs: use read ioend for fsverity
 data verification
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B0F4B2437C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:23:32PM +0100, Andrey Albershteyn wrote:
> Use read ioends for fsverity verification. Do not issues fsverity
> metadata I/O through the same workqueue due to risk of a deadlock by a
> filled workqueue.
> 
> Pass fsverity_info from iomap context down to the ioend as hashtable
> lookups are expensive.
> 
> Add a simple helper to check that this is not fsverity metadata but file
> data that needs verification.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/xfs/xfs_aops.c     | 32 ++++++++++++++++++++++++--------
>  fs/xfs/xfs_fsverity.c | 11 +++++++++++
>  fs/xfs/xfs_fsverity.h |  6 ++++++
>  3 files changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index 9503252a0fa4..4e3dcc4a321d 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -24,6 +24,7 @@
>  #include "xfs_rtgroup.h"
>  #include "xfs_fsverity.h"
>  #include <linux/bio-integrity.h>
> +#include <linux/fsverity.h>
>  
>  struct xfs_writepage_ctx {
>  	struct iomap_writepage_ctx ctx;
> @@ -204,11 +205,15 @@ xfs_end_io(
>  			io_list))) {
>  		list_del_init(&ioend->io_list);
>  		iomap_ioend_try_merge(ioend, &tmp);
> -		if (bio_op(&ioend->io_bio) == REQ_OP_READ)
> +		if (bio_op(&ioend->io_bio) == REQ_OP_READ) {
> +			if (xfs_fsverity_is_file_data(ip, ioend->io_offset))
> +				fsverity_verify_bio(ioend->io_vi,
> +						    &ioend->io_bio);
>  			iomap_finish_ioends(ioend,
>  				blk_status_to_errno(ioend->io_bio.bi_status));
> -		else
> +		} else {
>  			xfs_end_ioend_write(ioend);
> +		}
>  		cond_resched();
>  	}
>  }
> @@ -232,9 +237,14 @@ xfs_end_bio(
>  	}
>  
>  	spin_lock_irqsave(&ip->i_ioend_lock, flags);
> -	if (list_empty(&ip->i_ioend_list))
> -		WARN_ON_ONCE(!queue_work(mp->m_unwritten_workqueue,
> +	if (list_empty(&ip->i_ioend_list)) {
> +		if (IS_ENABLED(CONFIG_FS_VERITY) && ioend->io_vi &&
> +		    ioend->io_offset < xfs_fsverity_metadata_offset(ip))
> +			fsverity_enqueue_verify_work(&ip->i_ioend_work);

I think the fsverity metadata (merkle tree & descriptor) don't need any
(read) ioend completion work since all we're doing is reading that into
the pagecache and eventually fsverity will go look at those contents
when it wants to verify some actual file data, right?

If the answer is 'yes' then I've understood this well enough to say
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> +		else
> +			WARN_ON_ONCE(!queue_work(mp->m_unwritten_workqueue,
>  					 &ip->i_ioend_work));
> +	}
>  	list_add_tail(&ioend->io_list, &ip->i_ioend_list);
>  	spin_unlock_irqrestore(&ip->i_ioend_lock, flags);
>  }
> @@ -764,9 +774,12 @@ xfs_bio_submit_read(
>  	struct iomap_read_folio_ctx	*ctx)
>  {
>  	struct bio			*bio = ctx->read_ctx;
> +	struct iomap_ioend		*ioend;
>  
>  	/* defer read completions to the ioend workqueue */
> -	iomap_init_ioend(iter->inode, bio, ctx->read_ctx_file_offset, 0);
> +	ioend = iomap_init_ioend(iter->inode, bio, ctx->read_ctx_file_offset, 0);
> +	ioend->io_vi = ctx->vi;
> +
>  	bio->bi_end_io = xfs_end_bio;
>  	submit_bio(bio);
>  }
> @@ -779,12 +792,15 @@ static const struct iomap_read_ops xfs_iomap_read_ops = {
>  
>  static inline const struct iomap_read_ops *
>  xfs_get_iomap_read_ops(
> -	const struct address_space	*mapping)
> +	const struct address_space	*mapping,
> +	loff_t				position)
>  {
>  	struct xfs_inode		*ip = XFS_I(mapping->host);
>  
>  	if (bdev_has_integrity_csum(xfs_inode_buftarg(ip)->bt_bdev))
>  		return &xfs_iomap_read_ops;
> +	if (xfs_fsverity_is_file_data(ip, position))
> +		return &xfs_iomap_read_ops;
>  	return &iomap_bio_read_ops;
>  }
>  
> @@ -795,7 +811,7 @@ xfs_vm_read_folio(
>  {
>  	struct iomap_read_folio_ctx	ctx = { .cur_folio = folio };
>  
> -	ctx.ops = xfs_get_iomap_read_ops(folio->mapping);
> +	ctx.ops = xfs_get_iomap_read_ops(folio->mapping, folio_pos(folio));
>  	iomap_read_folio(&xfs_read_iomap_ops, &ctx, NULL);
>  	return 0;
>  }
> @@ -806,7 +822,7 @@ xfs_vm_readahead(
>  {
>  	struct iomap_read_folio_ctx	ctx = { .rac = rac };
>  
> -	ctx.ops = xfs_get_iomap_read_ops(rac->mapping),
> +	ctx.ops = xfs_get_iomap_read_ops(rac->mapping, readahead_pos(rac));
>  	iomap_readahead(&xfs_read_iomap_ops, &ctx, NULL);
>  }
>  
> diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
> index bc6020cc6e41..dc66ffb7d132 100644
> --- a/fs/xfs/xfs_fsverity.c
> +++ b/fs/xfs/xfs_fsverity.c
> @@ -32,3 +32,14 @@ xfs_fsverity_metadata_offset(
>  {
>  	return round_up(i_size_read(VFS_IC(ip)), 65536);
>  }
> +
> +bool
> +xfs_fsverity_is_file_data(
> +	const struct xfs_inode	*ip,
> +	loff_t			offset)
> +{
> +	const struct inode	*inode = VFS_IC(ip);
> +
> +	return fsverity_active(inode) &&
> +	       offset < xfs_fsverity_metadata_offset(ip);
> +}
> diff --git a/fs/xfs/xfs_fsverity.h b/fs/xfs/xfs_fsverity.h
> index 5771db2cd797..ec77ba571106 100644
> --- a/fs/xfs/xfs_fsverity.h
> +++ b/fs/xfs/xfs_fsverity.h
> @@ -9,12 +9,18 @@
>  
>  #ifdef CONFIG_FS_VERITY
>  loff_t xfs_fsverity_metadata_offset(const struct xfs_inode *ip);
> +bool xfs_fsverity_is_file_data(const struct xfs_inode *ip, loff_t offset);
>  #else
>  static inline loff_t xfs_fsverity_metadata_offset(const struct xfs_inode *ip)
>  {
>  	WARN_ON_ONCE(1);
>  	return ULLONG_MAX;
>  }
> +static inline bool xfs_fsverity_is_file_data(const struct xfs_inode *ip,
> +					    loff_t offset)
> +{
> +	return false;
> +}
>  #endif	/* CONFIG_FS_VERITY */
>  
>  #endif	/* __XFS_FSVERITY_H__ */
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
