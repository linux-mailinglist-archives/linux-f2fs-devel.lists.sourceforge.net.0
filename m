Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F438508580
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 12:08:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nh7G0-0007Xd-7c; Wed, 20 Apr 2022 10:08:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1nh7Fn-0007XF-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 10:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PxwUNbMe8vOlOlOFLeHGPIdPOvSMIJjY/NQdG+XDZZM=; b=T66MxmkOtuYsKivH/XMeb7Mhb0
 MZuwzJwAlA8BctTqNHEK1kCTUfUF+z9xP8lu+9++fplIN6Be+ZxAu3CAqBArwvrR9qzN0ycFNUlby
 VDTs8fYFBXAE8vNX9AjSSsurb3WIUG82QBz6/xzQ1cqeDVcAJjZf82F95/f+OjLe3/5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PxwUNbMe8vOlOlOFLeHGPIdPOvSMIJjY/NQdG+XDZZM=; b=ArwJwk5zun8MW//ZX71qbZtxCs
 sQq9gmrLu51YNAWK+vtVV8L+ORXdQChT6A6Gj7YB5H7GVj84bgd+M37zFCaqrWLDxt0T1K28HuuFW
 /mUXxYRS8hDx0Q8SzP9dRKHCyCYX1F1NuweNLk8x0KLd/njdJKZhCjnFR7ajqv7YOyBw=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nh7Fd-0008Qm-1l
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 10:07:59 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220420100750euoutp0167537825c09bcc5e41092ae9d395635a~nkt3-qtuA1227812278euoutp01H
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Apr 2022 10:07:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220420100750euoutp0167537825c09bcc5e41092ae9d395635a~nkt3-qtuA1227812278euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1650449270;
 bh=PxwUNbMe8vOlOlOFLeHGPIdPOvSMIJjY/NQdG+XDZZM=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=P7aPZC/eDwRWYsEMs1l+peCCGXF5XEGlnPbNLMxL+zsXTknF8wGCDik3X9YSp2pz2
 4VvkCF7TGv1geCckYhvSlw4SszaIW+DVseW9GoVimfZb6D8iy4mXTvEJnKYrzhea2s
 zD4tFnqfySUrcOrIJC4LgQiZL2MpQMys/Ju4+eXQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220420100749eucas1p198c75ac955ab9ea0ee739c68530e1398~nkt3KLFGz2324923249eucas1p1F;
 Wed, 20 Apr 2022 10:07:49 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D8.C9.10009.57BDF526; Wed, 20
 Apr 2022 11:07:49 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220420100748eucas1p2f1623a57d6bccea7f2e2676fbbc78781~nkt2OA2qQ2183921839eucas1p2C;
 Wed, 20 Apr 2022 10:07:48 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220420100748eusmtrp1181163780344259c26db7f26bc10d60b~nkt2NcO5-0763307633eusmtrp1x;
 Wed, 20 Apr 2022 10:07:48 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-61-625fdb758950
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 0E.D6.09404.47BDF526; Wed, 20
 Apr 2022 11:07:48 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220420100748eusmtip27b65181726cb10202e66040cf2afff61~nkt2G6a6q0178101781eusmtip2I;
 Wed, 20 Apr 2022 10:07:48 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.43) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 09:30:31 +0100
Message-ID: <b33b76e3-fd6f-b175-3fb6-4324864af17c@samsung.com>
Date: Wed, 20 Apr 2022 10:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <Yl9Aw0vLdxM5Fexg@google.com>
X-Originating-IP: [106.210.248.43]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduzned3S2/FJBus3qlq0tn9jsniyfhaz
 xaVF7hY3JjxltFhz8ymLA6vHzll32T02repk89i94DOTR/uBbqYAligum5TUnMyy1CJ9uwSu
 jNurXrMV7GWtODqnj62BcTVLFyMHh4SAicT9CT5djFwcQgIrGCXWN3cxQThfGCWe9t5mgXA+
 M0pcPzwByOEE67h65DlUYjmjxJWNG9ngqm7MvsQO4exilPg96QgrSAuvgJ3EwfunWUEWsgio
 SjzaUQ4RFpQ4OfMJ2FRRgQiJX7cesYPYwgKpEltvHGUGsZkFxCVuPZnPBGKLCKhIHFp0GWw+
 s8A+RomHmyczg8xkE9CSaOwE6+UEMmd9vc4G0asp0br9NzuELS+x/e0cZoiflSQ2TuCHeKZW
 Yu2xM2AjJQQ+cEisPXeFESLhIrGs+TYzhC0s8er4FnYIW0bi9OQeaEhUSzy98ZsZormFUaJ/
 53o2iAXWEn1nciBMR4l/fTwQJp/EjbeCENfwSUzaNp15AqPqLKSAmIXk4VlIHpiF5IEFjCyr
 GMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcxApPM6X/HP+1gnPvqo94hRiYOxkOMEhzMSiK8
 oTPjk4R4UxIrq1KL8uOLSnNSiw8xSnOwKInzJmduSBQSSE8sSc1OTS1ILYLJMnFwSjUwJfw5
 vF0y78DKsOgu83jhU8dNpdfen3jlo+TkhX63snYkr9+aVcQltIdlnoW2xLOpz+I/njXtXMy2
 T/DgTK5TNsevpDjoTvvRbaR28sXay8Jaes2Xz+xwOujR8Z1Fm2uu1iGNvSwZGcqMHKv71uUc
 5HrsF/fi1Iw5sruTbfetmrOSY+mEDd/4Eq8+PGn9e060QAHPqullbb88jj3PK11vYRtTozg/
 Y+cEPuPGozzzAvQ6GMV8HLVeT1SS/R7Zs3pe462Qlwpxj1RXZV9NfvDC4ZnP+lMa6dOOt7qf
 KPW5X2Sjcr1ROXjjf4ulWqvWm53cE3S/Yt6xC76zb1XPPPO68o/H3XnAFOp1fyv3itc9D5RY
 ijMSDbWYi4oTAXrX/+yhAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsVy+t/xe7olt+OTDBa0a1m0tn9jsniyfhaz
 xaVF7hY3JjxltFhz8ymLA6vHzll32T02repk89i94DOTR/uBbqYAlig9m6L80pJUhYz84hJb
 pWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jNurXrMV7GWtODqnj62BcTVL
 FyMnh4SAicTVI8+BbC4OIYGljBLfJ59lgkjISHy68pEdwhaW+HOtiw2i6COjxIcZv8ASQgK7
 GCVad1SA2LwCdhIH759m7WLk4GARUJV4tKMcIiwocXLmE7BlogIREst2TQWzhQVSJbbeOMoM
 YjMLiEvcejIfbK+IgIrEoUWX2UF2MQvsY5R4uHkyM8Tia0wS95//YAdZwCagJdHYCXYDJ5A5
 6+t1NohBmhKt23+zQ9jyEtvfzmEGKZcQUJLYOIEf4pdaiVf3dzNOYBSdheS8WUjOmIVk0iwk
 kxYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjM5tx35u2cG48tVHvUOMTByMhxglOJiV
 RHhDZ8YnCfGmJFZWpRblxxeV5qQWH2I0BQbRRGYp0eR8YHrIK4k3NDMwNTQxszQwtTQzVhLn
 9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgqg7cqXBqPt8j/SNP1P9MjZD4/cj1k+jVr/ychttP
 p4VPYDxSffvYMRvr6oeiqYvZwsLvsf26M/Hm+XcFVl0vlJYvPBI3PVle0Nag0ObcpAenHhts
 ENrKfzmpUlyr9H7/ZquEqy9d1+wS3DBP/pN95IH9r3Y4sv9dtyCe4Uub/PwdYjYflxm4pB55
 /vxNdecVlaUeUx4d/1Sz9MjJV+VfXJUKq5g+M8j3Z/9k+LR8ySYhD4N7tpmm/0NS1nXVzPNh
 2aJ9lpf/UBSf7z6Lov63sT+9nrgdCEvl369z+8+aopvTzB0Mvx7a59LGnqazJWY7j7BV4KJ/
 z5QbPjzz+TVfZE74dWFTz3O/FKa7n2LIva3EUpyRaKjFXFScCABRP6ZvVwMAAA==
X-CMS-MailID: 20220420100748eucas1p2f1623a57d6bccea7f2e2676fbbc78781
X-Msg-Generator: CA
X-RootMTR: 20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35
References: <CGME20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35@eucas1p1.samsung.com>
 <20220413122940.133981-1-p.raghav@samsung.com> <YlcCSR2rTqOgOoxX@google.com>
 <6f508044-5329-f864-3879-c42a59d52366@samsung.com>
 <Ylcoc0mfEIUS0e5Q@google.com>
 <41ba478d-f32d-cf10-8096-43fb98dd3114@samsung.com>
 <Yl9Aw0vLdxM5Fexg@google.com>
X-Spam-Score: -9.9 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-04-20 01:07, Jaegeuk Kim wrote: >> TL;DR until we
 change some calculations in f2fs for zoned device to be >> generic, we need
 to bail out during mkfs time for non power of 2 zone >> size devices. > >
 Ah, I see. Yeah, that in f2fs is [...] 
 Content analysis details:   (-9.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -4.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nh7Fd-0008Qm-1l
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

On 2022-04-20 01:07, Jaegeuk Kim wrote:

>> TL;DR until we change some
calculations in f2fs for zoned device to be
>> generic, we need to bail out during mkfs time for non power of 2 zone
>> size devices.
>
> Ah, I see. Yeah, that in f2fs is actually PO2. Let me merge this patch to
> force it before getting that relax. Thanks,
>
Thanks Jaegeuk. We are working on relaxing the po2 constraint for device
zone sizes for zoned devices in the kernel and we will be sending the
patches soon. I am not sure if we will relax these constraints in f2fs
during the first round of patches but we will eventually get there. When
that happens, we can relax these constraints also in f2fs-tools :).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
