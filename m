Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9054FF588
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 13:15:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neaxp-0001VK-DP; Wed, 13 Apr 2022 11:15:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1neaxn-0001VD-Ke
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 11:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RyKCPR/im2K/bdW2nJB5bz+4Plg8hWkZCXV7bcVrMPc=; b=Qufp/gPW7KBhCII5jTuc10L0CN
 jLja3RABqtqjLC1n7hSJn3QhZuHH1w+CoBXaCc67l4kpNeBGFNwJnbcWc3xjEdrEE2H70BhSCeEub
 1g9TrtZ0YRudbXU3G8oVEmxdfoYs7yjYxwOyEzURDSwM9WmrIMk9NOikY4n1bxkfazKs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RyKCPR/im2K/bdW2nJB5bz+4Plg8hWkZCXV7bcVrMPc=; b=hkJJqp9h8rTEoxWXHrb++q8dmw
 xoKSMsP6rqaUAeDchrZI4Hs/0LgGISTGtXMfaprTqoBtRlwHJEYuVGtStWy6dqQy28nWRUfv5jXHp
 nEqLs6th9iXfbpbe6RthMeeIr4VKABhaGUkwvONSOwcJ/KarcRM0zVGzgjXFEhQvyiPY=;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neaxn-00F9Vh-3L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 11:15:08 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220413111455euoutp02839b91c4f8d5f79cba155e113a7b2963~lcHcoMyl61778817788euoutp02Q
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Apr 2022 11:14:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220413111455euoutp02839b91c4f8d5f79cba155e113a7b2963~lcHcoMyl61778817788euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649848495;
 bh=RyKCPR/im2K/bdW2nJB5bz+4Plg8hWkZCXV7bcVrMPc=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=Vq8imfuh0XOXhfnOR3d64a3T0wrIvgSFLsWvBY+qtC6k90tur39m62gT0MtJJgGa7
 WuMGiLwuKvRlMAL+xkM1PGzZkv5ExoMFx/CAnRhI6ufj5iVjHRzsiEE76vddFX2e+o
 a7tVAX5Ja0KsAs8WcqFEIBQDepGNZJnnvBKc/1l4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220413111455eucas1p21bd2c9941eb44814dcdfdb739f6e3e26~lcHcVnARz1190511905eucas1p2n;
 Wed, 13 Apr 2022 11:14:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id F5.2C.10009.FA0B6526; Wed, 13
 Apr 2022 12:14:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220413111454eucas1p23306b4a4ece383270821176d0ec3ec64~lcHb_iGqJ1321113211eucas1p2h;
 Wed, 13 Apr 2022 11:14:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220413111454eusmtrp1d977721e224e58637bbe9427ba3e16a2~lcHb9yFtV1778917789eusmtrp12;
 Wed, 13 Apr 2022 11:14:54 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-98-6256b0af4946
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E8.E5.09404.EA0B6526; Wed, 13
 Apr 2022 12:14:54 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220413111454eusmtip2f18db6e6db9b88762ddd72b6192733e5~lcHb2pfam1377313773eusmtip2H;
 Wed, 13 Apr 2022 11:14:54 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.178) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Apr 2022 12:14:51 +0100
Message-ID: <5a86b90d-ec5d-6c83-e8dd-0ced976059fe@samsung.com>
Date: Wed, 13 Apr 2022 13:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <YlWp468pKUrRLFTH@google.com>
X-Originating-IP: [106.210.248.178]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduzned31G8KSDJ6t4LJobf/GZPFk/Sxm
 i0uL3C1uTHjKaLHm5lMWB1aPnbPusntsWtXJ5rF7wWcmj/YD3UwBLFFcNimpOZllqUX6dglc
 GSt+LmMsOM9R8eD5QdYGxndsXYwcHBICJhIbzqd1MXJxCAmsYJSYO2M9K4TzhVHi7452pi5G
 TiDnM6PE/e9hIDZIw/vd99kgipYzSmy4cpcdrujXPhaIxG5GiakzP7KCJHgF7CRaNh1lA7FZ
 BFQlbl6/AxUXlDg58wkLiC0qECHx69YjdpCThAXyJOZMjAEJMwuIS9x6Mh/sCBEBFYlDiy6z
 g8xnFuhjlFj+YgIjSD2bgJZEYyfYDZxA5pr509ghejUlWrf/hrLlJba/ncMM8YCyxI8Np9kg
 7FqJtcfOgM2UEHjBIfH/xEomiISLxPrrN6BsYYlXx7ewQ9gyEqcn97BA2NUST2/8ZoZobmGU
 6N+5Hhqm1hJ9Z3Igahwljvx+xwgR5pO48VYQ4h4+iUnbpjNPYFSdhRQSs5C8PAvJC7OQvLCA
 kWUVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYJI5/e/4px2Mc1991DvEyMTBeIhRgoNZ
 SYS3Xz00SYg3JbGyKrUoP76oNCe1+BCjNAeLkjhvcuaGRCGB9MSS1OzU1ILUIpgsEwenVANT
 /MfLdyuuiF2UUr0WLjzj5v15hzKvcSf8DlEsWHpQ0Xyq24osLc/T/JqhKTVXk8KTbih8PyK8
 MD/hwv5wrheR7+wbzp/uZ97uwXHJ40BFuYsnk4TCq1C/T59mTzeKPPLn3KH/RyP4Pr0UOKzY
 fOdJs1z9X9OCxkm8+5+bWk2taT+xZa34Pu2KkI3dG9dkNX9TmzPFz0NKz+WeyNQa0UfnTx7b
 ueCJou36OZkBApqu6vLhFSX8al0Nz/hOLTA9KrokIOQd88nfAgJaG3aabS6cdPnHlFpb/foX
 U05xhEdr75fyqOhbynOvudhD3rZq4bxDG6LVuiLKZjFtFp9mHVIissv4hex7pR+TPzvPaGlX
 YinOSDTUYi4qTgQAINvy06EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xe7rrNoQlGTw4bWTR2v6NyeLJ+lnM
 FpcWuVvcmPCU0WLNzacsDqweO2fdZffYtKqTzWP3gs9MHu0HupkCWKL0bIryS0tSFTLyi0ts
 laINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mlb8XMZYcJ6j4sHzg6wNjO/Y
 uhg5OSQETCTe774PZHNxCAksZZTY/3kyM0RCRuLTlY/sELawxJ9rXVBFHxklpvw+zgiSEBLY
 zSixbGcqiM0rYCfRsuko2FQWAVWJm9fvsELEBSVOznzCAmKLCkRILNs1FcwWFsiT2D1hExOI
 zSwgLnHryXwwW0RAReLQosvsIMuYBfoYJZa/mMAIsXk1o8S6y0uApnJwsAloSTR2gl3HCWSu
 mT+NHWKQpkTr9t9QtrzE9rdzoL5Rlvix4TTUy7USr+7vZpzAKDoLyX2zkNwxC8moWUhGLWBk
 WcUoklpanJueW2ykV5yYW1yal66XnJ+7iREYoduO/dyyg3Hlq496hxiZOBgPMUpwMCuJ8Par
 hyYJ8aYkVlalFuXHF5XmpBYfYjQFBtJEZinR5HxgisgriTc0MzA1NDGzNDC1NDNWEuf1LOhI
 FBJITyxJzU5NLUgtgulj4uCUamDaKey1+khvhfi7cHGvkD2/bts2KxryNGxva3OYzxcQyeFb
 5xpZOXF+0yQNud76SHfzRYYny7VCJxybfm+foNqO4oOXTB3b/feF/T6kKmg+s319xWYLPwE2
 R4Ybfys7mo5MqVbUf9k1dwm/6rrfoQ2pk83Xbc1p61vwPa1B1OH217+fVuw4vdY0s7JA10/2
 rOQyG46pHEzGm2oDH8wXvnGr4Nx/gSeaHCn2l2tPN5vYGujUfN3g1RTcdPnUvp8nOZ7Odqpd
 u0fpQLHg3aBS9mnv7zGbd21eFVfJvT/qyZnVf12k9Nrl114wt9yYEvnh3QbPRcaSbw5O6Jop
 o7tb6guHjtmVzS6LtdK7XFsZ1iuxFGckGmoxFxUnAgBUlgqPWQMAAA==
X-CMS-MailID: 20220413111454eucas1p23306b4a4ece383270821176d0ec3ec64
X-Msg-Generator: CA
X-RootMTR: 20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad
References: <CGME20220412112746eucas1p14f52961641ef07fdc7274e75887da9ad@eucas1p1.samsung.com>
 <20220412112745.44108-1-p.raghav@samsung.com> <YlWp468pKUrRLFTH@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, On 2022-04-12 18:33,
 Jaegeuk Kim wrote: > On 04/12, 
 Pankaj Raghav wrote: >> F2FS only works for zoned devices with power-of-2
 zone sizes as the >> f2fs section needs to be a power-of-2. > > The sectio
 [...] Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.12 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.12 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1neaxn-00F9Vh-3L
Subject: Re: [f2fs-dev] [PATCH 0/3] f2fs-tools: return error for zoned
 devices with non power-of-2 zone size
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
Cc: javier.gonz@samsung.com, Damien.LeMoal@wdc.com, mcgrof@kernel.org,
 pankydev8@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On 2022-04-12 18:33, Jaegeuk Kim wrote:
> On 04/12, Pankaj Raghav wrote:
>> F2FS only works for zoned devices with power-of-2 zone sizes as the
>> f2fs section needs to be a power-of-2.
> 
> The section size actually supports multiple 2MBs, not PO2.
> 
Thanks a lot for the clarification. I will remove this statement in the
next revision.

I was partially misled by [1] where it is stated "Segments are collected
into sections. There is genuine flexibility in the size of a section,
though it must be a power of two.".

Just FYI, when I did a quick check, there are some assumptions in the
zoned support for f2fs which assumes the zoned device size is a power of
2 such as in the __f2fs_issue_discard_zone. So if I am not wrong, when
we remove those assumptions in f2fs for zone size, then everything
should work fine provided the zone size is a multiple of 2MB. Am I
missing something here?

I am new to f2fs but is there testsuite that I can run for f2fs apart
from the two tests listed in (x)fstests?

[1] [https://lwn.net/Articles/518988/](An f2fs teardown)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
