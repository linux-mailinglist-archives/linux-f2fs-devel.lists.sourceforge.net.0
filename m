Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B8C8CEBA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 10:44:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxotr-0000UX-61; Wed, 14 Aug 2019 08:44:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hxoto-0000Tj-OO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 08:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/lKh9WqKrjaVcBPQUVPr2WspG4qK9EtPHTL36rwqRh0=; b=TL1/fIwqz0JtOQkjPKMOkKXMjm
 nlEp8b0d6hFnhjos3DvCzloMkZLmseqTPuns8CaYlrZvz6s0yFSF1L8mEb/sCXJ1V4FywmSSrqzCx
 cxJw5L7cEiM+In4eB1PdOU0cEp4OU8UGCMw72ILb5i5c/Yg4rvtZ6wz+6Ki8XQc3djAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/lKh9WqKrjaVcBPQUVPr2WspG4qK9EtPHTL36rwqRh0=; b=h
 2A5Qn0CvhjhGn+91d1Vo2SydAIhj7hd9U1qviXuz/S3NKCXMm7tpTZce130ueYNHz1AEnzCwQO4xU
 tAS3waarVsRxgcviUim0RQ86v+0/WFdGbvXTSXPa65abEUh2QkAoQ+OaSn9cBadb7U8J3psoPVMPs
 LNHa7Lo/SVUXIWw4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxotm-003htP-VH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 08:44:52 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0546BE46BB395198017F;
 Wed, 14 Aug 2019 16:44:44 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 16:44:35 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 14 Aug 2019 16:44:26 +0800
Message-ID: <20190814084426.68522-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hxotm-003htP-VH
Subject: [f2fs-dev] [PATCH v2 1/4] fsck.f2fs: fix to recover out-of-border
 inline size
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It tries to let fsck be noticed wrong inline size, and do the fix.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- skip normal case if i_size equals to zero.
 fsck/fsck.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index d53317c..baeca88 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -771,6 +771,8 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	ofs = get_extra_isize(node_blk);
 
 	if ((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
+		unsigned int inline_size = MAX_INLINE_DATA(node_blk);
+
 		if (le32_to_cpu(node_blk->i.i_addr[ofs]) != 0) {
 			/* should fix this bug all the time */
 			FIX_MSG("inline_data has wrong 0'th block = %x",
@@ -779,6 +781,12 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 			node_blk->i.i_blocks = cpu_to_le64(*blk_cnt);
 			need_fix = 1;
 		}
+		if (i_size > inline_size) {
+			node_blk->i.i_size = cpu_to_le64(inline_size);
+			FIX_MSG("inline_data has wrong i_size %lu",
+						(unsigned long)i_size);
+			need_fix = 1;
+		}
 		if (!(node_blk->i.i_inline & F2FS_DATA_EXIST)) {
 			char buf[MAX_INLINE_DATA(node_blk)];
 			memset(buf, 0, MAX_INLINE_DATA(node_blk));
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
