Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF5697B33D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Sep 2024 19:01:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqbZV-0005i7-3n;
	Tue, 17 Sep 2024 17:01:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1sqbZT-0005hh-D4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Sep 2024 17:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YmVCRhOac+MYDmIPzTgKY46t/QHaf9fEWdAUffOQcgk=; b=TxLmq6ECnrbWy0+exHG99SzMPK
 YTHgg9D5iRH9gL5WDziMaCB06SUi91JtGumXU4sPSuuo5w74g/03oR05BDfLkawovVJnxsE1liXIl
 Aacqey/2QifJHhzLdVrSHx7egcFsO9tADmo0M3C0Y3QdN/S+QHNHgtIAJ6DTj6X48Z3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YmVCRhOac+MYDmIPzTgKY46t/QHaf9fEWdAUffOQcgk=; b=CWznSr8rr01N4baTF0TAyX9dzm
 WFZY0Iq45hHxuweLJJjOgXcFB+6JQj33Gs+aF1GiT0SdFe2NLsu6W0X+kSM4ZBWDRSVUmLSLma8Ut
 77U6cKKG8b1bCbTLUx6XcRQy4wumv5G/5jO6x6WF68cI0r8Ei9DVtfiNm/YNp98kfUok=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqbZS-00039A-CS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Sep 2024 17:01:00 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240917170046epoutp02e2f48ec53dc6a854cd55d91bd2f860d7~2Fq6XFGpk0595505955epoutp02Z
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Sep 2024 17:00:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240917170046epoutp02e2f48ec53dc6a854cd55d91bd2f860d7~2Fq6XFGpk0595505955epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1726592446;
 bh=YmVCRhOac+MYDmIPzTgKY46t/QHaf9fEWdAUffOQcgk=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=RF9zbai+v6LoTnajWp8Rj5JJfFuc4BaeLkHhWVy6sonQg6cqWndBV9PWC+7rcAb42
 7hITZYMq53feMAeWyfn+kELWu0JTGJ/C4Y+B53Oc3ZTcQrIMTXtW13+9lj5IeX8HM0
 NTULC8eu5gyJrsHH8//N/TP8fDOWYyOgh2zEqWJM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20240917170045epcas5p46d074371c06dae0929b985e3af37b8f4~2Fq5c7pw43173431734epcas5p4H;
 Tue, 17 Sep 2024 17:00:45 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4X7Shq3k39z4x9Pp; Tue, 17 Sep
 2024 17:00:43 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.DE.09640.BB5B9E66; Wed, 18 Sep 2024 02:00:43 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20240917170042epcas5p35e7cf09a0058a59c555598d334a81fa0~2Fq3IhSBg1471614716epcas5p31;
 Tue, 17 Sep 2024 17:00:42 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240917170042epsmtrp2e823983f04747879bb98e3cad40c3a11~2Fq3HqBOW2449624496epsmtrp2j;
 Tue, 17 Sep 2024 17:00:42 +0000 (GMT)
X-AuditID: b6c32a49-aabb8700000025a8-d0-66e9b5bbf51c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 D0.C8.19367.AB5B9E66; Wed, 18 Sep 2024 02:00:42 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240917170039epsmtip2b32eef702379390531969e70e3dfb72a~2Fq0Avebe0319803198epsmtip2S;
 Tue, 17 Sep 2024 17:00:39 +0000 (GMT)
Message-ID: <315f8f38-2cfd-1ef9-3304-d16b9b0b56e6@samsung.com>
Date: Tue, 17 Sep 2024 22:30:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
From: Kanchan Joshi <joshi.k@samsung.com>
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <b438dddd-f940-dd2b-2a6c-a2dbbc4ee67f@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUxTVxz1vvf6AaTLo4JcMWP1bYygo7RaysWBskHcExhjM1myoYEKT2CU
 tulrx7pgwCHgRFDLxK3rhDnBDIJAEeVDEq0yJkqQuakgIIwyM7AOKW4R1K2lOPnv/M49J+f3
 kcvHhSU8f36WSsdoVQolxfUkzl4KDgrpbP1zt2S2GKL6kUNcNH1pFqDKmcc4+nfkHoYGL7Rj
 6Mf6bgx9e6wQQ7ZGE46aD/HRxLCDhx7X1vGQ0XoToK6h9eiXE++g811XCFRVO8lDpbfauOhU
 zzMMnV2owtHp6b8I1P+0h4P6TWZe9Cr6xq/xdP9oM0FXGnu59I0+PW2p+5JLt5zMpzurHRjd
 OVjApR9ODhF0+Zk6QF+rvsyjHZYA2mKzY0mCj7MjMxlFOqMVMao0dXqWKiOKit+eEpMSJpdI
 Q6QRKJwSqRQ5TBQVm5AUsjVL6ZyZEn2qUOqdVJKCZanQzZFatV7HiDLVrC6KYjTpSo1MI2YV
 OaxelSFWMbpNUolkQ5hTmJqd2VTYyNGMCj6rudsFCkCR1wHgwYekDA78dJU4ADz5QrITwKM2
 E89dzALoOG99Ucz+0Yk9twxX2bnuh3YATx80LhV2AHuu9nJdKgG5GU4/KsJdmCAD4ZC5EXPz
 3vDKNzbChX3JXXD+NzNw4ZVkFCwtu7XI46QfHLJVOfV8PpcMhtcr9C7ah6Tg5FQfcGXhZC0B
 ax72c10aD3ILHBj3dltfgefsZtylgeQpD2if6eW5u46F8xfKOG68Ek71nFni/aHjQRfXjbPh
 2O9jhBvnwbaW8iX9Fljw5DbHlYU7+2nsCHVnvQTLFmyLbUJSAPcXC93qtXDUOLnk9IPjX5/k
 uCU07N67emnTOLx8sBgcBiLTsqWYlg1vWjaN6UVwNSDqwGpGw+ZkMGyYRqpicv+/d5o6xwIW
 f8S6bW1gZGxGbAUYH1gB5OOUjyBqYXK3UJCuMHzOaNUpWr2SYa0gzHmdI7i/b5ra+aVUuhSp
 LEIik8vlsoiNcinlJ5gu+i5dSGYodEw2w2gY7XMfxvfwL8DEHWnbiEdP3gwQ/1wy9FS9B7/J
 tBt070/E3plp9spbYwwNuDMsjT0a9Em7d+BM0465Fa9n3Y8TV87LIm4PoKZr7K7EkuTS1uGE
 d+cszWWitwzy0rW24wsN5UVpzV+1jKXsTQ4dlGxYNdegNGRVVuzsbp1K9NYd/mG+dFP+Fws1
 udIGz6SLXvnxscK22sTo3geJHJE5wtobfoKK9w9++2KY2li83suAA2EAL+Y14/Xku2KJI+5v
 3wo/2ZHpyB0xfccU5z4w+PyTHLfH2xx9f/y4oT4uZOJDfjQRnsoEbX85YY048NlYR+q9ncUr
 vvfaP9CSs7EwZF/ue+Y37KrovI9e3dfgRxFspkK6Dteyiv8A5S0NupoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsWy7bCSvO6urS/TDL7NU7VYfbefzeL14U+M
 FtM+/GS2+H/3OZPFzQM7mSxWrj7KZDF7ejOTxZP1s5gtNvZzWDy+85nd4ueyVewWkw5dY7TY
 e0vb4tIid4s9e0+yWMxf9pTdovv6DjaL5cf/MVls+z2f2WLd6/csFuf/Hme1OD9rDruDmMfl
 K94e5+9tZPGYNukUm8fls6Uem1Z1snlsXlLvsXvBZyaP3Tcb2Dw+Pr3F4tG3ZRWjx5kFR9g9
 Pm+S89j05C1TAG8Ul01Kak5mWWqRvl0CV8aG5vWsBfd4K5be38vYwNjK3cXIySEhYCJxZ/5b
 ti5GLg4hge2MEof2NzNBJMQlmq/9YIewhSVW/nvODlH0mlHi+KM9zCAJXgE7iddfW8FsFgFV
 iVtz1jNBxAUlTs58wgJiiwokSey53wgWFxawlejuvQ4WZwZacOvJfKA4BwebgKbEhcmlIGER
 ASWJp6/OMoLsYhZYxiJxcMpbsBohgd3MEl3mICangL3ExYeCEFPMJLq2djFC2PIS29/OYZ7A
 KDQLyRGzkCybhaRlFpKWBYwsqxhFUwuKc9NzkwsM9YoTc4tL89L1kvNzNzGCk4BW0A7GZev/
 6h1iZOJgPMQowcGsJMJr+/tpmhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe5ZzOFCGB9MSS1OzU
 1ILUIpgsEwenVANT7t3tr45fbZL7ord+Z2aZ2n7XJ3vfnzZbf/XLHOboq6EJETsCxaQ8uvfm
 l1ws+zFtn0tVUmDSzmMHllyV/vnkjITi9NMxej3af64HTNTkTnBx2Khl5/b24z4zydv9ZU5a
 X/bIzf/7g1Xe4NpG1x2yN11MT58MeWtn9P3g7cI1NnMOHapp/Wn8My6u3f1HglpFzwfNh+9U
 1JzsF5xYUMd8ddqa709msDBJPwuYl7P1jv3iqT+Kz6t7R827XMf2vufRiogJXu1bD58/xBmz
 7VLphlMbDgQuZKp9fUBjlXTB2Rshd2sPTaqVC2Y6Nnl9vr1FkNWakPIw4WNSC/1Uri5btZZd
 Q4pBzaI7KDLXRX+1qRJLcUaioRZzUXEiAEVaYZBxAwAA
X-CMS-MailID: 20240917170042epcas5p35e7cf09a0058a59c555598d334a81fa0
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c@epcas5p3.samsung.com>
 <20240910150200.6589-5-joshi.k@samsung.com> <20240912130235.GB28535@lst.de>
 <e6ae5391-ae84-bae4-78ea-4983d04af69f@samsung.com>
 <20240913080659.GA30525@lst.de>
 <4a39215a-1b0e-3832-93bd-61e422705f8b@samsung.com>
 <20240917062007.GA4170@lst.de>
 <b438dddd-f940-dd2b-2a6c-a2dbbc4ee67f@samsung.com>
X-Spam-Score: -4.6 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/17/2024 9:33 PM, Kanchan Joshi wrote: > On 9/17/2024
 11:50 AM, Christoph Hellwig wrote: >>>> But if we increase this to a variable
 number of hints that don't have >>>> any meaning (and even if th [...] 
 Content analysis details:   (-4.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sqbZS-00039A-CS
Subject: Re: [f2fs-dev] [PATCH v5 4/5] sd: limit to use write life hints
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, sagi@grimberg.me, martin.petersen@oracle.com,
 gost.dev@samsung.com, jlayton@kernel.org, vishak.g@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 chuck.lever@oracle.com, javier.gonz@samsung.com, viro@zeniv.linux.org.uk,
 linux-scsi@vger.kernel.org, kbusch@kernel.org, jaegeuk@kernel.org,
 Nitesh Shetty <nj.shetty@samsung.com>, bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/17/2024 9:33 PM, Kanchan Joshi wrote:
> On 9/17/2024 11:50 AM, Christoph Hellwig wrote:
>>>> But if we increase this to a variable number of hints that don't have
>>>> any meaning (and even if that is just the rough order of the temperature
>>>> hints assigned to them), that doesn't really work.  We'll need an API
>>>> to check if these stream hints are supported and how many of them,
>>>> otherwise the applications can't make any sensible use of them.
>>> - Since writes are backward compatible, nothing bad happens if the
>>> passed placement-hint value is not supported. Maybe desired outcome (in
>>> terms of WAF reduction) may not come but that's not a kernel problem
>>> anyway. It's rather about how well application is segregating and how
>>> well device is doing its job.
>> What do you mean with "writes are backward compatible" ?
>>
> Writes are not going to fail even if you don't pass the placement-id or
> pass a placement-id that is not valid. FDP-enabled SSD will not shout
> and complete writes fine even with FDP-unaware software.
> 
> I think that part is same as how Linux write hints behave ATM. Writes
> don't have to carry the lifetime hint always. And when they do, the hint
> value never becomes the reason of failure (e.g. life hints on NVMe
> vanish in the thin air rather than causing any failure).
> 

FWIW, I am not sure about current SCSI streams but NVMe multi-stream did 
not tolerate invalid values. Write command with invalid stream was 
aborted. So in that scheme of things, it was important to be pedantic 
about what values are being passed.
But in FDP, things are closer to Linux hints that don't cause failures. 
With the plain-numbers interface, the similarities will increase.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
