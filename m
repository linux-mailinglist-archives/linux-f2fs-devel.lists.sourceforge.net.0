Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D5012AA75
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Dec 2019 07:05:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ikMH5-0001xk-Si; Thu, 26 Dec 2019 06:05:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuehaibing@huawei.com>) id 1ikMH4-0001xd-9O
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 06:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:CC:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5bNvhZ1NFlc2+pdq31M8McZzsWfBM1ggrbGpNXzL8As=; b=Ps1XASOzkgQD4LCFZYRo0XVou3
 09/0b/p81acFMbqk7TZXx8F7q+Lxe1hvTcUQXup+4+bScjSn2hyhmRHRortFkfytaPyiGvIb8tlme
 7j2x5gPBwKOYIeBLeKzFat59Khixg9pmJ3izFKFn3nva6DCNbXWoIDxcCzdwJ1lukLRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:CC:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5bNvhZ1NFlc2+pdq31M8McZzsWfBM1ggrbGpNXzL8As=; b=iGtHid1JVZG8+HO7NXO8xTBn8y
 k0uR3XuF3o0weZ9ooa+aMFcS25tnUg3LqCKM5vEEbHoqQ9CpaLYY0zMa5zphMq2CKXoxZyULu2gv8
 V14jY3AM4l/WUoOAn47yUDXZivFZSVQMF3odOqt89IjzZE2KltE/Z5rHQBxc83hnhDy4=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ikMH1-00E5HV-V3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 06:05:30 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 04C1E5E571A4F74DE764;
 Thu, 26 Dec 2019 14:05:21 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 26 Dec 2019 14:05:12 +0800
To: Chao Yu <yuchao0@huawei.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20191224124359.15040-1-yuehaibing@huawei.com>
 <673efe18-d528-2e9b-6d44-a6a7a22086f3@huawei.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <62ce1981-9061-f798-a65d-9599ceceb4b8@huawei.com>
Date: Thu, 26 Dec 2019 14:05:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <673efe18-d528-2e9b-6d44-a6a7a22086f3@huawei.com>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ikMH1-00E5HV-V3
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove set but not used variable
 'cs_block'
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/12/26 11:44, Chao Yu wrote:
> On 2019/12/24 20:43, YueHaibing wrote:
>> fs/f2fs/segment.c: In function fix_curseg_write_pointer:
>> fs/f2fs/segment.c:4485:35: warning: variable cs_block set but not used [-Wunused-but-set-variable]
>>
>> It is never used since commit 362d8a920384 ("f2fs: Check
>> write pointer consistency of open zones") , so remove it.
> 
> Thanks for the fix!
> 
> Do you mind merging this patch to original patch? as it's still
> pending in dev branch.

It's ok for me.

> 
> Thanks,
> 
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  fs/f2fs/segment.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index a951953..72cf257 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -4482,14 +4482,13 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
>>  	struct f2fs_dev_info *zbd;
>>  	struct blk_zone zone;
>>  	unsigned int cs_section, wp_segno, wp_blkoff, wp_sector_off;
>> -	block_t cs_zone_block, wp_block, cs_block;
>> +	block_t cs_zone_block, wp_block;
>>  	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
>>  	sector_t zone_sector;
>>  	int err;
>>  
>>  	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
>>  	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
>> -	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
>>  
>>  	zbd = get_target_zoned_dev(sbi, cs_zone_block);
>>  	if (!zbd)
>>
> 
> .
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
