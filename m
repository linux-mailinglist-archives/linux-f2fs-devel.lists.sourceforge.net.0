Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLQ1OXOogGmeAAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 14:36:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D8ECCD1C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 14:36:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIOBqDQZ1Hr6i4sCjqv8PrY2GlnW5pWl8ELcyzTADgo=; b=H8L+2ZGQRFFaGAd1PUhvi37wkS
	jGFjduRvYBhp+lJtI/o3h9X1xByDtIIZbbrnyDsXEJbT8IMhWIfKufw7tTBtiEDK5nyzIY7CPh67S
	9/F8QKAZUOxbs9oTc6FT8D0NaqWGL2Gm+VLUftGEU3LQIiv5oCe/liRI9d8lI9pAbf3E=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmu6S-0006Ep-GJ;
	Mon, 02 Feb 2026 13:36:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vmu6Q-0006EZ-PQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 13:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4/EPEbNnnr8uAiYZHpEsuna5VNl7uH08rLKo26QCkNc=; b=NW6CtJu6Fn8syj/r3XOLQs82wS
 GUgJNQKcltGe9tLAqp2ZFHFXfLwVCyZNcfRECDbRZT8nL3qb5IPmhpBIGSvX3TBY4lJObGFi2PYQA
 Vbue9b6vjobo5gA8OwfKNvGdqcKzmykUa2JsA+xbes9FebLLbtZMVzINviimWWcw3fCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4/EPEbNnnr8uAiYZHpEsuna5VNl7uH08rLKo26QCkNc=; b=BxLmCAf7ss6NMyqJmzZ8g7eQYM
 uk0q9HiugqczmhuilY1/E4IP348EzihfaNWWXzXpkK8hzXfqlWALg4dPRu01jq9dD3Q9+NiExIf0o
 hhQEyV4NyugX32W6aqXhhp2U2GMj9tC4ybBwGT1HvJO6+X4XZuDB0TyILYHLlKkwPN5Q=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vmu6Q-0002xy-Nx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 13:36:31 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C5615BCFE;
 Mon,  2 Feb 2026 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770039379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4/EPEbNnnr8uAiYZHpEsuna5VNl7uH08rLKo26QCkNc=;
 b=mgHGkwsDwZhO6atbUu6nt1bxZsy/zGmgKDzMxj6pnmrn1QE7S8zYdKvcLfxlwGVHlrOr19
 QM2Cs1QkCD1XUMhhxl7qoEz+J+sUbALu/XZFbIWdkLi0Lqq8BAySCuYawgXpfg6Wi9sc7U
 H2F4vZyqWToBYlmR1QsMbBJCVR+S0QY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770039379;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4/EPEbNnnr8uAiYZHpEsuna5VNl7uH08rLKo26QCkNc=;
 b=6IazOQPVfhBn+IRmJxPuIPDbd+tMWB+KbFPhjToHvwzsv25CizNrBF+Ii0h/iFfV8Nf3kJ
 SpU5TOugMtYZdJCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=mgHGkwsD;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=6IazOQPV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770039379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4/EPEbNnnr8uAiYZHpEsuna5VNl7uH08rLKo26QCkNc=;
 b=mgHGkwsDwZhO6atbUu6nt1bxZsy/zGmgKDzMxj6pnmrn1QE7S8zYdKvcLfxlwGVHlrOr19
 QM2Cs1QkCD1XUMhhxl7qoEz+J+sUbALu/XZFbIWdkLi0Lqq8BAySCuYawgXpfg6Wi9sc7U
 H2F4vZyqWToBYlmR1QsMbBJCVR+S0QY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770039379;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4/EPEbNnnr8uAiYZHpEsuna5VNl7uH08rLKo26QCkNc=;
 b=6IazOQPVfhBn+IRmJxPuIPDbd+tMWB+KbFPhjToHvwzsv25CizNrBF+Ii0h/iFfV8Nf3kJ
 SpU5TOugMtYZdJCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27BFF3EA62;
 Mon,  2 Feb 2026 13:36:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xdCyCVOogGmOJQAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 02 Feb 2026 13:36:19 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id CE784A08F8; Mon,  2 Feb 2026 14:36:18 +0100 (CET)
Date: Mon, 2 Feb 2026 14:36:18 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <vu3c3isevxhsayshrgv4yj2xfkeugbtx4jaryrdxehz57vq6ho@mkrueh7j55fe>
References: <20260202060754.270269-1-hch@lst.de>
 <20260202060754.270269-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202060754.270269-3-hch@lst.de>
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 02-02-26 07:06:31, Christoph Hellwig wrote: > Require
 the invalidate_lock to be held over calls to > page_cache_ra_unbounded instead
 of acquiring it in this function. > > This prepares for call [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vmu6Q-0002xy-Nx
Subject: Re: [f2fs-dev] [PATCH 02/11] readahead: push invalidate_lock out of
 page_cache_ra_unbounded
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,suse.cz:email,suse.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 30D8ECCD1C
X-Rspamd-Action: no action

On Mon 02-02-26 07:06:31, Christoph Hellwig wrote:
> Require the invalidate_lock to be held over calls to
> page_cache_ra_unbounded instead of acquiring it in this function.
> 
> This prepares for calling page_cache_ra_unbounded from ->readahead for
> fsverity read-ahead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index da029fed4e5a..c9b9fcdd0cae 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4418,7 +4418,9 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
>  	pgoff_t redirty_idx = page_idx;
>  	int page_len = 0, ret = 0;
>  
> +	filemap_invalidate_lock_shared(mapping);
>  	page_cache_ra_unbounded(&ractl, len, 0);
> +	filemap_invalidate_unlock_shared(mapping);
>  
>  	do {
>  		folio = read_cache_folio(mapping, page_idx, NULL, NULL);
> diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
> index 1a88decace53..8e0d6fde802f 100644
> --- a/fs/verity/pagecache.c
> +++ b/fs/verity/pagecache.c
> @@ -26,10 +26,13 @@ struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
>  	    (!IS_ERR(folio) && !folio_test_uptodate(folio))) {
>  		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
>  
> -		if (!IS_ERR(folio))
> +		if (!IS_ERR(folio)) {
>  			folio_put(folio);
> -		else if (num_ra_pages > 1)
> +		} else if (num_ra_pages > 1) {
> +			filemap_invalidate_lock_shared(inode->i_mapping);
>  			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
> +			filemap_invalidate_unlock_shared(inode->i_mapping);
> +		}
>  		folio = read_mapping_folio(inode->i_mapping, index, NULL);
>  	}
>  	if (IS_ERR(folio))
> diff --git a/mm/readahead.c b/mm/readahead.c
> index b415c9969176..25f81124beb6 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -204,7 +204,8 @@ static struct folio *ractl_alloc_folio(struct readahead_control *ractl,
>   * not the function you want to call.  Use page_cache_async_readahead()
>   * or page_cache_sync_readahead() instead.
>   *
> - * Context: File is referenced by caller.  Mutexes may be held by caller.
> + * Context: File is referenced by caller, and ractl->mapping->invalidate_lock
> + * must be held by the caller in shared mode.  Mutexes may be held by caller.
>   * May sleep, but will not reenter filesystem to reclaim memory.
>   */
>  void page_cache_ra_unbounded(struct readahead_control *ractl,
> @@ -228,9 +229,10 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
>  	 */
>  	unsigned int nofs = memalloc_nofs_save();
>  
> +	lockdep_assert_held_read(&mapping->invalidate_lock);
> +
>  	trace_page_cache_ra_unbounded(mapping->host, index, nr_to_read,
>  				      lookahead_size);
> -	filemap_invalidate_lock_shared(mapping);
>  	index = mapping_align_index(mapping, index);
>  
>  	/*
> @@ -300,7 +302,6 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
>  	 * will then handle the error.
>  	 */
>  	read_pages(ractl);
> -	filemap_invalidate_unlock_shared(mapping);
>  	memalloc_nofs_restore(nofs);
>  }
>  EXPORT_SYMBOL_GPL(page_cache_ra_unbounded);
> @@ -314,9 +315,9 @@ EXPORT_SYMBOL_GPL(page_cache_ra_unbounded);
>  static void do_page_cache_ra(struct readahead_control *ractl,
>  		unsigned long nr_to_read, unsigned long lookahead_size)
>  {
> -	struct inode *inode = ractl->mapping->host;
> +	struct address_space *mapping = ractl->mapping;
>  	unsigned long index = readahead_index(ractl);
> -	loff_t isize = i_size_read(inode);
> +	loff_t isize = i_size_read(mapping->host);
>  	pgoff_t end_index;	/* The last page we want to read */
>  
>  	if (isize == 0)
> @@ -329,7 +330,9 @@ static void do_page_cache_ra(struct readahead_control *ractl,
>  	if (nr_to_read > end_index - index)
>  		nr_to_read = end_index - index + 1;
>  
> +	filemap_invalidate_lock_shared(mapping);
>  	page_cache_ra_unbounded(ractl, nr_to_read, lookahead_size);
> +	filemap_invalidate_unlock_shared(mapping);
>  }
>  
>  /*
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
