Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC23085E5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Jan 2021 07:36:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l5NOD-0005Rj-F0; Fri, 29 Jan 2021 06:36:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l5NOA-0005RZ-RF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jan 2021 06:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LbJJubOytysCJX1zl5N9G6EYXsLc/U/RcefmO13r0Ps=; b=lYNdCyOQhXspFRICZXPhl0vQ45
 xo/zCVhHGEz5agc2IQL79pftKqT9y2xSOivxutkPbzQqwGnsP/UsFQ9u7ynb7SoZdqV/BTupUd8lr
 Y8mODjVc1o67U5wwZBXiRmAdgRSkrxXCk9LDQFqYIh/ywoNgdtvCybVkA+/P6IhIdnQo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LbJJubOytysCJX1zl5N9G6EYXsLc/U/RcefmO13r0Ps=; b=dPU7kt4G6gv8kqr5UosRLIExbi
 ex9zTzzb4AuXX7nT93OmIO7MF2lXp21LEnPKMZDCcxevhfflrD6IXuUNEV4TPhzWFrFG/zKkv9v2e
 l3cIR+8EFqkGJ14XvmGQXesjuqoL3A80kn+F0hZnwl2Qv7D9CR22bgvkyJdxZAc4C2f8=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l5NNp-000J9v-8q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jan 2021 06:36:14 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DRncz3RJYzjDr1;
 Fri, 29 Jan 2021 14:34:43 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 29 Jan
 2021 14:35:41 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
References: <20210128090256.73910-1-yuchao0@huawei.com>
Message-ID: <62062195-b551-c5c7-7165-228e59852904@huawei.com>
Date: Fri, 29 Jan 2021 14:35:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210128090256.73910-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1l5NNp-000J9v-8q
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid inconsistent quota data
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

On 2021/1/28 17:02, Chao Yu wrote:
> From: Yi Chen <chenyi77@huawei.com>
> 
> Occasionally, quota data may be corrupted detected by fsck:
> 
> Info: checkpoint state = 45 :  crc compacted_summary unmount
> [QUOTA WARNING] Usage inconsistent for ID 0:actual (1543036928, 762) != expected (1543032832, 762)
> [ASSERT] (fsck_chk_quota_files:1986)  --> Quota file is missing or invalid quota file content found.
> [QUOTA WARNING] Usage inconsistent for ID 0:actual (1352478720, 344) != expected (1352474624, 344)
> [ASSERT] (fsck_chk_quota_files:1986)  --> Quota file is missing or invalid quota file content found.
> 
> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> [FSCK] SIT valid block bitmap checking                [Ok..]
> [FSCK] Hard link checking for regular file            [Ok..] [0x0]
> [FSCK] valid_block_count matching with CP             [Ok..] [0xdf299]
> [FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0x2b01]
> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x2b01]
> [FSCK] valid_inode_count matched with CP              [Ok..] [0x2665]
> [FSCK] free segment_count matched with CP             [Ok..] [0xcb04]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Fail]
> 
> The root cause is:
> If we open file w/ readonly flag, disk quota info won't be initialized
> for this file, however, following mmap() will force to convert inline
> inode via f2fs_convert_inline_inode(), which may increase block usage
> for this inode w/o updating quota data, it causes inconsistent disk quota
> info.
> 
> The issue will happen in following stack:
> open(file, O_RDONLY)
> mmap(file)
> - f2fs_convert_inline_inode
>   - f2fs_convert_inline_page
>    - f2fs_reserve_block
>     - f2fs_reserve_new_block
>      - f2fs_reserve_new_blocks
>       - f2fs_i_blocks_write
>        - dquot_claim_block
> inode->i_blocks increase, but the dqb_curspace keep the size for the dquots
> is NULL.
> 
> To fix this issue, let's call dquot_initialize() anyway in both
> f2fs_truncate() and f2fs_convert_inline_inode() functions to avoid potential
> inconsistent quota data issue.
> 
> Fixes: 0abd675e97e6 ("f2fs: support plain user/group quota")
> Signed-off-by: Daiyue Zhang <zhangdaiyue1@huawei.com>
> Signed-off-by: Dehe Gu <gudehe@huawei.com>
> Signed-off-by: Junchao Jiang <jiangjunchao1@huawei.com>
> Signed-off-by: Ge Qiu <qiuge@huawei.com>
> Signed-off-by: Yi Chen <chenyi77@huawei.com>

[Chao Yu: clean up commit message a bit]
Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
