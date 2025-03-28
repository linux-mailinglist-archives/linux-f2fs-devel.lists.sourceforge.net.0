Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A87FA742E2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Mar 2025 05:02:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ty0v2-00064u-Me;
	Fri, 28 Mar 2025 04:02:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ty0v0-00064V-2E
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 04:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=meNTuDOm77WXh+TWJld9v7p++jYX7ofWEiLY0g70qw8=; b=P9IBmiZyIZw8E+bPW75qL66NZZ
 /C9puxFzFh0p/ricUwzzse0NVBE7Jo7Y7U+FisElyXurSbsM4wH6+F6ut37zDsqQzEMeBWntPc4Un
 QazwJGO5oGA43v8o0A3fRHPODOH+ZW/XX7CozeqoIbTn+vaSqcQmw49T6x6BqUp/imWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=meNTuDOm77WXh+TWJld9v7p++jYX7ofWEiLY0g70qw8=; b=YLiyxu47M7zAjWXSNq4/DdSUqx
 Ntbx5cg5GqgQixWzP6ZOcqhU1NtEiuC0jn91hCvnAPVuYI0NTMW7jhfrUn+9aJWDN4IHeAfcEOEm2
 i9eBUAa/ISjfdhAxYd7cmzODm97EzS/Nnnodhom+S2ldlrMso9SSX5gIvAbQSiM4zWRo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ty0uu-0005RQ-8c for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Mar 2025 04:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8AA42A40C5B;
 Fri, 28 Mar 2025 03:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12283C4CEE4;
 Fri, 28 Mar 2025 04:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743134514;
 bh=w90q3sFqjQA3RWiP4nHNvxeG0Jc3YX8vT72tYtw+/x0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Uh/EZpqrSnzdubj1x3L/JVpfJ2tGSj/PNTQO6r+EWYO42maYSUrpicwvu0zPKjbZn
 1oMKPNKjBeJzRZi7bn6cCMac6mFu+469mdmwKWF6/KEo1XxT+hjwfbTbzpHQHKzDx9
 rC5ZfeJSMLVIRYDFoLR6U48+19+HIpro+kdm028IlFK5XiYSS741uVchwUigm1TjR3
 Hlo6JeAlAcTpeq/dIoOYE44YqrUFupJxDw69JR7f4bXxokI96qPZ7EcbFHaQmtQVOT
 pd2yLag3MHoiGKzoaLYxfZ10gRpOfIveVVX20GQSmhDsWtP1ZNZyA+oBb2RSEJhbhI
 F2gs+26yI9s2w==
Message-ID: <07b34613-abe0-49f9-9530-503558088fb5@kernel.org>
Date: Fri, 28 Mar 2025 12:02:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250325080646.3291947-1-chao@kernel.org>
 <Z-YXqKOIgYCpfuL0@google.com>
Content-Language: en-US
In-Reply-To: <Z-YXqKOIgYCpfuL0@google.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/3/28 11:29, Jaegeuk Kim wrote: > It seems this patch
 breaks the multi-partition cases. Let me take a look. Thanks, 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ty0uu-0005RQ-8c
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: zone: fix to calculate
 first_zoned_segno correctly
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/3/28 11:29, Jaegeuk Kim wrote:
> It seems this patch breaks the multi-partition cases.

Let me take a look.

Thanks,

> 
> On 03/25, Chao Yu wrote:
>> A zoned device can has both conventional zones and sequential zones,
>> so we should not treat first segment of zoned device as first_zoned_segno,
>> instead, we need to check zone type for each zone during traversing zoned
>> device to find first_zoned_segno.
>>
>> Otherwise, for below case, first_zoned_segno will be 0, which could be
>> wrong.
>>
>> create_null_blk 512 2 1024 1024
>> mkfs.f2fs -m /dev/nullb0
>>
>> Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
>> Cc: Daeho Jeong <daehojeong@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - traverse w/ zone unit in get_first_zoned_segno()
>>   fs/f2fs/f2fs.h    | 18 +++++++++++++-----
>>   fs/f2fs/segment.c |  2 +-
>>   fs/f2fs/super.c   | 37 +++++++++++++++++++++++++++++++++----
>>   3 files changed, 47 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index ca884e39a5ff..3dea037faa55 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4630,12 +4630,16 @@ F2FS_FEATURE_FUNCS(readonly, RO);
>>   F2FS_FEATURE_FUNCS(device_alias, DEVICE_ALIAS);
>>   
>>   #ifdef CONFIG_BLK_DEV_ZONED
>> -static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
>> -				    block_t blkaddr)
>> +static inline bool f2fs_zone_is_seq(struct f2fs_sb_info *sbi, int devi,
>> +							unsigned int zone)
>>   {
>> -	unsigned int zno = blkaddr / sbi->blocks_per_blkz;
>> +	return test_bit(zone, FDEV(devi).blkz_seq);
>> +}
>>   
>> -	return test_bit(zno, FDEV(devi).blkz_seq);
>> +static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
>> +								block_t blkaddr)
>> +{
>> +	return f2fs_zone_is_seq(sbi, devi, blkaddr / sbi->blocks_per_blkz);
>>   }
>>   #endif
>>   
>> @@ -4711,9 +4715,13 @@ static inline bool f2fs_valid_pinned_area(struct f2fs_sb_info *sbi,
>>   					  block_t blkaddr)
>>   {
>>   	if (f2fs_sb_has_blkzoned(sbi)) {
>> +#ifdef CONFIG_BLK_DEV_ZONED
>>   		int devi = f2fs_target_device_index(sbi, blkaddr);
>>   
>> -		return !bdev_is_zoned(FDEV(devi).bdev);
>> +		return !f2fs_blkz_is_seq(sbi, devi, blkaddr);
>> +#else
>> +		return true;
>> +#endif
>>   	}
>>   	return true;
>>   }
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 396ef71f41e3..dc360b4b0569 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -3311,7 +3311,7 @@ int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi)
>>   
>>   	if (f2fs_sb_has_blkzoned(sbi) && err == -EAGAIN && gc_required) {
>>   		f2fs_down_write(&sbi->gc_lock);
>> -		err = f2fs_gc_range(sbi, 0, GET_SEGNO(sbi, FDEV(0).end_blk),
>> +		err = f2fs_gc_range(sbi, 0, sbi->first_zoned_segno - 1,
>>   				true, ZONED_PIN_SEC_REQUIRED_COUNT);
>>   		f2fs_up_write(&sbi->gc_lock);
>>   
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 011925ee54f8..9a42a1323f42 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -4307,12 +4307,33 @@ static void f2fs_record_error_work(struct work_struct *work)
>>   
>>   static inline unsigned int get_first_zoned_segno(struct f2fs_sb_info *sbi)
>>   {
>> +#ifdef CONFIG_BLK_DEV_ZONED
>> +	unsigned int zoneno, total_zones;
>>   	int devi;
>>   
>> -	for (devi = 0; devi < sbi->s_ndevs; devi++)
>> -		if (bdev_is_zoned(FDEV(devi).bdev))
>> -			return GET_SEGNO(sbi, FDEV(devi).start_blk);
>> -	return 0;
>> +	if (!f2fs_sb_has_blkzoned(sbi))
>> +		return NULL_SEGNO;
>> +
>> +	for (devi = 0; devi < sbi->s_ndevs; devi++) {
>> +		if (!bdev_is_zoned(FDEV(devi).bdev))
>> +			continue;
>> +
>> +		total_zones = GET_ZONE_FROM_SEG(sbi, FDEV(devi).total_segments);
>> +
>> +		for (zoneno = 0; zoneno < total_zones; zoneno++) {
>> +			unsigned int segs, blks;
>> +
>> +			if (!f2fs_zone_is_seq(sbi, devi, zoneno))
>> +				continue;
>> +
>> +			segs = GET_SEG_FROM_SEC(sbi,
>> +					zoneno * sbi->secs_per_zone);
>> +			blks = SEGS_TO_BLKS(sbi, segs);
>> +			return GET_SEGNO(sbi, FDEV(devi).start_blk + blks);
>> +		}
>> +	}
>> +#endif
>> +	return NULL_SEGNO;
>>   }
>>   
>>   static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>> @@ -4349,6 +4370,14 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>>   #endif
>>   
>>   	for (i = 0; i < max_devices; i++) {
>> +		if (max_devices == 1) {
>> +			FDEV(i).total_segments =
>> +				le32_to_cpu(raw_super->segment_count_main);
>> +			FDEV(i).start_blk = 0;
>> +			FDEV(i).end_blk = FDEV(i).total_segments *
>> +						BLKS_PER_SEG(sbi);
>> +		}
>> +
>>   		if (i == 0)
>>   			FDEV(0).bdev_file = sbi->sb->s_bdev_file;
>>   		else if (!RDEV(i).path[0])
>> -- 
>> 2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
