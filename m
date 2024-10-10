Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4C8997BD6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2024 06:31:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sykpw-0005G7-8t;
	Thu, 10 Oct 2024 04:31:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1sykpu-0005G1-8D
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 04:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=liYFFMSBTTST7ShgTxu6v581/PBjKd9MlqCCOtTNcgM=; b=Vj+obQxc7Vz/XI8bjxYV3rCGgA
 d7e4XxQf6ju0KUtzUXJtjFrTVYJcB2UomI/XVwYbLDiWdubUCCfb0qS76rhyST8t3CUVBIHdZTtst
 m8dVBotMJLGKaBHIggWjcr9+Cqn9dzsFzQ7E5r30Hq6Tev+O1Y6JPV/qk/y+v8ovni3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=liYFFMSBTTST7ShgTxu6v581/PBjKd9MlqCCOtTNcgM=; b=lah2yGO5IxisdGU/C168qXIsUx
 AzvI89HAImTePOjdKrg2gcCrcF/RcBh9ImCJALjyR655Rqj8NrbGfXEJUnGMu1f+JvvXTNxkXWMRW
 EAWIJM1Injpp89HfHYtCVcUF2zTiWU8GLW8tPNm1R4yjg7858pQIF07fZG3itCRBsAkI=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sykps-0006Fs-MV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 04:31:38 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20241010043124epoutp039bbd5b14b08f26e216c13da390902d6c~8-SM4jwjZ1506715067epoutp03Q
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 04:31:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20241010043124epoutp039bbd5b14b08f26e216c13da390902d6c~8-SM4jwjZ1506715067epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1728534684;
 bh=liYFFMSBTTST7ShgTxu6v581/PBjKd9MlqCCOtTNcgM=;
 h=Subject:Reply-To:From:To:In-Reply-To:Date:References:From;
 b=i5wDlginYwpcplTcjhdHr6eD9ZguObWUzG7oEobasZoh8eI/e+9zM2wP2ZSQmpLay
 wZlGi8hB4vD2RNiX+wfBD716KI8+75T9y5z22dNRpS8NzvpZoQjam6Xop3e9JkK5CE
 S/bezwNIVv07v1zzkonNuRVCLY22RWCDmvzjmUio=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20241010043124epcas2p3c0600ef9ce4becc1ebd7346fe4b95c47~8-SMbVEqT2713427134epcas2p39;
 Thu, 10 Oct 2024 04:31:24 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.68]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4XPGzb4KPKz4x9Q0; Thu, 10 Oct
 2024 04:31:23 +0000 (GMT)
X-AuditID: b6c32a47-d53fa70000002630-7e-6707589bec00
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 1A.01.09776.B9857076; Thu, 10 Oct 2024 13:31:23 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Yonggil Song <yonggil.song@samsung.com>, Chao Yu <chao@kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Dongjin Kim <dongjin_.kim@samsung.com>,
 Siwoo Jung <siu.jung@samsung.com>, Daejun Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20241010021506epcms2p21d877e3c72389b41805db31f391d2b42@epcms2p2>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241010043123epcms2p2ad514eb5e4a94413d8b26aea56f772a8@epcms2p2>
Date: Thu, 10 Oct 2024 13:31:23 +0900
X-CMS-MailID: 20241010043123epcms2p2ad514eb5e4a94413d8b26aea56f772a8
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdljTQnd2BHu6wbcL8hanp55lslj1INzi
 x0kTiyfrZzFbXFrkbnF51xw2i/MTXzNZTD1/hMmBw2PTqk42j90LPjN59G1ZxejxeZNcAEtU
 tk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0A1KCmWJ
 OaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyM
 1v+7WQo+8lXMmPCSrYFxL3cXIyeHhICJxI+mj4xdjFwcQgI7GCWWf/zA2sXIwcErICjxd4cw
 SI2wQJjExn/7GUFsIQEliWsHelkg4voSmxcvYwex2QR0Jf5uWM4OMkdEoIFZYvfTTUwQC3gl
 ZrQ/ZYGwpSW2L98KNohTwE/i6bvVbBBxDYkfy3qZIWxRiZur37LD2O+PzWeEsEUkWu+dhaoR
 lHjwczdUXFJi0aHzULvyJf6uuA41s0Zia0MbVFxf4lrHRrAbeAV8JRq+HgazWQRUJW5cv88K
 UeMiMav7LtheZgF5ie1v5zCDwoFZQFNi/S59EFNCQFniyC0WiAo+iY7Df9lhPtwx7wnUJjWJ
 zZs2Q02UkbjwuI0RotVD4uznIEgI9jJJnDkhNYFRYRYinGchWTsLYe0CRuZVjGKpBcW56anF
 RgXG8KhNzs/dxAhOjFruOxhnvP2gd4iRiYPxEKMEB7OSCK/uQtZ0Id6UxMqq1KL8+KLSnNTi
 Q4ymQA9PZJYSTc4Hpua8knhDE0sDEzMzQ3MjUwNzJXHee61zU4QE0hNLUrNTUwtSi2D6mDg4
 pRqYDN6H/M6dr3HNT0D7CPPyNyrbcvhy/4e8TN+2ui9YpHSPhqWjSNOCRXZ3ddWmfXyX7Wuk
 feOJYLHVVM8kta9Hn3Kbd8ltOjD7+vvl216IreAV1+fYts5ybY5ir/LM00sr6haaPHrQOf2v
 cWTqBJljErcC/s86Xbz3zZzEpm/XpnSd9Fn2+u5F81+nf8QFel1S93x1uORiDV/mEsczVWzH
 OQ8a5f76HS6f3v9A8J1SrtiMnl8tjF3Knf/9d9k/WVKw4f/m8PrG1QdNJ10IrejkyNifW2Xc
 oHBvupyqvLOM1yme58nTjr3dvf7vROfJj/z2Juj8u1MgvattwimNOtUTrvrdTzjZf1btvpWp
 a9DnrcRSnJFoqMVcVJwIAO8X6L8VBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303
References: <20241010021506epcms2p21d877e3c72389b41805db31f391d2b42@epcms2p2>
 <e26d7399-a0a7-4646-8e93-267cb20018cf@kernel.org>
 <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
 <CGME20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p2>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > On 2024/10/7 13:21, Yonggil Song wrote: > > > There was
 a bug that did not subtract the super block area when calculating > > > the
 usable segments for a single zoned device with a conventional zo [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sykps-0006Fs-MV
Subject: Re: [f2fs-dev] (3) [PATCH] libf2fs: Fix calculation of usable
 segments for single zoned
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

> > On 2024/10/7 13:21, Yonggil Song wrote:
> > > There was a bug that did not subtract the super block area when calculating
> > > the usable segments for a single zoned device with a conventional zone.
> > > This bug resulted in incorrect the overprovision and reserved area.
> > > 
> > > 	<256MiB legacy block + zoned block w/ 32MiB zone size>
> > > 	Info: Overprovision ratio = 3.570%
> > > 	Info: Overprovision segments = 656 (GC reserved = 560)
> > > 
> > > 	<8 conventional zone + 1016 sequential zone w/ 32MiB zone size>
> > > 	Info: Overprovision ratio = 3.700%
> > > 	Info: Overprovision segments = 676 (GC reserved = 578)
> > > 
> > > This patch fixes the bug by subtracting the super block area when there is
> > > only one zoned device.
> > > 
> > > Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> > > ---
> > >   lib/libf2fs_zoned.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> > > index 89ba5ad73a76..cc5c064b7e3e 100644
> > > --- a/lib/libf2fs_zoned.c
> > > +++ b/lib/libf2fs_zoned.c
> > > @@ -555,6 +555,11 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
> > >   	}
> > >   	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
> > >   						get_sb(log_blocks_per_seg);
> > > +
> > > +	/* single zoned device needs to remove a super block area */
> > 
> > If we don't format zoned device, it doesn't need to do this?
> > 
> > Thanks,
> > 
> Yes, single zoned block only needs this.
> 
> legacy block just return a segment_count_main.
> 
> thanks.
Sorry, I misunderstood.
I'll resend v2 with zoned block checker.

thanks.
> > > +	if (c.ndevs == 1)
> >  > +		usable_segs -= (get_sb(segment0_blkaddr) >> get_sb(log_blocks_per_seg));> +
> > >   	return usable_segs;
> > >   #endif
> > >   	return get_sb(segment_count_main);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
