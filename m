Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070A64D516
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 02:49:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5dMn-00031g-Je;
	Thu, 15 Dec 2022 01:48:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p5dMm-00031Y-Ba
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 01:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q+ycp5ukneiNa3xJU2JiD6SAReCy62klbbgoW451CDY=; b=mfCqYVsTPKXyqVBHIe42N+2Rxj
 lczWxqbbukkeHt8hK439nGfPoVcZsUV0/hSDZgxmiQMAV4tXJpHch+kUxm2yu/uMmlgoPStgOBO+K
 GgOCyHcT2bnM4OFfhSZKJ78OdJ6D1beG519GMLBPB9kZTx/UMKmTWGiR1U5+UAvOymvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q+ycp5ukneiNa3xJU2JiD6SAReCy62klbbgoW451CDY=; b=ICYdTDEysu+loOcsP6QmU54bWu
 KO0nlhFCuuWRfSOrjBp4mh2j5FUOdyybpiPIXrg2QJwUoMprsQNRH/SLZeny30RjwckZY2+NzZZr5
 G6k7y0U0iIdtNy5rw2uYs9eQsolD9uh0nkIwWGSjwIKeWXqkunZxv/lsfPQvJaKn1D3s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5dMl-0002QK-HP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 01:48:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1F7561CB4;
 Thu, 15 Dec 2022 01:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56FDC433EF;
 Thu, 15 Dec 2022 01:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671068925;
 bh=ojlxsqHj3+udjuB/zrA6wUVW60/Z8ZKDNPvSfZT7Efw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dOd9p0hIwuZZIOBJQh5ug6BMt9lDvWcd6AUyY9paTGx2xxa9gHoWUE+aKWjZRsnwI
 k5UdHjluDM1CEQbv0150adrYFUxyko/PBS9fJB9Tvu1kMZ5JNC86+sRmS/7I8iMytO
 CwW4T1eyL+ImKY8ASgyk54byohY1nxG1maXQBkCzWoGQtasLa/EPTDxorocKr2dHHB
 /9/3wX4gpJ0Sh71mwdByqZYaA13wHrhHgLMuN+GThj0c2E1iqM0Xx0h5NmUQQArsDu
 pvIGbFRWIGl55UMnatv8rWT8iBIb0FO+UrJjA+XdwJFay6cCdV91dU10jmqYwk9OXI
 oUYUdFN/yFZFg==
Message-ID: <6770f692-490e-34fc-46f8-4f65aa071f58@kernel.org>
Date: Thu, 15 Dec 2022 09:48:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
References: <0a95ba7b-9335-ce03-0f47-5d9f4cce988f@kernel.org>
 <20221212191317.9730-1-vishal.moola@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221212191317.9730-1-vishal.moola@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/13 3:13, Vishal Moola (Oracle) wrote: > Converted
 the function to use a folio_batch instead of pagevec. This is in > preparation
 for the removal of find_get_pages_range_tag(). > > Also modi [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5dMl-0002QK-HP
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: Convert f2fs_write_cache_pages()
 to use filemap_get_folios_tag()
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/13 3:13, Vishal Moola (Oracle) wrote:
> Converted the function to use a folio_batch instead of pagevec. This is in
> preparation for the removal of find_get_pages_range_tag().
> 
> Also modified f2fs_all_cluster_page_ready to take in a folio_batch instead
> of pagevec. This does NOT support large folios. The function currently
> only utilizes folios of size 1 so this shouldn't cause any issues right
> now.
> 
> This version of the patch limits the number of pages fetched to
> F2FS_ONSTACK_PAGES. If that ever happens, update the start index here
> since filemap_get_folios_tag() updates the index to be after the last
> found folio, not necessarily the last used page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
> 
> Let me know if you prefer this version and I'll include it in v5
> of the patch series when I rebase it after the merge window.
> 
> ---
>   fs/f2fs/data.c | 86 ++++++++++++++++++++++++++++++++++----------------
>   1 file changed, 59 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a71e818cd67b..1703e353f0e0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2939,6 +2939,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   	int ret = 0;
>   	int done = 0, retry = 0;
>   	struct page *pages[F2FS_ONSTACK_PAGES];
> +	struct folio_batch fbatch;
>   	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
>   	struct bio *bio = NULL;
>   	sector_t last_block;
> @@ -2959,6 +2960,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   		.private = NULL,
>   	};
>   #endif
> +	int nr_folios, p, idx;
>   	int nr_pages;
>   	pgoff_t index;
>   	pgoff_t end;		/* Inclusive */
> @@ -2969,6 +2971,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   	int submitted = 0;
>   	int i;
>   
> +	folio_batch_init(&fbatch);
> +
>   	if (get_dirty_pages(mapping->host) <=
>   				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
>   		set_inode_flag(mapping->host, FI_HOT_DATA);
> @@ -2994,13 +2998,38 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   		tag_pages_for_writeback(mapping, index, end);
>   	done_index = index;
>   	while (!done && !retry && (index <= end)) {
> -		nr_pages = find_get_pages_range_tag(mapping, &index, end,
> -				tag, F2FS_ONSTACK_PAGES, pages);
> -		if (nr_pages == 0)
> +		nr_pages = 0;
> +again:
> +		nr_folios = filemap_get_folios_tag(mapping, &index, end,
> +				tag, &fbatch);
> +		if (nr_folios == 0) {
> +			if (nr_pages)
> +				goto write;
>   			break;
> +		}
>   
> +		for (i = 0; i < nr_folios; i++) {
> +			struct folio* folio = fbatch.folios[i];
> +
> +			idx = 0;
> +			p = folio_nr_pages(folio);
> +add_more:
> +			pages[nr_pages] = folio_page(folio,idx);
> +			folio_ref_inc(folio);

It looks if CONFIG_LRU_GEN is not set, folio_ref_inc() does nothing. For those
folios recorded in pages array, we need to call folio_get() here to add one more
reference on each of them?

> +			if (++nr_pages == F2FS_ONSTACK_PAGES) {
> +				index = folio->index + idx + 1;
> +				folio_batch_release(&fbatch);

Otherwise after folio_batch_release(), it may cause use-after-free issue
when accessing pages array? Or am I missing something?

> +				goto write;
> +			}
> +			if (++idx < p)
> +				goto add_more;
> +		}
> +		folio_batch_release(&fbatch);
> +		goto again;
> +write:
>   		for (i = 0; i < nr_pages; i++) {
>   			struct page *page = pages[i];
> +			struct folio *folio = page_folio(page);
>   			bool need_readd;
>   readd:
>   			need_readd = false;
> @@ -3017,7 +3046,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   				}
>   
>   				if (!f2fs_cluster_can_merge_page(&cc,
> -								page->index)) {
> +								folio->index)) {
>   					ret = f2fs_write_multi_pages(&cc,
>   						&submitted, wbc, io_type);
>   					if (!ret)
> @@ -3026,27 +3055,28 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   				}
>   
>   				if (unlikely(f2fs_cp_error(sbi)))
> -					goto lock_page;
> +					goto lock_folio;
>   
>   				if (!f2fs_cluster_is_empty(&cc))
> -					goto lock_page;
> +					goto lock_folio;
>   
>   				if (f2fs_all_cluster_page_ready(&cc,
>   					pages, i, nr_pages, true))
> -					goto lock_page;
> +					goto lock_folio;
>   
>   				ret2 = f2fs_prepare_compress_overwrite(
>   							inode, &pagep,
> -							page->index, &fsdata);
> +							folio->index, &fsdata);
>   				if (ret2 < 0) {
>   					ret = ret2;
>   					done = 1;
>   					break;
>   				} else if (ret2 &&
>   					(!f2fs_compress_write_end(inode,
> -						fsdata, page->index, 1) ||
> +						fsdata, folio->index, 1) ||
>   					 !f2fs_all_cluster_page_ready(&cc,
> -						pages, i, nr_pages, false))) {
> +						pages, i, nr_pages,
> +						false))) {
>   					retry = 1;
>   					break;
>   				}
> @@ -3059,46 +3089,47 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   				break;
>   			}
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> -lock_page:
> +lock_folio:
>   #endif
> -			done_index = page->index;
> +			done_index = folio->index;
>   retry_write:
> -			lock_page(page);
> +			folio_lock(folio);
>   
> -			if (unlikely(page->mapping != mapping)) {
> +			if (unlikely(folio->mapping != mapping)) {
>   continue_unlock:
> -				unlock_page(page);
> +				folio_unlock(folio);
>   				continue;
>   			}
>   
> -			if (!PageDirty(page)) {
> +			if (!folio_test_dirty(folio)) {
>   				/* someone wrote it for us */
>   				goto continue_unlock;
>   			}
>   
> -			if (PageWriteback(page)) {
> +			if (folio_test_writeback(folio)) {
>   				if (wbc->sync_mode != WB_SYNC_NONE)
> -					f2fs_wait_on_page_writeback(page,
> +					f2fs_wait_on_page_writeback(
> +							&folio->page,
>   							DATA, true, true);
>   				else
>   					goto continue_unlock;
>   			}
>   
> -			if (!clear_page_dirty_for_io(page))
> +			if (!folio_clear_dirty_for_io(folio))
>   				goto continue_unlock;
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   			if (f2fs_compressed_file(inode)) {
> -				get_page(page);
> -				f2fs_compress_ctx_add_page(&cc, page);
> +				folio_get(folio);
> +				f2fs_compress_ctx_add_page(&cc, &folio->page);
>   				continue;
>   			}
>   #endif
> -			ret = f2fs_write_single_data_page(page, &submitted,
> -					&bio, &last_block, wbc, io_type,
> -					0, true);
> +			ret = f2fs_write_single_data_page(&folio->page,
> +					&submitted, &bio, &last_block,
> +					wbc, io_type, 0, true);
>   			if (ret == AOP_WRITEPAGE_ACTIVATE)
> -				unlock_page(page);
> +				folio_unlock(folio);
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   result:
>   #endif
> @@ -3122,7 +3153,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   					}
>   					goto next;
>   				}
> -				done_index = page->index + 1;
> +				done_index = folio->index +
> +					folio_nr_pages(folio);
>   				done = 1;
>   				break;
>   			}
> @@ -3136,7 +3168,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   			if (need_readd)
>   				goto readd;
>   		}
> -		release_pages(pages, nr_pages);
> +		release_pages(pages,nr_pages);

No need to change?

Thanks,

>   		cond_resched();
>   	}
>   #ifdef CONFIG_F2FS_FS_COMPRESSION


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
