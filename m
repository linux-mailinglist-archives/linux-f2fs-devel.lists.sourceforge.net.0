Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91196B38BB4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Aug 2025 23:52:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vBforT5CmcqtQVJPK9rPw1TYdwyVD6P0Wy6/p+gVbN8=; b=a/FMbcu+iyVCfzKt9MFiBorzV0
	s7mO0vcEdLbQ6R9akhaXyNhdRm6Ylf58YE5qc4p9OE4E8nWEVujuEUZuFcZ0nN6bJpz7eGyZ52evG
	QSitHhhc+sIVXATZex5pQhFtGCE2m1ezVidbCYZ3olxZP/KjHm+m1l9z2T5Z+iqugRnI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urO4L-0000hW-8z;
	Wed, 27 Aug 2025 21:52:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1urO4J-0000hQ-Q3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 21:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=139n1EKDoqA6sP2TrkBYfSq+vbL51RuxBAuczBDDSZQ=; b=Ue5mHqjzzml2AQfkTW0U94pavI
 8ucQltgSo43/pmLAssyDn4ampl+71pKgm0NrPfhz3U36Tgt6HbDvB6kfzbGY0+ghM/cvk+tv83U03
 tC9oHCqYVI2haIEfOtFTM9881ZY/ZyU2q79fIPK+ECh4XiA/kZrQLuttymv/3WsmavHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=139n1EKDoqA6sP2TrkBYfSq+vbL51RuxBAuczBDDSZQ=; b=d
 fIsnaE+w/zewpcg6BDQTfVzB6WEmvqvaWf28R6JCVTKsJPacuB3FHMnD3I++z4Dju03PqYyw+t9/n
 uvtvcyZV2nEKc7Vct9xnU2FoMZDI6GiBYY5wXqpnGvqZx3+dX1PR3rkK4I827Ge3uIyqqleBmcbXv
 5Xt25gQr3J9CtUQY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urO4J-00058U-G8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 21:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 073AF43A71
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Aug 2025 21:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA201C4CEEB;
 Wed, 27 Aug 2025 21:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756331544;
 bh=820xGs1O8S9T2vSvVTVEfothysBjQAsbUNdDwQu4QtY=;
 h=From:To:Cc:Subject:Date:From;
 b=INiLio9r+a1WpOG/Y0Swmwu0Qp5e9Iy5rMWkP8bt8z4pgLp91IKSOylv0p9ST9tns
 mk8dRGMuyh7Yzq+A8yMS6IHzX3VRKVYmpTEv+xBtaXjx9FATSuBAh44wfiwlE8AjPt
 +gIRLyfEo4tyYoixKv0M0YSr+k/mJQmcPhAKq1YFTy0rq7InHsBV73b1W0nUFPR1QM
 Pu1Sq5Teb0XzwXD58N8UgRxDE2+vdCbvcekDS74lo3lpXb3ketetaJ4MWii7DaQO+f
 zNhuNSoX1KIkbjNB2+TZeSdul3XWEsSW2UhzglGYhl7Vx5o41BM0nbX/lp2ZtCZHBm
 y8b/HyycaiiTA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Aug 2025 21:52:22 +0000
Message-ID: <20250827215222.1615844-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Let's split IPU writes in hot data area to improve the GC
 efficiency. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fs/f2fs/segment.c | 3 ++- 1 file changed, 2 insertions(+),
 1 deletion(-) diff --git a/fs/f2fs/segment.c
 b/fs/f2fs/segment.c index e0f6589c6a1c..bb79dad55ac9 100644 ---
 a/fs/f2fs/segment.c +++ b/fs/f2fs/segment.c @@ -3688, 7 +3688,
 8 @@ static int __get_segment_type_6(struct [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1urO4J-00058U-G8
Subject: [f2fs-dev] [PATCH] f2fs: allocate HOT_DATA for IPU writes
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's split IPU writes in hot data area to improve the GC efficiency.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index e0f6589c6a1c..bb79dad55ac9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3688,7 +3688,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 
 		if (file_is_hot(inode) ||
 				is_inode_flag_set(inode, FI_HOT_DATA) ||
-				f2fs_is_cow_file(inode))
+				f2fs_is_cow_file(inode) ||
+				is_inode_flag_set(inode, FI_NEED_IPU))
 			return CURSEG_HOT_DATA;
 		return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
 						inode->i_write_hint);
-- 
2.51.0.318.gd7df087d1a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
