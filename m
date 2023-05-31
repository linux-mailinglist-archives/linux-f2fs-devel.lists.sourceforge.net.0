Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE6A7179E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 10:21:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4H4k-00028L-AA;
	Wed, 31 May 2023 08:20:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <beomsu7.kim@samsung.com>) id 1q4H4h-00028A-3y
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 08:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ebFaz6q3K4kRvSJEYLl/6SHwuQr/hdkSGQ9G1SAZCWU=; b=CgBgeudNbaI2V5j1940YksRn0M
 zN+6l5S5nfbfpAkMpTVJ5LKhGOhsS5l+hyh6xZdtoFlEdx4imy/73RY80jC9z4tpIbDDMnOck/SlE
 NRbXFX5EN9mJY4R/EOhAmLCM150mPTOCec8PXUuDfccIDqkTHvGLyu7WYmNhGrxo+XV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ebFaz6q3K4kRvSJEYLl/6SHwuQr/hdkSGQ9G1SAZCWU=; b=B
 C6pyfUaRqRu8YxBRIOctbaoXWVudb98ycEplMDTPbCRTC2Xp29tf8sFu2Yx2YMH1qxqbkgD2Gd01r
 nEHZaesxWT/aUm7AwwrhfFi0UoiCvsvm5XtOsZnOqEdMnAtRQ/1FE9xBfko6gU2vy+h2rh7TX5h9F
 RhMJyn1o0dot6BmE=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4H4c-0007RD-Bu for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 08:20:55 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230531082040epoutp0168ea70625ea4573110bd77526b8e86c7~kLKM5Eb0Z1857618576epoutp010
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 May 2023 08:20:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230531082040epoutp0168ea70625ea4573110bd77526b8e86c7~kLKM5Eb0Z1857618576epoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1685521240;
 bh=ebFaz6q3K4kRvSJEYLl/6SHwuQr/hdkSGQ9G1SAZCWU=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=Qt+3jeFMeeiaBmGllKtJ/PUYnRgfQtej/t8aJi0AOT4x9oyJ+fqdDOf6HjRViS7hO
 hgusyaQ4NPC0Xax5n5jXNCPGsOPhN67u2kfY6MhKGB+HDR1JzzEmDb/6O58oS4uUJn
 HCfc8AmPnpTxOymdM6oOjONolRoB2w2/jS+qJJK0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20230531082039epcas2p4cf7201fd5926c1529069eea90c44df4a~kLKMj4BS81066510665epcas2p4m;
 Wed, 31 May 2023 08:20:39 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4QWMdz13rXz4x9Q9; Wed, 31 May
 2023 08:20:39 +0000 (GMT)
X-AuditID: b6c32a47-157fd70000001ce0-49-64770356fd80
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.53.07392.65307746; Wed, 31 May 2023 17:20:38 +0900 (KST)
Mime-Version: 1.0
From: beomsu kim <beomsu7.kim@samsung.com>
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
Message-ID: <20230531082038epcms2p256f9db0d7ac377d404694354db1c3ebc@epcms2p2>
Date: Wed, 31 May 2023 17:20:38 +0900
X-CMS-MailID: 20230531082038epcms2p256f9db0d7ac377d404694354db1c3ebc
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHKsWRmVeSWpSXmKPExsWy7bCmuW4Yc3mKwdcTUhanp55lslj1INzi
 yfpZzBaXFrlbXN41h83i9Q85i1Udcxktpp4/wuTA4bFpVSebx+4Fn5k8+rasYvT4vEkugCUq
 2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6AYlhbLE
 nFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5gV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbG
 hZO3WQpO81ScORLTwLieq4uRg0NCwETi6l2TLkYuDiGBHYwSU7ZdYQOJ8woISvzdIdzFyMkh
 LOAi8WrDBUYQW0hAUaKveQNYibCAjsSSLcYgYTYBLYnu62eYQWwRgVeMEmdWi4KMZBZYxSix
 uPUyWEJCgFdiRvtTFghbWmL78q2MELaGxI9lvVA1ohI3V79lh7HfH5sPVSMi0XrvLFSNoMSD
 n7uh4hISr3/CzM+X+P77IyPIYgmBFkaJnT1zoBL6Etv+zAZbzCvgK/Fz210wm0VAVeLAntdQ
 NS4S11+/AhvKLCAvsf0tSC8HkK0psX6XPiSolCWO3GKBqOCT6Dj8lx3mrR3znjBBlKhKdINC
 hx3sww4DiAIPiZ6dndDwC5TY0PmebQKjwixEKM9CsnQWwtIFjMyrGMVSC4pz01OLjQqM4dGa
 nJ+7iRGcELXcdzDOePtB7xAjEwfjIUYJDmYlEV7bxOIUId6UxMqq1KL8+KLSnNTiQ4ymQO9O
 ZJYSTc4HpuS8knhDE0sDEzMzQ3MjUwNzJXFeaduTyUIC6YklqdmpqQWpRTB9TBycUg1MG9I2
 LZZq6D0qzBDPNbd/b7vDoYtcP8MFr/zw72b9bL2kZp1KuGWoduvjn446ui23+pVPnHu4J/v2
 2rjEXbOc37s9+Nk1o3hrWktgpI2xjL+sgV4h24WkSes13bXEFUQsxfq0kz11Hxze4iX0N3LG
 JqdHTnc2WahmzDGO/8HGlu/53XnXUa1pn2R89P7MPHVSaPGJgr4jM+8XRsnwXWJI+aCr82qC
 z6SZ7AKPoxeZTrr70OM7w/o7Sy4brLwZUu1Trp0asN338LfHC+b+b/Keu/G2mu+mkIg0aYHk
 PZ7mHVzJjH4y93zW1CnUXXg28eOVLZ5dP3jrdJfkq52IcJGxERUPmNPSrmbtoqa27LISS3FG
 oqEWc1FxIgChB4pIEQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230531082038epcms2p256f9db0d7ac377d404694354db1c3ebc
References: <CGME20230531082038epcms2p256f9db0d7ac377d404694354db1c3ebc@epcms2p2>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When evaluating in f2fs, it takes much time to obtain waf
 data. This patch helps to obtain waf data without calcluation. Signed-off-by:
 Beomsu Kim <beomsu7.kim@samsung.com> --- fs/f2fs/iostat.c | 16
 ++++++++++++++++ 1 file changed, 16 insertions(+) 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4H4c-0007RD-Bu
Subject: [f2fs-dev] [PATCH] f2fs: including waf data in f2fs status
 information
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
Reply-To: beomsu7.kim@samsung.com
Cc: Seokhwan Kim <sukka.kim@samsung.com>,
 Seonghun Kim <seonghun-sui.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When evaluating in f2fs, it takes much time to obtain waf data.
This patch helps to obtain waf data without calcluation.

Signed-off-by: Beomsu Kim <beomsu7.kim@samsung.com>
---
 fs/f2fs/iostat.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 3d5bfb1ad585..6ae9659d69e7 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -34,10 +34,22 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 {
 	struct super_block *sb = seq->private;
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+	int j;
+	unsigned long long waf = 0;
+	unsigned long long data_written_to_storage = 0, data_written_by_user = 0;
 
 	if (!sbi->iostat_enable)
 		return 0;
 
+	for (j = FS_DATA_IO; j <= FS_CP_META_IO; j++)
+		data_written_to_storage += si->sbi->iostat_bytes[j];
+	for (j = FS_DATA_IO; j <= FS_CDATA_IO; j++)
+		data_written_by_user += si->sbi->iostat_bytes[j];
+
+	if (data_written_by_user > 0)
+		waf = data_written_to_storage * 100 / data_written_by_user;
+
 	seq_printf(seq, "time:		%-16llu\n", ktime_get_real_seconds());
 	seq_printf(seq, "\t\t\t%-16s %-16s %-16s\n",
 				"io_bytes", "count", "avg_bytes");
@@ -81,6 +93,10 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 	IOSTAT_INFO_SHOW("fs discard", FS_DISCARD_IO);
 	IOSTAT_INFO_SHOW("fs flush", FS_FLUSH_IO);
 
+	/* print waf */
+	seq_puts(seq, "[WAF]\n");
+	seq_printf(seq, "fs waf:		%llu.%02llu\n", waf / 100, waf % 100);
+
 	return 0;
 }
 
-- 
2.17.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
