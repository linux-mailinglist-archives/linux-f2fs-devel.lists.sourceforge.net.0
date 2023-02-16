Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFF7698DC5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 08:28:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSYgz-0002lU-Rh;
	Thu, 16 Feb 2023 07:28:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pSYgx-0002lN-VE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 07:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/s/DDvoDqvkI0R3gCjxwHuxsXwGnIrRYiSsKEv400/g=; b=acXzcirNPIjP+Kjk+n8wAZsnC+
 CvMJvLv2n01xjQ+Mb4AbOVo2A/OnL7edUaDQCYedlvLw2sYJt+TLRXKtiEOr7Oe+uszFt3wcos9eg
 D0oPuRJO88lim6ufMD0DqekNHY/0jQivlY9/a2TLSwZbZhU9ZqqWqjXSBOr0RC4qZbOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/s/DDvoDqvkI0R3gCjxwHuxsXwGnIrRYiSsKEv400/g=; b=S
 p+GsrQCYyA0BL6pa0VoHZx1Uy6DkoKinFWDZBn2DTmvg/cdH3doONs1Yc64ovJNyFZuncAc/VWY88
 TcXxzqtA9RgMic6/2H6ZS+1D6LQZoiv5SSJ52kzMInZgsMqDziuyH7rfT/jEr6GRXhhoHv1FuPw8W
 BvIO6MEj7G35z3JY=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSYgv-0001Gc-4W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 07:28:31 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230216072823epoutp041ed487583a9bcc124d1e6083d8e96178~EPW3VNLph1249612496epoutp04J
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Feb 2023 07:28:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230216072823epoutp041ed487583a9bcc124d1e6083d8e96178~EPW3VNLph1249612496epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1676532503;
 bh=/s/DDvoDqvkI0R3gCjxwHuxsXwGnIrRYiSsKEv400/g=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=L+RBRGvnQaZDCIqFx12dO+eKvjBFleHXqMZm9ndCCP4TxQ9HSjsHmq8Mo3PvNOwpC
 gKVJXSTVCiDWFrZX7PehW8lfrQevYFP/OqR1310pNQHXPgsiyUHKA/qE8sCMJpGDIH
 KkW/L3I76dqVRfcFV43QIRf1SeKGgQmS6UhFzN94=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230216072822epcas2p18e56acc255c73e58d7f98a47da295c2c~EPW3DGu_N1714217142epcas2p1K;
 Thu, 16 Feb 2023 07:28:22 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.69]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4PHRPf40ryz4x9Pr; Thu, 16 Feb
 2023 07:28:22 +0000 (GMT)
X-AuditID: b6c32a48-1f7ff70000021624-37-63eddb1648e5
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 0C.B8.05668.61BDDE36; Thu, 16 Feb 2023 16:28:22 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "daehojeong@google.com"
 <daehojeong@google.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230216072821epcms2p35e1fecca382380723ac0031862687173@epcms2p3>
Date: Thu, 16 Feb 2023 16:28:21 +0900
X-CMS-MailID: 20230216072821epcms2p35e1fecca382380723ac0031862687173
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmqa7Y7bfJBqc3S1mcnnqWyWJq+15G
 i1UPwi2aF69ns3iyfhazxaVF7haXd81hs1iw8RFQrmMuowOnx4JNpR6bVnWyeeyfu4bdY/eC
 z0wefVtWMXp83iQXwBaVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtq
 q+TiE6DrlpkDdJKSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9d
 Ly+1xMrQwMDIFKgwITvj2JaprAUX2CombspsYDzA2sXIySEhYCJxesF3pi5GLg4hgR2MEjen
 LwNKcHDwCghK/N0hDGIKC9hI/L1hB1IuJKAkce1ALwuILSygL7F58TJ2EJtNQFfi74bl7CBj
 RAQmM0lM+LKCCSTBLHCIUWLHZ0aIXbwSM9qfskDY0hLbl2+FimtI/FjWywxhi0rcXP2WHcZ+
 f2w+VI2IROu9s1A1ghIPfu6GiktKLDp0ngnCzpf4u+I6G4RdI7G1oQ0qri9xrWMj2F5eAV+J
 q2vfgcVZBFQl/ny/D1XjIrFw9j8WiJvlJba/ncMM8juzgKbE+l36IKaEgLLEkVtQFXwSHYf/
 ssN8tWPeE6gpahKbN22GhqyMxIXHbVBXekhM2nqPGRKEgRKP+t+yT2BUmIUI51lI9s5C2LuA
 kXkVo1hqQXFuemqxUYEJPGaT83M3MYKTppbHDsbZbz/oHWJk4mAEBjYHs5II76abb5KFeFMS
 K6tSi/Lji0pzUosPMZoCfTyRWUo0OR+YtvNK4g1NLA1MzMwMzY1MDcyVxHmlbU8mCwmkJ5ak
 ZqemFqQWwfQxcXBKNTApx7Bl3Hp33MXZ+mojW/TPk9y2Sd9b676t2q8ntKnl8dTSL2oPD9jZ
 HLmtpVoeftRX9ebsxy4uzx4577j0J2yaece0z0zSHJ9q+54kWdfrLzNunsrU+UDyxz8Xzwn9
 GR9umB+pSuaqWnNFarJB6lfH1e7RRssDHu47dH9rzP+4ib51tpE1px/7S/iJeDx7HitqNbtw
 6qRKn8yjN6Q+nVQ8fOcWH/e6/m9PTrYomB3KitaNiGffdMjyV4lH3KPodxPW9UpPWOHZzZjN
 rfAnaoHH+0T3RXULD2zrOxSdfkO7hU1Sgvnrrkfbl7kuuFZh8crU0z4k0uTPvQPu4f+lFxby
 HL/D+vbJvcBdj+5Y9C1VYinOSDTUYi4qTgQAWdPf8SMEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6
References: <CGME20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p3>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When f2fs skipped a gc round during victim migration, there
 was a bug which would skip all upcoming gc rounds unconditionally because
 skipped_gc_rwsem was not initialized. It fixes the bug by correctl [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSYgv-0001Gc-4W
Subject: [f2fs-dev] [PATCH v2] f2fs: fix uninitialized skipped_gc_rwsem
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When f2fs skipped a gc round during victim migration, there was a bug which
would skip all upcoming gc rounds unconditionally because skipped_gc_rwsem
was not initialized. It fixes the bug by correctly initializing the
skipped_gc_rwsem inside the gc loop.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Signed-off-by: Yonggil Song <yonggil.song@samsung.com>

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index b22f49a6f128..81d326abaac1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1786,8 +1786,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 				prefree_segments(sbi));
 
 	cpc.reason = __get_cp_reason(sbi);
-	sbi->skipped_gc_rwsem = 0;
 gc_more:
+	sbi->skipped_gc_rwsem = 0;
 	if (unlikely(!(sbi->sb->s_flags & SB_ACTIVE))) {
 		ret = -EINVAL;
 		goto stop;
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
