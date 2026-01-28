Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLTHKn06emlB4wEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 17:34:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D886A5D2E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 17:34:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRe05U+YS7lHIAKmPTWsZF18ia97rRG1JAMrHgZZDtc=; b=YdVNzH+X8hFpm8f1Uym0zmzQm1
	Q0yifTFYfMA3f5wYBXpbhGH0spnvH59ZyeMxtjKRx6Lndtn3GKZ5xZxctij6eBuXbaCQlIgwkCRDR
	nURNAwWqi9ebqrO2iCyd9XKBUxl8C15qzhZ+21exZYc0x5BdOsrD7llS7F+TfgPWjNKs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vl8UQ-0001zi-O2;
	Wed, 28 Jan 2026 16:33:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vl8UP-0001zc-2s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 16:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Op7DhixqEascTcDFPDaUSCcG6nd840ALwXjIEKcyFDc=; b=G41A3Syr289gpaYNIlXIPsNzU+
 5JCx75YL7zpAxQJrJzPBacak7JrlrMhW+iVoIz3OxWlD8f5HXl0iDcQ4GK35un44ow479xbKdI+uC
 WfqbgJgrYi5WIs44uw2IQilpsWGlnwrpZoSq2LOdwOBtZeUgW/dUnFJr8K2txLObFb00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Op7DhixqEascTcDFPDaUSCcG6nd840ALwXjIEKcyFDc=; b=dZQuTkniH0ZaPsX/CRoPs+ya9O
 gfp3dkFK/I+Riu3dxb2lhFNHlISkgdU4SlJfaGdPks0adiUvEdIS+sFwB1kMSO+FI4nYfkwQDta+X
 +NnSK6HYaSQWThr/BMP3uWjG552cxGpOCRioTNLawgddoegaWWT9lbabb9IcMqtb5MNU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vl8UN-0006ny-Tf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 16:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0BAE660054;
 Wed, 28 Jan 2026 16:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9D6C4CEF1;
 Wed, 28 Jan 2026 16:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769618029;
 bh=4LjajQ0YTojoKM0Q1tBzVUkhA9MQWanA/L5xPkJffUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QKqM9B0INvVl6WgQd4Yt6MTeE0DFtVWYshROs2GCuPdoq0hzkB5r2BxRBgwAFsjaE
 Q/+5wSMj24FK/rPuihd0fhKLHxc4aj9n3hhoqp4OVAU/sB8unmaxb1IAHFiez6bWrC
 7d/hL7EkPxElrEExB/f8gtZ9XOf/exEXbz3LkpKZLzKifNIM577PIDdQwTrLEfNZl7
 A6QilO9TSzKEyQx/pWOg2GOzDo2l1dQsKXYyzUHJGO2n1VSPDyIocj08TAMrf4uXz2
 y7zt8AVWEHuytBw9StON28tts2nRaXTreZ6PwMW1PhMOuuQl1k+dOey7nKqJkgL4MV
 ltnll6bgWgR0A==
Date: Wed, 28 Jan 2026 08:33:49 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260128163349.GA5910@frogsfrogsfrogs>
References: <20260128152630.627409-1-hch@lst.de>
 <20260128152630.627409-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128152630.627409-9-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 28, 2026 at 04:26:20PM +0100, Christoph Hellwig
 wrote: > Currently all reads of the fsverity hashes is kicked off from the
 data > I/O completion handler, leading to needlessly dependent I/ [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vl8UN-0006ny-Tf
Subject: Re: [f2fs-dev] [PATCH 08/15] fsverity: kick off hash readahead at
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
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
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lst.de:email]
X-Rspamd-Queue-Id: 9D886A5D2E
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:26:20PM +0100, Christoph Hellwig wrote:
> Currently all reads of the fsverity hashes is kicked off from the data
> I/O completion handler, leading to needlessly dependent I/O.  This is
> worked around a bit by performing readahead on the level 0 nodes, but
> still fairly ineffective.
> 
> Switch to a model where the ->read_folio and ->readahead methods instead
> kick off explicit readahead of the fsverity hashed so they are usually
> available at I/O completion time.
> 
> For 64k sequential reads on my test VM this improves read performance
> from 2.4GB/s - 2.6GB/s to 3.5GB/s - 3.9GB/s.  The improvements for
> random reads are likely to be even bigger.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: David Sterba <dsterba@suse.com> [btrfs]

Thanks for updating the kerneldoc and fixing the 'pgoff_t long' thing
from the last round;
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/btrfs/verity.c         |  4 +--
>  fs/ext4/readpage.c        |  7 ++++
>  fs/ext4/verity.c          | 13 +++++--
>  fs/f2fs/data.c            |  7 ++++
>  fs/f2fs/verity.c          | 13 +++++--
>  fs/verity/pagecache.c     | 39 ++++++++++++++------
>  fs/verity/read_metadata.c | 17 ++++++---
>  fs/verity/verify.c        | 76 +++++++++++++++++++++++++--------------
>  include/linux/fsverity.h  | 29 ++++++++++-----
>  9 files changed, 146 insertions(+), 59 deletions(-)
> 
> diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
> index e7643c22a6bf..c152bef71e8b 100644
> --- a/fs/btrfs/verity.c
> +++ b/fs/btrfs/verity.c
> @@ -697,7 +697,6 @@ int btrfs_get_verity_descriptor(struct inode *inode, void *buf, size_t buf_size)
>   *
>   * @inode:         inode to read a merkle tree page for
>   * @index:         page index relative to the start of the merkle tree
> - * @num_ra_pages:  number of pages to readahead. Optional, we ignore it
>   *
>   * The Merkle tree is stored in the filesystem btree, but its pages are cached
>   * with a logical position past EOF in the inode's mapping.
> @@ -705,8 +704,7 @@ int btrfs_get_verity_descriptor(struct inode *inode, void *buf, size_t buf_size)
>   * Returns the page we read, or an ERR_PTR on error.
>   */
>  static struct page *btrfs_read_merkle_tree_page(struct inode *inode,
> -						pgoff_t index,
> -						unsigned long num_ra_pages)
> +						pgoff_t index)
>  {
>  	struct folio *folio;
>  	u64 off = (u64)index << PAGE_SHIFT;
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index 267594ef0b2c..e99072c8a619 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -227,6 +227,7 @@ int ext4_mpage_readpages(struct inode *inode,
>  	unsigned relative_block = 0;
>  	struct ext4_map_blocks map;
>  	unsigned int nr_pages, folio_pages;
> +	bool first_folio = true;
>  
>  	map.m_pblk = 0;
>  	map.m_lblk = 0;
> @@ -242,6 +243,12 @@ int ext4_mpage_readpages(struct inode *inode,
>  		if (rac)
>  			folio = readahead_folio(rac);
>  
> +		if (first_folio) {
> +			if (ext4_need_verity(inode, folio->index))
> +				fsverity_readahead(folio, nr_pages);
> +			first_folio = false;
> +		}
> +
>  		folio_pages = folio_nr_pages(folio);
>  		prefetchw(&folio->flags);
>  
> diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
> index a071860ad36a..54ae4d4a176c 100644
> --- a/fs/ext4/verity.c
> +++ b/fs/ext4/verity.c
> @@ -358,11 +358,17 @@ static int ext4_get_verity_descriptor(struct inode *inode, void *buf,
>  }
>  
>  static struct page *ext4_read_merkle_tree_page(struct inode *inode,
> -					       pgoff_t index,
> -					       unsigned long num_ra_pages)
> +					       pgoff_t index)
>  {
>  	index += ext4_verity_metadata_pos(inode) >> PAGE_SHIFT;
> -	return generic_read_merkle_tree_page(inode, index, num_ra_pages);
> +	return generic_read_merkle_tree_page(inode, index);
> +}
> +
> +static void ext4_readahead_merkle_tree(struct inode *inode, pgoff_t index,
> +		unsigned long nr_pages)
> +{
> +	index += ext4_verity_metadata_pos(inode) >> PAGE_SHIFT;
> +	generic_readahead_merkle_tree(inode, index, nr_pages);
>  }
>  
>  static int ext4_write_merkle_tree_block(struct file *file, const void *buf,
> @@ -380,5 +386,6 @@ const struct fsverity_operations ext4_verityops = {
>  	.end_enable_verity	= ext4_end_enable_verity,
>  	.get_verity_descriptor	= ext4_get_verity_descriptor,
>  	.read_merkle_tree_page	= ext4_read_merkle_tree_page,
> +	.readahead_merkle_tree	= ext4_readahead_merkle_tree,
>  	.write_merkle_tree_block = ext4_write_merkle_tree_block,
>  };
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c30e69392a62..49bdc7e771f2 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2359,6 +2359,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>  	unsigned max_nr_pages = nr_pages;
>  	int ret = 0;
> +	bool first_folio = true;
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	if (f2fs_compressed_file(inode)) {
> @@ -2383,6 +2384,12 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  			prefetchw(&folio->flags);
>  		}
>  
> +		if (first_folio) {
> +			if (f2fs_need_verity(inode, folio->index))
> +				fsverity_readahead(folio, nr_pages);
> +			first_folio = false;
> +		}
> +
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  		index = folio->index;
>  
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index d37e584423af..628e8eafa96a 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -256,11 +256,17 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
>  }
>  
>  static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
> -					       pgoff_t index,
> -					       unsigned long num_ra_pages)
> +					       pgoff_t index)
>  {
>  	index += f2fs_verity_metadata_pos(inode) >> PAGE_SHIFT;
> -	return generic_read_merkle_tree_page(inode, index, num_ra_pages);
> +	return generic_read_merkle_tree_page(inode, index);
> +}
> +
> +static void f2fs_readahead_merkle_tree(struct inode *inode, pgoff_t index,
> +		unsigned long nr_pages)
> +{
> +	index += f2fs_verity_metadata_pos(inode) >> PAGE_SHIFT;
> +	generic_readahead_merkle_tree(inode, index, nr_pages);
>  }
>  
>  static int f2fs_write_merkle_tree_block(struct file *file, const void *buf,
> @@ -278,5 +284,6 @@ const struct fsverity_operations f2fs_verityops = {
>  	.end_enable_verity	= f2fs_end_enable_verity,
>  	.get_verity_descriptor	= f2fs_get_verity_descriptor,
>  	.read_merkle_tree_page	= f2fs_read_merkle_tree_page,
> +	.readahead_merkle_tree	= f2fs_readahead_merkle_tree,
>  	.write_merkle_tree_block = f2fs_write_merkle_tree_block,
>  };
> diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
> index eae419d8d091..196072bbe284 100644
> --- a/fs/verity/pagecache.c
> +++ b/fs/verity/pagecache.c
> @@ -16,8 +16,30 @@
>   * to ->read_merkle_tree_page to the actual index where the Merkle tree is
>   * stored in the page cache for @inode.
>   */
> -struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
> -		unsigned long num_ra_pages)
> +struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index)
> +{
> +	struct folio *folio;
> +
> +	folio = read_mapping_folio(inode->i_mapping, index, NULL);
> +	if (IS_ERR(folio))
> +		return ERR_CAST(folio);
> +	return folio_file_page(folio, index);
> +}
> +EXPORT_SYMBOL_GPL(generic_read_merkle_tree_page);
> +
> +/**
> + * generic_readahead_merkle_tree() - generic ->readahead_merkle_tree helper
> + * @inode:	inode containing the Merkle tree
> + * @index:	0-based index of the first Merkle tree page to read ahead in the
> + *		inode
> + * @nr_pages:	the number of Merkle tree pages that should be read ahead
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
> @@ -26,14 +48,9 @@ struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
>  	    (!IS_ERR(folio) && !folio_test_uptodate(folio))) {
>  		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
>  
> -		if (!IS_ERR(folio))
> -			folio_put(folio);
> -		else if (num_ra_pages > 1)
> -			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
> -		folio = read_mapping_folio(inode->i_mapping, index, NULL);
> -		if (IS_ERR(folio))
> -			return ERR_CAST(folio);
> +		page_cache_ra_unbounded(&ractl, nr_pages, 0);
>  	}
> -	return folio_file_page(folio, index);
> +	if (!IS_ERR(folio))
> +		folio_put(folio);
>  }
> -EXPORT_SYMBOL_GPL(generic_read_merkle_tree_page);
> +EXPORT_SYMBOL_GPL(generic_readahead_merkle_tree);
> diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
> index cba5d6af4e04..81b82e9ddb1d 100644
> --- a/fs/verity/read_metadata.c
> +++ b/fs/verity/read_metadata.c
> @@ -28,24 +28,31 @@ static int fsverity_read_merkle_tree(struct inode *inode,
>  	if (offset >= end_offset)
>  		return 0;
>  	offs_in_page = offset_in_page(offset);
> +	index = offset >> PAGE_SHIFT;
>  	last_index = (end_offset - 1) >> PAGE_SHIFT;
>  
> +	/*
> +	 * Kick off readahead for the range we are going to read to ensure a
> +	 * single large sequential read instead of lots of small ones.
> +	 */
> +	if (inode->i_sb->s_vop->readahead_merkle_tree) {
> +		inode->i_sb->s_vop->readahead_merkle_tree(inode, index,
> +				last_index - index + 1);
> +	}
> +
>  	/*
>  	 * Iterate through each Merkle tree page in the requested range and copy
>  	 * the requested portion to userspace.  Note that the Merkle tree block
>  	 * size isn't important here, as we are returning a byte stream; i.e.,
>  	 * we can just work with pages even if the tree block size != PAGE_SIZE.
>  	 */
> -	for (index = offset >> PAGE_SHIFT; index <= last_index; index++) {
> -		unsigned long num_ra_pages =
> -			min_t(unsigned long, last_index - index + 1,
> -			      inode->i_sb->s_bdi->io_pages);
> +	for (; index <= last_index; index++) {
>  		unsigned int bytes_to_copy = min_t(u64, end_offset - offset,
>  						   PAGE_SIZE - offs_in_page);
>  		struct page *page;
>  		const void *virt;
>  
> -		page = vops->read_merkle_tree_page(inode, index, num_ra_pages);
> +		page = vops->read_merkle_tree_page(inode, index);
>  		if (IS_ERR(page)) {
>  			err = PTR_ERR(page);
>  			fsverity_err(inode,
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index 86067c8b40cf..f5bea750b427 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/bio.h>
>  #include <linux/export.h>
> +#include <linux/pagemap.h>
>  
>  #define FS_VERITY_MAX_PENDING_BLOCKS 2
>  
> @@ -21,7 +22,6 @@ struct fsverity_pending_block {
>  struct fsverity_verification_context {
>  	struct inode *inode;
>  	struct fsverity_info *vi;
> -	unsigned long max_ra_pages;
>  
>  	/*
>  	 * This is the queue of data blocks that are pending verification.  When
> @@ -37,6 +37,49 @@ struct fsverity_verification_context {
>  
>  static struct workqueue_struct *fsverity_read_workqueue;
>  
> +/**
> + * fsverity_readahead() - kick off readahead on fsverity hashes
> + * @folio:		first file data folio that is being read
> + * @nr_pages:		number of file data pages to be read
> + *
> + * Start readahead on the fsverity hashes that are needed to verity the file
> + * data in the range from folio->index to folio->index + nr_pages.
> + *
> + * To be called from the file systems' ->read_folio and ->readahead methods to
> + * ensure that the hashes are already cached on completion of the file data
> + * read if possible.
> + */
> +void fsverity_readahead(struct folio *folio, unsigned long nr_pages)
> +{
> +	struct inode *inode = folio->mapping->host;
> +	const struct fsverity_info *vi = *fsverity_info_addr(inode);
> +	const struct merkle_tree_params *params = &vi->tree_params;
> +	u64 start_hidx = (u64)folio->index << params->log_blocks_per_page;
> +	u64 end_hidx = (((u64)folio->index + nr_pages) <<
> +			params->log_blocks_per_page) - 1;
> +	int level;
> +
> +	if (!inode->i_sb->s_vop->readahead_merkle_tree)
> +		return;
> +
> +	for (level = 0; level < params->num_levels; level++) {
> +		unsigned long level_start = params->level_start[level];
> +		unsigned long next_start_hidx = start_hidx >> params->log_arity;
> +		unsigned long next_end_hidx = end_hidx >> params->log_arity;
> +		pgoff_t start_idx = (level_start + next_start_hidx) >>
> +				params->log_blocks_per_page;
> +		pgoff_t end_idx = (level_start + next_end_hidx) >>
> +				params->log_blocks_per_page;
> +
> +		inode->i_sb->s_vop->readahead_merkle_tree(inode, start_idx,
> +				end_idx - start_idx + 1);
> +
> +		start_hidx = next_start_hidx;
> +		end_hidx = next_end_hidx;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(fsverity_readahead);
> +
>  /*
>   * Returns true if the hash block with index @hblock_idx in the tree, located in
>   * @hpage, has already been verified.
> @@ -114,8 +157,7 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
>   * Return: %true if the data block is valid, else %false.
>   */
>  static bool verify_data_block(struct inode *inode, struct fsverity_info *vi,
> -			      const struct fsverity_pending_block *dblock,
> -			      unsigned long max_ra_pages)
> +			      const struct fsverity_pending_block *dblock)
>  {
>  	const u64 data_pos = dblock->pos;
>  	const struct merkle_tree_params *params = &vi->tree_params;
> @@ -200,8 +242,7 @@ static bool verify_data_block(struct inode *inode, struct fsverity_info *vi,
>  			  (params->block_size - 1);
>  
>  		hpage = inode->i_sb->s_vop->read_merkle_tree_page(inode,
> -				hpage_idx, level == 0 ? min(max_ra_pages,
> -					params->tree_pages - hpage_idx) : 0);
> +				hpage_idx);
>  		if (IS_ERR(hpage)) {
>  			fsverity_err(inode,
>  				     "Error %ld reading Merkle tree page %lu",
> @@ -272,14 +313,12 @@ static bool verify_data_block(struct inode *inode, struct fsverity_info *vi,
>  
>  static void
>  fsverity_init_verification_context(struct fsverity_verification_context *ctx,
> -				   struct inode *inode,
> -				   unsigned long max_ra_pages)
> +				   struct inode *inode)
>  {
>  	struct fsverity_info *vi = *fsverity_info_addr(inode);
>  
>  	ctx->inode = inode;
>  	ctx->vi = vi;
> -	ctx->max_ra_pages = max_ra_pages;
>  	ctx->num_pending = 0;
>  	if (vi->tree_params.hash_alg->algo_id == HASH_ALGO_SHA256 &&
>  	    sha256_finup_2x_is_optimized())
> @@ -322,8 +361,7 @@ fsverity_verify_pending_blocks(struct fsverity_verification_context *ctx)
>  	}
>  
>  	for (i = 0; i < ctx->num_pending; i++) {
> -		if (!verify_data_block(ctx->inode, vi, &ctx->pending_blocks[i],
> -				       ctx->max_ra_pages))
> +		if (!verify_data_block(ctx->inode, vi, &ctx->pending_blocks[i]))
>  			return false;
>  	}
>  	fsverity_clear_pending_blocks(ctx);
> @@ -373,7 +411,7 @@ bool fsverity_verify_blocks(struct folio *folio, size_t len, size_t offset)
>  {
>  	struct fsverity_verification_context ctx;
>  
> -	fsverity_init_verification_context(&ctx, folio->mapping->host, 0);
> +	fsverity_init_verification_context(&ctx, folio->mapping->host);
>  
>  	if (fsverity_add_data_blocks(&ctx, folio, len, offset) &&
>  	    fsverity_verify_pending_blocks(&ctx))
> @@ -403,22 +441,8 @@ void fsverity_verify_bio(struct bio *bio)
>  	struct inode *inode = bio_first_folio_all(bio)->mapping->host;
>  	struct fsverity_verification_context ctx;
>  	struct folio_iter fi;
> -	unsigned long max_ra_pages = 0;
> -
> -	if (bio->bi_opf & REQ_RAHEAD) {
> -		/*
> -		 * If this bio is for data readahead, then we also do readahead
> -		 * of the first (largest) level of the Merkle tree.  Namely,
> -		 * when a Merkle tree page is read, we also try to piggy-back on
> -		 * some additional pages -- up to 1/4 the number of data pages.
> -		 *
> -		 * This improves sequential read performance, as it greatly
> -		 * reduces the number of I/O requests made to the Merkle tree.
> -		 */
> -		max_ra_pages = bio->bi_iter.bi_size >> (PAGE_SHIFT + 2);
> -	}
>  
> -	fsverity_init_verification_context(&ctx, inode, max_ra_pages);
> +	fsverity_init_verification_context(&ctx, inode);
>  
>  	bio_for_each_folio_all(fi, bio) {
>  		if (!fsverity_add_data_blocks(&ctx, fi.folio, fi.length,
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 121703625cc8..bade511cf3aa 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -97,10 +97,6 @@ struct fsverity_operations {
>  	 *
>  	 * @inode: the inode
>  	 * @index: 0-based index of the page within the Merkle tree
> -	 * @num_ra_pages: The number of Merkle tree pages that should be
> -	 *		  prefetched starting at @index if the page at @index
> -	 *		  isn't already cached.  Implementations may ignore this
> -	 *		  argument; it's only a performance optimization.
>  	 *
>  	 * This can be called at any time on an open verity file.  It may be
>  	 * called by multiple processes concurrently, even with the same page.
> @@ -110,8 +106,23 @@ struct fsverity_operations {
>  	 * Return: the page on success, ERR_PTR() on failure
>  	 */
>  	struct page *(*read_merkle_tree_page)(struct inode *inode,
> -					      pgoff_t index,
> -					      unsigned long num_ra_pages);
> +					      pgoff_t index);
> +
> +	/**
> +	 * Perform readahead of a Merkle tree for the given inode.
> +	 *
> +	 * @inode: the inode
> +	 * @index: 0-based index of the first page within the Merkle tree
> +	 * @nr_pages: number of pages to be read ahead.
> +	 *
> +	 * This can be called at any time on an open verity file.  It may be
> +	 * called by multiple processes concurrently, even with the same range.
> +	 *
> +	 * Optional method so that ->read_merkle_tree_page preferably finds
> +	 * cached data instead of issuing dependent I/O.
> +	 */
> +	void (*readahead_merkle_tree)(struct inode *inode, pgoff_t index,
> +			unsigned long nr_pages);
>  
>  	/**
>  	 * Write a Merkle tree block to the given inode.
> @@ -308,8 +319,10 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
>  }
>  
>  void fsverity_cleanup_inode(struct inode *inode);
> +void fsverity_readahead(struct folio *folio, unsigned long nr_pages);
>  
> -struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
> -		unsigned long num_ra_pages);
> +struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index);
> +void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
> +		unsigned long nr_pages);
>  
>  #endif	/* _LINUX_FSVERITY_H */
> -- 
> 2.47.3
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
