Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17563377CDC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 09:04:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lfzxO-0007Si-DX; Mon, 10 May 2021 07:03:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lfzxM-0007SX-BD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 07:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XLKHb/nN0VzgyAl+76RVAu+YCTl0iY2bnxJIL4K8LeA=; b=N9z1rXzIuph7GBFRAaFgdDYoNB
 gnZJN+rMna5rWa3G/t81ZDZOBC+GepnBZeF3HE98QrdsUNwAs8VUO2rME+lbTUtJ9pGZsZFfdBLyC
 RWmDUkqkH0drNkcS4ztdp3F0TCvSrmSL0oYAl71dGEj36k2uQUS8OWT6+HcMwjL+RYTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XLKHb/nN0VzgyAl+76RVAu+YCTl0iY2bnxJIL4K8LeA=; b=FMuddO5bKXEmjutdqHxrWB0FIZ
 Y92oEODG8TE+IcdsvDctm9AZfoaYOhdS5qmjUCfigXFUDLDpmN2vWV2uJHbSD/OifiBViHcsTFeak
 MeRbmvkw9lYxaS14lHhvtZAxQ79lCCj3f7zkPdR1vdh5cbTmuPn8fUfChVrd7NlgGvxQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lfzxF-000ZiM-Nq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 07:03:56 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FdsPt3jcyzqV0D;
 Mon, 10 May 2021 15:00:18 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 10 May
 2021 15:03:37 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20210510064057.729369-1-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <726b7f8d-bbad-f940-c06e-056103025a47@huawei.com>
Date: Mon, 10 May 2021 15:03:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210510064057.729369-1-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lfzxF-000ZiM-Nq
Subject: Re: [f2fs-dev] [PATCH] f2fs: Prevent swap file on zoned block
 devices
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/10 14:40, Shin'ichiro Kawasaki wrote:
> When f2fs is set up on zoned block devices, swap files on the file-
> system causes unaligned write command errors. The kernel writes to the
> swap files directly without the assistance of the filesystem then
> it can not fulfill sequential write requirements of zoned block devices.
> 
> To avoid the errors, prevent swap file activation when the filesystem
> enables block zoned device support.
> 
> Fixes: 4969c06a0d83 ("f2fs: support swap file w/ DIO")
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Cc: stable@vger.kernel.org # v5.4+
> ---
>   fs/f2fs/data.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 96f1a354f89f..51a832efd8cd 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4050,6 +4050,12 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
>   	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
>   		return -EROFS;
>   
> +	if (f2fs_sb_has_blkzoned(F2FS_I_SB(inode))) {

Should be f2fs_lfs_mode()? because all LFS mode instances will suffer
the same problem?

Thanks,

> +		f2fs_err(F2FS_I_SB(inode),
> +			"Swapfile not supported on zoned block devices");
> +		return -EINVAL;
> +	}
> +
>   	ret = f2fs_convert_inline_inode(inode);
>   	if (ret)
>   		return ret;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
