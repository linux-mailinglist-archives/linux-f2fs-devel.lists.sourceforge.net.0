Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMa2GmQxdWmrBwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Jan 2026 21:53:56 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8531B7EF8F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Jan 2026 21:53:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFq66RlT4MGMoCIPmShR5HnUhnD1JaG3bGyJ0a3v11U=; b=LcpeI6hRcG1fLTFzS1JNCC0+Pn
	WeFXRZOvF4Fjow6z2OZePrLt8ai/BwpUe/1CAGOGIid0lezTRo3BLfcEYa0Y0BCvgG2dydExBiccs
	mpKM1tKPdC5ukKGQ79fNZPrcXwV4wB5fOrfESPj/HGbO2IRk/xOfGjKEcV4ePA3Q1BqY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjkdf-0006qg-S2;
	Sat, 24 Jan 2026 20:53:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vjkde-0006qW-0b
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Jan 2026 20:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Aq2/f4e74mPU1lJLpS1IkpMgZuo97fFzjhsVz1rqSlA=; b=EVSNZHlgEDzxkqct/hHFcPu6lf
 7Xk9oQh4hZYQGJiFmCN3gEGTu26lp48C3S1iuaNfhCr5cf/+97lK4c1OEXggRmCQewHSXXo2eYLhQ
 AX+h0xk6NPcxVFE1H49N5O8Vi+m+McpGSwn7Ge1DgpXbkufk/CtZyOS66agbTKAnCSsc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Aq2/f4e74mPU1lJLpS1IkpMgZuo97fFzjhsVz1rqSlA=; b=QuYC2QIFP5k3lf9yRegtzTYX8j
 CXo0bPr57yB9FrCKHRIatETNBswBiRB4MeAaP7Tlz3Ab4ieCBVEPsG2RVXPHFiX2neZsbFz95FxLw
 4/C8i+LMPT/i0ASdFoc544FrGyDqQsCGk00tQ9vb6Zw2EYF+4YK9y8JUy645zdVPPlN0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjkdd-0006h5-Eq for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Jan 2026 20:53:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 14984443CB;
 Sat, 24 Jan 2026 20:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75893C19421;
 Sat, 24 Jan 2026 20:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769288019;
 bh=+z7P8o/2AvAS2HxAhMpt7l6mG9q9YNMOg7B1XIrmpiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jrnYUkgMgLh95HZVEGLxtKpEEPIJ9i+kCGXVczoDgweCyruT+jbNyrNC0ntS8jKe/
 h8ekQd3zwR8Z4KEvr4QksVUdZcFlsWQ9nPDrmgjbA7hghI6ep4soiakTKR6jaQpXPK
 C0h504KGR/6MLiq82fhUImEg0m7xb/afNx7buBCXCrZHaw9Z4/qC68d5tYpzvWWZrO
 x7W2QAcFNv/NYmm5JQ54O/qlmWpChFUAs/IBBUvBhftkiCO8o0TDWOa5e7M+/S9zTp
 yIWglfmCgF3A6YNHzKFcoFihtN7UU1tZPF88iH9op2/GsFRkvLaHbCCFHjwa5pJ1iX
 kcddSF2E6YUNQ==
Date: Sat, 24 Jan 2026 12:53:29 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260124205329.GE2762@quark>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-6-hch@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 09:22:01AM +0100, Christoph Hellwig
 wrote: > +/** > + * generic_readahead_merkle_tree() - generic
 ->readahead_merkle_tree
 helper > + * @inode: inode containing the Merkle tree [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vjkdd-0006h5-Eq
Subject: Re: [f2fs-dev] [PATCH 05/11] fsverity: kick off hash readahead at
 data I/O submission time
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: 8531B7EF8F
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:22:01AM +0100, Christoph Hellwig wrote:
> +/**
> + * generic_readahead_merkle_tree() - generic ->readahead_merkle_tree helper
> + * @inode:	inode containing the Merkle tree
> + * @index:	0-based index of the first page to read ahead in the inode
> + * @nr_pages:	number of data pages to read ahead
> + *
> + * The caller needs to adjust @index from the Merkle-tree relative index passed
> + * to ->read_merkle_tree_page to the actual index where the Merkle tree is
> + * stored in the page cache for @inode.
> + */
> +void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
> +		unsigned long nr_pages)
>  {
>  	struct folio *folio;
>  
>  	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
> -	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
> +	if (PTR_ERR(folio) == -ENOENT || !folio_test_uptodate(folio)) {

This dereferences an ERR_PTR() when __filemap_get_folio() returns an
error other than -ENOENT.

> diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
> index cba5d6af4e04..430306abc4c6 100644
> --- a/fs/verity/read_metadata.c
> +++ b/fs/verity/read_metadata.c
> @@ -28,24 +28,24 @@ static int fsverity_read_merkle_tree(struct inode *inode,
>  	if (offset >= end_offset)
>  		return 0;
>  	offs_in_page = offset_in_page(offset);
> +	index = offset >> PAGE_SHIFT;
>  	last_index = (end_offset - 1) >> PAGE_SHIFT;
>  
> +	__fsverity_readahead(inode, vi, offset, last_index - index + 1);

This passes a position in the Merkle tree to a function that expects a
position in the file data.

I think the correct thing to do here would be the following:

        if (inode->i_sb->s_vop->readahead_merkle_tree)
		inode->i_sb->s_vop->readahead_merkle_tree(inode, index,
							  last_index - index + 1);

Then __fsverity_readahead() can be folded into fsverity_readahead().

> +void __fsverity_readahead(struct inode *inode, const struct fsverity_info *vi,
> +		loff_t data_start_pos, unsigned long nr_pages)
> +{
> +	const struct merkle_tree_params *params = &vi->tree_params;
> +	u64 start_hidx = data_start_pos >> params->log_blocksize;
> +	u64 end_hidx = (data_start_pos + ((nr_pages - 1) << PAGE_SHIFT)) >>
> +			params->log_blocksize;

(nr_pages - 1) << PAGE_SHIFT can overflow an 'unsigned long'.
(nr_pages - 1) needs to be cast to u64 before doing the shift.

But also it would make more sense to pass
(pgoff_t start_index, unsigned long nr_pages) instead of
(loff_t data_start_pos, unsigned long nr_pages),
so that the two numbers have the same units.

start_idx and end_hidx could then be computed as follows:

    u64 start_hidx = (u64)start_index << params->log_blocks_per_page;
    u64 end_hidx = (((u64)start_index + nr_pages) << params->log_blocks_per_page) - 1;

Note that fsverity_readahead() derives the position from the index.  If
it just used the index directly, that would be more direct.

> +	int level;
> +
> +	if (!inode->i_sb->s_vop->readahead_merkle_tree)
> +		return;
> +	if (unlikely(data_start_pos >= inode->i_size))
> +		return;

The check against i_size shouldn't be necessary: the caller should just
call this only for data it's actually going to read.

> +	for (level = 0; level < params->num_levels; level++) {
> +		unsigned long level_start = params->level_start[level];
> +		unsigned long next_start_hidx = start_hidx >> params->log_arity;
> +		unsigned long next_end_hidx = end_hidx >> params->log_arity;
> +		unsigned long start_idx = (level_start + next_start_hidx) >>
> +				params->log_blocks_per_page;
> +		unsigned long end_idx = (level_start + next_end_hidx) >>
> +				params->log_blocks_per_page;

start_idx and end_idx should have type pgoff_t to make it clear that
they're page indices.

> +EXPORT_SYMBOL_GPL(fsverity_readahead);

This should be below the definition of fsverity_readahead, not the
definition of __fsverity_readahead.

> +/**
> + * fsverity_readahead() - kick off readahead on fsverity hashes
> + * @folio:		first folio that is being read

folio => file data folio

Otherwise it can be confused with the Merkle tree.

> + * Start readahead on fsverity hashes.  To be called from the file systems
> + * ->read_folio and ->readahead methods to ensure that the hashes are
> + * already cached on completion of the file data read if possible.

Similarly, it would be helpful to clarify that the readahead is done on
the hashes *that will be needed to verify the specified file data*.
Otherwise it might sound like the caller is specifying the hashes to
readahead directly.

> +       /**
> +        * Perform readahad of a Merkle tree for the given inode.

readahad => readahead

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
