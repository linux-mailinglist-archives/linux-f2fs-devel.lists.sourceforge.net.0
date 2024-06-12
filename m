Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3164F9048E6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 04:21:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHDc3-0001oi-4x;
	Wed, 12 Jun 2024 02:21:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sHDc2-0001oc-4U
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 02:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aHiTLqz3DTEetGM77pTEUK8RRyp3MuomMyvuo5JbqcY=; b=F+GQNMeQ4MzB6D44UQrIKgeMYZ
 DVhJ1jQ/EHCkxpkW73dQ4l+bc3y8XlT80SC/5ZS3B4okNcw1yi0A1JP9jB7JPRvYSXMXik6Uflz/N
 g83ULfUGHl8SV8xrWUqH8FuMq31lhT2UgmmqWdHVPdVDAwuRFBIsOICF0iLRUo6r+zP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aHiTLqz3DTEetGM77pTEUK8RRyp3MuomMyvuo5JbqcY=; b=c
 UjsnnqAxoBQOq9l60NnwY0erWLwDgNCPeergTOLdfPseCtjEimKudUNq/7C5Zho3RZWl80uNUbNNr
 5ooKiuFvpYXwGXYR0fW9Y4VF6AS1lmgM5q3AlyPMfkk5I3BY1hum/+71fKYff1c1ep/MXkXTElrYx
 DNBZj2Qjc3k2+AnE=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHDc2-0001fZ-23 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 02:21:22 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240612022114epoutp02c1f1261ede274c303d72df5b166ba08d~YIGSMb5S_1733417334epoutp02E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Jun 2024 02:21:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240612022114epoutp02c1f1261ede274c303d72df5b166ba08d~YIGSMb5S_1733417334epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1718158874;
 bh=aHiTLqz3DTEetGM77pTEUK8RRyp3MuomMyvuo5JbqcY=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=TWrSV3zL3WX7ncK0gCU8tR+LluTJOxaTm4/cj6sSMmFtSTxJdZVCculQFuGzzO0cc
 K1mOXeRpDRuYGApD9KCe9qWXUO1Jq+ZY9F/I7cHrdCu3w6t1aBZmDagns3molgr6cr
 Zd5O/mscRw5gs+KuQ4aX3n9zAQ+KnP798i9hpL+c=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20240612022113epcas2p388bb2006691b6ca36d3fe0ce4a07c590~YIGRpYg_n2118421184epcas2p34;
 Wed, 12 Jun 2024 02:21:13 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4VzTmn0hqqz4x9Q6; Wed, 12 Jun
 2024 02:21:13 +0000 (GMT)
X-AuditID: b6c32a47-4f767a800000264e-db-666906188eb0
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 78.A3.09806.81609666; Wed, 12 Jun 2024 11:21:13 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240612022012epcms2p77300b5130d18b0397c9fc2877704949d@epcms2p7>
Date: Wed, 12 Jun 2024 11:20:12 +0900
X-CMS-MailID: 20240612022012epcms2p77300b5130d18b0397c9fc2877704949d
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmua4kW2aawZktTBanp55lsnh5SNNi
 1YNwix8nTSx+Pulgs+jf3c5i8WT9LGaLS4vcLS7vmsNm0fLHyeL8xNdMFqs65jJaTD1/hMmB
 12PTqk42j90LPjN59G1ZxejxeZNcAEtUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6h
 pYW5kkJeYm6qrZKLT4CuW2YO0GlKCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALz
 Ar3ixNzi0rx0vbzUEitDAwMjU6DChOyMK39nMBb84Ko4/yWvgfEcRxcjJ4eEgInEsl1/WboY
 uTiEBHYwSjQe2c/excjBwSsgKPF3hzBIjbCAg8SMA5tZQGwhASWJ9RdnsUPE9SRuPVzDCGKz
 CehITD9xHywuIvCKUeLMalGQmcwCB5kkPp6ezQ6xjFdiRvtTFghbWmL78q2MELaGxI9lvcwQ
 tqjEzdVv2WHs98fmQ9WISLTeOwtVIyjx4OduqLikxO25m6Dq8yX+X1kOZddIbDswD8rWl7jW
 sRFsL6+Ar8SBdw1gcRYBVYlpN6azQdS4SNx89BFsJrOAvMT2t3OYQeHALKApsX6XPogpIaAs
 ceQWC0QFn0TH4b9wXzVs/I2VvWPeEyYIW01i3c/1TBBjZCRuzWOcwKg0CxHOs5CsnYWwdgEj
 8ypGsdSC4tz01GKjAmN4zCbn525iBCdRLfcdjDPeftA7xMjEwXiIUYKDWUmE90xMepoQb0pi
 ZVVqUX58UWlOavEhRlOghycyS4km5wPTeF5JvKGJpYGJmZmhuZGpgbmSOO+91rkpQgLpiSWp
 2ampBalFMH1MHJxSDUztif9FGFvDIm5OyVZQ+s3jslLMy3nv5PcMCXVH/Q+7Mhnp1VzK1pqX
 yZzH/+zQvC+s9Zfr0+01hFh9Kna+NWiLv8++VL5/Y3hY9Ym8+NMzLPZ8/Sa67HFuNiu32crK
 RzXrPnKnr7rOrh7vcK4j3+tJ+v9PywP513ZuZXdYwcSpsnDJo3dFMws2z7/tu/iwxNFj8zl3
 xPtc0Q2dxTc54V7DhZtR1wLV448v2uxXanitoHxRVvjyjEebt8bwWQXO11/76tfLavFn+h1u
 p7zeOS6dlOZ3sDRRkcHln0VZhkd9wekrTFo/J7x45tuxr2ze7Q9Z6k+1kjQfNvhbP2356dFt
 evneJ7uItf+W7vUq8VRiKc5INNRiLipOBACaB+P9KwQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240612022012epcms2p77300b5130d18b0397c9fc2877704949d
References: <CGME20240612022012epcms2p77300b5130d18b0397c9fc2877704949d@epcms2p7>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reported a bug in f2fs_vm_page_mkwrite() which checks
 for f2fs_has_inline_data(inode). The bug was caused by
 f2fs_convert_inline_inode()
 not returning an error when called on a read-only filesy [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.25 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.25 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHDc2-0001fZ-23
Subject: [f2fs-dev] [PATCH] f2fs: fix convert inline inode on readonly mode
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
Reply-To: daejun7.park@samsung.com
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reported a bug in f2fs_vm_page_mkwrite() which checks for
f2fs_has_inline_data(inode).
The bug was caused by f2fs_convert_inline_inode() not returning an
error when called on a read-only filesystem, but returning with the
inline attribute as set.
This patch fixes the problem by ensuring that f2fs_convert_inline_inode()
returns -EROFS on readonly.

Fixes: ec2ddf499402 ("f2fs: don't allow any writes on readonly mount")
Reported-by: syzbot+f195123a45ad487ca66c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f195123a45ad487ca66c
Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 fs/f2fs/inline.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 7638d0d7b7ee..ae1d8f2d82c9 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -203,10 +203,12 @@ int f2fs_convert_inline_inode(struct inode *inode)
        struct page *ipage, *page;
        int err = 0;

-       if (!f2fs_has_inline_data(inode) ||
-                       f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
+       if (!f2fs_has_inline_data(inode))
                return 0;

+       if (unlikely(f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb)))
+               return -EROFS;
+
        err = f2fs_dquot_initialize(inode);
        if (err)
                return err;
--
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
