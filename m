Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EAB997A79
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2024 04:15:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1syii4-0002dV-8u;
	Thu, 10 Oct 2024 02:15:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1syii2-0002dP-Mk
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 02:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KwezmccuvsEkQ3QUmoSF817fDPmnmjO8YiMhahZ8F4c=; b=S4I6VmHLkdtHv0u+x106en/AZT
 L+9MyIni/7HMTQyB2c6htK3va9DC5E6zaZp+d1a9z2mwg+ItZMFCVC2SQ7aA0a1cqEXGHNGqi39BD
 p2YhMVw3pbfE7n7PY2JjwYVf3qK99H+gQrJDcWQ/21TPNXE3k2nwQOEv70lHV+kKjEIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KwezmccuvsEkQ3QUmoSF817fDPmnmjO8YiMhahZ8F4c=; b=DxBGxQrI41Ik1gEguJyRw4Caen
 SAmiFWerDjAZSInn9ImL/LOh3mYE1Mbgum56HQOih2tIj1dQJvOyrvaqNlPadJcrIv+LgL9kvYO8I
 iR+8oMsRSPM7ALC3uAoQKnJxXsb3rYFjE1WgsJgpmqdwsLehJbfUf4wDUvnnRk8TW0Gs=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1syihz-0000fg-NB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 02:15:22 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20241010021507epoutp02193910453560f6a4f41a14052ac9ab1c~89bNWIGH91267312673epoutp02U
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 02:15:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20241010021507epoutp02193910453560f6a4f41a14052ac9ab1c~89bNWIGH91267312673epoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1728526507;
 bh=KwezmccuvsEkQ3QUmoSF817fDPmnmjO8YiMhahZ8F4c=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=uoLKtioK0savDC0GARSv3+Owb+giaGWDPWhQUIyRW9a1896bf0CFYBzoRQS0FsOGd
 mKYU3LoRMqaFVVgRNI6nK0O4bay1d63n9WKwgfv1IokhCu79NkXk0NQI1k3UR4oIgv
 CKeCE79lGSJnvbBB91V6nRVpEpHg1sZWEEjhfLBQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20241010021507epcas2p28f7b82e37d616365652e2b17f1c0cf4d~89bM62zuL2751627516epcas2p2y;
 Thu, 10 Oct 2024 02:15:07 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.99]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4XPCyL40hYz4x9Q3; Thu, 10 Oct
 2024 02:15:06 +0000 (GMT)
X-AuditID: b6c32a48-7f9ff70000002653-7c-670738aafec8
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 31.E5.09811.AA837076; Thu, 10 Oct 2024 11:15:06 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Dongjin Kim <dongjin_.kim@samsung.com>,
 Siwoo Jung <siu.jung@samsung.com>, Daejun Park <daejun7.park@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <e26d7399-a0a7-4646-8e93-267cb20018cf@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241010021506epcms2p21d877e3c72389b41805db31f391d2b42@epcms2p2>
Date: Thu, 10 Oct 2024 11:15:06 +0900
X-CMS-MailID: 20241010021506epcms2p21d877e3c72389b41805db31f391d2b42
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkk+LIzCtJLcpLzFFi42LZdljTQneVBXu6wdyPohanp55lslj1INzi
 x0kTiyfrZzFbXFrkbnF51xw2i/MTXzNZTD1/hMmBw2PTqk42j90LPjN59G1ZxejxeZNcAEtU
 tk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0A1KCmWJ
 OaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyM
 WfP3sBcc5604vO8ySwPjRa4uRk4OCQETie0b17N0MXJxCAnsYJRY9/EAcxcjBwevgKDE3x3C
 IDXCAmESz3p2sYHYQgJKEtcO9LJAxPUlNi9exg5iswnoSvzdsBzMFhG4yiQx8b8BiM0soC2x
 cfZZJohdvBIz2p+yQNjSEtuXb2UEsTkF7CRm3JvCDhHXkPixrJcZwhaVuLn6LTuM/f7YfEYI
 W0Si9d5ZqBpBiQc/d0PFJSUWHToPtStf4u+K62wQdo3E1oY2qLi+xLWOjWA38Ar4SvROPQE2
 n0VAVeLvrJ9Qt7lIzHp2lBXifnmJ7W/ngIOEWUBTYv0ufRBTQkBZ4sgtFogKPomOw3/ZYT7c
 Me8J1CY1ic2bNrNC2DISFx63MUK0ekic/Rw0gVFxFiKYZyFZNQth1QJG5lWMYqkFxbnpqcVG
 BSbwmE3Oz93ECE6LWh47GGe//aB3iJGJg/EQowQHs5IIr+5C1nQh3pTEyqrUovz4otKc1OJD
 jKZAT05klhJNzgcm5rySeEMTSwMTMzNDcyNTA3Mlcd57rXNThATSE0tSs1NTC1KLYPqYODil
 Gpi4DltK36qonN608+ojv0XVC348+LPkSO+0TOMtK++ceXHS+fxdudy1u4tkC6X/nTQ05VM4
 V3vG+qHJ3sY1yolLls+c3v2Zbcu7pRE7E5YVXls1P0XvYETtfuY5m2/2vL/JKtgU19eRHNnA
 U+cwudtx+a89ElzyD4vTpk0qW7VlaZTFN7Zm2+/3rKJ5yjd1G3x/JBCTJslVuKP37OQXbi+9
 o1XPr/t84HFffezF1tN+u43FVWqCXLkuLjl43ZflkZLDpith21em/8mcky6oudp5lzUDi8Jt
 zeZ+Z23OevVvEZNM3Mrymcq954TOf1BXnu/tknxqssyaTOG9h6feFrrx+uod1mqtFOHwlGVP
 z9UqsRRnJBpqMRcVJwIAJLSZzhQEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303
References: <e26d7399-a0a7-4646-8e93-267cb20018cf@kernel.org>
 <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
 <CGME20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p2>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 2024/10/7 13:21, Yonggil Song wrote: > > There was a
 bug that did not subtract the super block area when calculating > > the usable
 segments for a single zoned device with a conventional zone. > [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1syihz-0000fg-NB
Subject: Re: [f2fs-dev] (2) [PATCH] libf2fs: Fix calculation of usable
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

> On 2024/10/7 13:21, Yonggil Song wrote:
> > There was a bug that did not subtract the super block area when calculating
> > the usable segments for a single zoned device with a conventional zone.
> > This bug resulted in incorrect the overprovision and reserved area.
> > 
> > 	<256MiB legacy block + zoned block w/ 32MiB zone size>
> > 	Info: Overprovision ratio = 3.570%
> > 	Info: Overprovision segments = 656 (GC reserved = 560)
> > 
> > 	<8 conventional zone + 1016 sequential zone w/ 32MiB zone size>
> > 	Info: Overprovision ratio = 3.700%
> > 	Info: Overprovision segments = 676 (GC reserved = 578)
> > 
> > This patch fixes the bug by subtracting the super block area when there is
> > only one zoned device.
> > 
> > Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> > ---
> >   lib/libf2fs_zoned.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> > index 89ba5ad73a76..cc5c064b7e3e 100644
> > --- a/lib/libf2fs_zoned.c
> > +++ b/lib/libf2fs_zoned.c
> > @@ -555,6 +555,11 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
> >   	}
> >   	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
> >   						get_sb(log_blocks_per_seg);
> > +
> > +	/* single zoned device needs to remove a super block area */
> 
> If we don't format zoned device, it doesn't need to do this?
> 
> Thanks,
> 
Yes, single zoned block only needs this.

legacy block just return a segment_count_main.

thanks.
> > +	if (c.ndevs == 1)
>  > +		usable_segs -= (get_sb(segment0_blkaddr) >> get_sb(log_blocks_per_seg));> +
> >   	return usable_segs;
> >   #endif
> >   	return get_sb(segment_count_main);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
