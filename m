Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A93950FB6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 00:24:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdzwI-0001dw-J6;
	Tue, 13 Aug 2024 22:24:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sdzwG-0001dp-RD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 22:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XCJ5L/qBbRtlqCgQHurGa6Pla/0fxN9Eh6Xk9bKi4Dc=; b=GNxYXqrGq6MWoHbKfGsDATQ0ah
 tcyFZm08XOR0cHReINI9HiZ2JI5/XOIQ4w+g5mylj9OzIc2tNGbiVE4qO8Qq5oQHsM2EqQVc14X0q
 J/cJBY4ZrvNaT1ODftwUSXpONPpFQdOvY/yMFlC6pfB5sUy5RkXKGneJPtmn8SDQIB2Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XCJ5L/qBbRtlqCgQHurGa6Pla/0fxN9Eh6Xk9bKi4Dc=; b=JW3tmZ7+ZPsnbuUFjrGn6r/PtW
 Jk46j4HuQaaGOYHebT7mg7o1NsRWugrnG9CSrpSHYDk9cGdTLzRNuAJJarjgnPiVO7f3QAMIjUkVc
 5MUoiwRB8Qfe2HaeIlkvvq7m2OtcETSE3On0w+3E7qf1GW4upUbO8s8IiU1sKmjkjrHM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdzwF-0000en-Fo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 22:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0BA59617E9;
 Tue, 13 Aug 2024 22:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F219C32782;
 Tue, 13 Aug 2024 22:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723587857;
 bh=FISE9M2iXKBizsZDyLHfPlfGorD8VjeOKo/Zy+6/20I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MrX6Or5fRLw/LYLHscOX0JQUcI40kv592n4OIBAuBU1sARxo8BAgDYUO9ByT5ueVX
 Xg+iHRjn/f8a7RNapmXmh8ohboE+K/WjixGgWGKK+7Ab3RQV2Fv+T7ncq7zPyXToHR
 ofotxbcA5DCI/xF4Kz7eFvtVTKrOWFwKmnhpPUY5ilumanY398kXaL/4GdayuiNJpv
 UpTbgAcY0XCCCRChYciEoFenF/9P1Ht34xlxY+oR9nLBi7fNEyJjPXF3aPED74h5Ef
 E2+Wu+I6fsWOOPTa4eQ6JF1ZK/icx+16iHQkTD8wI2WO64RPRA7huO12p1KQHZQyK2
 vQEc2AWnXeynw==
Date: Tue, 13 Aug 2024 22:24:15 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZrvdD6EVJAik1b5w@google.com>
References: <20240813141331.417067-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240813141331.417067-1-chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Could you please test this series? I hit kernel hang along
 with refcount warning in f2fs_put_dic, when running fsstress. You can reproduce
 it quickly. On 08/13, Chao Yu wrote: > onvert to use folio, so that we can
 get rid of 'page->index' to > prepare for removal of 'index' field in
 structure
 page [1]. > > [1] https://lore.kernel.org/all/Zp8fgUSIBGQ [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdzwF-0000en-Fo
Subject: Re: [f2fs-dev] [PATCH 1/9] f2fs: convert
 f2fs_compress_ctx_add_page() to use folio
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Could you please test this series? I hit kernel hang along with refcount warning
in f2fs_put_dic, when running fsstress. You can reproduce it quickly.

On 08/13, Chao Yu wrote:
> onvert to use folio, so that we can get rid of 'page->index' to
> prepare for removal of 'index' field in structure page [1].
> 
> [1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
> 
> Cc: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/compress.c | 14 +++++++-------
>  fs/f2fs/data.c     |  4 ++--
>  fs/f2fs/f2fs.h     |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 990b93689b46..eb5cd1457ffc 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -160,17 +160,17 @@ void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
>  		cc->cluster_idx = NULL_CLUSTER;
>  }
>  
> -void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
> +void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio *folio)
>  {
>  	unsigned int cluster_ofs;
>  
> -	if (!f2fs_cluster_can_merge_page(cc, page->index))
> +	if (!f2fs_cluster_can_merge_page(cc, folio->index))
>  		f2fs_bug_on(F2FS_I_SB(cc->inode), 1);
>  
> -	cluster_ofs = offset_in_cluster(cc, page->index);
> -	cc->rpages[cluster_ofs] = page;
> +	cluster_ofs = offset_in_cluster(cc, folio->index);
> +	cc->rpages[cluster_ofs] = folio_page(folio, 0);
>  	cc->nr_rpages++;
> -	cc->cluster_idx = cluster_idx(cc, page->index);
> +	cc->cluster_idx = cluster_idx(cc, folio->index);
>  }
>  
>  #ifdef CONFIG_F2FS_FS_LZO
> @@ -1093,7 +1093,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>  		if (PageUptodate(page))
>  			f2fs_put_page(page, 1);
>  		else
> -			f2fs_compress_ctx_add_page(cc, page);
> +			f2fs_compress_ctx_add_page(cc, page_folio(page));
>  	}
>  
>  	if (!f2fs_cluster_is_empty(cc)) {
> @@ -1123,7 +1123,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>  		}
>  
>  		f2fs_wait_on_page_writeback(page, DATA, true, true);
> -		f2fs_compress_ctx_add_page(cc, page);
> +		f2fs_compress_ctx_add_page(cc, page_folio(page));
>  
>  		if (!PageUptodate(page)) {
>  release_and_retry:
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index e9570f4e0f21..100b6526717f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2429,7 +2429,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  		if (ret)
>  			goto set_error_page;
>  
> -		f2fs_compress_ctx_add_page(&cc, &folio->page);
> +		f2fs_compress_ctx_add_page(&cc, folio);
>  
>  		goto next_page;
>  read_single_page:
> @@ -3161,7 +3161,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  			if (f2fs_compressed_file(inode)) {
>  				folio_get(folio);
> -				f2fs_compress_ctx_add_page(&cc, &folio->page);
> +				f2fs_compress_ctx_add_page(&cc, folio);
>  				continue;
>  			}
>  #endif
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 51fd5063a69c..df436dd3aac1 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4322,7 +4322,7 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
>  bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
>  				int index, int nr_pages, bool uptodate);
>  bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
> -void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
> +void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio *folio);
>  int f2fs_write_multi_pages(struct compress_ctx *cc,
>  						int *submitted,
>  						struct writeback_control *wbc,
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
