Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKhtOj0Lomk2ygQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 22:23:09 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 334991BE275
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 22:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZbxee3K9mAT/XLsDutFi3cG7cfeaSEfpKuprNU37CE=; b=N6KtTdY6Kzqsd2wjsZSKa9sakB
	Q3OuOGCkdOFU3C/AIK9lZm6UE6ItxnlnvA4386xY+71YDc+drzx5z3g4xEwr4UGYgq4JHIBDtRmpr
	lAGcS5BSiCSILzZtnXh9OS7UmJixjJBpJ6b6rMMvU5GIb/OnLfvmk0Up4X1M+gowyLBY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vw5Ie-0001bD-P8;
	Fri, 27 Feb 2026 21:23:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vw5Id-0001b5-PF
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 21:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OJh02u0NQVRUdBw4Dur+TyDu1G94ovO5DActNFkg/38=; b=gMmtq7l93ocv2wFHPDbEX1Rx7a
 042LlGWtqMcx9kesNNLSw7H3aLddrw+/1AZA0V26hd9Ft2kPMhHeb3QtJgKaB+BXRdc/BzL/sDKGe
 mXSXlPh+6GaY4NxeBoKRrq1HHqH4pWE9r/yt/tYUdq4Ky1yeHAvjSRPb7akvrSULp29w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OJh02u0NQVRUdBw4Dur+TyDu1G94ovO5DActNFkg/38=; b=GI6Uq1GtcF/O+HhiQMlSMau7dI
 aTI4d9+IybSwdt3F4TGTpiFPqQ7QqTTmqxwqG1Im30Z+Ksxog8kViyUJP2xzCHvCs4gK4NAuL3OXk
 mx14E2s4rU6RM0W0xzG287+G7Gxgx4z38X3/aZdQfzaX97bMhx9oYAoTX9Qrlc4MyrUI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vw5Id-0005yD-8L for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 21:23:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4FC686012B;
 Fri, 27 Feb 2026 21:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263E2C116C6;
 Fri, 27 Feb 2026 21:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772227372;
 bh=gdzxoUn2gxhPxqAZE2wnuoB0K0GDDb9MlkGqZ/c6Edk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IG+0YFYYtUAUb+23rDHJYKFU8SK8o4070YARNt9N3Nj/qUn8Tq4dktYf6wZ2hqh06
 XZ8a5Cn7X4z2JY9gO7rFXYkCWHQDGqwWj4g28PUrzC46IgrG3tiir7tJuMpitY3gNg
 RFBwdzNFVmzfn969s0VhfYuE3DZx7QEMoBPM79w4+3acu0XOmfwxQ+sWyPRIt1BOvG
 t8h+rI7Cwfb3oqGHY5imm4je2+mBpxC0aBImRggF9jqarNyydQIe7IRUhtNxhZP1lX
 ErT/H4J8H8hSiZ0ehxMQK1LYebJMjhBIXoqqs8YjQurzDS3+I/RLRWj3sU540OtjDX
 rfm0CrtjlGykQ==
Date: Fri, 27 Feb 2026 13:22:47 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260227212247.GC2659@quark>
References: <20260226144954.142278-1-hch@lst.de>
 <20260226144954.142278-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226144954.142278-5-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 26, 2026 at 06:49:24AM -0800, Christoph Hellwig
 wrote: > ext4 already has the inode and folio and can't have a NULL >
 folio->mapping
 in this path. Open code fscrypt_mergeable_bio_bh in > i [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vw5Id-0005yD-8L
Subject: Re: [f2fs-dev] [PATCH 04/14] ext4,
 fscrypt: merge fscrypt_mergeable_bio_bh into io_submit_need_new_bio
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 334991BE275
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 06:49:24AM -0800, Christoph Hellwig wrote:
> ext4 already has the inode and folio and can't have a NULL
> folio->mapping in this path. Open code fscrypt_mergeable_bio_bh in
> io_submit_need_new_bio based on these simplifying assumptions.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/crypto/inline_crypt.c | 23 -----------------------
>  fs/ext4/page-io.c        |  8 ++++++--
>  include/linux/fscrypt.h  |  9 ---------
>  3 files changed, 6 insertions(+), 34 deletions(-)
> 
> diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
> index c0852b920dbc..0da53956a9b1 100644
> --- a/fs/crypto/inline_crypt.c
> +++ b/fs/crypto/inline_crypt.c
> @@ -406,29 +406,6 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
>  }
>  EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio);
>  
> -/**
> - * fscrypt_mergeable_bio_bh() - test whether data can be added to a bio
> - * @bio: the bio being built up
> - * @next_bh: the next buffer_head for which I/O will be submitted
> - *
> - * Same as fscrypt_mergeable_bio(), except this takes a buffer_head instead of
> - * an inode and block number directly.
> - *
> - * Return: true iff the I/O is mergeable
> - */
> -bool fscrypt_mergeable_bio_bh(struct bio *bio,
> -			      const struct buffer_head *next_bh)
> -{
> -	const struct inode *inode;
> -	u64 next_lblk;
> -
> -	if (!bh_get_inode_and_lblk_num(next_bh, &inode, &next_lblk))
> -		return !bio->bi_crypt_context;
> -
> -	return fscrypt_mergeable_bio(bio, inode, next_lblk);
> -}
> -EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
> -
>  /**
>   * fscrypt_dio_supported() - check whether DIO (direct I/O) is supported on an
>   *			     inode, as far as encryption is concerned
> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
> index 88226979c503..3db3c19a29e5 100644
> --- a/fs/ext4/page-io.c
> +++ b/fs/ext4/page-io.c
> @@ -441,11 +441,15 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
>  }
>  
>  static bool io_submit_need_new_bio(struct ext4_io_submit *io,
> +				   struct inode *inode,
> +				   struct folio *io_folio,
>  				   struct buffer_head *bh)
>  {
>  	if (bh->b_blocknr != io->io_next_block)
>  		return true;
> -	if (!fscrypt_mergeable_bio_bh(io->io_bio, bh))
> +	if (!fscrypt_mergeable_bio(io->io_bio, inode,
> +			(folio_pos(io_folio) + bh_offset(bh)) >>
> +			 inode->i_blkbits))
>  		return true;
>  	return false;
>  }
> @@ -456,7 +460,7 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
>  			     struct folio *io_folio,
>  			     struct buffer_head *bh)
>  {
> -	if (io->io_bio && io_submit_need_new_bio(io, bh)) {
> +	if (io->io_bio && io_submit_need_new_bio(io, inode, io_folio, bh)) {
>  submit_and_retry:
>  		ext4_io_submit(io);
>  	}

As in patch 2, this needs to use 'folio', not 'io_folio'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
