Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F0D6034E5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 23:28:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oku88-0004Qx-FO;
	Tue, 18 Oct 2022 21:28:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1oku87-0004Qn-8K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 21:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9c0MfmDDMiDyFxs6faLvTsiA3nu/af5/TaXNlBhXaNQ=; b=K6QE5xhaMWfGZUD3WiTPsJYuxI
 VShKxosvZtLftAcjYSxteGgI22GZA5542aam0bD/4aaH9tBnY80WneR6Kf7jfa5mEdBNFnqz+msDN
 M2UzvQgRdRappi8GD2GM/Dgo2G9MfwAy5ryi96MueiwWHUdEY4sBMzbvwlViqCmslT+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9c0MfmDDMiDyFxs6faLvTsiA3nu/af5/TaXNlBhXaNQ=; b=mLcHafLvUNcSrkf6JqFIu48aU3
 Zc0WTnWYvZEFt09IZ+ixXG5ri4mLKiSLnVAvXqU8Vtj1f3KsvWwii3bUobLuUylChGoscIIEKv/NX
 98jnl4ZOT2y3QhB+dhYYBP3PN3F2eQY2F5jGLHjCNt0PESWvcqJPBowWbY1H7S7avAzM=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1oku86-0005mt-94 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 21:28:07 +0000
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au
 [49.181.106.210])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 967678AE0CC;
 Wed, 19 Oct 2022 08:01:53 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oktii-003bE7-4J; Wed, 19 Oct 2022 08:01:52 +1100
Date: Wed, 19 Oct 2022 08:01:52 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <20221018210152.GH2703033@dread.disaster.area>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901220138.182896-5-vishal.moola@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=634f1443
 a=j6JUzzrSC7wlfFge/rmVbg==:117 a=j6JUzzrSC7wlfFge/rmVbg==:17
 a=kj9zAlcOel0A:10 a=Qawa6l4ZSaYA:10 a=pGLkceISAAAA:8 a=7-415B0cAAAA:8
 a=K-JhRxFi-CGouRt9WdAA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 01, 2022 at 03:01:19PM -0700,
 Vishal Moola (Oracle)
 wrote: > Converted function to use folios throughout. This is in preparation
 for > the removal of find_get_pages_range_tag(). > > Signed [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [211.29.132.246 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [211.29.132.246 listed in wl.mailspike.net]
X-Headers-End: 1oku86-0005mt-94
Subject: Re: [f2fs-dev] [PATCH 04/23] page-writeback: Convert
 write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
> Converted function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  mm/page-writeback.c | 44 +++++++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 032a7bf8d259..087165357a5a 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2285,15 +2285,15 @@ int write_cache_pages(struct address_space *mapping,
>  	int ret = 0;
>  	int done = 0;
>  	int error;
> -	struct pagevec pvec;
> -	int nr_pages;
> +	struct folio_batch fbatch;
> +	int nr_folios;
>  	pgoff_t index;
>  	pgoff_t end;		/* Inclusive */
>  	pgoff_t done_index;
>  	int range_whole = 0;
>  	xa_mark_t tag;
>  
> -	pagevec_init(&pvec);
> +	folio_batch_init(&fbatch);
>  	if (wbc->range_cyclic) {
>  		index = mapping->writeback_index; /* prev offset */
>  		end = -1;
> @@ -2313,17 +2313,18 @@ int write_cache_pages(struct address_space *mapping,
>  	while (!done && (index <= end)) {
>  		int i;
>  
> -		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> -				tag);
> -		if (nr_pages == 0)
> +		nr_folios = filemap_get_folios_tag(mapping, &index, end,
> +				tag, &fbatch);

This can find and return dirty multi-page folios if the filesystem
enables them in the mapping at instantiation time, right?

> +
> +		if (nr_folios == 0)
>  			break;
>  
> -		for (i = 0; i < nr_pages; i++) {
> -			struct page *page = pvec.pages[i];
> +		for (i = 0; i < nr_folios; i++) {
> +			struct folio *folio = fbatch.folios[i];
>  
> -			done_index = page->index;
> +			done_index = folio->index;
>  
> -			lock_page(page);
> +			folio_lock(folio);
>  
>  			/*
>  			 * Page truncated or invalidated. We can freely skip it
> @@ -2333,30 +2334,30 @@ int write_cache_pages(struct address_space *mapping,
>  			 * even if there is now a new, dirty page at the same
>  			 * pagecache address.
>  			 */
> -			if (unlikely(page->mapping != mapping)) {
> +			if (unlikely(folio->mapping != mapping)) {
>  continue_unlock:
> -				unlock_page(page);
> +				folio_unlock(folio);
>  				continue;
>  			}
>  
> -			if (!PageDirty(page)) {
> +			if (!folio_test_dirty(folio)) {
>  				/* someone wrote it for us */
>  				goto continue_unlock;
>  			}
>  
> -			if (PageWriteback(page)) {
> +			if (folio_test_writeback(folio)) {
>  				if (wbc->sync_mode != WB_SYNC_NONE)
> -					wait_on_page_writeback(page);
> +					folio_wait_writeback(folio);
>  				else
>  					goto continue_unlock;
>  			}
>  
> -			BUG_ON(PageWriteback(page));
> -			if (!clear_page_dirty_for_io(page))
> +			BUG_ON(folio_test_writeback(folio));
> +			if (!folio_clear_dirty_for_io(folio))
>  				goto continue_unlock;
>  
>  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
> -			error = (*writepage)(page, wbc, data);
> +			error = writepage(&folio->page, wbc, data);

Yet, IIUC, this treats all folios as if they are single page folios.
i.e. it passes the head page of a multi-page folio to a callback
that will treat it as a single PAGE_SIZE page, because that's all
the writepage callbacks are currently expected to be passed...

So won't this break writeback of dirty multipage folios?

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
