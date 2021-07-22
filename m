Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DE83D1C86
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 05:47:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6Pga-00017B-RK; Thu, 22 Jul 2021 03:47:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1m6PgZ-000173-E7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 03:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mcHrRpr+Vt2QOSE3uBXgCmxhqs1SP0a9rRM71Y9yqw8=; b=a6Rf/VLSA7gC1I5nvQ4v3xX4YT
 6G56ilfnUCXDq5V21y9PImGbIhZXIq3OrPGk2pH1AqPwzaNjEeHqjp5Ne0TAh518wtNsHIVoCW/Wk
 3RPfq7bgIPNExDNdP3ambzW2QWfEPmVkEpBUwhZoN7riMfulKv5ymXZLR/NWmh6vDUTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mcHrRpr+Vt2QOSE3uBXgCmxhqs1SP0a9rRM71Y9yqw8=; b=B
 YZeewwlCoF28zRu0pKMFcR8e73C3xDh0i7H5mMPvmNpDOcy+CsYvHHwkbESPugzaLfh5bMYEsnnAz
 mlsLQB4nI9m4+BoRbC6Vfp77ipmdP+iveCLw0JpGUoRdRzZ20hlgcCBDFsgqVsu/SevLNr66zmgy+
 3GY9bTUIf8gIHvg8=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6PgR-00GNu4-6P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 03:47:47 +0000
DKIM-Signature: a=rsa-sha256;
 b=ozgR6AhN8bKH83Vk8SoR2iOa1xNBa+9MFnst1nU9BhaIfgPtKx7bve5sbyzheZadOGxASrHtzJu8eHf/c2Rs5vDDmfP7YNCMAjBy+wDPyEfGDOSjGxOPUZazyMXCAib0KUHf8OWIJwdoXtkN573K6oQLEUaKbQuxtAXbmnMg3Kg=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=mcHrRpr+Vt2QOSE3uBXgCmxhqs1SP0a9rRM71Y9yqw8=;
 h=date:mime-version:subject:message-id:from;
Received: from comdg01144017.vivo.xyz (unknown [218.104.188.164])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id A3384AC02AB;
 Thu, 22 Jul 2021 11:47:31 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 22 Jul 2021 11:47:29 +0800
Message-Id: <20210722034729.231855-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUIYHx9WQx9MSk8dHhkZT0
 9PVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PC46Nio*LD8CGEsQF0xJIxUP
 TTgKCQtVSlVKTUlNQklOTU5JSklOVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUlKQ1VKS09VSkNDVUpNT1lXWQgBWUFIQ0NDNwY+
X-HM-Tid: 0a7acc535766b039kuuua3384ac02ab
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.144 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1m6PgR-00GNu4-6P
Subject: [f2fs-dev] [RFC PATCH] f2fs: compress: reduce one page array alloc
 and free when write compressed page
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

Don't alloc new page array to replace old, just use old page array, try
to reduce one page array alloc and free when write compress page.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c | 14 ++------------
 fs/f2fs/f2fs.h     |  1 +
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 455561826c7d..43daafe382e7 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -618,7 +618,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	const struct f2fs_compress_ops *cops =
 				f2fs_cops[fi->i_compress_algorithm];
 	unsigned int max_len, new_nr_cpages;
-	struct page **new_cpages;
 	u32 chksum = 0;
 	int i, ret;
 
@@ -633,6 +632,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 
 	max_len = COMPRESS_HEADER_SIZE + cc->clen;
 	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
+	cc->raw_nr_cpages = cc->nr_cpages;
 
 	cc->cpages = page_array_alloc(cc->inode, cc->nr_cpages);
 	if (!cc->cpages) {
@@ -683,13 +683,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 
 	new_nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE);
 
-	/* Now we're going to cut unnecessary tail pages */
-	new_cpages = page_array_alloc(cc->inode, new_nr_cpages);
-	if (!new_cpages) {
-		ret = -ENOMEM;
-		goto out_vunmap_cbuf;
-	}
-
 	/* zero out any unused part of the last page */
 	memset(&cc->cbuf->cdata[cc->clen], 0,
 			(new_nr_cpages * PAGE_SIZE) -
@@ -700,7 +693,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 
 	for (i = 0; i < cc->nr_cpages; i++) {
 		if (i < new_nr_cpages) {
-			new_cpages[i] = cc->cpages[i];
 			continue;
 		}
 		f2fs_compress_free_page(cc->cpages[i]);
@@ -710,8 +702,6 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	if (cops->destroy_compress_ctx)
 		cops->destroy_compress_ctx(cc);
 
-	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
-	cc->cpages = new_cpages;
 	cc->nr_cpages = new_nr_cpages;
 
 	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
@@ -1330,7 +1320,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	spin_unlock(&fi->i_size_lock);
 
 	f2fs_put_rpages(cc);
-	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+	page_array_free(cc->inode, cc->cpages, cc->raw_nr_cpages);
 	cc->cpages = NULL;
 	f2fs_destroy_compress_ctx(cc, false);
 	return 0;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 867f2c5d9559..8b1f84d88a65 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1454,6 +1454,7 @@ struct compress_ctx {
 	unsigned int nr_rpages;		/* total page number in rpages */
 	struct page **cpages;		/* pages store compressed data in cluster */
 	unsigned int nr_cpages;		/* total page number in cpages */
+	unsigned int raw_nr_cpages;	/* max total page number in cpages */
 	void *rbuf;			/* virtual mapped address on rpages */
 	struct compress_data *cbuf;	/* virtual mapped address on cpages */
 	size_t rlen;			/* valid data length in rbuf */
-- 
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
