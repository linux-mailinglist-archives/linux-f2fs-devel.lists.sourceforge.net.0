Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B752972D8D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 11:26:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snx8i-0000c4-4c;
	Tue, 10 Sep 2024 09:26:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1snx8g-0000bo-F4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 09:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MtY5qZOPVIGordnCBFvzVrBfTMRjvMNrDfO7tPymv9k=; b=LtHNcKVbZSesVqsseAZsIBh3fd
 Z3mPhKUlr/KAh5kOPqxpWWRiLCWDMRoJPruXHjOpQ21nA/tF/rAZJw+DW5LGHaq2rdFEj9nJ++f18
 ZdGl3rBah3HGKGKVc7t6/SpOPHwTD7y3Cl82Qxf0/E8QVy8DhwhYarbuhowtYptN32rI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MtY5qZOPVIGordnCBFvzVrBfTMRjvMNrDfO7tPymv9k=; b=FZwp+VBwKfbeXUcCdLijMeAR1h
 6lYnxAeUqXvfozKibeEnZpiMR99w8Zd5kFFlFRxsx1rxwWqzVqxnxZ0aZQQVcfsFRH1pTQ5vbmhsh
 F19pxhhYOQ5105hxLJbD7oZa6wmvHlef9zqk53cYdtVW7W6Zo8ty8fjPuyWyekyFkUaM=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1snx8c-000169-PK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 09:26:22 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240910092606epoutp042ae0f6294e798066584b3d20b58540e2~z188YS1VC0753207532epoutp04G
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Sep 2024 09:26:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240910092606epoutp042ae0f6294e798066584b3d20b58540e2~z188YS1VC0753207532epoutp04G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725960366;
 bh=MtY5qZOPVIGordnCBFvzVrBfTMRjvMNrDfO7tPymv9k=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=qNQu/qqciECo7N+Qr5su9Pn5p1DrkHX7PcmkcbYMNwLTMna70vEU9XE3Oyqru/qv8
 wLGPiEhl3CbffRzyva8rLXOQdQBCjh5T2EpVpv24jVCnJfIltYRWDww1UnaakT6aPP
 zg+y+20EjuSJC5O9IGKGrQ++WIIIUh71iCixLdx0=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20240910092606epcas5p1b482ec48592d08e606bf0c1ad7fb2ce6~z187_8Kmq2995129951epcas5p17;
 Tue, 10 Sep 2024 09:26:06 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4X2yxS43Btz4x9Pp; Tue, 10 Sep
 2024 09:26:04 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7D.F0.09640.CA010E66; Tue, 10 Sep 2024 18:26:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20240910092604epcas5p4d01dec7422c7990882f6453c52a78075~z185-cxiQ0887908879epcas5p42;
 Tue, 10 Sep 2024 09:26:04 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240910092604epsmtrp2fa22a8c1a088d03d2222bc0993458c5d~z1859dXm12757627576epsmtrp2k;
 Tue, 10 Sep 2024 09:26:04 +0000 (GMT)
X-AuditID: b6c32a49-aabb8700000025a8-d8-66e010ac0e90
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 80.E9.19367.BA010E66; Tue, 10 Sep 2024 18:26:03 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240910092559epsmtip21e15ace98c8e2bda39a2dbad69522f80~z182IcM510197501975epsmtip2l;
 Tue, 10 Sep 2024 09:25:59 +0000 (GMT)
Message-ID: <c9289a2f-ecb3-7e3e-c5d9-336ce2bc09a7@samsung.com>
Date: Tue, 10 Sep 2024 14:55:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <ZtsoGX2QY-TjBolb@kbusch-mbp.mynextlight.net>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTdxTHdx+0hVFzLa8fZBtd2SNgoJSVekHp3GzYZS4Gh0BituAdvTwC
 fdDbTpxLqKIyMcDEANIhrRQwgBuKhMeQBMsYMmCQIQM72+Eom0gcCFsmoLCWyxj/fc7J+Z5n
 DgfhnWQHcDKVWkqjJLMFLA+0rTf4zdBr2FRa+JT1JbzJVsLC53oXIbx8YRnB121/wPi9nk4Y
 b2jqg/HO+q/Z+FcV+TDuaDYg+I0SDj59f4mNL9c3svFSy88Q3m3dhf9U8x5+q3sAxY31M2z8
 /EQHC7/avwbjbatGBP9mbh7FRwxV7H2+xNjdA8SI/QZKlJf+wCLGhnVES+M5FnGzNo/oMi3B
 RNc9PYt4MmNFieLWRogYMn3HJpZaXon3PJK1N4Mi5ZSGTylTVfJMZXqM4EBCyv6USEm4KFQU
 he8W8JWkgooRyD6ID43NzHaOK+B/SmbrnK54kqYFQulejUqnpfgZKlobI6DU8my1WB1Gkwpa
 p0wPU1LaaFF4eESkM/BoVkb/chtL3eSZe350ma2HTnkUQu4cgIlBa8EcqxDy4PCwLghcrbmL
 MMYiBEZbpt22jOqyGmcYZ0NSvw4z/k4IrDZc2VQ8hoDd2uTmysvFpOB5tx51CVDsdTDRe4hx
 7wQDlQ7UxT7YJ2BlvApysZcz58SdecTFCOYHrA4j7GJvLAjYjJUbTSCYGQWPisxurpwsLBiM
 XtS50B2LBhfOHGakgaD9cdVGOwAzu4PLD6/AzJgyUDfdjjLsBR71t7IZDgBLf3azGM4CU79N
 bcZ8DjpuFrsx/DbQP5vcKIs4yzZ/K2Rq7QBFqw6YWQkXfHGWx0S/CuylM5tKP/DgUu0mE6C5
 /nt4a1PdFxeQLyG+YdtWDNumN2wbx/B/ZROENkL+lJpWpFN0pFqkpI5tnTtVpWiBNn4hJK4D
 sk0thFkgmANZIMBBBN7cEqk9jceVk8c/ozSqFI0um6ItUKTzOheQAJ9UlfOZlNoUkTgqXCyR
 SMRRb0lEAj/u3JnLch6WTmqpLIpSU5r/dDDHPUAPF/FrM6JNtz3gyhz2eM2Hg++/VpFqNuV4
 7RdGhvpOJyKZytv5J+IjZMWri4qQuOqRfcefNu9e6zPGkrRF+8vfpqDcPfNnf3VP9JUW+2PU
 scDFAfmh5GdlUqHu3QTzuI+DJqnTuuv5wbs4CUkVEfOZt+pGhx5U+x+U3RmOO7ocBj/sseZO
 KJJmV/4C92fLn58IMa69EHXYS2y+jj6VJmi8n9jqftyTY2jP66FnT5+C1Od2SB3J3KDYl6Vl
 oncC7dcGFiryFtKEicO8Urde2ZEXbQ3W9TH9P5aCWnPL74OKjwomgyYLjXYVKyZp9WRJ8seI
 4g3P/IMBK8I+yaXBnb1DApTOIEUhiIYm/wVws0vWlAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsWy7bCSvO5qgQdpBvcm2VisvtvPZvH68CdG
 i2kffjJb/L/7nMni5oGdTBYrVx9lsti5bC27xezpzUwWT9bPYrbY2M9h8fjOZ3aLn8tWsVtM
 OnSN0WLvLW2LS4vcLfbsPcliMX/ZU3aL7us72CyWH//HZLHt93xmi3Wv37NYnJ81h91BzOPy
 FW+P8/c2snhMm3SKzePy2VKPTas62Tw2L6n32L3gM5PH7psNbB4fn95i8ejbsorR48yCI+we
 nzfJBfBEcdmkpOZklqUW6dslcGUc/7mNrWA1T0X3hZ/sDYxNXF2MHBwSAiYSy/4zdTFycQgJ
 bGeU+Dipn7GLkRMoLi7RfO0HO4QtLLHy33N2iKLXjBLTzv1iBknwCthJ/N3bwAIyiEVAVeL6
 4UCIsKDEyZlPWEBsUYEkiT33G5lAbGGgXddPvAdrZQaaf+vJfLC4iICyxN35M1lB5jMLLGaR
 2LRxGxvEsreMElM3XmADWcAmoClxYXIpiMkpYCUxsTUEYo6ZRNfWLkYIW15i+9s5zBMYhWYh
 OWMWknWzkLTMQtKygJFlFaNoakFxbnpucoGhXnFibnFpXrpecn7uJkZw7GsF7WBctv6v3iFG
 Jg7GQ4wSHMxKIrz9dvfShHhTEiurUovy44tKc1KLDzFKc7AoifMq53SmCAmkJ5akZqemFqQW
 wWSZODilGph2m7ya35ot5KP/YYb6hKd5wsctNNOaz+lnb2Fry96Rd13xnb5VcnLw+wM/z7v5
 3A1z3HYjc+pNA5eOJH/2Lf/+52hUT+BcU2vYlu/xzWyv+SPpcot/k9LZpIzW3dgUfWfbllXV
 h7rkhSZe10q4duqRRJxgvS0nu9QnEcl7whOL5mpGvLyuUBRw0zzSXPl0RXffckP9/bebOL/e
 rT6/wu7y7efzNPfkbFqTGCkrfP69UVVQ/svtn79VXG+5kS/Bl5D3RatH21yzzcomI3WOTYtX
 Lc80q4NXXumcMO1dLn3yPI941ZwV7z+bO52333cieVOjY9+FBw1XHsg55LzT5Tq7YobzRu8X
 LM6zVcz99iqxFGckGmoxFxUnAgBTa/iJbAMAAA==
X-CMS-MailID: 20240910092604epcas5p4d01dec7422c7990882f6453c52a78075
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240826171430epcas5p3d8e34a266ced7b3ea0df2a11b83292ae
References: <20240826170606.255718-1-joshi.k@samsung.com>
 <CGME20240826171430epcas5p3d8e34a266ced7b3ea0df2a11b83292ae@epcas5p3.samsung.com>
 <20240826170606.255718-6-joshi.k@samsung.com>
 <ZtsoGX2QY-TjBolb@kbusch-mbp.mynextlight.net>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/6/2024 9:34 PM, Keith Busch wrote: > On Mon, Aug 26,
 2024 at 10:36:06PM +0530, Kanchan Joshi wrote: >> Flexible Data Placement
 (FDP), as ratified in TP 4146a, allows the host >> to control the pl [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1snx8c-000169-PK
Subject: Re: [f2fs-dev] [PATCH v4 5/5] nvme: enable FDP support
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
 Nitesh Shetty <nj.shetty@samsung.com>, gost.dev@samsung.com,
 jlayton@kernel.org, vishak.g@samsung.com, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, James.Bottomley@hansenpartnership.com,
 chuck.lever@oracle.com, javier.gonz@samsung.com, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 Hui Qi <hui81.qi@samsung.com>, hch@lst.de, bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/6/2024 9:34 PM, Keith Busch wrote:
> On Mon, Aug 26, 2024 at 10:36:06PM +0530, Kanchan Joshi wrote:
>> Flexible Data Placement (FDP), as ratified in TP 4146a, allows the host
>> to control the placement of logical blocks so as to reduce the SSD WAF.
>>
>> Userspace can send the data placement information using the write hints.
>> Fetch the placement-identifiers if the device supports FDP.
>>
>> The incoming placement hint is mapped to a placement-identifier, which
>> in turn is set in the DSPEC field of the write command.
>>
>> Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
>> Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
>> Signed-off-by: Hui Qi <hui81.qi@samsung.com>
> 
> I'm still fine with this nvme implementation.
> 
> Acked-by: Keith Busch <kbusch@kernel.org>
> 
> The reporting via fcntl looks okay to me, but I've never added anything
> to that interface, so not sure if there's any problem using it for this.
> 

The difference comes only in the fcntl interface (hint type/value pair 
rather than just value), otherwise it piggybacks on the same kernel 
infrastructure that ensures the hint is propagated fine. So I do not 
foresee problems.

And FWIW, we have had precedents when a revamped fcntl was introduced to 
do what was not possible with the existing fcntl. Like: 
F_{GET/SET}OWN_EX over F_{GET/SET}OWN.

Per-file hinting has its uses, particularly for buffered IO. But the 
current interface can only do data-lifetime hints. The revamped 
interface may come handy for other things too (e.g., KPIO).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
