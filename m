Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DCE377EC0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 10:54:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg1ge-0005wV-63; Mon, 10 May 2021 08:54:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sw0312.kim@samsung.com>) id 1lg1gc-0005wM-4h
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 08:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AAbwIBgFEEfh/sqOv6OyskOU8JBhKsZ1g1ZiN2jF3Y0=; b=NbCGCvqRz2SDeprX2WUvj20CBA
 udKiW039PjVxIUd/+KLlC3uJ9KgYTVcyny6wU0eWE9xO/ahYWx1YeB6Ujukgx6Q6+mz5blqMEq2Xv
 04zouNxt83QplE8LyyiG5RDmok5W7TJByyeu2zl5anYB6b/TR/IlLtov0vaOdzflnDOQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AAbwIBgFEEfh/sqOv6OyskOU8JBhKsZ1g1ZiN2jF3Y0=; b=PozZ2jIEoPV8aK1tv4/VWY6gxW
 ogyLQiCgaXUPotT7m8mcz5D8MA/M1k9fNG4yHl5b4kBP7fakHZH90ocL8qrifLJaFg1qq3qbGkXn3
 Fd3/3VcL5QgPj8xelmz8bgZ+IbJMyj4G7s4mp6thUhrTz+OqhOwkJhcpDbq5v6KNqdmI=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg1gU-00089Y-QD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 08:54:47 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210510085429epoutp04491df2ed090dceb44027c90f2cf32ad2~9qKV1N8I21128311283epoutp043
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 May 2021 08:54:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210510085429epoutp04491df2ed090dceb44027c90f2cf32ad2~9qKV1N8I21128311283epoutp043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1620636869;
 bh=AAbwIBgFEEfh/sqOv6OyskOU8JBhKsZ1g1ZiN2jF3Y0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=htXlxdl8nCoTKxYoHc5nUhJP2GpAgTjGaFrMep2h39N/NUFn9UaP0yY1lYMQpXD1V
 trUTONLMPtAuObXAV06cAVOR+3OsdIGvXZDUKsPtsw8UGhDDbpLWcLxGVWH5BRipx5
 ZXPLFbmgRO3cCwqKEHL+53nBCJQuXoSWVqVuZ5E4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210510085429epcas1p12d74019b0baad7c181b64c86435b993e~9qKVgIWXJ1786517865epcas1p1r;
 Mon, 10 May 2021 08:54:29 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4FdvxY6gXlz4x9Q2; Mon, 10 May
 2021 08:54:25 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 07.1A.09824.BB4F8906; Mon, 10 May 2021 17:54:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20210510085419epcas1p3e72ea9d956bcf811167b14e06fb08149~9qKMPKGp92011620116epcas1p3C;
 Mon, 10 May 2021 08:54:19 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210510085419epsmtrp1858a1f6a4d3bac50d694727cdfee083b~9qKMOhU4A2318223182epsmtrp1I;
 Mon, 10 May 2021 08:54:19 +0000 (GMT)
X-AuditID: b6c32a37-061ff70000002660-a6-6098f4bb3e9f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 68.DA.08637.BB4F8906; Mon, 10 May 2021 17:54:19 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.223]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210510085418epsmtip183eaaeb37b3eaf8a503223b56a15da87~9qKL_MZPD3199731997epsmtip1s;
 Mon, 10 May 2021 08:54:18 +0000 (GMT)
From: Seung-Woo Kim <sw0312.kim@samsung.com>
To: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 10 May 2021 17:57:26 +0900
Message-Id: <20210510085726.12663-2-sw0312.kim@samsung.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20210510085726.12663-1-sw0312.kim@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNKsWRmVeSWpSXmKPExsWy7bCmge7uLzMSDP60alqcnnqWyeLJ+lnM
 FpcWuVtc3jWHzWLG5JdsDqwem1Z1snnsXvCZyaNvyypGj8+b5AJYorJtMlITU1KLFFLzkvNT
 MvPSbZW8g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0yc4DWKimUJeaUAoUCEouLlfTtbIry
 S0tSFTLyi0tslVILUnIKLAv0ihNzi0vz0vWS83OtDA0MjEyBChOyMw4fnsxcMIu14uiWL2wN
 jH+Zuxg5OSQETCTePfjN0sXIxSEksINR4t/SfkYI5xOjxPJ7t6Ey3xgl5q6YxgLTsrj3ABtE
 Yi+jxLRdf1ghnC+MEouWTmIEqWIT0JHYv+Q3K4gtImAnMePCMaAODg5mAU+JBZMiQMLCQObW
 fZeZQMIsAqoSh45Vg4R5Bawlbn1pZ4TYJS9xYcMtVpASTgEbiZe7jSFKBCVOznwCdg4zUEnz
 1tnMIBdICJxjl7i15zsrRK+LROeaa1BvCku8Or6FHcKWknjZ38YO0dDMKLF0yS8WCKeHUWLO
 ottQ3cYS+5dOZoK4WVNi/S59iLCixM7fcxkhNvNJvPvaA3achACvREebEESJisTOo5PYIMJS
 ErM2BEOEPSQm3F/LBAmpfkaJD/e/ME1gVJiF5J9ZSP6ZhbB4ASPzKkax1ILi3PTUYsMCY+QI
 3sQIToVa5jsYp739oHeIkYmD8RCjBAezkgivaMe0BCHelMTKqtSi/Pii0pzU4kOMpsCwnsgs
 JZqcD0zGeSXxhqZGxsbGFiaGZqaGhkrivOnO1QlCAumJJanZqakFqUUwfUwcnFINTNdnCSr8
 stzy8e7qT2fNy5bGs8y+etUkoS+h7kHyT7YAvvcai425NYU9q+TUV7PKFUzR69Vee7jFliH3
 rPyBhn+BLaIOYkcnHXqgop67y2f90tQ1c6sf2kz+t/xol8pae5YHjSY9xwQnBrrqTnuro+7a
 w5Po+fRx++yo0+H7r2hMUykuPqm61cmuVuKhFoO93pub216oMZkX/9nTvmGZNU/GbrspUxe9
 MYoLUpSp5VZvt5nKGaurefjzExm12pIzjJc23DtiJ3go9IriS/4DKfN8GlUOHz/DtIuzyvH+
 wcIbihPMTM9ECogd9Zgr9qlkmt7/oyEuS2wnpvxeF7tnzublhbU79L0cnvkGXH2YrsRSnJFo
 qMVcVJwIAMnd00AOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCLMWRmVeSWpSXmKPExsWy7bCSnO7uLzMSDN4tZrE4PfUsk8WT9bOY
 LS4tcre4vGsOm8WMyS/ZHFg9Nq3qZPPYveAzk0ffllWMHp83yQWwRHHZpKTmZJalFunbJXBl
 HD48mblgFmvF0S1f2BoY/zJ3MXJySAiYSCzuPcDWxcjFISSwm1FiReNsqISUxNxv2xm7GDmA
 bGGJw4eLIWo+MUr86VzJAlLDJqAjsX/Jb1YQW0TAQWLFti1gcWYBX4lpT1eygdjCAp4SW/dd
 ZgKZwyKgKnHoWDVImFfAWuLWl3ZGiFXyEhc23GIFKeEUsJF4udsYJCwEVNLRtJcVolxQ4uTM
 J1DT5SWat85mnsAoMAtJahaS1AJGplWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMEB
 q6W5g3H7qg96hxiZOBgPMUpwMCuJ8Ip2TEsQ4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8
 kEB6YklqdmpqQWoRTJaJg1OqgUmxaVYfZ3mtsvqiTaF7z+a1/HjVVnGh0rPzUbD1YyWLUt2c
 pVPeK2jUT/9+N4fpQAGDn5Zr1StxrhMyTu+dHW/puuVWhXDa9N56WWZj9Fm3Z2/l5WXsrb0X
 0i9HLVuQkWA3gWlh1cXqCXlMs7gUn/TO7WWKFk2bwVR4vtqtY0P+jvknZj1WZpTQP/UwpvC/
 gXaq07OwNVMl7nwr2HVpZ8BxIUf1x1HBpwIVDzPHFx4KvM33sX5v1FzNr+orKqZfFy+t69/E
 7l+fHN8Yp2XkfD97rvZs//LK7JvcPyLyc69/Pp2ZY/FfXY93idbSutMzlS5tD/nyOKZttZrn
 pmVMH5lZLqlb9kQKFLHsK6pWYinOSDTUYi4qTgQABHEAZscCAAA=
X-CMS-MailID: 20210510085419epcas1p3e72ea9d956bcf811167b14e06fb08149
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210510085419epcas1p3e72ea9d956bcf811167b14e06fb08149
References: <20210510085726.12663-1-sw0312.kim@samsung.com>
 <CGME20210510085419epcas1p3e72ea9d956bcf811167b14e06fb08149@epcas1p3.samsung.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lg1gU-00089Y-QD
Subject: [f2fs-dev] [PATCH 2/2] dump.f2fs: fix memory leak caused by
 dump_node_blk()
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
Cc: sw0312.kim@samsung.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix to free node_blk when nid is 0 from dump_node_blk().

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 fsck/dump.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 055ce09bb1cf..042a2e52edca 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -278,7 +278,7 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
 
 	if (nid == 0) {
 		*ofs += skip;
-		return;
+		goto out;
 	}
 
 	for (i = 0; i < idx; i++, (*ofs)++) {
@@ -297,6 +297,7 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
 			break;
 		}
 	}
+out:
 	free(node_blk);
 }
 
-- 
2.19.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
