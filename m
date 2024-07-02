Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A16A2923D39
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 14:07:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOcHi-0000MB-HA;
	Tue, 02 Jul 2024 12:06:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1sOcHg-0000M3-CY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 12:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OL/DwqCKrUnrUraSKKxPVq6AEKDn2t+gs5jsv1sqlCY=; b=DZchfhokFsHJXiuRYRcqXSM4ji
 279qiSY5aMCf7+o+HI7XNhRN9CrQ0TbN3h6C7DI7PqTRYzAikYJXnak4cjlC6NE/kXIuqahLIdf2m
 kXgUDrNOnB9k2qMCdR/ZoJjmyYZoiO8pYNdq3cXrbYaVd5xo9hHttVFRQBTBpN75BRFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OL/DwqCKrUnrUraSKKxPVq6AEKDn2t+gs5jsv1sqlCY=; b=B
 4LVBsLiixh211ZHC0sURs/6rqwdbW6wCdCkACiIJoR/Oo9phnCWCyHDRQ/Lh3oq9FrUlNXYZFZwA5
 PswTNj6gCiNyTKkDZXx/JPHIgY1ly1KzFJ/JL1Ck839xFhuKPPkc+Ekmixqflea/p5dQC2mC9Snen
 ISDVTsOIQ/Muu/X4=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOcHg-0000FX-Vc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 12:06:57 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240702120644epoutp01f1221798c1b10a896b9ddc24bf1632a9~eY-NMAJUO0680006800epoutp01E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Jul 2024 12:06:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240702120644epoutp01f1221798c1b10a896b9ddc24bf1632a9~eY-NMAJUO0680006800epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1719922004;
 bh=OL/DwqCKrUnrUraSKKxPVq6AEKDn2t+gs5jsv1sqlCY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=AMbOman05yUFmnUGTDtJrEJj9y0xCWE0C73HbzC8CPMo74ntDTAMmWet9K3qQeln6
 q5PjmnGAFJQqEUhSOysHK/WwoPg3GIrklEiON1cC+lAFJKL4cp/4OqbbcoAXe3OwX8
 qauCkMYrRL9ls0fZ6j51VYxXlx/CoOGgL9XioglU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20240702120643epcas1p458a74cfc794668b4a83f5710ac6a0684~eY-M4DnYs1010610106epcas1p41;
 Tue,  2 Jul 2024 12:06:43 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.248]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4WD1q749MFz4x9Pv; Tue,  2 Jul
 2024 12:06:43 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 92.84.09847.35DE3866; Tue,  2 Jul 2024 21:06:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20240702120643epcas1p4b98b4bfef3b3ef72cf50737697b67eeb~eY-MCo6A50895408954epcas1p45;
 Tue,  2 Jul 2024 12:06:43 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240702120643epsmtrp1904a0070dae9b065e0d43b76d7484ab7~eY-MB98Ut0771107711epsmtrp1d;
 Tue,  2 Jul 2024 12:06:43 +0000 (GMT)
X-AuditID: b6c32a36-86dfa70000002677-20-6683ed536b82
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B7.2A.19057.25DE3866; Tue,  2 Jul 2024 21:06:42 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.98.34]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240702120642epsmtip19f8e731be4ffaecb6621e611d11ae4f5~eY-Lzr6Wy0968509685epsmtip1I;
 Tue,  2 Jul 2024 12:06:42 +0000 (GMT)
From: Sunmin Jeong <s_min.jeong@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Tue,  2 Jul 2024 21:06:36 +0900
Message-Id: <20240702120636.476119-1-s_min.jeong@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7bCmnm7w2+Y0g7WP5CxOTz3LZDG1fS+j
 xZP1s5gtLi1yt1jQ+pvFYsu/I6wWCzY+YrSYsf8puwOHx4JNpR6bVnWyeexe8JnJo2/LKkaP
 z5vkAlijsm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJz
 gC5RUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYFegVJ+YWl+al6+WlllgZGhgY
 mQIVJmRn3O2awFrQqVrx/MRV1gbG63JdjBwcEgImEm+OK3YxcnEICexglPi8ZC4zhPOJUeLB
 lk/sXYycQM43Ront31hAbJCGPc097BBFexkllq7tZoTrmHRsKSNIFZuAjsTDqbfBOkQE1CVO
 TVrKAlLELHCVUaLr7RwmkISwgI3E7GcfWEFsFgFViZfn54E18wrYSiyav5AZYp28xMxL39kh
 4oISJ2c+ARvKDBRv3job7FYJgWvsEudnLGWDaHCRuDT9MZQtLPHq+BZ2CFtK4mV/G5RdLHF0
 /gZ2iOYGRokbX29CJewlmlub2UAhwyygKbF+lz7EMj6Jd197WCEBxivR0SYEUa0q0f1oCdSd
 0hLLjh2EmuIh8e7zSSZI0MVKLG1oYJrAKDcLyQuzkLwwC2HZAkbmVYxiqQXFuempxYYFRvCY
 TM7P3cQIToFaZjsYJ739oHeIkYmD8RCjBAezkghv4K/6NCHelMTKqtSi/Pii0pzU4kOMpsBA
 ncgsJZqcD0zCeSXxhiaWBiZmRiYWxpbGZkrivGeulKUKCaQnlqRmp6YWpBbB9DFxcEo1MJX4
 ObceL/O2N5rz60RlZd1t19fXz7+58VjK4FCV4ksOxYvStyTqmJ0Mc/1yl9y+61GSLG3otfGv
 1vodW7vNBSXvCX5Yd5dlfuDCZREuaW2cKW/VRM6dzk3qOpTKamV+JMLi5jvmaI26ghkv9t3Y
 p/I5oSIqoHe/moH0w6npwpHL4q55LmBPPeIUk19/y0tC9OmliRPeaYivO1kjdsf02PdnN//k
 KUarzdPcZh1zJUXFQSJuiWaes7dE9uS0izFXvvq2Sdu6OIkzbHt14yd3CbPRrZtaK17mCZ25
 P1G32jvUP9x6QfcO2Q5tlhClTbEPsy83CO+uZve4/m6GSqX8josL32nO5PxwcvadRuM9SizF
 GYmGWsxFxYkAqhcr6AoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWy7bCSnG7Q2+Y0g5MzLCxOTz3LZDG1fS+j
 xZP1s5gtLi1yt1jQ+pvFYsu/I6wWCzY+YrSYsf8puwOHx4JNpR6bVnWyeexe8JnJo2/LKkaP
 z5vkAlijuGxSUnMyy1KL9O0SuDLudk1gLehUrXh+4iprA+N1uS5GTg4JAROJPc097F2MXBxC
 ArsZJeZNn8rUxcgBlJCWOPanCMIUljh8uBikXEjgA6PE0f/6IDabgI7Ew6m3WUBsEQFNiSOd
 M8HGMAvcZpT41DybDSQhLGAjMfvZB1YQm0VAVeLl+XmMIDavgK3EovkLmSFukJeYeek7O0Rc
 UOLkzCdgQ5mB4s1bZzNPYOSbhSQ1C0lqASPTKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT8
 3E2M4EDV0trBuGfVB71DjEwcjIcYJTiYlUR4A3/VpwnxpiRWVqUW5ccXleakFh9ilOZgURLn
 /fa6N0VIID2xJDU7NbUgtQgmy8TBKdXANOvD58m9bb8PsXv07Csuzlp5LuG0ZNFJyQ0fjzJ/
 NYlUSpvNocOudftj//IE77zTP9f12/+xk7qYda35nW3AQ56G/7Mut398G2ZzIznE50OZv8QM
 9Yvbfr5mk50zQassc/fV1XJTMtmWlPewVllI3Hl+wG0lb7rxjnm9t+auYHq38lD3vorPQrfv
 cq0pmr2cR1e4U//xxAaDPyfKVq9d9TNYQS8rPHjvnKNOM5sl8r2dnxkpLfwh1HflB/+bpN+3
 Xj+UFI/N00kM+tqzoN5KSKmrRN5ubvhc8WP3jZlPehysneaaVCzZs0ks66GMzmTXtjWSF0t8
 +c3v5DLkeH8+v/376aR2jdzDsvnXpqvrKbEUZyQaajEXFScCADUokCnDAgAA
X-CMS-MailID: 20240702120643epcas1p4b98b4bfef3b3ef72cf50737697b67eeb
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240702120643epcas1p4b98b4bfef3b3ef72cf50737697b67eeb
References: <CGME20240702120643epcas1p4b98b4bfef3b3ef72cf50737697b67eeb@epcas1p4.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In case of the COW file,
 new updates and GC writes are already
 separated to page caches of the atomic file and COW file. As some cases that
 use the meta inode for GC, there are some race issues betwee [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
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
X-Headers-End: 1sOcHg-0000FX-Vc
Subject: [f2fs-dev] [PATCH 2/2] f2fs: use meta inode for GC of COW file
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

In case of the COW file, new updates and GC writes are already
separated to page caches of the atomic file and COW file. As some cases
that use the meta inode for GC, there are some race issues between a
foreground thread and GC thread.

To handle them, we need to take care when to invalidate and wait
writeback of GC pages in COW files as the case of using the meta inode.
Also, a pointer from the COW inode to the original inode is required to
check the state of original pages.

For the former, we can solve the problem by using the meta inode for GC
of COW files. Then let's get a page from the original inode in
move_data_block when GCing the COW file to avoid race condition.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Cc: stable@vger.kernel.org #v5.19+
Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
---
 fs/f2fs/data.c   |  2 +-
 fs/f2fs/f2fs.h   |  7 ++++++-
 fs/f2fs/file.c   |  3 +++
 fs/f2fs/gc.c     | 12 ++++++++++--
 fs/f2fs/inline.c |  2 +-
 fs/f2fs/inode.c  |  3 ++-
 6 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 05158f89ef32..90ff0f6f7f7f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2651,7 +2651,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 	if (IS_NOQUOTA(inode))
 		return true;
-	if (f2fs_is_atomic_file(inode))
+	if (f2fs_used_in_atomic_write(inode))
 		return true;
 	/* rewrite low ratio compress data w/ OPU mode to avoid fragmentation */
 	if (f2fs_compressed_file(inode) &&
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 59c5117e54b1..4f9fd1c1d024 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4267,9 +4267,14 @@ static inline bool f2fs_post_read_required(struct inode *inode)
 		f2fs_compressed_file(inode);
 }
 
+static inline bool f2fs_used_in_atomic_write(struct inode *inode)
+{
+	return f2fs_is_atomic_file(inode) || f2fs_is_cow_file(inode);
+}
+
 static inline bool f2fs_meta_inode_gc_required(struct inode *inode)
 {
-	return f2fs_post_read_required(inode) || f2fs_is_atomic_file(inode);
+	return f2fs_post_read_required(inode) || f2fs_used_in_atomic_write(inode);
 }
 
 /*
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 25b119cf3499..c9f0ba658cfd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2116,6 +2116,9 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 
 		set_inode_flag(fi->cow_inode, FI_COW_FILE);
 		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
+
+		/* Set the COW inode's cow_inode to the atomic inode */
+		F2FS_I(fi->cow_inode)->cow_inode = inode;
 	} else {
 		/* Reuse the already created COW inode */
 		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 136b9e8180a3..76854e732b35 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1188,7 +1188,11 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	};
 	int err;
 
-	page = f2fs_grab_cache_page(mapping, index, true);
+	if (f2fs_is_cow_file(inode))
+		page = f2fs_grab_cache_page(F2FS_I(inode)->cow_inode->i_mapping,
+						index, true);
+	else
+		page = f2fs_grab_cache_page(mapping, index, true);
 	if (!page)
 		return -ENOMEM;
 
@@ -1287,7 +1291,11 @@ static int move_data_block(struct inode *inode, block_t bidx,
 				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
 
 	/* do not read out */
-	page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
+	if (f2fs_is_cow_file(inode))
+		page = f2fs_grab_cache_page(F2FS_I(inode)->cow_inode->i_mapping,
+						bidx, false);
+	else
+		page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
 	if (!page)
 		return -ENOMEM;
 
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index ac00423f117b..0186ec049db6 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -16,7 +16,7 @@
 
 static bool support_inline_data(struct inode *inode)
 {
-	if (f2fs_is_atomic_file(inode))
+	if (f2fs_used_in_atomic_write(inode))
 		return false;
 	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
 		return false;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index c26effdce9aa..c810304e2681 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -807,8 +807,9 @@ void f2fs_evict_inode(struct inode *inode)
 
 	f2fs_abort_atomic_write(inode, true);
 
-	if (fi->cow_inode) {
+	if (fi->cow_inode && f2fs_is_cow_file(fi->cow_inode)) {
 		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
+		F2FS_I(fi->cow_inode)->cow_inode = NULL;
 		iput(fi->cow_inode);
 		fi->cow_inode = NULL;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
