Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B4698AB6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 03:58:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSUT8-00089q-A3;
	Thu, 16 Feb 2023 02:57:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pSUT7-00089f-DC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 02:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/s/DDvoDqvkI0R3gCjxwHuxsXwGnIrRYiSsKEv400/g=; b=lO8T3z9sRdiYcwaM7oIO7RNjZo
 1T484YUpAbhPJpaQb9Ra4BzXy6n0qfmOjfFJxwDLHUGag9PzRmDrFnd40SyUBJFnPWq3Ccujl7jlm
 RwKjWMbfVyvy1TdJ8CwyWtUmkht6FXOkgC6xACH0+3zbok6AjOuDhsJh6ZOQEJ086bSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/s/DDvoDqvkI0R3gCjxwHuxsXwGnIrRYiSsKEv400/g=; b=I
 VeJQUC9AdhB5CoGmMB6vEwrJmiuJ96src9LeEd5X8o/vUBEam52nlngJ+q1e0/vfG+3XPaGYMCeqD
 BYbTsMgUpCMQvDJpGLwjKBRme+hpuxH4VATtga4lv1HFyXuFx4yNbKvbEPTU2+C53HrSMd6fINFqC
 Tlz2d4s74h3QFVLo=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSUT4-0002In-HP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 02:57:57 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230216025745epoutp038260a907f5ecb8a4b59559ae27ead344~ELqksjEc11777217772epoutp03I
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Feb 2023 02:57:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230216025745epoutp038260a907f5ecb8a4b59559ae27ead344~ELqksjEc11777217772epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1676516265;
 bh=/s/DDvoDqvkI0R3gCjxwHuxsXwGnIrRYiSsKEv400/g=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=W2q1n7vZLO/mbYv4g3UpVezQkggl/3F2/vZo/HI5ICNQ/YeigJCiqrbPcNTzNHTwo
 AvvmCafZJIesovoBrtsCwIwK5qQ1pkh6OAWhn1LIUDN4syVzwAxaHvRdDfF9eGXcBK
 gEOAGYa1NPF5ZfRz9St0Acuv57bR4DP40OzQrEbc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20230216025745epcas2p33d13ec8159efa85b6bf194c6f3d6a379~ELqkatBD21025710257epcas2p3e;
 Thu, 16 Feb 2023 02:57:45 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4PHKPN5kszz4x9Pw; Thu, 16 Feb
 2023 02:57:44 +0000 (GMT)
X-AuditID: b6c32a46-4e1ff70000007a4b-23-63ed9ba80101
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B6.2C.31307.8AB9DE36; Thu, 16 Feb 2023 11:57:44 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230216025743epcms2p31d1bde5cfb315d13231010b0a46fbec4@epcms2p3>
Date: Thu, 16 Feb 2023 11:57:43 +0900
X-CMS-MailID: 20230216025743epcms2p31d1bde5cfb315d13231010b0a46fbec4
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7bCmme6K2W+TDf6161ucnnqWyWLVg3CL
 J+tnMVtcWuRucXnXHDaLVR1zGR3YPDat6mTz2L3gM5NH35ZVjB6fN8kFsERl22SkJqakFimk
 5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYArVZSKEvMKQUKBSQWFyvp
 29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGcc2zKVteACW8XE
 TZkNjAdYuxg5OSQETCRWzdzD2MXIxSEksINR4sCchSxdjBwcvAKCEn93CIOYwgI2En9v2IGU
 CwkoSVw70MsCYgsL6EtsXryMHcRmE9CV+LthOTvIGBGBB4wSU27sZQNJMAsESdyf8gBqF6/E
 jPanLBC2tMT25VsZIWwNiR/LepkhbFGJm6vfssPY74/Nh6oRkWi9dxaqRlDiwc/dUHFJiUWH
 zjNB2PkSf1dcZ4OwayS2NrRBxfUlrnVshHrLV+JokztImEVAVaL15VyoMS4Sf/c3MUOcLC+x
 /e0cZpByZgFNifW79EFMCQFliSO3WCAq+CQ6Dv9lh3lqx7wnUIvUJDZv2gz1rIzEhcdtUNM9
 JCZtvccMCcFAiUf9b9knMCrMQgTzLCR7ZyHsXcDIvIpRLLWgODc9tdiowAgescn5uZsYwSlQ
 y20H45S3H/QOMTJxMB5ilOBgVhLh3XTzTbIQb0piZVVqUX58UWlOavEhRlOgjycyS4km5wOT
 cF5JvKGJpYGJmZmhuZGpgbmSOK+07clkIYH0xJLU7NTUgtQimD4mDk6pBqYijvuHb/GtcF/1
 p+7fZve5DbVr2ff+3My+aB/TtvdLNL90fzTSu1HEF3rbp2Dq/CTp6Zf/rCw02Xp5mvCkCI2M
 3IrPrfq8a5WlGh9Vcxz/vNXrYvXP3K3ndti+1zgh/+bf+zePK/7PV17lftvJJuzEt9NPqk5M
 NltgWX1m3fF/jwVnRFlyV0S7xW66pD3h7pPFbhUrmLnmWNbxJPEwrnq3snuVZezUqNCZr8x3
 rT2wTXQFK89jPuNAc9Z8hlUPfyR5OF3S/rDTR9wuXGWjaVF9/OtmQbFNvW7P2F9WZxRbpZmJ
 aZ5t4X/gcMfeVVzsUfjSH1s8VbdG3vObXHtcVnZb+lNDwS93DpvdPF3hJjNFiaU4I9FQi7mo
 OBEAxwCkCgoEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6
References: <CGME20230215024850epcms2p22be2cc864d82b44f31c19a7ef28770b6@epcms2p3>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When f2fs skipped a gc round during victim migration, there
 was a bug which would skip all upcoming gc rounds unconditionally because
 skipped_gc_rwsem was not initialized. It fixes the bug by correctl [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pSUT4-0002In-HP
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>
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
