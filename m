Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD0248097
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Aug 2020 10:29:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k7wzj-0003hz-L6; Tue, 18 Aug 2020 08:29:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k7wzi-0003hd-Qz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 08:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lgDyWsPerPdG2yn4uustZzIDfVGmN1Sp7RPgpQI/Q6o=; b=T50Y2V3vEHiCnU8Mkn/rL//+LH
 lpJX64ZGvwnM4Of+ZpxPGKFDP+QdEuCerxXG29rm0daAxkJy3gZ3scJY0tPFUuhsA6OTbpu+EICgN
 zqemCWsLm645/g1SPCpT9EnJow2BtRatEsXiWnjje5z5g1dxqyoWglogFdzoRd2fJP8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lgDyWsPerPdG2yn4uustZzIDfVGmN1Sp7RPgpQI/Q6o=; b=BxvuCblIKh6Vcn+25I0+sF66nK
 YFuU3aPT9XURhQfLM7OuMxGFJB9xU4X3vH6wuoUT/CUqDe2ZHxTQzzku73iMG8ab5ZjijO7LVIY/b
 rtYxOv0MOvaUeW1ZitPpL1kE7gPE1JE4NJ5tcw0vv0XmxtA2Wz143JJE6wQgCjkmB3mI=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k7wzd-00F49P-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 08:29:22 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E2CAB93B21F94BEC3230;
 Tue, 18 Aug 2020 16:29:08 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 18 Aug
 2020 16:29:06 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1597392335-4998-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e1251327-bd48-215d-e558-08780474bddb@huawei.com>
Date: Tue, 18 Aug 2020 16:29:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1597392335-4998-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k7wzd-00F49P-Pf
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix indefinite loop scanning for free
 nid
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
Cc: linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/14 16:05, Sahitya Tummala wrote:
> If the sbi->ckpt->next_free_nid is not NAT block aligned and if there
> are free nids in that NAT block between the start of the block and
> next_free_nid, then those free nids will not be scanned in scan_nat_page().
> This results into mismatch between nm_i->available_nids and the sum of
> nm_i->free_nid_count of all NAT blocks scanned. And nm_i->available_nids
> will always be greater than the sum of free nids in all the blocks.
> Under this condition, if we use all the currently scanned free nids,
> then it will loop forever in f2fs_alloc_nid() as nm_i->available_nids
> is still not zero but nm_i->free_nid_count of that partially scanned
> NAT block is zero.
> 
> Fix this to align the nm_i->next_scan_nid to the first nid of the
> corresponding NAT block.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
>   fs/f2fs/node.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 9bbaa26..d615e59 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2402,6 +2402,8 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
>   			if (IS_ERR(page)) {
>   				ret = PTR_ERR(page);
>   			} else {
> +				if (nid % NAT_ENTRY_PER_BLOCK)
> +					nid = NAT_BLOCK_OFFSET(nid) * NAT_ENTRY_PER_BLOCK;

How about moving this logic to the beginning of __f2fs_build_free_nids(),
after nid reset?

BTW, it looks we can add unlikely in this judgment condition?

Thanks,

>   				ret = scan_nat_page(sbi, page, nid);
>   				f2fs_put_page(page, 1);
>   			}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
