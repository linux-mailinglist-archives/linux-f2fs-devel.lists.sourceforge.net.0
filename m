Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9524C134DE7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 21:50:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipIHF-0008Ip-Rh; Wed, 08 Jan 2020 20:50:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ipIHE-0008Ii-My
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 20:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kHRK09mJ8rTjIWo1X6T606nnci3H2fbueQWF/G6s9Ng=; b=IawjOscyUbFief1LPYT+OxNecY
 D+fDdWPpdoTn0NejCcgp4ARe+emvjSvp90qdUm503aI5yPdOdbEpVa6rV9cwdd7lVOxS4pOf4v4T7
 49aly7c1yrUp04AwlnE+gRlq1hPbvY+39ULQpOORMppiUe1692cRVgSyVovgj7AQ+At8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kHRK09mJ8rTjIWo1X6T606nnci3H2fbueQWF/G6s9Ng=; b=mmAAofneF5u93w35wwCB1adSDI
 q9tubqF+Kqr1H3t95MRRY2eMGOzsvu7zwqX0/cciAfaUJPoRsi70pLmK0RzhQHk9xPKZ1UhAMNjxR
 vqT51KSrzs1PYwNNK4bXMOT635V0c8QyKMi7Dnxjw4l9rLwyS0ggubfQdjbf6cyuSAnE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipIHC-00EuMt-4q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 20:50:04 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1B3F206DB;
 Wed,  8 Jan 2020 20:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578516591;
 bh=RoGyoxDjbmh57ZZyR6e3bepLtqCh5hqe8I/Oj1/AnkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nEP25404Vj17mJBZ/HZTJvolNiedCiANYMD0o9tuLERpiN96XVn4eMyDNideENRJ1
 KlIfDTSu08HhqtmDiArry0dKlMZRLrj/se9q0JVg0brPkFb9u7OrkNWKH8j1Ij9lci
 GfN2cRGOCqgB5mX7h7iRl7rs6tRdnXwLuEcmd+ew=
Date: Wed, 8 Jan 2020 12:49:50 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200108204950.GD28331@jaegeuk-macbookpro.roam.corp.google.com>
References: <20200106080144.52363-1-yuchao0@huawei.com>
 <20200106080144.52363-3-yuchao0@huawei.com>
 <20200106190809.GE50058@jaegeuk-macbookpro.roam.corp.google.com>
 <e5c45ba2-6437-c84a-11b3-abe8c16a5c6c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5c45ba2-6437-c84a-11b3-abe8c16a5c6c@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ipIHC-00EuMt-4q
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: compress: fix error path in
 prepare_compress_overwrite()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/07, Chao Yu wrote:
> On 2020/1/7 3:08, Jaegeuk Kim wrote:
> > On 01/06, Chao Yu wrote:
> >> - fix to release cluster pages in retry flow
> >> - fix to call f2fs_put_dnode() & __do_map_lock() in error path
> >>
> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >> ---
> >>  fs/f2fs/compress.c | 22 ++++++++++++++++------
> >>  1 file changed, 16 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> >> index fc4510729654..3390351d2e39 100644
> >> --- a/fs/f2fs/compress.c
> >> +++ b/fs/f2fs/compress.c
> >> @@ -626,20 +626,26 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
> >>  	}
> >>  
> >>  	for (i = 0; i < cc->cluster_size; i++) {
> >> +		f2fs_bug_on(sbi, cc->rpages[i]);
> >> +
> >>  		page = find_lock_page(mapping, start_idx + i);
> >>  		f2fs_bug_on(sbi, !page);
> >>  
> >>  		f2fs_wait_on_page_writeback(page, DATA, true, true);
> >>  
> >> -		cc->rpages[i] = page;
> >> +		f2fs_compress_ctx_add_page(cc, page);
> >>  		f2fs_put_page(page, 0);
> >>  
> >>  		if (!PageUptodate(page)) {
> >> -			for (idx = 0; idx < cc->cluster_size; idx++) {
> >> -				f2fs_put_page(cc->rpages[idx],
> >> -						(idx <= i) ? 1 : 0);
> >> +			for (idx = 0; idx <= i; idx++) {
> >> +				unlock_page(cc->rpages[idx]);
> >>  				cc->rpages[idx] = NULL;
> >>  			}
> >> +			for (idx = 0; idx < cc->cluster_size; idx++) {
> >> +				page = find_lock_page(mapping, start_idx + idx);
> > 
> > Why do we need to lock the pages again?
> 
> Here, all pages in cluster has one extra reference count, we need to find all
> pages, and release those references on them.
> 
> cc->rpages may not record all pages' pointers, so we can not use
> 
> f2fs_put_page(cc->rpages[idx], (idx <= i) ? 1 : 0); to release all pages' references.
> 
> BTW, find_get_page() should be fine to instead find_lock_page().

Could you take a look at this?

https://github.com/jaegeuk/f2fs/commit/2e4ea726633dd2666f57ae88dfec5d97694d6495


Thanks,

> 
> > 
> >> +				f2fs_put_page(page, 1);
> >> +				f2fs_put_page(page, 0);
> >> +			}
> >>  			kvfree(cc->rpages);
> >>  			cc->nr_rpages = 0;
> >>  			goto retry;
> >> @@ -654,16 +660,20 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
> >>  		for (i = cc->cluster_size - 1; i > 0; i--) {
> >>  			ret = f2fs_get_block(&dn, start_idx + i);
> >>  			if (ret) {
> >> -				/* TODO: release preallocate blocks */
> >>  				i = cc->cluster_size;
> >> -				goto unlock_pages;
> >> +				break;
> >>  			}
> >>  
> >>  			if (dn.data_blkaddr != NEW_ADDR)
> >>  				break;
> >>  		}
> >>  
> >> +		f2fs_put_dnode(&dn);
> > 
> > We don't neeed this, since f2fs_reserve_block() put the dnode.
> 
> Correct.
> 
> Thanks,
> 
> > 
> >> +
> >>  		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
> >> +
> >> +		if (ret)
> >> +			goto unlock_pages;
> >>  	}
> >>  
> >>  	*fsdata = cc->rpages;
> >> -- 
> >> 2.18.0.rc1
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
