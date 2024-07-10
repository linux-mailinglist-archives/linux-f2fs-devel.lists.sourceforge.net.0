Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A788892D107
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 13:52:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRVrW-0001Wc-P6;
	Wed, 10 Jul 2024 11:51:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1sRVrU-0001WW-A5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 11:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gHyPzavtAOhMzF5x0uy9TBspB1xqaBsxD/vJYPsXsds=; b=beqkfDPmfOhCfJ70xeW+nys/bj
 d2kfPcSaafSjnmxkrZmjkOj2euI2bV6X5EypOtD7lpKeYHq3e979QJKN9l/7QVTOMyQRyHi+LJY9N
 RGCZ8w2Fct/+Mmhz3UaJInrx3Pc2Hc2zktDwsht8E0kTZ/mLNTX6Ks3iD1UaykzezuHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gHyPzavtAOhMzF5x0uy9TBspB1xqaBsxD/vJYPsXsds=; b=m
 pP5aFzbnT03alxy12KrHx5jnKcDSo4zAfgudtWJ1vtKK9/E57y1HnP+Boxs9jLx+fAxQupwHT7GWm
 zUH/S4BpSnh441sTLAF1cZ5XwIRzUy7Luj6OvAA/o8osQ0KNS2fuqe0pK9w/nwnCoF7n9aTEfa5zn
 qAjDBNUvfhUGvD3U=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRVrT-0003ZK-Si for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 11:51:52 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240710115139epoutp046f5f0350c0f218f812c5d05bf4115580~g18UXnVbN0787507875epoutp04R
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jul 2024 11:51:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240710115139epoutp046f5f0350c0f218f812c5d05bf4115580~g18UXnVbN0787507875epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1720612299;
 bh=gHyPzavtAOhMzF5x0uy9TBspB1xqaBsxD/vJYPsXsds=;
 h=From:To:Cc:Subject:Date:References:From;
 b=GIK4I1C3brbFHrro43vjvkil4kTzzqHYxgZSc6BB9B1KaltAqXuMwbvI6LIozEzE5
 hkkE1nhG+ANbmMq+8S6+20LFPT1Xn5gnja+0pbzo2k2Pg3S6o5ARJRlzn2GpGiYb3G
 h2hTGy4pajQ5ouEUG8glHC28MSgQD0YAQMxJmkpQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20240710115138epcas1p45bc8e7295f85312cbe73f9f9ca4196eb~g18T9MZTu0117501175epcas1p4B;
 Wed, 10 Jul 2024 11:51:38 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.227]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4WJx622jt4z4x9Pv; Wed, 10 Jul
 2024 11:51:38 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 30.B8.19059.AC57E866; Wed, 10 Jul 2024 20:51:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240710115137epcas1p2ee192f1264c9570c416c706ffa7c23e8~g18SnmrPh1079710797epcas1p2t;
 Wed, 10 Jul 2024 11:51:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240710115137epsmtrp16b3fde47d90d1ad54b364db5bad011bc~g18Sm7cWW0340803408epsmtrp1i;
 Wed, 10 Jul 2024 11:51:37 +0000 (GMT)
X-AuditID: b6c32a4c-bb9ff70000004a73-e4-668e75ca0352
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6A.D6.29940.9C57E866; Wed, 10 Jul 2024 20:51:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.98.34]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240710115137epsmtip1e168ed4f7663dfbdc417c370d5c6c533~g18SZIxrg0402204022epsmtip1E;
 Wed, 10 Jul 2024 11:51:37 +0000 (GMT)
From: Sunmin Jeong <s_min.jeong@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Wed, 10 Jul 2024 20:51:17 +0900
Message-Id: <20240710115117.61255-1-s_min.jeong@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmru6p0r40g7fr+C1OTz3LZDG1fS+j
 xZP1s5gtLi1yt1jQ+pvFYsu/I6wWCzY+YrSYsf8puwOHx4JNpR6bVnWyeexe8JnJo2/LKkaP
 z5vkAlijsm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJz
 gC5RUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYFegVJ+YWl+al6+WlllgZGhgY
 mQIVJmRnnH7YzVawRLPibnsTawPjbMUuRk4OCQETiUsbnjN3MXJxCAnsYZT4fuUGI4TziVGi
 89B1KOcbo8Ss1w+YYVqW9j5mgkjsZZS48fkPG1zLtwtNjCBVbAI6Eg+n3mYBsUUE1CVOTVrK
 AlLELHCVUaJ933OwhLCAk8TfU2+YQGwWAVWJ/+tOs4PYvAI2Ers3bWaHWCcvMfPSd6i4oMTJ
 mU/AepmB4s1bZ4NdLiFwiV3i+8lZUA0uEqf2HGSEsIUlXh3fAhWXknjZ3wZlF0scnb+BHaK5
 AeiHrzehEvYSza3NQP9wAG3QlFi/Sx9iGZ/Eu689rCBhCQFeiY42IYhqVYnuR0ugwSItsezY
 QagpHhKrn35jBbGFBGIluq4/ZJ/AKDcLyQuzkLwwC2HZAkbmVYxSqQXFuempyYYFhrp5qeXw
 +EzOz93ECE6HWj47GL+v/6t3iJGJg/EQowQHs5II7/wb3WlCvCmJlVWpRfnxRaU5qcWHGE2B
 ATuRWUo0OR+YkPNK4g1NLA1MzIxMLIwtjc2UxHnPXClLFRJITyxJzU5NLUgtgulj4uCUamBi
 en1k4ourax5OUF3x1iv0wb6H33R1hWbeWx7iri6yuq3EtIWbQfli44rT9/KrlrznKlQTOTf5
 gGb8sbMOxcfuRx5Zm2/RVJDU9yVguYLylgXxsdxGL/YlCs/N5e7+GqIy77tG6qkrkTPbvkvv
 N/opu/z0i53K3yb7//QrurpStG6z8OGcf4arJuWenFWjN/GIyZ6ErqLdv83kHy5y/ilXxrn/
 6bTa0klPzR4e+fy1acnt1c4/JXKnCndvX7va8VbHp3nyRxw4uc3PrjG/v/jy1e1uJou+Ltad
 ujW1QUs/avm2vKyDZebM3d/MZdeWuyeZXbyyevWMgmM/w9UfqNiwT170vu3XL5m/fTwCGksz
 dJRYijMSDbWYi4oTAV+iX0gQBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSnO7J0r40g85HHBanp55lspjavpfR
 4sn6WcwWlxa5Wyxo/c1iseXfEVaLBRsfMVrM2P+U3YHDY8GmUo9NqzrZPHYv+Mzk0bdlFaPH
 501yAaxRXDYpqTmZZalF+nYJXBmnH3azFSzRrLjb3sTawDhbsYuRk0NCwERiae9jpi5GLg4h
 gd2MEldOdAM5HEAJaYljf4ogTGGJw4eLIUo+MErMXDuDCaSXTUBH4uHU2ywgtoiApsSRzpns
 IEXMArcZJb6vaAdLCAs4Sfw99QasgUVAVeL/utPsIDavgI3E7k2b2SGOkJeYeek7VFxQ4uTM
 J2C9zEDx5q2zmScw8s1CkpqFJLWAkWkVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZw
 qGpp7mDcvuqD3iFGJg7GQ4wSHMxKIrzzb3SnCfGmJFZWpRblxxeV5qQWH2KU5mBREucVf9Gb
 IiSQnliSmp2aWpBaBJNl4uCUamBadX32OcWEjV9tTR4b7ulcJscc8CrWpWwim9d3Jpm3im5r
 1vLMPnu7RtE97l6615ZLSbt375X76yt5yHF56S/VooBHnwVubFmy1apIrOfhsy05XtIvt1dc
 Ff+zX3s+Z92N6Vr7OHY7B5/3/lh3U3Ovmalj/85y7sx2p03i6ve2Sth88vG69cNW8rnNpbs6
 HEt2VXE2Btx4dnm+8+81M2vuno3hag10EDOeVrmA4bvX3w2fpP7dKzrxSSbOWbAiv/Q3x67l
 rxUtZj3X+pF39LJt4W3HigyODxv3vOwQXz17MaNOqyXn1cdrPQqiHmX4aH1arL7Y4263lrGd
 UsPkDO5HRbMva2k+s+hr95O5wZalxFKckWioxVxUnAgAgYO5BMQCAAA=
X-CMS-MailID: 20240710115137epcas1p2ee192f1264c9570c416c706ffa7c23e8
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240710115137epcas1p2ee192f1264c9570c416c706ffa7c23e8
References: <CGME20240710115137epcas1p2ee192f1264c9570c416c706ffa7c23e8@epcas1p2.samsung.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The page cache of the atomic file keeps new data pages which
 will be stored in the COW file. It can also keep old data pages when GCing
 the atomic file. In this case, new data can be overwritten by ol [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sRVrT-0003ZK-Si
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: use meta inode for GC of atomic file
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
Cc: daehojeong@google.com, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The page cache of the atomic file keeps new data pages which will be
stored in the COW file. It can also keep old data pages when GCing the
atomic file. In this case, new data can be overwritten by old data if a
GC thread sets the old data page as dirty after new data page was
evicted.

Also, since all writes to the atomic file are redirected to COW inodes,
GC for the atomic file is not working well as below.

f2fs_gc(gc_type=FG_GC)
  - select A as a victim segment
  do_garbage_collect
    - iget atomic file's inode for block B
    move_data_page
      f2fs_do_write_data_page
        - use dn of cow inode
        - set fio->old_blkaddr from cow inode
    - seg_freed is 0 since block B is still valid
  - goto gc_more and A is selected as victim again

To solve the problem, let's separate GC writes and updates in the atomic
file by using the meta inode for GC writes.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Cc: stable@vger.kernel.org #v5.19+
Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
v2:
- replace post_read to meta_gc

 fs/f2fs/data.c    | 4 ++--
 fs/f2fs/f2fs.h    | 7 ++++++-
 fs/f2fs/gc.c      | 6 +++---
 fs/f2fs/segment.c | 6 +++---
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b6dcb3bcaef7..9a213d03005d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2693,7 +2693,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	}
 
 	/* wait for GCed page writeback via META_MAPPING */
-	if (fio->post_read)
+	if (fio->meta_gc)
 		f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
 
 	/*
@@ -2788,7 +2788,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 		.submitted = 0,
 		.compr_blocks = compr_blocks,
 		.need_lock = compr_blocks ? LOCK_DONE : LOCK_RETRY,
-		.post_read = f2fs_post_read_required(inode) ? 1 : 0,
+		.meta_gc = f2fs_meta_inode_gc_required(inode) ? 1 : 0,
 		.io_type = io_type,
 		.io_wbc = wbc,
 		.bio = bio,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f7ee6c5e371e..796ae11c0fa3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1211,7 +1211,7 @@ struct f2fs_io_info {
 	unsigned int in_list:1;		/* indicate fio is in io_list */
 	unsigned int is_por:1;		/* indicate IO is from recovery or not */
 	unsigned int encrypted:1;	/* indicate file is encrypted */
-	unsigned int post_read:1;	/* require post read */
+	unsigned int meta_gc:1;		/* require meta inode GC */
 	enum iostat_type io_type;	/* io type */
 	struct writeback_control *io_wbc; /* writeback control */
 	struct bio **bio;		/* bio for ipu */
@@ -4263,6 +4263,11 @@ static inline bool f2fs_post_read_required(struct inode *inode)
 		f2fs_compressed_file(inode);
 }
 
+static inline bool f2fs_meta_inode_gc_required(struct inode *inode)
+{
+	return f2fs_post_read_required(inode) || f2fs_is_atomic_file(inode);
+}
+
 /*
  * compress.c
  */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ef667fec9a12..cb3006551ab5 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1589,7 +1589,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			start_bidx = f2fs_start_bidx_of_node(nofs, inode) +
 								ofs_in_node;
 
-			if (f2fs_post_read_required(inode)) {
+			if (f2fs_meta_inode_gc_required(inode)) {
 				int err = ra_data_block(inode, start_bidx);
 
 				f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -1640,7 +1640,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 			start_bidx = f2fs_start_bidx_of_node(nofs, inode)
 								+ ofs_in_node;
-			if (f2fs_post_read_required(inode))
+			if (f2fs_meta_inode_gc_required(inode))
 				err = move_data_block(inode, start_bidx,
 							gc_type, segno, off);
 			else
@@ -1648,7 +1648,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 								segno, off);
 
 			if (!err && (gc_type == FG_GC ||
-					f2fs_post_read_required(inode)))
+					f2fs_meta_inode_gc_required(inode)))
 				submitted++;
 
 			if (locked) {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4db1add43e36..77ef46b384b4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3851,7 +3851,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	if (fio->post_read)
+	if (fio->meta_gc)
 		f2fs_truncate_meta_inode_pages(sbi, fio->new_blkaddr, 1);
 
 	stat_inc_inplace_blocks(fio->sbi);
@@ -4021,7 +4021,7 @@ void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct page *cpage;
 
-	if (!f2fs_post_read_required(inode))
+	if (!f2fs_meta_inode_gc_required(inode))
 		return;
 
 	if (!__is_valid_data_blkaddr(blkaddr))
@@ -4040,7 +4040,7 @@ void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	block_t i;
 
-	if (!f2fs_post_read_required(inode))
+	if (!f2fs_meta_inode_gc_required(inode))
 		return;
 
 	for (i = 0; i < len; i++)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
