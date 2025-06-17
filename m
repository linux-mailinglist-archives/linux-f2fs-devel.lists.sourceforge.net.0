Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3529CADC989
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 13:37:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFOgWIlbkN820vFnzvn+TRLI07TG07XGl2/HRsv1fjE=; b=EgvN0pK7aqZebam2oHVI0eOf7I
	FeCf+WNpF361u7qc/Xib7RxBxgLnIsvogjFbrIEjG+93QyV+E4Haf5QHx0a1+Z7SajkKc52/O6SsD
	HNM4ju5XdsL7uac8ufCZ/K9sbjaQQCrrNXSEa6W8WMBsttM8t4c7BQwfrWc4wt+sETdg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRUdA-0005E0-M1;
	Tue, 17 Jun 2025 11:37:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uRUd9-0005Du-9q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 11:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NadmgHuwBEcPJ3GKJVt/aU/pxG4yOpeVgpw43MwTE9c=; b=dJ7tljVggXlLT1CK7/rww9qC2E
 D1M6FgeRnPifT8rKcSHpJv0sd8gNM9i9gvfT48jPoOUwKttiryOPxqQ0z+nc+81DQz7GXoy4leoDQ
 MoJuBze927P6sa4NrbVyqNO7BIrdM+aaPziLOpT5esn8V/uUkhdviw/1imU5Qj3klmuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NadmgHuwBEcPJ3GKJVt/aU/pxG4yOpeVgpw43MwTE9c=; b=ULx3OZXKwYyP0nNSos7Z63pL2T
 vT4BPYuflBjFCnn9k0LyaFwwUefUZI89Qx1VNyy6ViaUj/BE0Q5dFGth0sbV5gKl2B+8NrKUMUXJ2
 M3I2ebaVz0ET8nm0O4rqCmaACq+rrW7dEHf9rsgBeRYfSfHypYm6gZjTHUpw26ud1F1M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRUd8-0000sn-Nr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 11:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 150C3629F1;
 Tue, 17 Jun 2025 11:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86F4C4CEE3;
 Tue, 17 Jun 2025 11:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750160239;
 bh=1Zz4iwRt/J35TPtYB0xzkQXe4emuzR4SLbYYE3l+fYo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HJGRs7vfNzjFvL3Pt2sEZDE9nZWti/04p93uhwGwVnH2oYbwACCTMuIphdVmT5ll2
 q7LqMO4jbFcIuP85+8Jaf2oJ+9og/sGcsmGQTFl51aCwcgwhblh5TOWukhqKQetSKi
 3sRyMRgIsnW4Yw7AUZpalKR7WjNx7nd1NIU1z1p4JLuauBect1UGzY1kQP8E4v3LwT
 It6j31Nku2JGv9Hxn1yc94YBCNwOfYJIHxDZhkcfFwiyW02KGLCcQ0P8bNEJXzT8KC
 GIPoyKaDjfUs3osQdJuL1Dz3OwqeJIwpMrnqqlJibLh6h8QFX5VQ4Hhgo6thlQbDa2
 PiWZZoKc+11kw==
Message-ID: <c89b359f-da89-4285-98c2-a98470a5f959@kernel.org>
Date: Tue, 17 Jun 2025 19:37:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250617055542.218681-1-huangjianan@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250617055542.218681-1-huangjianan@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/17/25 13:55, Jianan Huang wrote: > When fewer pages are
 read, nr_pages may be smaller than nr_cpages. Due > to the nr_vecs limit,
 the compressed pages will be split into multiple > bios and then [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uRUd8-0000sn-Nr
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid splitting bio when reading
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
Cc: Sheng Yong <shengyong1@xiaomi.com>, wanghui33@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/17/25 13:55, Jianan Huang wrote:
> When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
> to the nr_vecs limit, the compressed pages will be split into multiple
> bios and then merged at the block level. In this case, nr_cpages should
> be used to pre-allocate bvecs.
> 
> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
>  fs/f2fs/data.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 31e892842625..c7773b09d83f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2303,7 +2303,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		}
>  
>  		if (!bio) {
> -			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
> +			bio = f2fs_grab_read_bio(inode, blkaddr,
> +					max(nr_pages, cc->nr_cpages) - i,

Hi Jianan,

e.g.

User wants to read page [1, 5],
page #1,2,3,4 locates in compressed block #1000,1001,1003,
page #5 locate in compressed block #1004,1005

It submits first bio w/ block #1000,1001
It allocates second bio w/ size of max(nr_pages=1, nr_cpages=3) - 2 = 1 ?
However block #1003 and block #1004,1005 can be readed in one bio, we
should allocate larger bio for last continuous blocks which cross clusters.

>  					f2fs_ra_op_flags(rac),
>  					folio->index, for_write);
>  			if (IS_ERR(bio)) {
> @@ -2373,7 +2374,6 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	pgoff_t index;
>  #endif
>  	unsigned nr_pages = rac ? readahead_count(rac) : 1;
> -	unsigned max_nr_pages = nr_pages;

Maybe we can align both start and end of read range w/ cluster_size, and use
start and end for max_nr_pages calculation, then pass it to
f2fs_read_{multi,single}_pages(), something like this?

max_nr_pages = round_up(end_idx, cluster_size) -
		round_down(start_idx, cluster_size);

Its size should always cover size of all cpage and/or rpage.

Thanks,

>  	int ret = 0;
>  
>  	map.m_pblk = 0;
> @@ -2400,7 +2400,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  		/* there are remained compressed pages, submit them */
>  		if (!f2fs_cluster_can_merge_page(&cc, index)) {
>  			ret = f2fs_read_multi_pages(&cc, &bio,
> -						max_nr_pages,
> +						nr_pages,
>  						&last_block_in_bio,
>  						rac, false);
>  			f2fs_destroy_compress_ctx(&cc, false);
> @@ -2432,7 +2432,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  read_single_page:
>  #endif
>  
> -		ret = f2fs_read_single_page(inode, folio, max_nr_pages, &map,
> +		ret = f2fs_read_single_page(inode, folio, nr_pages, &map,
>  					&bio, &last_block_in_bio, rac);
>  		if (ret) {
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -2450,7 +2450,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  			/* last page */
>  			if (nr_pages == 1 && !f2fs_cluster_is_empty(&cc)) {
>  				ret = f2fs_read_multi_pages(&cc, &bio,
> -							max_nr_pages,
> +							nr_pages,
>  							&last_block_in_bio,
>  							rac, false);
>  				f2fs_destroy_compress_ctx(&cc, false);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
