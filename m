Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D4923D38
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 14:06:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOcHX-0001Y5-Qg;
	Tue, 02 Jul 2024 12:06:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1sOcHW-0001Xy-JT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 12:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n7bVkJMnRU7Mlc/hN2ckbv1SrBU+L0lB2TRSSvXzKuY=; b=fff9mpAtAssMvT9sXXzuxzIENt
 OYZqQhHscRr7MXIrwtqYmKOCtN/sScmJsIvhZvCxyHm6IihZwzjqchfFG7g4hwJ1ew06AkKdVVzug
 4QwK6Jg9/PR6ZGd7a4+Z6uEV8iSsVzpP2YTZwkSBaUmKpcN08GWqHsf37xmiSdvuNItc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=n7bVkJMnRU7Mlc/hN2ckbv1SrBU+L0lB2TRSSvXzKuY=; b=j
 jEQo4uTSf+nFD1EDOyAqU529Dese2TYLHa7ShWio7LF+G5GM3f0kTGH2A26+1Y37Ucak524G7Tkap
 kd/9uPBAI75i5QjWhI4rMAN5rLOBTbgauS/HHZaOIf1DMnunQftLKObxrHLc6AxM+NkoAJorJMHpf
 +HL5VNebHXQiJphY=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOcHW-0000Ew-Bq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 12:06:46 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240702120633epoutp029ba965c2495d36e04436fd7012abcedc~eY-C5sDRZ1707717077epoutp02e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Jul 2024 12:06:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240702120633epoutp029ba965c2495d36e04436fd7012abcedc~eY-C5sDRZ1707717077epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1719921993;
 bh=n7bVkJMnRU7Mlc/hN2ckbv1SrBU+L0lB2TRSSvXzKuY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Pr9+hmER4C58fODF0+aSvM+rQVomfU4mTyFAvGE4xIOYjVxPqtHbk4FN1F/r1LJBw
 JhOEFgPIDguZgSLOuRGzMxHpyuCkb4Oit6h2AO5KOutkzLb5HBolBkOAtKEQFL4vPd
 VH5NytzbFeomobMsvGh47/5d74EsgJcNB1TY39Ic=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20240702120632epcas1p45ade09d4511ab60b9807a75c8bf513fe~eY-ChQ66R0895308953epcas1p45;
 Tue,  2 Jul 2024 12:06:32 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.242]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4WD1pw3YdJz4x9Ps; Tue,  2 Jul
 2024 12:06:32 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 8F.75.08602.84DE3866; Tue,  2 Jul 2024 21:06:32 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240702120631epcas1p1c7044f77b56009471e2dc07d4e135a99~eY-BOnj2a1487914879epcas1p1z;
 Tue,  2 Jul 2024 12:06:31 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240702120631epsmtrp1bd088745aea8d562f54ddaccc39a5a25~eY-BNMEty0771107711epsmtrp1Q;
 Tue,  2 Jul 2024 12:06:31 +0000 (GMT)
X-AuditID: b6c32a33-66ffa7000000219a-67-6683ed48cd33
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FB.B4.07412.74DE3866; Tue,  2 Jul 2024 21:06:31 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.98.34]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240702120631epsmtip1d563847d3def3ca480bec6950d252da6~eY-BA_LQQ0993309933epsmtip1s;
 Tue,  2 Jul 2024 12:06:31 +0000 (GMT)
From: Sunmin Jeong <s_min.jeong@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Tue,  2 Jul 2024 21:06:24 +0900
Message-Id: <20240702120624.476067-1-s_min.jeong@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmga7H2+Y0g+6rohanp55lspjavpfR
 4sn6WcwWlxa5Wyxo/c1iseXfEVaLBRsfMVrM2P+U3YHDY8GmUo9NqzrZPHYv+Mzk0bdlFaPH
 501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5
 QJcoKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgrMCvSKE3OLS/PS9fJSS6wMDQyM
 TIEKE7IzFpx4xFJwU6biyeRvzA2MneJdjJwcEgImEte+NbB0MXJxCAnsYJTYumw7M4TziVFi
 1etJUM43Roldc3czwbSsOX6TESKxl1Hi5pI+JriWg3cvMIJUsQnoSDycepsFxBYRUJc4NWkp
 2BJmgauMEl1v54CNEhawl3h9fhkriM0ioCpxYnMbO4jNK2ArseDzXVaIdfISMy99h4oLSpyc
 +QRsKDNQvHnrbLD7JASusUt8a5zPDNHgInFu+W0oW1ji1fEt7BC2lMTL/jYou1ji6PwN7BDN
 DYwSN77ehErYSzS3NrN1MXIAbdCUWL9LH2IZn8S7rz2sIGEJAV6JjjYhiGpVie5HS6BWSUss
 O3YQaoqHxN+l88HuFBKIlTjXNJ91AqPcLCQvzELywiyEZQsYmVcxiqUWFOempyYbFhjC4zI5
 P3cTIzgNahnvYLw8/5/eIUYmDsZDjBIczEoivIG/6tOEeFMSK6tSi/Lji0pzUosPMZoCA3Ui
 s5Rocj4wEeeVxBuaWBqYmBmZWBhbGpspifOeuVKWKiSQnliSmp2aWpBaBNPHxMEp1cDkpT57
 j3fg9WcqKuKrpB/MfOQ55ZjL0/2abxctmH/92YL31+ZdKmv+PW1Tjm5yxBERrw8eV6bN2HDW
 rrNEr7ZAOTfk0rr7V/mk1/ELGSebCYut31v74XL0+XVKbmb1Ks/CSt07j91Rjg1k/hUz78uX
 wympR0Qfhr9+cEG1Z0eo96eT2+9E/XU8uHSui/n9BxfYb3Rfrr5pXXdW2GI+//oHJztuJs78
 OeVqSnjxp4li069MfLjlwaaw32tvTjy7NE33alap4/K5hofexojWJJoGRRtsND7CIbfn/3rf
 P73CfRcXd62zM2+50eqtU7X5ZQmTH9cmlqqqWQU3ON/8eHF8uvaqylfiS522620Kkt8X+F+J
 pTgj0VCLuag4EQCGY6+aDAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSnK772+Y0g6uLRCxOTz3LZDG1fS+j
 xZP1s5gtLi1yt1jQ+pvFYsu/I6wWCzY+YrSYsf8puwOHx4JNpR6bVnWyeexe8JnJo2/LKkaP
 z5vkAlijuGxSUnMyy1KL9O0SuDIWnHjEUnBTpuLJ5G/MDYyd4l2MnBwSAiYSa47fZOxi5OIQ
 EtjNKDGtu5epi5EDKCEtcexPEYQpLHH4cDFEyQdGiX8TFzKC9LIJ6Eg8nHqbBcQWEdCUONI5
 kx2kiFngNqPEp+bZbCAJYQF7idfnl7GC2CwCqhInNrexg9i8ArYSCz7fZYU4Ql5i5qXvUHFB
 iZMzn4ANZQaKN2+dzTyBkW8WktQsJKkFjEyrGCVTC4pz03OTDQsM81LL9YoTc4tL89L1kvNz
 NzGCQ1VLYwfjvfn/9A4xMnEwHmKU4GBWEuEN/FWfJsSbklhZlVqUH19UmpNafIhRmoNFSZzX
 cMbsFCGB9MSS1OzU1ILUIpgsEwenVANT7K/6tU3/+Wd8sz21n+31o4tz5vTFHMvIFbubGaFW
 +NGOw0lw7pI4/hkewm+vKRtJdRV8knOV9b7HfmlLoWpU4ybTycnFBnvZvb/Feu1S2LV+BcO+
 Mr98y0PbbixYUMkf5CD0MO3w7eA5k+Xic3SCdnZbPlFoy5tzqSmuZt7HIz2reov/PMhnWrT2
 eNzEF8/q3KX3HwuUeC+2XcAmPvoK89vpd77z3vefXHRz9R+jFexiWk0L333/sGKxSq3I4wls
 U4SZGu+fFXzsrLLWVcOGyyF53s9/4n4H1NNM//CxWjaVpZWxZB5USjCU1nfIdDlc/NnE6p7/
 78MLFpTNvmUQOytnfvXutErpz9FHlncpsRRnJBpqMRcVJwIAYscT5sQCAAA=
X-CMS-MailID: 20240702120631epcas1p1c7044f77b56009471e2dc07d4e135a99
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240702120631epcas1p1c7044f77b56009471e2dc07d4e135a99
References: <CGME20240702120631epcas1p1c7044f77b56009471e2dc07d4e135a99@epcas1p1.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The page cache of the atomic file keeps new data pages which
 will be stored in the COW file. It can also keep old data pages when GCing
 the atomic file. In this case, new data can be overwritten by ol [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [203.254.224.25 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.25 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.25 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sOcHW-0000Ew-Bq
Subject: [f2fs-dev] [PATCH 1/2] f2fs: use meta inode for GC of atomic file
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
---
 fs/f2fs/f2fs.h    | 5 +++++
 fs/f2fs/gc.c      | 6 +++---
 fs/f2fs/segment.c | 4 ++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a000cb024dbe..59c5117e54b1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4267,6 +4267,11 @@ static inline bool f2fs_post_read_required(struct inode *inode)
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
index a079eebfb080..136b9e8180a3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1580,7 +1580,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			start_bidx = f2fs_start_bidx_of_node(nofs, inode) +
 								ofs_in_node;
 
-			if (f2fs_post_read_required(inode)) {
+			if (f2fs_meta_inode_gc_required(inode)) {
 				int err = ra_data_block(inode, start_bidx);
 
 				f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -1631,7 +1631,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 			start_bidx = f2fs_start_bidx_of_node(nofs, inode)
 								+ ofs_in_node;
-			if (f2fs_post_read_required(inode))
+			if (f2fs_meta_inode_gc_required(inode))
 				err = move_data_block(inode, start_bidx,
 							gc_type, segno, off);
 			else
@@ -1639,7 +1639,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 								segno, off);
 
 			if (!err && (gc_type == FG_GC ||
-					f2fs_post_read_required(inode)))
+					f2fs_meta_inode_gc_required(inode)))
 				submitted++;
 
 			if (locked) {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7e47b8054413..b55fc4bd416a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3823,7 +3823,7 @@ void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct page *cpage;
 
-	if (!f2fs_post_read_required(inode))
+	if (!f2fs_meta_inode_gc_required(inode))
 		return;
 
 	if (!__is_valid_data_blkaddr(blkaddr))
@@ -3842,7 +3842,7 @@ void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
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
