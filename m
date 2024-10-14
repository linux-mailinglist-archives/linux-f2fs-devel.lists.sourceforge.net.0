Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35099BD6A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Oct 2024 03:44:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0A7n-0002Rg-Pn;
	Mon, 14 Oct 2024 01:43:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1t0A7m-0002RP-24
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 01:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5tNDyzmv7hh4tEfaKy/ETU6TxQAsf/m9S2xTXYxFnFY=; b=Ta70gilJ8NrAkVmlkuvXRXyKUv
 9uuNVOwwUzeu7vRBzm230bRiQFzT4tE9x6Re1KWnBXXsklfuQl2JgTBCaC/B7Y3C9xmS3RFMpKPjA
 rGUJAyyTjujNTbVVrs7Dloa5j7YxYYva9/qA0HHbk49iXJTHgbllLaQepiUE1nkCVtV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5tNDyzmv7hh4tEfaKy/ETU6TxQAsf/m9S2xTXYxFnFY=; b=Pb6Ile55MO+3lgnARXlH7scO/W
 IqUShDL504aZXCG7bH8W5y0V2bA7IUIHx9an8EStJLL/5cqFkX3BlyyDjpCR+dSNfFP21yM93+y+6
 flKg8DE0KZULa/59bxGwnq/h2cakVv4MYyuVEeI93TA3hn3252og7kHY2vcorg7/aU4I=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0A7i-0004xY-Jp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 01:43:54 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20241014014343epoutp04dacb49b359a990c666a99487eda70550~_Lk7bMK-m1687116871epoutp04S
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Oct 2024 01:43:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20241014014343epoutp04dacb49b359a990c666a99487eda70550~_Lk7bMK-m1687116871epoutp04S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1728870223;
 bh=5tNDyzmv7hh4tEfaKy/ETU6TxQAsf/m9S2xTXYxFnFY=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=eQEun3r872qviaLuMXrQunZomGFGNd9ObIMIyFQ1+DW0JfX+/m9rIWS9EmPG7E1Cv
 xAfGcgJP1NH9gItWebN8Qlnf3sERCttta1qmRgAprhMcWZU8/4gIPkJUSrtvHOUMuO
 0Vy2dbiaIjLGYrnjCHXRQi6Pu/opmX3JiT6wUf80=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20241014014342epcas2p40ed2c85cbe3090d77a4a66e906e5c4e0~_Lk7F6ehY0308503085epcas2p4Y;
 Mon, 14 Oct 2024 01:43:42 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4XRg4G164lz4x9Px; Mon, 14 Oct
 2024 01:43:42 +0000 (GMT)
X-AuditID: b6c32a46-da9ff7000000262a-e4-670c774d4508
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 AD.24.09770.D477C076; Mon, 14 Oct 2024 10:43:42 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <ZwlFkBAV2yxf1DBt@google.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241014014341epcms2p3467a0b744b7bfc269871c8e75e80c896@epcms2p3>
Date: Mon, 14 Oct 2024 10:43:41 +0900
X-CMS-MailID: 20241014014341epcms2p3467a0b744b7bfc269871c8e75e80c896
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdljTVNevnCfd4M8fJovTU88yWax6EG7x
 46SJxZP1s5gtLi1yt7i8aw6bxfmJr5kspp4/wuTA4bFpVSebx+4Fn5k8+rasYvT4vEkugCUq
 2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6AYlhbLE
 nFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5gV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbG
 05/TWAtWC1Sc3vOUuYHxAU8XIyeHhICJxLGbzexdjFwcQgI7GCV6P/xk6mLk4OAVEJT4u0MY
 pEZYIFhi098ZbCC2kICSxLUDvSwQcX2JzYuXsYPYbAK6En83LAezRQRUJA4tugw2k1ngMpPE
 uxvP2SCW8UrMaH/KAmFLS2xfvpURxOYU0JK42n4PqkZD4seyXmYIW1Ti5uq37DD2+2PzGSFs
 EYnWe2ehagQlHvzcDRWXlFh06DwThJ0v8XfFdaiZNRJbG9qg4voS1zo2gt3AK+ArceXWe7A5
 LAKqElse7oG6zUWi7TiEzSwgL7H97RxmUJgwC2hKrN+lD2JKCChLHLkFVcEn0XH4LzvMhzvm
 PYHapCaxedNmVghbRuLC4zZGiFYPibOfgyYwKs5ChPMsJKtmIaxawMi8ilEstaA4Nz212KjA
 CB61yfm5mxjBiVHLbQfjlLcf9A4xMnEwHmKU4GBWEuF9P5UzXYg3JbGyKrUoP76oNCe1+BCj
 KdCTE5mlRJPzgak5ryTe0MTSwMTMzNDcyNTAXEmc917r3BQhgfTEktTs1NSC1CKYPiYOTqkG
 pjtW9TVfTLQlF3lt/Zh5btrSg89nfLi+60WxR3WO9PNjDbNPtn/m2V/ylvV1TziDzcLlC73E
 D8lZu1tMadH52MLYpcdz/KpEPVNu5ceQLe6ac2/seKCzJvXKAvvwCW1+25hn7FwvHxZ0ep23
 0d4LG9/8dLrweHHf5jwVZsbHUqn1qhWnxbQXnDz0YOY5CcHtIkFG9Q+mfO4yNOubkrm6mffi
 ag5XNccJ/dPq435lq1ovlrRdt+frtLR7lnJF9z/E5wefXeG57Gb+zCt7zT2VueujX8z+t6T9
 1MJ33Ndm5BqVqW6ZpiKpEuo3+5Rj1Kp62RbW99eN1mREr8t7KrOqkWfHFOHtslUF0pFsAQeZ
 JyixFGckGmoxFxUnAgCGG5ZkFQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303
References: <ZwlFkBAV2yxf1DBt@google.com>
 <20241010043123epcms2p2ad514eb5e4a94413d8b26aea56f772a8@epcms2p2>
 <20241010021506epcms2p21d877e3c72389b41805db31f391d2b42@epcms2p2>
 <e26d7399-a0a7-4646-8e93-267cb20018cf@kernel.org>
 <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
 <20241010045935epcms2p7ab5f54e9789b36ea496abcb100a7878f@epcms2p7>
 <CGME20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p3>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 10/10, Yonggil Song wrote: > > There was a problem that
 did not subtract the super block area when calculating > > the usable segments
 for a single zoned device with a conventional zone. > > This [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0A7i-0004xY-Jp
Subject: Re: [f2fs-dev] (2) [PATCH v2] libf2fs: Fix calculation of usable
 segments for single
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Siwoo Jung <siu.jung@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> On 10/10, Yonggil Song wrote:
> > There was a problem that did not subtract the super block area when calculating
> > the usable segments for a single zoned device with a conventional zone.
> > This resulted in incorrect the overprovision and reserved area.
> > 
> > 	<256MiB legacy block + zoned block w/ 32MiB zone size>
> > 	Info: Overprovision ratio = 3.570%
> > 	Info: Overprovision segments = 656 (GC reserved = 560)
> > 
> > 	<8 conventional zone + 1016 sequential zone w/ 32MiB zone size>
> > 	Info: Overprovision ratio = 3.700%
> > 	Info: Overprovision segments = 676 (GC reserved = 578)
> > 
> > This patch addresses the problem by subtracting the super block area when
> > there is only one zoned device.
> > 
> > Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> > ---
> >  lib/libf2fs_zoned.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> > index 89ba5ad73a76..1a0985378789 100644
> > --- a/lib/libf2fs_zoned.c
> > +++ b/lib/libf2fs_zoned.c
> > @@ -555,6 +555,11 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
> >  	}
> >  	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
> >  						get_sb(log_blocks_per_seg);
> > +
> > +	/* single zoned device needs to remove a super block area */
> > +	if (c.ndevs == 1 && c.devices[0].zoned_model == F2FS_ZONED_HM)
> 
> Does this work?
> 
Yes, it works.

I have attached the results of test on null_blk below.
If you have any concerns, please feedback.

						before				after
legacy block (32GB)				136 (GC reserved = 130)		136 (GC reserved = 130)
single zoned block				676 (GC reserved = 578)		656 (GC reserved = 560)
(32GB, 32MB zone, 8 conv, 1016 seq)
legacy + zoned multi				656 (GC reserved = 560)		656 (GC reserved = 560)
(32GB, 256MB legacy block + 32MB zone, 1016 seq)

Thanks.
> > +		usable_segs -= (get_sb(segment0_blkaddr) >> get_sb(log_blocks_per_seg));
> > +
> >  	return usable_segs;
> >  #endif
> >  	return get_sb(segment_count_main);
> > -- 
> > 2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
