Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3B03E27FE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 12:01:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBwfP-0002Hg-3M; Fri, 06 Aug 2021 10:01:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mBwfM-0002HV-H2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 10:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Df4lafsLtHkgzfKjFqVFzyS1QEekOTdPxhklew0dey8=; b=lUZQI7AsZNWhOmYOMaAqQQtCIC
 C9uNgnEcAYTHG0C2HC3V3Q90JDXpShrnflUJJVroznTz02ZpbbQva4J52NWg2iil10xBq7EfGlVEc
 m+uWwYSvuA7qn4toZ6nvW8ub4mk4Yi+kEzStRdxANlBlGhlgqU4bF775zGLjNaH6jKSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Df4lafsLtHkgzfKjFqVFzyS1QEekOTdPxhklew0dey8=; b=T
 Ov9bwemSj3pvK9NZ8frQZ7SNckQSZZTxdEUfg9NIx+bih8Ga1t+hfZE2/WwI/ttUg2uvw5VuFrDVs
 t6+uHDVntvfX4PBnN3WVjm2btnSOnq/fCY7/N+wT7KrgYTXnn8VJS8EXfUk8D3UBrlwCZ2HIc9cRB
 y2FIjM0zhab4tjMY=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBwfB-0007Hy-Lo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 10:01:24 +0000
Received: from comdg01144017.vivo.xyz (unknown [218.104.188.164])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id 4F94520267;
 Fri,  6 Aug 2021 18:01:06 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  6 Aug 2021 17:59:00 +0800
Message-Id: <20210806095900.212858-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kIDxoPDggYFB8eWUFWSldZCBgUCR5ZQVlLVUtZV1kWDxoPAgseWUFZKD
 YvK1lXWShZQUhPN1dZLVlBSVdZCQ4XHghZQVkyNS06NzI*QUtVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRA6Sgw4Oj9ILSsqSxwqGBMv
 ORAKCTVVSlVKTUlDSU9PS01NTkpNVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUlKQ1VKS09VSkNDVUpNT1lXWQgBWUFJQ0JMNwY+
X-HM-Tid: 0a7b1ae8c093d9fdkuws4f94520267
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mBwfB-0007Hy-Lo
Subject: [f2fs-dev] [PATCH v4] f2fs: compress: allow write compress released
 file after truncate to zero
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
Cc: Fengnan Chang <changfengnan@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For compressed file, after release compress blocks, don't allow write
direct, but we should allow write direct after truncate to zero.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 Documentation/filesystems/f2fs.rst | 7 +++++--
 fs/f2fs/file.c                     | 8 ++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 8f251a662542..d4de7ea4a83d 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -865,8 +865,11 @@ Compression implementation
   directly in order to guarantee potential data updates later to the space.
   Instead, the main goal is to reduce data writes to flash disk as much as
   possible, resulting in extending disk life time as well as relaxing IO
-  congestion. Alternatively, we've added ioctl interface to reclaim compressed
-  space and show it to user after putting the immutable bit.
+  congestion. Alternatively, we've added ioctl(F2FS_IOC_RELEASE_COMPRESS_BLOCKS)
+  interface to reclaim compressed space and show it to user after putting the
+  immutable bit. After call ioctl release compreesed space, don't allow write
+  file directly, unless call ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) to reserve
+  compreesed space or file truncated be zero.
 
 Compress metadata layout::
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7d8ee60f6c1f..d4fc5e0d2ffe 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -753,6 +753,14 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		return err;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
+	/*
+	 * For compressed file, after release compress blocks, don't allow write
+	 * direct, but we should allow write direct after truncate to zero.
+	 */
+	if (f2fs_compressed_file(inode) && !free_from
+			&& is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
+		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
+
 	if (from != free_from) {
 		err = f2fs_truncate_partial_cluster(inode, from, lock);
 		if (err)
-- 
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
