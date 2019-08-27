Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874E9DB8F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2019 04:13:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2QzZ-0000U2-O7; Tue, 27 Aug 2019 02:13:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i2QzY-0000Tv-2H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 02:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XU/WhXPB44pNRsXAG1DOqpxvXVp02ZphKQJrEhW7PxI=; b=IP1T2o5EIGzrlHr2uuB4J7sjDS
 wekHMILKfPai83fjzPmdBRPFN7l2uCpD3QIaKLwOOByOXyuWn39CxywwNAQm1JTvoaayztxcH+1Lg
 J8Xd01/kzl77eErtxIZHHTtc7R/HAgEVx33bVGlx0LtvIvEw25MY8SWTl1PRMlBErbD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XU/WhXPB44pNRsXAG1DOqpxvXVp02ZphKQJrEhW7PxI=; b=P6y/o9gc2YJqDlOjzGdK9Yo4zD
 NlMX60OJPRYBy2H8PrtQVdCaybzDuUz9CY6z51w1ZZgVIRDjqIyn9BaXnM9FTfP0FOC0rbAkp8Y6G
 IMH9RaYKXDR6duBfVtq+NsoJGYqxrV0zn8TW1AC4YAtOtOAtMq0o/dhPX+HUdepYmlxY=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2QzV-00H0oL-NH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 02:13:52 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4DF6BB4F48847288C162;
 Tue, 27 Aug 2019 10:13:41 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 27 Aug
 2019 10:13:37 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <20190821044802.29702-4-shinichiro.kawasaki@wdc.com>
 <930cac20-bd40-9516-2eae-68754b685f72@huawei.com>
Message-ID: <74e04591-c5b8-f52d-3b47-8616bca977c4@huawei.com>
Date: Tue, 27 Aug 2019 10:13:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <930cac20-bd40-9516-2eae-68754b685f72@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i2QzV-00H0oL-NH
Subject: Re: [f2fs-dev] [PATCH v2 3/4] fsck.f2fs: Check write pointer
 consistency with current segments
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

On 2019/8/27 10:01, Chao Yu wrote:
> On 2019/8/21 12:48, Shin'ichiro Kawasaki wrote:
>> On sudden f2fs shutdown, zoned block device status and f2fs current
>> segment positions in meta data can be inconsistent. When f2fs shutdown
>> happens before write operations completes, write pointers of zoned block
>> devices can go further but f2fs meta data keeps current segments at
>> positions before the write operations. After remounting the f2fs, the
>> inconsistency causes write operations not at write pointers and
>> "Unaligned write command" error is reported. This error was observed when
>> xfstests test case generic/388 was run with f2fs on a zoned block device.
>>
>> To avoid the error, have f2fs.fsck check consistency between each current
>> segment's position and the write pointer of the zone the current segment
>> points to. If the write pointer goes advance from the current segment,
>> fix the current segment position setting at same as the write pointer
>> position. In case the write pointer is behind the current segment, write
>> zero data at the write pointer position to make write pointer position at
>> same as the current segment.
>>
>> When inconsistencies are found, turn on c.bug_on flag in fsck_verify() to
>> ask users to fix them or not. When inconsistencies get fixed, turn on
>> 'force' flag in fsck_verify() to enforce fixes in following checks. This
>> position fix is done at the beginning of do_fsck() function so that other
>> checks reflect the current segment modification.
>>
>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>> ---
>>  fsck/fsck.c | 133 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  fsck/fsck.h |   3 ++
>>  fsck/main.c |   2 +
>>  3 files changed, 138 insertions(+)
>>
>> diff --git a/fsck/fsck.c b/fsck/fsck.c
>> index 8953ca1..21a06ac 100644
>> --- a/fsck/fsck.c
>> +++ b/fsck/fsck.c
>> @@ -2574,6 +2574,125 @@ out:
>>  	return cnt;
>>  }
>>  
>> +struct write_pointer_check_data {
>> +	struct f2fs_sb_info *sbi;
>> +	struct device_info *dev;
>> +};
>> +
>> +#define SECTOR_SHIFT 9
>> +
>> +static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
>> +{
>> +	struct write_pointer_check_data *wpd = opaque;
>> +	struct f2fs_sb_info *sbi = wpd->sbi;
>> +	struct device_info *dev = wpd->dev;
>> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
>> +	block_t zone_block, wp_block, wp_blkoff, cs_block, b;
>> +	unsigned int zone_segno, wp_segno;
>> +	struct seg_entry *se;
>> +	struct curseg_info *cs;
>> +	int cs_index, ret;
>> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
>> +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
>> +	void *zero_blk;
>> +
>> +	if (blk_zone_conv(blkz))
>> +		return 0;
>> +
>> +	zone_block = dev->start_blkaddr
>> +		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
>> +	zone_segno = GET_SEGNO(sbi, zone_block);
>> +	wp_block = dev->start_blkaddr
>> +		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
>> +	wp_segno = GET_SEGNO(sbi, wp_block);
>> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
>> +
>> +	/* find the curseg which points to the zone */
>> +	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
>> +		cs = &SM_I(sbi)->curseg_array[cs_index];
>> +		if (zone_segno <= cs->segno &&
>> +		    cs->segno < zone_segno + segs_per_zone)
>> +			break;
>> +	}
> 
> Will this happen?
> 
> - write checkpoint
> - curseg points zone A
> - write large number of data
> - curseg points zone B, write pointer > 0
> - sudden power cut, curseg will be reset to zone A
> 
> zone B's write pointer won't be verified due to curseg points to zone A?

IIUC, we are trying fix such condition in a separated PATCH 4/4.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
