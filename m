Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C088865BE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 05:17:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnWKt-0007rW-M0;
	Fri, 22 Mar 2024 04:16:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youngjin.gil@samsung.com>) id 1rnWKs-0007rQ-Jx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 04:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9kKW01SYW8n00To8GRW9yLV87wsWhL7l6j407SYCACs=; b=Eor0A1BJtj+WWZAILIPdWrsX4T
 llh2iE3cTRCbMMxU3YgImje7YwRkskbMPTyjc/pfRBf8W/eagiYLbFzLbSpUdfSAuy1oZ2RQECLMd
 Y/4iAhS28t/w1UMOVqYBgvmTBR1KKLTg6b2bXEltKH1VB0C0N6bkPfEXSRMagP9BpEWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9kKW01SYW8n00To8GRW9yLV87wsWhL7l6j407SYCACs=; b=Z
 NfWlEpiqf5X99yICN9LnI+aqN7DKrjfJ2FhrIa7qJdiZO8WmpCFIqD1ZwjzOFmFzp/rtpbVJu66NG
 QQufBG5Ahx08ZJzgFMvHwH6MNVhk/6zLQivqKx478uJENb2sDI15xGwCppJk4BAsFUe9kwOQAUEgN
 HKbdd00jF71J65kY=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rnWKp-00060L-8J for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 04:16:54 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240322041644epoutp01075761f6bd9f38733b823dd5c9667d36~__xuJuKdZ0515505155epoutp01p
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Mar 2024 04:16:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240322041644epoutp01075761f6bd9f38733b823dd5c9667d36~__xuJuKdZ0515505155epoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1711081004;
 bh=9kKW01SYW8n00To8GRW9yLV87wsWhL7l6j407SYCACs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=oC2SLE63rc3+JVAjHaRmS/k6RiKMSwlSe4UWLaQcK/hQAx6CMG4GIfMocRgaOcBfT
 DEQSmmZ4XpsgYzuVeDZBubFYbX7C6GhmcoC0yguRQsjhfheqLcHjCAbwWgtG+8ijRi
 juv+1yKRImQdNtciU6TPKwNzV7wVPn7zsBouDHQM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240322041643epcas1p1464767200570836c3b1620309fdaed41~__xtk2OWr2700527005epcas1p1V;
 Fri, 22 Mar 2024 04:16:43 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.223]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4V18Cv35KXz4x9QB; Fri, 22 Mar
 2024 04:16:43 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 D4.7A.10076.B260DF56; Fri, 22 Mar 2024 13:16:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20240322041642epcas1p45a26c5b2bde5f8b006c900c235b14e01~__xsNOTHM0085600856epcas1p4L;
 Fri, 22 Mar 2024 04:16:42 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240322041642epsmtrp17ad1515bafec0a84df466f4bb5b2ecdb~__xsMlr-e0540705407epsmtrp1i;
 Fri, 22 Mar 2024 04:16:42 +0000 (GMT)
X-AuditID: b6c32a39-7edf87000000275c-34-65fd062b5566
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 36.76.19234.9260DF56; Fri, 22 Mar 2024 13:16:41 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.99.41]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240322041641epsmtip10228577e205e65746e88a1b6b76dc651~__xsAUbUW2836928369epsmtip1S;
 Fri, 22 Mar 2024 04:16:41 +0000 (GMT)
From: Yeongjin Gil <youngjin.gil@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Fri, 22 Mar 2024 13:16:39 +0900
Message-Id: <20240322041639.23144-1-youngjin.gil@samsung.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmrq42299Ug7MzhCxOTz3LZPFk/Sxm
 i0uL3C0u75rDZrGg9TeLxZZ/R1gtZux/yu7A7rFpVSebx+4Fn5k8+rasYvT4vEkugCWqgdEm
 sSg5I7MsVSE1Lzk/JTMv3VYpNMRN10JJISO/uMRWKdrQ0EjP0MBcz8jISM/UKNbKyFRJIS8x
 N9VWqUIXqldJoSi5AKg2t7IYaEBOqh5UXK84NS/FISu/FORqveLE3OLSvHS95PxcJYWyxJxS
 oBFK+gnfGDNOdggVfOGrePFhBnMD40fuLkZODgkBE4kNn/YxgdhCAjsYJTZ1BHUxcgHZnxgl
 Fi78xgiRAHLmrU2Eabj25CwbRNFORomb91+ywBXd3eAAYrMJ6EpMffmUFcQWEVCXODVpKQtI
 A7PAEUaJ37u2g00VFgiWuNs9mx3EZhFQlbjeeY4ZxOYVsJV4v3USI8Q2eYmbXfuh4oISJ2c+
 AVvGDBRv3jqbGWSohMAhdonWL0tZIBpcJGasOcMOYQtLvDq+BcqWknjZ38YO0dDOKLHi4RxG
 CGcGo8Tf9/dZIarsJZpbm4Ge4wBaoSmxfpc+xDY+iXdfe6BKBCVOX+tmBimREOCV6GgTggir
 SVyZ9AuqREai78EsqL0eEp032xlByoUEYiXa1jBNYJSfheSdWUjemYWwdwEj8ypGsdSC4tz0
 1GLDAlPkaN3ECE6ZWpY7GKe//aB3iJGJg/EQowQHs5II747/f1KFeFMSK6tSi/Lji0pzUosP
 MSYDA3gis5Rocj4waeeVxBuamVlaWBqZGBqbGRoSFjaxNDAxMzKxMLY0NlMS5z1zpSxVSCA9
 sSQ1OzW1ILUIZgsTB6dUA9Pq43c8ev9ohDH5iv9/dSZGS+50u8O8e7J7l3jN8XPMTPlX/UVE
 wElgwsQJE7qWvw/zCVdRD+E+M2dr+8XDt5N7QzgXvvz5+Epq2XUfE+fzhSa9uyVX7T3u+kNg
 x9ISIe8vPdrcHUqnmSV4oh6+2L2Ee4kJ+0qzB0pqjT6z1yftnlojd/TsiiLujClaMw8Ifz7z
 7fqb9vhtNS8Etm20aTvZVBN/tk3VuvK5RrBRnJ5orKmh2LH7wZ5vPaQ9N7oUslZHyBhdOHxL
 Kf9DY1uI7QGt+6nRZ15obGe8xW9kmbtpz7+jnnt2Sr2aOo93Mn+/WCK7d2G98pbaS2G7jJh3
 LH3o0jNZzEFhsdvH+glhe5VYijMSDbWYi4oTAWCuBFtQBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCLMWRmVeSWpSXmKPExsWy7bCSnK4m299Ug3/XLC1OTz3LZPFk/Sxm
 i0uL3C0u75rDZrGg9TeLxZZ/R1gtZux/yu7A7rFpVSebx+4Fn5k8+rasYvT4vEkugCWKyyYl
 NSezLLVI3y6BK+Nkh1DBF76KFx9mMDcwfuTuYuTkkBAwkbj25CxbFyMXh5DAdkaJh/c+s0Mk
 ZCT+THwPlOAAsoUlDh8uhqj5wCgx+dUlFpAaNgFdiakvn7KC2CICmhJHOmeygxQxC5xglPi6
 +CsTSEJYIFCid+pMZhCbRUBV4nrnOTCbV8BW4v3WSYwQy+Qlbnbth4oLSpyc+QRsATNQvHnr
 bOYJjHyzkKRmIUktYGRaxSiaWlCcm56bXGCoV5yYW1yal66XnJ+7iREckFpBOxiXrf+rd4iR
 iYPxEKMEB7OSCO+O/39ShXhTEiurUovy44tKc1KLDzFKc7AoifMq53SmCAmkJ5akZqemFqQW
 wWSZODilGpjM/V9sfGR/4Jlbhf9hpqvKYS6Xa889m/okg6utT0A5tHrpgklRu2dOlc/Psdjn
 3ri8+vg02cTitwfktLdP8+Gy11tqOunFZA2d1SK7JL++3+lR9mBVo8pfl8iNBdPuGQp0ys5/
 sH3Jf+YnvL9v7f7+67Sd5JbYz61mG2ck7PDMiOdYdrvq9ecuh+8vzYzvOE8T4pzHva9obnIS
 w9aT8g1dL3eZ/P7GLW85+/xTFTvuUxJWHvlnztwzuPVAcJ5yudlt+0tZHs+sP968J6d6sfLA
 PRvx2bPrXjiF+nlsyPyX0lB+3vKTR9mKmoRVKrt0P5xIe28cvXT5/LYjWsfbTRvPzrxsc3Op
 2uWJipb/zke5K7EUZyQaajEXFScCAPmc9Ke3AgAA
X-CMS-MailID: 20240322041642epcas1p45a26c5b2bde5f8b006c900c235b14e01
X-Msg-Generator: CA
CMS-TYPE: 101P
X-ArchiveUser: EV
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240322041642epcas1p45a26c5b2bde5f8b006c900c235b14e01
References: <CGME20240322041642epcas1p45a26c5b2bde5f8b006c900c235b14e01@epcas1p4.samsung.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: If f2fs_evict_inode is called between freeze_super and
 thaw_super, 
 the s_writer rwsem count may become negative, resulting in hang. CPU1 CPU2
 f2fs_resize_fs() f2fs_evict_inode() f2fs_freeze set SBI_IS_FREEZING skip
 sb_start_intwrite f2fs_unfreeze clear SBI_IS_FREEZING sb_end_intwrite 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rnWKp-00060L-8J
Subject: [f2fs-dev] [PATCH] f2fs: Prevent s_writer rw_sem count mismatch in
 f2fs_evict_inode
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If f2fs_evict_inode is called between freeze_super and thaw_super, the
s_writer rwsem count may become negative, resulting in hang.

CPU1                       CPU2

f2fs_resize_fs()           f2fs_evict_inode()
  f2fs_freeze
    set SBI_IS_FREEZING
                             skip sb_start_intwrite
  f2fs_unfreeze
    clear SBI_IS_FREEZING
                             sb_end_intwrite

To solve this problem, the call to sb_end_write is determined by whether
sb_start_intwrite is called, rather than the current freezing status.

Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>
---
 fs/f2fs/inode.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index c26effdce9aa..12b1fef31f43 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -804,6 +804,7 @@ void f2fs_evict_inode(struct inode *inode)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	nid_t xnid = fi->i_xattr_nid;
 	int err = 0;
+	bool freeze_protected = false;
 
 	f2fs_abort_atomic_write(inode, true);
 
@@ -843,8 +844,10 @@ void f2fs_evict_inode(struct inode *inode)
 	f2fs_remove_ino_entry(sbi, inode->i_ino, UPDATE_INO);
 	f2fs_remove_ino_entry(sbi, inode->i_ino, FLUSH_INO);
 
-	if (!is_sbi_flag_set(sbi, SBI_IS_FREEZING))
+	if (!is_sbi_flag_set(sbi, SBI_IS_FREEZING)) {
 		sb_start_intwrite(inode->i_sb);
+		freeze_protected = true;
+	}
 	set_inode_flag(inode, FI_NO_ALLOC);
 	i_size_write(inode, 0);
 retry:
@@ -887,7 +890,7 @@ void f2fs_evict_inode(struct inode *inode)
 		if (dquot_initialize_needed(inode))
 			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
 	}
-	if (!is_sbi_flag_set(sbi, SBI_IS_FREEZING))
+	if (freeze_protected)
 		sb_end_intwrite(inode->i_sb);
 no_delete:
 	dquot_drop(inode);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
