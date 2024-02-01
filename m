Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90874845A8C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Feb 2024 15:47:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVYLw-0003qK-Un;
	Thu, 01 Feb 2024 14:47:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rVYLv-0003qE-Da
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 14:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wdcckxsrGzrgiVOuKJTZS1FR1STvC7Oq3bui1NJuRRQ=; b=dznmv09UeanAoonOA7Zzz12E01
 g8rQfPL88Y5wZc3qwI53yS3cZYbn7dhuwNllOjZzE8m6hO7rJl7v6iml4EVFG6Na0HoaWF2TdbH6r
 dGNXqw6ZRkJWP3s6vNJUYhnVtWkmu8Do2wVt/uAb2ZxrdeLzwIK9KOOoy62D+3JEdeS4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wdcckxsrGzrgiVOuKJTZS1FR1STvC7Oq3bui1NJuRRQ=; b=X9iX92VgGu47aDFuz12nb+bgHp
 VZZS3iRQ8tQV4+LwYONlZHqs17G1QyjR7BFog8mGK5tFP1E39xwRLkedqWGvIjMrodSP/bnE1pw+2
 W0ozwDRro9zbGY2Ak5TXHDKSitAtml4WEEMI/rX4k1aAxEZPWMg2F5HkHBn6ezh3zmW8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVYLt-0005OQ-To for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 14:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B33961F15;
 Thu,  1 Feb 2024 14:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9B2C433F1;
 Thu,  1 Feb 2024 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706798856;
 bh=KOwktgRBOL5LPRTXgqMo5naSY2ysGXJWFoq824L8CNY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p94StRRdD6j0IzK2hZZA6DKmFtQQsi49xwPc2oQHwqX9Bzy8e6m99rkXo6QfIC2la
 uOrSGPA/l9APxjUKjRWMVz26fIvoar6bxeg26ZaUFGcQCsxhKw8LqVoyVub6wbuwye
 ASWEPgva0F3e8rrQJSBe6cHZM3NxFGP+0Hz9jDp2m3UgMjF4RpGPNMrylj2fBGkogR
 TISJEKMNMAyFvuAVWYpf0df6HLyMTtLVzqRv+E5tPn/upUGU9VXqiSVpdiDX6vNCGs
 VXDPvvtXdsZiJtO+0U/EcYg/quZbFuKyk6kOjIlY0JQZIIepO6zDY4GVe4V1PScOCD
 wJ828R0pQCIvQ==
Message-ID: <6e91f64a-638c-465d-8fb2-ed70231db23a@kernel.org>
Date: Thu, 1 Feb 2024 22:47:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng1@oppo.com>, Wenjie Qi <qwjhust@gmail.com>,
 hustqwj@hust.edu.cn
References: <20240123081258.700-1-qwjhust@gmail.com>
 <cedb4875-5795-4789-a010-a9c66fa61707@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <cedb4875-5795-4789-a010-a9c66fa61707@oppo.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/23 17:18, Yongpeng Yang wrote: > Hi Wenjie, > It
 seems more reasonable to use bdev_max_open_zones instead of >
 bdev_max_active_zones.
 Hi all, I guess it needs to be initialized w/ bdev_max_open_zones(), due
 to the max of open zones of zoned device limits the number of zones that a
 host software can simultaneously write [1], right? 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 URIBL_SBL_A Contains URL's A record listed in the Spamhaus SBL
 blocklist [URIs: zonedstorage.io]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rVYLt-0005OQ-To
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix zoned block device information
 initialization
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/1/23 17:18, Yongpeng Yang wrote:
> Hi Wenjie,
> It seems more reasonable to use bdev_max_open_zones instead of
> bdev_max_active_zones.

Hi all,

I guess it needs to be initialized w/ bdev_max_open_zones(), due
to the max of open zones of zoned device limits the number of
zones that a host software can simultaneously write [1], right?

[1] https://zonedstorage.io/docs/introduction/zoned-storage#active-zones-limit

Thanks,

> 
> If an NVMe device has multiple namespaces, and the device contains a
> total of 11 open zones, two of the namespaces, nvme0n1 and nvme0n2, each
> correspond to an instance of the F2FS filesystem, and both filesystem
> instances can be initialized successfully. Since multiple namespaces
> share all open zones, the number of open zones is not equal to the
> number of open zones available to F2FS in a multi-namespace scenario.
> This patch does not yet cover this scenario.
> 
> On 1/23/2024 4:12 PM, Wenjie Qi wrote:
>> If the max active zones of zoned devices are less than
>> the active logs of F2FS, the device may error due to
>> insufficient zone resources when multiple active logs are
>> being written at the same time. If this value is 0, there is no limit.
>>
>> Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
>> ---
>>    fs/f2fs/f2fs.h  |  1 +
>>    fs/f2fs/super.c | 18 ++++++++++++++++++
>>    2 files changed, 19 insertions(+)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 65294e3b0bef..669f84f6b0e5 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -1551,6 +1551,7 @@ struct f2fs_sb_info {
>>    
>>    #ifdef CONFIG_BLK_DEV_ZONED
>>    	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
>> +	unsigned int max_active_zones;		/* max zone resources of the zoned device */
>>    #endif
>>    
>>    	/* for node-related operations */
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 206d03c82d96..aef41b54098c 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -2385,6 +2385,16 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>>    	if (err)
>>    		goto restore_opts;
>>    
>> +#ifdef CONFIG_BLK_DEV_ZONED
>> +	if (sbi->max_active_zones && sbi->max_active_zones < F2FS_OPTION(sbi).active_logs) {
>> +		f2fs_err(sbi,
>> +			"zoned: max active zones %u is too small, need at least %u active zones",
>> +				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
>> +		err = -EINVAL;
>> +		goto restore_opts;
>> +	}
>> +#endif
>> +
>>    	/* flush outstanding errors before changing fs state */
>>    	flush_work(&sbi->s_error_work);
>>    
>> @@ -3932,6 +3942,14 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>>    	if (!f2fs_sb_has_blkzoned(sbi))
>>    		return 0;
>>    
>> +	sbi->max_active_zones = bdev_max_active_zones(bdev);
>> +	if (sbi->max_active_zones && sbi->max_active_zones < F2FS_OPTION(sbi).active_logs) {
>> +		f2fs_err(sbi,
>> +			"zoned: max active zones %u is too small, need at least %u active zones",
>> +				 sbi->max_active_zones, F2FS_OPTION(sbi).active_logs);
>> +		return -EINVAL;
>> +	}
>> +
>>    	zone_sectors = bdev_zone_sectors(bdev);
>>    	if (!is_power_of_2(zone_sectors)) {
>>    		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
