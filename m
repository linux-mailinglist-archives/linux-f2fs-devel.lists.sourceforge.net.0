Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDF957B93
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2024 04:45:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgErz-0000u1-RG;
	Tue, 20 Aug 2024 02:45:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1sgErx-0000tu-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 02:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uOUsp2Icyjguhl9fIySIi7C6jdasryy0Oh8rEgg4v8c=; b=lwrVwK0LwtcPJSQX7+awYY5qBx
 Nlo6RL/0tp5M+ZzCcOgJbAjME+laPunHUmGzPUPzh0juVzGCdCtUtEMt0yFWraq+djV+w9VBBxNbI
 PCtkM9WQ1BP3EB1jOH7v6EL/rKAiD/b84werPVE51PZ3hPGwRBvu3dCyiNWy+RcCepH0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uOUsp2Icyjguhl9fIySIi7C6jdasryy0Oh8rEgg4v8c=; b=POmr1eH4Df/2wN25R9VnHf5q8U
 bUdxrfOt2oTWzx/qGgyMvBmYCGpSz46zL05F2Ug7hdSpspF7vRofmi5BRfDIgfGqqJaOcdeo5f84C
 JalgxJcu9PqPPWmPZnpWFdoPUuih5PIxu5P+l6qqdQndR/vgRhl9VwNkTxIseveCeY74=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgErv-0002nr-MQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 02:45:13 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240820024459epoutp0404d59a039586382b57b3983507aec3a1~tT7uf8jjR0112201122epoutp04c
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Aug 2024 02:44:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240820024459epoutp0404d59a039586382b57b3983507aec3a1~tT7uf8jjR0112201122epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1724121899;
 bh=uOUsp2Icyjguhl9fIySIi7C6jdasryy0Oh8rEgg4v8c=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=q4WxWuQgYAaBvjCt1yEgHXRj1sXAd1df+OVfsohZ1bnDFv6HaFOWCfZnth5ufT2Qz
 T6AcYX4d58bOckBjBZ51sL3s1x2hm0PYBghS+7M2pCbLnSEwmwo6pIdk6FMU7u3u1N
 9Bbnct+C9GwakL8dxbrKUPAB9kEQ6V/p7bfzKW1s=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20240820024459epcas1p4ca50310821f59cc9142ec268a2c6ac30~tT7uI8iQd2303123031epcas1p48;
 Tue, 20 Aug 2024 02:44:59 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.36.225]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Wnv2L6NdVz4x9Pv; Tue, 20 Aug
 2024 02:44:58 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 CE.0A.10258.A2304C66; Tue, 20 Aug 2024 11:44:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20240820024458epcas1p4b3bf4d42997870503bf57de45cd70fff~tT7td12FV2862028620epcas1p4S;
 Tue, 20 Aug 2024 02:44:58 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240820024458epsmtrp2072307dfd3d3e9a2d3a7ed303a0d2bf0~tT7tdPJ7b2857328573epsmtrp2R;
 Tue, 20 Aug 2024 02:44:58 +0000 (GMT)
X-AuditID: b6c32a38-9ebb870000002812-10-66c4032ad489
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6A.11.07567.A2304C66; Tue, 20 Aug 2024 11:44:58 +0900 (KST)
Received: from sminjeong05 (unknown [10.253.99.183]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20240820024458epsmtip2c7f645bd56dc25285a8597c9c5e341b3~tT7tN-7iD0770507705epsmtip27;
 Tue, 20 Aug 2024 02:44:58 +0000 (GMT)
From: "Sunmin Jeong" <s_min.jeong@samsung.com>
To: "'Chao Yu'" <chao@kernel.org>, <jaegeuk@kernel.org>
In-Reply-To: <20240814134815.801303-1-chao@kernel.org>
Date: Tue, 20 Aug 2024 11:44:58 +0900
Message-ID: <002e01daf2aa$f22d5430$d687fc90$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLn9uQSv5kHFHDHqqjb+IXcXHMvoQHoUZ1QsAYfsRA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmnq4W85E0g32ndS1OTz3LZPFk/Sxm
 i0uL3C0u75rD5sDisWlVJ5vH7gWfmTw+b5ILYI7KtslITUxJLVJIzUvOT8nMS7dV8g6Od443
 NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBWqakUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVK
 LUjJKTAr0CtOzC0uzUvXy0stsTI0MDAyBSpMyM44fWoFe8F86Yr3XxayNTBuFuti5OSQEDCR
 ODGxhaWLkYtDSGAHo8T3xbuZIZxPjBKLny9lhXC+MUrcPtDLDNOybl8/E0RiL6PE2qdnoape
 Mko87/nLDlLFJqAnMX31P7AOEQFziT2LX7GB2MwCPhK/b90Di3MKmElsv3aBFcQWFkiUmPDs
 HxOIzSKgKnF0wkRGEJtXwFLi6PlvrBC2oMTJmU9YIObIS2x/OwfqIgWJn0+XsULERSRmd7ZB
 7bWSaO15APachMBbdoktu04zQjS4SDx+tpUVwhaWeHV8CzuELSXx+d1eNgi7WOLo/A3sEM0N
 jBI3vt6EKrKXaG5tBiriANqmKbF+lz7EYj6Jd197WEHCEgK8Eh1tQhDVqhLdj5ZA3SktsezY
 QagpHhJzl/9nncCoOAvJa7OQvDYLyTuzEJYtYGRZxSiWWlCcm55abFhgAo/u5PzcTYzglKhl
 sYNx7tsPeocYmTgYDzFKcDArifB2vzyYJsSbklhZlVqUH19UmpNafIjRFBjYE5mlRJPzgUk5
 ryTe0MTSwMTMyMTC2NLYTEmc98yVslQhgfTEktTs1NSC1CKYPiYOTqkGJunGfbr3xB2rvpcv
 Paa7ZUvojeNJDGx6LzhUWDy3v3KMi3jfEHla5eaBGR4vEk8tepWUKvtzo4fZ7x38advTzTcJ
 bijQ7JH8NCd0YsmuffUX1SZt5jdt05HROh2Qs79b92jd0rQ9K/pqGI0UfNuLxLPuaexPS5fU
 b/lXduD2EbZY1z07jJzkClPj3Z5fY3S6pFr8csf7ScLW3dInP12N9+OIrWeZqq7skaeZX9+x
 VvUlx03NhNjODRGb/R1vf717NnNDo8LlDKFbj1ieX7dky/cQ4j3L+UzU88EcuxLZ+EtvOP6U
 aRyUW/C6U94mn81usgHjc41mzYpzk4/7OB8pMOdIWJO3aEqAr1aRuZESS3FGoqEWc1FxIgA2
 rFlLEgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsWy7bCSvK4W85E0gyWfhC1OTz3LZPFk/Sxm
 i0uL3C0u75rD5sDisWlVJ5vH7gWfmTw+b5ILYI7isklJzcksSy3St0vgyjh9agV7wXzpivdf
 FrI1MG4W62Lk5JAQMJFYt6+fqYuRi0NIYDejxIWbbSxdjBxACWmJY3+KIExhicOHiyFKnjNK
 fDx3gAmkl01AT2L66n/MILaIgKXEglnnWEBsZgE/iV0PVzBDNLQzSrzpWMIOkuAUMJPYfu0C
 K4gtLBAvMfPMREYQm0VAVeLoBAibF2jQ0fPfWCFsQYmTM5+A3cMMtKxtIyPEfHmJ7W/nMEPc
 ryDx8+kyVoi4iMTszjaoe6wkWnsesExgFJ6FZNIshEmzkEyahaR7ASPLKkbJ1ILi3PTcZMMC
 w7zUcr3ixNzi0rx0veT83E2M4KjQ0tjBeG/+P71DjEwcjIcYJTiYlUR4u18eTBPiTUmsrEot
 yo8vKs1JLT7EKM3BoiTOazhjdoqQQHpiSWp2ampBahFMlomDU6qB6Z2igq9KAeOXq/bhP996
 Vy6etd3Ki+9Y7sVHjsdizqS8m9pZckflsPUzhpIIJesu+QpL8eeHLO6+EVYK4svoWnayxN7o
 ot5Kztjr9zki54jXs/3U//x+AzvP+bBNa5cYLmm75an+PXLWr/9brwrqfdiqKKuyfcnMidb5
 rPyfg1sbzUKTXzjc5fnwii3sdsyK1Yuv8gm9Kr1XdL5Scvfqn7ee536r0ij99obxc0igOe+6
 L76L5vkwqV/qZD8gJKOwafaFQOEuXman9wvVTqxt9NP+VjffkF1Lq/Qgg7ZkI39ay345B7FN
 vWZLGLk89st92u7FeVLmmd7+qJVJ10o/XjAQF2p/2OIapG83o2C3EktxRqKhFnNRcSIAomEB
 +/kCAAA=
X-CMS-MailID: 20240820024458epcas1p4b3bf4d42997870503bf57de45cd70fff
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240814135008epcas1p3e11d629481d51a4cc4af78dbe3e66fda
References: <CGME20240814135008epcas1p3e11d629481d51a4cc4af78dbe3e66fda@epcas1p3.samsung.com>
 <20240814134815.801303-1-chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Chao Yu,
 >SQLite App GC Thread Shrinker >- f2fs_ioc_start_atomic_write
 > >- f2fs_ioc_commit_atomic_write > - f2fs_commit_atomic_write > -
 filemap_write_and_wait_range
 > : write atomic_file's data to cow_inode [...] 
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
 [203.254.224.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
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
X-Headers-End: 1sgErv-0002nr-MQ
Subject: Re: [f2fs-dev] [PATCH v2 2/4] f2fs: atomic: fix to not allow GC to
 pollute atomic_file
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Chao Yu,

>SQLite App			GC Thread	Shrinker
>- f2fs_ioc_start_atomic_write
>
>- f2fs_ioc_commit_atomic_write
> - f2fs_commit_atomic_write
>  - filemap_write_and_wait_range
>  : write atomic_file's data to cow_inode
>						echo 3 > drop_caches
>				- f2fs_gc
>				 - gc_data_segment
>				  - move_data_page

We modified the code to make GC of the atomic file go to move_data_block
in commit b40a2b003709 (f2fs: use meta inode for GC of atomic file).
Could you please check if this patch is still necessary?

Thanks,

>				   - set_page_dirty
>				   : it may load data of previous
>				     transaction into pagecache.
>  - f2fs_down_write(&fi->i_gc_rwsem[WRITE])
>  - __f2fs_commit_atomic_write
>  - f2fs_up_write(&fi->i_gc_rwsem[WRITE])
>
>During committing atomic_file, GC may be triggered to migrate atomic_file's
>block, so it may contain data of previous transaction in page cache, we
>should drop atomic_file's cache once it was migrated by GC.
>
>And also, we should writeback atomic_file and cow_file's data w/ i_gc_rwsem
>lock held, in order to avoid block address change during
>__f2fs_commit_atomic_write().
>
>Meahwhile, this patch adds f2fs_wait_on_block_writeback_range()
>to wait completion of block migration.
>
>Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
>Signed-off-by: Chao Yu <chao@kernel.org>
>---
>v2:
>- fix error path handling.
> fs/f2fs/segment.c | 27 +++++++++++++++++++++++----
> 1 file changed, 23 insertions(+), 4 deletions(-)
>
>diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
>3aee71c9f3c6..a43054ab0cf1 100644
>--- a/fs/f2fs/segment.c
>+++ b/fs/f2fs/segment.c
>@@ -236,6 +236,9 @@ static int __replace_atomic_write_block(struct inode
>*inode, pgoff_t index,
> 		return err;
> 	}
>
>+	if (__is_valid_data_blkaddr(dn.data_blkaddr))
>+		f2fs_wait_on_block_writeback_range(inode, dn.data_blkaddr,
1);
>+
> 	if (recover) {
> 		/* dn.data_blkaddr is always valid */
> 		if (!__is_valid_data_blkaddr(new_addr)) { @@ -339,6 +342,9
@@
>static int __f2fs_commit_atomic_write(struct inode *inode)
> 				goto out;
> 			}
>
>+			f2fs_wait_on_block_writeback_range(cow_inode,
>+								blkaddr, 1);
>+
> 			new = f2fs_kmem_cache_alloc(revoke_entry_slab,
GFP_NOFS,
> 							true, NULL);
>
>@@ -379,16 +385,29 @@ int f2fs_commit_atomic_write(struct inode *inode)
> 	struct f2fs_inode_info *fi = F2FS_I(inode);
> 	int err;
>
>+	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
>+
> 	err = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
> 	if (err)
>-		return err;
>+		goto out;
>
>-	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
>-	f2fs_lock_op(sbi);
>+	/* writeback GCing page of cow_inode */
>+	err = filemap_write_and_wait_range(fi->cow_inode->i_mapping,
>+							0, LLONG_MAX);
>+	if (err)
>+		goto out;
>
>-	err = __f2fs_commit_atomic_write(inode);
>+	filemap_invalidate_lock(inode->i_mapping);
>+
>+	/* don't allow clean page loaded by GC to pollute atomic_file */
>+	truncate_pagecache(inode, 0);
>
>+	f2fs_lock_op(sbi);
>+	err = __f2fs_commit_atomic_write(inode);
> 	f2fs_unlock_op(sbi);
>+
>+	filemap_invalidate_unlock(inode->i_mapping);
>+out:
> 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>
> 	return err;
>--
>2.40.1
>
>
>
>_______________________________________________
>Linux-f2fs-devel mailing list
>Linux-f2fs-devel@lists.sourceforge.net
>https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
