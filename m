Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8D30EAE2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Feb 2021 04:25:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l7VHC-0002wZ-Gn; Thu, 04 Feb 2021 03:25:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l7VHB-0002wT-Lg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Feb 2021 03:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pEOox5HZN2l5WDAkGBd2JA2yTkTfWVrDQEBSw2ZI1wM=; b=MwXu0ALYCAsv7K/MzKupKIys5o
 x/1/RSLNQP/guMnFOwOBdp/+H2qrSQUfw/6/Ok/DA+3EJCL/oyMwQCrHLqz45p/WJauDEz76suXuJ
 dVcoITwWxdD/v/ah62fHeO32mnCyr2qrL9hwCkkCZmmdW3zIJILe2YogVcup+Dp4m1aQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pEOox5HZN2l5WDAkGBd2JA2yTkTfWVrDQEBSw2ZI1wM=; b=OU6rkTvr8hA7yf1U0ea2ruG5gH
 ecvM39h7LFuGFYxOJiubk9bmRAL+d97aQIIyibFyky+0JSxM1Dgq/qPAX11nbmZ1d2uF6lVEDrjOr
 DseidYzX6iTMch7rmdk5RDXWp6y6zv0PFA/J7EqRWI0J/Y7O2cH9X43PAHWKZZjtiVoI=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l7VH4-003XEo-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Feb 2021 03:25:49 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DWP6N0m9rzjHm9;
 Thu,  4 Feb 2021 11:24:12 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 4 Feb 2021
 11:25:26 +0800
To: <jaegeuk@kernel.org>
References: <20210202080056.51658-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <46e9924c-0086-cd2a-2e93-7149b92ba27e@huawei.com>
Date: Thu, 4 Feb 2021 11:25:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210202080056.51658-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l7VH4-003XEo-Aq
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: add compress_inode to
 cache compressed blockst
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

On 2021/2/2 16:00, Chao Yu wrote:
> -	for (i = 0; i < dic->nr_cpages; i++) {
> +	for (i = 0; i < cc->nr_cpages; i++) {
>   		struct page *page = dic->cpages[i];

por_fsstress still hang in this line?

Thanks,

>   		block_t blkaddr;
>   		struct bio_post_read_ctx *ctx;
> @@ -2201,6 +2207,14 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   		blkaddr = data_blkaddr(dn.inode, dn.node_page,
>   						dn.ofs_in_node + i + 1);
>   
> +		f2fs_wait_on_block_writeback(inode, blkaddr);
> +
> +		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
> +			if (atomic_dec_and_test(&dic->remaining_pages))
> +				f2fs_decompress_cluster(dic);
> +			continue;
> +		}
> +


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
