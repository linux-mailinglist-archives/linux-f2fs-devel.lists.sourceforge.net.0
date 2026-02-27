Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPGHDYgKomngyQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 22:20:08 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19B1BE23E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 22:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2NB+CeCKaQ7haBdjv2oOsfWkjqbk/LXJrO6XbGr7Q8=; b=L5fi7dYtfy7ymc2Thq0Alb9Xvc
	RTPaHPMw0z6a0om4watONjRyET329IeIe+DDBa+DOtiJSl6e46mzowQW/7Fbv4Q3lxR1Gj3FxFE2g
	EX17y1SCfT6eFJhY0u/Mv/PonwQ2onzbNPxcORq4LlFKwj9nu6uqTFlrXrdmr3yTkoA0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vw5Fg-0005Cm-Ld;
	Fri, 27 Feb 2026 21:20:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vw5Ff-0005Bz-Eq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 21:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MFrab5vb6a9/1fjQlnGw81bT7AUpJSZUb+9fm5X5Z88=; b=I4BgPJR2qtoacPvmd46eOKbvDL
 +WISE+OxB3iqOGd6rcjvd4cNmEAr3Us27C6mTDAy5KzgiKomEafdTy3mDmfIoDQPZ4gY7I4IvtwSG
 XaYGHYMcb6KAzp/LfoxEM+cB9/82+J6S0suQhBz06696sKO26+1rAjk8Q2xU2BjtBOdE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MFrab5vb6a9/1fjQlnGw81bT7AUpJSZUb+9fm5X5Z88=; b=UFF87dEC4yKp1Rih/JBrkTr/iR
 MflX+PE+96xrbXUfXfD6317cEpZI1Ze88cRLZqZZ13SnEUqe28NsN4N/3JEH08m+H/7X5gNn3Gx6n
 2zLDj2XSksoslx9ws6AWJObeGUlKLYWTdCqKrU/vtNjqDz7VCxtYgIO/MTgs9YMmW6iI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vw5Ff-0005m7-Rs for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 21:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 354F760054;
 Fri, 27 Feb 2026 21:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC96C116C6;
 Fri, 27 Feb 2026 21:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772227188;
 bh=Kvs5P33YIXdgJf3Lcw25vKTvkt/GPz9KIPs0Cf5crxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vJRc/doN6phbnIWDai/y3CWyvsokFyCaqcmB304gJoKtKbEBMJTOSWloHulmUadaG
 fLkS9C7DmNUxzi9YYFLhkq0z+jaI0/sFQdNTuhcnTgofkE2qyp55hXJijxxSbeXZ+d
 AMjSM27vZXcY4LpqpMQ0s57DKM0DvWbN8yq7uuX5guuZbul8IXxV2YKatUHDWxb9YO
 9HDyVHdBXDmIJKwl75bWcT+diUka8bNAA4AZSGcQsnlGlNU28Eim1vGSQADYD8toBc
 zg8PfPPBKREplTsXB1MHBW1rQRImel1oauXxCFiJ/RCxg2Jbej52BxvLPyo+n83Z9S
 u7jQdu1AZTBhQ==
Date: Fri, 27 Feb 2026 13:19:46 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260227211946.GB2659@quark>
References: <20260226144954.142278-1-hch@lst.de>
 <20260226144954.142278-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226144954.142278-3-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 26, 2026 at 06:49:22AM -0800, Christoph Hellwig
 wrote: > io_submit_init_bio already has or can easily get at most information
 > needed to set the crypto context. Open code fscrypt_set_bio_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vw5Ff-0005m7-Rs
Subject: Re: [f2fs-dev] [PATCH 02/14] ext4: open code
 fscrypt_set_bio_crypt_ctx_bh
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email]
X-Rspamd-Queue-Id: 7E19B1BE23E
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 06:49:22AM -0800, Christoph Hellwig wrote:
> io_submit_init_bio already has or can easily get at most information
> needed to set the crypto context.  Open code fscrypt_set_bio_crypt_ctx_bh
> based on that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ext4/page-io.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
> index a3644d6cb65f..851d1267054a 100644
> --- a/fs/ext4/page-io.c
> +++ b/fs/ext4/page-io.c
> @@ -417,6 +417,7 @@ void ext4_io_submit_init(struct ext4_io_submit *io,
>  
>  static void io_submit_init_bio(struct ext4_io_submit *io,
>  			       struct inode *inode,
> +			       struct folio *io_folio,
>  			       struct buffer_head *bh)
>  {
>  	struct bio *bio;
> @@ -426,7 +427,10 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
>  	 * __GFP_DIRECT_RECLAIM is set, see comments for bio_alloc_bioset().
>  	 */
>  	bio = bio_alloc(bh->b_bdev, BIO_MAX_VECS, REQ_OP_WRITE, GFP_NOIO);
> -	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
> +	fscrypt_set_bio_crypt_ctx(bio, inode,
> +			(folio_pos(io_folio) + bh_offset(bh)) >>
> +				inode->i_blkbits,
> +			GFP_NOIO);
>  	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
>  	bio->bi_end_io = ext4_end_bio;
>  	bio->bi_private = ext4_get_io_end(io->io_end);
> @@ -448,7 +452,7 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
>  		ext4_io_submit(io);
>  	}
>  	if (io->io_bio == NULL)
> -		io_submit_init_bio(io, inode, bh);
> +		io_submit_init_bio(io, inode, io_folio, bh);
>  	if (!bio_add_folio(io->io_bio, io_folio, bh->b_size, bh_offset(bh)))
>  		goto submit_and_retry;

This should use 'folio', not 'io_folio'.  folio_pos() works only for
pagecache folios.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
