Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB49DB9D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2019 04:25:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2RAm-0001Nv-4E; Tue, 27 Aug 2019 02:25:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i2RAk-0001Nf-Hn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 02:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e+O4MEliiO0CC1vmG8oEVl8u/bolvc9xxUTw2of9r2A=; b=KK0vaGFvZRVF8OSkl1Qr7aTcZW
 C/lypvxSVGJWFUuqtNwP1diwVRO7AihEsPG19cO+XA1yy3UMenqagy0t5bGxPfeCMIcrNtgQ2fXY+
 C0gES1k8MqtlqRtoYhj8ul1ahDDAgWgRj21P+xELqqGj+xOq+LyafSrA9oHdgRcsAwr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e+O4MEliiO0CC1vmG8oEVl8u/bolvc9xxUTw2of9r2A=; b=ml7UPegRTHAqYqESkiTwaIPuwm
 jLuJfO6uhRqEwkmW0HaQ5rw4bubX7BEmrRAZKOllRgq+c3Gts7qLP53ucwCR0SwhhXuIFaubMn19B
 RG8lFHQNwifbVvABRzlvNiFNVX4faIHdmQBcr6urjkj/qDdsxT1K0qn823omVtnnZZLY=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2RAi-00H1XC-Pj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 02:25:26 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EB19C115B6DF7F979545;
 Tue, 27 Aug 2019 10:25:16 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 27 Aug
 2019 10:25:12 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <20190821044802.29702-5-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fd7b8699-3335-1f7e-96de-0818dd014278@huawei.com>
Date: Tue, 27 Aug 2019 10:25:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190821044802.29702-5-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i2RAi-00H1XC-Pj
Subject: Re: [f2fs-dev] [PATCH v2 4/4] fsck.f2fs: Check write pointer
 consistency with valid blocks count
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

On 2019/8/21 12:48, Shin'ichiro Kawasaki wrote:
> When sudden f2fs shutdown happens on zoned block devices, write
> pointers can be inconsistent with valid blocks counts in meta data.
> The failure scenario is as follows:
> 
> - Just before a sudden shutdown, a new segment in a new zone is selected
>   for a current segment. Write commands were executed to the segment.
>   and the zone has a write pointer not at zone start.
> - Before the write commands complete, shutdown happens. Meta data is
>   not updated and still keeps zero valid blocks count for the zone.
> - After next mount of the file system, the zone is selected for the next
>   write target because it has zero valid blocks count. However, it has
>   the write pointer not at zone start. Then "Unaligned write command"
>   error happens.
> 
> To avoid this potential error path, reset write pointers if the zone
> does not have a current segment, the write pointer is not at the zone
> start and the zone has no valid blocks.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  fsck/fsck.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 21a06ac..cc9bbc0 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2595,6 +2595,7 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
>  	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
>  	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
>  	void *zero_blk;
> +	block_t	zone_valid_blocks = 0;
>  
>  	if (blk_zone_conv(blkz))
>  		return 0;
> @@ -2615,8 +2616,35 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
>  			break;
>  	}
>  
> -	if (cs_index >= NR_CURSEG_TYPE)
> +	if (cs_index >= NR_CURSEG_TYPE) {
> +		for (b = zone_block; b < zone_block + c.zone_blocks &&
> +			     IS_VALID_BLK_ADDR(sbi, b); b += c.blks_per_seg) {
> +			se = get_seg_entry(sbi, GET_SEGNO(sbi, b));
> +			zone_valid_blocks += se->valid_blocks;
> +		}
> +		if (wp_block == zone_block || zone_valid_blocks)
> +			return 0;
> +
> +		/*
> +		 * The write pointer is not at zone start but there is no valid
> +		 * block in the zone. Segments in the zone can be selected for
> +		 * next write. Need to reset the write pointer to avoid
> +		 * unaligned write command error.

In SPOR (sudden power-off recovery) of kernel side, we may revalidate blocks
belong to fsynced file in such zone within range of [0, write pointer], if we
just reset zone, will we lose those data for ever?

BTW, how you think enabling f2fs kernel module to recover incorrect write
pointer of zone? Once f2fs-tools doesn't upgrade, however kernel does...

Thanks,

> +		 */
> +		if (c.fix_on) {
> +			FIX_MSG("Reset write pointer at segment 0x%x",
> +				zone_segno);
> +			ret = f2fs_reset_zone(dev, blkz);
> +			if (ret)
> +				return ret;
> +			fsck->chk.wp_fixed_zones++;
> +		} else {
> +			MSG(0, "Inconsistent write pointer at segment 0x%x\n",
> +			    zone_segno);
> +			fsck->chk.wp_inconsistent_zones++;
> +		}
>  		return 0;
> +	}
>  
>  	/* check write pointer consistency with the curseg in the zone */
>  	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
