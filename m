Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9F19445D1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2024 09:48:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sZQY6-0006bj-E0;
	Thu, 01 Aug 2024 07:48:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sZQY3-0006bb-6C
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Aug 2024 07:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V/OQizZH033qH8C4iqIA1G7wnp72fkVhXBE0pNPn1Sk=; b=brr1epfWFpq5t5i+MMlSyC/qia
 A6zkAQEcFS3WkwsiRStzfvTaSgybpITJZdth2bfOXOlE6I8mcmcqcR5LSHqMRYBGnlsIs5M+jyQGS
 1DUqM48Ydr8Q4HNiGSW6LxTcMNAo6GqFjZC8L6EbMg8QMZSjLsAHkhxGs5FHK65+vuwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V/OQizZH033qH8C4iqIA1G7wnp72fkVhXBE0pNPn1Sk=; b=n
 QITWd8waJvWxN6+PhurAK6uUd2XsgnVSezMne2zwNgxnTx0DKrhQ2O+QpiT6Z5QCOOZPsbNSBH8oj
 TTZJhNAyS9YbPpSRPAdz2UmwAVtBfwglQ/bmpNKa4ExI4BwVP1rDjx77SgxYyZNC+oYvJynFh+Fa1
 mb71KgzNaiEqETjQ=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sZQY2-0002xw-Gc for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Aug 2024 07:48:31 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240801074818epoutp0141d13d14869c4fa07006677b26a9f3ae~ni0INDFrC3154531545epoutp01u
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  1 Aug 2024 07:48:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240801074818epoutp0141d13d14869c4fa07006677b26a9f3ae~ni0INDFrC3154531545epoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1722498498;
 bh=V/OQizZH033qH8C4iqIA1G7wnp72fkVhXBE0pNPn1Sk=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=ovf2qlLM8ZkhvMfn7V1S4PIasdwRTFh+0OuG1KUfKZ353LfUUkTZdP48YzueBVkT0
 4AZhxYrSOnr2/ekIjzYlOkU9J0LlRJbOUcCwZnWddfyM7ipQcr6ROcx6NRQBUnCTho
 Q52I8CJdpOUEIs+tPZJL3cCzs18bxM6xp+UtBpT4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20240801074817epcas2p4846c2a33c31df385de449d9b3328237c~ni0Hr4K3-1221412214epcas2p4K;
 Thu,  1 Aug 2024 07:48:17 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.69]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4WZLg51JRgz4x9QM; Thu,  1 Aug
 2024 07:48:17 +0000 (GMT)
X-AuditID: b6c32a45-ffffa700000028bf-12-66ab3dc10cc0
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 7B.6A.10431.1CD3BA66; Thu,  1 Aug 2024 16:48:17 +0900 (KST)
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
Message-ID: <20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p7>
Date: Thu, 01 Aug 2024 16:47:15 +0900
X-CMS-MailID: 20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmue5B29VpBl9/slqcnnqWyeLlIU2L
 VQ/CLX6cNLHo393OYvFk/Sxmi/tbrzFaXFrkbnF51xw2i5Y/ThbnJ75msljVMZfRYur5I0wO
 vB6bVnWyeexe8JnJo2/LKkaPz5vkAliism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUN
 LS3MlRTyEnNTbZVcfAJ03TJzgE5TUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSY
 F+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnXO0oL9jPXXF17S/mBsYlnF2MnBwSAiYSv07/Y+ti
 5OIQEtjBKLHn/j/WLkYODl4BQYm/O4RBaoQFXCSWvzjNBmILCShJrL84ix0iridx6+EaRhCb
 TUBHYvqJ+2BxEYFXjBJnVouCzGQW2MskcWfJBCaIZbwSM9qfskDY0hLbl29lhLA1JH4s62WG
 sEUlbq5+yw5jvz82H6pGRKL13lmoGkGJBz93Q8UlJW7P3QRVny/x/8pyKLtGYtuBeVC2vsS1
 jo1ge3kFfCXaf2wEi7MIqEr8P70TaqaLxI6zq8GeZBaQl9j+dg4zKByYBTQl1u/SBzElBJQl
 jtxigajgk+g4/Jcd5quGjb+xsnfMewL1uZrEup/rmSDGyEjcmsc4gVFpFiKcZyFZOwth7QJG
 5lWMYqkFxbnpqcVGBYbwmE3Oz93ECE6iWq47GCe//aB3iJGJg/EQowQHs5IIr9DJlWlCvCmJ
 lVWpRfnxRaU5qcWHGE2BHp7ILCWanA9M43kl8YYmlgYmZmaG5kamBuZK4rz3WuemCAmkJ5ak
 ZqemFqQWwfQxcXBKNTDlPvrlFHGkw+FAoN2hz3fXbsrZyiOpc+d26GVPs3K2SrVlx63D0lZ0
 Xw9zuPgy1faosvi3yvKuH4YGqT4aeyIln5+QdtiziSlioYzRt0+FLw8zv37jq307bAnzOYa5
 s0KT/znaOV8pElQJLHDhcuEW1UyoSon89srDYxXX1jr7hgrB4xqy/uoWXSLLJixa2XPS1XjG
 87mBhm9zf+tn+ascFku457tyw3HZ37bMLy9F/uldrBDLcVymor7qwDHjfcp32GK2tp7iEF+W
 qO5c3960hC1q0zoHM0WrRWmOedLbFJ+Xvkl3fLTf4k0b7y8XgwWPO9buW7R0J7t18PX625uX
 N4b+ZrVRTfG/x/r/pxJLcUaioRZzUXEiAPdMfekrBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b
References: <CGME20240801074715epcms2p788934486cd0e8090f67ed0d7cffbc91b@epcms2p7>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch addresses the problem that when using LFS mode,
 unused blocks may occur in f2fs_map_blocks() during block allocation for
 dio writes. If a new section is allocated during block allocation, it will
 not be included in the map struct by map_is_mergeable() if the LBA of the
 allocated block is not contiguous. However, the block already a [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sZQY2-0002xw-Gc
Subject: [f2fs-dev] [PATCH] f2fs: avoid unused block when dio write in LFS
 mode
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
 Seokhwan Kim <sukka.kim@samsung.com>, Jeuk Kim <jeuk20.kim@samsung.com>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch addresses the problem that when using LFS mode, unused blocks
may occur in f2fs_map_blocks() during block allocation for dio writes.

If a new section is allocated during block allocation, it will not be
included in the map struct by map_is_mergeable() if the LBA of the
allocated block is not contiguous. However, the block already allocated
in this process will remain unused due to the LFS mode.

This patch avoids the possibility of unused blocks by escaping
f2fs_map_blocks() when allocating the last block in a section.

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 fs/f2fs/data.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b6dcb3bcaef7..b27a3f448f32 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1711,6 +1711,19 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		dn.ofs_in_node = end_offset;
 	}
 
+	if (flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi)) {
+		int segno = GET_SEGNO(sbi, blkaddr);
+		bool last_seg, last_blk;
+
+		last_seg = !((segno + 1) % SEGS_PER_SEC(sbi));
+		last_blk = (f2fs_usable_blks_in_seg(sbi, segno) - 1) ==
+				GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
+
+		/* LBA of the next block to be allocated may not be contiguous. */
+		if (last_seg && last_blk)
+			goto sync_out;
+	}
+
 	if (pgofs >= end)
 		goto sync_out;
 	else if (dn.ofs_in_node < end_offset)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
