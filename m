Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLzBNDWWcmmSmwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 22:27:17 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C40D6DC12
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 22:27:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzosJSV/e/oEvgQ6ZwdfskAEwNxae/KK9g3nWJTAw2E=; b=K6VmPXdsCF30hoEOfFLQu7Ibo0
	VDPj7NylLF2NUg3RX47nC6ItdnsItGBXej+6zWRK/ZuprluFTQ7RBLZ9x18xWNgsVjiuJU6myBoz5
	V9RYavMztMaCH2oc4Gp0XP6W+mxjQhnwTp+u+b7qbZtyH9eF8MXSYpY5QIDTHTkUFDAY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj2Cu-0000IL-NZ;
	Thu, 22 Jan 2026 21:27:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vj2Cu-0000ID-AE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 21:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9ys9C5h+WPUsArQCAQRISWZcS94d0E0oSPEgHwQ/PnQ=; b=MMCxqPhljVTWY5mfzpPk8s8UUV
 P28A0AyxOu7T0sWgVeDDlLXsGn2aVPwMP4WDyQnnos3+3w3iaqLkvxkFStlm6cLM2X9tldeqn1zqW
 W26zvq6TYYnk+UUBJRjE2AXS/Jpn5Pe4ChXdgy8d9WGYPTmI+D55GxLj2XLCc91Icy9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9ys9C5h+WPUsArQCAQRISWZcS94d0E0oSPEgHwQ/PnQ=; b=PFKGjRRqOuwvArYqU0LEwlxLDr
 OlREsKz6D1giYkDWvhHKIcTn0vT/4Ql21hXMklWs9mMhrsOeJy2NpAxCV3F6H0l9WGG6PEi9wqSqH
 K+C6s0HLrU4Ck6+how+XeSigy1hBFup2O0LmI6MA0Q+wfr2EKXbPUqq/179lStNhH26w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj2Cu-0004pP-FL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 21:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D8DE26014A;
 Thu, 22 Jan 2026 21:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE21C19423;
 Thu, 22 Jan 2026 21:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769117221;
 bh=U10N7ULI9KAcvzTiDsxNFxtjl4EJCZqPOvlb4g1ZbUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJPq9gktVwk0sp4pr0hoATeQnthpgn9hLQIzJzJiyOCIZuuq72NaoYVe0Qh3fFELw
 UDA79/097W+MDYAWljX5K4kMsMbyLiXZ6zKD5WeXv42sohvNwPOcVDlHoCWY960VOF
 GUImQW0Sp1IVRwcpGVtZpOGhzaR7ldOijeiofs912DMIk4jeVieWzVqth0edJFSznb
 nTrcBZM4Vqj4kERQp3Th9UY7id7oVIwuUUBTYeKS8WdcRDowvxa+GWalm6PbDo2Diy
 oR3JOS01L1a7BiX7g8oTwxsxd+8zvqOb3ch72LS/IJ+67nhwE7rQbxkuXgPdl/KO8s
 YBwcrpMqB9/2A==
Date: Thu, 22 Jan 2026 13:27:00 -0800
To: Christoph Hellwig <hch@lst.de>, t@magnolia.djwong.org
Message-ID: <20260122212700.GD5910@frogsfrogsfrogs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-5-hch@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 09:22:00AM +0100, Christoph Hellwig
 wrote: > ext4 and f2fs are largely using the same code to read a page full
 > of Merkle tree blocks from the page cache, and the upcoming xfs [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj2Cu-0004pP-FL
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:t@magnolia.djwong.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.953];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lst.de:email]
X-Rspamd-Queue-Id: 2C40D6DC12
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:22:00AM +0100, Christoph Hellwig wrote:
> ext4 and f2fs are largely using the same code to read a page full
> of Merkle tree blocks from the page cache, and the upcoming xfs
> fsverity support would add another copy.
> 
> Move the ext4 code to fs/verity/ and use it in f2fs as well.  For f2fs
> this removes the previous f2fs-specific error injection, but otherwise
> the behavior remains unchanged.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
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

Nice hoist, though I wonder -- as an exported fs function, should we be
checking that the returned folio doesn't cover EOF?  Not that any of the
users actually check that returned merkle tree folios fit that
criterion.

<shrug> as a pure hoist this is ok so
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

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
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
