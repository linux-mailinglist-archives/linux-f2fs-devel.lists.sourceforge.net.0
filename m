Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 937339E2BF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2019 10:33:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2WvJ-0001Db-GY; Tue, 27 Aug 2019 08:33:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <boojin.kim@samsung.com>) id 1i2WvH-0001DA-5z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 08:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GR9SjpQC1GTjk5IEkgnMXdybEfO+M4pHWDvq1CPw910=; b=FLuC/mXsQ+qh9wPlBQcXGdLC0Q
 ZsJoPEO8l2bQXQ8URw4iw8lAuGVQ/gajW/9qWa7pwBAWZQkB2Hpx2sixsPSmAF2gWGiL5aXPB5Xbi
 BoOZRFNpZIT6ZHb8AqdN5ueMvCgcezjhE88/sfQi9q/edFAEwM8rvG9IEf1iM3oIWmU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GR9SjpQC1GTjk5IEkgnMXdybEfO+M4pHWDvq1CPw910=; b=f
 rtP7UWpDMi8OA2IbVx9iBcHWNefg+D2CTmEgFYwmxWs/+ihcUpmJ7vWKM15ExIKz2CNxxyJuZFmfr
 mj6Ev5I7Bimbk3FwvBhHPqzFSXn2h+eWCupRoWurutKJ7lARQXgHjBp0aEkpdzhNNuJwOofGjhLq4
 buNRtI8vc7n074yc=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2WvD-00HRI9-10
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 08:33:51 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20190827083339epoutp01db44365ae130aa5911866934dfd4e5de~_uolEh5wy0188001880epoutp01W
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Aug 2019 08:33:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20190827083339epoutp01db44365ae130aa5911866934dfd4e5de~_uolEh5wy0188001880epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566894819;
 bh=GR9SjpQC1GTjk5IEkgnMXdybEfO+M4pHWDvq1CPw910=;
 h=From:To:Cc:Subject:Date:References:From;
 b=XieTwwnC97cxvDUoQbpnT0JSA6n+Fk+S7VdNGOrPiXy28E/jsUBLsPbTLacpBVmq4
 bf6CJ3I4sO0pBCk0d7teQmVffD1IwjV4K5W0fRZ5VVEidrxI4HknvQW4rKJFd+yMLG
 kHKbAIJD4wTWpVa9zk1tfYfSw5p+LvA6qAUlqSxI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20190827083338epcas2p1bd702579931911d8ebfa6ae3218ca896~_uokazBY00556005560epcas2p1x;
 Tue, 27 Aug 2019 08:33:38 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.190]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 46Hhwc2X60zMqYkg; Tue, 27 Aug
 2019 08:33:36 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 F2.4A.04068.FDAE46D5; Tue, 27 Aug 2019 17:33:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20190827083334epcas2p115d479190b9a72c886f66569add78203~_uog_kpL90324603246epcas2p1z;
 Tue, 27 Aug 2019 08:33:34 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190827083334epsmtrp1f673cf2781a7bd9de3d4862d267c9cf9~_uog9Ynxl2654126541epsmtrp1O;
 Tue, 27 Aug 2019 08:33:34 +0000 (GMT)
X-AuditID: b6c32a47-5a1ff70000000fe4-07-5d64eadfc43f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 07.26.03638.EDAE46D5; Tue, 27 Aug 2019 17:33:34 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20190827083334epsmtip186318bd933a57fdbaadd80afd23bc675~_uogrxHdu2027020270epsmtip14;
 Tue, 27 Aug 2019 08:33:34 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Satya Tangirala'" <satyat@google.com>
Date: Tue, 27 Aug 2019 17:33:33 +0900
Message-ID: <03b201d55cb2$1d4d31b0$57e79510$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdVcd9wJ7O+zjwFDS522TgVlMugkdw==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUwTdxjOr3e9nrguR0H2S/dhd9Nk1VDaasuPTUyjZl4y48jIdDGScmkv
 hawfl16LuizDIdRa2TqzGWZhDnSTWUNwhQFDSqQyGIyPRSIBo9PMzii6LxASiI71OMz473mf
 93nyfuUlMVWDQk2Wun2c1806aSINb7uizc2+NWUv0ne3pKHZR0EcNQ/2YejCzTCBfj45LEN1
 o5U4iv9ZK0dNXY8xdHzqBZRsjmBoYiEgR+E7DzA0OnpRgWJ3xuUofn0juvXrvAydOn2DQFfP
 7ERTp+dw1BUfwNFYZx2BehfDAH0x2i1D4Qs3CRT4bhagqup5Bepv2mtRM63nJ2VMZcsBpu3y
 eqY+5mfGhv1MLHqMYG6MdxFMy9flzKX6GRlTMfQjxvzVfY1gPmmNAmYm9lKBcp9zSwnH2jmv
 hnPbPPZStyOffrPQut1qMusN2YY8lEtr3KyLy6d37CrIfqPUmVoCrSljnf4UVcAKAp2zdYvX
 4/dxmhKP4MunOd7u5A0GXiewLsHvduhsHtdrBr3eaEopi50lE008P688ONb3EDsMaleHAElC
 ajP8aOSDEEgjVVQHgPfOHsGlYBrAip/qZCGwKhXMARjvyxCxaKhcuKeQRHEAByd+B1JwH8C5
 2k6FqCKojbClPwpEnJnCv109LxdFGPWvAianE7iYyKCMsCp0fKkETq2HwcV/CBErqTzYM9AA
 JJwOB04ll/QYtRa2/1GHSW1oYMfwg+UCOjgTGpZLmkxYeyyAicUgVUXCiiO9QDLsgPUnLi+b
 M+BUf6tCwmp4PxxYxuXw2rmzCslcDeDQwtPEJhi5exSIG8MoLWzuzJGW9wrsvb7c27MweOWJ
 QqKVMBhQScZ18MvpMZlEq+Hf1R9KNAOrex+CT8HLkRVDRlYMGVkxTOT/svUAj4IsjhdcDk4w
 8ptWnjoGlt5jw84O0DayKwEoEtDPKOGQrUglZ8uEQ64EgCRGZyqdOWyRSmlnD73PeT1Wr9/J
 CQlgSt3gBKZeY/Okns3tsxpMRrNZn2dCJrMR0c8pY6sn96soB+vj3uM4nvM+9cnIVerDIN02
 fu57SyxrbXLP0OdvJb552/bxtjaQ9Qt99N2yrdp9dw2O8FfrZm9nYo4n6WHLyeIcoX22/VEj
 z4Efgo7bI9pOy+sN5c9/++rg9sLduYXbbKhmT7Jmc4PHduazdw7WWCcDOosR2ot79Iv7df12
 VmjcbT4QfzzQ+OKilulJdERpXChhDRswr8D+B8P/EWw0BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRmVeSWpSXmKPExsWy7bCSnO69VymxBrcXqlh8/dLBYrH+1DFm
 i9V3+9ksTk89y2Qx53wLi8Xed7NZLdbu+cNs0f1KxuLJ+lnMFjd+tbFa9D9+zWxx/vwGdotN
 j6+xWuy9pW1x/95PJouZ8+6wWVxa5G7xat43Fos9e0+yWFzeNYfN4sj/fkaLGef3MVn0r77L
 ZtG28SujRWvPT3aL42vDHaQ8tqy8yeTRsrncY9sBVY8Fm0o9Lp8t9di0qpPN4861PWwem5fU
 e+xe8JnJo+nMUWaP9/uusnn0bVnF6PF5k1wAbxSXTUpqTmZZapG+XQJXxo21BQU/eSsuH3vD
 3MA4m7uLkZNDQsBEouXXC/YuRi4OIYHdjBKXOpcxQySkJLa274GyhSXutxxhhSh6ziix7Mtx
 FpAEm4C2xObjqxhBbBEg+9GllawgNrPANA6JXR/EQWxhASOJ1q5uJhCbRUBVouP/RzYQm1fA
 UuLgyYWMELagxMmZT4BmcgD16km0bWSEGCMvsf3tHKgbFCR2nH0NtUpP4nPXWahVIhKzO9uY
 JzAKzkIyaRbCpFlIJs1C0rGAkWUVo2RqQXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZwUtDS
 2sF44kT8IUYBDkYlHl6JM8mxQqyJZcWVuYcYJTiYlUR4c/QTY4V4UxIrq1KL8uOLSnNSiw8x
 SnOwKInzyucfixQSSE8sSc1OTS1ILYLJMnFwSjUwzu+6tX/72stKzWKemrbqW3KZJgeK77oX
 vnmD0Nlwy8yz3/uF2aTDk6Q9mT01RQOT/X7MEFBaXeui9Fboo4K3zMMdi7im3nry/vQ537ua
 eclstddPhB5dfjO89nnTGwtpTb6aTJ2Dh/PtuYV0nv6MZ5ELzkkLcbJeUyojuOHt6spPUS78
 wjxKLMUZiYZazEXFiQDWZLGyBgMAAA==
X-CMS-MailID: 20190827083334epcas2p115d479190b9a72c886f66569add78203
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190827083334epcas2p115d479190b9a72c886f66569add78203
References: <CGME20190827083334epcas2p115d479190b9a72c886f66569add78203@epcas2p1.samsung.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kernel.dk]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i2WvD-00HRI9-10
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

On Wed, Aug 21, 2019 at 5:10 AM Satya Tangirala <satyat@kernel.dk> wrote:
> 
> Hi Boojin,
>
> We're very keen to make sure that our approach to inline encryption can
> work with diverse hardware, including Samsung's FMP hardware; if you
> can see any issues with using our approach with your hardware please
> let us know.
>
> We understand that a possible concern for getting FMP working with our
> patch series for Inline Encryption Support at
>
>
https://lore.kernel.org/linux-block/20190821075714.65140-1-satyat@google.com
/
>
> is that unlike some inline encryption hardware (and also unlike the JEDEC
> UFS v2.1 spec), FMP doesn't have the concept of a limited number of
> keyslots - to address that difference we have a "passthrough keyslot
> manager", which we put up on top of our patch series for inline encryption
> support at
>
> https://android-review.googlesource.com/c/kernel/common/+/980137/2
>
> Setting up a passthrough keyslot manager in the request queue of a
> device allows the device to receive a bio's encryption context as-is with
> the bio, which is what FMP would prefer. Are there any issues with
> using the passthrough keyslot manager for FMP?
>
> Thanks!
> Satya

Dear Satya.
Keyslot manager is a good solution for ICE. And probably no issue for FMP.
But, I think it's complicated for FMP because FMP doesn't need
any keyslot control.
Crypto API that FMP's using is simply, stable, and supports test. 
FMP has been mass producing and certificating using crypto APIs
for several years. 
So I wants to keep  our current crypto API solution.
But, I'm looking at your patch.  And I will keep examining at your patch
because our goal is to run the FMP on the mainline kernel.

Thanks for your reply.
Boojin Kim.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
