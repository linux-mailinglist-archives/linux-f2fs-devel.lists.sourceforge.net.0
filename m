Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4193B4FFC05
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 19:03:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1negOo-00051k-50; Wed, 13 Apr 2022 17:03:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1negOm-00051e-MQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 17:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EfbbI+JtRjmi9C09FI1NEWmPKFJ0mZnETxI3sDogkzI=; b=XuQtxMDgepFHnElcukOE6Mn7tj
 lVA6R65U8N1FmqdwjyOvvgkzJRHjHvj6Esrn/O+PrmiddAxuEaaz6bvVQSzWkXojDm31VtbAN8i8Y
 HxBs/riEGKOxlnoD8GwKSkUc6dlln7XllLFUorwDszpEEIb14tO10otrHkMnLSvGsVSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EfbbI+JtRjmi9C09FI1NEWmPKFJ0mZnETxI3sDogkzI=; b=aqnyfeeZoAGL6Adgx++AYyr/AS
 hPIsercDFezi1W/sHN3mjlPrnN0qJxc6/SdDEXVIVwhdL4dBpfh1vzZqp24giOp+nz6STIYrZVICb
 LKOPOaburlDy/BO23CPSseMPmE5Xb5Lrrrdm7aoO6tuzgjyztcCr2WT2WQiTK2mlAFlk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1negOh-00FP53-Co
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 17:03:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE06F61E66;
 Wed, 13 Apr 2022 17:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E73FC385AA;
 Wed, 13 Apr 2022 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649869389;
 bh=GhURq2c32jADHSirccPT5p15CYBG+r9yvHc/ASSQkGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kX4PWsCb+6esOOaWevCvq7YMWX4QVSTtXGc/27GKcTZgqg7QRbufj5mVbekWBKHPA
 H0TCg6tagD5W7yZceBt9Lrl5TqNaM78nBG04SLjE/ElY/ylyrHW9VFq6ioVZv/HMxI
 2jemw5CUDiOobk+CZqrDkS4qz5NFKWJz4XD/ZrL4VUXzfi8Zk62TQ9KIQoIxdyhc/3
 FN9RV4T51Psy4NfKeRmxd+3EM5H/vYvlJrrooFB02vZbv/TmZdO+9rTjN0aPptqs/H
 wAmwURRY76kg3rY/PJ+M13/vuap5eoN6TJ/LPYqJwS20nxRf9hAfRLJgE6NOpuMgja
 Ei9nfxg9Mf1ow==
Date: Wed, 13 Apr 2022 10:03:05 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Pankaj Raghav <p.raghav@samsung.com>
Message-ID: <YlcCSR2rTqOgOoxX@google.com>
References: <CGME20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35@eucas1p1.samsung.com>
 <20220413122940.133981-1-p.raghav@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220413122940.133981-1-p.raghav@samsung.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/13,
 Pankaj Raghav wrote: > From: Luis Chamberlain <mcgrof@kernel.org>
 > > f2fs currently only work with zoned storage devices with a zone > size
 which is a power of 2 (PO2). So check if a non-po [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1negOh-00FP53-Co
Subject: Re: [f2fs-dev] [PATCH v2] libf2fs: don't allow mkfs / fsck on non
 power-of-2 zoned devices
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
Cc: javier.gonz@samsung.com, Damien.LeMoal@wdc.com, mcgrof@kernel.org,
 pankydev8@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/13, Pankaj Raghav wrote:
> From: Luis Chamberlain <mcgrof@kernel.org>
> 
> f2fs currently only work with zoned storage devices with a zone
> size which is a power of 2 (PO2). So check if a non-power of 2
> zoned device is found, and if so disallow its use. This prevents
> users from incorrectly using these devices.
> 
> This is a non-issue today given today's kernel does not allow NPO2
> zoned devices to exist as a block device. But NPO2 zoned devices do exist
> so proactively put a stop-gap measure in place to prevent it from being
> incorrectly used.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
> Changes since v1:
> - Squash the commits for clarity (Damien)
> - f2fs_get_zone_chunk_sectors can return uint32_t (Damien)
> - Include the units for zone size in msg info (Damien)
> - Sections can be npo2 but it should only be a multiple of 2MB (Jaegeuk)
> 
>  include/f2fs_fs.h   |  1 +
>  lib/libf2fs.c       | 17 +++++++++++++++--
>  lib/libf2fs_zoned.c | 34 ++++++++++++++++++++++------------
>  3 files changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index d236437..83c5b33 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -386,6 +386,7 @@ struct device_info {
>  	u_int32_t nr_zones;
>  	u_int32_t nr_rnd_zones;
>  	size_t zone_blocks;
> +	uint64_t zone_size;
>  	size_t *zone_cap_blocks;
>  };
>  
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 420dfda..8104667 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -882,6 +882,11 @@ static int open_check_fs(char *path, int flag)
>  	return open(path, O_RDONLY | flag);
>  }
>  
> +static int is_power_of_2(unsigned long n)

So, this needs to check 2MB alignment only?

> +{
> +	return (n != 0 && ((n & (n - 1)) == 0));
> +}
> +
>  int get_device_info(int i)
>  {
>  	int32_t fd = 0;
> @@ -1043,6 +1048,13 @@ int get_device_info(int i)
>  			return -1;
>  		}
>  
> +		if (!is_power_of_2(dev->zone_size)) {
> +			MSG(0, "\tError: zoned: illegal zone size %lu (not a power of 2)\n",
> +					dev->zone_size);
> +			free(stat_buf);
> +			return -1;
> +		}
> +
>  		/*
>  		 * Check zone configuration: for the first disk of a
>  		 * multi-device volume, conventional zones are needed.
> @@ -1055,8 +1067,9 @@ int get_device_info(int i)
>  		MSG(0, "Info: Host-%s zoned block device:\n",
>  				(dev->zoned_model == F2FS_ZONED_HA) ?
>  					"aware" : "managed");
> -		MSG(0, "      %u zones, %u randomly writeable zones\n",
> -				dev->nr_zones, dev->nr_rnd_zones);
> +		MSG(0, "      %u zones, %lu zone size(bytes), %u randomly writeable zones\n",
> +				dev->nr_zones, dev->zone_size,
> +				dev->nr_rnd_zones);
>  		MSG(0, "      %lu blocks per zone\n",
>  				dev->zone_blocks);
>  	}
> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> index ce73b9a..48a23c0 100644
> --- a/lib/libf2fs_zoned.c
> +++ b/lib/libf2fs_zoned.c
> @@ -146,40 +146,50 @@ int f2fs_get_zoned_model(int i)
>  	return 0;
>  }
>  
> -int f2fs_get_zone_blocks(int i)
> +uint32_t f2fs_get_zone_chunk_sectors(struct device_info *dev)
>  {
> -	struct device_info *dev = c.devices + i;
> -	uint64_t sectors;
> +	uint32_t sectors;
>  	char str[PATH_MAX];
>  	FILE *file;
>  	int res;
>  
> -	/* Get zone size */
> -	dev->zone_blocks = 0;
> -
>  	res = get_sysfs_path(dev, "queue/chunk_sectors", str, sizeof(str));
>  	if (res != 0) {
>  		MSG(0, "\tError: Failed to get device sysfs attribute path\n");
> -		return -1;
> +		return 0;
>  	}
>  
>  	file = fopen(str, "r");
>  	if (!file)
> -		return -1;
> +		return 0;
>  
>  	memset(str, 0, sizeof(str));
>  	res = fscanf(file, "%s", str);
>  	fclose(file);
>  
>  	if (res != 1)
> -		return -1;
> +		return 0;
>  
> -	sectors = atol(str);
> +	sectors = atoi(str);
> +
> +	return sectors;
> +}
> +
> +int f2fs_get_zone_blocks(int i)
> +{
> +	struct device_info *dev = c.devices + i;
> +	uint64_t sectors;
> +
> +	/* Get zone size */
> +	dev->zone_blocks = 0;
> +
> +	sectors = f2fs_get_zone_chunk_sectors(dev);
>  	if (!sectors)
>  		return -1;
>  
> -	dev->zone_blocks = sectors >> (F2FS_BLKSIZE_BITS - 9);
> -	sectors = (sectors << 9) / c.sector_size;
> +	dev->zone_size = sectors << SECTOR_SHIFT;
> +	dev->zone_blocks = sectors >> (F2FS_BLKSIZE_BITS - SECTOR_SHIFT);
> +	sectors = dev->zone_size / c.sector_size;
>  
>  	/*
>  	 * Total number of zones: there may
> -- 
> 2.25.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
