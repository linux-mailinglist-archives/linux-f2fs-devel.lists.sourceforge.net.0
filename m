Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4D1204E13
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2020 11:35:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnfKu-0005GH-Oi; Tue, 23 Jun 2020 09:35:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jnfKt-0005GA-Hb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jun 2020 09:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zDLu6jMHmeCRw0Kx0RBFL5aPBk8wdfqYRdBGaStp5X0=; b=PoH31jcm3vxbfBR73agnwlBC2/
 A0wblhkoSyV+cxqyaQIawMYTVcbDPN79x9+WtbJC6KRP984+1i7iyJcEPSBlB3ulCvKrahv1NX4qI
 Ch1D11QqeIS9OS6com5Mca+hEyhx7fFUJC1a1W2okDliNGpw6udjQzopPTUTeAt1WW+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zDLu6jMHmeCRw0Kx0RBFL5aPBk8wdfqYRdBGaStp5X0=; b=BQLiRUxk5/n+OpADmIClb6HgpI
 +7lJmZIs3+BgEN9TiYBIg/UTHZbFv4dJ/sNzwi1oMTDvqABYQsEAZIJ1pGq/sbBUIEHg0dUiDMFfl
 corOGouCVKK4SWQDLsL1Yo6Ctw9zIs4Rdl0QKSOg+oW16prCGT+7UI5bYbEX2n3C0zs8=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jnfKr-00F49A-Bb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jun 2020 09:35:23 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E84F3FDA738BE5621311;
 Tue, 23 Jun 2020 17:34:58 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 23 Jun
 2020 17:34:52 +0800
To: z00520423 <zhangqilong3@huawei.com>, <jaegeuk@kernel.org>
References: <20200623071446.44106-1-zhangqilong3@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <45f5e30c-e8eb-b587-c029-57fafe4dcf4f@huawei.com>
Date: Tue, 23 Jun 2020 17:34:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200623071446.44106-1-zhangqilong3@huawei.com>
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
X-Headers-End: 1jnfKr-00F49A-Bb
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: add f2fs_gc exception handle in
 f2fs_ioc_gc_range
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

On 2020/6/23 15:14, z00520423 wrote:
> From: Qilong Zhang <zhangqilong3@huawei.com>
> 
> When f2fs_ioc_gc_range performs multiple segments gc ops, the return
> value of f2fs_ioc_gc_range is determined by the last segment gc ops.
> If its ops failed, the f2fs_ioc_gc_range will be considered to be failed
> despite some of previous segments gc ops succeeded. Therefore, so we
> fix: only all of segments gc ops are finished will return success.
> 
> Signed-off-by: Qilong Zhang <zhangqilong3@huawei.com>
> ---
>  fs/f2fs/file.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 3268f8dd59bb..b81fcf9b123d 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2527,6 +2527,10 @@ static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
>  	}
>  
>  	ret = f2fs_gc(sbi, range.sync, true, GET_SEGNO(sbi, range.start));
> +	if (ret) {

-ENODATA means 1) target section has no valid blocks or 2) the section has valid blocks,
but it is opened segment, IMO, for 1) condition, we can wrap return value to zero,
continue to gc later sections, for 2) condition, we'd better to return -EBUSY as a hint
to user to call the interface later again.

get_victim_by_default():

	if (*result != NULL_SEGNO) {
		if (get_valid_blocks(sbi, *result, false) &&
			!sec_usage_check(sbi, GET_SEC_FROM_SEG(sbi, *result)))
			p.min_segno = *result;
		goto out;
	}

> +		ret = -EAGAIN;
> +		goto out;
> +	}
>  	range.start += BLKS_PER_SEC(sbi);
>  	if (range.start <= end)
>  		goto do_more;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
