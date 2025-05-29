Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621FAC7D65
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3VOiQxzCEhPSCVaPdK4qiNOb78luUNBE6b1pyTZH0o=; b=NT+VE1R+OedRSvLaHxK25bOu6B
	CT1ztIsbhqLnYSLpjKKatL8d9f/JqzJEpSQzaY9PNCytQGpcbpppCuIkwaNsh9LNRsrSMbOQg0J2K
	zRDA3c55ErFygKT4iQV41ke1z9SEPacXy3eKeN71P909Ed4jx+rw5bzNXdwb+jX7MP90=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKblo-0001yd-U4;
	Thu, 29 May 2025 11:50:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKblm-0001yO-Rg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=csRq9EOkjvotqyaMSnen4p9GhG5ZXIfAgw7tJJltvyc=; b=OVYyEuvmi0BeDPom+zd1ntcuVI
 DXbKdbLiacUZBmwTyFEcrAvRf4mnGwBrdaWRwu6kmWPXoHQn9wl/TKC+0wmHXg+7A7NqlHG+mFngy
 iNKI2HR3s99STNDrXortlL8XVc8lL9Wxc4rKFs7ig1HEzCfsDLw+dvoVGXAYegqz+cxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=csRq9EOkjvotqyaMSnen4p9GhG5ZXIfAgw7tJJltvyc=; b=FzzX53A6+dWK3zzv4l6V0zI8h5
 4poBZFEwUWRpP7SGHw74MLXebw2dcaGItLFs/AFjIRIZizTrLIyvGf3r9/TD24wTIAEGAHJ0l1FtQ
 h1DcuhXoa9cJyZqqUPYa4u2vZMGnrM/nkSeO+Mw/6ncl2ECbZleuXgLUnZXzc/i6mFvA=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKbll-0000yX-6u for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:58 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250529113403epoutp046ff79a1a25473d151f3ce78bbb536f61~D-EK263Sp2606426064epoutp04S
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:34:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250529113403epoutp046ff79a1a25473d151f3ce78bbb536f61~D-EK263Sp2606426064epoutp04S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518443;
 bh=csRq9EOkjvotqyaMSnen4p9GhG5ZXIfAgw7tJJltvyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jwv30oxJUTrMEulLh9JHduU96MUNim4Lc334qXNvAIy81vfUt8xJr4L/0pMwaYHmI
 LPP15/RPWOZ8eZN5vRljK7MgWM3jGUWXbD+ZtMl0L4RliI6vyxWYecueQBk9R+y1LS
 JOTHNjAjTZ1r2XCPhoKJZYaQwDkX6MV0U7MP/jQI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250529113403epcas5p3ecde97960ffa8d7d4d4b45c1779f89fc~D-EKN0Qi20520305203epcas5p37;
 Thu, 29 May 2025 11:34:03 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.183]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4b7PQd68wvz6B9m6; Thu, 29 May
 2025 11:34:01 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113245epcas5p2978b77ce5ccf2d620f2a9ee5e796bee3~D-DBs3Xno1680116801epcas5p2Z;
 Thu, 29 May 2025 11:32:45 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250529113245epsmtrp147f2be7878fb2129e7ffc9db6335a65c~D-DBrXzPI2108121081epsmtrp1N;
 Thu, 29 May 2025 11:32:45 +0000 (GMT)
X-AuditID: b6c32a28-46cef70000001e8a-40-683845dd0a77
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 1D.41.07818.DD548386; Thu, 29 May 2025 20:32:45 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113241epsmtip22d74af2e3aeb73a5e3c829e676ca9719~D-C9x9Brt2194921949epsmtip20;
 Thu, 29 May 2025 11:32:40 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:44:58 +0530
Message-Id: <20250529111504.89912-8-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7bCSvO5dV4sMg/s3OSy2rdvNbjFn/Ro2
 iwvrVjNatO78z2LRNOEvs8Xqu/1sFq8Pf2K0OD31LJPFlkv2Fu8vb2OyWH1zDaPFlmP3GC0u
 P+Gz2D39H6vFzQM7mSxWrj7KZDF7ejOTxZP1s5gttn75ympxaZG7xZ69J1ks7q35z2px4cBp
 VosbE54yWjzbvZHZ4vPSFnaLg6c62C0+zQUacv7vcVaL3z/msDnIeZxaJOGxc9Zddo/NK7Q8
 Lp8t9di0qpPNY9OnSeweJ2b8ZvF4sXkmo8fuBZ+ZPHbfbGDzOHexwuP9vqtsHn1bVjF6TJ1d
 73FmwRF2jxXTLjIFCEVx2aSk5mSWpRbp2yVwZTT/TC6YrFBx8qtKA+NVqS5GDg4JAROJtdfY
 uhi5OIQEdjNKzFh4maWLkRMoLiOx++5OVghbWGLlv+fsEEUfGSWWnpjKBtLMJqAr8aMpFCQu
 InCTWeLc2TNgDcwC/xgldr/SAbGFBdIk2jZtZASxWQRUJd5PaGIHsXkFbCX+/73NBLFAXmLm
 pe9gcU4BO4lFS76C1QsB1Sy9uZYFol5Q4uTMJywQ8+UlmrfOZp7AKDALSWoWktQCRqZVjJKp
 BcW56bnJhgWGeanlesWJucWleel6yfm5mxjBaUFLYwfju29N+ocYmTgYDzFKcDArifA22Ztl
 CPGmJFZWpRblxxeV5qQWH2KU5mBREuddaRiRLiSQnliSmp2aWpBaBJNl4uCUamBS+HWY92pP
 kj7fZNNTixVfGfFfW8V6K+RWY02TqsTxeeETA++/kXiw5/Puo3qfvs3xF9Fbejoq3eSZumDN
 zBO23IYebYIMX3lul3r93NDvkvBsyYTHn2pPZgXwmE9XmRjhIiwqN83t6a+fPkuKuf8fCGVb
 trzgyvrHCgtfcOckm8/6edkkzePLEnabza48H7yO6CQzbpx8QLIzJOyNjvCPKaFPD+fc2Lzr
 84Hb9T4rxCJT4nbpaed6lAuFJkUcvcR7Mvrh2q829nrf91wyz+B83Osan3C8RsHJc/2l2943
 GO9HTrvpI9P7tOjzvsdO837qVa6x6O//s4OFm3sX45StMS8nrK3g/BWamTir51ycEktxRqKh
 FnNRcSIAprgQRnoDAAA=
X-CMS-MailID: 20250529113245epcas5p2978b77ce5ccf2d620f2a9ee5e796bee3
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113245epcas5p2978b77ce5ccf2d620f2a9ee5e796bee3
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113245epcas5p2978b77ce5ccf2d620f2a9ee5e796bee3@epcas5p2.samsung.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Modify sync related functions to iterate over all writeback
 contexts. Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
 Signed-off-by:
 Anuj Gupta <anuj20.g@samsung.com> --- fs/fs-writeback.c | 66
 +++++++++++++++++++++++++++++++ 1 file changed, 44 in [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
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
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uKbll-0000yX-6u
Subject: [f2fs-dev] [PATCH 07/13] writeback: modify sync related functions
 to iterate over all writeback contexts
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Kundan Kumar <kundan.kumar@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Modify sync related functions to iterate over all writeback contexts.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/fs-writeback.c | 66 +++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 9b0940a6fe78..7558b8a33fe0 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2752,11 +2752,13 @@ static void wait_sb_inodes(struct super_block *sb)
 	mutex_unlock(&sb->s_sync_lock);
 }
 
-static void __writeback_inodes_sb_nr(struct super_block *sb, unsigned long nr,
-				     enum wb_reason reason, bool skip_if_busy)
+static void __writeback_inodes_sb_nr_ctx(struct super_block *sb,
+					 unsigned long nr,
+					 enum wb_reason reason,
+					 bool skip_if_busy,
+					 struct bdi_writeback_ctx *bdi_wb_ctx)
 {
-	struct backing_dev_info *bdi = sb->s_bdi;
-	DEFINE_WB_COMPLETION(done, bdi->wb_ctx_arr[0]);
+	DEFINE_WB_COMPLETION(done, bdi_wb_ctx);
 	struct wb_writeback_work work = {
 		.sb			= sb,
 		.sync_mode		= WB_SYNC_NONE,
@@ -2766,13 +2768,23 @@ static void __writeback_inodes_sb_nr(struct super_block *sb, unsigned long nr,
 		.reason			= reason,
 	};
 
+	bdi_split_work_to_wbs(sb->s_bdi, bdi_wb_ctx, &work, skip_if_busy);
+	wb_wait_for_completion(&done);
+}
+
+static void __writeback_inodes_sb_nr(struct super_block *sb, unsigned long nr,
+				     enum wb_reason reason, bool skip_if_busy)
+{
+	struct backing_dev_info *bdi = sb->s_bdi;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
+
 	if (!bdi_has_dirty_io(bdi) || bdi == &noop_backing_dev_info)
 		return;
 	WARN_ON(!rwsem_is_locked(&sb->s_umount));
 
-	bdi_split_work_to_wbs(sb->s_bdi, bdi->wb_ctx_arr[0], &work,
-			      skip_if_busy);
-	wb_wait_for_completion(&done);
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx)
+		__writeback_inodes_sb_nr_ctx(sb, nr, reason, skip_if_busy,
+					     bdi_wb_ctx);
 }
 
 /**
@@ -2825,17 +2837,11 @@ void try_to_writeback_inodes_sb(struct super_block *sb, enum wb_reason reason)
 }
 EXPORT_SYMBOL(try_to_writeback_inodes_sb);
 
-/**
- * sync_inodes_sb	-	sync sb inode pages
- * @sb: the superblock
- *
- * This function writes and waits on any dirty inode belonging to this
- * super_block.
- */
-void sync_inodes_sb(struct super_block *sb)
+static void sync_inodes_bdi_wb_ctx(struct super_block *sb,
+				   struct backing_dev_info *bdi,
+				   struct bdi_writeback_ctx *bdi_wb_ctx)
 {
-	struct backing_dev_info *bdi = sb->s_bdi;
-	DEFINE_WB_COMPLETION(done, bdi->wb_ctx_arr[0]);
+	DEFINE_WB_COMPLETION(done, bdi_wb_ctx);
 	struct wb_writeback_work work = {
 		.sb		= sb,
 		.sync_mode	= WB_SYNC_ALL,
@@ -2846,6 +2852,25 @@ void sync_inodes_sb(struct super_block *sb)
 		.for_sync	= 1,
 	};
 
+	/* protect against inode wb switch, see inode_switch_wbs_work_fn() */
+	bdi_down_write_wb_ctx_switch_rwsem(bdi_wb_ctx);
+	bdi_split_work_to_wbs(bdi, bdi_wb_ctx, &work, false);
+	wb_wait_for_completion(&done);
+	bdi_up_write_wb_ctx_switch_rwsem(bdi_wb_ctx);
+}
+
+/**
+ * sync_inodes_sb	-	sync sb inode pages
+ * @sb: the superblock
+ *
+ * This function writes and waits on any dirty inode belonging to this
+ * super_block.
+ */
+void sync_inodes_sb(struct super_block *sb)
+{
+	struct backing_dev_info *bdi = sb->s_bdi;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
+
 	/*
 	 * Can't skip on !bdi_has_dirty() because we should wait for !dirty
 	 * inodes under writeback and I_DIRTY_TIME inodes ignored by
@@ -2855,11 +2880,8 @@ void sync_inodes_sb(struct super_block *sb)
 		return;
 	WARN_ON(!rwsem_is_locked(&sb->s_umount));
 
-	/* protect against inode wb switch, see inode_switch_wbs_work_fn() */
-	bdi_down_write_wb_ctx_switch_rwsem(bdi->wb_ctx_arr[0]);
-	bdi_split_work_to_wbs(bdi, bdi->wb_ctx_arr[0], &work, false);
-	wb_wait_for_completion(&done);
-	bdi_up_write_wb_ctx_switch_rwsem(bdi->wb_ctx_arr[0]);
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx)
+		sync_inodes_bdi_wb_ctx(sb, bdi, bdi_wb_ctx);
 
 	wait_sb_inodes(sb);
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
