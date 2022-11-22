Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B19D63379F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Nov 2022 09:57:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxP5r-0007w8-7p;
	Tue, 22 Nov 2022 08:57:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1oxP5V-0007tB-G3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 08:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YlAbJG6qiKsC2YLeq9EPpaG7fZfhJYIDuv/NKvM6Xvs=; b=fdq1efY9BqdWim0cy/L3HkhXkh
 7Ma5ValP57ziLXM1bkYBm3D+2PuliFXyuNQz0kNMXRwPEW7NRzHzH7ppZaHI4Q11LX2mMohtPkOSM
 ZIkb8UHOBr5QiNfb9VaAXk+/JQ/JXwdqN77woygCNJl0KpA9SHUYjt/ivYLKg7jaN2XM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YlAbJG6qiKsC2YLeq9EPpaG7fZfhJYIDuv/NKvM6Xvs=; b=lqX8ULyeAxyj9VAUa+97qX1UNy
 L3HNE46nKkH48HgUgiYhj1I54SZ/VELKld5Y39dJfd5/ky9xhiM2BYHOCP3s4Y0KEi0tEnecPQd7q
 FPGfW75HeMMQCHKTpaZlmyI0STlciRVG8JKfapclsUdu94viIKpDvwFRZy+MSlMcwTXs=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxP5Q-00073g-Sr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 08:57:05 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20221122085650epoutp03dcdd7e0139a5918deb0a3ab38c93632b~p3FjCwdCP3192131921epoutp03k
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 08:56:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20221122085650epoutp03dcdd7e0139a5918deb0a3ab38c93632b~p3FjCwdCP3192131921epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1669107410;
 bh=YlAbJG6qiKsC2YLeq9EPpaG7fZfhJYIDuv/NKvM6Xvs=;
 h=Subject:Reply-To:From:To:In-Reply-To:Date:References:From;
 b=i9rXcHbNyZyMF3VCCTQ+I8dp3kpO9GZX3f9TjYk81nD8BL31d0tX191hq2dLPCaGs
 tm0zE/KN5o8r2i/cAoq7uDo9WkyGT0Z3wYUamKLvzXyYw2pcfL7Y5rcgzUBO4QaH0p
 4jZa1hQfPKA84CHgheLV+5FRUFuwnaXAoMwBoABE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20221122085650epcas2p1cc86df78d2c3a1858c7420e8b41fbf33~p3FitfGub1771317713epcas2p1-;
 Tue, 22 Nov 2022 08:56:50 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.69]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4NGdRP6FvQz4x9Pp; Tue, 22 Nov
 2022 08:56:49 +0000 (GMT)
X-AuditID: b6c32a45-275f970000002b87-c6-637c8ed11974
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 3D.44.11143.1DE8C736; Tue, 22 Nov 2022 17:56:49 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <af5ae747-5552-aeb0-885e-ddc9ab6f39c3@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20221122085649epcms2p5b72ef048e5ac93c02859611fd2233c3a@epcms2p5>
Date: Tue, 22 Nov 2022 17:56:49 +0900
X-CMS-MailID: 20221122085649epcms2p5b72ef048e5ac93c02859611fd2233c3a
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNKsWRmVeSWpSXmKPExsWy7bCmme7Fvppkg76lBhanp55lsniyfhaz
 xaVF7haXd81hc2Dx2LSqk81j94LPTB6fN8kFMEdl22SkJqakFimk5iXnp2TmpdsqeQfHO8eb
 mhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYALVNSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2Cql
 FqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGcsv7CAteA+X0XTB4sGxttcXYycHBICJhJH
 Ju5m7GLk4hAS2MEosfzHbCCHg4NXQFDi7w5hkBphgTCJTZffM4LYQgJKEtcO9LJAxPUlNi9e
 xg5iswnoSvzdsJwdZI6IwANGiSk39rJBLOCVmNH+lAXClpbYvnwr2HxOATuJTVsMIcIaEj+W
 9TJD2KISN1e/ZYex3x+bzwhhi0i03jsLVSMo8eDnbqi4pMSiQ+eZIOx8ib8rrkOtrZHY2tAG
 FdeXuNaxEewEXgFfieXrb4L1sgioShxZ/hRqjovE8e8nweqZBeQltr+dwwxyJrOApsT6Xfog
 poSAssSRWywQFXwSHYf/ssM8uGPeE6hNahKbN21mhbBlJC48boOa7iFx/8MtZkgonwSGzqHj
 jBMYFWYhAnoWksWzEBYvYGRexSiWWlCcm55abFRgCI/a5PzcTYzgVKfluoNx8tsPeocYmTgY
 DzFKcDArifDWe9YkC/GmJFZWpRblxxeV5qQWH2I0BXp5IrOUaHI+MNnmlcQbmlgamJiZGZob
 mRqYK4nzds3QShYSSE8sSc1OTS1ILYLpY+LglGpgqk7hKDnzxG2ndMbvlXbhzmvnZvjevSir
 6xB78G3Z2RtZh+9tC74kVeMczbGo5et1Qy+ebRovVedKXjvLu7rApnLVs0NVN3/OOvAm6iHX
 q5uXNuhoZ0f+c1a/edZfe7ZAa/e9et9rx7n6T/9mXa8cYbeWa4nknUU1Fb5fVRRWxnBndHOU
 193f8Zvt0a8zR3YsvHhQVSuz5fHZxzPmVAtLrv3j+j70p1/p7y9Hgi6E6UYJ7gtyl22+t8BK
 IOktg/0v8cdXVKRKwyL0j4UfMU19/0/dVtVX6iD/C76QR82119gEukvZevYkyFq9K4tlesAd
 t05CPffKodDz13iLNFYrlYnLFewwfxkT4rJBpN1JiaU4I9FQi7moOBEAu+HFEf4DAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7
References: <af5ae747-5552-aeb0-885e-ddc9ab6f39c3@kernel.org>
 <20221122023656epcms2p4468d4feb97711516206e19890dad09ac@epcms2p4>
 <CGME20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7@epcms2p5>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, Thanks for your review. I'll fix this and resend
 a mail. Thanks 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxP5Q-00073g-Sr
Subject: Re: [f2fs-dev] (2) [PATCH v1] f2fs: avoid victim selection from
 previous victim section
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
Reply-To: yonggil.song@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

Thanks for your review.
I'll fix this and resend a mail.

Thanks

>Hi Yonggil,
>
>I guess your email client forces converting tab and space characters of
>patch, please check that.
>
>On 2022/11/22 10:36, Yonggil Song wrote:
>> When f2fs chooses GC victim in large section & LFS mode,
>> next_victim_seg[gc_type] is referenced first. After segment is freed,
>> next_victim_seg[gc_type] has the next segment number.
>> However, next_victim_seg[gc_type] still has the last segment number
>> even after the last segment of section is freed. In this case, when f2fs
>> chooses a victim for the next GC round, the last segment of previous victim
>> section is chosen as a victim.
>> 
>> Initialize next_victim_seg[gc_type] to NULL_SEGNO for the last segment in
>> large section.
>> 
>> Fixes: e3080b0120a1 ("f2fs: support subsectional garbage collection")
>
>Good catch, I'm fine with this fix.
>
>Thanks,
>
>> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
>> ---
>>   fs/f2fs/gc.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 4546e01b2ee0..10677d53ef0e 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -1744,8 +1744,9 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>>                                   get_valid_blocks(sbi, segno, false) == 0)
>>                           seg_freed++;
>>   
>> -                if (__is_large_section(sbi) && segno + 1 < end_segno)
>> -                        sbi->next_victim_seg[gc_type] = segno + 1;
>> +                if (__is_large_section(sbi))
>> +                        sbi->next_victim_seg[gc_type] =
>> +                                (segno + 1 < end_segno) ? segno + 1 : NULL_SEGNO;
>>   skip:
>>                   f2fs_put_page(sum_page, 0);
>>           }
>> -- 
>> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
