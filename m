Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E8C1EC9DC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jun 2020 08:59:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgNMm-0008GL-9l; Wed, 03 Jun 2020 06:59:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jgNMk-0008G4-Eq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 06:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+EG+4fgRfrmwvdJ0nqUCJ9b0uPw2VCPX7Y2FIBOKePc=; b=lGietwmnBPB8JA3Szd3Gp6bZVP
 F9xr48AMy2jvgcC4YvvmoACbqNw70hR8F22ew5PpPRNIrKPnjzon7mNMCFfw0U4z67jpUtnqMpLai
 95QjOyWcHUamDJMu2zBs0W2PcI9qZSf5omSQD3YgCqay1353xfBLlaiFCwp1q3uF5p2I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+EG+4fgRfrmwvdJ0nqUCJ9b0uPw2VCPX7Y2FIBOKePc=; b=QAWIgpp7v5t7OYTHUUxKDEC5mw
 AfC/AAEV4m/7Gm2PX6wv9QhtX+Er5iDXkrdOU/NQnA09RmG/Zk6m5GKZn5DLjDWT5f8fwiHidSrKc
 sukNT0DRRN7KAj9E/OJ9AQBDyAAosXNQRU6AyLYMY9Qrl3lP+SRxH2yXU1g2Y53rT+8Q=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jgNMi-00ABsr-DP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 06:59:10 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2F0F931527F4F3D44C1C;
 Wed,  3 Jun 2020 14:58:53 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 3 Jun 2020
 14:58:47 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200601030347.112984-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <daed6176-fb7d-bd4d-9662-735cc3cda2e0@huawei.com>
Date: Wed, 3 Jun 2020 14:58:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200601030347.112984-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jgNMi-00ABsr-DP
Subject: Re: [f2fs-dev] [PATCH] f2fs: protect new segment allocation in
 expand_inode_data
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/1 11:03, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Found a new segemnt allocation without f2fs_lock_op() in
> expand_inode_data(). So, when we do fallocate() for a pinned file
> and trigger checkpoint very frequently and simultaneously. F2FS gets
> stuck in the below code of do_checkpoint() forever.
> 
>   f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
>   /* Wait for all dirty meta pages to be submitted for IO */
>                                                 <= if fallocate() here,
>   f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META); <= it'll wait forever.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Reviewed-by: Chao Yu <yuchao0@huawei.com>

Daeho,

I guess Jaegeuk could add the tag when merging this patch, we don't have
to resend the patch if there is no updates on code and message.

Thanks,

> ---
>  fs/f2fs/file.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f7de2a1da528..14ace885baa9 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1660,7 +1660,11 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>  
>  		down_write(&sbi->pin_sem);
>  		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
> +
> +		f2fs_lock_op(sbi);
>  		f2fs_allocate_new_segments(sbi, CURSEG_COLD_DATA);
> +		f2fs_unlock_op(sbi);
> +
>  		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
>  		up_write(&sbi->pin_sem);
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
