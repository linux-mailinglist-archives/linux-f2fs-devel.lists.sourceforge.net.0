Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A998F219674
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 05:05:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtMsW-0002ac-0k; Thu, 09 Jul 2020 03:05:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jtMsU-0002aV-Pk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 03:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9FiNnjyOP8GnRW/3u9MXqOWMSM/Par+LqhGagyhx9uY=; b=ByiX94+7TYdEJUWlnf5YXvLLbq
 bnAsG51vn+3jlHnLD2OwhxOZa5htLAKP9xCd7EG/vOUhW56Boj1nyavcwe+4ulMlcAeOlYC+P6fca
 lli8f0tesTs85aY+FjuRcSSb1nGgCLkehOW/keAvWHZ/Uu5dT83LlLEL2/KLYlgy8KSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9FiNnjyOP8GnRW/3u9MXqOWMSM/Par+LqhGagyhx9uY=; b=eLIKft6iJ1lC/v99oXg0vXdu6g
 y5hNw29E9x52c/v6sDKo6VMmvgP1mBh0UU64gw95wPzDyUPADPfxu0HKF20bc+tDCrCntJTK/vPVw
 /VMHy8QVlWwJqsZ9vtmrCbU21XpemruC9D4xYLd233LbhPbVr9AnuNeXiFvRTH3RXr+8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtMsQ-00Bipk-B4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 03:05:38 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B75356259D08A9F78B28;
 Thu,  9 Jul 2020 11:05:18 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 9 Jul 2020
 11:05:16 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200709015739.1653668-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <619af72b-2f8a-4a84-f73e-ac49989ba79f@huawei.com>
Date: Thu, 9 Jul 2020 11:05:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200709015739.1653668-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtMsQ-00Bipk-B4
Subject: Re: [f2fs-dev] [PATCH] f2fs: ignore when len of range in
 f2fs_sec_trim_file is zero
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

On 2020/7/9 9:57, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> When end_addr comes to zero, it'll trigger different behaviour.
> To prevent this, we need to ignore the case of that range.len is
> zero in the function.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/file.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 368c80f8e2a1..98b0a8dbf669 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3813,15 +3813,14 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>  	file_start_write(filp);
>  	inode_lock(inode);
>  
> -	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
> +	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
> +			range.start >= inode->i_size) {
>  		ret = -EINVAL;
>  		goto err;
>  	}
>  
> -	if (range.start >= inode->i_size) {
> -		ret = -EINVAL;
> +	if (range.len == 0)
>  		goto err;
> -	}
>  
>  	if (inode->i_size - range.start < range.len) {
>  		ret = -E2BIG;

How about the case trimming last partial written block?

i_size = 8000
range.start = 4096
range.len = 4096

Do we need to roundup(isize, PAGE_SIZE) before comparison?

Thanks,

> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
