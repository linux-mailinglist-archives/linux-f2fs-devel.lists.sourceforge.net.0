Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CF543729
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 17:23:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyxWV-0004LT-NN; Wed, 08 Jun 2022 15:23:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <djwong@kernel.org>)
 id 1nyxWU-0004LJ-BQ; Wed, 08 Jun 2022 15:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EBEBsguk9B864LzDV1rxx+vKGHWqnsS1K2RzBp60+x4=; b=DHJMgC37VccEyHSmtFg/lccMt6
 NY9TXuAVqxv+i9H8Rp0bk3exNj3uKtIQt9DzsyvEWXggBagAwTf62DLSMc1CRAF6olWGmH84HnfMa
 YLFH1yG1viLk4l+EaNx0UHyUIS0R8E8Nv1qDE2t7Law5Hhh/qslTu6jZoTJ7xheP7Hoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EBEBsguk9B864LzDV1rxx+vKGHWqnsS1K2RzBp60+x4=; b=WPpCXw21LS9yOoYAplo51ZiamY
 w+c5ukH6ILzZ97HucO6kQZwNpfWUUYsieU8Ja5rrSYFR0PxbdBumQZW8vO2FymfkP0qeU+kGGyG7p
 pHvkO131TvjTQa6l511v2B/QZLlIQnD9WqVX2IXX/3BVs8rbCy9vdybNoNXVYM5myfvg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyxWS-009yvW-1g; Wed, 08 Jun 2022 15:23:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCEBAB82615;
 Wed,  8 Jun 2022 15:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D62AC34116;
 Wed,  8 Jun 2022 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654701776;
 bh=SgYW51aN3OeqjU6+EIk8CHclo6M6cc2uvUEPUetN9AY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p7z+0eY7ntbEVxA2gI3ZDLWM0mQwSUHKo0XnCgV0chmlHkz2P/vCANEjmqGsAdwGb
 EoSpjHFAP8n9bDzPCEYaP1TdvsHfTZs7ZO2YCb1PhaDgWMEewk0XhfG2S7DJV8N6Zq
 6BFFHYmv/C0EtAhNH8ykQ23VCX1LuObfUCtnf/2zRNky8BKsi3YeFoHUI0AgtoZtnU
 /s5ocIdJDBgJaNkjIJoR2ZyE63FMuzKBldotmlU9Pd6NrsbPX3n/4O3QNinmpI+xhS
 eF/3KfLyFpQXF2Gi5KoPPct1DqMaQ4m32g9c7heF/cNtqM6cQYwdFJN5c8DpxFzwH1
 PF1h9+AG7Xw/A==
Date: Wed, 8 Jun 2022 08:22:56 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <YqC+0J9/P1siKkBk@magnolia>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-12-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608150249.3033815-12-willy@infradead.org>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 08, 2022 at 04:02:41PM +0100,
 Matthew Wilcox (Oracle)
 wrote: > There is nothing iomap-specific about iomap_migratepage(), and it
 fits > a pattern used by several other filesystems, so move [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nyxWS-009yvW-1g
Subject: Re: [f2fs-dev] [PATCH v2 11/19] mm/migrate: Add
 filemap_migrate_folio()
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 08, 2022 at 04:02:41PM +0100, Matthew Wilcox (Oracle) wrote:
> There is nothing iomap-specific about iomap_migratepage(), and it fits
> a pattern used by several other filesystems, so move it to mm/migrate.c,
> convert it to be filemap_migrate_folio() and convert the iomap filesystems
> to use it.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

LGTM
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/gfs2/aops.c          |  2 +-
>  fs/iomap/buffered-io.c  | 25 -------------------------
>  fs/xfs/xfs_aops.c       |  2 +-
>  fs/zonefs/super.c       |  2 +-
>  include/linux/iomap.h   |  6 ------
>  include/linux/pagemap.h |  6 ++++++
>  mm/migrate.c            | 20 ++++++++++++++++++++
>  7 files changed, 29 insertions(+), 34 deletions(-)
> 
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 106e90a36583..57ff883d432c 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -774,7 +774,7 @@ static const struct address_space_operations gfs2_aops = {
>  	.invalidate_folio = iomap_invalidate_folio,
>  	.bmap = gfs2_bmap,
>  	.direct_IO = noop_direct_IO,
> -	.migratepage = iomap_migrate_page,
> +	.migrate_folio = filemap_migrate_folio,
>  	.is_partially_uptodate = iomap_is_partially_uptodate,
>  	.error_remove_page = generic_error_remove_page,
>  };
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 66278a14bfa7..5a91aa1db945 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -489,31 +489,6 @@ void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len)
>  }
>  EXPORT_SYMBOL_GPL(iomap_invalidate_folio);
>  
> -#ifdef CONFIG_MIGRATION
> -int
> -iomap_migrate_page(struct address_space *mapping, struct page *newpage,
> -		struct page *page, enum migrate_mode mode)
> -{
> -	struct folio *folio = page_folio(page);
> -	struct folio *newfolio = page_folio(newpage);
> -	int ret;
> -
> -	ret = folio_migrate_mapping(mapping, newfolio, folio, 0);
> -	if (ret != MIGRATEPAGE_SUCCESS)
> -		return ret;
> -
> -	if (folio_test_private(folio))
> -		folio_attach_private(newfolio, folio_detach_private(folio));
> -
> -	if (mode != MIGRATE_SYNC_NO_COPY)
> -		folio_migrate_copy(newfolio, folio);
> -	else
> -		folio_migrate_flags(newfolio, folio);
> -	return MIGRATEPAGE_SUCCESS;
> -}
> -EXPORT_SYMBOL_GPL(iomap_migrate_page);
> -#endif /* CONFIG_MIGRATION */
> -
>  static void
>  iomap_write_failed(struct inode *inode, loff_t pos, unsigned len)
>  {
> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index 8ec38b25187b..5d1a995b15f8 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -570,7 +570,7 @@ const struct address_space_operations xfs_address_space_operations = {
>  	.invalidate_folio	= iomap_invalidate_folio,
>  	.bmap			= xfs_vm_bmap,
>  	.direct_IO		= noop_direct_IO,
> -	.migratepage		= iomap_migrate_page,
> +	.migrate_folio		= filemap_migrate_folio,
>  	.is_partially_uptodate  = iomap_is_partially_uptodate,
>  	.error_remove_page	= generic_error_remove_page,
>  	.swap_activate		= xfs_iomap_swapfile_activate,
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index bcb21aea990a..d4c3f28f34ee 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -237,7 +237,7 @@ static const struct address_space_operations zonefs_file_aops = {
>  	.dirty_folio		= filemap_dirty_folio,
>  	.release_folio		= iomap_release_folio,
>  	.invalidate_folio	= iomap_invalidate_folio,
> -	.migratepage		= iomap_migrate_page,
> +	.migrate_folio		= filemap_migrate_folio,
>  	.is_partially_uptodate	= iomap_is_partially_uptodate,
>  	.error_remove_page	= generic_error_remove_page,
>  	.direct_IO		= noop_direct_IO,
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index e552097c67e0..758a1125e72f 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -231,12 +231,6 @@ void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops);
>  bool iomap_is_partially_uptodate(struct folio *, size_t from, size_t count);
>  bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags);
>  void iomap_invalidate_folio(struct folio *folio, size_t offset, size_t len);
> -#ifdef CONFIG_MIGRATION
> -int iomap_migrate_page(struct address_space *mapping, struct page *newpage,
> -		struct page *page, enum migrate_mode mode);
> -#else
> -#define iomap_migrate_page NULL
> -#endif
>  int iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
>  		const struct iomap_ops *ops);
>  int iomap_zero_range(struct inode *inode, loff_t pos, loff_t len,
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 1caccb9f99aa..2a67c0ad7348 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -1078,6 +1078,12 @@ static inline int __must_check write_one_page(struct page *page)
>  int __set_page_dirty_nobuffers(struct page *page);
>  bool noop_dirty_folio(struct address_space *mapping, struct folio *folio);
>  
> +#ifdef CONFIG_MIGRATION
> +int filemap_migrate_folio(struct address_space *mapping, struct folio *dst,
> +		struct folio *src, enum migrate_mode mode);
> +#else
> +#define filemap_migrate_folio NULL
> +#endif
>  void page_endio(struct page *page, bool is_write, int err);
>  
>  void folio_end_private_2(struct folio *folio);
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 785e32d0cf1b..4d8115ca93bb 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -784,6 +784,26 @@ int buffer_migrate_folio_norefs(struct address_space *mapping,
>  }
>  #endif
>  
> +int filemap_migrate_folio(struct address_space *mapping,
> +		struct folio *dst, struct folio *src, enum migrate_mode mode)
> +{
> +	int ret;
> +
> +	ret = folio_migrate_mapping(mapping, dst, src, 0);
> +	if (ret != MIGRATEPAGE_SUCCESS)
> +		return ret;
> +
> +	if (folio_get_private(src))
> +		folio_attach_private(dst, folio_detach_private(src));
> +
> +	if (mode != MIGRATE_SYNC_NO_COPY)
> +		folio_migrate_copy(dst, src);
> +	else
> +		folio_migrate_flags(dst, src);
> +	return MIGRATEPAGE_SUCCESS;
> +}
> +EXPORT_SYMBOL_GPL(filemap_migrate_folio);
> +
>  /*
>   * Writeback a folio to clean the dirty state
>   */
> -- 
> 2.35.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
