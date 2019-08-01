Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A59B7D2F9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2019 03:48:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ht0CU-0002qK-Ha; Thu, 01 Aug 2019 01:48:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ht0CS-0002q2-JR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 01:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NNWWYBm2TqzZhfIn5Fm7/3SoSqgv1A61gPtLyU5i1QY=; b=VLtyN8G3lvL/kDXN8iL4pVjB6/
 eVttJv4JuTTDo5v0MhFB3jfiA4gZhlrMtmNvJUV2D1fpdqiKZFIUe9lgw8zbf7cjq7J8dt/nqRRxy
 7zsUzrn4PwwNYtueUoYL+5k/B0DvlHQ2b+wzgYQb9ycobNzsJsoocIAfXodQiry/670I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NNWWYBm2TqzZhfIn5Fm7/3SoSqgv1A61gPtLyU5i1QY=; b=c5ZlhrNZ2ZHWioHyxbF4TWEALt
 9JSIWNHCVU6VQ4wJzDBgfzn7e18PRXhjGZfvC5zlcT20CyyfBRnpSAMqw2VYVPnu4/gFflmGwYV+G
 fHRWToKSu5H7TbqhJZ20ArzlM9WQM6wzarNKt6BflwQktP3O6zLTyz565WUBL9ALBn00=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1ht0CQ-005xkP-5s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 01:48:12 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3EC32324C38EF059D395;
 Thu,  1 Aug 2019 09:47:59 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019
 09:47:55 +0800
To: Surbhi Palande <f2fsnewbie@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190801012617.2472-1-f2fsnewbie@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a7cae58d-58f9-647c-201d-6dc95e0f63ce@huawei.com>
Date: Thu, 1 Aug 2019 09:47:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190801012617.2472-1-f2fsnewbie@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ht0CQ-005xkP-5s
Subject: Re: [f2fs-dev] [f2fs-tools][PATCH] Throw an error when zone device
 info not found
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
Cc: Surbhi Palande <csurbhi@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Surbhi,

This patch looks good to me, unless we'd better change patch title a little as
"libf2fs: throw an ...." to indicate which part of f2fs we patched.

Anyway, please add below tag in your next version:

Reviewed-by: Chao Yu <yucha0@huawei.com>

BTW, I notice that your name of email address is cool! Very suitable for f2fs
patch submission. ;)

Thanks,

On 2019/8/1 9:26, Surbhi Palande wrote:
> From: Surbhi Palande <csurbhi@gmail.com>
> 
> When the -m option is specified to format a Zoned device,
> do not fall back to the non-zoned mode in case information
> about the device is not found.
> 
> Explicitly specify this error to the user.
> 
> Signed-off-by: Surbhi Palande <csurbhi@gmail.com>
> ---
>  lib/libf2fs.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 6b5badf..2ea405e 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -16,6 +16,7 @@
>  #include <errno.h>
>  #include <unistd.h>
>  #include <fcntl.h>
> +#include <libgen.h>
>  #ifdef HAVE_MNTENT_H
>  #include <mntent.h>
>  #endif
> @@ -1140,7 +1141,12 @@ int f2fs_get_device_info(void)
>  		c.segs_per_sec = c.zone_blocks / DEFAULT_BLOCKS_PER_SEGMENT;
>  		c.secs_per_zone = 1;
>  	} else {
> -		c.zoned_mode = 0;
> +		if(c.zoned_mode != 0) {
> +			MSG(0, "\n Error: %s is not zoned (-m option)", c.devices[0].path);
> +			MSG(1, "\n /sys/block/%s/queue/zoned not found \n",
> +					basename(c.devices[0].path));
> +			return -1;
> +		}
>  	}
>  
>  	c.segs_per_zone = c.segs_per_sec * c.secs_per_zone;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
