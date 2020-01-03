Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0866B12F4B7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2020 07:49:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inGm5-0006eo-So; Fri, 03 Jan 2020 06:49:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1inGm4-0006cn-9P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 06:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=diksA8E+ErLBSvWEiwpU/yJPkxGklNfFVThy1TW2alY=; b=TfLtLQFWoxoPHOqKGz97rzi2K8
 weCjESFyQPlEaQVAOG/cklztYymmTKKkKUtnZZwwXIde/FASuX9pcL+h/+Uo0oAfen27AN6HLuLSo
 J188t4t5cumc+kBDy5Ov54tWT+xXyeUTeAYzWdB85g8X50UJHT0mPXHaSe6tX/pyC1YE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=diksA8E+ErLBSvWEiwpU/yJPkxGklNfFVThy1TW2alY=; b=Ur4iQ3ctOal5VGl68bt5dnaEJi
 Gx0XZ+m9pjznuvQKSivl009gZboMMk8oT+bV9WdDsDh0U9UKBuINOWdlRZNYZjantGbekkMMjyM/9
 EMdNcLRtYZqSj2YIp2ctajb9Cl2JDyioUKrv+H5aqKpBE8OdvyCfF7tr2gvRRv2pCHMM=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1inGlw-007mai-W8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 06:49:32 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 70FA47B18BC9E4094F38;
 Fri,  3 Jan 2020 14:49:13 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020
 14:49:10 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20191218195324.17360-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <020ba9a5-7ebb-6b5f-d45c-5e8fd372569d@huawei.com>
Date: Fri, 3 Jan 2020 14:49:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191218195324.17360-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1inGlw-007mai-W8
Subject: Re: [f2fs-dev] [PATCH] f2fs: cover f2fs_lock_op in
 expand_inode_data case
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/12/19 3:53, Jaegeuk Kim wrote:
> We were missing to cover f2fs_lock_op in this case.

Jaegeuk,

generic/269 will hang with this patch, and also bugzilla reports android
with last code will hang with the same stack.

Could you check this patch?

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4ea9bf9e8701..0b74f94ac8ee 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1646,12 +1646,13 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>  			if (err && err != -ENODATA && err != -EAGAIN)
>  				goto out_err;
>  		}
> -
> +		f2fs_lock_op(sbi);
>  		down_write(&sbi->pin_sem);
>  		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
>  		f2fs_allocate_new_segments(sbi, CURSEG_COLD_DATA);
>  		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
>  		up_write(&sbi->pin_sem);
> +		f2fs_unlock_op(sbi);
>  
>  		done += map.m_len;
>  		len -= map.m_len;
> @@ -1661,7 +1662,9 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>  
>  		map.m_len = done;
>  	} else {
> +		f2fs_lock_op(sbi);
>  		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_AIO);
> +		f2fs_unlock_op(sbi);
>  	}
>  out_err:
>  	if (err) {
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
