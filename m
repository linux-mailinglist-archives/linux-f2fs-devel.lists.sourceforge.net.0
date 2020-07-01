Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E67210217
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 04:33:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqSZ7-0002dF-F3; Wed, 01 Jul 2020 02:33:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jqSZ6-0002cq-66
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 02:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rO1IyCvpEknO7LU+LirAm57t7GXkFW8YueklDTHbiUc=; b=ULCWZ0MdZpDXpZw6a3kHx39Slb
 MHqWzIGyqjCmrhcIO/4qoWFcvrozbTXaCW5JvhAclMD4KHKXStArXYSDjbWun9QWFHdvEuBtlfmqw
 +tyYBRJZ/jzpxAY1/EDHoS6rdYCCIMIEdmJ4MG1dmycoLybu4VTGE+UQ99XVq2k4uVek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rO1IyCvpEknO7LU+LirAm57t7GXkFW8YueklDTHbiUc=; b=ITrL1qozOSg+r5wynFqC+0n23H
 u1ukOgiA3OV9KzooNMOBx3RSXqHMXEvLrG4qospifovI3m9VDRTOm+mleMzRiAxNfguEiK/JYkJJt
 fdo+r8M6gGrHTrkpGuQRMh7Z014xCdihW83JqOw7NAT/7mVMRkPO0ObAVJTZL8aVZg/0=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqSZ4-008BPR-0F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 02:33:36 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 096C37B1763B601D50E2;
 Wed,  1 Jul 2020 10:33:24 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Jul 2020
 10:33:15 +0800
To: Jia Yang <jiayang5@huawei.com>, <jaegeuk@kernel.org>
References: <20200701022740.109089-1-jiayang5@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <22ac5892-6cb2-82d3-bf98-517a576b1449@huawei.com>
Date: Wed, 1 Jul 2020 10:33:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200701022740.109089-1-jiayang5@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jqSZ4-008BPR-0F
Subject: Re: [f2fs-dev] [PATCH] f2fs: add parameter op_flag in
 f2fs_submit_page_read()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/1 10:27, Jia Yang wrote:
> The parameter op_flag is not used in f2fs_get_read_data_page(),
> but it is used in f2fs_grab_read_bio(). Obviously, op_flag is
> not passed to f2fs_grab_read_bio() successfully. We need to add
> parameter in f2fs_submit_page_read() to pass it.
> 
> The case:
> - gc_data_segment
>  - f2fs_get_read_data_page(.., op_flag = REQ_RAHEAD,..)
>   - f2fs_submit_page_read
>    - f2fs_grab_read_bio(.., op_flag = 0, ..)
> 
> Signed-off-by: Jia Yang <jiayang5@huawei.com>
> ---
>  fs/f2fs/data.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 326c63879ddc..7935dba78d84 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1025,12 +1025,13 @@ static void f2fs_release_read_bio(struct bio *bio)
>  
>  /* This can handle encryption stuffs */
>  static int f2fs_submit_page_read(struct inode *inode, struct page *page,
> -						block_t blkaddr, bool for_write)
> +				 block_t blkaddr, int op_flags, bool for_write)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct bio *bio;
>  
> -	bio = f2fs_grab_read_bio(inode, blkaddr, 1, 0, page->index, for_write);
> +	bio = f2fs_grab_read_bio(inode, blkaddr, 1, op_flags,
> +					page->index, for_write);
>  	if (IS_ERR(bio))
>  		return PTR_ERR(bio);
>  
> @@ -1217,7 +1218,7 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>  		return page;
>  	}
>  
> -	err = f2fs_submit_page_read(inode, page, dn.data_blkaddr, for_write);
> +	err = f2fs_submit_page_read(inode, page, dn.data_blkaddr, op_flags, for_write);

Except logs message or structure fields comments, I prefer keeping 80 characters
alignment for other parts.

I guess Jaegeuk could help to fix this.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

>  	if (err)
>  		goto put_err;
>  	return page;
> @@ -3382,7 +3383,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>  			err = -EFSCORRUPTED;
>  			goto fail;
>  		}
> -		err = f2fs_submit_page_read(inode, page, blkaddr, true);
> +		err = f2fs_submit_page_read(inode, page, blkaddr, 0, true);
>  		if (err)
>  			goto fail;
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
