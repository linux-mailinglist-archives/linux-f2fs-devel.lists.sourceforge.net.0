Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2DF5199EA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 May 2022 10:35:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmATo-0005x4-4R; Wed, 04 May 2022 08:35:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1nmATm-0005wy-A6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 08:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dRT7i+B2Yov3mR9oGnGvAueqIkGXxxHVKRrgzcNI3cU=; b=KonD/TD1N2eUek6+varTuHSfeb
 W+VD928mDU9MlOPVWqwRdzTdcR3hKMdXFW9NBYxGQYJRsHto2ynv04KHQHlVexHNWWn78fQ3vtioL
 5EyE3gah2EeEl8jgjfCHNpVihUq0tESZpD3pKlc+Hl6UYXL/FPdfeydl0mPRbHqxzPt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dRT7i+B2Yov3mR9oGnGvAueqIkGXxxHVKRrgzcNI3cU=; b=DnxSzInezPaqlVv3Nkhe+SCOt+
 CMvMAfFghqsow+pl6aOCM+bcT3ZRnyxosHzsbK6izm94nrS/kfGn9Jp6ZIBrh7LRtwd8yGx4b8DhM
 qo3DRGl2+LsTyqwC0/kyWooIVS8f3Rj80hDA4WNZoXqtpuBNbQRTi60k6eXoZiLfjmos=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmATe-0004iU-RY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 08:35:25 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220504083509euoutp01c6f09c2ad127e8db2172a793cd16ad0d~r2e8pLHZr2993229932euoutp01L
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 May 2022 08:35:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220504083509euoutp01c6f09c2ad127e8db2172a793cd16ad0d~r2e8pLHZr2993229932euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651653309;
 bh=dRT7i+B2Yov3mR9oGnGvAueqIkGXxxHVKRrgzcNI3cU=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=dK2hgskREF92TYEpkqKsDjmkEjYwPK7wzzP1oiVva6bhCt79G74yWIFfuFfHSrERf
 fdgw42C1GDIKRj1T8l+6mqOTjxQ64hGvvb5aOLVawjptknwzmOiEqKcAN68byJrlMZ
 1QYABbNq2ARnlq98jANcweeMCqJlFE72UlInrMxU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220504083509eucas1p1bf302755e2c37837eba93e0b599d169b~r2e8Q2IW10045900459eucas1p1g;
 Wed,  4 May 2022 08:35:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A3.F1.10260.DBA32726; Wed,  4
 May 2022 09:35:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220504083508eucas1p2b13cd91f8b71fcf1a929d098c710ed9e~r2e7a28PG0925109251eucas1p2Z;
 Wed,  4 May 2022 08:35:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220504083508eusmtrp1cf71a20db9e2f38cdbb8f13ea104ef26~r2e7ZXh5Y3254032540eusmtrp1W;
 Wed,  4 May 2022 08:35:08 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-a9-62723abdce8d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B3.74.09404.CBA32726; Wed,  4
 May 2022 09:35:08 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220504083508eusmtip2e7e8bbafdd96bdd30b9c5ab3df5cab58~r2e7M-lMY2662026620eusmtip2R;
 Wed,  4 May 2022 08:35:08 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.170) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 4 May 2022 09:35:05 +0100
Message-ID: <a55665f1-26ae-c19f-5e2e-cf733e8f7fef@samsung.com>
Date: Wed, 4 May 2022 10:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, <jaegeuk@kernel.org>,
 <axboe@kernel.dk>, <snitzer@kernel.org>, <hch@lst.de>, <mcgrof@kernel.org>,
 <naohiro.aota@wdc.com>, <sagi@grimberg.me>,
 <damien.lemoal@opensource.wdc.com>, <dsterba@suse.com>,
 <johannes.thumshirn@wdc.com>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <3a178153-62c0-e298-ccb0-0edfd41b7ee2@acm.org>
X-Originating-IP: [106.210.248.170]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTdRzm+77v3r0swZch8Y15dAf5RxoYRd330kxOjff6ddbxR5d3wYA3
 4IBJGwuVQ0b80CHKZE5lWDOxRKyWwLYAh7ZwDDYcASOaSnGCFsmAQwgaSIwXO/57Ps/nee77
 PJ/7UrjQQIZRGZJcVioRZ0WQAsJonXdGmV+TJr/4s5pA+i4rjq7crSTR6cl5HNk13RiqqjzL
 R95uJ47Mnhoe6pkrwtDlKzcxNKLX4qjixiSBFsuHlrmSYRwtDMegKssAQKMuLYbM7i2o914d
 H/VeiEfXzJ0E6ms5RyLdN6N8pCqbwdGgahSgkx2NPPT93xMEsrlFO0VMX//bzGPbtyRzstjD
 Z5xDVwmmr1vONNQrSeYrhQZnGi8WMq3npzGm9TcFyRwv9pBMc+nvPGaizUUy+iYXwagar/KY
 6YbwvUEfCbanslkZn7HSrTuSBOl3R+7gOT3rD7g09XwF+CKgHPhTkI6F+ul2ohwIKCFdB+B4
 9zWSGx4BOHuujc8N0wBe/vIh/4nFNKDGuMUlAO3tJt7/qt4/P1+1tAA4o3GQPksAvQM6um6v
 YIJ+DnYcO4NzfBDsrB4hfDiE/hCe1vr0FBVMp0K3Lc5H43QodI/oVl7bQJ/CoFl1D/cNON2D
 w6VHg3yfgaQ3wyLlSjx/ehusnKgmOfPzsNTk5XP4WVhsqMG5CpFQPdiPcbgAfmd1rISG9B8C
 qFjUrop2Q/vxrlUcDMc6mlb7b4R2dQXB4Xw4OujFOXMJgJXN+pUGcDnFCUcWp4mDinbDKh0I
 B8eDuDyBsMp4BleBTdo1p9Cu6axdU0G7psJ5QNSDUFYuy05jZS9L2LxomThbJpekRafsz24A
 yz/b/rhj5kdQNzYVbQEYBSwAUnjEhoBdX+ckCwNSxQcPsdL9iVJ5FiuzABFFRIQGpGT8IBbS
 aeJcNpNlc1jpky1G+YcpMNOlj9vuJ8SJVZnbk4zrw73ZT3tefzA5kBCWsNXxQUNiW6A73bvH
 XDZnPYblOF9lbJ1+zW+oKgxHdLPzpve3bUoEvyZlW235Uy9Z5LE1JZ+EHdbYDoQcuX5zLEaX
 utAUWTurGj+MTb638SedekskdTQzN6U646kTJQ9KQ3bXA9ettxDvlbJ/34zfM2aIdCtB88Ls
 cGCNsr/6AjqUH9IerN0VPhFb/I/4zjOVt/Naat21n1pu+YfPLb4z9K6zNccjKTQaXb/U7VsX
 VWS5rjT4iYb3FoRenMqMWso1EWcfLimXzImiG4XxXv+8gt51B4/et+sEQstA8guu/L8cLpff
 zox9EYQsXRyzGZfKxP8BTb8GHEgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsVy+t/xe7p7rIqSDO58YrdYf+oYs8Xqu/1s
 FtM+/GS2OD31LJPFpP4Z7Ba/z55nttj7bjarxYUfjUwWK1cfZbJ4sn4Ws0XPgQ8sFn+77gHF
 Wh4yW/x5aGgx6dA1RounV2cxWey9pW1x6fEKdotLi9wt9uw9yWJxedccNov5y56yW0xo+8ps
 cWPCU0aLicc3s1qse/2exeLELWkHaY/LV7w9/p1Yw+Yxsfkdu8f5extZPC6fLfXYtKqTzWNh
 w1Rmj81L6j12L/jM5LH7ZgObR2/zOzaPna33WT3e77vK5rF+y1UWjwmbN7J6fN4kFyAYpWdT
 lF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdx98kd5oIL
 /BVXp65ib2Ccy9vFyMkhIWAisf3aZKYuRi4OIYGljBK3Js1lhUjISHy68pEdwhaW+HOtiw2i
 6COjxMze+cwQzi5GicPfbjOCVPEK2EmcOXWbDcRmEVCRON49nRkiLihxcuYTFhBbVCBC4sHu
 s0AbODiEBVIkbp1wBAkzC4hL3HoyH+wKEYEpTBJ7JzwGW8AscIFZ4v+XG+wQ2z4wSvxbdpsF
 pJtNQEuisRPsPE4Ba4n+9zPZICZpSrRu/80OYctLNG+dzQzxgrLE5BtXmCDsWolX93czTmAU
 nYXkvllIDpmFZNQsJKMWMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECEx024793LKDceWr
 j3qHGJk4GA8xSnAwK4nwOi8tSBLiTUmsrEotyo8vKs1JLT7EaAoMpInMUqLJ+cBUm1cSb2hm
 YGpoYmZpYGppZqwkzutZ0JEoJJCeWJKanZpakFoE08fEwSnVwLRa1t7kd9eegNsCFdISYmUm
 9WmGrxVPBwjoNdfaR/Oe4550+JKWszP/ru4PizX6LY/8UbnpnnzgrP9sjSiOYLP/J3a2Nqdv
 27jBPlnJ/nRqtf+elTwv9JZoHVt5nz32dOahKfMe9504dW3738Kn9epn7+dbz05zuceWLLL5
 /2oplX9/3eM2Xd+QXdq3PZFf2ej6/aqfVTHX7tnzVJbsXa62TeWVZWu/+XuxArPfu5xefC2V
 9bs/fY1R45vwVVHmJ5yvNLNOdQzvF3ETuqL26+XLit+sNxRiN/slCvx7WiMXmKBl/eLIq8Si
 KoGJ+rPn+5WveXx+Z5RxfphXsCDvB46aTMH+afozv4luUmJeq8RSnJFoqMVcVJwIAKUYqwP9
 AwAA
X-CMS-MailID: 20220504083508eucas1p2b13cd91f8b71fcf1a929d098c710ed9e
X-Msg-Generator: CA
X-RootMTR: 20220427160257eucas1p21fb58d0129376a135fdf0b9c2fe88895
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160257eucas1p21fb58d0129376a135fdf0b9c2fe88895
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160257eucas1p21fb58d0129376a135fdf0b9c2fe88895@eucas1p2.samsung.com>
 <20220427160255.300418-2-p.raghav@samsung.com>
 <3a178153-62c0-e298-ccb0-0edfd41b7ee2@acm.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2022-05-03 18:37, Bart Van Assche wrote: >>      
   sector_t zone_sectors = blk_queue_zone_sectors(disk->queue); >> +    sector_t
    capacity = get_capacity(disk); >>         if (!blk_queu [...] 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [210.118.77.11 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [210.118.77.11 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nmATe-0004iU-RY
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
Cc: jiangbo.365@bytedance.com, kch@nvidia.com, matias.bjorling@wdc.com,
 gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi0wNS0wMyAxODozNywgQmFydCBWYW4gQXNzY2hlIHdyb3RlOgo+PiDCoMKgwqDCoMKg
IHNlY3Rvcl90IHpvbmVfc2VjdG9ycyA9IGJsa19xdWV1ZV96b25lX3NlY3RvcnMoZGlzay0+cXVl
dWUpOwo+PiArwqDCoMKgIHNlY3Rvcl90IGNhcGFjaXR5ID0gZ2V0X2NhcGFjaXR5KGRpc2spOwo+
PiDCoCDCoMKgwqDCoMKgIGlmICghYmxrX3F1ZXVlX2lzX3pvbmVkKGRpc2stPnF1ZXVlKSkKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiAtwqDCoMKgIHJldHVybiAoZ2V0X2NhcGFj
aXR5KGRpc2spICsgem9uZV9zZWN0b3JzIC0gMSkgPj4KPj4gaWxvZzIoem9uZV9zZWN0b3JzKTsK
Pj4gKwo+PiArwqDCoMKgIGlmIChpc19wb3dlcl9vZl8yKHpvbmVfc2VjdG9ycykpCj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gKGNhcGFjaXR5ICsgem9uZV9zZWN0b3JzIC0gMSkgPj4KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWxvZzIoem9uZV9zZWN0b3JzKTsKPj4gKwo+PiAr
wqDCoMKgIHJldHVybiBkaXY2NF91NjQoY2FwYWNpdHkgKyB6b25lX3NlY3RvcnMgLSAxLCB6b25l
X3NlY3RvcnMpOwo+PiDCoCB9Cj4+IMKgIEVYUE9SVF9TWU1CT0xfR1BMKGJsa2Rldl9ucl96b25l
cyk7Cj4gCj4gRG9lcyBhbnlvbmUgbmVlZCBzdXBwb3J0IGZvciBtb3JlIHRoYW4gNCBiaWxsaW9u
IHNlY3RvcnMgcGVyIHpvbmU/IElmCj4gbm90LCBkb19kaXYoKSBzaG91bGQgYmUgc3VmZmljaWVu
dC4KPiAKWW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0IGJ1dCBibGtfcXVldWVfem9uZV9zZWN0b3Jz
IGV4cGxpY2l0bHkgY2hhbmdlZAp0aGUgcmV0dXJuIHR5cGUgdG8gdWludDMyX3QgdG8gc2VjdG9y
X3QgaW4gdGhpcyBjb21taXQ6CicxMTNhYjcyICBibG9jazogRml4IHBvdGVudGlhbCBvdmVyZmxv
dyBpbiBibGtfcmVwb3J0X3pvbmVzKCknLgoKSSBpbml0aWFsbHkgZGlkIGhhdmUgYSBkb19kaXYg
YnV0IGxhdGVyIGNoYW5nZWQgdG8gZGl2NjRfdTY0IHRvIGF2b2lkCmFueSBpbXBsaWNpdCBkb3du
IGNhc3RpbmcgZXZlbiB0aG91Z2ggem9uZV9zZWN0b3JzIHdpbGwgYmUgYWx3YXlzCmxpbWl0ZWQg
dG8gYW4gdW5zaWduZWQgaW50Lgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ibGtkZXYu
aCBiL2luY2x1ZGUvbGludXgvYmxrZGV2LmgKPj4gaW5kZXggNjBkMDE2MTM4OTk3Li5jNGU0Yzcw
NzFiN2IgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvYmxrZGV2LmgKPj4gKysrIGIvaW5j
bHVkZS9saW51eC9ibGtkZXYuaAo+PiBAQCAtNjY1LDkgKzY2NSwxNSBAQCBzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGludAo+PiBibGtfcXVldWVfbnJfem9uZXMoc3RydWN0IHJlcXVlc3RfcXVldWUg
KnEpCj4+IMKgIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGJsa19xdWV1ZV96b25lX25vKHN0
cnVjdCByZXF1ZXN0X3F1ZXVlICpxLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlY3Rvcl90IHNlY3RvcikKPj4gwqAgewo+PiArwqDCoMKg
IHNlY3Rvcl90IHpvbmVfc2VjdG9ycyA9IGJsa19xdWV1ZV96b25lX3NlY3RvcnMocSk7Cj4+ICsK
Pj4gwqDCoMKgwqDCoCBpZiAoIWJsa19xdWV1ZV9pc196b25lZChxKSkKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAwOwo+PiAtwqDCoMKgIHJldHVybiBzZWN0b3IgPj4gaWxvZzIocS0+bGlt
aXRzLmNodW5rX3NlY3RvcnMpOwo+PiArCj4+ICvCoMKgwqAgaWYgKGlzX3Bvd2VyX29mXzIoem9u
ZV9zZWN0b3JzKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBzZWN0b3IgPj4gaWxvZzIoem9u
ZV9zZWN0b3JzKTsKPj4gKwo+PiArwqDCoMKgIHJldHVybiBkaXY2NF91NjQoc2VjdG9yLCB6b25l
X3NlY3RvcnMpOwo+PiDCoCB9Cj4gCj4gU2FtZSBjb21tZW50IGhlcmUuCj4gCj4gVGhhbmtzLAo+
IAo+IEJhcnQuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
