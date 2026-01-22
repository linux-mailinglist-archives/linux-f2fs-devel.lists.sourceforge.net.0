Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DC3C0X4cWmvZwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 11:13:25 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 472476514C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 11:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wg9NQLWv9/YVtuSnlwEFzirmzLwRXxQZ7z5/DaC6eFY=; b=Ub8nitJQPUzIqc3hGd5X2Ilqtf
	gWiy0x3/RxVJVYyqNtGktqiv4M2pSKB244H5U1jWVlO9daiTl8QBkOenm9/Af+HobAosKtZaHObKa
	NdqB2HS9WbNjL2SlMZh7dCFGYnactmZSQnSinUdnyz0OAy3d/2DyPD0WHnaoY7NHWpAg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1virgl-0001gY-9e;
	Thu, 22 Jan 2026 10:13:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1virgj-0001gR-3R
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 10:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3LEHVFVQ4TZGfzpQpk/WGviASPctZdrW85QejcVxrSw=; b=GpUfJ+Tlp6WmsmPqOX5W/LaMLG
 cmwlM7oGODGBQVDxVXG0SPSxaV/T3Mh74nnNRTCGL22klsaP/PyyRUgYCPSrUSVJEepjZj9hLVq0N
 hT7ssqa4OKwwPcsfwJtGCkBfH4yXmj7yklpdyNxF+nUD4Zkk6DP9BOqy8v2ud0VdQtm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3LEHVFVQ4TZGfzpQpk/WGviASPctZdrW85QejcVxrSw=; b=Aj4PmceOBdzGp1GoRsEbjkK+7Q
 mPTyi9G6U55xnjL93/sQE00k/SW74YoNLups4XENDsKkSY+93UuiMkTVBg3mwf8WWXpgbmpggdL7k
 6eHIw7FoCkpO21BxJ3nqsot5HYENyHOD/+naT6qpeBubdB/T+quuUiN3Ia1Ssh23aRL0=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1virgi-0005a8-6p for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 10:13:17 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D823F5BCD9;
 Thu, 22 Jan 2026 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769076784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3LEHVFVQ4TZGfzpQpk/WGviASPctZdrW85QejcVxrSw=;
 b=gmzM6HE/o+jNbctQ150+xXP4oZYhWeWVpjPuukug8In4tIRjnMGugUr2h0x6NoogXOF/cb
 0LPwQve8A3nYHHUh7KM42p1MQBq/02nBQj2KJtEnta9CntwpCm+ken4TiqtiGPLIk3ZDlo
 zbeaM8AoAuR0DpF1rfvGzOEvhJZeejY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769076784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3LEHVFVQ4TZGfzpQpk/WGviASPctZdrW85QejcVxrSw=;
 b=6Oxx+RhEzg5qUYh8tGYwkuK6bIsOMN3GzAexoHFWi/xij+RhnmeDCJDw6aXudBuJ3Brg0B
 gDtSAPGpXvp58ZAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769076784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3LEHVFVQ4TZGfzpQpk/WGviASPctZdrW85QejcVxrSw=;
 b=gmzM6HE/o+jNbctQ150+xXP4oZYhWeWVpjPuukug8In4tIRjnMGugUr2h0x6NoogXOF/cb
 0LPwQve8A3nYHHUh7KM42p1MQBq/02nBQj2KJtEnta9CntwpCm+ken4TiqtiGPLIk3ZDlo
 zbeaM8AoAuR0DpF1rfvGzOEvhJZeejY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769076784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3LEHVFVQ4TZGfzpQpk/WGviASPctZdrW85QejcVxrSw=;
 b=6Oxx+RhEzg5qUYh8tGYwkuK6bIsOMN3GzAexoHFWi/xij+RhnmeDCJDw6aXudBuJ3Brg0B
 gDtSAPGpXvp58ZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFC7213978;
 Thu, 22 Jan 2026 10:13:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id m9TMLjD4cWkMKwAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 22 Jan 2026 10:13:04 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 37A1CA0B2E; Thu, 22 Jan 2026 10:18:03 +0100 (CET)
Date: Thu, 22 Jan 2026 10:18:03 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <qcctljyfbkrfqxgwn3crbxq3k5n3qjkx447uh5vppdlhl4nyyy@ykllbscqtwxs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-5-hch@lst.de>
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 22-01-26 09:22:00, Christoph Hellwig wrote: > ext4
 and f2fs are largely using the same code to read a page full > of Merkle tree
 blocks from the page cache, and the upcoming xfs > fsverity supp [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1virgi-0005a8-6p
Subject: Re: [f2fs-dev] [PATCH 04/11] fsverity: start consolidating
 pagecache code
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
X-Spamd-Result: default: False [-0.61 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,suse.cz:email,suse.com:email];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 472476514C
X-Rspamd-Action: no action

On Thu 22-01-26 09:22:00, Christoph Hellwig wrote:
> ext4 and f2fs are largely using the same code to read a page full
> of Merkle tree blocks from the page cache, and the upcoming xfs
> fsverity support would add another copy.
> 
> Move the ext4 code to fs/verity/ and use it in f2fs as well.  For f2fs
> this removes the previous f2fs-specific error injection, but otherwise
> the behavior remains unchanged.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/verity.c         | 17 +----------------
>  fs/f2fs/verity.c         | 17 +----------------
>  fs/verity/pagecache.c    | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/fsverity.h |  3 +++
>  4 files changed, 43 insertions(+), 32 deletions(-)
>  create mode 100644 fs/verity/pagecache.c
> 
> diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
> index 2ce4cf8a1e31..a071860ad36a 100644
> --- a/fs/ext4/verity.c
> +++ b/fs/ext4/verity.c
> @@ -361,23 +361,8 @@ static struct page *ext4_read_merkle_tree_page(struct inode *inode,
>  					       pgoff_t index,
>  					       unsigned long num_ra_pages)
>  {
> -	struct folio *folio;
> -
>  	index += ext4_verity_metadata_pos(inode) >> PAGE_SHIFT;
> -
> -	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
> -	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
> -		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
> -
> -		if (!IS_ERR(folio))
> -			folio_put(folio);
> -		else if (num_ra_pages > 1)
> -			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
> -		folio = read_mapping_folio(inode->i_mapping, index, NULL);
> -		if (IS_ERR(folio))
> -			return ERR_CAST(folio);
> -	}
> -	return folio_file_page(folio, index);
> +	return generic_read_merkle_tree_page(inode, index, num_ra_pages);
>  }
>  
>  static int ext4_write_merkle_tree_block(struct file *file, const void *buf,
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index c1c4d8044681..d37e584423af 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -259,23 +259,8 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
>  					       pgoff_t index,
>  					       unsigned long num_ra_pages)
>  {
> -	struct folio *folio;
> -
>  	index += f2fs_verity_metadata_pos(inode) >> PAGE_SHIFT;
> -
> -	folio = f2fs_filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
> -	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
> -		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
> -
> -		if (!IS_ERR(folio))
> -			folio_put(folio);
> -		else if (num_ra_pages > 1)
> -			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
> -		folio = read_mapping_folio(inode->i_mapping, index, NULL);
> -		if (IS_ERR(folio))
> -			return ERR_CAST(folio);
> -	}
> -	return folio_file_page(folio, index);
> +	return generic_read_merkle_tree_page(inode, index, num_ra_pages);
>  }
>  
>  static int f2fs_write_merkle_tree_block(struct file *file, const void *buf,
> diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
> new file mode 100644
> index 000000000000..1efcdde20b73
> --- /dev/null
> +++ b/fs/verity/pagecache.c
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +#include <linux/fsverity.h>
> +#include <linux/pagemap.h>
> +
> +/**
> + * generic_read_merkle_tree_page - generic ->read_merkle_tree_page helper
> + * @inode:	inode containing the Merkle tree
> + * @index:	0-based index of the page in the inode
> + * @num_ra_pages: The number of Merkle tree pages that should be prefetched.
> + *
> + * The caller needs to adjust @index from the Merkle-tree relative index passed
> + * to ->read_merkle_tree_page to the actual index where the Merkle tree is
> + * stored in the page cache for @inode.
> + */
> +struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
> +		unsigned long num_ra_pages)
> +{
> +	struct folio *folio;
> +
> +	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
> +	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
> +		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
> +
> +		if (!IS_ERR(folio))
> +			folio_put(folio);
> +		else if (num_ra_pages > 1)
> +			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
> +		folio = read_mapping_folio(inode->i_mapping, index, NULL);
> +		if (IS_ERR(folio))
> +			return ERR_CAST(folio);
> +	}
> +	return folio_file_page(folio, index);
> +}
> +EXPORT_SYMBOL_GPL(generic_read_merkle_tree_page);
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index e22cf84fe83a..121703625cc8 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -309,4 +309,7 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
>  
>  void fsverity_cleanup_inode(struct inode *inode);
>  
> +struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
> +		unsigned long num_ra_pages);
> +
>  #endif	/* _LINUX_FSVERITY_H */
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
