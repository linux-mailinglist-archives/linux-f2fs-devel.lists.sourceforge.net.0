Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0F5A1D62
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2019 16:42:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3Ld4-00081W-2W; Thu, 29 Aug 2019 14:42:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i3Ld2-00081K-4J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 14:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vuSfEhUefs0f08l3VT4fWqnUjtyv5A5h5crW5/ur70I=; b=SRoYnAOgzjzsqs9oe39IkDebgo
 cU7G/KaVIVtY3i/ITIJZuzQVlb18C194iQMj4FTgsNLizb3mUUhKhLBok0C7LIxyfbIKCkc3noyTB
 Q4R2eNtKAlKYBNp/mgS8+5YRqYEyJs79j8Jt0qqWEAMe0tw9UF/g3y/ZTXgDDi7hqkSc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vuSfEhUefs0f08l3VT4fWqnUjtyv5A5h5crW5/ur70I=; b=OQE1PvfkASChUVd51swbLvth9o
 q0XGWjKcEiCPJQ9WtiN2wGOKnKN445Ba3Uhj82grnWMvFyJeRP0yxbrKJ9epS81PSdqaFCV3PbpY4
 cgGWC/Xq8i0T62k1NE6IsqqfLrznx8znenI2N61YCWldMqWZn/VZZ/XX4EF95QY/yfQY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3Ld0-002w8f-LG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 14:42:24 +0000
Received: from [192.168.0.110] (unknown [180.111.100.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FD99233FF;
 Thu, 29 Aug 2019 14:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567089735;
 bh=rGyAEi95FPkEEEMBtLmOrR/gRcRBBQZf3snLjF79F7U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Om2shGHvxLMqjdJ4pHXS1EmRPNe6CP9SrFf6qxfsewNJZ8lsRhvNvcW5n+efJT/vp
 /dgUAcw0x1AtLFZhJL2iaphpBngd0MD0ybAYpdwrIwWh0rhhjZJB7y/waAmeVr4lDk
 Z6A9/Fv0agGMtSvv3+EqYPhI3GnabN2N20bd5/Bs=
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Chao Yu <yuchao0@huawei.com>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <20190821044802.29702-5-shinichiro.kawasaki@wdc.com>
 <fd7b8699-3335-1f7e-96de-0818dd014278@huawei.com>
 <20190828115333.ciivgtdmdprjxgaa@shindev.dhcp.fujisawa.hgst.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b7be8727-ff87-7dd8-eb1f-89c0f9247213@kernel.org>
Date: Thu, 29 Aug 2019 22:42:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190828115333.ciivgtdmdprjxgaa@shindev.dhcp.fujisawa.hgst.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i3Ld0-002w8f-LG
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-8-28 19:53, Shinichiro Kawasaki wrote:
> On Aug 27, 2019 / 10:25, Chao Yu wrote:
>> On 2019/8/21 12:48, Shin'ichiro Kawasaki wrote:
>>> When sudden f2fs shutdown happens on zoned block devices, write
>>> pointers can be inconsistent with valid blocks counts in meta data.
>>> The failure scenario is as follows:
>>>
>>> - Just before a sudden shutdown, a new segment in a new zone is selected
>>>   for a current segment. Write commands were executed to the segment.
>>>   and the zone has a write pointer not at zone start.
>>> - Before the write commands complete, shutdown happens. Meta data is
>>>   not updated and still keeps zero valid blocks count for the zone.
>>> - After next mount of the file system, the zone is selected for the next
>>>   write target because it has zero valid blocks count. However, it has
>>>   the write pointer not at zone start. Then "Unaligned write command"
>>>   error happens.
>>>
>>> To avoid this potential error path, reset write pointers if the zone
>>> does not have a current segment, the write pointer is not at the zone
>>> start and the zone has no valid blocks.
>>>
>>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>>> ---
>>>  fsck/fsck.c | 30 +++++++++++++++++++++++++++++-
>>>  1 file changed, 29 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/fsck/fsck.c b/fsck/fsck.c
>>> index 21a06ac..cc9bbc0 100644
>>> --- a/fsck/fsck.c
>>> +++ b/fsck/fsck.c
>>> @@ -2595,6 +2595,7 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
>>>  	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
>>>  	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
>>>  	void *zero_blk;
>>> +	block_t	zone_valid_blocks = 0;
>>>  
>>>  	if (blk_zone_conv(blkz))
>>>  		return 0;
>>> @@ -2615,8 +2616,35 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
>>>  			break;
>>>  	}
>>>  
>>> -	if (cs_index >= NR_CURSEG_TYPE)
>>> +	if (cs_index >= NR_CURSEG_TYPE) {
>>> +		for (b = zone_block; b < zone_block + c.zone_blocks &&
>>> +			     IS_VALID_BLK_ADDR(sbi, b); b += c.blks_per_seg) {
>>> +			se = get_seg_entry(sbi, GET_SEGNO(sbi, b));
>>> +			zone_valid_blocks += se->valid_blocks;
>>> +		}
>>> +		if (wp_block == zone_block || zone_valid_blocks)
>>> +			return 0;
>>> +
>>> +		/*
>>> +		 * The write pointer is not at zone start but there is no valid
>>> +		 * block in the zone. Segments in the zone can be selected for
>>> +		 * next write. Need to reset the write pointer to avoid
>>> +		 * unaligned write command error.
>>
>> In SPOR (sudden power-off recovery) of kernel side, we may revalidate blocks
>> belong to fsynced file in such zone within range of [0, write pointer], if we
>> just reset zone, will we lose those data for ever?
> 
> Yes. This patch resets zone and the data will be lost. I walked through
> fs/f2fs/recovery.c and learned that nodes with fsync mark are recovered at
> remount. Such fsync recovery cannot be done after zone reset. To avoid the
> data loss, I would like to drop this fourth patch at this moment.
> 
> Later on, I will consider safer approach not to reset the zone, but to set next
> write target block at the write pointer. I guess this approach will need kernel
> side patch to change block selection logic.

I guess below commit can help to recognize fsynced data in unclean umounted
image, maybe we can skip invalidating those data during zone write pointer recovery.

f2fs-tools: fix to skip block allocation for fsynced data

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=a50cfc89e56ce8c022e295bf4de619af070fabe9

> 
>>
>> BTW, how you think enabling f2fs kernel module to recover incorrect write
>> pointer of zone? Once f2fs-tools doesn't upgrade, however kernel does...
> 
> Current f2fs allows to mount zoned block devices even when they have
> inconsistency with f2fs meta data. This is not good. Then I believe kernel side
> needs the feature to check write pointer inconsistency at mount time and fix it.
> 
> As you indicate, fix by kernel is more handy than notice to run fsck, especially
> when users do not have latest f2fs-tools. Still fix by fsck is needed when users
> use the kernel without the fix feature. I think both approaches are required:
> fix by kernel and fix by fsck.

Agreed, let's try to fix in both side.

Thanks,

> 
> --
> Best Regards,
> Shin'ichiro Kawasaki
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
