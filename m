Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C147E225E86
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 14:28:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxUuW-0000vK-8k; Mon, 20 Jul 2020 12:28:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jxUuU-0000vC-CP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 12:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6+vVKzQi86a1XuuDEEqt/xVk8bXG9Wxly/Lmtg9e6pk=; b=mt86l5Dqpey/3QmK7UsahXzKCs
 uQ6nG0WG0xrpbSfqpA0ZC0KoFnQZwO0Rt3FyIPfuGBE0hbBesRFleWuWM9bnTyYyMAJXitEWgylmk
 1chWrOEUjppnieRXrNvNOLmU9gCG8Xq3Pe2dwUmhgVlJ3Zl/jK0G+dGXuJpU4L0olebQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6+vVKzQi86a1XuuDEEqt/xVk8bXG9Wxly/Lmtg9e6pk=; b=j7i+Nm665EG2K3ufJZMxoFbOfS
 g7JN9fV5mmO9cs40ceVVXoSmB3z9rpjQRVCK3YrEwtZATPFO/4WYiO91dO0fu/xPqFK7smuWS9KIu
 bvR1GyfDm3rLoGaLLraiVHd5ZVVJcNBYXe7wUDGvNpcCEWIngfui9i+1KOBieL3QfRM8=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxUuS-00AkoM-9n
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 12:28:46 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 365FC1BA019343E1DE06;
 Mon, 20 Jul 2020 20:28:37 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 20 Jul
 2020 20:28:35 +0800
To: <jaegeuk@kernel.org>
References: <20200720085250.47279-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a24a282f-895f-39b1-181b-1208d6f1803c@huawei.com>
Date: Mon, 20 Jul 2020 20:28:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200720085250.47279-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxUuS-00AkoM-9n
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix to avoid memory leak on
 cc->cpages
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

On 2020/7/20 16:52, Chao Yu wrote:
> Memory allocated for storing compressed pages' poitner should be
> released after f2fs_write_compressed_pages(), otherwise it will
> cause memory leak issue.

Jaegeuk,

Please help to add below tag when merging, thanks.

Fixes: 4c8ff7095bef ("f2fs: support data compression")

> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>   fs/f2fs/compress.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 3a847bc36748..a20c9f3272af 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1385,6 +1385,8 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>   		err = f2fs_write_compressed_pages(cc, submitted,
>   							wbc, io_type);
>   		cops->destroy_compress_ctx(cc);
> +		kfree(cc->cpages);
> +		cc->cpages = NULL;
>   		if (!err)
>   			return 0;
>   		f2fs_bug_on(F2FS_I_SB(cc->inode), err != -EAGAIN);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
