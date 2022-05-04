Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A01519AD0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 May 2022 10:53:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmAlV-00073B-Ks; Wed, 04 May 2022 08:53:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1nmAlT-000735-Qk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 08:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QkjMVZ7YuUw8jJhXQnJpcoFnlPYOWuxnkq5J+jf/yN8=; b=i679JnxHBDex1oJtLOgB83G1Kb
 oLmhIlcSmC6feVInnP4eWIGj6YR/NxrGbRo5+NtymMtjeOoUNt6drU1zloUIUO1wTTFf1GFFCMKFz
 pZ08mv9RmEZcUieWLtq8b1AZjBsbHqCd5myrL7qw2tFm5CgsF28xDIN6oyMhcCTyhtDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QkjMVZ7YuUw8jJhXQnJpcoFnlPYOWuxnkq5J+jf/yN8=; b=mS9J2HHPGL9wuxO+XQnlMybtKX
 xnhjEgG5pl2C2EOnc0ruy2hJNaaTI/6ZyaTz34FVeIT6fzL0Sybi4Z6gYNP7y5dLdVz25Q6giJV6D
 Lynk7yXpu71VYQmVjuh8Ib2ykPlM7K2byVe3Mm4RX3xzt02704mBUnpUk/CKZr9aPjM4=;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmAlQ-000v98-Am
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 08:53:42 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220504085333euoutp02b6595db913b825d6fd895833413c3b15~r2vBD0DOD1925219252euoutp022
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 May 2022 08:53:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220504085333euoutp02b6595db913b825d6fd895833413c3b15~r2vBD0DOD1925219252euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1651654413;
 bh=QkjMVZ7YuUw8jJhXQnJpcoFnlPYOWuxnkq5J+jf/yN8=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=YVsDclRP7tkY4Nn28CHry9I4f+rv7szzKPMkxVo7fsbeKFnb3ZXoL5Az4qkwAZVu8
 oLTHEW3cyha2eVWV4681p4smoa9eWbcaYk0FQBZg9nXcSIYiReoHrW8cjwH1KVZa6m
 LIczqTXf2QncLKMS9LTgVvDC5RxgtsseJpFU/qz0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220504085333eucas1p10e28ba95f5c2a26ea4db6270247ad64b~r2vAoyEmn0813908139eucas1p1Y;
 Wed,  4 May 2022 08:53:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3F.B5.10260.D0F32726; Wed,  4
 May 2022 09:53:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220504085332eucas1p28b16e7db390eb2ffb2906ed2f2aa06b5~r2vAHVCh_1462414624eucas1p2y;
 Wed,  4 May 2022 08:53:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220504085332eusmtrp1117c59c1ab66ee22363450053dfd8684~r2vAF33E11107411074eusmtrp1T;
 Wed,  4 May 2022 08:53:32 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-a7-62723f0d3918
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 50.F7.09404.C0F32726; Wed,  4
 May 2022 09:53:32 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220504085332eusmtip1ef554c6afdc7b3b69842971ebc6d663b~r2u-6o-s51569915699eusmtip1e;
 Wed,  4 May 2022 08:53:32 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.170) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 4 May 2022 09:53:29 +0100
Message-ID: <850340eb-fc88-38a7-4c92-1c389e92b0ad@samsung.com>
Date: Wed, 4 May 2022 10:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <YnGK/8lu2GW4gEY0@google.com>
X-Originating-IP: [106.210.248.170]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xTZxjed249Lak7FJFPuulSnAlsoAx03zKkLszt6GZk/4y7FjlBslKh
 lW3qNksQkAZoAZFRQcSwjdvoaFG8UMKaAcpFFkux4IApoKaEiwFkHayOcjDj3/O+7/O87/N8
 +Whc0kAF0omqY5xapVDKKBFxpd3dGyqWq+O2F2f6IVNnO45qh/QUOjfjxlFXUQ+GCvQ/CNBi
 Ty+OrFPnSfTH32kYqq5tw9CYyYijnNYZAv2rG17unb6Po6X74ajA1g/QuMOIIevga+jOaJUA
 3bn0Pmq23iKQ/Xophcp/GhcgQ+Y8jpyGcYDyOywkqp+YJtDNQeluKWvv+4D13Kyj2Pz0KQHb
 O9xAsPaeVNZck02xFdoinLVUnmJvXJzF2BsDWorNTZ+i2GsZIyQ73eKgWFOjg2ANlgaSnTVv
 ivU9JIqK55SJX3HqbdFfiI487ntEJmf6fFPa6BFogZvWASENmUjosnVQOiCiJUwVgLfzcgm+
 mAPw7sKz1WIWwO5HC4LnEkPTyOrgZwAfdqX9zxrK76O8LAlzHcDf5nfqAE2LmWjYVrXB2yaY
 LfDy2XzgxWLGF94qGSO82J85CM8Zuykv3Y+JhcMZK/ZwJgAOjpVjXrx+WWq7ZBd4T+FMMwkb
 qu+RXj7FhMC07BVvwmU4bHaRvDYYZjQtCni8GTZNluK8/yBY6OzDePwd/KW9e2UnZAZEcG5i
 kvDuhMy7sLNiB8/xg66OxtXsL8GuwhyCxyfhuHMR57WnAdRfM1G89m2Y163kOe/ATP0FjG+v
 g85JX97OOlhwpRg3gFeNax7CuCaxcU0C45oEFwFRAwK4VE1SAqeJUHFfh2kUSZpUVULY4aNJ
 ZrD8q7s8HfNXQZXrSZgNYDSwAUjjsvXimB+T4yTieMXxE5z66OfqVCWnsQEpTcgCxIcTf1VI
 mATFMe5Ljkvm1M+nGC0M1GLyiHCfyastIfrdard8SPlP0Bmfp2+q+9V97m8L9mSlnOi/y1nq
 AZlgr8zevnVv1sOWpRr8gcvtvzd82GqcvW362NmifVCPxZEduT4qR+toxGe7DqagznRP1GOh
 pzf+1Jz7bGuZyecA80Lnp3Wjwdbo0NcXRsCflqzEyg8/iqpJUQVy06WxpqWBKGv16E7lRmmw
 LmjuSfF7te31JS9XPH3rxe9LcoCRNBV9srG5zrw5TLKvivJ3pP0VY8mtKyrfdDxyw+X9ZYZC
 l7xgz++LbZGhA2XnKdnMyZpnO96AYdHFB/R1u1qlrPMQLq8+o41hY7G8rXETiTEXtglfYcbg
 vX0yQnNEER6CqzWK/wAWnxgCRAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRmVeSWpSXmKPExsVy+t/xu7o89kVJBs/OalusP3WM2WL13X42
 i2kffjJbnJ56lsliUv8MdovfZ88zW+x9N5vV4sKPRiaLlauPMlk8WT+L2aLnwAcWi79d94Bi
 LQ+ZLf48NLSYdOgao8XTq7OYLPbe0ra49HgFu8WlRe4We/aeZLG4vGsOm8X8ZU/ZLSa0fWW2
 uDHhKaPFxOObWS3WvX7PYnHilrSDtMflK94e/06sYfOY2PyO3eP8vY0sHpfPlnpsWtXJ5rGw
 YSqzx+Yl9R67F3xm8th9s4HNo7f5HZvHztb7rB7v911l81i/5SqLx4TNG1k9Pm+SCxCM0rMp
 yi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mt4ceU5a0Eb
 d8WcLf/YGxh/cnQxcnJICJhITNh+n6WLkYtDSGApo0TzimVMEAkZiU9XPrJD2MISf651sUEU
 fWSUWL9oKSOEs4tRYu2jOUDtHBy8AnYSR1eIgTSwCKhIbJ0ykRHE5hUQlDg58wkLiC0qECHx
 YPdZVhBbWMBP4sHRy2ALmAXEJW49mQ+2WASo99AikDgXUHwPq8TGlbdZIZbdY5SYsu0JI8gy
 NgEticZOsGZOIPPeplesEIM0JVq3/4YaKi+x/e0cZogPlCUm37gC9VmtxKv7uxknMIrOQnLf
 LCR3zEIyahaSUQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIEprltx35u2cG48tVHvUOM
 TByMhxglOJiVRHidlxYkCfGmJFZWpRblxxeV5qQWH2I0BQbSRGYp0eR8YKLNK4k3NDMwNTQx
 szQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgalp7I+v5v+ufFd/sXCqr/Kq8ctEG
 5WV+gtILyybMulX/f+ouXg1+dfZpNl3ht1+8ucSdYtPx7O0GqxeHFQ7WvZ5zfXt+Zv/Gld8e
 bNBXsVY4afir4YNhnueuSMOUS+yyPcZL1/47XjLp8PuPkw9Y/X8v9iXb44VRa5T1lmgLBQa7
 ZKXpSer1Nfmqh7ln3ljtsv6i2gOeMBbuoMz9s3cyGka+v7/7YNEkg9mR537zuS3fdYxJfG6u
 73SfI1wXVZJSihZZS+9Q0Ojuubj+jfOeGK1ekZkZnTOeiTEFHyzemdUntqZtnaKl5WPVtDMJ
 sXNTpn1OCf82a6250J27hhb/n0uH8ypfTPjhzJ0fGjlhmhJLcUaioRZzUXEiAIorxvr8AwAA
X-CMS-MailID: 20220504085332eucas1p28b16e7db390eb2ffb2906ed2f2aa06b5
X-Msg-Generator: CA
X-RootMTR: 20220427160312eucas1p279bcffd97ef83bd3617a38b80d979746
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160312eucas1p279bcffd97ef83bd3617a38b80d979746
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160312eucas1p279bcffd97ef83bd3617a38b80d979746@eucas1p2.samsung.com>
 <20220427160255.300418-16-p.raghav@samsung.com>
 <YnGK/8lu2GW4gEY0@google.com>
X-Spam-Score: -8.3 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-05-03 22:05, Jaegeuk Kim wrote: > Applied to f2fs
 tree. Thanks, > Thanks Jaegeuk. I will remove the f2fs patches from my next
 revision Regards, Pankaj > On 04/27,
 Pankaj Raghav wrote: >> From: Luis Chamberlain
 <mcgrof@kernel.org> >> >> F2FS zoned support has power of 2 zone size
 assumption in many places >> such as in __f2fs_issue_di [...] 
 Content analysis details:   (-8.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.12 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.12 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nmAlQ-000v98-Am
Subject: Re: [f2fs-dev] [PATCH 15/16] f2fs: ensure only power of 2 zone
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
Cc: jiangbo.365@bytedance.com, linux-nvme@lists.infradead.org, clm@fb.com,
 dm-devel@redhat.com, hch@lst.de, agk@redhat.com, naohiro.aota@wdc.com,
 sagi@grimberg.me, gost.dev@samsung.com, damien.lemoal@opensource.wdc.com,
 jonathan.derrick@linux.dev, kch@nvidia.com, snitzer@kernel.org,
 josef@toxicpanda.com, linux-block@vger.kernel.org, dsterba@suse.com,
 kbusch@kernel.org, matias.bjorling@wdc.com, bvanassche@acm.org,
 axboe@kernel.dk, johannes.thumshirn@wdc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 2022-05-03 22:05, Jaegeuk Kim wrote:
> Applied to f2fs tree. Thanks,
>
Thanks Jaegeuk. I will remove the f2fs patches from my next revision

Regards,
Pankaj
> On 04/27, Pankaj Raghav wrote:
>> From: Luis Chamberlain <mcgrof@kernel.org>
>>
>> F2FS zoned support has power of 2 zone size assumption in many places
>> such as in __f2fs_issue_discard_zone, init_blkz_info. As the power of 2
>> requirement has been removed from the block layer, explicitly add a
>> condition in f2fs to allow only power of 2 zone size devices.
>>
>> This condition will be relaxed once those calculation based on power of
>> 2 is made generic.
>>
>> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
>> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
>> ---
>>  fs/f2fs/super.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index f64761a15df7..db79abf30002 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -3685,6 +3685,10 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>>  		return 0;
>>  
>>  	zone_sectors = bdev_zone_sectors(bdev);
>> +	if (!is_power_of_2(zone_sectors)) {
>> +		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");
>> +		return -EINVAL;
>> +	}
>>  
>>  	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
>>  				SECTOR_TO_BLOCK(zone_sectors))
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
