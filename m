Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B323374D1A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 May 2021 03:52:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1leTC1-0004XT-Mi; Thu, 06 May 2021 01:52:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1leTC0-0004XE-8G
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 01:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7zGCbUyRgZ/PnBGOuYNaJqEKmadZqds3WXvb86My8nE=; b=JrUYY9Pn9hnStvupm/p4u/ea3R
 Gd4JVKgNK66aapHq1HpJ7L4zWPZeZsLimZBKYeKnfMPWS+V/hPtNUUtwH2KwW8FkOC86xHQymfDZp
 3UL/BfHM8a8JqeFZjXMYQlM30LitZVJ/p08mENUcqi/4wrPbhL2ds6SrAVTUc2CHlwvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7zGCbUyRgZ/PnBGOuYNaJqEKmadZqds3WXvb86My8nE=; b=A
 idS3W+nyQDP2/8IoTKoRfjxUQ2/M2emARmu4u+UKvom1TFb+nZOVomcSV7jzA/ouKBUsHHS2NPVXX
 TFvoSqwqqu2kZPRDrMroQRc39CM+S+dlyMDcPzEY5ZOX0f54ezIgyGhDG+OOH4qyk6sGbUX+3vJQ+
 fERDb2/7yUQei6ks=;
Received: from mail-m176235.qiye.163.com ([59.111.176.235])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1leTBs-0000D8-VG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 01:52:43 +0000
Received: from SZ-11126892.vivo.xyz (unknown [58.250.176.229])
 by mail-m176235.qiye.163.com (Hmail) with ESMTPA id 27AFF520082;
 Thu,  6 May 2021 09:52:28 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  6 May 2021 09:52:20 +0800
Message-Id: <20210506015220.1902-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.29.2.windows.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUtMTlZLSk1JTR8ZSU9DQ0hVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Okk6Tjo4HT8WDkMJPTI1GVYL
 Ai8KCTpVSlVKTUlLSU1OQk9DTkJCVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQUpNQ0I3Bg++
X-HM-Tid: 0a793f60547fd9adkuws27aff520082
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1leTBs-0000D8-VG
Subject: [f2fs-dev] [PATCH v3] f2fs: compress: avoid unnecessary check in
 f2fs_prepare_compress_overwrite
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

when write compressed file with O_TRUNC, there will be a lot of
unnecessary check valid blocks in f2fs_prepare_compress_overwrite,
especially when written in page size, remove it.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cf935474ffba..8ce26decf382 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3303,9 +3303,13 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
 		int ret;
+		pgoff_t end = (i_size_read(inode) + PAGE_SIZE - 1) >> PAGE_SHIFT;

 		*fsdata = NULL;

+		if (index >= end)
+			goto repeat;
+
 		ret = f2fs_prepare_compress_overwrite(inode, pagep,
 							index, fsdata);
 		if (ret < 0) {
--
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
