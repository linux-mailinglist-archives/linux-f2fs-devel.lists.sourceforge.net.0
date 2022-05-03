Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB3518A4E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 18:43:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlvcp-00064A-5O; Tue, 03 May 2022 16:43:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=115360949=damien.lemoal@opensource.wdc.com>)
 id 1nlvch-00063d-RU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 16:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C000H/nQUTQfaHct5PNkMTjj4hJBbSe2TpfUD4UNZWA=; b=CBlT/IKq/5U3/YNK5cBkKSqjdo
 PUNsyCLugVBOjbZYZcMLtsZwdjRx1fUNk53MCHzPRtTrjpLjz2Jv6vBe5mdb5vUdiEKvlnhgTvoVE
 Mhyxv6IwLSb14JPMCJS+OM7r2xwSO6A5zRn/bvC5uHY+dWfbVVyI9YTJFKM84ivX3ItA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C000H/nQUTQfaHct5PNkMTjj4hJBbSe2TpfUD4UNZWA=; b=J20BiFkzlmThqOgvRz/sjuBnw6
 bcT8JrKGXVyImjHrb+eyT/B85AOAU1JTes3C00nBudYqTsibiDb+L/Q6Z4exaC0Euf/Y2QmyitnR8
 Diem/4pg6rnuyGuisLD++jvTYKaGfesM9rp/e+UhikoMj1mPMTzgFMhJ4teFlFmxJTiI=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nlvce-0003nD-8d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 16:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651596216; x=1683132216;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gtowxbHk/V4v64RtsKyaAcMJzf5VQm5Xqlz1mGZPWVc=;
 b=OQyVFvS7kRLrdXrKp9wcfG0ZBi3F1AtlB+bjt/eQtF/n8+ddiWEx8JUG
 EdQqiWKo69dce/tbmWjlfwxf8f9Qw0um3qbF1vVw0O4ibn6jtLFud7Fvc
 lMUehUbBBKjq6s+BpnRcSypRQKKr4bTiVdx/zxmaYeaUY9oDTuu4eOFja
 VizsqT65xp/ehyv3p5Y/jTOVj6LXPJYi8kvKe7e9+mgm/4S0EArjetRVV
 FUl8JgDRd8SriE9lD8AxJHP4A7Zyb9cb61gYTUupkWnZ3yIpfFVXIdLU3
 wa6kMFdUxu2recSJudXRgb5CP89OMHu5dMcmKAZDDpzqcMqmE/2Yc42Np w==;
X-IronPort-AV: E=Sophos;i="5.91,195,1647273600"; d="scan'208";a="311410589"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2022 00:43:24 +0800
IronPort-SDR: gHcKGjLCdsJEomMM7WZdXycUGUREqwt1YnFOsghxpUaDDg8XEs8c0ybK/+hG1izsklCu8wQNaA
 VpscuMQqpUlJLg2Xr71uzH/MPV5vKaeDyGmcMAg4lZAB40Z0jI2fRCU0HlPgW7kk1LS+BiIuP0
 30B/M5JXLVXSfT36VR/5i6a5+SEzpFmWUXAH+Kc5ThSiRWYiDedo29/2kOm4uDtiLjMx+VA24I
 aCipNd9KqfGxzj1a9mTPbQvxJbcbU1eOSuRf1XDf8Oq1aLy9uzC9Pm6cXS8uCwsa3XLqhdpZGY
 ZzzFTHM8bDNuh2qeHpo+pCjY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 09:13:27 -0700
IronPort-SDR: Nb8ot53o6CytEvJiTVqJpEj0Nbkfxt2FCnc0r3dG8IzwqIUp0Nrb4FV1iDrir7RTvZO2/lL6u2
 8IRxOZm8NDm5B3fOuo6L26FeCtk7a3lIXtIwGzF0i9F3guKlbgudAmCqeONvN8oaTXt+HjYkTm
 GYwno5c3C7KSPTQ8CQPhuvkgv04cxbyjy0TJPwCHTNcqP9lks6w1o+78STPro9zeJzb8WlN0pz
 USbFH5cEBQo+yR/leAQDFlCOhABJYXFZF1fZlcMFrDaZziZZ7eSBz2Vc+tO+hL8YOIMDHvGFoJ
 ymU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 09:43:25 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kt5PS2yhWz1SVp6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 09:43:24 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1651596202; x=1654188203; bh=gtowxbHk/V4v64RtsKyaAcMJzf5VQm5Xqlz
 1mGZPWVc=; b=Ityt6SU6TevwYDEz6MSmerOiufvkNZb2RIhnCnh/ZzJetTfhCg1
 T2xnTAstXa6+Ux9X2hffUZ60DlE6LuATHx09TQlSTEyF7xbXDspT5fE2m7o1saXk
 MsfXOxTR1OWaHqY/5UwRsV92T41rLy/lvWZXfBA8RCgHqYpGkO7HkepzxgPEd0IS
 4TRsTkM5OD6EvKA9wrLXkqM2gLGZOlrZHM78kWu3x6V0E18uYRfRzzagItYzWXSW
 JSBcD3u1LzWPwvIazUKiZH8E9Nd04PQVh3LjktI2Mbdf2b5RDfBKfwP7DQmDJsGE
 VucI8+dA13DJavMELzscR9PAFibWA0na59Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bvqFMnp3Px72
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 09:43:22 -0700 (PDT)
Received: from [10.225.81.200] (hq6rw33.ad.shared [10.225.81.200])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kt5PN0Cqnz1Rvlc;
 Tue,  3 May 2022 09:43:19 -0700 (PDT)
Message-ID: <2c275ab0-c813-22ae-16e3-b16885d06c4c@opensource.wdc.com>
Date: Wed, 4 May 2022 01:43:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, Pankaj Raghav
 <p.raghav@samsung.com>, jaegeuk@kernel.org, axboe@kernel.dk,
 snitzer@kernel.org, hch@lst.de, mcgrof@kernel.org, naohiro.aota@wdc.com,
 sagi@grimberg.me, dsterba@suse.com, johannes.thumshirn@wdc.com
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160257eucas1p21fb58d0129376a135fdf0b9c2fe88895@eucas1p2.samsung.com>
 <20220427160255.300418-2-p.raghav@samsung.com>
 <3a178153-62c0-e298-ccb0-0edfd41b7ee2@acm.org>
Organization: Western Digital Research
In-Reply-To: <3a178153-62c0-e298-ccb0-0edfd41b7ee2@acm.org>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/05/04 1:37, Bart Van Assche wrote: > On 4/27/22 09:02,
 Pankaj Raghav wrote: >> Adapt blkdev_nr_zones and blk_queue_zone_no function
 so that it can >> also work for non-power-of-2 zone sizes. > [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.141.245 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nlvce-0003nD-8d
Subject: Re: [f2fs-dev] [PATCH 01/16] block: make blkdev_nr_zones and
 blk_queue_zone_no generic for npo2 zsze
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: jiangbo.365@bytedance.com, kch@nvidia.com, matias.bjorling@wdc.com,
 gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/05/04 1:37, Bart Van Assche wrote:
> On 4/27/22 09:02, Pankaj Raghav wrote:
>> Adapt blkdev_nr_zones and blk_queue_zone_no function so that it can
>> also work for non-power-of-2 zone sizes.
>>
>> As the existing deployments of zoned devices had power-of-2
>> assumption, power-of-2 optimized calculation is kept for those devices.
>>
>> There are no direct hot paths modified and the changes just
>> introduce one new branch per call.
>>
>> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
>> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
>> ---
>>   block/blk-zoned.c      | 8 +++++++-
>>   include/linux/blkdev.h | 8 +++++++-
>>   2 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
>> index 38cd840d8838..1dff4a8bd51d 100644
>> --- a/block/blk-zoned.c
>> +++ b/block/blk-zoned.c
>> @@ -117,10 +117,16 @@ EXPORT_SYMBOL_GPL(__blk_req_zone_write_unlock);
>>   unsigned int blkdev_nr_zones(struct gendisk *disk)
>>   {
>>   	sector_t zone_sectors = blk_queue_zone_sectors(disk->queue);
>> +	sector_t capacity = get_capacity(disk);
>>   
>>   	if (!blk_queue_is_zoned(disk->queue))
>>   		return 0;
>> -	return (get_capacity(disk) + zone_sectors - 1) >> ilog2(zone_sectors);
>> +
>> +	if (is_power_of_2(zone_sectors))
>> +		return (capacity + zone_sectors - 1) >>
>> +		       ilog2(zone_sectors);
>> +
>> +	return div64_u64(capacity + zone_sectors - 1, zone_sectors);
>>   }
>>   EXPORT_SYMBOL_GPL(blkdev_nr_zones);
> 
> Does anyone need support for more than 4 billion sectors per zone? If 
> not, do_div() should be sufficient.
> 
>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
>> index 60d016138997..c4e4c7071b7b 100644
>> --- a/include/linux/blkdev.h
>> +++ b/include/linux/blkdev.h
>> @@ -665,9 +665,15 @@ static inline unsigned int blk_queue_nr_zones(struct request_queue *q)
>>   static inline unsigned int blk_queue_zone_no(struct request_queue *q,
>>   					     sector_t sector)
>>   {
>> +	sector_t zone_sectors = blk_queue_zone_sectors(q);
>> +
>>   	if (!blk_queue_is_zoned(q))
>>   		return 0;
>> -	return sector >> ilog2(q->limits.chunk_sectors);
>> +
>> +	if (is_power_of_2(zone_sectors))
>> +		return sector >> ilog2(zone_sectors);
>> +
>> +	return div64_u64(sector, zone_sectors);
>>   }
> 
> Same comment here.

sector_t is 64-bits even on 32-bits arch, no ?
so div64_u64 is needed here I think, which will be a simple regular division for
64-bit arch.

> 
> Thanks,
> 
> Bart.


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
