Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89D506676
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 10:02:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngiok-00019x-GB; Tue, 19 Apr 2022 08:02:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1ngioj-00019r-Nj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 08:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yp0kGi0n6saserzbKOsdfRyijV0mSk3XyYBBRLpLiJI=; b=B3CB1vjKEUlUQDXOGDzXcnBnSj
 cZ0A+fdf27szBY5cG61l3XLeCDirI6/EefFxUXROAEA/fZRypLX6Ejf6Eq30ougSMZ1LCfTbuHxu4
 jGQwPhYNalxR+wT1ZOj5W17S6F2Mgf0oPpZKlv79y0tywMWtxOKm60fU184PQv5DZCyE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yp0kGi0n6saserzbKOsdfRyijV0mSk3XyYBBRLpLiJI=; b=QYNHyvei1Arqni2qX5Kh+uOHj6
 aR9h6n1NgdEoDbv8ebayxpfNByYzIfA0TmehlpK6fsBlSF3SLx0OyS9HUYABFZxeF8V+qblTT2t8p
 R2pdBLYfoSLTiUffuaOsJa6nGf1be3N8BuZRsheR5Q7sLjZW3SmanayTN09+Pm7foCZ0=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngiog-003dai-Dn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 08:02:31 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220419080218euoutp010e0ed3c7a036f28bbdf3fff1068f316d~nPW_xnLUV1117611176euoutp01L
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 08:02:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220419080218euoutp010e0ed3c7a036f28bbdf3fff1068f316d~nPW_xnLUV1117611176euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1650355338;
 bh=Yp0kGi0n6saserzbKOsdfRyijV0mSk3XyYBBRLpLiJI=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=oXf4mFW2MGToXo3oDf4bbRAIPueaJOiggjf/AIEul3r8cd0GvHL6l2pZN/49z2BmE
 e4wkMnWRWhA+7vNR2ilxxUXKSe4N9kt/2vlirJNYmfHoUy+7k/Q2fTzQIdlRA55HDD
 RcaG7mFnOAGrRAkNfLpotLwzarHwUzpDY6CL9L4g=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220419080218eucas1p2de3a1653c50f40af043a816a002da823~nPW_j5bCh1295012950eucas1p2g;
 Tue, 19 Apr 2022 08:02:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id CC.04.09887.A8C6E526; Tue, 19
 Apr 2022 09:02:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220419080217eucas1p29856617a4d1905a788f623fac754c7c8~nPW_Qcf441295812958eucas1p2k;
 Tue, 19 Apr 2022 08:02:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220419080217eusmtrp12884f81850f89bf6d88bd4922efeb421~nPW_Pv6ts2939829398eusmtrp1D;
 Tue, 19 Apr 2022 08:02:17 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-51-625e6c8a1ddc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2F.BA.09522.98C6E526; Tue, 19
 Apr 2022 09:02:17 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220419080217eusmtip14d05d634ff8420b12d1c2aed5c986b41~nPW_C-lDs0296302963eusmtip1Y;
 Tue, 19 Apr 2022 08:02:17 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.178) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Apr 2022 09:02:12 +0100
Message-ID: <41ba478d-f32d-cf10-8096-43fb98dd3114@samsung.com>
Date: Tue, 19 Apr 2022 10:02:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <Ylcoc0mfEIUS0e5Q@google.com>
X-Originating-IP: [106.210.248.178]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djP87pdOXFJBmdWs1m0tn9jsniyfhaz
 xaVF7hY3JjxltFhz8ymLA6vHzll32T02repk89i94DOTR/uBbqYAligum5TUnMyy1CJ9uwSu
 jA9zLrAWXBaqmLrwPVMD4z2+LkZODgkBE4lHzz+xdzFycQgJrGCUWHpuGjOE84VR4uXym0wQ
 zmdGiVe7OthhWmbcaWeBSCxnlPj3v5EFrmpj0wuolt2MEkcudLGCtPAK2Eks2/EcrJ1FQFXi
 4pWX7BBxQYmTM5+wgNiiAhESv249AosLC6RKbL1xlBnEZhYQl7j1ZD4TiC0ioCJxaNFlsGuZ
 BfYxSjzcPBmoiIODTUBLorETrJcTyLzwpIENoldTonX7b3YIW15i+9s5zBAvKEv82HCaDcKu
 lVh77AzYTAmBNxwSLxqusUIkXCR6ZhyBsoUlXh3fAvW/jMTpyT0sEHa1xNMbv5khmlsYJfp3
 rmcDOUhCwFqi70wOhOko8a+PB8Lkk7jxVhDiHD6JSdumM09gVJ2FFBKzkHw8C8kHs5B8sICR
 ZRWjeGppcW56arFRXmq5XnFibnFpXrpecn7uJkZgqjn97/iXHYzLX33UO8TIxMF4iFGCg1lJ
 hLdnSXSSEG9KYmVValF+fFFpTmrxIUZpDhYlcd7kzA2JQgLpiSWp2ampBalFMFkmDk6pBqbA
 1gPhS9kUm5RXC++5yTd7V3/AivjlbYJsGpZHZdZv+aPxzXVTcJ7RAj8JXe+ft6bozNWbfGZV
 9hGhd4Jr588ozGZI4bW1fbTuf1mc/U8GbnWGk94flHw85YTEV7Tq3O3dJnX/+S+9b9Od5Rbc
 4WasrvSq7V15avab9d+sJ+ul2uqrLvT2+vxdlEfnzzO7gHoe9pjPrHldd/MCGXL2VIp+v1l8
 uIfPOi5HKPvawqtTNWy//3t11/banurIle+XvPftMOsrmT5xecSxtZ0ffqZzKM2JnOb6M6HE
 QlbxTe1H1SmrVvrrHxDIvnLB3HZTwOGEi+kclSp7kl9vv1vy6NbGa86Ghk2zCgQE76q8uqbE
 UpyRaKjFXFScCAAaqWxlpAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7qdOXFJBu9eaVq0tn9jsniyfhaz
 xaVF7hY3JjxltFhz8ymLA6vHzll32T02repk89i94DOTR/uBbqYAlig9m6L80pJUhYz84hJb
 pWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jA9zLrAWXBaqmLrwPVMD4z2+
 LkZODgkBE4kZd9pZuhi5OIQEljJKvNl/iwkiISPx6cpHdghbWOLPtS42iKKPjBLX5l1ihnB2
 M0rcfvUDrINXwE5i2Y7nYB0sAqoSF6+8ZIeIC0qcnPmEBcQWFYiQWLZrKpgtLJAqsfXGUWYQ
 m1lAXOLWk/lgc0QEVCQOLbrMDrKAWWAfo8TDzZOhtjUySfR2HmDtYuTgYBPQkmjsBFvACWRe
 eNLABjFIU6J1+292CFteYvvbOcwQLyhL/Nhwmg3CrpV4dX834wRG0VlI7puF5I5ZSEbNQjJq
 ASPLKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMAY3Xbs5+YdjPNefdQ7xMjEwXiIUYKDWUmE
 t2dJdJIQb0piZVVqUX58UWlOavEhRlNgIE1klhJNzgcmibySeEMzA1NDEzNLA1NLM2MlcV7P
 go5EIYH0xJLU7NTUgtQimD4mDk6pBqbOO0EH+xOtmnJulRVUVXRkqwhetZz+9Im6/P9G3vVW
 Zfzvr8z5sm+mqX1E8cVrbA+O5DPs2nNjTkmGX9Hdw4ucuC4EOAlNU0y6dn/jXz5rZva9upHd
 BUd7Dj3q8f7Us/eoQ+HHRVX3mszPpV9LnSTQs/ma0cJerucJ23oS4qfMXlf07iFL8JrshuUC
 6pPOfLixc8cNzb2/pdgfJ3ycultmqp5oumXjLkGTGwfWF8Qf+b1H4qWxnMjmxm8LFhR3fn+m
 9vtRqWnbU9uTG5i0iww8f5SoC+RP/pYd3nbt/cn5+gw/vky4FHfabGbqSRk7i9dhpo8/sC3v
 qtt99kS8mucNj3e67LttVs+Yp3rnr4efEktxRqKhFnNRcSIAyQwyTFoDAAA=
X-CMS-MailID: 20220419080217eucas1p29856617a4d1905a788f623fac754c7c8
X-Msg-Generator: CA
X-RootMTR: 20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35
References: <CGME20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35@eucas1p1.samsung.com>
 <20220413122940.133981-1-p.raghav@samsung.com> <YlcCSR2rTqOgOoxX@google.com>
 <6f508044-5329-f864-3879-c42a59d52366@samsung.com>
 <Ylcoc0mfEIUS0e5Q@google.com>
X-Spam-Score: -9.0 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-04-13 21:45, Jaegeuk Kim wrote:>> As I explained in
 the v1 thread, zoned support for f2fs assumes po2 zone >> sizes. For e.g.,
 >> static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi, [...] 
 Content analysis details:   (-9.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -3.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngiog-003dai-Dn
Subject: Re: [f2fs-dev] [PATCH v2] libf2fs: don't allow mkfs / fsck on non
 power-of-2 zoned devices
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
Cc: Damien.LeMoal@wdc.com, pankydev8@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, Adam
 Manzanares <a.manzanares@samsung.com>, javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022-04-13 21:45, Jaegeuk Kim wrote:>> As I explained in the v1
thread, zoned support for f2fs assumes po2 zone
>> sizes. For e.g.,
>> static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
>> 		struct block_device *bdev, block_t blkstart, block_t blklen)
>> {
>> 	sector_t sector, nr_sects;
>> 	block_t lblkstart = blkstart;
>> 	int devi = 0;
>> ...
>> ...
>> 		// Assumes zone sectors to be po2
s/Assumes zone sectors to be po2/Works correctly only if the base
alignment is a power of 2 value./

Taken from align.h:
/* @a is a power of 2 value */
...
#define IS_ALIGNED(x, a)    (((x) & ((typeof(x))(a) - 1)) == 0)

> 
> Well, I think this will be aligned to 2MB, if the device gives NPO2? IOWs, this
Could you elaborate what you mean by `this will be aligned to 2MB`?
> is just checking the granularity, not PO2.
Yeah, so whenever we send a discard or a zone reset, the block zoned
device expects the `sector` to be the start of a device zone. The check
below essentially checks if the `sector` aligns with the `zone size
sector` of the device. But to check for alignment using this `sector &
(bdev_zone_sectors(bdev) - 1)` will only work if
`bdev_zone_sectors(bdev)` is a power of 2.

Even if the device zone size is a multiple of 2MB, these checks will
fail for a non power of 2 zone size device. The solution is simple, it
is to make this alignment check generic but until this is done in the
kernel, mkfs.f2fs should fail to mount for a non power of 2 device.
> 
>> 		if (sector & (bdev_zone_sectors(bdev) - 1) ||
>> 				nr_sects != bdev_zone_sectors(bdev)) {
>> 			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
>> 				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
>> 				 blkstart, blklen);
I tried it locally in QEMU along with my local changes to remove power
of 2 constraint in the block layer and zns device, and indeed the
`Unaligned zone reset attempted` error popped up for a zns drive with a
zone size 96MB.

When I changed the condition from `sector & (bdev_zone_sectors(bdev) -
1)` to `sector % bdev_zone_sectors(bdev)`, the error went away because
the calculation doesn't depend on the alignment base to be a power of 2.


TL;DR until we change some calculations in f2fs for zoned device to be
generic, we need to bail out during mkfs time for non power of 2 zone
size devices.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
