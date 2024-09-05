Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53A96CE6B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Sep 2024 07:25:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sm507-0007sV-7C;
	Thu, 05 Sep 2024 05:25:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sm506-0007sO-Dx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 05:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W4s+YGCDaaFjY8QvplVjSGT3b8EjDtobIvfTNI3DeYQ=; b=MluZfFI+DjE8oGb13BB+M2rTLN
 +ZmoJ6NGcmhgTCR3St4G9BvQkeiO5bia+R9N86Niae3QX93wLwCiVMDL1Z5vSEQBtBTaBa8XaJIgM
 E5Lv9WO894VuftpWkC7oGmSeTXDqovekoRW8ItJAeJ5Gybip41XFxA849+8qZXnQQo8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=W4s+YGCDaaFjY8QvplVjSGT3b8EjDtobIvfTNI3DeYQ=; b=X
 3BoGHBG3BXB4ciDAjKVdkkF39ZrooagdCmOmegW7AGoDfQm5U6PyHBCsec7Su8cglBIRZ+D+wkwd0
 HZvLaH4jidA0Qy/ddv0GS8gZ7zTRabeyKeA96OKNr9q0bvaUWyI+ZC30CAsnjHWWtdt8WBY9Oc2Gt
 zrZ5dQTQmhzxuyXI=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sm502-0006uc-SD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 05:25:45 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240905052535epoutp014ecf44ffb94ac073f0ca778fcc9ad609~yQcg9eHKf0260602606epoutp01x
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  5 Sep 2024 05:25:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240905052535epoutp014ecf44ffb94ac073f0ca778fcc9ad609~yQcg9eHKf0260602606epoutp01x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725513935;
 bh=W4s+YGCDaaFjY8QvplVjSGT3b8EjDtobIvfTNI3DeYQ=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=GglrP2DjSotETC1Ve52l97WhJ2dCJfuJ3sDwLRUJBr6s8sVH7dYrtNkaqHyxPgULL
 mF0N7ZcbBM1mWuyTHSksdFNmT5hDRD9UAGWqzreeLeSCRHLn10j3wXCCnZlKsyB4a5
 QGOQx1xodoyg8ncd8NMwVvIBDx2IMXCzgUQxkZGE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20240905052534epcas2p1a071b52d0b3e882fc499f6abb6d187b9~yQcf9icu-2001420014epcas2p1k;
 Thu,  5 Sep 2024 05:25:34 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.69]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4WznrG0Lm7z4x9Px; Thu,  5 Sep
 2024 05:25:34 +0000 (GMT)
X-AuditID: b6c32a46-24fff70000002752-6a-66d940cd1cfa
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 76.EA.10066.DC049D66; Thu,  5 Sep 2024 14:25:33 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
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
Message-ID: <20240905052433epcms2p1dac78dff43776cc158bac5ae9d118160@epcms2p1>
Date: Thu, 05 Sep 2024 14:24:33 +0900
X-CMS-MailID: 20240905052433epcms2p1dac78dff43776cc158bac5ae9d118160
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmqe5Zh5tpBt+7zC1OTz3LZPHykKbF
 qgfhFj9Omlj0725nsXiyfhazxaVF7haXd81hs2j542RxfuJrJotVHXMZLaaeP8LkwOOxaVUn
 m8fuBZ+ZPPq2rGL0+LxJLoAlKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkh
 LzE31VbJxSdA1y0zB+gqJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJu
 cWleul5eaomVoYGBkSlQYUJ2xvXFjUwFr7kq7h05ytTAeJuji5GTQ0LAROL7jyNMXYxcHEIC
 Oxgllu9vYuxi5ODgFRCU+LtDGKRGWMBdYv30VawgtpCAksT6i7PYIeJ6ErcermEEsdkEdCSm
 n7jPDjJHROABo8SUG3vZQBxmgRlMEvNO97JBbOOVmNH+lAXClpbYvnwrI4StIfFjWS8zhC0q
 cXP1W3YY+/2x+VA1IhKt985C1QhKPPi5GyouKXF77iao+nyJ/1eWQ9k1EtsOzIOy9SWudWwE
 28sr4CvxfMNfsF4WAVWJf7MWMEHUuEjsfPAGLM4sIC+x/e0cZlBAMAtoSqzfpQ9iSggoSxy5
 xQJRwSfRcfgvO8xXDRt/Y2XvmPcEarqaxLqf65kgxshI3JrHOIFRaRYioGchWTsLYe0CRuZV
 jGKpBcW56anFRgVG8LhNzs/dxAhOn1puOxinvP2gd4iRiYPxEKMEB7OSCO9rkRtpQrwpiZVV
 qUX58UWlOanFhxhNgR6eyCwlmpwPTOB5JfGGJpYGJmZmhuZGpgbmSuK891rnpggJpCeWpGan
 phakFsH0MXFwSjUwdeQXHanKPl96cVNqUrfyKfU5yndneHbX3p22KKfF/VGVjI6c4qb/muXa
 S1UPtH2WMTrt4z3J7vKzVV1vCl8Z3WMWyxPeF1PZcUuxdE/mNtfWx+w9Fl+vPlKI8JhjvOHd
 xNnr7b4bpqY4qx7fO/2l3S7levcms1g+75dnP7RmhX7vTuwNktv8f2b3q8YAcT7X0rjfRav6
 p31d/6ollnXDWn6NGXO62e593VzUpXsg/ur8c/Onak8/v/R78vbjvwtiH7wTv1i7Z+7MLoPP
 +wNW/TH8rWGuVfFXWHf/6ZjcnupVTyNuT3R6lGX7wEfiTXqPyNYTOU5L+A4c+bltW8zld694
 7nBPeqGtdzH4eoIDuxJLcUaioRZzUXEiAKremvEoBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240905052433epcms2p1dac78dff43776cc158bac5ae9d118160
References: <CGME20240905052433epcms2p1dac78dff43776cc158bac5ae9d118160@epcms2p1>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch addresses the problem that when using LFS mode,
 unused blocks may occur in f2fs_map_blocks() during block allocation for
 dio writes. If a new section is allocated during block allocation, it will
 not be included in the map struct by map_is_mergeable() if the LBA of the
 allocated block is not contiguous. However, the block already a [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sm502-0006uc-SD
Subject: [f2fs-dev] [PATCH v2] f2fs: avoid unused block when dio write in
 LFS mode
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

v2: Applied segment check code suggested by Chao Yu.


 fs/f2fs/data.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c6d688208f8b..b94cf6eea2f9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1712,6 +1712,14 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		dn.ofs_in_node = end_offset;
 	}
 
+	if (flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
+	    map->m_may_create) {
+		/* the next block to be allocated may not be contiguous. */
+		if (GET_SEGOFF_FROM_SEG0(sbi, blkaddr) % BLKS_PER_SEC(sbi) ==
+		    CAP_BLKS_PER_SEC(sbi) - 1)
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
