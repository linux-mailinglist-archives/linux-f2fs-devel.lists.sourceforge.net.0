Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CB2997C23
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2024 07:08:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sylPP-00062h-8n;
	Thu, 10 Oct 2024 05:08:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1sylPN-00062b-BE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 05:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kDPmTXhPX6cxQzuvSTnQ8wrHQwVwp7TSgQJ6vfD5NDg=; b=PifVD138uhUTZ2Ig+pQDO0nETR
 DRzMMt/ZGn4exU2lHIuIdKzKPeWxv4wq7ZbmBDtE00IgmQ2a7dqwLF8WHREmtduMXtpyj9/VKEJkB
 RLkzSoRTXjr3r/GvGuENJJJRTADhny6I3Wow/DGyo2rra/4uMtwRsDTTb1EXHWpmkR4s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kDPmTXhPX6cxQzuvSTnQ8wrHQwVwp7TSgQJ6vfD5NDg=; b=El7Zb6DDDnEixTE4RuJiziLtBb
 jE4EIzsMCz/D3PMElqp8msRHvWwXVquIz4DN3ETKYS5k4w4YFO27Y5C4OetuB/pP1X8nd+CoJ28HU
 +HBKqnLRq013FSKvolrZDSVZs87GfB5KoQLi7mtUhGvyrY2FvQD/+XIgy5nH1Nu9FCmc=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sylPL-0007mO-4x for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 05:08:17 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20241010050808epoutp03ba517cc972b61284c958e5934e903d2d~8-yQ-Q8ys2260922609epoutp03e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 05:08:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20241010050808epoutp03ba517cc972b61284c958e5934e903d2d~8-yQ-Q8ys2260922609epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1728536888;
 bh=kDPmTXhPX6cxQzuvSTnQ8wrHQwVwp7TSgQJ6vfD5NDg=;
 h=Subject:Reply-To:From:To:In-Reply-To:Date:References:From;
 b=lOaGwoMJMCctFMlArcITukaqyJaQ/V1BXHysVh4048VXazrMPxv2MIDrQHmOegG8z
 PgQn0WXBAvA9k8eW1cb41VIcFn3O5B3oQAUshFCK3SiccpCJX50IAAONnKcaGYSzuK
 NO3pahkIaiDKYntzldz0nWItWnd5fZ31OwFesd6I=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20241010050807epcas2p4c745218ce269021cdeb83774ed7d9b8e~8-yQn6kKG1746417464epcas2p40;
 Thu, 10 Oct 2024 05:08:07 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.90]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4XPHnz1THfz4x9Px; Thu, 10 Oct
 2024 05:08:07 +0000 (GMT)
X-AuditID: b6c32a48-7f9ff70000002653-bf-6707613757ce
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 4F.C6.09811.73167076; Thu, 10 Oct 2024 14:08:07 +0900 (KST)
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
In-Reply-To: <20241010045935epcms2p7ab5f54e9789b36ea496abcb100a7878f@epcms2p7>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241010050806epcms2p8927a8ebf52433366ddcb08384e7090c9@epcms2p8>
Date: Thu, 10 Oct 2024 14:08:06 +0900
X-CMS-MailID: 20241010050806epcms2p8927a8ebf52433366ddcb08384e7090c9
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpik+LIzCtJLcpLzFFi42LZdljTQtc8kT3dYN8pdovTU88yWax6EG7x
 46SJxZP1s5gtLi1yt7i8aw6bxfmJr5kspp4/wuTA4bFpVSebx+4Fn5k8+rasYvT4vEkugCUq
 2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6AYlhbLE
 nFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5gV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbG
 hJtf2Ap6uSs2Xm1ib2CcxNnFyMkhIWAi8eP1DeYuRi4OIYEdjBK77jewdTFycPAKCEr83SEM
 YgoLJEnMXlQAUi4koCRx7UAvC4gtLKAvsXnxMnYQm01AV+LvhuXsIGNEBBqYJXY/3cQEMZ9X
 Ykb7UxYIW1pi+/KtjCA2p4CfxME576FqNCR+LOtlhrBFJW6ufssOY78/Np8RwhaRaL13FqpG
 UOLBz91QcUmJRYfOQ83Jl/i74jobhF0jsbWhDSquL3GtYyPYDbwCvhIPuu+C2SwCqhK7V+yF
 qnGRWHFyIlgvs4C8xPa3c5hBfmcW0JRYv0sfxJQQUJY4cosFooJPouPwX3aYD3fMewI1RU1i
 86bNrBC2jMSFx22MEK0eEmc/B0ECeSqzxLXn3SwTGBVmIcJ5FpK9sxD2LmBkXsUollpQnJue
 WmxUYAKP2uT83E2M4MSo5bGDcfbbD3qHGJk4GA8xSnAwK4nw6i5kTRfiTUmsrEotyo8vKs1J
 LT7EaAr08URmKdHkfGBqziuJNzSxNDAxMzM0NzI1MFcS573XOjdFSCA9sSQ1OzW1ILUIpo+J
 g1OqgSnzn9tPqber3ae7+qid0vt5Or2gbcPMQ2qLbq85UvHqQNP9IgUL2118qVWmTptnNNev
 /CYcPtPPp5jnrMLnyOlvGku9BOa8Uz9neDr3x5x36xYmGHGaWPtaMmpzekz4lFmfHhTHuUaB
 sX/tv+aZp6fsaZ2nxTZ7lZDUI4WeGXsOG6TMqQsyOLfFI0zsikPGkv+RXSmvKuNN49+4JMr+
 /LKk6vmrPXWvHCafFQxg8uL9xpkmr1FZKMJ268mPd6/457h6NVjuyMx7Yy63+eMJ3m2Veyec
 ML4+L/q4+JxHzt/DG8u4Z/C0FlYe25W2q124wVTLT95BXK48Q49Fac0Kve1fJYqer+9ecEJH
 2j1qnRJLcUaioRZzUXEiAHG3H6QVBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303
References: <20241010045935epcms2p7ab5f54e9789b36ea496abcb100a7878f@epcms2p7>
 <20241010043123epcms2p2ad514eb5e4a94413d8b26aea56f772a8@epcms2p2>
 <20241010021506epcms2p21d877e3c72389b41805db31f391d2b42@epcms2p2>
 <e26d7399-a0a7-4646-8e93-267cb20018cf@kernel.org>
 <20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
 <CGME20241007052122epcms2p8a7a733c92a8da751ac64af8a29de0303@epcms2p8>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There was a problem that did not subtract the super block
 area when calculating the usable segments for a single zoned device with a
 conventional zone. This resulted in incorrect the overprovision and [...]
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
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
X-Headers-End: 1sylPL-0007mO-4x
Subject: [f2fs-dev] [RESEND][PATCH v2] libf2fs: Fix calculation of usable
 segments for single zoned device
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

There was a problem that did not subtract the super block area when calculating
the usable segments for a single zoned device with a conventional zone.
This resulted in incorrect the overprovision and reserved area.

	<256MiB legacy block + zoned block w/ 32MiB zone size>
	Info: Overprovision ratio = 3.570%
	Info: Overprovision segments = 656 (GC reserved = 560)

	<8 conventional zone + 1016 sequential zone w/ 32MiB zone size>
	Info: Overprovision ratio = 3.700%
	Info: Overprovision segments = 676 (GC reserved = 578)

This patch addresses the problem by subtracting the super block area when
there is only one zoned device.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 lib/libf2fs_zoned.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 89ba5ad73a76..1a0985378789 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -555,6 +555,11 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
 	}
 	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
 						get_sb(log_blocks_per_seg);
+
+	/* single zoned device needs to remove a super block area */
+	if (c.ndevs == 1 && c.devices[0].zoned_model == F2FS_ZONED_HM)
+		usable_segs -= (get_sb(segment0_blkaddr) >> get_sb(log_blocks_per_seg));
+
 	return usable_segs;
 #endif
 	return get_sb(segment_count_main);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
