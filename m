Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 674CDAC35D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Sep 2019 01:48:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i6Nxj-0001sR-Ld; Fri, 06 Sep 2019 23:48:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i6Nxi-0001sJ-63
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Sep 2019 23:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p0dbbQMzg3UN6wOX3ZMQsfBU/LObXb+iC7X9vpXy1S0=; b=N4HMzquDf0ZCSCtn5lh/mNk5fq
 07JPngodyCZC3jgeVPxjr42gZ+RGDOrcOP3jwGoNfGA986ExgNGckMprVK/JuRbgPIsAo4pMoG4ga
 u3K5oeQPyVcaynPpHYxgI5idDcl+MaY57O2CGs/CgZq/QOZd6lzV4+hPNdG4CpWVR1W0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p0dbbQMzg3UN6wOX3ZMQsfBU/LObXb+iC7X9vpXy1S0=; b=fpbOZ1CTaTnlKXq3f0LyyfeN35
 SCYQ4svgv/JIPZ+vJ6nCa/3CI/eC2QFAPG3S4sH3cIvbuFplazLLShAHFaQBw5zYZoFtxUGMuCgx8
 mz3EmcBLO6XldNODtxvan7TlsbWvv1/1pFFgO3Mrues+sVJPUpfSvAwMHWus+Orau6yo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i6Nxg-00D27E-Vt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Sep 2019 23:48:18 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D1C620842;
 Fri,  6 Sep 2019 23:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567813689;
 bh=YaTVDRKaWZp6RtZVWL7bD2dch2Eb2d4uXQ0xopsEZSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lKG6gBsYXRoodg6TXLwPJ0ERZ57ieDDf0M0hfRwkNClvG6iJDRgcUtfI+nZfsJhem
 bUj5rEwZHZIMACq3HZmc/H3689dIyRdJyRBaC3JCjg4msPyOqKreuOHo4K7oApOp9p
 odNdszgFPA3IoHoi/PePG68AQu64WPepnxTwH9CQ=
Date: Fri, 6 Sep 2019 16:48:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190906234808.GC71848@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190906105426.109151-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906105426.109151-1-yuchao0@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i6Nxg-00D27E-Vt
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid accessing uninitialized
 field of inode page in is_alive()
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

On 09/06, Chao Yu wrote:
> If inode is newly created, inode page may not synchronize with inode cache,
> so fields like .i_inline or .i_extra_isize could be wrong, in below call
> path, we may access such wrong fields, result in failing to migrate valid
> target block.

If data is valid, how can we get new inode page?

> 
> - gc_data_segment
>  - is_alive
>   - datablock_addr
>    - offset_in_addr
> 
> Fixes: 7a2af766af15 ("f2fs: enhance on-disk inode structure scalability")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/dir.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 765f13354d3f..b1840852967e 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -479,6 +479,9 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
>  		if (IS_ERR(page))
>  			return page;
>  
> +		/* synchronize inode page's data from inode cache */
> +		f2fs_update_inode(inode, page);
> +
>  		if (S_ISDIR(inode->i_mode)) {
>  			/* in order to handle error case */
>  			get_page(page);
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
