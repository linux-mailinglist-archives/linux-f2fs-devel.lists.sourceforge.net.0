Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5FAAE7535
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 05:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RRYzFfpBf72TCPDjbdpmQKbDO9n9QTrM/q5T0BbesA=; b=mW1w1pMERbduretSYC+NTwJH3T
	/JTFf7g+UC+YdrKmw3FzyZQFJ+p1uuyG5/sv1Rg3oRhN0rB1dwEbST99M8km7/PTOEHpdcG6YqwAP
	8c6UoXCItu0HYJSo+zg12dZdmoJ7Hh3PQMFTvLHpdCX7XyPu0ECafB7WxZKARHKpFRZA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUGhZ-0004qr-OP;
	Wed, 25 Jun 2025 03:21:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1uUGhX-0004qj-Qd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 03:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/nvn8sGirlYLcE4sgPudY9wrp9atW0WJBPYbWZk257c=; b=bmsgPAdL72z6UtdZTjnkHwIBji
 viOKEEalos2Mz8IpLdrGpd462+2cjX66pNqeqw74gYxlY0CEnQmpJl9Y3glRO0wfgPN29iG9S/PRq
 QIjFhefBYFSUv2jKhpp2dfDXKIt5UY4cGUL4yWcJujyBvkIj/+4jw4JHR8NcGTeQFHEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/nvn8sGirlYLcE4sgPudY9wrp9atW0WJBPYbWZk257c=; b=WGBdxJkeapTx9orTV1ew9MOs21
 GtOo6I3i/4G9gMfwogh2jqEPzchbQidmRTj2oqX6HTPh5l12RQ+iuQq9R8eUKBEDzhzYcy4oaG6vq
 1q2jDjqJD6yawcjhBtdWGzGUxVabrdZGyvm8qxZ7tYVD47WG9sH2AgAHhCnpFctq2XzE=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uUGhW-0004Hx-CX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 03:21:31 +0000
X-CSE-ConnectionGUID: 6GE/u/CcQSCHQrYibRIOSA==
X-CSE-MsgGUID: lZBYxcdjQCu8ISDLQ3vnEQ==
X-IronPort-AV: E=Sophos;i="6.16,263,1744041600"; d="scan'208";a="118501602"
To: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "chao@kernel.org"
 <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2] f2fs: avoid splitting bio when reading multiple pages
Thread-Index: AQHb4Clh9I6efU1o50+xgPlNPKHQtrQStZiA
Date: Wed, 25 Jun 2025 03:05:32 +0000
Message-ID: <2af57d55-1dd8-44ab-85fe-7ad181a42434@xiaomi.com>
References: <20250617055542.218681-1-huangjianan@xiaomi.com>
 <20250618081705.260239-1-huangjianan@xiaomi.com>
In-Reply-To: <20250618081705.260239-1-huangjianan@xiaomi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.8.167]
Content-ID: <6E81B61A40C2BC49AAF723C7BD7D9A78@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/18 16:17, Jianan Huang wrote: > When fewer pages
 are read, nr_pages may be smaller than nr_cpages. Due > to the nr_vecs limit, 
 the compressed pages will be split into multiple > bios and the [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [118.143.206.90 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uUGhW-0004Hx-CX
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid splitting bio when reading
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
From: Huang Jianan via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Huang Jianan <huangjianan@xiaomi.com>
Cc: =?utf-8?B?55ub5YuH?= <shengyong1@xiaomi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?546L6L6J?= <wanghui33@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/18 16:17, Jianan Huang wrote:
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
> Changes since v1:
> - Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.
>
>   fs/f2fs/data.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 31e892842625..2d948586fea0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2303,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   		}
>   
>   		if (!bio) {
> -			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
> +			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages - i,
>   					f2fs_ra_op_flags(rac),
>   					folio->index, for_write);
>   			if (IS_ERR(bio)) {
> @@ -2370,12 +2370,18 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   		.nr_cpages = 0,
>   	};
>   	pgoff_t nc_cluster_idx = NULL_CLUSTER;
> -	pgoff_t index;
> +	pgoff_t index = rac ? readahead_index(rac) : folio->index;
>   #endif
>   	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>   	unsigned max_nr_pages = nr_pages;
>   	int ret = 0;
>   
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (f2fs_compressed_file(inode))
> +		max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -
> +				round_down(index, cc.cluster_size);
> +#endif
> +
>   	map.m_pblk = 0;
>   	map.m_lblk = 0;
>   	map.m_len = 0;
> @@ -2385,7 +2391,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   	map.m_seg_type = NO_CHECK_TYPE;
>   	map.m_may_create = false;
>   
> -	for (; nr_pages; nr_pages--) {
> +	for (; nr_pages; nr_pages--, max_nr_pages--) {
>   		if (rac) {
>   			folio = readahead_folio(rac);
>   			prefetchw(&folio->flags);

ping~


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
