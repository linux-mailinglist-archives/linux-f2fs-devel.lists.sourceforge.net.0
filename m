Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C580C2EA2F7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 02:45:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwbPA-00030w-9I; Tue, 05 Jan 2021 01:45:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kwbP9-00030p-FQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 01:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wJF3KY9cW6HjotaN5y0ihKRrAFwMTDglpDkFPCXTvEk=; b=TC5i/VX0eG3Wol4tp1WIW4vYXG
 +cfCG6iw7RnRTNik0c/jEdB59MfS8RoC/+dQ9yW6IkBqP7FvomjoUWsFFBNa07TqeUw9rF8bYMi6q
 t7DnArQRKQraPs7bZRKQnoxKfjiCSRUSryRT+kGUXZgVeC87MrR8jHlxvVja0LwLCJhI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wJF3KY9cW6HjotaN5y0ihKRrAFwMTDglpDkFPCXTvEk=; b=CFcajvHj94UZtdoqDFUy7NVYhU
 tJiHht2FV89A/Ahma7RftIQpTdrbNJwxN+dsuyhbEXFNFeFt3ack7X6nAFOQhqalLrWTipAvhPiEB
 SwugXvahrdD/cEoxhW3FZin0MpxjgWtNfLg9+gQcsGpbb4/lwht5BH01suhs8taUpWtY=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwbOx-00E5Su-34
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 01:44:59 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D8wHr5B5Gzl0DQ;
 Tue,  5 Jan 2021 09:43:20 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 5 Jan 2021
 09:44:26 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20210105012826.956800-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <904b7677-3655-2e81-52e0-48296cf1c0da@huawei.com>
Date: Tue, 5 Jan 2021 09:44:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210105012826.956800-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kwbOx-00E5Su-34
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix null page reference in
 redirty_blocks
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
Cc: Colin Ian King <colin.king@canonical.com>,
 Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/1/5 9:28, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Fixed null page reference when find_lock_page() fails in
> redirty_blocks().
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Reported-by: Colin Ian King <colin.king@canonical.com>
> Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")
> ---
>   fs/f2fs/file.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 9e5275716be8..bf6682a52433 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4060,8 +4060,10 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
>   
>   	for (i = 0; i < page_len; i++, redirty_idx++) {
>   		page = find_lock_page(mapping, redirty_idx);
> -		if (!page)
> +		if (!page) {
>   			ret = -ENOENT;

ret = -ENOMEM;

> +			continue;

How about breaking the loop for out-of-memory case, because in such condition
we have less chance to dirty whole cluster due to no memory, and continue to
allocate pages for target file will make system suffer more memory pressure,
it will make many thing slower.

Thnaks,

> +		}
>   		set_page_dirty(page);
>   		f2fs_put_page(page, 1);
>   		f2fs_put_page(page, 0);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
