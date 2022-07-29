Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA2584930
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Jul 2022 02:42:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oHE56-0000js-2N; Fri, 29 Jul 2022 00:42:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <eunhee83.rho@samsung.com>) id 1oHE55-0000jm-7v
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jul 2022 00:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=koeQxC1CaOa4b7/9eLTD8KByAFxytDocEf6VI8T3VaY=; b=F7bBQraV0CxIWsx819MVjzY1Ig
 tth/e+N5ydgyhlN66M7e8belhjbPe2Av7N2aWcEER8DmG5bv4eBkmmuEpV6Pp5OpVsPo7IgrT2UaC
 RSmfI8xg8U6FyU24GNNLt2TAgug5nJ4JN5+dJP4xQFn+/P3OEy03UQZ28drGBrX9CzMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=koeQxC1CaOa4b7/9eLTD8KByAFxytDocEf6VI8T3VaY=; b=J
 5cI1ak5UJL2b8kJAbS5dOJGzOOYl5WyL2KIG677oJa/e4lVap+SNJLzKMv3KX+eTmxH0ddzOdvSRr
 cjW9joLWAeCxpJI4VRBooF1wC6x4THYHt5JxIpuvv7ZZbSsIwnBDp56EIJaNa7VGhVZEePcUHiNrN
 orXC34/GsRZEtoWM=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oHE4z-0006PY-6u
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jul 2022 00:42:17 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20220729002519epoutp0412d4fc556845c66aabf21227edbe7b72~GJRz0wO-01086310863epoutp04k
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Jul 2022 00:25:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20220729002519epoutp0412d4fc556845c66aabf21227edbe7b72~GJRz0wO-01086310863epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1659054319;
 bh=koeQxC1CaOa4b7/9eLTD8KByAFxytDocEf6VI8T3VaY=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=aFerxI/GjYtOUusWSxc1D7ZQDDWuH2rQoF/q9VJICNS1sohQMRsUJe+ZsMjIsp56J
 0zqj2crhyKac8YJ1lBi67cJb1YZnebtUOWYXdqshtOPe9dvuQF2QUoY7psaiedVmxF
 KMCQHj5iAH13lbckKgTzy1jzQt1tpQGNnuaIn7E4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20220729002518epcas2p462b8f60cd410cdfbe5e811bd5e1586ec~GJRzjMA8O2734727347epcas2p46;
 Fri, 29 Jul 2022 00:25:18 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.69]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Lv7Zk3DN6z4x9Q3; Fri, 29 Jul
 2022 00:25:18 +0000 (GMT)
X-AuditID: b6c32a45-471ff700000025c2-8b-62e328edb123
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 33.79.09666.DE823E26; Fri, 29 Jul 2022 09:25:17 +0900 (KST)
Mime-Version: 1.0
From: Eunhee Rho <eunhee83.rho@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Eunhee Rho <eunhee83.rho@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20220729002517epcms2p35eed262c3349287436c1848ab350c2d4@epcms2p3>
Date: Fri, 29 Jul 2022 09:25:17 +0900
X-CMS-MailID: 20220729002517epcms2p35eed262c3349287436c1848ab350c2d4
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmue5bjcdJBk8v61ucnnqWyeLlIU2L
 n0862CyerJ/FbHFpkbvF5V1z2BzYPDat6mTz2L3gM5NH35ZVjB6fN8kFsERl22SkJqakFimk
 5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYArVZSKEvMKQUKBSQWFyvp
 29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGdcbpjDWnCYraLl
 3G2WBsYVrF2MHBwSAiYSV2a6djFycQgJ7GCUaD6wiBkkzisgKPF3h3AXIyeHsICNxMbma+wg
 tpCAksTfg/eZIOK6ElO2TGIEsdkEtCWuHG9nBZkjIjCRSeLAznesIAkJAV6JGe1PWSBsaYnt
 y7cyQtgaEj+W9TJD2KISN1e/ZYex3x+bD1UjItF67yxUjaDEg5+7oeISEnc3trBB2PkSPU+O
 MkHYFRI7V1yFqtGXuNaxEWwvr4CvxOv5fWA2i4CqxJw7nVD3uEjs/joXrJdZQF5i+9s5YL8z
 C2hKrN+lDwkeZYkjt1hgPmnY+Jsdnc0swCfRcfgvXHzHvCdQ16hJLP64ABoKMhI3NtyHintI
 NC3ewDqBUXEWIqBnIblhFsINCxiZVzGKpRYU56anFhsVGMKjNjk/dxMjOA1que5gnPz2g94h
 RiYOxkOMEhzMSiK8CdH3k4R4UxIrq1KL8uOLSnNSiw8xmgJ9P5FZSjQ5H5iI80riDU0sDUzM
 zAzNjUwNzJXEeb1SNiQKCaQnlqRmp6YWpBbB9DFxcEo1MMWYlL438Z/v9ewwm3GlMNcNVo3n
 lrF5ZR9u8smvy7sh9dfnkjgLYyJruq9Dwo2wX790lJu/HlfesFtsz0GNjNx/B3XXhJe+rTum
 471Kct0mPv+qysipU+9fWdbwIuZdx/k/dxYIhf5eFtmTyGOjfSLOeUPgNHMOdUFVy52Gl69H
 zpKsX979/qWJkM3ZFYc1ZrlGy8dHVjAEGl/evbJrioD9jXUTzeZ9dVi+rHJNYMPDsJZ1GfwO
 E8JCXDluPl7AdPKZlwz7Jo/EH17+GllHtnf1KZtsN//96NXZBU556+3rdMPcEpo6Kq1zmuwq
 fz5kWBfeyZ9toN5d8KM0oYp3ioDV/7ivz0pqD60wdbmoxFKckWioxVxUnAgA16imRwwEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220729002517epcms2p35eed262c3349287436c1848ab350c2d4
References: <CGME20220729002517epcms2p35eed262c3349287436c1848ab350c2d4@epcms2p3>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For zoned devices, f2fs forbids direct IO and forces buffered
 IO to serialize write IOs. However, the constraint does not apply to read
 IOs. Signed-off-by: Eunhee Rho <eunhee83.rho@samsung.com> --- fs/f2fs/f2fs.h
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oHE4z-0006PY-6u
Subject: [f2fs-dev] [PATCH v0] f2fs: allow direct read for zoned device
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
Reply-To: eunhee83.rho@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For zoned devices, f2fs forbids direct IO and forces buffered IO
to serialize write IOs. However, the constraint does not apply to
read IOs.

Signed-off-by: Eunhee Rho <eunhee83.rho@samsung.com>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d0f428aef34b..f69731f17402 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4471,7 +4471,7 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	 * for blkzoned device, fallback direct IO to buffered IO, so
 	 * all IOs can be serialized by log-structured write.
 	 */
-	if (f2fs_sb_has_blkzoned(sbi))
+	if (f2fs_sb_has_blkzoned(sbi) && (rw == WRITE))
 		return true;
 	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
 		if (block_unaligned_IO(inode, iocb, iter))
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
