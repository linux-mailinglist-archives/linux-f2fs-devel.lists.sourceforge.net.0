Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 385BE926CE3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 03:02:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPArv-0002KB-Jx;
	Thu, 04 Jul 2024 01:02:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sPArr-0002K3-HT
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 01:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SRywyYtqWBt1JqxXnaHByQq7LKdm/U99W5lYcjMpL4o=; b=hCMW+iqDB2PnaDP0ukowF3SD6G
 cM+erWeHlsNpKvgStbZRUQhLFlnxbLguWSgJbFifEsN4pnxUf6uvlp7OhNmtyesom6CBAc7C48Xt7
 oDRwwO3/jPG5iheI6gjtcGccykkWum7V5kt7VfdYrEz/U97h1UDc3imn6akb+LdaLtKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SRywyYtqWBt1JqxXnaHByQq7LKdm/U99W5lYcjMpL4o=; b=E
 5msUQUyfEm0jocWk9KSna/gpVwCeJs+oVHiVJTDlLpZ5txC2q+JZJC20rRC8JXKwHowte1+Pic2p2
 fcNaeCdDob/ux0HyE+r0ihzJyhQwgpAJe2tbObFodPHuOS1qQkce7BB4iRx8AbaDSd+pGxDzR/YHu
 sBodBpijrh0h9gP4=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPArs-0003Ei-3p for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 01:02:36 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240704010223epoutp025b6ce6d6526e696817339d02c8c6b5b6~e3NuAAY531137311373epoutp02B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 Jul 2024 01:02:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240704010223epoutp025b6ce6d6526e696817339d02c8c6b5b6~e3NuAAY531137311373epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1720054943;
 bh=SRywyYtqWBt1JqxXnaHByQq7LKdm/U99W5lYcjMpL4o=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=YHsj+YGWXPGSmlhEXGHg6nZcnKBSyW034s0SzLYCLJEEkR9qXfM5ewvEfeZ6C02mJ
 tEVlbzZ6Sh7jSkJlX//yLZyD4EeYeunKdZOrBpGCs+zFNO0t5N8u8p7xXFgzc/mK64
 0NWQeea+YRCguhyQ+b/rnuGyFo9PLIWO5/IR+Hmg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20240704010222epcas2p243c529630d475eb5cbdafed0775a6576~e3NtasxUr1175911759epcas2p2d;
 Thu,  4 Jul 2024 01:02:22 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4WDyzd75Fxz4x9QN; Thu,  4 Jul
 2024 01:02:21 +0000 (GMT)
X-AuditID: b6c32a45-1c7ff70000002678-3a-6685f49d3e2d
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 B3.92.09848.D94F5866; Thu,  4 Jul 2024 10:02:21 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "daehojeong@google.com" <daehojeong@google.com>,
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
Message-ID: <20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4>
Date: Thu, 04 Jul 2024 10:01:21 +0900
X-CMS-MailID: 20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsWy7bCmme7cL61pBo+fWlicnnqWyeLlIU2L
 qe17GS1WPQi3+HHSxKJ/dzuLxZP1s5gtLi1yt7i8aw6bRcsfJ4vzE18zWazqmMtoMfX8ESYH
 Xo8Fm0o9Nq3qZPPYveAzk0ffllWMHp83yQWwRmXbZKQmpqQWKaTmJeenZOal2yp5B8c7x5ua
 GRjqGlpamCsp5CXmptoqufgE6Lpl5gCdp6RQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUot
 SMkpMC/QK07MLS7NS9fLSy2xMjQwMDIFKkzIzujdcZW9YDlnxbTe9YwNjFfZuxg5OSQETCQ2
 Lb/P3MXIxSEksINRou3XTrYuRg4OXgFBib87hEFqhAU8JU5dWcIIYgsJKEmsvziLHSKuJ3Hr
 4RqwOJuAjsT0E/fZQeaICMxlkpjefghsKLPADCaJJQ+/s0Fs45WY0f6UBcKWlti+fCsjhK0h
 8WNZLzOELSpxc/Vbdhj7/bH5UDUiEq33zkLVCEo8+LkbKi4pcXvuJqj6fIn/V5ZD2TUS2w7M
 g7L1Ja51bGSBeMxXYuI8f5Awi4CqxMmNi6FOc5G4eP8u2HhmAXmJ7W/nMIOUMwtoSqzfpQ9i
 SggoSxy5xQJRwSfRcfgvO8xTDRt/Y2XvmPeECcJWk1j3cz0TxBgZiVvzGCcwKs1ChPMsJGtn
 IaxdwMi8ilEstaA4Nz212KjAEB61yfm5mxjB6VTLdQfj5Lcf9A4xMnEwHmKU4GBWEuGVet+c
 JsSbklhZlVqUH19UmpNafIjRFOjhicxSosn5wISeVxJvaGJpYGJmZmhuZGpgriTOe691boqQ
 QHpiSWp2ampBahFMHxMHp1QD065KsZCHmZ0SeSebJnzg8wrUlWWcGGIT3yG0QVYpztZth1ZU
 seOO0CkL3Zcf2fezuK+xU96fqVQ54NnR03d4hfM/T5esizZbdrDkePCdR/lp04TLVphkxCm+
 8eLSrF466ajY7xtPDVb8MLz/d6s7y71L8c4H/lUfNgjyPsIac3WFYfrBRC+jnRN4njpEcFoc
 z/87Q0T+woZWG/4zi1ckLV6ziKs0tYJBZVJp0OUyidXM29ndvkSf3sf71+SJQlVi8rL5Pffy
 7z3q0hRybFufKPFF/PzKpln+LU9dL6/m2X1p88H5n25cnDn9E4fol4dVxi79bB8mT4/ruVth
 Z/n6eJL748OCs5aWfTzOqvnfTomlOCPRUIu5qDgRAHRtqtMwBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90
References: <CGME20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch fixes a potentially null pointer being accessed
 by is_end_zone_blkaddr() that checks the last block of a zone when f2fs is
 mounted as a single device. Fixes: e067dc3c6b9c ("f2fs: maintain six open
 zones for zoned devices") Signed-off-by: Daejun Park
 <daejun7.park@samsung.com>
 --- fs/f2fs/data.c | 4 +++- 1 file changed, 3 insertions(+), 1 deletion(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [203.254.224.25 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.25 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.25 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPArs-0003Ei-3p
Subject: [f2fs-dev] [PATCH] f2fs: fix null reference error when checking end
 of zone
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

This patch fixes a potentially null pointer being accessed by
is_end_zone_blkaddr() that checks the last block of a zone
when f2fs is mounted as a single device.

Fixes: e067dc3c6b9c ("f2fs: maintain six open zones for zoned devices")
Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 fs/f2fs/data.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b6dcb3bcaef7..1aa7eefa659c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -925,6 +925,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 #ifdef CONFIG_BLK_DEV_ZONED
 static bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr)
 {
+	struct block_device *bdev = sbi->sb->s_bdev;
 	int devi = 0;
 
 	if (f2fs_is_multi_device(sbi)) {
@@ -935,8 +936,9 @@ static bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr)
 			return false;
 		}
 		blkaddr -= FDEV(devi).start_blk;
+		bdev = FDEV(devi).bdev;
 	}
-	return bdev_is_zoned(FDEV(devi).bdev) &&
+	return bdev_is_zoned(bdev) &&
 		f2fs_blkz_is_seq(sbi, devi, blkaddr) &&
 		(blkaddr % sbi->blocks_per_blkz == sbi->blocks_per_blkz - 1);
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
