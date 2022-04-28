Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A4513DCD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 23:44:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkBw4-0003Wa-CN; Thu, 28 Apr 2022 21:44:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=1105c06d5=damien.lemoal@opensource.wdc.com>)
 id 1nkBvz-0003WT-9A
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 21:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5V99+plMhQNgsXvKWxOmrgupGvKlMjvlNB0+vQlQDc=; b=QR+flo5jRv6N1S20Rr+0jlhjou
 v70OuIS/n7Fnzb7S6GObjqmbH/kJCwFR8Y2QfXfSpbjeEkN+tBdlBNBxHOxQC6KWH7KtAgMHcLR02
 F3AJXzunSZjIB7adegF6TE8LrZP3yCCzvVEYZ3sRS8nKLj0YvYyrrYBGiTWlt8hs6bbs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V5V99+plMhQNgsXvKWxOmrgupGvKlMjvlNB0+vQlQDc=; b=id5/OxdIiTu5Y2FXut8NAstR6B
 y4reucJPCPHcZqp5jHk7YLeJd7SSwwMIjhxxB0vAKf0LL+wXyhkXFzAIV3mW7Ty7haexB5dBuvw1b
 Mq40ddmFDM5lTH2gedQYIxGYdjwpq78BDaaGhFEVT4otIVwgFjfi3Lav87FsVYyg4mkw=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkBvu-00DA0Z-4s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 21:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651182258; x=1682718258;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m/acreNIl2rWYjlVezvJCF1GJU64s3Qgnn+Km+O6eew=;
 b=MsVBGv09vvNde67i9cyAgXokuXkXLlb1xq/gYV3+YVa0jDsvN3M6FMqS
 IHrC5XVLaQ45bbb1ui/VYEbZ+hffpqJMfsdnnxImdVHPW5AEO8LrvtaOO
 5g5oVvZCaPYi98b29KIJUJbXD6EB/Q1gsq/CE1cguiW5BeaFzQZm1sGJf
 a0hejWK8gfwQEvHiUnh/cBWFV7T3UUG97Bz4u4jSHzlxSWAWXaQisYnRt
 eaIDZozqDP8CoMCGUEBH4Aize9Jtl4blr9s0WKVSvEWNQetfMHqryk9t1
 pIckZvNuLTRXWwKxZ5rdCptsv20dlX2zvsuOsU6isCLApS+GSR3uls0Zn A==;
X-IronPort-AV: E=Sophos;i="5.91,296,1647273600"; d="scan'208";a="197940449"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 05:44:06 +0800
IronPort-SDR: 5aN3CW6oHJz82SdAR9451/Atm38Csrjwp+MSzU8RCRuB4w51JKSqIFXbK5eqPyGHkrVeDMJvjC
 ijyjdPDSkfawFWkF9SienNs73NXq2kS8Wt6K3W5PeJn2z9m+9Kz/z5fdams4A24gqh5qF3hM1x
 4wW2WGv61ocWXl7EW0Y9/iomFAgvYQS3V8L6QbTmkKuYcxY/ia1DpEQ8OuuuePctkwT93W6wrc
 FCYdpL49k5RHDyuwyb89syvpwN0BSo4iVqLyQI3P+HeuNmMe27c3w1O2vp2jZuiq67W3z8MEyn
 nhopSd0DxXlPtbKfev05eOOr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 14:14:57 -0700
IronPort-SDR: 6bEfqaLtYECM9hEhG7UVAB5ddHtMLKleBwaIIvgMw8adXzW751gu2wf97kGL878M+8XUlbmnGI
 HXzGCzH8ZGK2ZfAUKMJIGjRly8VHNG6MfySBeZLBOUdHwuaDQOCJwUc5AiMju5TgraL2Hc9XnX
 7xf+0sFpjkDgaf5I899FUq31eGnjqYkr/Y4e7GNwSfrjJorZdJnPFWNwlLdRWq8AumFRg+ARzm
 88xBgI4B7poEMe0kt3chKcunlUBD2wD6LnPSmP+CMcS72nL0fJcvYPG/BvG+gZdRsiEcAcPa0c
 /FI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 14:44:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kq8Jk32sYz1SVp2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 14:44:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1651182245; x=1653774246; bh=m/acreNIl2rWYjlVezvJCF1GJU64s3Qgnn+
 Km+O6eew=; b=P7Z2ssSysU3MXGjLqOpjIgw3LkMvOLPFsZ5/L/hy8zTXh7RRhg5
 oW7hJpKY5xehv6PCj5aAjux8iBygbEnlV6pT61szKcFi3rCbccmLZRC1mYDrsL9w
 5JjAtxFSVU6nXK85++NGprWHqgYwmhFNOvKCxx/jlLeOdAbLXCvijl/CpAN9syTf
 uL0rhmb3+rt+C1w/CE2rhsYUt7mNpL5EBJi00FmBRkg8jYpAkhDP+NtofLGylSHU
 IdqnZobibaJqdqpH2JChH3JY23wQeJdMZHT5/1cFVjlUHop8+7zb5n39efSFkKX2
 cNB3p+K+aur3vqxw7TEWidzO8wXpFiJo6QQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Wxp7cAwK7ZC6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 14:44:05 -0700 (PDT)
Received: from [10.225.163.27] (unknown [10.225.163.27])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kq8Jb59qtz1Rvlc;
 Thu, 28 Apr 2022 14:43:59 -0700 (PDT)
Message-ID: <ce56cb7d-f184-aad1-4935-5f622e7afe5d@opensource.wdc.com>
Date: Fri, 29 Apr 2022 06:43:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Luis Chamberlain <mcgrof@kernel.org>
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160313eucas1p1feecf74ec15c8c3d9250444710fd1676@eucas1p1.samsung.com>
 <20220427160255.300418-17-p.raghav@samsung.com>
 <2ffc46c7-945f-ba26-90db-737fccd74fdf@opensource.wdc.com>
 <YmrQFu9EbMmrL2Ys@bombadil.infradead.org>
Organization: Western Digital Research
In-Reply-To: <YmrQFu9EbMmrL2Ys@bombadil.infradead.org>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/29/22 02:34, Luis Chamberlain wrote: > On Thu, Apr 28, 
 2022 at 08:42:41AM +0900, Damien Le Moal wrote: >> On 4/28/22 01:02, Pankaj
 Raghav wrote: >>> From: Luis Chamberlain <mcgrof@kernel.org> >>> [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.154.42 listed in list.dnswl.org]
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
X-Headers-End: 1nkBvu-00DA0Z-4s
Subject: Re: [f2fs-dev] [PATCH 16/16] dm-zoned: ensure only power of 2 zone
 sizes are allowed
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
Cc: jiangbo.365@bytedance.com, linux-nvme@lists.infradead.org, clm@fb.com,
 dm-devel@redhat.com, hch@lst.de, agk@redhat.com, naohiro.aota@wdc.com,
 sagi@grimberg.me, gost.dev@samsung.com, jonathan.derrick@linux.dev,
 Pankaj Raghav <p.raghav@samsung.com>, kch@nvidia.com, snitzer@kernel.org,
 josef@toxicpanda.com, linux-block@vger.kernel.org, dsterba@suse.com,
 kbusch@kernel.org, jaegeuk@kernel.org, matias.bjorling@wdc.com,
 bvanassche@acm.org, axboe@kernel.dk, johannes.thumshirn@wdc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/29/22 02:34, Luis Chamberlain wrote:
> On Thu, Apr 28, 2022 at 08:42:41AM +0900, Damien Le Moal wrote:
>> On 4/28/22 01:02, Pankaj Raghav wrote:
>>> From: Luis Chamberlain <mcgrof@kernel.org>
>>>
>>> Today dm-zoned relies on the assumption that you have a zone size
>>> with a power of 2. Even though the block layer today enforces this
>>> requirement, these devices do exist and so provide a stop-gap measure
>>> to ensure these devices cannot be used by mistake
>>>
>>> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
>>> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
>>> ---
>>>  drivers/md/dm-zone.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/md/dm-zone.c b/drivers/md/dm-zone.c
>>> index 57daa86c19cf..221e0aa0f1a7 100644
>>> --- a/drivers/md/dm-zone.c
>>> +++ b/drivers/md/dm-zone.c
>>> @@ -231,6 +231,18 @@ static int dm_revalidate_zones(struct mapped_device *md, struct dm_table *t)
>>>  	struct request_queue *q = md->queue;
>>>  	unsigned int noio_flag;
>>>  	int ret;
>>> +	struct block_device *bdev = md->disk->part0;
>>> +	sector_t zone_sectors;
>>> +	char bname[BDEVNAME_SIZE];
>>> +
>>> +	zone_sectors = bdev_zone_sectors(bdev);
>>> +
>>> +	if (!is_power_of_2(zone_sectors)) {
>>> +		DMWARN("%s: %s only power of two zone size supported\n",
>>> +		       dm_device_name(md),
>>> +		       bdevname(bdev, bname));
>>> +		return 1;
>>> +	}
>>
>> Why ?
>>
>> See my previous email about still allowing ZC < ZS for non power of 2 zone
>> size drives. dm-zoned can easily support non power of 2 zone size as long
>> as ZC == ZS for all zones.
> 
> Great, thanks for the heads up.
> 
>> The problem with dm-zoned is ZC < ZS *AND* potentially variable ZC per
>> zone. That cannot be supported easily (still not impossible, but
>> definitely a lot more complex).
> 
> I see thanks.
> 
> Testing would still be required to ensure this all works well with npo2.
> So I'd prefer to do that as a separate effort, even if it is easy. So
> for now I think it makes sense to avoid this as this is not yet well
> tested.
> 
> As with filesystem support, we've even have gotten hints that support
> for npo2 should be easy, but without proper testing it would not be
> prudent to enable support for users yet.
> 
> One step at a time.

Yes, in general, I agree. But in this case, that will create kernel
versions that end up having partial support for zoned drives. Not ideal to
say the least. So if the patches are not that big, I would rather like to
see everything go into a single release.

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
