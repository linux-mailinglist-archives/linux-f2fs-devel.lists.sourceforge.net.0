Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB08F616085
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 11:08:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqAfT-0004KL-Pg;
	Wed, 02 Nov 2022 10:08:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1oqAfR-0004Jm-4Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 10:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c1yrA7+mY0/E6pYmHduyjhr1A56b4q1KtHaiQtno14g=; b=MCFmhdJpiqW+g6q/GdrgeGm/bE
 qSC+dskX80QS8qZX6KkUqM6lz6pqz/omh6ovYWSQwZCYgit9iZJ5vDNQKCSFLcBhTE4E/i9dcg6XS
 TPwnQlbeJ0HL6rXIx7FnEZdw7q1MX61DWmc3A2mF1VMsiyWidhSYlufQ3HIg1Ec88Iww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c1yrA7+mY0/E6pYmHduyjhr1A56b4q1KtHaiQtno14g=; b=Z
 /EG/oL1UFxvOdR5uZBOdi0Cww3HVqHgyweOEZB5pH+5mocYXffFrfcDM5eSeDLnkNj0j3bHuCSMMh
 KqMp3LG4vHzxXtfpCICl4qwJHHZb6YLbCf4fxYEJg2VIP18MGy0jfpIYtAkWLPjzWgxTWgXDFucmy
 ul2cpvLBAvlGHBrw=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oqAfL-009F8n-EV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 10:08:16 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20221102100758epoutp0485b1741a5a03978941065e4d18177bf6~jvJ8ADEG02107521075epoutp04g
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  2 Nov 2022 10:07:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20221102100758epoutp0485b1741a5a03978941065e4d18177bf6~jvJ8ADEG02107521075epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1667383678;
 bh=c1yrA7+mY0/E6pYmHduyjhr1A56b4q1KtHaiQtno14g=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=BTvEfXEm1NLPEhkuX3h4sBCBn7L7TGUedAi+L21ouyEY0u65xqAUL5zE2js8xgO3Z
 7A3VKPVnboTUmReRiaRnM2WEyknPAQKdCmsk1NgamZg0WJMTeIBWrgceppT34I4BQT
 Xi5weXtMDe2dJsEHCMR9CtR8Gzr8APYNQWYdaL4k=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20221102100757epcas2p25ed87b9cfb33de7d4fc1e92f8f444eb8~jvJ7uUBM-2151121511epcas2p2d;
 Wed,  2 Nov 2022 10:07:57 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4N2Myj2hStz4x9Pr; Wed,  2 Nov
 2022 10:07:57 +0000 (GMT)
X-AuditID: b6c32a46-ad1fd70000012ff6-42-6362417d1287
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 02.CF.12278.D7142636; Wed,  2 Nov 2022 19:07:57 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
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
Message-ID: <20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7@epcms2p2>
Date: Wed, 02 Nov 2022 19:07:56 +0900
X-CMS-MailID: 20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHKsWRmVeSWpSXmKPExsWy7bCmmW6tY1KywfZGAYvTU88yWfx80sFm
 8WT9LGaLS4vcLS7vmsNmsapjLqPF1PNHmBzYPTat6mTz2L3gM5NH35ZVjB6fN8kFsERl22Sk
 JqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAHaCkUJaYUwoU
 CkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM6Yt/IG
 a8E5zootl74wNjC+Ze9i5OCQEDCR2LJVsIuRi0NIYAejRP/9IywgcV4BQYm/O4S7GDk5hAX8
 JWacP8gCYgsJKElcO9DLAhHXl9i8eBk7iM0moCvxd8NyMFtE4BWjxJnVoiA2s0CgxM07H5hA
 bAkBXokZ7U9ZIGxpie3LtzJC2BoSP5b1MkPYohI3V79lh7HfH5sPVSMi0XrvLFSNoMSDn7uh
 4pISiw6dh5qfL/F3xXU2CLtGYmtDG1RcX+Jax0awvbwCvhKvbs4Fi7MIqEoceTQLqt5FYsel
 40wQN8tLbH87hxkUDMwCmhLrd+lDQkpZ4sgtFogKPomOw3/ZYb7aMe8J1CY1ic2bNrNC2DIS
 Fx63QV3pIXH/wy1mSAgGShx9dp9xAqPCLEQ4z0KydxbC3gWMzKsYxVILinPTU4uNCozgMZuc
 n7uJEZwQtdx2ME55+0HvECMTB+MhRgkOZiUR3vqz0clCvCmJlVWpRfnxRaU5qcWHGE2BPp7I
 LCWanA9MyXkl8YYmlgYmZmaG5kamBuZK4rxdM7SShQTSE0tSs1NTC1KLYPqYODilGpiWvVSb
 7njLTSP9f2p1VWR/zOvGiZK1l5c1O31cZ3RkZ6ThtQ8Bl9UkzjN2G187XbNjkk7LwtWJPzmn
 2ZQt9g8Xcdf/tMjnZYBaoGF1U19T54ESv4uLDkY/+rFvmlrDR896+UmCTxedSF+2W2VXwxbL
 heeO3XnzxDG5guvsKoFHdqUrnR5aJ/lPKLOvb5MoWxyvvq9wyq2FHTXK1mqnv74yPd7SUrB2
 zd+dOzQ3PMgq1XvKZCmRZn05+vuCSI+EmTxHZvpbtmzqWmF0USbJ/NzpZMYQ23Mb9D68fHNj
 VWGgs+inFfd2aViaf9zw6BrniTuFqvO3ZfNklfkbny3dWScwzVld1lXGYknn6Z0hgteVWIoz
 Eg21mIuKEwHMJD9REQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7
References: <CGME20221102100756epcms2p23dfabe90c467313ce094c5c81a99c6d7@epcms2p2>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When f2fs chooses GC victim in large section & LFS mode,
 next_victim_seg[gc_type]
 is referenced first. After segment is freed, next_victim_seg[gc_type] has
 the next segment number. However, next_victi [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oqAfL-009F8n-EV
Subject: [f2fs-dev] [PATCH v1] f2fs: avoid victim selection from previous
 victim section
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

When f2fs chooses GC victim in large section & LFS mode,
next_victim_seg[gc_type] is referenced first. After segment is freed,
next_victim_seg[gc_type] has the next segment number.
However, next_victim_seg[gc_type] still has the last segment number
even after the last segment of section is freed. In this case, when f2fs
chooses a victim for the next GC round, the last segment of previous victim
section is chosen as a victim.

Initialize next_victim_seg[gc_type] to NULL_SEGNO for the last segment in
large section.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 fs/f2fs/gc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4546e01b2ee0..10677d53ef0e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1744,8 +1744,9 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 				get_valid_blocks(sbi, segno, false) == 0)
 			seg_freed++;
 
-		if (__is_large_section(sbi) && segno + 1 < end_segno)
-			sbi->next_victim_seg[gc_type] = segno + 1;
+		if (__is_large_section(sbi))
+			sbi->next_victim_seg[gc_type] =
+				(segno + 1 < end_segno) ? segno + 1 : NULL_SEGNO;
 skip:
 		f2fs_put_page(sum_page, 0);
 	}
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
