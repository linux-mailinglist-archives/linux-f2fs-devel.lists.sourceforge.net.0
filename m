Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 171D86337DD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Nov 2022 10:04:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxPCS-00011z-RB;
	Tue, 22 Nov 2022 09:04:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1oxPBn-0000ug-A8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 09:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p9LCVLTZUGHskW6P80iZkkOsBwgTL7D4TlYMb1/7yjc=; b=NfjJvSJlebmthyRnKrUFFdNdGw
 dzgtrvAlT+tqOpl8tYQUp0z3/9s0pM2uLTLhDA46z9g0FM1qO3eoY94eICujc8mSJv5lQY7SRa+m5
 UQSB/F78O3aE6BVEU639r91wX5WOcuGbMxkM2/7ucGyRi2G03dKUbNMCpf724A2/5qU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p9LCVLTZUGHskW6P80iZkkOsBwgTL7D4TlYMb1/7yjc=; b=C
 CRtFfsm4myBJFvKxPSU9+4rQbYwuEx5YkQckD0jQWUM7Ygi0DHWLzoovdwQVDGFPFf89uI5unhNN2
 aR+6cv4LonSKd/BGF0UGdT0YRyChERNvo6vqYa+ijHo47Y2yf+xp0LHuwlVW0V+V9XzIyDyJgGeYi
 Bz3lVv0Tu1ShN5w4=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxPBi-0008Cm-LP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 09:03:35 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20221122090321epoutp04d7063013ac97944a84747982e28de2b3~p3LPHJkZY2396023960epoutp04r
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 09:03:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20221122090321epoutp04d7063013ac97944a84747982e28de2b3~p3LPHJkZY2396023960epoutp04r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1669107801;
 bh=p9LCVLTZUGHskW6P80iZkkOsBwgTL7D4TlYMb1/7yjc=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=D38PXV3Q02Ls+beYpQxX9/lA+prqrFCEV0TkIAgZNhmOmexkdyfSN1cR1fXrTHuJ8
 It8sHZdartG3l2fG0CCclMSzJO1i0Ys8yyhNMIIkGmF/z4CUp5QbGvxe8f8p+qMl4H
 oV5eSf0R90GWGnzP1dSSsuVw93YOZ9xeN/B5NaPI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20221122090321epcas2p2b3dcb585fd8e66e0a2abf332f2147064~p3LO5okHY1823518235epcas2p2y;
 Tue, 22 Nov 2022 09:03:21 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.92]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4NGdZw6cL0z4x9Q9; Tue, 22 Nov
 2022 09:03:20 +0000 (GMT)
X-AuditID: b6c32a47-079a4a8000002127-72-637c90583602
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 A6.2D.08487.8509C736; Tue, 22 Nov 2022 18:03:20 +0900 (KST)
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
Message-ID: <20221122090320epcms2p2e5df6f7bb1c2d80ae69fd5e4f84b08be@epcms2p2>
Date: Tue, 22 Nov 2022 18:03:20 +0900
X-CMS-MailID: 20221122090320epcms2p2e5df6f7bb1c2d80ae69fd5e4f84b08be
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBKsWRmVeSWpSXmKPExsWy7bCmuW7EhJpkg6un9SxOTz3LZPFk/Sxm
 i0uL3C0u75rDZjH1/BEmB1aPTas62Tx2L/jM5NG3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkp
 mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
 pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGRNuOhdM5ar4+uQTUwPj
 Go4uRk4OCQETiX1HLrN1MXJxCAnsYJT4tuIoaxcjBwevgKDE3x3CIDXCAiESP9uXsYLYQgJK
 EtcO9LJAxPUlNi9exg5iswnoSvzdsBzMFhF4xShxZrUoxHxeiRntT1kgbGmJ7cu3MkLYGhI/
 lvUyQ9iiEjdXv2WHsd8fmw9VIyLReu8sVI2gxIOfu6HikhKLDp1ngrDzJf6uuM4GYddIbG1o
 g4rrS1zr2Ai2l1fAV+Lijylg97MIqEo8e7oTqsZF4vLpj2C9zALyEtvfzmEGeZ1ZQFNi/S59
 EFNCQFniyC0WiAo+iY7Df9lhvtox7wnUFDWJzZs2s0LYMhIXHrdBXekh8X7/IiZIqAVKvL34
 l3UCo/wsRNjOQrJ3FsLeBYzMqxjFUguKc9NTi40KjOGxmZyfu4kRnOS03Hcwznj7Qe8QIxMH
 4yFGCQ5mJRHees+aZCHelMTKqtSi/Pii0pzU4kOMpkAfT2SWEk3OB6bZvJJ4QxNLAxMzM0Nz
 I1MDcyVx3q4ZWslCAumJJanZqakFqUUwfUwcnFINTAeefrydv/YwM/+H8Ke3Z2pyvMo7/iTy
 p5BQ5/bE+1f+2urcW/riWx6Lc1fECa3Wn7Nnlf1/Fur6ur5BMmZ27erUiC5mHyffVsYrH39u
 kaia4VTVNbE2aUImh3/Jok1fPx85Ysp11/F9doW9wzYx439Lw2ssWIW2NBTPaXzzRbl6yuQp
 R9ZKJVULe2R9jr+fES3zyumFSF+G8maLqAMv634ozOj/McWhOFeDZ7bor1vF+mdsff3ehV76
 8UXcd52OuKfymdyTf1J2ljW37mRUPmm8J9y1+/1JgwbDXzxT3rvsvSnEYfS+VM9AVdmveeXu
 3O4lZ1+/vbFk+sGL/DFhfH2zHRg2Hs5Weat2cYZ+nRJLcUaioRZzUXEiAHDN5fT7AwAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221122090320epcms2p2e5df6f7bb1c2d80ae69fd5e4f84b08be
References: <CGME20221122090320epcms2p2e5df6f7bb1c2d80ae69fd5e4f84b08be@epcms2p2>
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
X-Headers-End: 1oxPBi-0008Cm-LP
Subject: [f2fs-dev] [RESEND][PATCH] f2fs: avoid victim selection from
 previous victim section
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

Fixes: e3080b0120a1 ("f2fs: support subsectional garbage collection")
Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 fs/f2fs/gc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 0f967b1e98f2..f1b68eda2235 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1749,8 +1749,9 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
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
