Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F5F9DB10
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2019 03:35:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2QO6-0007Wp-4p; Tue, 27 Aug 2019 01:35:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i2QO1-0007We-GX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 01:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vPSOr4gJQXrgJAdVev+5GgAoeqV6m6Q10juxlZuJAgk=; b=apznfkaHFANZE6DgEWst2UicNO
 rkkzmECqQ+DQfZSJzuRPJiIUZ1qOGjDHQb0pZv44+9YO3HZis9QgJt4rXh4uVD9M8BBPEzDbFkxT4
 FlF4iH/T+NmYXmJ5QVl5vGcBU/xo+PndPf6KVF9tB+1xqQ0oSSWr0YYqm/F9GmFxjFa8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vPSOr4gJQXrgJAdVev+5GgAoeqV6m6Q10juxlZuJAgk=; b=l5BtYUOyAHGwdQ+T19KN0Mjpg1
 DlwLkbuIoh3Gdh6Zsz9uUBwOv0hcd9hgXyhuNizCXiSB5jY8f0DVDpDoMsDWwYx3w7LJfHQALtVXy
 jgidJrY9p7e9unS/EeizJ+izRcCn1Q5rcloQghGbICxiqhariuVwSXM4tiUUWEt6IBsc=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2QNz-003zzp-EU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 01:35:05 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 826ABFE09BA03F72F716;
 Tue, 27 Aug 2019 09:34:56 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 27 Aug
 2019 09:34:51 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <20190821044802.29702-2-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a04bfef2-04a6-9e31-79db-b4eb1827022a@huawei.com>
Date: Tue, 27 Aug 2019 09:34:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190821044802.29702-2-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i2QNz-003zzp-EU
Subject: Re: [f2fs-dev] [PATCH v2 1/4] libf2fs_zoned: Introduce
 f2fs_report_zones() helper function
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/21 12:47, Shin'ichiro Kawasaki wrote:
> To prepare for write pointer consistency check by fsck, add
> f2fs_report_zones() helper function which calls REPORT ZONE command to
> get write pointer status. The function is added to lib/libf2fs_zoned
> which gathers zoned block device related functions.
> 
> To check write pointer consistency with f2fs meta data, fsck needs to
> refer both of reported zone information and f2fs super block structure
> "f2fs_sb_info". However, libf2fs_zoned does not import f2fs_sb_info. To
> keep f2fs_sb_info structure out of libf2fs_zoned, provide a callback
> function in fsck to f2fs_report_zones() and call it for each zone.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  include/f2fs_fs.h   |  2 ++
>  lib/libf2fs_zoned.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 0d9a036..abadd1b 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1279,6 +1279,8 @@ blk_zone_cond_str(struct blk_zone *blkz)
>  
>  extern int f2fs_get_zoned_model(int);
>  extern int f2fs_get_zone_blocks(int);
> +typedef int (report_zones_cb_t)(int i, struct blk_zone *blkz, void *opaque);
> +extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
>  extern int f2fs_check_zones(int);
>  extern int f2fs_reset_zones(int);
>  
> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> index af00b44..fc4974f 100644
> --- a/lib/libf2fs_zoned.c
> +++ b/lib/libf2fs_zoned.c
> @@ -193,6 +193,57 @@ int f2fs_get_zone_blocks(int i)
>  
>  #define F2FS_REPORT_ZONES_BUFSZ	524288
>  
> +int f2fs_report_zones(int j, report_zones_cb_t *report_zones_cb, void *opaque)
> +{
> +	struct device_info *dev = c.devices + j;
> +	struct blk_zone_report *rep;
> +	struct blk_zone *blkz;
> +	unsigned int i, n = 0;
> +	u_int64_t total_sectors = (dev->total_sectors * c.sector_size) >> 9;

Hi Shin'ichiro,

Could we use SECTOR_SHIFT instead?

> +	u_int64_t sector = 0;
> +	int ret = -1;
> +
> +	rep = malloc(F2FS_REPORT_ZONES_BUFSZ);
> +	if (!rep) {
> +		ERR_MSG("No memory for report zones\n");
> +		return -ENOMEM;
> +	}
> +
> +	while (sector < total_sectors) {
> +
> +		/* Get zone info */
> +		rep->sector = sector;
> +		rep->nr_zones = (F2FS_REPORT_ZONES_BUFSZ - sizeof(struct blk_zone_report))
> +			/ sizeof(struct blk_zone);
> +
> +		ret = ioctl(dev->fd, BLKREPORTZONE, rep);
> +		if (ret != 0) {
> +			ret = -errno;
> +			ERR_MSG("ioctl BLKREPORTZONE failed\n");
It's minor, it will be better to print errno here, since I didn't see we print
error no from caller.

> +			goto out;
> +		}
> +
> +		if (!rep->nr_zones) {
> +			ret = -EIO;
> +			ERR_MSG("Unexpected ioctl BLKREPORTZONE result\n");
> +			goto out;
> +		}
> +
> +		blkz = (struct blk_zone *)(rep + 1);
> +		for (i = 0; i < rep->nr_zones && sector < total_sectors; i++) {

The condition looks like that block zones in rep may across end-of-device? Will
this really happen?

So I mean will "i < rep->nr_zones" be enough?

Thanks,

> +			ret = report_zones_cb(n, blkz, opaque);
> +			if (ret)
> +				goto out;
> +			sector = blk_zone_sector(blkz) + blk_zone_length(blkz);
> +			n++;
> +			blkz++;
> +		}
> +	}
> +out:
> +	free(rep);
> +	return ret;
> +}
> +
>  int f2fs_check_zones(int j)
>  {
>  	struct device_info *dev = c.devices + j;
> @@ -372,6 +423,12 @@ out:
>  
>  #else
>  
> +int f2fs_report_zones(int j, report_zones_cb_t *report_zones_cb, void *opaque)
> +{
> +	ERR_MSG("%d: Zoned block devices are not supported\n", i);
> +	return -1;
> +}
> +
>  int f2fs_get_zoned_model(int i)
>  {
>  	struct device_info *dev = c.devices + i;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
