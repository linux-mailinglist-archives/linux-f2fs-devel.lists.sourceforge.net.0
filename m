Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C8611923
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 19:21:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooT2d-00079M-Hn;
	Fri, 28 Oct 2022 17:21:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1ooT2b-00079G-Fu
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 17:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nvMOfMh+l8FeXG1eI+W2orActk+jgm9N+IUR0MSnJ8k=; b=l/MFMeRt1odIocRk07IVOXvg4T
 scFAhab2w6ZM0lN4Njkgmatg18ma+d4X38yhb80wEt0ntRR2a8aFqECPmUK0SP3zj0bqb8oRy9ojl
 rgojyRCktWDgQy/K8OyonS5zklkmI+3EnWgkZTMZtLJTKWjxiFc579R+bjFHWsKwOuP0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nvMOfMh+l8FeXG1eI+W2orActk+jgm9N+IUR0MSnJ8k=; b=ddmKN/tSezn2AOktPPdMuzNQMx
 zL5CthtcM76Ur1FviaX7T0L+afG5zasbmnyiYejyVGW5djdA3O1jaaMgAJamLRslfLDacmy+afx4G
 SvoNm2m0cdGXMcFn5iXP93Qu+kCKOT4Vm8eSagcI4i+WUWzHDgajE8fZFyDiz8rAa+TY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooT2Z-003elP-Bj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 17:21:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F01DA629D3;
 Fri, 28 Oct 2022 17:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8D6C433D7;
 Fri, 28 Oct 2022 17:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666977661;
 bh=uyJa1FWOnVe5QL+ophLah4CnDuHIHyRvZavEqx4wGzs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=VAkIZkvbXAh6N0rVrNS2/2gKTqiw6CWJfN/vnT/v0od4lCqyF0FdxSMtViQBVo+YN
 KcRG899/aEVyj6k7GZ+lmntXgyE9D/SphU9cNVSr0SKp/crjPSV7c2nwszvC2fQQ78
 ReMCimKePZr4BYBR7fARCrs/A/A6/6hIdQcWumULtGFlLdVDfr9GtafAqGGRaagahA
 9xNWFRX/z8kjgJStzDo2keSKc/oqfvWRb0OQ53/4eJm4dtdVCBmspSpKDHd6MZ2Fl4
 pQhJN91cWwJ0N1BpR98RnSDMBEzGhh8KuUi5TSgNwsfjwyhkll6mRBGpekINVKt3uY
 hIDfCjcCHzMsA==
Message-ID: <95e1afd00e550ee227dd5d76a5947a2176730e1d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, 
 linux-fsdevel@vger.kernel.org, David Howells <dhowells@redhat.com>
Date: Fri, 28 Oct 2022 13:20:58 -0400
In-Reply-To: <20221017202451.4951-9-vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-9-vishal.moola@gmail.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2022-10-17 at 13:24 -0700,
 Vishal Moola (Oracle) wrote:
 > Convert function to use a folio_batch instead of pagevec. This is in >
 preparation for the removal of find_get_pages_range_tag(). > > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooT2Z-003elP-Bj
Subject: Re: [f2fs-dev] [PATCH v3 08/23] ceph: Convert
 ceph_writepages_start() to use filemap_get_folios_tag()
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
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2022-10-17 at 13:24 -0700, Vishal Moola (Oracle) wrote:
> Convert function to use a folio_batch instead of pagevec. This is in
> preparation for the removal of find_get_pages_range_tag().
> 
> Also some minor renaming for consistency.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/ceph/addr.c | 58 ++++++++++++++++++++++++++------------------------
>  1 file changed, 30 insertions(+), 28 deletions(-)
> 
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index dcf701b05cc1..d2361d51db39 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -792,7 +792,7 @@ static int ceph_writepages_start(struct address_space *mapping,
>  	struct ceph_vino vino = ceph_vino(inode);
>  	pgoff_t index, start_index, end = -1;
>  	struct ceph_snap_context *snapc = NULL, *last_snapc = NULL, *pgsnapc;
> -	struct pagevec pvec;
> +	struct folio_batch fbatch;
>  	int rc = 0;
>  	unsigned int wsize = i_blocksize(inode);
>  	struct ceph_osd_request *req = NULL;
> @@ -821,7 +821,7 @@ static int ceph_writepages_start(struct address_space *mapping,
>  	if (fsc->mount_options->wsize < wsize)
>  		wsize = fsc->mount_options->wsize;
>  
> -	pagevec_init(&pvec);
> +	folio_batch_init(&fbatch);
>  
>  	start_index = wbc->range_cyclic ? mapping->writeback_index : 0;
>  	index = start_index;
> @@ -869,7 +869,7 @@ static int ceph_writepages_start(struct address_space *mapping,
>  
>  	while (!done && index <= end) {
>  		int num_ops = 0, op_idx;
> -		unsigned i, pvec_pages, max_pages, locked_pages = 0;
> +		unsigned i, nr_folios, max_pages, locked_pages = 0;
>  		struct page **pages = NULL, **data_pages;
>  		struct page *page;
>  		pgoff_t strip_unit_end = 0;
> @@ -879,13 +879,13 @@ static int ceph_writepages_start(struct address_space *mapping,
>  		max_pages = wsize >> PAGE_SHIFT;
>  
>  get_more_pages:
> -		pvec_pages = pagevec_lookup_range_tag(&pvec, mapping, &index,
> -						end, PAGECACHE_TAG_DIRTY);
> -		dout("pagevec_lookup_range_tag got %d\n", pvec_pages);
> -		if (!pvec_pages && !locked_pages)
> +		nr_folios = filemap_get_folios_tag(mapping, &index,
> +				end, PAGECACHE_TAG_DIRTY, &fbatch);
> +		dout("pagevec_lookup_range_tag got %d\n", nr_folios);
> +		if (!nr_folios && !locked_pages)
>  			break;
> -		for (i = 0; i < pvec_pages && locked_pages < max_pages; i++) {
> -			page = pvec.pages[i];
> +		for (i = 0; i < nr_folios && locked_pages < max_pages; i++) {
> +			page = &fbatch.folios[i]->page;
>  			dout("? %p idx %lu\n", page, page->index);
>  			if (locked_pages == 0)
>  				lock_page(page);  /* first page */
> @@ -995,7 +995,7 @@ static int ceph_writepages_start(struct address_space *mapping,
>  				len = 0;
>  			}
>  
> -			/* note position of first page in pvec */
> +			/* note position of first page in fbatch */
>  			dout("%p will write page %p idx %lu\n",
>  			     inode, page, page->index);
>  
> @@ -1005,30 +1005,30 @@ static int ceph_writepages_start(struct address_space *mapping,
>  				fsc->write_congested = true;
>  
>  			pages[locked_pages++] = page;
> -			pvec.pages[i] = NULL;
> +			fbatch.folios[i] = NULL;
>  
>  			len += thp_size(page);
>  		}
>  
>  		/* did we get anything? */
>  		if (!locked_pages)
> -			goto release_pvec_pages;
> +			goto release_folios;
>  		if (i) {
>  			unsigned j, n = 0;
> -			/* shift unused page to beginning of pvec */
> -			for (j = 0; j < pvec_pages; j++) {
> -				if (!pvec.pages[j])
> +			/* shift unused page to beginning of fbatch */
> +			for (j = 0; j < nr_folios; j++) {
> +				if (!fbatch.folios[j])
>  					continue;
>  				if (n < j)
> -					pvec.pages[n] = pvec.pages[j];
> +					fbatch.folios[n] = fbatch.folios[j];
>  				n++;
>  			}
> -			pvec.nr = n;
> +			fbatch.nr = n;
>  
> -			if (pvec_pages && i == pvec_pages &&
> +			if (nr_folios && i == nr_folios &&
>  			    locked_pages < max_pages) {
> -				dout("reached end pvec, trying for more\n");
> -				pagevec_release(&pvec);
> +				dout("reached end fbatch, trying for more\n");
> +				folio_batch_release(&fbatch);
>  				goto get_more_pages;
>  			}
>  		}
> @@ -1164,10 +1164,10 @@ static int ceph_writepages_start(struct address_space *mapping,
>  		if (wbc->nr_to_write <= 0 && wbc->sync_mode == WB_SYNC_NONE)
>  			done = true;
>  
> -release_pvec_pages:
> -		dout("pagevec_release on %d pages (%p)\n", (int)pvec.nr,
> -		     pvec.nr ? pvec.pages[0] : NULL);
> -		pagevec_release(&pvec);
> +release_folios:
> +		dout("folio_batch release on %d folios (%p)\n", (int)fbatch.nr,
> +		     fbatch.nr ? fbatch.folios[0] : NULL);
> +		folio_batch_release(&fbatch);
>  	}
>  
>  	if (should_loop && !done) {
> @@ -1184,15 +1184,17 @@ static int ceph_writepages_start(struct address_space *mapping,
>  			unsigned i, nr;
>  			index = 0;
>  			while ((index <= end) &&
> -			       (nr = pagevec_lookup_tag(&pvec, mapping, &index,
> -						PAGECACHE_TAG_WRITEBACK))) {
> +			       (nr = filemap_get_folios_tag(mapping, &index,
> +						(pgoff_t)-1,
> +						PAGECACHE_TAG_WRITEBACK,
> +						&fbatch))) {
>  				for (i = 0; i < nr; i++) {
> -					page = pvec.pages[i];
> +					page = &fbatch.folios[i]->page;
>  					if (page_snap_context(page) != snapc)
>  						continue;
>  					wait_on_page_writeback(page);
>  				}
> -				pagevec_release(&pvec);
> +				folio_batch_release(&fbatch);
>  				cond_resched();
>  			}
>  		}

I took a brief look and this looks like a fairly straightforward
conversion. It definitely needs testing however.

The hope was to get ceph converted over to using the netfs write
helpers, but that's taking a lot longer than expected. It's really up to
Xiubo at this point, but I don't have an issue in principle with taking
this patch in before the netfs conversion, particularly if it's blocking
other work.

Acked-by: Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
