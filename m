Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A81C666322
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 19:54:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFgFN-0000nO-5T;
	Wed, 11 Jan 2023 18:54:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pFgFL-0000nH-Ga
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 18:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F3PGCcryn3/zDWGBqGW0AByjuHelvZulRmIvnrgAqCU=; b=R8T3jNkQ9TROL4brXQO0EbWKzi
 BYNWZeaqQ1Dqt9gJDbqN2kYN2gHRNr/QojdSrYXJYBVf9Nbqc8N8Sf1N/QdAuYk6SKtYJ1L1EtU9h
 7M+MLeDAl7OmLr63tdubO6LL9b2ajr/rh4RyEmxT2AKj+TA/80cNIQhSWiUena7kc2h0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F3PGCcryn3/zDWGBqGW0AByjuHelvZulRmIvnrgAqCU=; b=c3aOZ0O67hhXy5+GqW+PjtPXih
 o52Yl+KqH/hScv6M08z3GPiq1SWTjGhHQNCxG6Tj9o+QTTjJMBQZkMN8jsZG0h+hZLxTnNe7UCeGu
 eW4+5O4QvFtmh5nZC5mWi6lja2VsKg5cQx46ZYmDyyuR+4X2o845eZX8OUc4mTxPIwkw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFgFG-00EI7d-AT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 18:54:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0FB16B81BB2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Jan 2023 18:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2DAC433EF;
 Wed, 11 Jan 2023 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673463274;
 bh=jJXh1vAxyah+RSk36H0uasBBaBLj/+dpkHSkaO37ss0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CPUcBM+H6w5MPJ26lYG9gBLwDkP3/yBstxi6nW084sNA9M+uObOkEMSMq052ksKhW
 +RntYatoGOjtYGlr6/VZV2wBdN+mQ0ly8Mu25vjDQZ5CnWm4V+sPqnvGz9ahZeFabe
 n2s+1r5QLD64zsHld0AK8safrubs2YoS5jicfPq+Q7jvo5lR/Wmcu9YaFi0eIFvqsj
 c7xSjyXVGKO/uLVLTuidVuqRe3q46F1ZG+EldZbdT0LP+m7coVckT4E/SFXg9aXwXi
 T4EcJDonD5kIUR46WQGygIAMuXWVUa7shrKe9Bp0lNQD8s2bEqdhUNhZGmRa0BAhVD
 Jvu5ZTsv/yFOg==
Date: Wed, 11 Jan 2023 10:54:32 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Y78F6KrTNFi0xBa/@google.com>
References: <20230105233908.1030651-1-jaegeuk@kernel.org>
 <Y74O+5SklijYqMU1@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y74O+5SklijYqMU1@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_update_inode_page, f2fs_get_node_page handles EIO
 along with f2fs_handle_page_eio that stops checkpoint, if the disk couldn't
 be recovered. As a result, we don't need to stop checkpoint right [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFgFG-00EI7d-AT
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: retry to update the inode page
 given EIO
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs_update_inode_page, f2fs_get_node_page handles EIO along with
f2fs_handle_page_eio that stops checkpoint, if the disk couldn't be recovered.
As a result, we don't need to stop checkpoint right away given single EIO.

Cc: stable@vger.kernel.org
Signed-off-by: Randall Huang <huangrandall@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v2:
  - set EIO to cover the case of data corruption given by buggy UFS driver

 fs/f2fs/inode.c | 2 +-
 fs/f2fs/node.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ff6cf66ed46b..2ed7a621fdf1 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -719,7 +719,7 @@ void f2fs_update_inode_page(struct inode *inode)
 	if (IS_ERR(node_page)) {
 		int err = PTR_ERR(node_page);
 
-		if (err == -ENOMEM) {
+		if (err == -ENOMEM || (err == -EIO && !f2fs_cp_error(sbi))) {
 			cond_resched();
 			goto retry;
 		} else if (err != -ENOENT) {
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 558b318f7316..1629dc300c61 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1455,7 +1455,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 			  ofs_of_node(page), cpver_of_node(page),
 			  next_blkaddr_of_node(page));
 	set_sbi_flag(sbi, SBI_NEED_FSCK);
-	err = -EINVAL;
+	err = -EIO;
 out_err:
 	ClearPageUptodate(page);
 out_put_err:
-- 
2.39.0.314.g84b9a713c41-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
