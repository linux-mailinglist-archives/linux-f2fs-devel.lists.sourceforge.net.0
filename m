Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9940373263D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jun 2023 06:37:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qA1DZ-0004cW-DO;
	Fri, 16 Jun 2023 04:37:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <beomsu7.kim@samsung.com>) id 1qA1DS-0004cP-Nk
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jun 2023 04:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TzMoaf8vGyU8GATKSoffunm8vsRVuxtDYDCKWXxcjoM=; b=ExQ64VXf4aVXb6iA6/t3LVq7R6
 tgpE+bfTxJEUILfcIl53Ioc6UEuKhS++JFNC/knOAaBaMUnMALHwkEJa6UE/KON77GzLk65Maggat
 NEFX8w21bw9zyO0q+QGaKdOQJ3ZelMBG0IpzWUZtWOVkkzlKqON5DYOARAtgR3SVUQH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TzMoaf8vGyU8GATKSoffunm8vsRVuxtDYDCKWXxcjoM=; b=c
 Qfem4+XBEsXU6BsrQ+Sf0aKyEp8Du1uoETb6YKjrFqdenRkYe8P4ZU79JnMp7kMXRpY6lfqaJZ28d
 5TVJrTtdy5cbzJgA4DaqwaJTX/IK+gYfDUkcnb/VJtorCktZhUsp1rX5hsW+1PBFsuZrpjSHAW05D
 C/Hb3BjAVEU+3wTo=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qA1DN-0057FF-SF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jun 2023 04:37:42 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230616043724epoutp01b0d0404a7a03d919f9ff16d010ac2af2~pCb1Zd2KU2558425584epoutp01H
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Jun 2023 04:37:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230616043724epoutp01b0d0404a7a03d919f9ff16d010ac2af2~pCb1Zd2KU2558425584epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1686890244;
 bh=TzMoaf8vGyU8GATKSoffunm8vsRVuxtDYDCKWXxcjoM=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=t5s68veHJRxeVnORsIARiDc6EwV0HlQVtpb5K+6Ul2//G7j5CyTf6JIZyOau63doP
 /WiPXKUAcFjJI9oD6fz+W3/WqpwZ2sZweGZxzCxmD+5yjRw08+r2olEjG3/4Ju/al5
 OlZ4OPaXOeSiT+0U/qMznfa9MynfGuv5kJtQQeDs=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20230616043723epcas2p29c8c2f82eba70fd792df2735fc3edace~pCb0xnmfw1438214382epcas2p2B;
 Fri, 16 Jun 2023 04:37:23 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.99]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Qj5wz0MD0z4x9Pw; Fri, 16 Jun
 2023 04:37:23 +0000 (GMT)
X-AuditID: b6c32a45-1dbff70000022cba-7e-648be7029a0a
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 68.BD.11450.207EB846; Fri, 16 Jun 2023 13:37:22 +0900 (KST)
Mime-Version: 1.0
From: beomsu kim <beomsu7.kim@samsung.com>
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
Message-ID: <20230616043722epcms2p3073c77119d37f5f963b8a75801efb40f@epcms2p3>
Date: Fri, 16 Jun 2023 13:37:22 +0900
X-CMS-MailID: 20230616043722epcms2p3073c77119d37f5f963b8a75801efb40f
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHKsWRmVeSWpSXmKPExsWy7bCmhS7T8+4UgyPXrSxOTz3LZLHqQbjF
 k/WzmC0uLXK3uLxrDpvF6x9yFqs65jJaTD1/hMmBw2PTqk42j90LPjN59G1ZxejxeZNcAEtU
 tk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0A1KCmWJ
 OaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyM
 j/PPMBX85q1onniZsYFxPlcXIyeHhICJROej94xdjFwcQgI7GCXedZ1k62Lk4OAVEJT4u0MY
 pEZYwF3iwuWFzCC2kICiRF/zBrASYQEdiSVbjEHCbAJaEt3XzzCDjBEReMAoMeXGXjYQh1lg
 FaPE4tbLzBDLeCVmtD9lgbClJbYv38oIYWtI/FjWC1UjKnFz9Vt2GPv9sflQNSISrffOQtUI
 Sjz4uRsqLiHx+ifM/HyJ778/gj0jIdDCKLGzZw5UQl9i25/ZYIt5BXwltn7axw7yAYuAqsSk
 X/ogpoSAi8TmUyEgFcwC8hLb34J0cgDZmhLrd0FVKEscucUCUcEn0XH4LzvMUzvmPWGCKFGV
 6AYFDjvYfx0GEAUeEh8f3WABKRASCJS4fJtjAqPCLEQYz0KycxbCzgWMzKsYxVILinPTU4uN
 Cgzh0Zqcn7uJEZwQtVx3ME5++0HvECMTB+MhRgkOZiUR3mUnulKEeFMSK6tSi/Lji0pzUosP
 MZoC/TqRWUo0OR+YkvNK4g1NLA1MzMwMzY1MDcyVxHmlbU8mCwmkJ5akZqemFqQWwfQxcXBK
 NTBN2GU6uzN0S7eNhiFnrUTQ4o1Z3UwLKzTEsn4VRy/bevdmemydg3TfcTuj5tD/QdxGpv/j
 wza47YzMYXRMVjM+N3G98vkvOy+4nDW8+fms806BA97KV3d8dZ2XV3Jym85+Lv4pX5ikbs8q
 8JIXjHVV04vxPBbcpve3qNpq8q6meNPDd1Qfu01ceKm/1zm//dO5ArX6QMtF8gdqu4LCau+W
 C6ZfarXk2KwdvDHA0MA1VLtG9v6b/u/h0W1HFizcevHkxcD9ZvHvNbc8+sAffH1Bg9wTldnT
 Flq8Ftnz5v6XtglmNovM1sZKZrC2L7NyUTprOeGydntI7eQN10UtvFMNBPgt7z8x+c5YkPRu
 txJLcUaioRZzUXEiAAiX+VoRBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230602044830epcms2p141ec782e866c2adc5a3142516f051b87
References: <CGME20230602044830epcms2p141ec782e866c2adc5a3142516f051b87@epcms2p3>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When evaluating in f2fs, it takes much time to obtain waf
 data. This patch helps to obtain waf data without calcluation. Signed-off-by:
 Beomsu Kim <beomsu7.kim@samsung.com> --- fs/f2fs/iostat.c | 17
 +++++++++++++++++ 1 file changed, 17 insertions(+) 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
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
X-Headers-End: 1qA1DN-0057FF-SF
Subject: [f2fs-dev] [PATCH v2] f2fs: including waf data in f2fs status
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
 fs/f2fs/iostat.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 3d5bfb1ad585..59720639e8c0 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -34,10 +34,23 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 {
        struct super_block *sb = seq->private;
        struct f2fs_sb_info *sbi = F2FS_SB(sb);
+       int j;
+       unsigned long long waf = 0;
+       unsigned long long data_written_by_user;
+       unsigned long long data_written_to_storage;
 
        if (!sbi->iostat_enable)
                return 0;
 
+       data_written_by_user = sbi->iostat_bytes[FS_DATA_IO];
+
+       data_written_to_storage = data_written_by_user;
+       for (j = FS_NODE_IO; j <= FS_CP_META_IO; j++)
+               data_written_to_storage += sbi->iostat_bytes[j];
+
+       if (data_written_by_user > 0)
+               waf = data_written_to_storage * 100 / data_written_by_user;
+
        seq_printf(seq, "time:          %-16llu\n", ktime_get_real_seconds());
        seq_printf(seq, "\t\t\t%-16s %-16s %-16s\n",
                                "io_bytes", "count", "avg_bytes");
@@ -81,6 +94,10 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
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
