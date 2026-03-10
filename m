Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB4/EKlqr2nzYAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 01:49:45 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75742243203
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 01:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHuLdvrA3VGU+d2BYTHR0PQN9E+ywXtyRB3JgKxKTsI=; b=igN+DbJb+bEZ+/m4pDwItbBSsG
	HSE0bIrLGJl6eftUQQ/8908SRURY26AX6E0VQ26pIP2gAxYr8MOu0I/vLSmAdun2VydgWaIgUI80c
	mXF+nOOO098H+PcrOz0+AU5Rx+9kfgK3fVOxHY7HGibrZJXygEziQLLi3noNmgwX4XoY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzlHy-00072A-Iq;
	Tue, 10 Mar 2026 00:49:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzlHx-000722-6n
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 00:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9IkNKt7SXpHFV63MxMELH+6hn6ZZPKnjurPAkHdz074=; b=fqrIq+2qilthxyvdzNT6uvV0JB
 9T9p2nlD3yeHyIwPtemB2P43jzxGsfc2xINVmpmH5RJf0BT1vH2kBi+Cuz2Cc6jO9UnKJcbJ5RkQg
 7zGspvh+YRkKnfgxrKQnKUI2gj4rSJlMlDIVu90h78K1DKrvZgFL3RQ4qkA94EJfWAxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9IkNKt7SXpHFV63MxMELH+6hn6ZZPKnjurPAkHdz074=; b=nEtEDkAv09BbSxtm29JLtwx8FW
 zu6AYxAw2xn+nggcncdtBoWPRjA/DJiyljXUTQS73OwartHtOCNxQ9MP16z6VNXKuflpZeWMuomyh
 /nQeCcH3Und+jpOq2XaosZX4KT6olubnSBnwFAacaRIYOTRL3bHxg2ahjHP7IerCSyho=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzlHw-0006Wq-Eo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 00:49:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDF464046C;
 Tue, 10 Mar 2026 00:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA26AC4CEF7;
 Tue, 10 Mar 2026 00:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773103761;
 bh=lKqhCSJKZhdrvwjb4xNjYx38RXJz/jSpPgPv4ORSk7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mmaAN+jMq0rvEauF80/acXKQ/iAaAxF0160S2i+MvLYETEOJpd/kFtHUPhjqxZhPw
 IK7G/40KXOkNL1sNkU/eVej+wKENlysw9Diem3lJ/pAbRKMlW+awA09S0VTrfvCoZm
 b1EzEfGHXJ+IGDljWW/yPGNR/WTAkObHRqjstTkLCMHjYhys400nuDxwywlnOK+Xe0
 7ldJVN9/5queUv0MvMJtRA8a32UeTkvfgQHNvGw+zKeY/SHL0Wu+vpNXxl+NCo0Yy1
 CnMo6LAn1LQKslel3ql27bEggplYSSf7LJHUoKHw+WR2rvw4vssq6kzhRKT2OgmFX/
 ZNUv0Eqbh/20g==
Date: Mon, 9 Mar 2026 17:49:21 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310004921.GX6033@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-7-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-7-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:21PM +0100, Andrey Albershteyn
 wrote: > This is the same function to read from pageache. XFS will also need
 > this, so move this to core fsverity. > > Signed-off-by: Andr [...] 
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
X-Headers-End: 1vzlHw-0006Wq-Eo
Subject: Re: [f2fs-dev] [PATCH v4 06/25] fsverity: hoist pagecache_read from
 f2fs/ext4 to fsverity
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
X-Rspamd-Queue-Id: 75742243203
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

On Mon, Mar 09, 2026 at 08:23:21PM +0100, Andrey Albershteyn wrote:
> This is the same function to read from pageache. XFS will also need
> this, so move this to core fsverity.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

This looks like a neat code reduction. :)
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/ext4/verity.c         | 32 +++-----------------------------
>  fs/f2fs/verity.c         | 30 +-----------------------------
>  fs/verity/pagecache.c    | 33 +++++++++++++++++++++++++++++++++
>  include/linux/fsverity.h |  2 ++
>  4 files changed, 39 insertions(+), 58 deletions(-)
> 
> diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
> index 347945ac23a4..ac5c133f5529 100644
> --- a/fs/ext4/verity.c
> +++ b/fs/ext4/verity.c
> @@ -34,32 +34,6 @@ static inline loff_t ext4_verity_metadata_pos(const struct inode *inode)
>  	return round_up(inode->i_size, 65536);
>  }
>  
> -/*
> - * Read some verity metadata from the inode.  __vfs_read() can't be used because
> - * we need to read beyond i_size.
> - */
> -static int pagecache_read(struct inode *inode, void *buf, size_t count,
> -			  loff_t pos)
> -{
> -	while (count) {
> -		struct folio *folio;
> -		size_t n;
> -
> -		folio = read_mapping_folio(inode->i_mapping, pos >> PAGE_SHIFT,
> -					 NULL);
> -		if (IS_ERR(folio))
> -			return PTR_ERR(folio);
> -
> -		n = memcpy_from_file_folio(buf, folio, pos, count);
> -		folio_put(folio);
> -
> -		buf += n;
> -		pos += n;
> -		count -= n;
> -	}
> -	return 0;
> -}
> -
>  /*
>   * Write some verity metadata to the inode for FS_IOC_ENABLE_VERITY.
>   * kernel_write() can't be used because the file descriptor is readonly.
> @@ -311,8 +285,8 @@ static int ext4_get_verity_descriptor_location(struct inode *inode,
>  		goto bad;
>  	desc_size_pos -= sizeof(desc_size_disk);
>  
> -	err = pagecache_read(inode, &desc_size_disk, sizeof(desc_size_disk),
> -			     desc_size_pos);
> +	err = fsverity_pagecache_read(inode, &desc_size_disk,
> +				      sizeof(desc_size_disk), desc_size_pos);
>  	if (err)
>  		return err;
>  	desc_size = le32_to_cpu(desc_size_disk);
> @@ -352,7 +326,7 @@ static int ext4_get_verity_descriptor(struct inode *inode, void *buf,
>  	if (buf_size) {
>  		if (desc_size > buf_size)
>  			return -ERANGE;
> -		err = pagecache_read(inode, buf, desc_size, desc_pos);
> +		err = fsverity_pagecache_read(inode, buf, desc_size, desc_pos);
>  		if (err)
>  			return err;
>  	}
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index b3b3e71604ac..5ea0a9b40443 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -36,34 +36,6 @@ static inline loff_t f2fs_verity_metadata_pos(const struct inode *inode)
>  	return round_up(inode->i_size, 65536);
>  }
>  
> -/*
> - * Read some verity metadata from the inode.  __vfs_read() can't be used because
> - * we need to read beyond i_size.
> - */
> -static int pagecache_read(struct inode *inode, void *buf, size_t count,
> -			  loff_t pos)
> -{
> -	while (count) {
> -		size_t n = min_t(size_t, count,
> -				 PAGE_SIZE - offset_in_page(pos));
> -		struct page *page;
> -
> -		page = read_mapping_page(inode->i_mapping, pos >> PAGE_SHIFT,
> -					 NULL);
> -		if (IS_ERR(page))
> -			return PTR_ERR(page);
> -
> -		memcpy_from_page(buf, page, offset_in_page(pos), n);
> -
> -		put_page(page);
> -
> -		buf += n;
> -		pos += n;
> -		count -= n;
> -	}
> -	return 0;
> -}
> -
>  /*
>   * Write some verity metadata to the inode for FS_IOC_ENABLE_VERITY.
>   * kernel_write() can't be used because the file descriptor is readonly.
> @@ -248,7 +220,7 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
>  	if (buf_size) {
>  		if (size > buf_size)
>  			return -ERANGE;
> -		res = pagecache_read(inode, buf, size, pos);
> +		res = fsverity_pagecache_read(inode, buf, size, pos);
>  		if (res)
>  			return res;
>  	}
> diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
> index 1d94bf73f38c..ec65f60e657f 100644
> --- a/fs/verity/pagecache.c
> +++ b/fs/verity/pagecache.c
> @@ -78,3 +78,36 @@ void fsverity_folio_zero_hash(struct folio *folio, size_t poff, size_t plen,
>  				vi->tree_params.digest_size);
>  }
>  EXPORT_SYMBOL_GPL(fsverity_folio_zero_hash);
> +
> +/**
> + * fsverity_pagecache_read() - read page and copy data to buffer
> + * @inode:	copy from this inode's address space
> + * @buf:	buffer to copy to
> + * @count:	number of bytes to copy
> + * @pos:	position of the folio to copy from
> + *
> + * Read some verity metadata from the inode.  __vfs_read() can't be used because
> + * we need to read beyond i_size.
> + */
> +int fsverity_pagecache_read(struct inode *inode, void *buf, size_t count,
> +			  loff_t pos)
> +{
> +	while (count) {
> +		struct folio *folio;
> +		size_t n;
> +
> +		folio = read_mapping_folio(inode->i_mapping, pos >> PAGE_SHIFT,
> +					 NULL);
> +		if (IS_ERR(folio))
> +			return PTR_ERR(folio);
> +
> +		n = memcpy_from_file_folio(buf, folio, pos, count);
> +		folio_put(folio);
> +
> +		buf += n;
> +		pos += n;
> +		count -= n;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fsverity_pagecache_read);
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 1ca8de129323..53dc161e18c0 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -327,5 +327,7 @@ void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
>  				   unsigned long nr_pages);
>  void fsverity_folio_zero_hash(struct folio *folio, size_t poff, size_t plen,
>  			      struct fsverity_info *vi);
> +int fsverity_pagecache_read(struct inode *inode, void *buf, size_t count,
> +			    loff_t pos);
>  
>  #endif	/* _LINUX_FSVERITY_H */
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
