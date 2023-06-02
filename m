Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 581F171F971
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jun 2023 06:48:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4wiX-0002bD-2U;
	Fri, 02 Jun 2023 04:48:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <beomsu7.kim@samsung.com>) id 1q4wiW-0002b5-4H
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jun 2023 04:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=htKPHmhhT4AYe93UIPC4J12oR0fFRH08mmxQjpY33SI=; b=f9oObLjW/+OQ4u6+5C513tklhe
 oFaBQkmfa3YLPeAKZvl+x8/8QQm6xSTZTI/1p6tJk+TUnhTMicEF4bAkjaTHIB5ZWXCpk6smGprt/
 rFysQEEhX2kIZhC20xA5y4d1+rZLo/67im88D/Kcbbf1Jmi5g3KIGlX/UqqCAG23kPII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=htKPHmhhT4AYe93UIPC4J12oR0fFRH08mmxQjpY33SI=; b=M
 3rg2NKDLQUBdrsAga9Xdu6AV0gdwwYeQ7bksMU8fpGu4CeAiBt9Ekb3oBkjN1VVUIP2wCsGF3Z/gn
 U2+xfHp09H/JF26EZdC85LUd4Sr2aCaihgRDp+dLpv+PTDUW/HejxRFDSFhTx7vT+HMylMooAgzH6
 N1VpSWDCB6SZ3ADU=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4wiQ-008xFs-Lu for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Jun 2023 04:48:48 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230602044832epoutp0477443e26df9c907a00045fcdf5ceb558~kvjj9xDWs0617706177epoutp04L
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  2 Jun 2023 04:48:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230602044832epoutp0477443e26df9c907a00045fcdf5ceb558~kvjj9xDWs0617706177epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1685681312;
 bh=htKPHmhhT4AYe93UIPC4J12oR0fFRH08mmxQjpY33SI=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=uwsQDewjzjlRVs3ChEU5s3ZK8MiJdlS3LkkCsVcGR3Ens1fnsF5k+9yFiWY8eSuCW
 4gO+5AwepAqqK32UWPKotL/1SzHZhUtY3TbySElzgG7cw1BaiVF0flnK+vsbU+wRWQ
 NdTuy3jYv6V1TpmchEdlyPGNWbFy1AFxU79wal5A=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230602044832epcas2p14f9e10385933a38e8703a8232a1d687f~kvjjiKcpR2861528615epcas2p1K;
 Fri,  2 Jun 2023 04:48:32 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.97]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4QXVrH3MHwz4x9QB; Fri,  2 Jun
 2023 04:48:31 +0000 (GMT)
X-AuditID: b6c32a47-eedff70000001ce0-67-6479749f2ca6
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 FD.C4.07392.F9479746; Fri,  2 Jun 2023 13:48:31 +0900 (KST)
Mime-Version: 1.0
From: beomsu kim <beomsu7.kim@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yonggil Song <yonggil.song@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Daejun Park
 <daejun7.park@samsung.com>, Seonghun Kim <seonghun-sui.kim@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230602044830epcms2p141ec782e866c2adc5a3142516f051b87@epcms2p1>
Date: Fri, 02 Jun 2023 13:48:30 +0900
X-CMS-MailID: 20230602044830epcms2p141ec782e866c2adc5a3142516f051b87
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMKsWRmVeSWpSXmKPExsWy7bCmme78ksoUg1PfJS1OTz3LZLHqQbjF
 k/WzmC0uLXK3uLxrDpvF6x9yFqs65jJaTD1/hMmBw2PTqk42j90LPjN59G1ZxejxeZNcAEtU
 tk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0A1KCmWJ
 OaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyM
 zSeNCn7zVsycvIytgXECVxcjJ4eEgInE5s1vWLoYuTiEBHYwSrScns7UxcjBwSsgKPF3hzBI
 jbCAi8SrDRcYQWwhAUWJvuYNbCAlwgI6Eku2GIOE2QS0JLqvn2EGGSMiMIlZYkPHNyaI+bwS
 M9qfskDY0hLbl29lhLA1JH4s62WGsEUlbq5+yw5jvz82H6pGRKL13lmoGkGJBz93Q8UlJF7/
 vAwVz5f4/vsjI8hiCYEWRomdPXOgEvoS2/7MBlvMK+Ar0bp0G5jNIqAq8Xn/L6hBLhLLJ+4H
 s5kF5CW2vwXp5QCyNSXW79IHMSUElCWO3GKBqOCT6Dj8lx3mrR3znjBBlKhKdINChB3sww4D
 iAIPiY+PbrBAwixQovluJ/MERvlZiJCdhWTpLISlCxiZVzGKpRYU56anFhsVGMPjMjk/dxMj
 OPVpue9gnPH2g94hRiYOxkOMEhzMSiK8QmHlKUK8KYmVValF+fFFpTmpxYcYTYHencgsJZqc
 D0y+eSXxhiaWBiZmZobmRqYG5krivNK2J5OFBNITS1KzU1MLUotg+pg4OKUamKKYbH1eO31a
 tVh1yuzks8zX/z2fHTjFgDn/SI3Xge6NPLKitwptl+ydz/VGq139QPIUg4q5IZbnFB67Rhsc
 /+jE6zLF9nTz+YVrV5naXmWtbrO5cvzr9NsW+9QZvhkoXD9wOHMVw0uT5yJ70/MPJXN9Wqxq
 l6odvEr0w6W2KG32huXNxgdmythw+Rg1uDhPjLpnO/HExq4LLZeUpZQkNMt8NJRkfoWe+N7z
 920fz+s1h4xebH3sPGcPk8pzyZpPEXd75z2ZEXdRR1IyN/1B+NM3aT/uLDqtsNA8U3V6UlTK
 Cq7cnrS52YfNM0/q8uzwO/w0bWFQoG9E0LMU1apdAqmygYk7ouxu3jl2o53zlxJLcUaioRZz
 UXEiADn6nogGBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230602044830epcms2p141ec782e866c2adc5a3142516f051b87
References: <CGME20230602044830epcms2p141ec782e866c2adc5a3142516f051b87@epcms2p1>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When evaluating in f2fs, it takes much time to obtain waf
 data. This patch helps to obtain waf data without calcluation. Signed-off-by:
 Beomsu Kim <beomsu7.kim@samsung.com> --- fs/f2fs/iostat.c | 16
 ++++++++++++++++ 1 file changed, 16 insertions(+) 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4wiQ-008xFs-Lu
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
index 3d5bfb1ad585..6eab11b0610d 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -34,10 +34,22 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 {
        struct super_block *sb = seq->private;
        struct f2fs_sb_info *sbi = F2FS_SB(sb);
+       int j;
+       unsigned long long waf = 0;
+       unsigned long long data_written_to_storage = 0;
+       unsigned long long data_written_by_user = 0;
 
        if (!sbi->iostat_enable)
                return 0;
 
+       for (j = FS_DATA_IO; j <= FS_CP_META_IO; j++)
+               data_written_to_storage += sbi->iostat_bytes[j];
+       for (j = FS_DATA_IO; j <= FS_CDATA_IO; j++)
+               data_written_by_user += sbi->iostat_bytes[j];
+
+       if (data_written_by_user > 0)
+               waf = data_written_to_storage * 100 / data_written_by_user;
+
        seq_printf(seq, "time:          %-16llu\n", ktime_get_real_seconds());
        seq_printf(seq, "\t\t\t%-16s %-16s %-16s\n",
                                "io_bytes", "count", "avg_bytes");
@@ -81,6 +93,10 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
        IOSTAT_INFO_SHOW("fs discard", FS_DISCARD_IO);
        IOSTAT_INFO_SHOW("fs flush", FS_FLUSH_IO);
 
+       /* print waf */
+       seq_puts(seq, "[WAF]\n");
+       seq_printf(seq, "fs waf:                %llu.%02llu\n", waf / 100, waf % 100);
+
        return 0;
 }
 
-- 
2.17.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
