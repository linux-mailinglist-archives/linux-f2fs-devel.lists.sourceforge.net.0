Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16126618B75
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Nov 2022 23:28:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqihL-0000Ce-0r;
	Thu, 03 Nov 2022 22:28:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqih6-0000CN-GZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 22:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=04TfsshirPxCNoji6KR6vQQ5/+Nqz1IUHQcJvZJx5NI=; b=c4nks03aZufPAvRnloa7sWvx0Q
 1ZnlZwdFGWvWWmh87yE2sZmSjyuLl6YNizNwz796ACtolOE8/8u33npMGOQF05DwrXnTxKcDXemCb
 BudDoFvTcjpm9YMUHPSKFa9hQlt3DHAEZ+TxYOiJZPPkHqqvGZzeRxv5kyHWN1wves1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=04TfsshirPxCNoji6KR6vQQ5/+Nqz1IUHQcJvZJx5NI=; b=eozYUViLYveiLOPabwajGsRjJr
 BL00zbBfMO88EeNtCZm3WC1jcLOrlNkVapSsmmxoUS0uvT9GeweXzkHQFIsPDiAu53glQOL4ldVB8
 36pMh2HF5p/Q1KcjbTDmC/Npqkj2Mr6eOxM6WZIYYoVau93iPbqMdPmBJfzZ+Eq8FkSI=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqih4-00B5SV-GR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 22:28:15 +0000
Received: by mail-pf1-f179.google.com with SMTP id g62so2915136pfb.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Nov 2022 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=04TfsshirPxCNoji6KR6vQQ5/+Nqz1IUHQcJvZJx5NI=;
 b=i5grfA60bPrUFTlgsPlduW3hAvcmtFixLYcSxpxknTbqWlzA5eSDZo2QxGbmEUX4Ez
 PFC90kceZfOYR3I9pFhRCfv942PHFd9bUJonaLnIBlhLHWOGJXBFiGYfo6vJUukVtx/7
 soCCVDQxzU6Aa5VrIKCIba0AAxBy8QcPqjem6y+c0iOC2pXque67sr+L4UHpFitkorkA
 KMkKnCOU4SFkyF64UZjc/aMbE0utm6aLXgpH+aZ18gtX0Gatb6OKO9Qq/MuBrV4+6ZLy
 XXGAcHiwHa5E1MOTVLelV8aravzzQvF3MR4c2sDr0OACn3OsrYzVSuuzdbXfd6Ax3gqr
 R5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=04TfsshirPxCNoji6KR6vQQ5/+Nqz1IUHQcJvZJx5NI=;
 b=PQsK9gLikmP3ksLck1zNb6fabG5GudDgGDB6x1sRtEQ/D9rVKXl0qxiGI5cLvzmvr9
 09fCQqHsC6QahsQUwtLSH9vcJ+8NNMbiEz90sobgqAl5qFrVE2NHj/uU7XBmWbfx14OG
 kTruGwX1hHNy6egunQ8DdXtExLUSHGO1os/BML/CZUK6dg+knfSOvczx5piktIpdBukU
 1ktBr3CKOrEbfcUQIV7mnJagwPxnnSeva4IDmfTQdirYR/+mDadFpSeVrSMgSinuIa8z
 o1rUf1tOHUrEYJ/vIcLNboKkoM8F0c8n28I4YNCpzHVTFQLewuSC9N+P7TbxGaME4gy7
 JZFQ==
X-Gm-Message-State: ACrzQf0Mdh5rtVZwEdLUmsxWGU2iLxptqVpCPVYNPzVMm6lvjIQ/2tXz
 dGtRS4sb670tLa3cvU7cThg=
X-Google-Smtp-Source: AMsMyM7hE1bfSjSUUen+m8TVmotDYU/np98yLJV1t++FadjOyzDId3GOm6PXy0DRJG1AjfsRAwszyw==
X-Received: by 2002:a05:6a00:1a4d:b0:563:a7c4:f521 with SMTP id
 h13-20020a056a001a4d00b00563a7c4f521mr32742358pfv.61.1667514488876; 
 Thu, 03 Nov 2022 15:28:08 -0700 (PDT)
Received: from fedora ([2601:644:8002:1c20::8080])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a170902da9000b00186b86ed450sm1169376plx.156.2022.11.03.15.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:28:08 -0700 (PDT)
Date: Thu, 3 Nov 2022 15:28:05 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <Y2RAdUtJrOJmYU4L@fedora>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
 <20221018210152.GH2703033@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018210152.GH2703033@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote:
 > On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
 > > Converted function to use folios throughout. This is in prepa [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqih4-00B5SV-GR
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
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote:
> On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
> > Converted function to use folios throughout. This is in preparation for
> > the removal of find_get_pages_range_tag().
> > 
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  mm/page-writeback.c | 44 +++++++++++++++++++++++---------------------
> >  1 file changed, 23 insertions(+), 21 deletions(-)
> > 
> > diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> > index 032a7bf8d259..087165357a5a 100644
> > --- a/mm/page-writeback.c
> > +++ b/mm/page-writeback.c
> > @@ -2285,15 +2285,15 @@ int write_cache_pages(struct address_space *mapping,
> >  	int ret = 0;
> >  	int done = 0;
> >  	int error;
> > -	struct pagevec pvec;
> > -	int nr_pages;
> > +	struct folio_batch fbatch;
> > +	int nr_folios;
> >  	pgoff_t index;
> >  	pgoff_t end;		/* Inclusive */
> >  	pgoff_t done_index;
> >  	int range_whole = 0;
> >  	xa_mark_t tag;
> >  
> > -	pagevec_init(&pvec);
> > +	folio_batch_init(&fbatch);
> >  	if (wbc->range_cyclic) {
> >  		index = mapping->writeback_index; /* prev offset */
> >  		end = -1;
> > @@ -2313,17 +2313,18 @@ int write_cache_pages(struct address_space *mapping,
> >  	while (!done && (index <= end)) {
> >  		int i;
> >  
> > -		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> > -				tag);
> > -		if (nr_pages == 0)
> > +		nr_folios = filemap_get_folios_tag(mapping, &index, end,
> > +				tag, &fbatch);
> 
> This can find and return dirty multi-page folios if the filesystem
> enables them in the mapping at instantiation time, right?

Yup, it will.

> > +
> > +		if (nr_folios == 0)
> >  			break;
> >  
> > -		for (i = 0; i < nr_pages; i++) {
> > -			struct page *page = pvec.pages[i];
> > +		for (i = 0; i < nr_folios; i++) {
> > +			struct folio *folio = fbatch.folios[i];
> >  
> > -			done_index = page->index;
> > +			done_index = folio->index;
> >  
> > -			lock_page(page);
> > +			folio_lock(folio);
> >  
> >  			/*
> >  			 * Page truncated or invalidated. We can freely skip it
> > @@ -2333,30 +2334,30 @@ int write_cache_pages(struct address_space *mapping,
> >  			 * even if there is now a new, dirty page at the same
> >  			 * pagecache address.
> >  			 */
> > -			if (unlikely(page->mapping != mapping)) {
> > +			if (unlikely(folio->mapping != mapping)) {
> >  continue_unlock:
> > -				unlock_page(page);
> > +				folio_unlock(folio);
> >  				continue;
> >  			}
> >  
> > -			if (!PageDirty(page)) {
> > +			if (!folio_test_dirty(folio)) {
> >  				/* someone wrote it for us */
> >  				goto continue_unlock;
> >  			}
> >  
> > -			if (PageWriteback(page)) {
> > +			if (folio_test_writeback(folio)) {
> >  				if (wbc->sync_mode != WB_SYNC_NONE)
> > -					wait_on_page_writeback(page);
> > +					folio_wait_writeback(folio);
> >  				else
> >  					goto continue_unlock;
> >  			}
> >  
> > -			BUG_ON(PageWriteback(page));
> > -			if (!clear_page_dirty_for_io(page))
> > +			BUG_ON(folio_test_writeback(folio));
> > +			if (!folio_clear_dirty_for_io(folio))
> >  				goto continue_unlock;
> >  
> >  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
> > -			error = (*writepage)(page, wbc, data);
> > +			error = writepage(&folio->page, wbc, data);
> 
> Yet, IIUC, this treats all folios as if they are single page folios.
> i.e. it passes the head page of a multi-page folio to a callback
> that will treat it as a single PAGE_SIZE page, because that's all
> the writepage callbacks are currently expected to be passed...
> 
> So won't this break writeback of dirty multipage folios?

Yes, it appears it would. But it wouldn't because its already 'broken'.

The current find_get_pages_range_tag() actually has the exact same
issue. The current code to fill up the pages array is:

		pages[ret] = &folio->page;
		if (++ret == nr_pages) {
			*index = folio->index + folio_nr_pages(folio);
			goto out;

which behaves the same way as the issue you pointed out (both break
large folios). When I spoke to Matthew about this earlier, we decided
to go ahead with replacing the function and leave it up to the callers
to fix/handle large folios when the filesystem gets to it.

Its not great to leave it 'broken' but its something that isn't - or at
least shouldn't be - creating any problems at present. And I believe Matthew
has plans to address them at some point before they actually become problems?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
