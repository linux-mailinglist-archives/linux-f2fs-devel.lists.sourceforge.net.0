Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C66AE7AA3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 10:46:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HE29cG69hpyBCZE9XAkW9PY/RTwoqsgH1VQmqFnlFU=; b=DpfAogwaqeRGO3dHhsFmimzqE9
	ZukWitvbUkYY8jTkSUIhC22B/V/jQ+AJOHZeZ8w8bKLm8F/bARfLgjpahvZTpjvlQD5JX5lPaPsDi
	OwxssSen2aKqrWmZ2KRkZnCDrzhLeX3FZIYJZ69EZrU8ojOz6E+A6ri2mjb+dXzNYWcs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uULlQ-0006Fb-IF;
	Wed, 25 Jun 2025 08:45:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uULku-000665-W4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 08:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=84Phs29/epKpEmckUvJq9KGTCxiRXjiAJrTj2AM31E4=; b=U3gGKh6CNJoWk6qNx016ncmjKp
 CSMRqAtwwOEOS47Z7jihcWUv9oXar68rxU+mKPNCZVAsWMyb+Z6ztZkgtrrQV3Wp8F2/ULwPRoXNM
 3B27FvI0HBPDlRkfXJs43ybh0XFK8tZEjZr/hl75ZoOl7cc553MN+G2fRlUnNHXR542Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=84Phs29/epKpEmckUvJq9KGTCxiRXjiAJrTj2AM31E4=; b=bRNx/JFlBg6IlL+73M72L/dEpO
 om8gCKTPB1FmABlivHEKsySVYy0gXI6xXtjiUyAtN6fUhUwkTQZqqZaVpVdLMQmecMAcTFfveWm2p
 kbN+9qF1hBroWA6XLIhbLluxM03Ew4ptAZoAxsXUrBVKCLaGcLpNDe5aHdv+Qa/qHnN8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uULku-0002kL-J0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 08:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDF315C4814;
 Wed, 25 Jun 2025 08:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A723C4CEF1;
 Wed, 25 Jun 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750841109;
 bh=akGozF2xMqa27fiz+s8c9GDxo0IXK8cpAQzDW569FOc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UV05VOy86DshskpVnUKFSo5zPC2fD51gmvaD+ny+NX99Uznqh9vIPrEFZQGhk1zqo
 SDXlr9GI/6AeoW0Soh+TiWalcd5+IZOekzqCPqTld4YwntXszVbyoHR50WgLfugdxP
 rrt1iE0GaK84E1jLonzwvMKr4i0iQzrzJFhOnHOa2+WVTEA1toDPItblcty/fhagWn
 44yws5P6T1G7uGtbkayKhlFFAcPHK4Ito3kGhWAy0P3Y1chisnDvxWiUc3HbV7xlnZ
 rf0RwdgiPr+pNIH8CJV3fNaWSt/kozL3eFcCyO4ZCKb8yJCs6qS+4Vik4WVSXnW7XA
 8/CpVxLN4A+zQ==
Message-ID: <d2ac0da9-3d47-4269-a7b0-a18719c64346@kernel.org>
Date: Wed, 25 Jun 2025 16:45:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250625064927.516586-1-huangjianan@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250625064927.516586-1-huangjianan@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/25/25 14:49, Jianan Huang wrote: > When fewer pages are
 read, nr_pages may be smaller than nr_cpages. Due > to the nr_vecs limit,
 the compressed pages will be split into multiple > bios and then [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uULku-0002kL-J0
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid splitting bio when reading
 multiple pages
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Sheng Yong <shengyong1@xiaomi.com>, linux-kernel@vger.kernel.org,
 wanghui33@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/25/25 14:49, Jianan Huang wrote:
> When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
> to the nr_vecs limit, the compressed pages will be split into multiple
> bios and then merged at the block level. In this case, nr_cpages should
> be used to pre-allocate bvecs.
> To handle this case, align max_nr_pages to cluster_size, which should be
> enough for all compressed pages.
> 
> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
> Changes since v2:
> - Initialize index only for compressed files.
> Changes since v1:
> - Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.
> 
>  fs/f2fs/data.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 31e892842625..d071d9f6a811 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2303,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		}
>  
>  		if (!bio) {
> -			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
> +			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages - i,

Jianan,

Another case:

read page #0,1,2,3 from block #1000,1001,1002, cluster_size=4.

nr_pages=4
max_nr_pages=round_up(0+4,4)-round_down(0,4)=4

f2fs_mpage_readpages() calls f2fs_read_multi_pages() when nr_pages=1, at
that time, max_nr_pages equals to 1 as well.

f2fs_grab_read_bio(..., 1 - 0,...) allocate bio w/ 1 vec capacity, however,
we need at least 3 vecs to merge all cpages, right?

Thanks,

>  					f2fs_ra_op_flags(rac),
>  					folio->index, for_write);
>  			if (IS_ERR(bio)) {
> @@ -2376,6 +2376,14 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	unsigned max_nr_pages = nr_pages;
>  	int ret = 0;
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (f2fs_compressed_file(inode)) {
> +		index = rac ? readahead_index(rac) : folio->index;
> +		max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -
> +				round_down(index, cc.cluster_size);
> +	}
> +#endif
> +
>  	map.m_pblk = 0;
>  	map.m_lblk = 0;
>  	map.m_len = 0;
> @@ -2385,7 +2393,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	map.m_seg_type = NO_CHECK_TYPE;
>  	map.m_may_create = false;
>  
> -	for (; nr_pages; nr_pages--) {
> +	for (; nr_pages; nr_pages--, max_nr_pages--) {
>  		if (rac) {
>  			folio = readahead_folio(rac);
>  			prefetchw(&folio->flags);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
