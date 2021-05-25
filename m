Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1787D390008
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 13:32:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llVIM-0001R2-FV; Tue, 25 May 2021 11:32:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1llVIK-0001Qt-6m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 11:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i1AHA700Yq/P96eMOe1wDk9mwS7B44y0JivXf3ZTXRI=; b=ToVxSNqMBpooJGIRFpWGBtelWQ
 FaCr9E6GJBxhorEnPJgTwAJJiwPNnQvHEkneh4KW79e6jTWMTz1RsuKE2JhPcqSgYoRLAS/XxF9dr
 3OEmpyhNG0sRHv45E5IAn0Ca2p7K90uimaABxLeZXD3VVn2S/M775EPz4dYgEH/GnjFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i1AHA700Yq/P96eMOe1wDk9mwS7B44y0JivXf3ZTXRI=; b=EBsWRWlu2EWtIl8vEThyeFGkEx
 JrC7llVbRdoppeO+zAuVjHuZvhq2fGAU1daFbnphrs5UtlPVifSmA8wcRanMn6wEE3e+KguVeGLhR
 WH5PMCMINpoZx5QxSpoulZPERowaNWi0FcQ4m6uXShUuCgMTRQlKZv5WpcbQtl1DdAx4=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1llVIE-005GIj-K0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 11:32:22 +0000
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FqBgq3GFMzmZC4;
 Tue, 25 May 2021 19:29:43 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 19:32:03 +0800
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 25 May 2021 19:32:03 +0800
To: <jaegeuk@kernel.org>
References: <20210512020719.43685-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c0d287ca-ad38-f261-3e9d-02d3ceabca89@huawei.com>
Date: Tue, 25 May 2021 19:32:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210512020719.43685-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx703-chm.china.huawei.com (10.1.199.50) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1llVIE-005GIj-K0
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: atgc: export entries for better
 tunability via sysfs
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

Jaegeuk, could you please queue this in dev-test?

On 2021/5/12 10:07, Chao Yu wrote:
> This patch export below sysfs entries for better ATGC tunability.
> 
> /sys/fs/f2fs/<disk>/atgc_candidate_ratio
> /sys/fs/f2fs/<disk>/atgc_candidate_count
> /sys/fs/f2fs/<disk>/atgc_age_weight
> /sys/fs/f2fs/<disk>/atgc_age_threshold
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - limit value range of candidate_ratio and candidate_ratio in __sbi_store()
>   Documentation/ABI/testing/sysfs-fs-f2fs | 28 +++++++++++++++++++++++++
>   fs/f2fs/sysfs.c                         | 27 ++++++++++++++++++++++++
>   2 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 4849b8e84e42..5088281e312e 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -438,3 +438,31 @@ Description:	Show the count of inode newly enabled for compression since mount.
>   		Note that when the compression is disabled for the files, this count
>   		doesn't decrease. If you write "0" here, you can initialize
>   		compr_new_inode to "0".
> +
> +What:		/sys/fs/f2fs/<disk>/atgc_candidate_ratio
> +Date:		May 2021
> +Contact:	"Chao Yu" <yuchao0@huawei.com>
> +Description:	When ATGC is on, it controls candidate ratio in order to limit total
> +		number of potential victim in all candidates, the value should be in
> +		range of [0, 100], by default it was initialized as 20(%).
> +
> +What:		/sys/fs/f2fs/<disk>/atgc_candidate_count
> +Date:		May 2021
> +Contact:	"Chao Yu" <yuchao0@huawei.com>
> +Description:	When ATGC is on, it controls candidate count in order to limit total
> +		number of potential victim in all candidates, by default it was
> +		initialized as 10 (sections).
> +
> +What:		/sys/fs/f2fs/<disk>/atgc_age_weight
> +Date:		May 2021
> +Contact:	"Chao Yu" <yuchao0@huawei.com>
> +Description:	When ATGC is on, it controls age weight to balance weight proportion
> +		in between aging and valid blocks, the value should be in range of
> +		[0, 100], by default it was initialized as 60(%).
> +
> +What:		/sys/fs/f2fs/<disk>/atgc_age_threshold
> +Date:		May 2021
> +Contact:	"Chao Yu" <yuchao0@huawei.com>
> +Description:	When ATGC is on, it controls age threshold to bypass GCing young
> +		candidates whose age is not beyond the threshold, by default it was
> +		initialized as 604800 seconds (equals to 7 days).
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 39b522ec73e7..dc71bc968c72 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -37,6 +37,7 @@ enum {
>   #endif
>   	RESERVED_BLOCKS,	/* struct f2fs_sb_info */
>   	CPRC_INFO,	/* struct ckpt_req_control */
> +	ATGC_INFO,	/* struct atgc_management */
>   };
>   
>   struct f2fs_attr {
> @@ -75,6 +76,8 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
>   #endif
>   	else if (struct_type == CPRC_INFO)
>   		return (unsigned char *)&sbi->cprc_info;
> +	else if (struct_type == ATGC_INFO)
> +		return (unsigned char *)&sbi->am;
>   	return NULL;
>   }
>   
> @@ -495,6 +498,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   	}
>   #endif
>   
> +	if (!strcmp(a->attr.name, "atgc_candidate_ratio")) {
> +		if (t > 100)
> +			return -EINVAL;
> +		sbi->am.candidate_ratio = t;
> +		return count;
> +	}
> +
> +	if (!strcmp(a->attr.name, "atgc_age_weight")) {
> +		if (t > 100)
> +			return -EINVAL;
> +		sbi->am.age_weight = t;
> +		return count;
> +	}
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;
> @@ -710,6 +727,11 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
>   #endif
> +/* For ATGC */
> +F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_ratio, candidate_ratio);
> +F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_count);
> +F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
> +F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
>   
>   #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
>   static struct attribute *f2fs_attrs[] = {
> @@ -778,6 +800,11 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(compr_saved_block),
>   	ATTR_LIST(compr_new_inode),
>   #endif
> +	/* For ATGC */
> +	ATTR_LIST(atgc_candidate_ratio),
> +	ATTR_LIST(atgc_candidate_count),
> +	ATTR_LIST(atgc_age_weight),
> +	ATTR_LIST(atgc_age_threshold),
>   	NULL,
>   };
>   ATTRIBUTE_GROUPS(f2fs);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
