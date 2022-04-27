Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D35127B4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 01:47:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njrNW-0002t7-5j; Wed, 27 Apr 2022 23:47:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=109e08c9c=damien.lemoal@opensource.wdc.com>)
 id 1njrNV-0002t1-Fo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 23:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PnDK63gcXNRgV//CCqerJpeFWxiM6q0NYD5whOcQOd0=; b=fJPvK4dmF+SX8DY4vDzHKRHgOs
 lStCHVyteeDJDIWRf/q1955JRpAR7nM8NOFN1TIIrW652llh1Qe6rG5gJeyTWZQkuOIH3nfFKULVZ
 W6JtUqjzvgw2FvZq7v7tPWLI/V3qvAnjllLeewDf8yNDIfhfChZ84Sym/qfOeEHRAH5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PnDK63gcXNRgV//CCqerJpeFWxiM6q0NYD5whOcQOd0=; b=mGXFXTQbrbxfvdsoZFNCM8ZGl8
 E80DY2s7BF4k39HKgXwGqfYrgeDDVE+6YY7b/FaCzzsAX2QsdI56snuTP1SXKWZeUHIXpXvpRTczu
 gI/NLKQtq6cwPuieq9QFx5CDuzgXaBAeRmP70IfjvyB71ojr9E7q6SGMe6NsnbGQxVEE=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njrNS-00CBEZ-H5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 23:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651103241; x=1682639241;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gLrzp6duhkPkV6taMyjQM6C7cL2l+fGNVwimG4CXPYA=;
 b=LH8fH8ERnjWjO0RlKQZPEOlzDqUlbLdkzNIAWEbI8QfBvrorLVKiQnki
 kD/aKnt1oK3XAxBKU1nDdzPwbCBiDBT+S1GU8z/ouoSMcXx4+l/3/veKn
 2njd0U5kSkG9xmNnL4Rxh9FGmMpHxtfvA8AdLS2+RhcL9TPtIEsUIZfx6
 gCYQXNwWC6vZ8hNikZdju92XdnnLqK+7aiVzqxVLmGm01rFZ4tBmKj1r1
 JOO0AcFUI6ukmV+5yIUmoGjurG2nAteMgSzfVoYkMk3TXxkMpUx3SQ8gb
 oqwoD28MHP0yEBRr9pR5SRc7OEC+fxNpDvX0MnRc4VQe80/yHYN6dC8LK Q==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="203872706"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:31:40 +0800
IronPort-SDR: /31Xmchl7gZFg8potWYmkm09e6QwU97PO8MVjrrkuow7tBlxpaJNmxUHby4QzfsNzt/GEK68K+
 IKieKy6pMWawGiYo7CQuGHN9KE7904uIarHzVLe+rsuB9+aow4hkhW5UdnSJp2fWRK1Pce09TB
 UfKOOY5emIz0MQmfrY6i5fBnvS78gKWtELmqsfxhwJaN0wA9mj1NPXA5M95W/a6hy2Ou/YVw7Y
 oRcl4grMZBZgFFyjgxcH95b9xNn0KVPolMnaDHZ8D7RI4JaQkWxchyBbyDmQ292r5m3YPFxrrr
 yVnGMvrGcJ64aDTsWnmvVmRM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:02:33 -0700
IronPort-SDR: Dgc2Rmr8LepAnKUJzvPUVLBhuqURkXsjeSMxSqxFVcr0jLScB23+tIybT+EXSGv5ra2jTAg2W6
 jbkIBVnJejeJEPC/elOuJFaRdpcpE62ki0z5v7FmXlOPz8haaBMpnxbJm54FT4y7C/GZ35A+nP
 sGqR6Lu7LYc/0JS/jUDTXTTIWcrFNWelS2iw5kGz8VlHJbDUr5hyTJQYq7w+RLQ6f1mnohWswP
 QjMNyusyqaFEZwqz4/HXplK8KWxRDcNx4n2/LSXSiUsAun1gqwbFRP0kteEq4XQqieh+I8EdkS
 vJs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:31:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZlJ73Zzz1SHwl
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:31:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1651102299; x=1653694300; bh=gLrzp6duhkPkV6taMyjQM6C7cL2l+fGNVwi
 mG4CXPYA=; b=PdTQSxxj3EOLpYEGcnBYVKUPguXiBCCpr5ymI7+k28TTGz3mfSs
 KbvC8k3lhS5m6XprU6x/phnhFmDH5Zdpl9mtNhPvxWLwoLZA79RJ39tzK0T66DJg
 cQ1J9s5aD6mTMKCIx7SKO/H0j3TVPipsOior8762yACFqgZPSPwSaryNVkrWfY9P
 vFK6Qn1Dlh6ebNdzrLYEPjfHxjH1TIuA8nWpktFuNYhAu/AUjrulRyzZmZH+ftr1
 f82lyX/KB3APT/Gb/yPBy31svE2vEO1vB1f3Yyd5uBMXra+42NUkawZ+Cd66ga7/
 bklmIOigH4dlDMngOOGM9ReZ0ePeHAN6LGA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id W5I0xALrVRbk
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:31:39 -0700 (PDT)
Received: from [10.225.163.27] (unknown [10.225.163.27])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZlB5PzJz1Rvlc;
 Wed, 27 Apr 2022 16:31:34 -0700 (PDT)
Message-ID: <652c33b5-1d85-e356-05b9-7bd84b768143@opensource.wdc.com>
Date: Thu, 28 Apr 2022 08:31:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Pankaj Raghav <p.raghav@samsung.com>, jaegeuk@kernel.org,
 axboe@kernel.dk, snitzer@kernel.org, hch@lst.de, mcgrof@kernel.org,
 naohiro.aota@wdc.com, sagi@grimberg.me, dsterba@suse.com,
 johannes.thumshirn@wdc.com
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160259eucas1p25aab0637fec229cd1140e6aa08678f38@eucas1p2.samsung.com>
 <20220427160255.300418-4-p.raghav@samsung.com>
Organization: Western Digital Research
In-Reply-To: <20220427160255.300418-4-p.raghav@samsung.com>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/28/22 01:02, Pankaj Raghav wrote: > Many places in the
 filesystem for zoned devices open code this function > to find the zone number
 for a given sector with power of 2 assumption. > This generic [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.141 listed in list.dnswl.org]
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
X-Headers-End: 1njrNS-00CBEZ-H5
Subject: Re: [f2fs-dev] [PATCH 03/16] block: add bdev_zone_no helper
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
Cc: jiangbo.365@bytedance.com, kch@nvidia.com, bvanassche@acm.org,
 matias.bjorling@wdc.com, gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/28/22 01:02, Pankaj Raghav wrote:
> Many places in the filesystem for zoned devices open code this function
> to find the zone number for a given sector with power of 2 assumption.
> This generic helper can be used to calculate zone number for a given
> sector in a block device
> 
> This helper internally uses blk_queue_zone_no to find the zone number.
> 
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  include/linux/blkdev.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index f8f2d2998afb..55293e0a8702 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1392,6 +1392,15 @@ static inline bool bdev_zone_aligned(struct block_device *bdev, sector_t sec)
>  	return false;
>  }
>  
> +static inline unsigned int bdev_zone_no(struct block_device *bdev, sector_t sec)
> +{
> +	struct request_queue *q = bdev_get_queue(bdev);
> +
> +	if (q)

q is never NULL. So this can be simplified to:

	return blk_queue_zone_no(bdev_get_queue(bdev), sector);

> +		return blk_queue_zone_no(q, sec);
> +	return 0;
> +}
> +
>  static inline unsigned int bdev_max_open_zones(struct block_device *bdev)
>  {
>  	struct request_queue *q = bdev_get_queue(bdev);


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
