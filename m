Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A44608D5C2E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 May 2024 10:04:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCxF0-0002Kq-9H;
	Fri, 31 May 2024 08:03:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sCxEw-0002KB-QN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 08:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fiElAEgPAsOuAdZPEUV0rRrNV7bWVFo1R7mUMhItRho=; b=Lfxz5ehiZKIHJQwDhj+LAbZkPL
 Z1+DmFqVvTQckskUQ/v1K66eGEb81BAqxbQ0lml2qTGze6u5UZzzEnQuxXk/KSJh6v5If1QZ1tsdj
 AaTbcoHnrzuuOYjUtQaj2x4itkYfrMKQxRvaL1P/Uzn5twMl2MDXSRGtKse9nA8wUmUM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fiElAEgPAsOuAdZPEUV0rRrNV7bWVFo1R7mUMhItRho=; b=k
 CEtjObnboX0kYDDQIcTP2AdfVCZrM/roC5UTcEOK09ZcZS+pHD8dJ76tlfyVTqWADgdXNlS2u5OiH
 m9oq+HVgMPOBeDmNeHKRvqMGekYTj1jsBT01oV8V9us74ShK0Ct3lbTsQWK0Shg5Kr+WLKcjENGPF
 cO2EUIvQACYXwRXI=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCxEx-00033F-2N for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 08:03:55 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240531074742epoutp04d57a193111bfd8711624fbd407fcda4d~Ugz5tmUPN0638006380epoutp04F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 31 May 2024 07:47:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240531074742epoutp04d57a193111bfd8711624fbd407fcda4d~Ugz5tmUPN0638006380epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1717141662;
 bh=fiElAEgPAsOuAdZPEUV0rRrNV7bWVFo1R7mUMhItRho=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=ecFmUJ+CMi10bvnldsBBd0HGn+JY69U7B0jOZYIH174yWi6kub+DXT+oRCImcwpY8
 4uLHCHGFX2pgY1kWzvluV/xuFSGShZ68As+Xc6CiEuFjQTMXng/2weBqbmDrCBi14l
 W6qWWaA+vUeKazR9vGIo9sKEFRsyAOkWtXc25r98=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20240531074741epcas2p2d8ecfda1f7bcc4f8e50a8eec77f13e8d~Ugz5LeT8c1576415764epcas2p2M;
 Fri, 31 May 2024 07:47:41 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.88]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4VrFb06shMz4x9Py; Fri, 31 May
 2024 07:47:40 +0000 (GMT)
X-AuditID: b6c32a48-105fa70000002507-05-6659809c0d4d
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 E0.88.09479.C9089566; Fri, 31 May 2024 16:47:40 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240531074640epcms2p46c3cf8b7cc4e707948ae200115e28e39@epcms2p4>
Date: Fri, 31 May 2024 16:46:40 +0900
X-CMS-MailID: 20240531074640epcms2p46c3cf8b7cc4e707948ae200115e28e39
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmqe6chsg0gz9b9S0uzPvIbHF66lkm
 iycH2hktXh7StFj1INzix0kTi/7d7SwWT9bPYrZY2LaExeLSIneLy7vmsFm0/HGyOD/xNZPF
 qo65jBZTzx9hcuD32LSqk81j94LPTB6L+yazevRtWcXo8XmTXABrVLZNRmpiSmqRQmpecn5K
 Zl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtClSgpliTmlQKGAxOJiJX07m6L8
 0pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTsjL17VjIWNPtX/Hu1kKmB
 8Zt9FyMnh4SAicSfydeZuxi5OIQEdjBKPDnwg7WLkYODV0BQ4u8OYZAaYQF7iRkHvzCD2EIC
 ShLrL85ih4jrSdx6uIYRxGYT0JGYfuI+O8gcEYFTTBKHnnxkBXGYBQ4wSfw6tI4RYhuvxIz2
 pywQtrTE9uVboeIaEj+W9TJD2KISN1e/ZYex3x+bD1UjItF67yxUjaDEg5+7oeKSErfnboKq
 z5f4f2U5lF0jse3APChbX+Jax0awvbwCvhL7N/9gB3mSRUBVYtnueogSF4lpJ/rAypkF5CW2
 v53DDFLCLKApsX6XPogpIaAsceQWC0QFn0TH4b/sME81bPyNlb1j3hMmCFtNYt3P9UwQY2Qk
 bs1jnMCoNAsRzrOQrJ2FsHYBI/MqRrHUguLc9NRiowITeNQm5+duYgQnWS2PHYyz337QO8TI
 xMF4iFGCg1lJhPdXekSaEG9KYmVValF+fFFpTmrxIUZToH8nMkuJJucD03xeSbyhiaWBiZmZ
 obmRqYG5kjjvvda5KUIC6YklqdmpqQWpRTB9TBycUg1MJ+q6Ozeae00I1n92R+TOibcTuJhO
 nPHdKZZ9evLOSwsrPz7Sq/b3m9tnzKn0jO/Ekw9qHw9N3a/72Gp/ZPd1rw5HQ7lJcz/1c3z1
 v2daOy3wj0actNbDaS/4D8YLbo6ckf90lX7CvA01lx/OefuoM5vHZsMU1W8qJxq/5E60ipw5
 U7TvTcyvQ3m5R09EJTfbdPx5oJzx3zmnIn29RsZdx/UvC39acbfMlUzpMVxuvcwr+MGtfGaj
 y9sjTVutznrn98yqWNl9b/dsmeDnuddeMMxffeHRPe1+BcZ0v8aHGUbn1Kc/OcnyLOSO1Jzs
 38tfP7rfcDNUJ/XrtbM/s3dWxiaxhhmIaU9+WsU4b8fGRiWW4oxEQy3mouJEAIWkUko7BAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240531074640epcms2p46c3cf8b7cc4e707948ae200115e28e39
References: <CGME20240531074640epcms2p46c3cf8b7cc4e707948ae200115e28e39@epcms2p4>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The amount of node writes is small compared to the amount
 of user data writes in most workloads. Therefore, even if there is enough
 free space in the node section, it cannot be used by another type be [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sCxEx-00033F-2N
Subject: [f2fs-dev] [RFC PATCH] f2fs: add support single node section mode
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
Reply-To: daejun7.park@samsung.com
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The amount of node writes is small compared to the amount of user data
writes in most workloads. Therefore, even if there is enough free space
in the node section, it cannot be used by another type because the type
for its section is fixed. When using zoned storage, the free space in
node section issue can be a problem due to the large section.

This patch can avoid the problem by using a single node section without
considering the hotness of the node section. For particularly high file
system usage, two sections can be used as free sections, which makes it
more efficient.

To use single node section, add the 'single_node_sec' in mount option.

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 Documentation/filesystems/f2fs.rst |  2 +
 fs/f2fs/f2fs.h                     |  3 ++
 fs/f2fs/recovery.c                 |  3 ++
 fs/f2fs/segment.c                  | 77 ++++++++++++++++++++++++++++++
 fs/f2fs/segment.h                  |  2 +
 fs/f2fs/super.c                    | 12 +++++
 6 files changed, 99 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 68a0885fb5e6..ba26b2ce4fa4 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -134,6 +134,8 @@ noacl			 Disable POSIX Access Control List. Note: acl is enabled
 active_logs=%u		 Support configuring the number of active logs. In the
 			 current design, f2fs supports only 2, 4, and 6 logs.
 			 Default number is 6.
+single_node_sec	 Support single node section mode, it enables single active
+			 log for hot/warm/cold nodes. This is disabled by default.
 disable_ext_identify	 Disable the extension list configured by mkfs, so f2fs
 			 is not aware of cold files such as media files.
 inline_xattr		 Enable the inline xattrs feature.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1974b6aff397..90f13a6b64ce 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -116,6 +116,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define	F2FS_MOUNT_GC_MERGE		0x02000000
 #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
 #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
+#define F2FS_MOUNT_SINGLE_NODE_SEC	0x10000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -1655,6 +1656,8 @@ struct f2fs_sb_info {
 
 	struct f2fs_mount_info mount_opt;	/* mount options */
 
+	bool single_node_sec;			/* single node section */
+
 	/* for cleaning operations */
 	struct f2fs_rwsem gc_lock;		/*
 						 * semaphore for GC, avoid
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 496aee53c38a..b5cdb0845ac7 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -414,6 +414,9 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
+	/* check hot node if single node section mode is enabled */
+	if (sbi->single_node_sec && curseg->segno == NULL_SEGNO)
+		curseg = CURSEG_I(sbi, CURSEG_HOT_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
 	blkaddr_fast = blkaddr;
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a0ce3d080f80..c1fe5c92bdfb 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -394,6 +394,9 @@ int f2fs_commit_atomic_write(struct inode *inode)
 	return err;
 }
 
+static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec);
+static void locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno);
+
 /*
  * This function balances dirty node and dentry pages.
  * In addition, it controls garbage collection.
@@ -420,6 +423,58 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	if (has_enough_free_secs(sbi, 0, 0))
 		return;
 
+	if (test_opt(sbi, SINGLE_NODE_SEC) && !sbi->single_node_sec) {
+		int type, segno, left_blocks = 0;
+
+		for (type = CURSEG_HOT_NODE; type <= CURSEG_COLD_NODE; type++) {
+			segno = CURSEG_I(sbi, type)->segno;
+			left_blocks += CAP_BLKS_PER_SEC(sbi) -
+					get_ckpt_valid_blocks(sbi, segno, true);
+		}
+
+		/* enable single node section mode if we get 2 free sections */
+		if (left_blocks < CAP_BLKS_PER_SEC(sbi) * 2)
+			goto do_gc;
+
+		f2fs_down_read(&SM_I(sbi)->curseg_lock);
+		down_write(&SIT_I(sbi)->sentry_lock);
+
+		/* it can be enabled by others */
+		if (sbi->single_node_sec)
+			goto unlock;
+
+		/* leave current zone by allocating new section */
+		for (type = CURSEG_WARM_NODE; type <= CURSEG_COLD_NODE; type++) {
+			struct curseg_info *curseg = CURSEG_I(sbi, type);
+
+			mutex_lock(&curseg->curseg_mutex);
+			segno = curseg->segno;
+			if (new_curseg(sbi, type, true)) {
+				mutex_unlock(&curseg->curseg_mutex);
+				goto unlock;
+			}
+			locate_dirty_segment(sbi, segno);
+			mutex_unlock(&curseg->curseg_mutex);
+		}
+
+		/* clear warm node, cold node information */
+		for (type = CURSEG_WARM_NODE; type <= CURSEG_COLD_NODE; type++) {
+			struct curseg_info *curseg = CURSEG_I(sbi, type);
+
+			mutex_lock(&curseg->curseg_mutex);
+			segno = curseg->segno;
+			curseg->segno = NULL_SEGNO;
+			curseg->inited = false;
+			__set_test_and_free(sbi, segno, false);
+			mutex_unlock(&curseg->curseg_mutex);
+		}
+		f2fs_notice(sbi, "single node section mode enabled");
+		sbi->single_node_sec = true;
+unlock:
+		up_write(&SIT_I(sbi)->sentry_lock);
+		f2fs_up_read(&SM_I(sbi)->curseg_lock);
+	}
+do_gc:
 	if (test_opt(sbi, GC_MERGE) && sbi->gc_thread &&
 				sbi->gc_thread->f2fs_gc_task) {
 		DEFINE_WAIT(wait);
@@ -3502,6 +3557,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
 						inode->i_write_hint);
 	} else {
+		if (fio->sbi->single_node_sec)
+			return CURSEG_HOT_NODE;
+
 		if (IS_DNODE(fio->page))
 			return is_cold_node(fio->page) ? CURSEG_WARM_NODE :
 						CURSEG_HOT_NODE;
@@ -4116,6 +4174,15 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 							CURSEG_HOT_NODE]);
 		blk_off = le16_to_cpu(ckpt->cur_node_blkoff[type -
 							CURSEG_HOT_NODE]);
+		if (segno == NULL_SEGNO && type != CURSEG_HOT_NODE) {
+			if (!test_opt(sbi, SINGLE_NODE_SEC)) {
+				f2fs_err(sbi, "single_node_sec option required");
+				return -EFAULT;
+			}
+			sbi->single_node_sec = true;
+			return 0;
+		}
+
 		if (__exist_node_summaries(sbi))
 			blk_addr = sum_blk_addr(sbi, NR_CURSEG_NODE_TYPE,
 							type - CURSEG_HOT_NODE);
@@ -4884,6 +4951,8 @@ static void init_free_segmap(struct f2fs_sb_info *sbi)
 		struct curseg_info *curseg_t = CURSEG_I(sbi, type);
 
 		__set_test_and_inuse(sbi, curseg_t->segno);
+		if (sbi->single_node_sec && type == CURSEG_HOT_NODE)
+			break;
 	}
 }
 
@@ -5027,6 +5096,10 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 			f2fs_handle_error(sbi, ERROR_INVALID_CURSEG);
 			return -EFSCORRUPTED;
 		}
+
+		/* in single node section mode, WARM/COLD NODE are invalid */
+		if (sbi->single_node_sec && i == CURSEG_HOT_NODE)
+			break;
 	}
 	return 0;
 }
@@ -5153,6 +5226,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	if (!zbd)
 		return 0;
 
+	/* in single node section mode, WARM/COLD node are not valid */
+	if (sbi->single_node_sec && type > CURSEG_HOT_NODE)
+		return 0;
+
 	/* report zone for the sector the curseg points to */
 	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk)
 		<< log_sectors_per_block;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index e1c0f418aa11..152a07e61b5f 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -570,6 +570,8 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 				get_ckpt_valid_blocks(sbi, segno, true);
 		if (node_blocks > left_blocks)
 			return false;
+		if (sbi->single_node_sec) /* check only hot node */
+			break;
 	}
 
 	/* check current data section for dentry blocks. */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1f1b3647a998..c21eeca86b0a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -129,6 +129,7 @@ enum {
 	Opt_acl,
 	Opt_noacl,
 	Opt_active_logs,
+	Opt_single_node_sec,
 	Opt_disable_ext_identify,
 	Opt_inline_xattr,
 	Opt_noinline_xattr,
@@ -207,6 +208,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_acl, "acl"},
 	{Opt_noacl, "noacl"},
 	{Opt_active_logs, "active_logs=%u"},
+	{Opt_single_node_sec, "single_node_sec"},
 	{Opt_disable_ext_identify, "disable_ext_identify"},
 	{Opt_inline_xattr, "inline_xattr"},
 	{Opt_noinline_xattr, "noinline_xattr"},
@@ -803,6 +805,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				return -EINVAL;
 			F2FS_OPTION(sbi).active_logs = arg;
 			break;
+		case Opt_single_node_sec:
+			set_opt(sbi, SINGLE_NODE_SEC);
+			break;
 		case Opt_disable_ext_identify:
 			set_opt(sbi, DISABLE_EXT_IDENTIFY);
 			break;
@@ -2039,6 +2044,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 					F2FS_OPTION(sbi).s_resuid),
 				from_kgid_munged(&init_user_ns,
 					F2FS_OPTION(sbi).s_resgid));
+	if (test_opt(sbi, SINGLE_NODE_SEC))
+		seq_puts(seq, ",single_node_sec");
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	if (test_opt(sbi, FAULT_INJECTION)) {
 		seq_printf(seq, ",fault_injection=%u",
@@ -3675,6 +3682,9 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	blocks_per_seg = BLKS_PER_SEG(sbi);
 
 	for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
+		/* bypass single node section mode */
+		if (le32_to_cpu(ckpt->cur_node_segno[i] == NULL_SEGNO))
+			goto check_data;
 		if (le32_to_cpu(ckpt->cur_node_segno[i]) >= main_segs ||
 			le16_to_cpu(ckpt->cur_node_blkoff[i]) >= blocks_per_seg)
 			return 1;
@@ -3823,6 +3833,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	init_f2fs_rwsem(&sbi->io_order_lock);
 	spin_lock_init(&sbi->cp_lock);
 
+	sbi->single_node_sec = false;
+
 	sbi->dirty_device = 0;
 	spin_lock_init(&sbi->dev_lock);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
