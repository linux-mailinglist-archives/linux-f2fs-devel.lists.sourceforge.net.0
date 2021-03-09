Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A59C331E49
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Mar 2021 06:22:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lJUp2-0006AP-Fz; Tue, 09 Mar 2021 05:22:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1lJUp0-0006AH-1f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 05:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RTKFSavdvX+38QHRqM5dfg4jAvgS5qybDmOO/JgCEGo=; b=dMhb46IVyQFsy9KV8cDHKDsjP1
 5yJ8hhzzz1Vw7aO8i/xphcMqFvmG7o7HJpbIH6WWo7FGD3DlO21DRrlqrxy88zNX/8lRLoqZAxhfa
 KCY6ytm99FzJaZtKgGJCFmztTMfzqNyvsBqqbjfErLSDeuC4vdIHSXYXylnD6ybC3CaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Date:Subject:
 Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RTKFSavdvX+38QHRqM5dfg4jAvgS5qybDmOO/JgCEGo=; b=WfUCgqUlEl1jwBO9u4HeMMQ9xE
 lV/SoleDSoOwyFLHT2pHfn3ec0y/q8E9iGs0ciRLIAwvZP7UAICzxHKplmA0s48CxAIDr8Ij+6oyC
 tEsuMKNe+sKx72suq2fwaiYM7d21Ysec8canomlwshrqa7E6tuFbHJzgGG89ROcyQbGg=;
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lJUol-0007IJ-OW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 05:22:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1615267307; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=lwWLK80+61ozbcefSPgCPo56xGbS/LoG+HcSUDE5RLlZd7Ft/3PEiuzu5pXfJqlyrmo2LmGOAamGPfaNms3j/gCJ7toGsPVL1shLkygVGOxeBDzSTcrTpywHTYr7WQjNbsyqaaC6unWnvjns/hiE1llRpSpMvc+6kqURSSDWT1k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1615267307;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=RTKFSavdvX+38QHRqM5dfg4jAvgS5qybDmOO/JgCEGo=; 
 b=dMcADg9dQaVaYZyL9uNvJVQlFKkD1tf8iyGYUVSEx9bLRtLeDozgFzLxIrvga7PCbTipxV+XOxxOhmePZbEngap5J9gUy2Yct0JNUlxyAT7eNm3oc0LGYU6FokHtuvFNjubSR7CQ4XF9v/dW8WdhA5QxFvyhrc1rvt9eQ5kE8YA=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615267307; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=RTKFSavdvX+38QHRqM5dfg4jAvgS5qybDmOO/JgCEGo=;
 b=DIelViDwkvgt567M3ZTZF5Km7DO8WTac6aLFSvairnIvb7jR+2UtAtgQqdRU0ZyU
 bqsb2lc6c+3/CbTLTcLxVR3+T3F9j7Jq9RnaGcE0MQ6rUG32q/GNq7jQ2N/dJtEZk6a
 JEVe7Ub9AifmKVQvx7xSWfbFcBWELfsh9hx0JRFs=
Received: from localhost.localdomain (159.75.42.226 [159.75.42.226]) by
 mx.zoho.com.cn with SMTPS id 1615267306815584.8187062568682;
 Tue, 9 Mar 2021 13:21:46 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: jaegeuk@kernel.org,
	chao@kernel.org
Message-ID: <20210309052118.594879-1-cgxu519@mykernel.net>
Date: Tue,  9 Mar 2021 13:21:18 +0800
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [163.53.93.243 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lJUol-0007IJ-OW
Subject: [f2fs-dev] (Resend) [PATCH v2] f2fs: fix to use per-inode maxbytes
 in f2fs_fiemap
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
Cc: Chengguang Xu <cgxu519@mykernel.net>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS inode may have different max size,
so change to use per-inode maxbytes.

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
Hi Jaegeuk, Chao

Please take this instead of previous v2 patch which has sent by mistake.

v1->v2:
- Calculate max bytes in inode lock.

 fs/f2fs/data.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7c95818639a6..b734ca023149 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1837,6 +1837,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	int ret = 0;
 	bool compr_cluster = false;
 	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
+	loff_t maxbytes;
 
 	if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
 		ret = f2fs_precache_extents(inode);
@@ -1850,6 +1851,15 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 	inode_lock(inode);
 
+	maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
+	if (start > maxbytes) {
+		ret = -EFBIG;
+		goto out;
+	}
+
+	if (len > maxbytes || (maxbytes - len) < start)
+		len = maxbytes - start;
+
 	if (fieinfo->fi_flags & FIEMAP_FLAG_XATTR) {
 		ret = f2fs_xattr_fiemap(inode, fieinfo);
 		goto out;
-- 
2.27.0




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
