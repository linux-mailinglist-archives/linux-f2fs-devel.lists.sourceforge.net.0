Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGSdHEtur2m6YQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:05:15 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF213243456
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:05:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6f4IF84k4E32QcMViiPBcVznHG6bri5zs/u15WFiqKw=; b=lgA0f8a5rhkAauiZTTUnSWvLLJ
	bKU/G1CIzmgpWvvvhNkUjcwDTV+qTECQynZmLSGDe9+INHgssJiILaTDcfF8agVG39qIJI5MBHcC8
	H7XTPmiaCt8W5vSotxfPPR8YLa/143IOVY8ROZGE23Nv8HpEAr+osX1SqS9VZlZgXdVM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzlX5-0000hr-Jj;
	Tue, 10 Mar 2026 01:05:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzlX3-0000hi-Hw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uxcr7dLyY3YxupK60wGoqImoEx61xa9tUdxQ56SrSuA=; b=TPtCSIRmqVYpBXMUFnPisbBXLn
 vg1Fn8HyS58ZX1WKqr0FPjwoguKbFUEvWrB+LHeKunO0M7GeUqW8dY88LMRqy/gWcKyKviKO5LVY7
 R0+3By16gBoYklGOHDlP4sOWmjAw25uPyk4ya+4ShlnZbtvCz9ZiSj3Cyrq12izDvTZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uxcr7dLyY3YxupK60wGoqImoEx61xa9tUdxQ56SrSuA=; b=Hy4Y/Dk325i+lsY7p3psWrhVRb
 ywKyx10lCYmrSHiJoiNvLDRSPo03K2oKC4AYxHxpbm0G7szkQbbCZ3B/mUqiD16HsdkSTWPBDMRTt
 SAeYmuqESq+qLCZNWuO40zgk6wYXQSgDNvjxtjNSS9Al9v4lhJopTS9STt6jwOeZm+Sk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzlX2-0007Ec-O8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:05:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 53B52435BC;
 Tue, 10 Mar 2026 01:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE42C4CEF7;
 Tue, 10 Mar 2026 01:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773104703;
 bh=u6CMnuNY5RwqjHwe7VoD0sjIRo/Xi7apIs8nnxZUTlM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kBzU40a2H1q3Hf1sSr4uUscCm4/RxwfXHxcwTveop3CP5QU5jPovQWgAuO4nBCqlS
 jaOX/Ej0Oeyw1Dulq2AwhjmqDAUigZVGMwe1uzp8+HNZthbN0evXnzB0gDTHNfihhP
 28ITyfcW//2l0A+a3kviKcUCklQc2sSiIrqCBPQJ27ykW6dLxT47jdMpTCm5buRCVo
 Qne+Wln2pwpJ6qfXQy6CJ8A7xf1OM1rglOaSRxkbxnT6cQQPPmK3/GlAIExd9ff91W
 PB+YhXDBgzOtziYJQdf72HPU/yoDUXFgjD6XdwDSyN4yNLYfqXhJ+IpdwccJz1QKsd
 RlTARG4vrWgHg==
Date: Mon, 9 Mar 2026 18:05:02 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310010502.GB1105363@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-11-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-11-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:25PM +0100, Andrey Albershteyn
 wrote: > fsverity metadata has two kinds of holes - ones in merkle tree and
 one > after fsverity descriptor. > > Merkle tree holes are bloc [...] 
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
X-Headers-End: 1vzlX2-0007Ec-O8
Subject: Re: [f2fs-dev] [PATCH v4 10/25] iomap: teach iomap to handle
 fsverity holes and verify data holes
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
X-Rspamd-Queue-Id: BF213243456
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

On Mon, Mar 09, 2026 at 08:23:25PM +0100, Andrey Albershteyn wrote:
> fsverity metadata has two kinds of holes - ones in merkle tree and one
> after fsverity descriptor.
> 
> Merkle tree holes are blocks full of hashes of zeroed data blocks. These
> are not stored on the disk but synthesized on the fly. This saves a bit
> of space for sparse files. Due to this iomap also need to lookup
> fsverity_info for folios with fsverity metadata. ->vi has a hash of the
> zeroed data block which will be used to fill the merkle tree block. This
> patch extends lookup of fsverity_info from just for file data but also
> for merkle tree holes.
> 
> The hole past descriptor is interpreted as end of metadata region. As we
> don't have EOF here we use this hole as an indication that rest of the
> folio is empty. This patch marks rest of the folio beyond fsverity
> descriptor as uptodate.
> 
> For file data, fsverity needs to verify consistency of the whole file
> against the root hash, hashes of holes are included in the merkle tree.
> Verify them too.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/iomap/buffered-io.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 1d9481f00b41..31e39ab93a2e 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -542,9 +542,33 @@ static int iomap_read_folio_iter(struct iomap_iter *iter,
>  		if (plen == 0)
>  			return 0;
>  
> -		/* zero post-eof blocks as the page may be mapped */
> -		if (iomap_block_needs_zeroing(iter, pos)) {
> +		/*
> +		 * Handling of fsverity "holes". We hit this for two case:
> +		 *   1. No need to go further, the hole after fsverity
> +		 *	descriptor is the end of the fsverity metadata.
> +		 *
> +		 *   2. This folio contains merkle tree blocks which need to be
> +		 *	synthesized. If we already have fsverity info (ctx->vi)
> +		 *	synthesize these blocks.
> +		 */
> +		if ((iomap->flags & IOMAP_F_FSVERITY) &&
> +		    iomap->type == IOMAP_HOLE) {
> +			/*
> +			 * Don't cause lookup if we already have fsverity
> +			 * context from the previous tree hole
> +			 */
> +			if (!ctx->vi)
> +				ctx->vi = fsverity_get_info(iter->inode);
> +			if (ctx->vi)

Is it an error if ctx->vi isn't set here?  We won't fill the folio
with the zerohash, but we'll set uptodate anyway...

> +				fsverity_folio_zero_hash(folio, poff, plen,
> +							 ctx->vi);
> +			iomap_set_range_uptodate(folio, poff, plen);

...though I suppose it's the case that the uninitialized folio contents
will most likely cause fsverity to report data corruption so at least
it's obvious.

OTOH it does seem a little strange to set uptodate having not
initialized the folio contents.

--D

> +		} else if (iomap_block_needs_zeroing(iter, pos)) {
> +			/* zero post-eof blocks as the page may be mapped */
>  			folio_zero_range(folio, poff, plen);
> +			if (ctx->vi &&
> +			    !fsverity_verify_blocks(ctx->vi, folio, plen, poff))
> +				return -EIO;
>  			iomap_set_range_uptodate(folio, poff, plen);
>  		} else {
>  			if (!*bytes_submitted)
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
