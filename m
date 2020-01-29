Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E2714C43D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2020 01:53:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iwbbw-0006el-UG; Wed, 29 Jan 2020 00:53:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1iwbbv-0006ed-J7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jan 2020 00:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o1nhRe1kYWHUMeg53adC2wPv23K6dyAmEg/aKuHeXPY=; b=OMSBtY7FXP3EN8M8wEg9OUv37G
 vJjlxyiNPZrKwzc3N0G0CJNIL3zctncN7N70J+6nC1xaydhGOorCfvinyVMHmM+mIjw+xYWE5skof
 fYhaNewKJ9uczwAR4VyEcGJDycRNC1dwTNi50J7i60SMBrJqjNfv4cqyRsDKBi4l56lc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o1nhRe1kYWHUMeg53adC2wPv23K6dyAmEg/aKuHeXPY=; b=FCHq2onmHh6GVx3b5heCOEzd4s
 3+C1wqxlzTha35IPFeqbTD1FxPPMIUjK/8d8KyJU8qbNHjO5CEuuJ3cWOJoMCXH8aZUFZO2k1I3Jb
 I6ZezU4+t62B1cLUCcbIBET0kSK3iR7BnNdy+2u2HAhkk1/FYdu27nl4GMfn84IQGWkI=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iwbbt-008lTe-Mc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jan 2020 00:53:39 +0000
Received: from dread.disaster.area (pa49-195-111-217.pa.nsw.optusnet.com.au
 [49.195.111.217])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 32C487E9A77;
 Wed, 29 Jan 2020 11:24:56 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1iwbA8-0005eI-Bd; Wed, 29 Jan 2020 11:24:56 +1100
Date: Wed, 29 Jan 2020 11:24:56 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200129002456.GH18610@dread.disaster.area>
References: <20200125013553.24899-1-willy@infradead.org>
 <20200125013553.24899-5-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200125013553.24899-5-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LYdCFQXi c=1 sm=1 tr=0
 a=0OveGI8p3fsTA6FL6ss4ZQ==:117 a=0OveGI8p3fsTA6FL6ss4ZQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Jdjhy38mL1oA:10
 a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=bQT49A20HjYUhGx6rhoA:9
 a=UEMyszIiLG9v0jT0:21 a=UWfWf6Z2s6wDmKyN:21 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 2.5 URIBL_DBL_ABUSE_MALW   Contains an abused malware URL listed in the
 Spamhaus DBL blocklist [URIs: infradead.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -1.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iwbbt-008lTe-Mc
Subject: Re: [f2fs-dev] [PATCH 04/12] mm: Add readahead address space
 operation
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 24, 2020 at 05:35:45PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> This replaces ->readpages with a saner interface:
>  - Return the number of pages not read instead of an ignored error code.
>  - Pages are already in the page cache when ->readahead is called.
>  - Implementation looks up the pages in the page cache instead of
>    having them passed in a linked list.
....
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 5a6676640f20..6d65dae6dad0 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -121,7 +121,18 @@ static void read_pages(struct address_space *mapping, struct file *filp,
>  
>  	blk_start_plug(&plug);
>  
> -	if (mapping->a_ops->readpages) {
> +	if (mapping->a_ops->readahead) {
> +		unsigned left = mapping->a_ops->readahead(filp, mapping,
> +				start, nr_pages);
> +
> +		while (left) {
> +			struct page *page = readahead_page(mapping,
> +					start + nr_pages - left - 1);

Off by one? start = 2, nr_pages = 2, left = 1, this looks up the
page at index 2, which is the one we issued IO on, not the one we
"left behind" which is at index 3.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
