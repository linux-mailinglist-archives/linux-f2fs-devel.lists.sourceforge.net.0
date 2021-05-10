Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307F377EBE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 10:54:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg1gV-00006X-Om; Mon, 10 May 2021 08:54:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sw0312.kim@samsung.com>) id 1lg1gT-00005C-V3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 08:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SUBr2y/PBEiI0e8ZSr77t9QwUjZM22om9idUT5ta3TI=; b=CSXXpF04MxuGO9RgvPSttWCG1h
 t07vAu7rQLiCAgCBou05F/7ggtOeBgLtlG0Y2jPwpYafUITcXSfiI/yDmT8AkXWqhoLRHAlfXbspi
 ojVttbPU6NenLBIEcHaTscp+ZdSA9qS2icYYPR3KF/9otzveCnP8fYuQupisF0s1vo6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SUBr2y/PBEiI0e8ZSr77t9QwUjZM22om9idUT5ta3TI=; b=J
 pSLt/34S8dwF2CZLIar0/FIZ3dGUBUNVlHtWJW2XmPN0XarEZsVZZdmyHsFLN4Ub3TeCvgpNZW8m9
 itERYvbmjMYO6LS7Tgd+GfMLCnZOhnJ0inTvO/I+fMgdJn5Js+1vYt4Xs78PhFOkM2CbrcOp9M7Ao
 vMeZKmcIh9zCh9R0=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg1gN-000wn3-Lm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 08:54:38 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210510085425epoutp0495487d68c2ad23c398a524c5eb090d09~9qKRoRGVQ1027810278epoutp04e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 May 2021 08:54:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210510085425epoutp0495487d68c2ad23c398a524c5eb090d09~9qKRoRGVQ1027810278epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1620636865;
 bh=SUBr2y/PBEiI0e8ZSr77t9QwUjZM22om9idUT5ta3TI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=nR0xWC9Eaf4HOXD7tLBolf2soRDuCCnEGh3iN6dXwSGnVwyoV13DhAJBQHxt+FDS/
 Daliy/HV45tkxsdu1Pz/2qD/p7xaUIYeSjrfVO/3S0d+piqAO7JrqOZUWc0AwGJGrj
 UBWsA4r36i8eQHPYHEDCKUDoyu25kST9t8T+M/kg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210510085424epcas1p1a4340aebbe43ec69dd01fb663abbd399~9qKRYP6A31254212542epcas1p1C;
 Mon, 10 May 2021 08:54:24 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.154]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4FdvxW0NWHz4x9QB; Mon, 10 May
 2021 08:54:23 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A2.9C.09578.BB4F8906; Mon, 10 May 2021 17:54:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210510085419epcas1p1e16c3966fc1b7b9f28a797eaa588f3ba~9qKMEOlOX1251812518epcas1p1N;
 Mon, 10 May 2021 08:54:19 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210510085419epsmtrp178c2f5efc4a11bdcb494d79894b718e0~9qKMDViMF2318023180epsmtrp1L;
 Mon, 10 May 2021 08:54:19 +0000 (GMT)
X-AuditID: b6c32a35-fb9ff7000000256a-c2-6098f4bb01eb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 89.29.08163.AB4F8906; Mon, 10 May 2021 17:54:18 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.223]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210510085418epsmtip18770a669ad2a5bb2224ff185cb11b0a7~9qKL4jwOY0042400424epsmtip1f;
 Mon, 10 May 2021 08:54:18 +0000 (GMT)
From: Seung-Woo Kim <sw0312.kim@samsung.com>
To: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 10 May 2021 17:57:25 +0900
Message-Id: <20210510085726.12663-1-sw0312.kim@samsung.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsWy7bCmnu7uLzMSDF5+ULc4PfUsk8WT9bOY
 LS4tcre4vGsOm8WMyS/ZHFg9Nq3qZPPYveAzk0ffllWMHp83yQWwRGXbZKQmpqQWKaTmJeen
 ZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gCtVVIoS8wpBQoFJBYXK+nb2RTl
 l5akKmTkF5fYKqUWpOQUWBboFSfmFpfmpesl5+daGRoYGJkCFSZkZ+w/XF4wi61iyrK/rA2M
 b1i6GDk4JARMJA4dz+9i5OIQEtjBKHH+11YmCOcTo8T/bZ/YIZzPjBI/P/1m7mLkBOuYOOEn
 C0RiF6PEi+232UESQgJfGCWOrisBsdkEdCT2L/nNCmKLCNhJzLhwjA1kHbOAp8SCSREgYWGB
 IImrU/Ywg4RZBFQljtxUBTF5BawlFqxQh9gkL3Fhwy2wIbwCghInZz5hAbGZgeLNW2czg1wg
 IbCNXWL6zp2MEA0uEjNu7WKHsIUlXh3fAmVLSbzsb2OHaGhmlFi65BcLhNPDKDFn0W1WiCpj
 if1LJzNB3KkpsX6XPkRYUWLn77mMEJv5JN597WGFhByvREebEESJisTOo5PYIMJSErM2BEOE
 PSTaz05jBAkLCcRK3DkmPIFRfhaSb2Yh+WYWwtoFjMyrGMVSC4pz01OLDQsMkeNzEyM40WmZ
 7mCc+PaD3iFGJg7GQ4wSHMxKIryiHdMShHhTEiurUovy44tKc1KLDzGaAkN3IrOUaHI+MNXm
 lcQbmhoZGxtbmBiamRoaKonzpjtXJwgJpCeWpGanphakFsH0MXFwSjUw1ZZ8uiE9Z8/H3p86
 i2Uerrv15r3/0bMP5Hnv8iRd3mORq8v8ZcGxhWpbF+5f1ujmeLGR1+9OzYmPN6aGV31SfDFh
 6qmAst1PGW55PLbzjtd+UWXWV3LmndojsTcMFrXbtv6Mua2741TcpFu1JXWPOmbXx1iyBi51
 W/Q2pt/0xQHVXXKeZ2I4XP/4rV3sZfT1+s05NxIeXfjrOPNtU84xzbONN7ad/3TjArdOpqbO
 Dqu6luaZOhqWU7s61zq83h18rPLEjmMOJqZdQvHMAkZdHavuPVyk+rTBfkrdJZM9O/dZBobM
 XSwgrlI4t3xDYeNptu7ba0yOeau9iY/78Iy5MvvHK5vULfLOBlflOGftWKrEUpyRaKjFXFSc
 CADJRsgU/QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNLMWRmVeSWpSXmKPExsWy7bCSnO6uLzMSDC51WVucnnqWyeLJ+lnM
 FpcWuVtc3jWHzWLG5JdsDqwem1Z1snnsXvCZyaNvyypGj8+b5AJYorhsUlJzMstSi/TtErgy
 9h8uL5jFVjFl2V/WBsY3LF2MnBwSAiYSEyf8BLK5OIQEdjBKXPv+lhkiISUx99t2xi5GDiBb
 WOLw4WKImk+MEge/rgCrYRPQkdi/5DcriC0i4CCxYtsWsKHMAr4S056uZAOxhQUCJF7dusAM
 ModFQFXiyE1VEJNXwFpiwQp1iE3yEhc23AKbwisgKHFy5hOoKfISzVtnM09g5JuFJDULSWoB
 I9MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzg8NPS2sG4Z9UHvUOMTByMhxglOJiV
 RHhFO6YlCPGmJFZWpRblxxeV5qQWH2KU5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cAk
 xtoa1PHj361Jh67e/Oj4wDvybDtTIzePysdiqbRXQpsOH/GYpnHrfIKGpas2k2pv5ucmE6ml
 js6XVmdG9c+86nN7Hst779PhN1l6bNkWz75ydlnDvCPsNs2Rq7eayziInTyvxrox6+Cit4Hn
 3x9hrovdfiUmM+vWs798n7K5Eh/XORrdv/olKnNL0gq+w6Yd01vEuUM7mla+Nujos9h1WIur
 0r7uVNGce8+2qv5cdeLcuvYfWjOKy/ZPiLcPOZlukc7mESPDdsn1m97Ee1IeW7LSEtZfaZZY
 sGnyE23H6v+9lpsbVU7pzW285zr5eMYnLrG//qd8uwSkbmYHZQtOk37Nwv1zx31biZZ9vxKU
 WIozEg21mIuKEwEo6UxyrgIAAA==
X-CMS-MailID: 20210510085419epcas1p1e16c3966fc1b7b9f28a797eaa588f3ba
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210510085419epcas1p1e16c3966fc1b7b9f28a797eaa588f3ba
References: <CGME20210510085419epcas1p1e16c3966fc1b7b9f28a797eaa588f3ba@epcas1p1.samsung.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lg1gN-000wn3-Lm
Subject: [f2fs-dev] [PATCH 1/2] fsck.f2fs: fix memory leak caused by
 fsck_chk_orphan_node()
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
Cc: sw0312.kim@samsung.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

With invalid node info from fsck_chk_orphan_node(), orphan_blk
and new_blk are not freed. Fix memory leak in the path.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 fsck/fsck.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index e52672032d2c..6019775dcb2d 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1780,8 +1780,11 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 			if (c.preen_mode == PREEN_MODE_1 && !c.fix_on) {
 				get_node_info(sbi, ino, &ni);
 				if (!IS_VALID_NID(sbi, ino) ||
-						!IS_VALID_BLK_ADDR(sbi, ni.blk_addr))
+				    !IS_VALID_BLK_ADDR(sbi, ni.blk_addr)) {
+					free(orphan_blk);
+					free(new_blk);
 					return -EINVAL;
+				}
 
 				continue;
 			}
-- 
2.19.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
