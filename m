Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAU8C8accmkFnAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 22:55:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 756496DFA8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 22:55:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2vFMAUJbkkMXjBN90zUmKxVE3elkAJoxY12Fjy+sqc=; b=k6ht4iG1P2VRwEBW8fYUVLLLVA
	R3Ht7X3BMQqUDM0hvIbLEuX3fBelKYL5tmwA/yKTY9DrmgrMqw2jk74wod89flvscEVDMPDJSdTkD
	v3eO+bApi/FgmYyCkoZ2jc3qhV1FTzJZqks4maDmZtHulFdqQ+XvEqs6OkOcaioooHhk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj2dy-0003Ip-So;
	Thu, 22 Jan 2026 21:55:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vj2dx-0003Ih-BT
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 21:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uhuR8oca4mVhhlwCQcg/vO2B0DfdqhkDKyK4MdAOaNI=; b=hax0Qp2+v2HWpho/deyWHpHkWT
 0wCluAGb3svesGTh4HjfrCdgnl3cuJ4ejXY6X498HjaQRiCuxZcVQ6VASxZutZFHhz3u96w4T6tws
 uymrcCj59+XMoMDKwKof3ofAnCpKtBW+efydveYex03dfM9fc6NCs7CRwEliP+8WW2ho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uhuR8oca4mVhhlwCQcg/vO2B0DfdqhkDKyK4MdAOaNI=; b=RfFpA2FbOVPk0apzpzyfnJqFy1
 Y72LDj0VpCXQKRMVBdTACQG/geywMqkE929y/G/2/4qSKtlKvcT9qcT6aoxFM/TxDABJD+ZBIwYKq
 3K6q51JJxIUxwSGLMXGgNlerAG8E4yESHwB1NOx+OhXdo52yWiEybJper3XCsqAvHrgc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj2dw-0005k1-JP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 21:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 010A5601E8;
 Thu, 22 Jan 2026 21:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30C1C116C6;
 Thu, 22 Jan 2026 21:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769118897;
 bh=caONCuwCvjGuCRxUQ7JbMidBxiy8Pe4HnHmp8ASxXws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ijE9gWqKtBFIessficlOSNDv1SY2fDE4hluKoAELLXGpcf4iPxh1eBvcwaG6Xp8lm
 kovKZNuprtj5BgSRPJF+Ii/8AjzEC/GQHxBIeC7WYQjnWNZvkT+pQnAM5WH0kw+9XL
 iaD3vm+1LlI/1VnB0XIA9jCOIPHmPaKcfAfUaJ1AUD2rCpnnXsCANP9qOIe39KYtyX
 SRq/FOSJhm1Tc6BnO46ZIko18c8WKHSbmtC0RLyTx9pN9C9DyT9xXezhI1kY3BNTQq
 FBfUZA39BrF+FoafkQde0FCcymSdFe8QEEfzfKhnzxgcPNG92oa1QXBQTlUHyIItAc
 egALlERcUc2gg==
Date: Thu, 22 Jan 2026 13:54:57 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260122215457.GH5910@frogsfrogsfrogs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-9-hch@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 09:22:04AM +0100, Christoph Hellwig
 wrote: > Look up the fsverity_info once in ext4_mpage_readpages, and then
 use it > for the readahead, local verification of holes and pass i [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj2dw-0005k1-JP
Subject: Re: [f2fs-dev] [PATCH 08/11] ext4: consolidate fsverity_info lookup
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.951];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 756496DFA8
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:22:04AM +0100, Christoph Hellwig wrote:
> Look up the fsverity_info once in ext4_mpage_readpages, and then use it
> for the readahead, local verification of holes and pass it along to the
> I/O completion workqueue in struct bio_post_read_ctx.
> 
> This amortizes the lookup better once it becomes less efficient.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ext4/readpage.c | 33 ++++++++++++++-------------------
>  1 file changed, 14 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index 02f918cf1945..6092d6d59063 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -61,6 +61,7 @@ enum bio_post_read_step {
>  
>  struct bio_post_read_ctx {
>  	struct bio *bio;
> +	struct fsverity_info *vi;
>  	struct work_struct work;
>  	unsigned int cur_step;
>  	unsigned int enabled_steps;
> @@ -96,7 +97,7 @@ static void verity_work(struct work_struct *work)
>  	struct bio_post_read_ctx *ctx =
>  		container_of(work, struct bio_post_read_ctx, work);
>  	struct bio *bio = ctx->bio;
> -	struct inode *inode = bio_first_folio_all(bio)->mapping->host;
> +	struct fsverity_info *vi = ctx->vi;
>  
>  	/*
>  	 * fsverity_verify_bio() may call readahead() again, and although verity
> @@ -109,7 +110,7 @@ static void verity_work(struct work_struct *work)
>  	mempool_free(ctx, bio_post_read_ctx_pool);
>  	bio->bi_private = NULL;
>  
> -	fsverity_verify_bio(*fsverity_info_addr(inode), bio);
> +	fsverity_verify_bio(vi, bio);
>  
>  	__read_end_io(bio);
>  }
> @@ -172,22 +173,16 @@ static void mpage_end_io(struct bio *bio)
>  	__read_end_io(bio);
>  }
>  
> -static inline bool ext4_need_verity(const struct inode *inode, pgoff_t idx)
> -{
> -	return fsverity_active(inode) &&
> -	       idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
> -}
> -
>  static void ext4_set_bio_post_read_ctx(struct bio *bio,
>  				       const struct inode *inode,
> -				       pgoff_t first_idx)
> +				       struct fsverity_info *vi)
>  {
>  	unsigned int post_read_steps = 0;
>  
>  	if (fscrypt_inode_uses_fs_layer_crypto(inode))
>  		post_read_steps |= 1 << STEP_DECRYPT;
>  
> -	if (ext4_need_verity(inode, first_idx))
> +	if (vi)
>  		post_read_steps |= 1 << STEP_VERITY;
>  
>  	if (post_read_steps) {
> @@ -196,6 +191,7 @@ static void ext4_set_bio_post_read_ctx(struct bio *bio,
>  			mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
>  
>  		ctx->bio = bio;
> +		ctx->vi = vi;
>  		ctx->enabled_steps = post_read_steps;
>  		bio->bi_private = ctx;
>  	}
> @@ -223,6 +219,7 @@ int ext4_mpage_readpages(struct inode *inode,
>  	sector_t first_block;
>  	unsigned page_block;
>  	struct block_device *bdev = inode->i_sb->s_bdev;
> +	struct fsverity_info *vi = NULL;
>  	int length;
>  	unsigned relative_block = 0;
>  	struct ext4_map_blocks map;
> @@ -244,9 +241,11 @@ int ext4_mpage_readpages(struct inode *inode,
>  			folio = readahead_folio(rac);
>  
>  		if (first_folio) {
> -			if (ext4_need_verity(inode, folio->index))
> -				fsverity_readahead(*fsverity_info_addr(inode),
> -						folio, nr_pages);
> +			if (folio->index <
> +			    DIV_ROUND_UP(inode->i_size, PAGE_SIZE))

I keep seeing this predicate, maybe it should go into fsverity.h as a
helper function with the comment about mmap that I was muttering about
in the previous patch?

Or maybe a "get verity info for given folio index" helper?

/*
 * Grab the fsverity context needed to verify the contents of the folio.
 *
 * <Big fat comment from before, about mmap and whatnot>
 */
static inline struct fsverity_info *vi
fsverity_folio_info(const struct folio *folio)
{
	struct inode *inode = folio->mapping->host;

	if (folio->index < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
		return fsverity_get_info(inode);
	return NULL;
}

then ext4 just does:

		vi = fsverity_folio_info(folio);
		if (vi)
			fsverity_readahead(vi, folio, nr_pages);

Hrm?

--D

> +				vi = fsverity_get_info(inode);
> +			if (vi)
> +				fsverity_readahead(vi, folio, nr_pages);
>  			first_folio = false;
>  		}
>  
> @@ -337,11 +336,7 @@ int ext4_mpage_readpages(struct inode *inode,
>  			folio_zero_segment(folio, first_hole << blkbits,
>  					  folio_size(folio));
>  			if (first_hole == 0) {
> -				struct fsverity_info *vi =
> -					*fsverity_info_addr(folio->mapping->host);
> -
> -				if (ext4_need_verity(inode, folio->index) &&
> -				    !fsverity_verify_folio(vi, folio))
> +				if (vi && !fsverity_verify_folio(vi, folio))
>  					goto set_error_page;
>  				folio_end_read(folio, true);
>  				continue;
> @@ -369,7 +364,7 @@ int ext4_mpage_readpages(struct inode *inode,
>  					REQ_OP_READ, GFP_KERNEL);
>  			fscrypt_set_bio_crypt_ctx(bio, inode, next_block,
>  						  GFP_KERNEL);
> -			ext4_set_bio_post_read_ctx(bio, inode, folio->index);
> +			ext4_set_bio_post_read_ctx(bio, inode, vi);
>  			bio->bi_iter.bi_sector = first_block << (blkbits - 9);
>  			bio->bi_end_io = mpage_end_io;
>  			if (rac)
> -- 
> 2.47.3
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
