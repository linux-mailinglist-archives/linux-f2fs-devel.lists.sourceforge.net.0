Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK8YFHTgr2nkdAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 10:12:20 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EE2248094
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 10:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ENVAfmWvzn1b70OMAgmhNVwamV4fXVKXsxtoofbr/o=; b=kAazelGRnuWzkzSQZ4r6VMIIB2
	2CSRQqonO/EAwOo+M+UxhViu7PrtNywS6A8LJhq8eGq2mLu8U7jz6fm541O6bkIRQaneN+i0YLZ/F
	KDKvBxMHYczg2SdFre4ucyQZoKo5y6jsStavxPl6n1JtYRpgC+1ogHbziJdcCovnbQt4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzt8I-0003IX-Jl;
	Tue, 10 Mar 2026 09:12:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vzt7z-0003H0-Et
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 09:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LE2RxnyN/jDRTJaRtTBPD/kfuAhDiKppFDljYTHjPJU=; b=bdK4l7EmvenH2Ep0HhkIBjS5Mq
 yZHOkdPhYMJelH7wvD13S1X6jPfbRG6mRiIDzLumzbh58IZuGFTfXZRx8qOIO6LrKgoSahcBbG/Ad
 g/0N+6yzLlLcrTkxOoQ7eu8CRkNsYifi3HoIyHj2xepvNEwPrbmgj0iDz9dr2rqx9qvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LE2RxnyN/jDRTJaRtTBPD/kfuAhDiKppFDljYTHjPJU=; b=Dr3/iwxXrcgdjnct0+/2tBF79Z
 vSBA9e4KYG6qfpnLmHHmN2NzaOy6pAoUdy7pZGhskxr4MFxo6hueMGKcT9hBkq7E2kFD5wPVSpB/t
 mLO0aX66OpAbxeTEixzwwNUvCjmFUaXESYvhOsMiOIgwduDfMa2Nrdm70bqHiZp7J0nk=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzt7z-0001c0-OA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 09:11:48 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id AB17168C4E; Tue, 10 Mar 2026 10:11:38 +0100 (CET)
Date: Tue, 10 Mar 2026 10:11:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310091136.GA18959@lst.de>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-18-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-18-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:32PM +0100, Andrey Albershteyn
 wrote: > - if (bio_op(&ioend->io_bio) == REQ_OP_READ) > + if
 (bio_op(&ioend->io_bio)
 == REQ_OP_READ) { > + if (xfs_fsverity_is_file_data(ip [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vzt7z-0001c0-OA
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
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 02EE2248094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:23:32PM +0100, Andrey Albershteyn wrote:
> -		if (bio_op(&ioend->io_bio) == REQ_OP_READ)
> +		if (bio_op(&ioend->io_bio) == REQ_OP_READ) {
> +			if (xfs_fsverity_is_file_data(ip, ioend->io_offset))
> +				fsverity_verify_bio(ioend->io_vi,
> +						    &ioend->io_bio);
>  			iomap_finish_ioends(ioend,
>  				blk_status_to_errno(ioend->io_bio.bi_status));

If bi_status is non-zero, there is no point in doing the verification.

> -		else
> +		} else {
>  			xfs_end_ioend_write(ioend);
> +		}

Also now that the code is non-trivial I'd add a xfs_end_ioend_read
mirroring xfs_end_ioend_write.

> @@ -764,9 +774,12 @@ xfs_bio_submit_read(
>  	struct iomap_read_folio_ctx	*ctx)
>  {
>  	struct bio			*bio = ctx->read_ctx;
> +	struct iomap_ioend		*ioend;
>  
>  	/* defer read completions to the ioend workqueue */
> -	iomap_init_ioend(iter->inode, bio, ctx->read_ctx_file_offset, 0);
> +	ioend = iomap_init_ioend(iter->inode, bio, ctx->read_ctx_file_offset, 0);

Overly long line.

>  	if (bdev_has_integrity_csum(xfs_inode_buftarg(ip)->bt_bdev))
>  		return &xfs_iomap_read_ops;
> +	if (xfs_fsverity_is_file_data(ip, position))
> +		return &xfs_iomap_read_ops;

use || here instead of two checks?

> +{
> +	const struct inode	*inode = VFS_IC(ip);
> +
> +	return fsverity_active(inode) &&
> +	       offset < xfs_fsverity_metadata_offset(ip);

Just open code the XFS_IC instead of a single use local variable?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
