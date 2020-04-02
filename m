Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D45419BDAA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Apr 2020 10:38:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJvMZ-00034v-T5; Thu, 02 Apr 2020 08:38:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jJvMY-00034B-On
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Apr 2020 08:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DGMldTQkkS0PrN+AiTa44/67DdtmIjJUGpYQ7xLZuIM=; b=C3L6LV7barH8XPkPY/LyWJDFU7
 N/kSp/KSfWhWthvoL3EOGkAG20rki3Q35nZtbIn8Wwgl6Ub8Q+7Bv+cJ9/gKHRrxzTNNgxL1pxawb
 IhS/OlzjqUlY0eYH6XqhBaT2uq82Jy5ZWKCmsCXnMrxvCEJxJP/Tl1zggvIWA/XcccAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DGMldTQkkS0PrN+AiTa44/67DdtmIjJUGpYQ7xLZuIM=; b=ORkHK9MrUos29iI8aJr2Vrw+gl
 jytv/wQKqw8pIQ7+CvXRT/1EisR/VWKmqXnBXc0a+2EdOtZOBvzUJQnQq2xe0Ff5wLuEopML2FA/m
 z5RZJsb+f5eGYvlFjItLmoY5ERvweEnti2SYME4NFjr1Skc9w2XfaXSileYz6Pif5bQU=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jJvMS-004okU-E1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Apr 2020 08:38:10 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 549B628F6AF62727C616;
 Thu,  2 Apr 2020 16:37:50 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 2 Apr 2020
 16:37:42 +0800
To: Jason Yan <yanaijie@huawei.com>, <jaegeuk@kernel.org>, <chao@kernel.org>, 
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
References: <20200402061545.23208-1-yanaijie@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6170e88e-5242-30dd-f624-1171aaa994de@huawei.com>
Date: Thu, 2 Apr 2020 16:37:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200402061545.23208-1-yanaijie@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jJvMS-004okU-E1
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove set but not used variable
 'params'
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

Hi Jason,

On 2020/4/2 14:15, Jason Yan wrote:
> Fix the following gcc warning:
> 
> fs/f2fs/compress.c:375:18: warning: variable 'params' set but not used [-Wunused-but-set-variable]
>   ZSTD_parameters params;
>                   ^~~~~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Thanks for the patch, would you mind that just merge this fix into
original path which is still in f2fs private git tree?

Thanks,

> ---
>  fs/f2fs/compress.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index f05ecf4cb899..df7b2d15eacd 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -372,12 +372,10 @@ static int zstd_compress_pages(struct compress_ctx *cc)
>  
>  static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
>  {
> -	ZSTD_parameters params;
>  	ZSTD_DStream *stream;
>  	void *workspace;
>  	unsigned int workspace_size;
>  
> -	params = ZSTD_getParams(F2FS_ZSTD_DEFAULT_CLEVEL, dic->clen, 0);
>  	workspace_size = ZSTD_DStreamWorkspaceBound(MAX_COMPRESS_WINDOW_SIZE);
>  
>  	workspace = f2fs_kvmalloc(F2FS_I_SB(dic->inode),
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
