Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 368BB9F83F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2019 04:21:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2naA-0003qq-Hv; Wed, 28 Aug 2019 02:21:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <boojin.kim@samsung.com>) id 1i2na9-0003qj-8o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 02:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Id8G/Xn6V06sAdZYXMptUi6MUxaX2z3h414AQSi5/I=; b=cWfJsPPcre4M7Tv4rlMmxl23Hi
 EVf0cGPocjLzEX5ndUS5dnhy6RtkEM+/Ri/5bKoGxUSbBDjllgUuVeKhVJXnmRxQTLuALztZ08GjO
 7gxWbtbQt1ciDx3DMRyDZEh564cB5EkkI7Nzphe4DrZPB3bw9rN19jRLG05a6d08CqLo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2Id8G/Xn6V06sAdZYXMptUi6MUxaX2z3h414AQSi5/I=; b=j
 a1aLnYU+eLKTPUzmOYlBYkg4vfVoD0Bs4nGYw1bVRToEy53xJNhEuu0/1TexHLWDs8vxU4VukJHyd
 WjuC8wjaHlBV4GXswZxOnUKFc6RQkdPN/IZ8PSDdlbHNqjl2/3HtTevDZTpQARiYUeAdBAErM3Xjw
 jYLNA2jas4UzWz4o=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2na4-000rPg-GZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 02:21:09 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20190828022057epoutp03db8c446f45cb8a4bc76f8a83e3303bb2~_9MdRZFi33038330383epoutp03y
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Aug 2019 02:20:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20190828022057epoutp03db8c446f45cb8a4bc76f8a83e3303bb2~_9MdRZFi33038330383epoutp03y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566958857;
 bh=2Id8G/Xn6V06sAdZYXMptUi6MUxaX2z3h414AQSi5/I=;
 h=From:To:Cc:Subject:Date:References:From;
 b=k98yVcHoY5eRWy55whZ8rcavcrMGw1LpHMDptIqy9vdMw+WVazwzt15mo01XkRRd9
 7l4/CVj1LA+KD2X9zJQ7pDyqu9or8QDc9Y8Ar0ut0xku1LRrop+z5Ki0aMLe43HoyD
 3N5pbfTIZQ6BYehWU3Hx+E4IXA0zFrHfzsrXO79E=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20190828022056epcas2p488315cc4e34969caaecc606d9bbd2c6e~_9Mc2Raic1168911689epcas2p4l;
 Wed, 28 Aug 2019 02:20:56 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.181]) by
 epsnrtp5.localdomain (Postfix) with ESMTP id 46J8c74t4rzMqYkf; Wed, 28 Aug
 2019 02:20:55 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 36.C7.04156.705E56D5; Wed, 28 Aug 2019 11:20:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20190828022055epcas2p25525077d0a5a3fa5a2027bac06a10bc1~_9MbUtf8v2048620486epcas2p2Q;
 Wed, 28 Aug 2019 02:20:55 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190828022055epsmtrp247236feb1b81a6eaa608658d164e62a4~_9MbTgesT1110211102epsmtrp2U;
 Wed, 28 Aug 2019 02:20:55 +0000 (GMT)
X-AuditID: b6c32a45-ddfff7000000103c-c4-5d65e5073e36
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F0.33.03706.605E56D5; Wed, 28 Aug 2019 11:20:55 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20190828022054epsmtip1cb959d74740696d9b606a29b76e0110e~_9MbAmhuG2545625456epsmtip1A;
 Wed, 28 Aug 2019 02:20:54 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Theodore Y. Ts'o'" <tytso@mit.edu>
Date: Wed, 28 Aug 2019 11:20:53 +0900
Message-ID: <009301d55d47$38606400$a9212c00$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdVdRkQ7u+BKrKHPSQuBNN28o4N3VA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0wbZRjOd3e9OybFs6vus6LrThYdE9arFj50qNG5XbL9gb+iMc56KZcW
 7a/0WjbUbATXUhiRQXRuhbG5GeNgla3UjQzKXGGSOqBOZGEEt8QxDKBsApuBiNr2WOS/53m+
 5/ne9/3efDSu+pzS0CV2t+iyC1aWXEGc7l6Xn0PdELfrWnqy0O05P4Faf/geRy2/1JLo4mf9
 GGqM7yFQZLpBgYKdf+No72QmGmsN4Gh4wadAtdencBSPn6RQ6PplBYqMrEfXrs5j6GDTKIl+
 OroFTTbdIVBnJEagwbONJOr5txagA/EuDPlO3QbIWzNPod7gG88/yIePX8H4PW07+NPfreUH
 +z18qLmK5Ecvd5J825e7+Y4jsxhf0XcB5292DZH8J+FmwM+GHilKf8u60SIKxaJLK9pNjuIS
 u7mQ3fqq8UWjIU/H5XAFKJ/V2gWbWMhu2laUs7nEmpid1ZYKVk9CKhIkid3w7EaXw+MWtRaH
 5C5kRWex1clxzlxJsEkeuznX5LA9zel0ekPC+a7VUn/1EOWsTN/Zd7hWUQ4uplUDmobMUzBY
 KVaDFbSKaQfw5/EmhUxmALw5vI+UyZ0E8VaAuwlveIusRwD8bfhPXCYTAJ7/ay4RT6NJZj1s
 620GSaxmHodDi/Opa3HmHwqOzUSJ5MFKRg+91XuxJCaYtXCi6hKWrKBkCuCl/auTspK5D8YO
 jqXsOLManvmjEU9iyGhhe/9UqiE1kwuPjr8iW9SwocqX6gcyixQcb/ATsn8T/NgbWcquhJO9
 YUrGGjg7HSFlvBsOfXWMksM1APYt+JZMT8LAeGWqGM6sg61nN8gP8SjsGVlqLQP6uxcpWVZC
 v08lB7PgoZlBTJY18FbNLlnmYThcD/aBNYFlMwaWzRhYNkzg/7JHANEMHhCdks0sSnont3zT
 IZD6FNkvtYMDA9uigKEBm6703ytuVymEUqnMFgWQxlm18teshKQsFso+EF0Oo8tjFaUoMCQ2
 UIdr7jc5El/M7jZyBn1enq7AgAx5esSuUrbdc+VtFWMW3OL7ougUXXdzGJ2mKQdm9e/PFMRj
 773zBV9v6lKSE4+Fdg3MVVyYek5SKp6IvRms40syMn5sObHq/EM7TOdOZkd21tVrz2WWWSYa
 Tk1jU4dBJy2xr58IfXvmNZtpf0UpZ87vuHGreyBmffiFeJeR+Kaj91prJhoJlleXfXpsob0n
 mv91KTg++mHN1o/EzJdZQrIIXDbukoT/AJPWV5kqBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsWy7bCSnC7709RYg94Ki69fOlgs1p86xmyx
 +m4/m8XpqWeZLOacb2Gx2PtuNqvF2j1/mC26X8lYPFk/i9nixq82Vov+x6+ZLc6f38Busenx
 NVaLvbe0Le7f+8lkMXPeHTaLS4vcLV7N+8ZisWfvSRaLy7vmsFkc+d/PaDHj/D4mi7aNXxkt
 Wnt+slscXxvuIOmxZeVNJo+WzeUe2w6oelw+W+qxaVUnm8eda3vYPDYvqffYveAzk0fTmaPM
 Hu/3XWXz6NuyitHj8ya5AJ4oLpuU1JzMstQifbsEroxJ9+ayF7TzVJyZ38/awHias4uRg0NC
 wESidYt7FyMXh5DAbkaJkzPfsHYxcgLFpSS2tu9hhrCFJe63HAGLCwk8Z5T43FQAYrMJaEts
 Pr6KEcQWEdCQuPr3J1gNs8A0DoldH8RBbGEBI4nWrm4mEJtFQFXiZedFJpC9vAKWEhenyYOE
 eQUEgdY+YQEJMwvoSbRtZISYIi+x/e0cqAsUJHacfc0IUiICVLLoWRBEiYjE7M425gmMgrOQ
 DJqFMGgWkkGzkHQsYGRZxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHPtamjsYLy+J
 P8QowMGoxMPbwZ8aK8SaWFZcmXuIUYKDWUmE95EKUIg3JbGyKrUoP76oNCe1+BCjNAeLkjjv
 07xjkUIC6YklqdmpqQWpRTBZJg5OqQbGCe6KPu0piqufKnP1tu34wfCOpXqGoZpO67oI2VcH
 eqz4CosPzjLUeH51hWb/iW3c2p8WGrj7dMxw+SJmk/ti5rSjDMePZCbVPPVd3qPhWBbPHjtv
 ZbFB6qVNv9OePpv046uo851LB0VeyiS+PenWVX+k+d80Jp7Pto/8NjFKWcr4L715Z/M0JZbi
 jERDLeai4kQAn059LPkCAAA=
X-CMS-MailID: 20190828022055epcas2p25525077d0a5a3fa5a2027bac06a10bc1
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190828022055epcas2p25525077d0a5a3fa5a2027bac06a10bc1
References: <CGME20190828022055epcas2p25525077d0a5a3fa5a2027bac06a10bc1@epcas2p2.samsung.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i2na4-000rPg-GZ
Subject: Re: [f2fs-dev] [PATCH 5/9] block: support diskcipher
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
Cc: 'Ulf
 Hansson' <ulf.hansson@linaro.org>, 'Mike Snitzer' <snitzer@redhat.com>,
 dm-devel@redhat.com, 'Andreas Dilger' <adilger.kernel@dilger.ca>,
 'Alasdair Kergon' <agk@redhat.com>, 'Eric Biggers' <ebiggers@kernel.org>,
 linux-samsung-soc@vger.kernel.org, 'Herbert Xu' <herbert@gondor.apana.org.au>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 'Jaehoon Chung' <jh80.chung@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, 'Jaegeuk Kim' <jaegeuk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 'Jens Axboe' <axboe@kernel.dk>,
 'Theodore Ts'o' <tytso@mit.edu>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "'David S. Miller'" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 27, 2019 at 05:33:33PM +0900, boojin.kim wrote:
>
> Hi Boojin,
>
> I think the important thing to realize here is that there are a large
> number of hardware devices for which the keyslot manager *is* needed.
> And from the upstream kernel's perspective, supporting two different
> schemes for supporting the inline encryption feature is more
> complexity than just supporting one which is general enough to support
> a wider variety of hardware devices.
>
> If you want somethig which is only good for the hardware platform you
> are charged to support, that's fine if it's only going to be in a
> Samsung-specific kernel.  But if your goal is to get something that
> works upstream, especially if it requires changes in core layers of
> the kernel, it's important that it's general enough to support most,
> if not all, if the hardware devices in the industry.
>
> Regards,

I understood your reply.
But, Please consider the diskcipher isn't just for FMP. 
The UFS in Samsung SoC also has UFS ICE. This UFS ICE can be registered 
as an algorithm of diskcipher like FMP.

Following is my opinion to introduce diskcipher.
I think the common feature of ICE like FMP and UFS ICE, 
is 'exposing cipher text to storage".
And, Crypto test is also important for ICE.  Diskcipher supports
the common feature of ICE. 
I think specific functions for each ICE such as the key control of UFS ICE
and the writing crypto table of FMP can be processed at algorithm level.

Thanks for your reply.
Boojin Kim.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
