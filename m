Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 610F989559
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Aug 2019 04:19:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hwzvi-0005J5-EB; Mon, 12 Aug 2019 02:19:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hwzvg-0005Is-6K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 02:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0BXoL/JdUR3rXTLUr37yyzFM4+yVJCBZFNI0j1XSsQg=; b=VxMiEGZmrJMjIB3jCqXC+H7mfN
 CKZd5xw27KhsMaLUYLuNA0fg09WJlQ5dG+WmM4Lg5szFZHZNxNlo3T/QzF/Nf9O9cLwB9ImpidGZM
 GM6kIHd988UeZjYu0P8yoLSDc0YiXRp0dvjYxntrZVrMrnL8M3WcDN0dE1k4dDQdgoA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0BXoL/JdUR3rXTLUr37yyzFM4+yVJCBZFNI0j1XSsQg=; b=h1VljnqVyDoz5TXcgw/i55H5Bk
 oEOEGDOa+8z0A0TXPhxWOdArQ3pWdeT/uNf+cI1jblIkILuNIbezL0G388LtXwGSpVM0e4qRVgmm2
 4thgJuvLruYskRvK3jnNxz+qOLaCVxz2SBqq1MZC7N7KssXEk5LKPDZPVmAi8p4Q3iVM=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hwzve-002CTH-Bz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 02:19:24 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BE4C68B5618C892CB64D;
 Mon, 12 Aug 2019 10:19:13 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 12 Aug
 2019 10:19:12 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190808231108.75599-1-jaegeuk@kernel.org>
 <20190809151253.GA93481@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9e3ccdf8-6280-ac8d-30b7-e89d54f5b6c9@huawei.com>
Date: Mon, 12 Aug 2019 10:19:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190809151253.GA93481@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hwzve-002CTH-Bz
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: check zeros in first 16MB for
 Android
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

On 2019/8/9 23:12, Jaegeuk Kim wrote:
> We actually don't need to issue trim on entire disk by checking first
> blocks having zeros.

In heap mode, we locate node log header to tail end of device, should we
consider to check block contain according to heap option?

BTW, if we changed cp_ver whenever mkfs, why should we still issue trim to
obsolete old data in node remained in image?

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v2 from v1:
>  - clean up
> 
>  mkfs/f2fs_format_utils.c | 53 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
> index 8bf128c..f2d55ad 100644
> --- a/mkfs/f2fs_format_utils.c
> +++ b/mkfs/f2fs_format_utils.c
> @@ -25,6 +25,7 @@
>  #include <stdio.h>
>  #include <unistd.h>
>  #include <stdlib.h>
> +#include <stdbool.h>
>  #ifndef ANDROID_WINDOWS_HOST
>  #include <sys/ioctl.h>
>  #endif
> @@ -110,13 +111,61 @@ static int trim_device(int i)
>  	return 0;
>  }
>  
> +static bool is_wiped_device(int i)
> +{
> +#ifdef WITH_ANDROID
> +	struct device_info *dev = c.devices + i;
> +	int fd = dev->fd;
> +	char *buf, *zero_buf;
> +	bool wiped = true;
> +	int nblocks = 4096;	/* 16MB size */
> +	int j;
> +
> +	buf = malloc(F2FS_BLKSIZE);
> +	if (buf == NULL) {
> +		MSG(1, "\tError: Malloc Failed for buf!!!\n");
> +		return false;
> +	}
> +	zero_buf = calloc(1, F2FS_BLKSIZE);
> +	if (zero_buf == NULL) {
> +		MSG(1, "\tError: Calloc Failed for zero buf!!!\n");
> +		free(buf);
> +		return false;
> +	}
> +
> +	if (lseek(fd, 0, SEEK_SET) < 0) {
> +		free(zero_buf);
> +		free(buf);
> +		return false;
> +	}
> +
> +	/* check first n blocks */
> +	for (j = 0; j < nblocks; j++) {
> +		if (read(fd, buf, F2FS_BLKSIZE) != F2FS_BLKSIZE ||
> +				memcmp(buf, zero_buf, F2FS_BLKSIZE)) {
> +			wiped = false;
> +			break;
> +		}
> +	}
> +	free(zero_buf);
> +	free(buf);
> +
> +	if (wiped)
> +		MSG(0, "Info: Found all zeros in first %d blocks\n", nblocks);
> +	return wiped;
> +#else
> +	return false;
> +#endif
> +}
> +
>  int f2fs_trim_devices(void)
>  {
>  	int i;
>  
> -	for (i = 0; i < c.ndevs; i++)
> -		if (trim_device(i))
> +	for (i = 0; i < c.ndevs; i++) {
> +		if (!is_wiped_device(i) && trim_device(i))
>  			return -1;
> +	}
>  	c.trimmed = 1;
>  	return 0;
>  }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
