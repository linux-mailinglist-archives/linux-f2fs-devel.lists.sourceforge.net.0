Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C080B9FF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 10:21:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCFzx-0000yi-5Y;
	Sun, 10 Dec 2023 09:21:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCFzu-0000y6-Er
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jmku8OQGml8XxT+tBSJu9T75Z7r/nNy38k/mPLNjm3s=; b=cUfRjhMYc/W7AL7C0rUJdHG57m
 QVGTLyyXh4QiluHybBFOfIMsanhxCnMX5nX/6XndACRnVjBDJcNPtQ3QZW/kBqjZrSnnEGu5s3+oU
 2HgtObSDeXC55l7z7ts/z1+iEg3w8IGEOz9uPomdNCB/IIMzYYguCGqu/STwS6tKIy2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jmku8OQGml8XxT+tBSJu9T75Z7r/nNy38k/mPLNjm3s=; b=WudLMyIFfZ1MuOs/WNEEZeLytw
 Z6LdiJKzzWI/94EB7r77b10SXMlXN2a9mF6nfd6GvckKTCy+wUFwJrzGyrdqidaqcNTceVQn3DUjN
 Tb628x23nuQM50moXAuFofTScogTLbU9H44j7XByE/DiXQ+q2y3TxqcWzN8FA+mr6aN0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCFzq-0002n3-AU for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6BA2ECE0A12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Dec 2023 09:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69CB0C433C9;
 Sun, 10 Dec 2023 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702200049;
 bh=Z5UrpLIEuOaFiej2joNW+DOpVniO1sI531uE7zOL/8k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CvBHy2USow/jsELgaKUJfqOV9RnzoNq9L7JUkfCCjW4NbRh6YzdcIEr91mN1zNBFr
 9VYuwI7CohXwW9MyT4dP3Sf8ANIsirR3nmOLJEpC/rpqwYO7E+GAuvVES49fjlAOfV
 ys2xzSlRcASMZbvq9Mn1spkcZsWs5jthdAxx1OCXNpyMQ0BbA85fthw4RQJq1P4pzR
 76XxYavdynzuwmpsxtC3muNYV9d6/eU5OGJqTP2oVSGftvJjqSDCRjG1LtXSw/AExw
 fYacjwgkbWEoFlZ4bAdOWZszNcogx0YZjJ1wH2fT/IYHIRmZC7kblAAnU+Ufvij8Ab
 miCotaaZ8WF3w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 10 Dec 2023 17:20:36 +0800
Message-Id: <20231210092040.3374741-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231210092040.3374741-1-chao@kernel.org>
References: <20231210092040.3374741-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: FI_DROP_CACHE was introduced in commit 1e84371ffeef ("f2fs:
 change atomic and volatile write policies") for volatile write feature, after
 commit 7bc155fec5b3 ("f2fs: kill volatile write support"), we [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rCFzq-0002n3-AU
Subject: [f2fs-dev] [PATCH 2/6] f2fs: delete obsolete FI_DROP_CACHE
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

FI_DROP_CACHE was introduced in commit 1e84371ffeef ("f2fs: change
atomic and volatile write policies") for volatile write feature,
after commit 7bc155fec5b3 ("f2fs: kill volatile write support"),
we won't support volatile write, let's delete related codes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 3 ---
 fs/f2fs/f2fs.h | 6 ------
 2 files changed, 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 73d0726ac366..7a81ff3c385a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2892,9 +2892,6 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 
 	zero_user_segment(page, offset, PAGE_SIZE);
 write:
-	if (f2fs_is_drop_cache(inode))
-		goto out;
-
 	/* Dentry/quota blocks are controlled by checkpoint */
 	if (S_ISDIR(inode->i_mode) || quota_inode) {
 		/*
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index be9a8e50ac50..2f1d76088953 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -781,7 +781,6 @@ enum {
 	FI_UPDATE_WRITE,	/* inode has in-place-update data */
 	FI_NEED_IPU,		/* used for ipu per file */
 	FI_ATOMIC_FILE,		/* indicate atomic file */
-	FI_DROP_CACHE,		/* drop dirty page cache */
 	FI_DATA_EXIST,		/* indicate data exists */
 	FI_INLINE_DOTS,		/* indicate inline dot dentries */
 	FI_SKIP_WRITES,		/* should skip data page writeback */
@@ -3278,11 +3277,6 @@ static inline bool f2fs_is_cow_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_COW_FILE);
 }
 
-static inline bool f2fs_is_drop_cache(struct inode *inode)
-{
-	return is_inode_flag_set(inode, FI_DROP_CACHE);
-}
-
 static inline void *inline_data_addr(struct inode *inode, struct page *page)
 {
 	struct f2fs_inode *ri = F2FS_INODE(page);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
