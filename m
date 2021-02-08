Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7D03129C2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Feb 2021 05:36:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8yHR-0003Ts-WC; Mon, 08 Feb 2021 04:36:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1l8yHQ-0003Tl-DQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Feb 2021 04:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fff6EgYEONQGPdxj/+38H8nhCGp4k7BOYNNAQxk1u2s=; b=io+prBCOR8kohiUNNvhOQx6tz4
 MPOQoc0BaWk3aw0Ly7mmVKg/4inQpT36L45Bn5PpN8Wg74d1gseFWDjWUHIr24BjIAG58d9ta9GTP
 HT190JHooOFQjIx8qk19uRRlE+3qlZQXeVdOYJcrXkHurbnvZGr0jlFqaf546rxVqAIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fff6EgYEONQGPdxj/+38H8nhCGp4k7BOYNNAQxk1u2s=; b=eXgW+ycziYi79kYLx0zF8H5aq7
 wNZn+VCnKZsIVJ5hOdnonbxRLfAkK4MRxPz0xIpPrMtmHETA7HtRfKMs5rLDgZAQPvgmjZV3qpD4l
 70jmU62jVnkHk182TeeNnfzQLxNqa3VB1Yl1GRXzwIiq+wLY4iI69o7roDQ5MzKo4ngI=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l8yHA-0003Kt-R4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Feb 2021 04:36:08 +0000
IronPort-SDR: WSD5fYPzV9u4LgJyaPcew/zJAFl3K/bBQhAUT4ZYgG7odVezF/k7s0BAjWqmBaCA8PtUfrIZDA
 54v23222Y0dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="200712551"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="200712551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 20:35:46 -0800
IronPort-SDR: 4emt90bFPXkomAEhMAD/amfAwA5qVmGt0sO4/tEOTDnxbNYF4BpZw3GHR0aFYD7ulF1hKkEC4B
 kY6KjbpkbPNQ==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="435473654"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 20:35:46 -0800
Date: Sun, 7 Feb 2021 20:35:46 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20210208043545.GF5033@iweiny-DESK2.sc.intel.com>
References: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
 <20210207190425.38107-3-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210207190425.38107-3-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l8yHA-0003Kt-R4
Subject: Re: [f2fs-dev] [RFC PATCH 2/8] brd: use memcpy_from_page() in
 copy_from_brd()
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
Cc: axboe@kernel.dk, ebiggers@kernel.org, damien.lemoal@wdc.com, tytso@mit.edu,
 bvanassche@acm.org, hch@infradead.org, johannes.thumshirn@wdc.com,
 dave.hansen@intel.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, adilger.kernel@dilger.ca,
 dongli.zhang@oracle.com, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dsterba@suse.com, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Feb 07, 2021 at 11:04:19AM -0800, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> ---
>  drivers/block/brd.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/block/brd.c b/drivers/block/brd.c
> index d41b7d489e9f..c1f6d768a1b3 100644
> --- a/drivers/block/brd.c
> +++ b/drivers/block/brd.c
> @@ -220,7 +220,6 @@ static void copy_from_brd(void *dst, struct brd_device *brd,
>  			sector_t sector, size_t n)
>  {
>  	struct page *page;
> -	void *src;
>  	unsigned int offset = (sector & (PAGE_SECTORS-1)) << SECTOR_SHIFT;
>  	size_t copy;
>  
> @@ -236,11 +235,9 @@ static void copy_from_brd(void *dst, struct brd_device *brd,
>  		sector += copy >> SECTOR_SHIFT;
>  		copy = n - copy;
>  		page = brd_lookup_page(brd, sector);
> -		if (page) {
> -			src = kmap_atomic(page);
> -			memcpy(dst, src, copy);
> -			kunmap_atomic(src);
> -		} else
> +		if (page)
> +			memcpy_from_page(dst, page, offset, copy);

Why 'offset'?

Ira

> +		else
>  			memset(dst, 0, copy);
>  	}
>  }
> -- 
> 2.22.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
