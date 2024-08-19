Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 985699565AD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2024 10:34:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sfxqj-0001mK-Pc;
	Mon, 19 Aug 2024 08:34:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youngjin.gil@samsung.com>) id 1sfxqi-0001lu-Rs
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Aug 2024 08:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IOXKdEMn1pqTvo4372OKnkgY5fJ2HVfDOAL5g6sVpBA=; b=lcdViMPMKYiFbTyWSb/V7v7nWh
 zlGlEWfW9bg6MGV1YxOV2DnM7fjAFwrFghOpdrg7waSsSAalWmI8t0M9ril8yHgW/3ZM/oG8G+4Rf
 BPCjs2JlXN4eLuz3wVUIgid3Hit32hJ4iivyKz4MubsqdymIHd3IhDDxDnWLUh5oK3nQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IOXKdEMn1pqTvo4372OKnkgY5fJ2HVfDOAL5g6sVpBA=; b=c
 yHSgp/3WWemq4hZN1QfSDo4qqP5gC3DA+eJhuXulVik/3qkmkQqgtNgvT2LcP8cPttPfIWg3gQiE7
 yoTzl4EBlluptGIqnYz4jdGPLW8o/1OuQ2cMsubF23tqHGlNYKGVXX2jxB4hYLaqt1v4Y2ymcbXS1
 zyO9pNlBX873D8qQ=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sfxqh-0007Jb-Si for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Aug 2024 08:34:49 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240819083435epoutp017cdf69ec1a408cc815cfddb0c6342179~tFDr6xNru1816518165epoutp01V
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Aug 2024 08:34:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240819083435epoutp017cdf69ec1a408cc815cfddb0c6342179~tFDr6xNru1816518165epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1724056475;
 bh=IOXKdEMn1pqTvo4372OKnkgY5fJ2HVfDOAL5g6sVpBA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=SVDynl/RTuBzdwTk5UwR6DXpIidtuPU2mXOaJAMtm0qHin1rWG28Evv/XInIynr9W
 HAX125O52IIdtrufStC8n5q1Tp+FgVz7C7zpi3bbcfNORxjvy5JWXMQksfqOUnMdUM
 O7nbce9ls3zdyg1uxk4P9CEGFNT5xI0vCj7CJ0d8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20240819083435epcas1p30d73781d6cf487039f480fa09fb7d6c5~tFDreaSyQ0437304373epcas1p3j;
 Mon, 19 Aug 2024 08:34:35 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.243]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4WnQrB4fY8z4x9Pp; Mon, 19 Aug
 2024 08:34:34 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 12.3E.10258.A9303C66; Mon, 19 Aug 2024 17:34:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20240819083433epcas1p3861b773a5b21eea6f0332036a71bb5d7~tFDpOI9KF0215602156epcas1p31;
 Mon, 19 Aug 2024 08:34:33 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240819083432epsmtrp117563750cad156bd203d960893364771~tFDpNctB42831928319epsmtrp1I;
 Mon, 19 Aug 2024 08:34:32 +0000 (GMT)
X-AuditID: b6c32a38-995ff70000002812-b4-66c3039a44a2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FF.18.08456.89303C66; Mon, 19 Aug 2024 17:34:32 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.99.41]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240819083432epsmtip2f37a28ddf7ea71327b9184f53dfe76f1~tFDpAXiz31825918259epsmtip26;
 Mon, 19 Aug 2024 08:34:32 +0000 (GMT)
From: Yeongjin Gil <youngjin.gil@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com
Date: Mon, 19 Aug 2024 17:34:30 +0900
Message-Id: <20240819083430.31852-1-youngjin.gil@samsung.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPJsWRmVeSWpSXmKPExsWy7bCmvu4s5sNpBn8fslqcnnqWyWJq+15G
 iyfrZzFbrLzym8Xi0iJ3i8u75rBZLGgF8rb8O8JqMWP/U3YHTo8Fm0o9Nq3qZPPYveAzk0ff
 llWMHp83yQWwRjUw2iQWJWdklqUqpOYl56dk5qXbKoWGuOlaKClk5BeX2CpFGxoa6RkamOsZ
 GRnpmRrFWhmZKinkJeam2ipV6EL1KikUJRcA1eZWFgMNyEnVg4rrFafmpThk5ZeC/KBXnJhb
 XJqXrpecn6ukUJaYUwo0Qkk/4Rtjxqy1y1kLPjlWXJxygaWBcYlZFyMnh4SAiUTDxw7GLkYu
 DiGBHYwS286fhXI+MUq8bzvHBOF8Y5T4uXIzE0zL7OXTWCESexklXk9ZzQbXsnTFErAqNgFd
 iakvn7KC2CICdhK3bi4C62AWeMMo8fHHZXaQhLBAuMSFLc/BbBYBVYlVWx+CNfMK2Epc+XWY
 HWKdvMTNrv3MEHFBiZMzn7CA2MxA8eats5lBhkoI3GKX+Nz6EKrBReLYldNQtrDEq+NboGwp
 iZf9bewQDasYJd60fmKCcLYzSkx/3MMGUWUv0dzaDGRzAK3QlFi/Sx9iG5/Eu689rBAlghKn
 r3Uzg5RICPBKdLQJQYTVJK5M+gVVIiPR92AW1F4PidftbSwg5UICsRL3utgnMMrPQvLOLCTv
 zELYu4CReRWjWGpBcW56arFhgQly1G5iBKdVLYsdjHPfftA7xMjEwXiIUYKDWUmEt/vlwTQh
 3pTEyqrUovz4otKc1OJDjMnAAJ7ILCWanA9M7Hkl8YZmZpYWlkYmhsZmhoaEhU0sDUzMjEws
 jC2NzZTEec9cKUsVEkhPLEnNTk0tSC2C2cLEwSnVwKT4LfqsukbVtBu7JxvcNrDdGPrz8nFN
 kcMv/zg1FK9zPzArPexrQvHv2gyHJ5uX913kTy6aFrvB6uXEi7ZVC+c1zL15gl365LJkg2W+
 J5Pm3Sjb8+RLzTGtYp66C5aZ541Xxe92aj/atKb6dGv8mS3Xd5j2zPl2gOFg5XmLbz4XnCbK
 /+/w6p9zel+qb3xj8OyLH2K9b+b8z2dX0mDnO7eM+RyP6sXyk3klgqyeM8pnRK9dve9Hk9Jh
 Q/HyzrRKKYYZbS4PS5ur9L4xhT9fz77j+gaLf4bL47v03VpmvbnE/XvVk9bpSyYk6hnM09m2
 /M2j+OdLCoymqJoHGHVmJ3ec5bjFqdlqn6+eXLlIplSJpTgj0VCLuag4EQCloRWSYgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsWy7bCSvO4M5sNpBtcXmVqcnnqWyWJq+15G
 iyfrZzFbrLzym8Xi0iJ3i8u75rBZLGgF8rb8O8JqMWP/U3YHTo8Fm0o9Nq3qZPPYveAzk0ff
 llWMHp83yQWwRnHZpKTmZJalFunbJXBlzFq7nLXgk2PFxSkXWBoYl5h1MXJySAiYSMxePo0V
 xBYS2M0oceN6GERcRuLPxPdsXYwcQLawxOHDxV2MXEAlHxglFnYtZgOpYRPQlZj68ilYr4iA
 k8T/G+3sIDYzSNHvCZ4gtrBAqMTam12MIDaLgKrEqq0PmUBsXgFbiSu/DrND7JKXuNm1nxki
 LihxcuYTFog58hLNW2czT2Dkm4UkNQtJagEj0ypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k
 /NxNjOCQ1dLawbhn1Qe9Q4xMHIyHGCU4mJVEeLtfHkwT4k1JrKxKLcqPLyrNSS0+xCjNwaIk
 zvvtdW+KkEB6YklqdmpqQWoRTJaJg1Oqgcns3rEYTyOmbZPFIzzvHEpXDVsx/b4Pa1zDXifL
 jXKBF33W7T0Tb71245RLDA6P835e1wxboNN/ycxuzp7a8w8v/T6vPcdciHtjSN/Jqm2f2Y44
 XtI96CQc+MKHuSB0Y2v9t1P/GINUG+IMIsR28meaT3FL597oPvfwmtVvT8lbeNg41P+Y21Kl
 +MOYb5r+5mdn1tyokP//mn1lodcRjcIv6ey9FzL/Jp5/HxKSE7vlcZjfVNnqswsm9S/69yfv
 W8wtvVXt71eUZjVq7W2Yf3/5lLPNyRsvcbt6SKUkfyu9O/HEmd4neQZdD/9U5kjdNljH58Av
 72KcPylhyRQ7i6mlvW38zEyas01fXWuJ3q/EUpyRaKjFXFScCACnmlXJyAIAAA==
X-CMS-MailID: 20240819083433epcas1p3861b773a5b21eea6f0332036a71bb5d7
X-Msg-Generator: CA
CMS-TYPE: 101P
X-ArchiveUser: EV
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819083433epcas1p3861b773a5b21eea6f0332036a71bb5d7
References: <CGME20240819083433epcas1p3861b773a5b21eea6f0332036a71bb5d7@epcas1p3.samsung.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_do_write_data_page, when the data block is NULL_ADDR,
 it skips writepage considering that it has been already truncated. This
 results
 in an infinite loop as the PAGECACHE_TAG_TOWRITE tag is no [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sfxqh-0007Jb-Si
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: don't redirty sparse cluster
 during {, de}compress
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Jaewook Kim <jw5454.kim@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs_do_write_data_page, when the data block is NULL_ADDR, it skips
writepage considering that it has been already truncated.
This results in an infinite loop as the PAGECACHE_TAG_TOWRITE tag is not
cleared during the writeback process for a compressed file including
NULL_ADDR in compress_mode=user.

This is the reproduction process:

1. dd if=/dev/zero bs=4096 count=1024 seek=1024 of=testfile
2. f2fs_io compress testfile
3. dd if=/dev/zero bs=4096 count=1 conv=notrunc of=testfile
4. f2fs_io decompress testfile

To prevent the problem, let's check whether the cluster is fully
allocated before redirty its pages.

Fixes: 5fdb322ff2c2 ("f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE")
Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
Tested-by: Jaewook Kim <jw5454.kim@samsung.com>
Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>
---
v2:
 - Rename function and enum value for readability

---
 fs/f2fs/compress.c | 36 ++++++++++++++++++++++++++++--------
 fs/f2fs/f2fs.h     | 12 ++++++++++++
 fs/f2fs/file.c     | 39 +++++++++++++++++++++------------------
 3 files changed, 61 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 990b93689b46..f55d54bb12f4 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -945,7 +945,7 @@ static int __f2fs_get_cluster_blocks(struct inode *inode,
 	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
 	int count, i;
 
-	for (i = 1, count = 1; i < cluster_size; i++) {
+	for (i = 0, count = 0; i < cluster_size; i++) {
 		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
 							dn->ofs_in_node + i);
 
@@ -956,8 +956,8 @@ static int __f2fs_get_cluster_blocks(struct inode *inode,
 	return count;
 }
 
-static int __f2fs_cluster_blocks(struct inode *inode,
-				unsigned int cluster_idx, bool compr_blks)
+static int __f2fs_cluster_blocks(struct inode *inode, unsigned int cluster_idx,
+				enum cluster_check_type type)
 {
 	struct dnode_of_data dn;
 	unsigned int start_idx = cluster_idx <<
@@ -978,10 +978,12 @@ static int __f2fs_cluster_blocks(struct inode *inode,
 	}
 
 	if (dn.data_blkaddr == COMPRESS_ADDR) {
-		if (compr_blks)
-			ret = __f2fs_get_cluster_blocks(inode, &dn);
-		else
+		if (type == CLUSTER_COMPR_BLKS)
+			ret = 1 + __f2fs_get_cluster_blocks(inode, &dn);
+		else if (type == CLUSTER_IS_COMPR)
 			ret = 1;
+	} else if (type == CLUSTER_RAW_BLKS) {
+		ret = __f2fs_get_cluster_blocks(inode, &dn);
 	}
 fail:
 	f2fs_put_dnode(&dn);
@@ -991,7 +993,16 @@ static int __f2fs_cluster_blocks(struct inode *inode,
 /* return # of compressed blocks in compressed cluster */
 static int f2fs_compressed_blocks(struct compress_ctx *cc)
 {
-	return __f2fs_cluster_blocks(cc->inode, cc->cluster_idx, true);
+	return __f2fs_cluster_blocks(cc->inode, cc->cluster_idx,
+		CLUSTER_COMPR_BLKS);
+}
+
+/* return # of raw blocks in non-compressed cluster */
+static int f2fs_decompressed_blocks(struct inode *inode,
+				unsigned int cluster_idx)
+{
+	return __f2fs_cluster_blocks(inode, cluster_idx,
+		CLUSTER_RAW_BLKS);
 }
 
 /* return whether cluster is compressed one or not */
@@ -999,7 +1010,16 @@ int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
 {
 	return __f2fs_cluster_blocks(inode,
 		index >> F2FS_I(inode)->i_log_cluster_size,
-		false);
+		CLUSTER_IS_COMPR);
+}
+
+/* return whether cluster contains non raw blocks or not */
+bool f2fs_is_sparse_cluster(struct inode *inode, pgoff_t index)
+{
+	unsigned int cluster_idx = index >> F2FS_I(inode)->i_log_cluster_size;
+
+	return f2fs_decompressed_blocks(inode, cluster_idx) !=
+		F2FS_I(inode)->i_cluster_size;
 }
 
 static bool cluster_may_compress(struct compress_ctx *cc)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 51fd5063a69c..6b5a3b692c08 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4302,6 +4302,11 @@ static inline bool f2fs_meta_inode_gc_required(struct inode *inode)
  * compress.c
  */
 #ifdef CONFIG_F2FS_FS_COMPRESSION
+enum cluster_check_type {
+	CLUSTER_IS_COMPR,   /* check only if compressed cluster */
+	CLUSTER_COMPR_BLKS, /* return # of compressed blocks in a cluster */
+	CLUSTER_RAW_BLKS    /* return # of raw blocks in a cluster */
+};
 bool f2fs_is_compressed_page(struct page *page);
 struct page *f2fs_compress_control_page(struct page *page);
 int f2fs_prepare_compress_overwrite(struct inode *inode,
@@ -4328,6 +4333,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 						struct writeback_control *wbc,
 						enum iostat_type io_type);
 int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index);
+bool f2fs_is_sparse_cluster(struct inode *inode, pgoff_t index);
 void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
 				pgoff_t fofs, block_t blkaddr,
 				unsigned int llen, unsigned int c_len);
@@ -4414,6 +4420,12 @@ static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
 static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
 							nid_t ino) { }
 #define inc_compr_inode_stat(inode)		do { } while (0)
+static inline int f2fs_is_compressed_cluster(
+				struct inode *inode,
+				pgoff_t index) { return 0; }
+static inline bool f2fs_is_sparse_cluster(
+				struct inode *inode,
+				pgoff_t index) { return true; }
 static inline void f2fs_update_read_extent_tree_range_compressed(
 				struct inode *inode,
 				pgoff_t fofs, block_t blkaddr,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 270c32e3385f..0362d7ad21cc 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4220,9 +4220,8 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	pgoff_t page_idx = 0, last_idx;
-	int cluster_size = fi->i_cluster_size;
-	int count, ret;
+	pgoff_t page_idx = 0, last_idx, cluster_idx;
+	int ret;
 
 	if (!f2fs_sb_has_compression(sbi) ||
 			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
@@ -4257,10 +4256,15 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 		goto out;
 
 	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	last_idx >>= fi->i_log_cluster_size;
+
+	for (cluster_idx = 0; cluster_idx < last_idx; cluster_idx++) {
+		page_idx = cluster_idx << fi->i_log_cluster_size;
+
+		if (!f2fs_is_compressed_cluster(inode, page_idx))
+			continue;
 
-	count = last_idx - page_idx;
-	while (count && count >= cluster_size) {
-		ret = redirty_blocks(inode, page_idx, cluster_size);
+		ret = redirty_blocks(inode, page_idx, fi->i_cluster_size);
 		if (ret < 0)
 			break;
 
@@ -4270,9 +4274,6 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 				break;
 		}
 
-		count -= cluster_size;
-		page_idx += cluster_size;
-
 		cond_resched();
 		if (fatal_signal_pending(current)) {
 			ret = -EINTR;
@@ -4299,9 +4300,9 @@ static int f2fs_ioc_compress_file(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	pgoff_t page_idx = 0, last_idx;
-	int cluster_size = F2FS_I(inode)->i_cluster_size;
-	int count, ret;
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	pgoff_t page_idx = 0, last_idx, cluster_idx;
+	int ret;
 
 	if (!f2fs_sb_has_compression(sbi) ||
 			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
@@ -4335,10 +4336,15 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	set_inode_flag(inode, FI_ENABLE_COMPRESS);
 
 	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	last_idx >>= fi->i_log_cluster_size;
 
-	count = last_idx - page_idx;
-	while (count && count >= cluster_size) {
-		ret = redirty_blocks(inode, page_idx, cluster_size);
+	for (cluster_idx = 0; cluster_idx < last_idx; cluster_idx++) {
+		page_idx = cluster_idx << fi->i_log_cluster_size;
+
+		if (f2fs_is_sparse_cluster(inode, page_idx))
+			continue;
+
+		ret = redirty_blocks(inode, page_idx, fi->i_cluster_size);
 		if (ret < 0)
 			break;
 
@@ -4348,9 +4354,6 @@ static int f2fs_ioc_compress_file(struct file *filp)
 				break;
 		}
 
-		count -= cluster_size;
-		page_idx += cluster_size;
-
 		cond_resched();
 		if (fatal_signal_pending(current)) {
 			ret = -EINTR;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
