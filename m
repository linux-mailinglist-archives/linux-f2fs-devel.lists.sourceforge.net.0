Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F50829FD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 05:24:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huq5K-0004yg-8p; Tue, 06 Aug 2019 03:24:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huq5F-0004yT-Az
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 03:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h+8etnBp1LUbCjqlawODSDBt8Vz5y69faT6b6fdsX+k=; b=JH4KhSHBMUN77ItDKR6uW6joAq
 zN9Gf+4Mdn9Miu49q/JG7oyUsjfFWWpi3jqTWeGHWAqgFhl4U/0uYoh89JixvXOfyEeQoL1eVUuF+
 gopWkL+kX6449Mr6NJ3Hbkp1l9z3wuhQMvhFgZUKZFwN3AZfJC2DPXZXTLLEb8BN8yF4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h+8etnBp1LUbCjqlawODSDBt8Vz5y69faT6b6fdsX+k=; b=M+7kqsez13QXYtNl1xA6KNgB+y
 WShEn1WACVEGIUps+I54ZYTSSxX7C89E+6U2YdevxJdFVG4KGutJPPPROhyCNbQ3w8hFPEy0nUf50
 Kc+SO9K/jFR4xAWIOcZeBL8iHo9CnB1Px3YXdZ3dgIJR2w6XDv6mFtIuhbu0TfidD+yo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huq5D-00CSHg-1T
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 03:24:21 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4475FF721CE4C434936;
 Tue,  6 Aug 2019 11:24:12 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019
 11:24:10 +0800
To: <jaegeuk@kernel.org>
References: <20190805102725.27834-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7a47ec24-2352-7438-bed2-493a89d5c576@huawei.com>
Date: Tue, 6 Aug 2019 11:24:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190805102725.27834-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huq5D-00CSHg-1T
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix wrong available node count
 calculation
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

On 2019/8/5 18:27, Chao Yu wrote:
> In mkfs, we have counted quota file's node number in cp.valid_node_count,
> so we have to avoid wrong substraction of quota node number in
> .available_nid/.avail_node_count calculation.
> 
> f2fs_write_check_point_pack()
> {
> ..
> 	set_cp(valid_node_count, 1 + c.quota_inum + c.lpf_inum);
> 
> Fixes: 292c196a3695 ("reserve nid resource for quota sysfile")

Jaegeuk,

Could you help to add prefix "f2fs: " into commit tile in your branch, I missed
to add it. :P

Thanks,

> Fixes: 7b63f72f73af ("f2fs: fix to do sanity check on valid node/block count")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/node.c  | 2 +-
>  fs/f2fs/super.c | 6 ++----
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index a18b2a895771..d9ba1db2d01e 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2964,7 +2964,7 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
>  
>  	/* not used nids: 0, node, meta, (and root counted as valid node) */
>  	nm_i->available_nids = nm_i->max_nid - sbi->total_valid_node_count -
> -				sbi->nquota_files - F2FS_RESERVED_NODE_NUM;
> +						F2FS_RESERVED_NODE_NUM;
>  	nm_i->nid_cnt[FREE_NID] = 0;
>  	nm_i->nid_cnt[PREALLOC_NID] = 0;
>  	nm_i->nat_cnt = 0;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6a7f1166d068..118a31f90a37 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1297,8 +1297,7 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
>  	else
>  		buf->f_bavail = 0;
>  
> -	avail_node_count = sbi->total_node_count - sbi->nquota_files -
> -						F2FS_RESERVED_NODE_NUM;
> +	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
>  
>  	if (avail_node_count > user_block_count) {
>  		buf->f_files = user_block_count;
> @@ -2750,8 +2749,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  	}
>  
>  	valid_node_count = le32_to_cpu(ckpt->valid_node_count);
> -	avail_node_count = sbi->total_node_count - sbi->nquota_files -
> -						F2FS_RESERVED_NODE_NUM;
> +	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
>  	if (valid_node_count > avail_node_count) {
>  		f2fs_err(sbi, "Wrong valid_node_count: %u, avail_node_count: %u",
>  			 valid_node_count, avail_node_count);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
