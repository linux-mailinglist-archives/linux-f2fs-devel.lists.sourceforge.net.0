Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE257515246
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 19:32:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkUTj-0007kz-Qn; Fri, 29 Apr 2022 17:32:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <a.manzanares@samsung.com>) id 1nkUTi-0007kl-4h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 17:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CV3ILaM36wPkqi/7uv6GbDScjcp+QLdybCrf3oHF4/8=; b=j2nP61Ol/GVengvJKndxz5Et+3
 UOy8+WPuB27dlJ7dHHGWvCdfrAS38OXbQ6nCWDQI4Mw4XQOAdkF21kxBD3PwvwFTWi5zl9iU4BbeC
 WTFmgavPF7E+Cd4iggYXW/CrPka3g3uUM2vZEX7C+szz7I6+Ah1ihU8b7964p3474aBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type
 :In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CV3ILaM36wPkqi/7uv6GbDScjcp+QLdybCrf3oHF4/8=; b=KLGSo/0v/iRYp/xaKddtufGoQN
 lBeN+/v9kyonyI1wNF6gUc8NbhUgT/1KP0be7k45sx6M23cK26qb9N8WoqC8bXR1IdAJ7ZF7aOTLO
 gQ2+nbmmH9BwE16YEVMs8dN3f2utIb6GNRdhSi3JYCY/7p+FqRruwKOEOt/a/afILsV0=;
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkUTe-0007G2-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 17:32:25 +0000
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20220429172356usoutp0242676b86c3c639e383c7b829b91b1a80~qbeNobwUC3254732547usoutp02I;
 Fri, 29 Apr 2022 17:23:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20220429172356usoutp0242676b86c3c639e383c7b829b91b1a80~qbeNobwUC3254732547usoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651253036;
 bh=CV3ILaM36wPkqi/7uv6GbDScjcp+QLdybCrf3oHF4/8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=OyDGWkA+q6Lv2j8SsWasu+qyRerfQq9/CjwF8DNivnz0FsplGCg8dr9FdDcXpWZlU
 ZyjHK/jNzE6ptXgi6y6I4rdE23Q1MMN5oT54CBnpxkATfW8WExYjxDbkOhuWuLaOc1
 R5qa5K4vStBOC/eXtm29IHyQTXfrGfb/7//15/IY=
Received: from ussmges2new.samsung.com (u111.gpu85.samsung.co.kr
 [203.254.195.111]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220429172356uscas1p1802f8556352f80b43292a97d1692d426~qbeNXtUlU0334603346uscas1p1d;
 Fri, 29 Apr 2022 17:23:56 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges2new.samsung.com (USCPEMTA) with SMTP id 32.01.09642.C2F1C626; Fri,
 29 Apr 2022 13:23:56 -0400 (EDT)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220429172356uscas1p240abbeaccf4d0771ef01c5ada56a19e3~qbeM3iOF-0529505295uscas1p2J;
 Fri, 29 Apr 2022 17:23:56 +0000 (GMT)
X-AuditID: cbfec36f-c15ff700000025aa-51-626c1f2c1d50
Received: from SSI-EX3.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id 27.63.09672.B2F1C626; Fri,
 29 Apr 2022 13:23:55 -0400 (EDT)
Received: from SSI-EX3.ssi.samsung.com (105.128.2.228) by
 SSI-EX3.ssi.samsung.com (105.128.2.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.7; Fri, 29 Apr 2022 10:23:54 -0700
Received: from SSI-EX3.ssi.samsung.com ([105.128.5.228]) by
 SSI-EX3.ssi.samsung.com ([105.128.5.228]) with mapi id 15.01.2375.007; Fri,
 29 Apr 2022 10:23:54 -0700
From: Adam Manzanares <a.manzanares@samsung.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Thread-Topic: [PATCH 05/16] nvme: zns: Allow ZNS drives that have
 non-power_of_2 zone size
Thread-Index: AQHYWlBIk1palC1aiUOJGb6L5A1HwK0HnIUA
Date: Fri, 29 Apr 2022 17:23:54 +0000
Message-ID: <20220429172354.GB174938@bgt-140510-bm01>
In-Reply-To: <20220427160255.300418-6-p.raghav@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-ID: <0AED4CE52B42814A9FAE9FC027D992A6@ssi.samsung.com>
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTZxTGfe+9vS2V4qWivILZYiPGDIeAEN9MZYYZdydZZtTFOWewzisQ
 vlxLlZFtwpQJFaVlIlpIgMqKIIzRGsYoX3ZRPhS7Wb7sKKwBtmlni3RMAamjvV3Cf7/znOc9
 5znJy8OFHWQQLyktg5GkiVNEJJ9oujtjfHPT6ynHwqub16KG3rs4umkpJNGVqVkc3Svuw1BR
 4VUumu8z4qjNXspBv7zIwVDNzTsYmmhQ4aigc4pAC/LRRe2cFUcvrRGoyDAI0OSACkNt5lD0
 cPwGFz1Uv4ta23oIZGopI1G5ZpKLFN/M4GhYMQmQskvHQd/bHATqNgfvDKZN/XG0q7uOpJVn
 7VzaONpI0KY+Ga2tzSfpyuxinNZVnaH1FU6M1j/KJumLZ+0k/VPuGId2tA+QdMOtAYJW6Bo5
 tFP72l7/j/nbjzMpSacYyeaYo/xEZ0cHeTJPmGn86xWWDRx+cuDDg1QULD+n5bhZSNUA2Fwf
 wXIuBkdf+MoBz+MZN8aycj2ATdUfygF/kZ8B+HLcQrCFBsCFHAfmdpFUOJzvasTdHEBthH/0
 6zw6TsmXQ0txlJtXUodhi7mHYD2fwDxjDpflSKh8YPcwQYXAttL7wM0CKhr+quvy6D7UNtjZ
 0+mZD6jV8HlvnXd+IDRPlGPsYf5QXdqKs7waulqsJMvr4Njzx1zWvwlW6KdJlmNgtfI375xQ
 qKm04exef9hzbYJg366Bt28Mew6GVCMf2ooM3sYuOPvdde+CYLhg0WCs6TyAU4p2DlsoABx5
 Out1bYOu/EGuAqxXLUmuWpJKtSSVakkq1ZJUFYBTCwJlUmlqAiONTGNOh0nFqVJZWkLYp+mp
 WrD4x++5fk5vBkPmZ2EGgPGAAUAeLgoQ/KNPPCYUHBd/nsVI0uMlshRGagDBPEIUKNAk/SAW
 UgniDCaZYU4ykv+7GM8nKBs7ku9fZ1hzpLL/In6BGJsUhx9cue9P9aPpkbnLm8Xvnfki85Lz
 zq5Dxq1rL+deubBqbzcMWRYz6LexfcQS/FXXzgb74+ZXJfv/7YrmqvNqtzTFzvU6f5+PW1FQ
 tX7+x/iS3lVYxvXobzWz04R1676ZHXtuJw9de7p96LDfnrxiq2C5LC5EWVQY8/bX8qNz99dZ
 dyyz5p7wDfItjyJLbOonOZlRfwuSw+yuA6ovq/TDNuKj/fHqwfoC26kM4XnqtCUyQKwNkF16
 cvAtOis20/SB6sFQbE2yZMv7xhPvrBB260yjCVeVDsvuuVtlWbk9fQma3Z9VNJiJ1mF+pCjU
 0XRoQ5lJNC4ipIniiDdwiVT8H0iZu1FSBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGd+69vb10Q6+1yBmYmTVpJDIYdjpOnLrG/bGbzMV9GON0hlW5
 ATIo2FrEuWwFBkHU0HaDaWVSEUsVsNK6OGwZteKgfFg+DWszGOPDARlQ0LmmiqPcLel/v+d9
 n/d5zh+HwoUjvBgqQ3GMVSrkmWJSQGRoMF1C/IbMw0nf9iQjS8cvOKr7rYxEFfMBHHWWd2NI
 X3aOj4LdHhw1z17goZ5/8jF0te4ehsYtBhydcc4T6Fnp8PLsm1EcPR3djPSuBwBNDBow1OyN
 R31jZj7qq34XOZrdBOq/XUmiKtMEH2mLH+NoSDsBkK7NxkPXZ+YI1O6NlcUy/QPvMUvt9SSj
 K5zlM57hRoLp71Yz1munSOaSphxnbDVfM3bjIsbYf9WQzNnCWZJpKhrhMXM/D5KM5eYgwWht
 jTxm0frKB2sOCLanspkZuazy9Z2fCdIXW1rInBJhnufP55gGzK0qBRQF6S1wzLOrFAgoIV0H
 oL7HQnLCvyymz/E4YQLQXF1ClIIIiqSTYLCtEQ+xiI6DkwM2LGTC6ZIX4eNADQgt1tIH4W2v
 m+BMn8Ibnoc8jqVQd3+WH2KClsDmC10r/kh6K+y1tfG5tpbl6uLnKw0R9FvQ6XauMKDXwScd
 9ViIcToaeserVhjSNKxxeHCOo+DU2BKP41fhyJMpPud/DRrtCyTHO2GtzvdfTjw0XZrBuUes
 ge7z4wR3+zK8Yx4itAAawuoMYVGGsChDWJQhLMoIeNdAtFqlykrLU0kV7PFElTxLpVakJR7J
 zrKC5T/YuXT34E/A5/UnugBGAReAFC4WRT6ypx8WRqbKT3zBKrNTlOpMVuUCsRQhjo6cOqBL
 EdJp8mPs5yybwyr/32JURIwG++SdbQ5qj3Ra/3G0uz4orZc5G4qijM/evjJwZc9RUtKVtdGY
 m2D66HhS9WiRSJLyZfDDk/slrdP915Mkf63vncw48sJWWtflo/7Ye2v13kczvt3Br6R5zD7g
 x8t/7zuvu7ixcr521TDG+MH3MaJJscKtudje2posAumOs7IbTZd9MvOmHdr3tQHBfV+cMqH7
 9Bm8trDgRKAkkP/U70yNKhPGqX+syH3z711rC6iF9SmHGnaYUzsocb7jbq3kh3UmfqDC+PCy
 +w19J7oH8dhTM7Imi73SYJVu0C4Ub7GuLtjGPkgbasP2C9tv9R6dCLqYqu2OnOzkk6e/M042
 vHRHTKjS5Zs34UqV/F9M6jft8gMAAA==
X-CMS-MailID: 20220429172356uscas1p240abbeaccf4d0771ef01c5ada56a19e3
CMS-TYPE: 301P
X-CMS-RootMailID: 20220427160301eucas1p147d0dced70946e20dd2dd046b94b8224
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160301eucas1p147d0dced70946e20dd2dd046b94b8224@eucas1p1.samsung.com>
 <20220427160255.300418-6-p.raghav@samsung.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 27, 2022 at 06:02:44PM +0200,
 Pankaj Raghav wrote:
 > Remove the condition which disallows non-power_of_2 zone size ZNS drive
 > to be updated and use generic method to calculate number of z [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [211.189.100.12 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [211.189.100.12 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nkUTe-0007G2-Rz
Subject: Re: [f2fs-dev] [PATCH 05/16] nvme: zns: Allow ZNS drives that have
 non-power_of_2 zone size
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
Cc: "jiangbo.365@bytedance.com" <jiangbo.365@bytedance.com>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "clm@fb.com" <clm@fb.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "hch@lst.de" <hch@lst.de>, "agk@redhat.com" <agk@redhat.com>,
 "naohiro.aota@wdc.com" <naohiro.aota@wdc.com>,
 "sagi@grimberg.me" <sagi@grimberg.me>,
 "gost.dev@samsung.com" <gost.dev@samsung.com>,
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
 "jonathan.derrick@linux.dev" <jonathan.derrick@linux.dev>,
 "kch@nvidia.com" <kch@nvidia.com>, "snitzer@kernel.org" <snitzer@kernel.org>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "dsterba@suse.com" <dsterba@suse.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "matias.bjorling@wdc.com" <matias.bjorling@wdc.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "johannes.thumshirn@wdc.com" <johannes.thumshirn@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 27, 2022 at 06:02:44PM +0200, Pankaj Raghav wrote:
> Remove the condition which disallows non-power_of_2 zone size ZNS drive
> to be updated and use generic method to calculate number of zones
> instead of relying on log and shift based calculation on zone size.
> 
> The power_of_2 calculation has been replaced directly with generic
> calculation without special handling. Both modified functions are not
> used in hot paths, they are only used during initialization &
> revalidation of the ZNS device.
> 
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  drivers/nvme/host/zns.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/nvme/host/zns.c b/drivers/nvme/host/zns.c
> index 9f81beb4df4e..2087de0768ee 100644
> --- a/drivers/nvme/host/zns.c
> +++ b/drivers/nvme/host/zns.c
> @@ -101,13 +101,6 @@ int nvme_update_zone_info(struct nvme_ns *ns, unsigned lbaf)
>  	}
>  
>  	ns->zsze = nvme_lba_to_sect(ns, le64_to_cpu(id->lbafe[lbaf].zsze));
> -	if (!is_power_of_2(ns->zsze)) {
> -		dev_warn(ns->ctrl->device,
> -			"invalid zone size:%llu for namespace:%u\n",
> -			ns->zsze, ns->head->ns_id);
> -		status = -ENODEV;
> -		goto free_data;
> -	}
>  
>  	blk_queue_set_zoned(ns->disk, BLK_ZONED_HM);
>  	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
> @@ -129,7 +122,7 @@ static void *nvme_zns_alloc_report_buffer(struct nvme_ns *ns,
>  				   sizeof(struct nvme_zone_descriptor);
>  
>  	nr_zones = min_t(unsigned int, nr_zones,
> -			 get_capacity(ns->disk) >> ilog2(ns->zsze));
> +			 div64_u64(get_capacity(ns->disk), ns->zsze));
>  
>  	bufsize = sizeof(struct nvme_zone_report) +
>  		nr_zones * sizeof(struct nvme_zone_descriptor);
> @@ -197,7 +190,7 @@ int nvme_ns_report_zones(struct nvme_ns *ns, sector_t sector,
>  	c.zmr.zrasf = NVME_ZRASF_ZONE_REPORT_ALL;
>  	c.zmr.pr = NVME_REPORT_ZONE_PARTIAL;
>  
> -	sector &= ~(ns->zsze - 1);
> +	sector = rounddown(sector, ns->zsze);
>  	while (zone_idx < nr_zones && sector < get_capacity(ns->disk)) {
>  		memset(report, 0, buflen);
>  
> -- 
> 2.25.1
>


Looks good.

Reviewed by: Adam Manzanares <a.manzanares@samsung.com>

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
