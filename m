Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 340192FE7A0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Jan 2021 11:31:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2XEv-0008Ri-8h; Thu, 21 Jan 2021 10:30:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l2XEn-0008QG-Be
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 10:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NRu+SVPL7A7J3Y7+NlEcLLabf9TPW7Fo8zkUPByPb/8=; b=HAJfQfyIAgUJInaOJbD6SL72kF
 zsOpG/ahv5RN/JOulUL/16aTpXZmiJc7O32NHI4ZETdPdtJpkh8fiIqdI4Cmb7Mq3kCQg1bQg8gwS
 KvGwWNEEIGkIpf7BV5ZNuKwsAGNXWHOOpCjutMx86BGDu7mZ2awJ0F1CzccuW1eY5Qvs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NRu+SVPL7A7J3Y7+NlEcLLabf9TPW7Fo8zkUPByPb/8=; b=hVC2Nd+tlCVw3KaRi2z/v563+t
 I14x1d7JGu1KRe0K5ezp4XjdrRx9Jt+hl7/eY0vCucT6Xte4DPeTaoakAv6Ki9v01jFytyYfhaX0B
 wwvvaGCJHvfkUNYc8UdxeJseMIFqNrf4w1wNJI2BMarZqlU5meqGvbz3JNencjj8tuzg=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l2XEc-002KFs-Qc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 10:30:49 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DLzC02YL9zMNH7;
 Thu, 21 Jan 2021 18:29:00 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 21 Jan
 2021 18:30:23 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20210114062302.3809664-1-daeho43@gmail.com>
 <20210114062302.3809664-2-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d4c12d47-db33-7e76-b7ad-4d80ced1aba9@huawei.com>
Date: Thu, 21 Jan 2021 18:30:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210114062302.3809664-2-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l2XEc-002KFs-Qc
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: add ckpt_thread_ioprio sysfs
 node
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/1/14 14:23, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added "ckpt_thread_ioprio" sysfs node to give a way to change checkpoint
> merge daemon's io priority. Its default value is "be,3", which means
> "BE" I/O class and I/O priority "3". We can select the class between "rt"
> and "be", and set the I/O priority within valid range of it.
> "," delimiter is necessary in between I/O class and priority number.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2:
> - adapt to inlining ckpt_req_control of f2fs_sb_info
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++
>   fs/f2fs/checkpoint.c                    |  2 +-
>   fs/f2fs/f2fs.h                          |  1 +
>   fs/f2fs/sysfs.c                         | 51 +++++++++++++++++++++++++
>   4 files changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 3dfee94e0618..0c48b2e7dfd4 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -377,3 +377,11 @@ Description:	This gives a control to limit the bio size in f2fs.
>   		Default is zero, which will follow underlying block layer limit,
>   		whereas, if it has a certain bytes value, f2fs won't submit a
>   		bio larger than that size.
> +What:		/sys/fs/f2fs/<disk>/ckpt_thread_ioprio
> +Date:		January 2021
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Give a way to change checkpoint merge daemon's io priority.
> +		Its default value is "be,3", which means "BE" I/O class and
> +		I/O priority "3". We can select the class between "rt" and "be",
> +		and set the I/O priority within valid range of it. "," delimiter
> +		is necessary in between I/O class and priority number.
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index e0668cec3b80..62bd6f449bb7 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1840,7 +1840,7 @@ int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi)
>   	if (IS_ERR(cprc->f2fs_issue_ckpt))
>   		return PTR_ERR(cprc->f2fs_issue_ckpt);
>   
> -	set_task_ioprio(cprc->f2fs_issue_ckpt, DEFAULT_CHECKPOINT_IOPRIO);
> +	set_task_ioprio(cprc->f2fs_issue_ckpt, cprc->ckpt_thread_ioprio);

Where do we set default value of cprc->ckpt_thread_ioprio? I guess it should
be f2fs_init_ckpt_req_control()?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
