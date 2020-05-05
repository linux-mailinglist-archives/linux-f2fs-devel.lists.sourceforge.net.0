Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB01C5B35
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 May 2020 17:32:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jVzY3-0008EL-Av; Tue, 05 May 2020 15:31:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jVzY2-0008E8-4Z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 15:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qRMqs1NWT0EJoNLiZi9tch/aJJEOCcUJnI2JM4phLRM=; b=fG1aRgzri/LEL9KWDijdkBU5du
 WD6fyVedxB72AtY0sts/wXXoNRUCrVLISGl+Zr38MIpxS1++ORu+fMKz0fE1vWajL3v2eLs8lUUaN
 fJLlcI0fuqblV2COCknjvAlthOqCNuYD7q+ppv8JYHfiPSCnW9QcSub1Hdzmpy2Z0pAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qRMqs1NWT0EJoNLiZi9tch/aJJEOCcUJnI2JM4phLRM=; b=d
 k/Sy+OA6yddXDdVsNLMNdQPnDOCDOYksWZ4vsRhEsNDmGO4FbodAhiXmF10gEDnF/uEk1EA9E3vwd
 poDoy5JIw18z3dbypYHzpVAav4sc+pAQofDyFTA+4YncKUUXmiF/1Z9q7XKaF6rQ9+HeNDhD5M/um
 VtVT6K0xj7ZmyYCM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jVzXy-00ESn4-Ny
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 15:31:54 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EDF92078C;
 Tue,  5 May 2020 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588692700;
 bh=10UQQl3GPfT8mcIMbnLtvCSvPWaMAUPM/kBH8ajFl40=;
 h=From:To:Cc:Subject:Date:From;
 b=HVY0pEgbAVyz6IqLvBZ+IAFiCCA7HoCpCBshkAB7xGhGO4uSDrUtwD2ZVCZ9I4C+C
 jbloa10/2h+K7Ygp7jK04JFUsG6e0EtkkH/eTnRXAMrtKnRkaoO6ETvjAO0Z9+36t5
 aVt+W3WZEw3RkFaT4DxJJAMSc7dYncstrhRsW7bA=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  5 May 2020 08:31:39 -0700
Message-Id: <20200505153139.201697-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jVzXy-00ESn4-Ny
Subject: [f2fs-dev] [PATCH] f2fs: get parent inode when recovering pino
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We had to grab the inode before retrieving i_ino.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a0a4413d6083b..9d4c3e3503567 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -168,6 +168,7 @@ static const struct vm_operations_struct f2fs_file_vm_ops = {
 static int get_parent_ino(struct inode *inode, nid_t *pino)
 {
 	struct dentry *dentry;
+	struct inode *parent;
 
 	inode = igrab(inode);
 	dentry = d_find_any_alias(inode);
@@ -175,8 +176,13 @@ static int get_parent_ino(struct inode *inode, nid_t *pino)
 	if (!dentry)
 		return 0;
 
-	*pino = parent_ino(dentry);
+	parent = igrab(d_inode(dentry->d_parent));
 	dput(dentry);
+	if (!parent)
+		return 0;
+
+	*pino = parent->i_ino;
+	iput(parent);
 	return 1;
 }
 
-- 
2.26.2.526.g744177e7f7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
