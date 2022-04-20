Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EF4508581
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 12:08:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nh7G1-00077Q-PX; Wed, 20 Apr 2022 10:08:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1nh7Fc-00073v-8Z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 10:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bW2b+5OBh2ynYp6yBvZ8NK2jOQWjuLj8dvZS8cnJnn8=; b=GhukJgpumcxW6Xk427Za5chbas
 /o3rnmuMzQQVVqDml2Z1p+pAryFjj9a+HeDc01c+Y5E+IJc5NOe1Yu4Z7JY/yfMpPrEGefQL+02rm
 7kr4kSWtTvcDz0SoZXnJDKT5imuAgr5k722j9uqfEZ/SHpAcnPbvzYtormw9WGllAjQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bW2b+5OBh2ynYp6yBvZ8NK2jOQWjuLj8dvZS8cnJnn8=; b=dsrNlHFX4hbHD1PpqiFjTEBlv1
 2ODn8tkmkqmBBfrUx7sagUgHIG3xat8bEtr8gb/04I4F8zwx2nBezFAxDWZXdZm+Mpj601NQqoG83
 R4/2POOyY3AvtFv1xgWj7YD6ZJfLrUt+rTyyuqmnBGdyDLmD/uuaQF0rIbKBRc3lXyjg=;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nh7FY-0008Qb-Kf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 10:07:55 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220420100744euoutp02b6af8a31ea71c0302bf6143f3f14020c~nktyI9bYV2060420604euoutp022
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Apr 2022 10:07:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220420100744euoutp02b6af8a31ea71c0302bf6143f3f14020c~nktyI9bYV2060420604euoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1650449264;
 bh=bW2b+5OBh2ynYp6yBvZ8NK2jOQWjuLj8dvZS8cnJnn8=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=RjNwaO48qW5+WwzQKYO00gXMLi4Lf8wMBOiG9n2GdtXqaK1snMJatZ+1BvfjsGTXH
 1lFn3FXIqIEOmqWyaIjgZZWg95FxyWXTtg8X1SxEdHSAwFabSndLm1JQhTr7XGayXm
 JsLehJ5MOy5mUdDHzZgeAASkleBw6Q5+hzb5e16w=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220420100743eucas1p15fd587228069732ca4c5f45d27f3ab42~nktxRta9t1720317203eucas1p18;
 Wed, 20 Apr 2022 10:07:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C2.B5.09887.F6BDF526; Wed, 20
 Apr 2022 11:07:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220420100741eucas1p2734822cec66de8539ef1a05009dc4165~nktvrjjN_1956719567eucas1p2E;
 Wed, 20 Apr 2022 10:07:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220420100741eusmtrp17e95c5a6e3b7b566a2a6169bc94d4c3b~nktvq_VsA0752807528eusmtrp1X;
 Wed, 20 Apr 2022 10:07:41 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-10-625fdb6faf60
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8B.B6.09404.D6BDF526; Wed, 20
 Apr 2022 11:07:41 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220420100741eusmtip164c10b706b79cf2589fd8f5b9ee7257a~nktvjEL0Y1932119321eusmtip1i;
 Wed, 20 Apr 2022 10:07:41 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.178) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 07:48:14 +0100
Message-ID: <d924fad5-2eed-f850-c191-ee72852393ae@samsung.com>
Date: Wed, 20 Apr 2022 08:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <Yl9Aw0vLdxM5Fexg@google.com>
X-Originating-IP: [106.210.248.178]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djPc7r5t+OTDB5vFLdobf/GZPFk/Sxm
 i0uL3C1uTHjKaLHm5lMWB1aPnbPusntsWtXJ5rF7wWcmj/YD3UwBLFFcNimpOZllqUX6dglc
 Gc3zH7EX7GatODqnj62BcTVLFyMnh4SAicTfxyeZuhi5OIQEVjBKtDbdYIZwvjBKHJk5Ayrz
 mVGie/9BVpiW/mmvoKqWM0pcPbmaEa7q+4IWVghnN9CwmdOZQFp4Bewktu34yg5iswioSuz4
 8JsFIi4ocXLmEzBbVCBC4tetR2A1wgKpEltvHGUGsZkFxCVuPZkPNkdEQEXi0KLL7CALmAX2
 MUo83DwZqIiDg01AS6KxE6yXE8ic9fU6G0SvpkTr9t/sELa8xPa3c5ghXlCW+LHhNBuEXSux
 9tgZsJkSAm84JL5NOgJV5CKx/tEERghbWOLV8S3sELaMxOnJPdDgq5Z4euM3M0RzC6NE/871
 bCAHSQhYS/SdyYEwHSX+9fFAmHwSN94KQpzDJzFp23TmCYyqs5BCYhaSj2ch+WAWkg8WMLKs
 YhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECEw1p/8d/7KDcfmrj3qHGJk4GA8xSnAwK4nw
 hs6MTxLiTUmsrEotyo8vKs1JLT7EKM3BoiTOm5y5IVFIID2xJDU7NbUgtQgmy8TBKdXANKW7
 UpNjan7UivRtWfm7mC5/i11muYjvVPDn+ltVaUucgq8EtFntUkoPLlpzMfSMnWlNIuMKhYw/
 y5fv/ai+cqHhHdfo3p1JnlleskdTpCwrJi4rFS9jYIy3mvXNT33+ZfOHS8XvJX9eOK/Hdbru
 MVlXS4dtU++cP8rEUtQuMCWcQffJmv4k9sdP0xe8F5D2T7h9PLfl9t32Sw7u26Inz0pYvGLe
 p99/S65JPe+9Y1pSo5bY1zaV7cT7mIJHZ6MUE8xP3Ge5lKWdlt645s2rRw39xwWFzHq47LkM
 xU2tbrC7N9+P1LCQuD99Y0d74ZTlEj07LXdtbb6nGdj9qlV/17vNHBtnbeI5IrR7q662Ektx
 RqKhFnNRcSIA+/Y2o6QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7q5t+OTDHa91rBobf/GZPFk/Sxm
 i0uL3C1uTHjKaLHm5lMWB1aPnbPusntsWtXJ5rF7wWcmj/YD3UwBLFF6NkX5pSWpChn5xSW2
 StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gc3zH7EX7GatODqnj62BcTVL
 FyMnh4SAiUT/tFfMXYxcHEICSxklGpu+s0IkZCQ+XfnIDmELS/y51sUGUfSRUeL4g2PsEM5u
 RomNU5exgVTxCthJbNvxFayDRUBVYseH3ywQcUGJkzOfgNmiAhESy3ZNBbOFBVIltt44ygxi
 MwuIS9x6Mp8JxBYRUJE4tOgy2AJmgX2MEg83T4a67xqTxP3nP4AyHBxsAloSjZ1gyziBzFlf
 r7NBDNKUaN3+mx3ClpfY/nYOM8QLyhI/Npxmg7BrJV7d3804gVF0FpL7ZiG5YxaSUbOQjFrA
 yLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMEa3Hfu5ZQfjylcf9Q4xMnEwHmKU4GBWEuEN
 nRmfJMSbklhZlVqUH19UmpNafIjRFBhIE5mlRJPzgUkiryTe0MzA1NDEzNLA1NLMWEmc17Og
 I1FIID2xJDU7NbUgtQimj4mDU6qBSTJ6y3PHC0aL5bLPBPq+c92TsuXM5atrj7JY29yqcnXJ
 dlLrmjPzX90Jnov78tnfPj68aPYmv9+7fI9+4X/EOo81IHtKi3JMj17j3yNC1RIfHIXltvqt
 6X7Zk5yVdoGnm8HrqVdX96ct6X+vrzBVnnR9Q9P+0zeDUw5ci+lwsEwVaBBpa90VeYL/6Z4/
 X436jbgjtks1RC1YwP6BiePxx+0/Z6s+cz7y9uQn2/Ubcpom2M1/bfz4zo3OK5rdeRqL8ruz
 fxzUnF5698LyTZJ1l9WKGW+tvG5VYpd6gnOdmsaLnJB7nVc+vnVVO1+1QuWP8LIp5W1Hjhpe
 Lt7DYXLu8WpO7xanlcnHFfMTPGOWJyqxFGckGmoxFxUnAgAycY0RWgMAAA==
X-CMS-MailID: 20220420100741eucas1p2734822cec66de8539ef1a05009dc4165
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
 Content preview:  On 2022-04-20 01:07, Jaegeuk Kim wrote:>> TL;
 DR until we change
 some calculations in f2fs for zoned device to be >> generic, we need to bail
 out during mkfs time for non power of 2 zone >> size device [...] 
 Content analysis details:   (-9.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.12 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.12 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
X-Headers-End: 1nh7FY-0008Qb-Kf
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

On 2022-04-20 01:07, Jaegeuk Kim wrote:>> TL;DR until we change some
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
