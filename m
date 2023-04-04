Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A066D6621
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:56:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji4y-00083J-LP;
	Tue, 04 Apr 2023 14:56:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji4w-00082x-RE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vAR4IqzKft1FulbfGVumK2HKMhiXaE7ZaLXEvaQK8Qc=; b=Cjlo5ZXVgIBuFF0VHvUQ1etkMS
 2SPib5brH3yZsSn22bZbHuTiS+HvIQjp1SYZPsDtHCDYAEPiCv/d61i5wjVLwYWO9UkiyhVHTyXyo
 0NhVL0y/cJIwGFAYQnvrEXLdw7ywJIeOYBQ4OwiutZ+bTTtNbibpL5f74UZoCuiIWxA0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vAR4IqzKft1FulbfGVumK2HKMhiXaE7ZaLXEvaQK8Qc=; b=hUlZCjbObdMdit4VsXpIRscgD1
 gX5Cfqa4jDOUOfrjGpks1b+KLxYXYi+tPJzLBAXd3AgAyd7RpEyyroEMM/b+ehEroVYPz0m59U6rU
 TLZsDiZ5rLQwap2ksJ8C/iaEUKrWSKZUZcSXCFeZX6T5x59EtsYzqbuToMubX5+pOvsU=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji4r-00028e-M1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vAR4IqzKft1FulbfGVumK2HKMhiXaE7ZaLXEvaQK8Qc=;
 b=Zi/e4dtQWR6jvoFmluzUMwj+B527FFFr8yyneS1fjzysJYF4R8xW+NLeRWXllbeWdH4G3v
 Kh//pf/PWLbGH+wY1ll3a4uS0MjEPseTgy2L66MoWE16E3geSEFT5A6w/BIdmoEJ33xao4
 xtPgMkQ6uhbB3iPRvbnzA93PLxP+KEQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-UIuUuQDWOOqdnxzg-H7JWQ-1; Tue, 04 Apr 2023 10:55:56 -0400
X-MC-Unique: UIuUuQDWOOqdnxzg-H7JWQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 p22-20020a05622a00d600b003e38f7f800bso22067779qtw.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vAR4IqzKft1FulbfGVumK2HKMhiXaE7ZaLXEvaQK8Qc=;
 b=fJMtOE95KI8Iwa6rtjy08mn9xvblhRxyfJ7Uacv6lOrnNr3ePLRnlW/XEYPgh9dWYa
 kQf9BsPrKY0FDzDOQlZi6AhB6KoIPMSavTTQBmwvvkq5GD4ND/TqMAK/i6F/ln79s7rq
 YlocZCFyHjazA3gkc3srS+LfP1804JGSCIqvc0qJDwWyEy0+B5pJpXRMuEnbkQhHpP9+
 Nq40RIdFd+kzYni+IC/o+isx9692GqkakiyOLl68FvIRDAPh9+I/3PKRx3ojZMms7vBE
 7Kw6P0bkiWUTBjciKJIvT7wB71+SLJbLMlJMUSOyBwHFfvrWqLQURujqAWRsQh+yLYQn
 LO9w==
X-Gm-Message-State: AAQBX9dxLLQy7tN9Xhf8RtRKyzXXpINXKk9ZqJW9Y5LJYTNgdHka1Xry
 r0H+AI6U+tsPiRiGTEsHSWYkiP0r5QO0OFV4Q9KSLse4u95hOI8ysyt2yfQk1/RdTRhaE0y5x5F
 /gYH0TzJCp+xqgSBS/I2sl2DuVj1JeYKCCSc0
X-Received: by 2002:a05:6214:da8:b0:5c5:471a:1e2f with SMTP id
 h8-20020a0562140da800b005c5471a1e2fmr3781901qvh.51.1680620152499; 
 Tue, 04 Apr 2023 07:55:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y+CJdy2zuw3OclTHQicHY+1y6liC+cgVxTA4alT47Sc9E4dbJpC4DNw4j3Dv/W+hf5PybB+w==
X-Received: by 2002:a05:6214:da8:b0:5c5:471a:1e2f with SMTP id
 h8-20020a0562140da800b005c5471a1e2fmr3781877qvh.51.1680620152126; 
 Tue, 04 Apr 2023 07:55:52 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:51 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:17 +0200
Message-Id: <20230404145319.2057051-22-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In case of different Merkle tree block size fs-verity expects
 ->read_merkle_tree_page() to return Merkle tree page filled with Merkle tree
 blocks. The XFS stores each merkle tree block under extended [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pji4r-00028e-M1
Subject: [f2fs-dev] [PATCH v2 21/23] xfs: handle merkle tree block size !=
 fs blocksize != PAGE_SIZE
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
Cc: linux-ext4@vger.kernel.org, agruenba@redhat.com,
 damien.lemoal@opensource.wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, rpeterso@redhat.com, xiang@kernel.org,
 jth@kernel.org, linux-erofs@lists.ozlabs.org,
 Andrey Albershteyn <aalbersh@redhat.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In case of different Merkle tree block size fs-verity expects
->read_merkle_tree_page() to return Merkle tree page filled with
Merkle tree blocks. The XFS stores each merkle tree block under
extended attribute. Those attributes are addressed by block offset
into Merkle tree.

This patch make ->read_merkle_tree_page() to fetch multiple merkle
tree blocks based on size ratio. Also the reference to each xfs_buf
is passed with page->private to ->drop_page().

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_verity.c | 74 +++++++++++++++++++++++++++++++++++----------
 fs/xfs/xfs_verity.h |  8 +++++
 2 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
index a9874ff4efcd..ef0aff216f06 100644
--- a/fs/xfs/xfs_verity.c
+++ b/fs/xfs/xfs_verity.c
@@ -134,6 +134,10 @@ xfs_read_merkle_tree_page(
 	struct page		*page = NULL;
 	__be64			name = cpu_to_be64(index << PAGE_SHIFT);
 	uint32_t		bs = 1 << log_blocksize;
+	int			blocks_per_page =
+		(1 << (PAGE_SHIFT - log_blocksize));
+	int			n = 0;
+	int			offset = 0;
 	struct xfs_da_args	args = {
 		.dp		= ip,
 		.attr_filter	= XFS_ATTR_VERITY,
@@ -143,26 +147,59 @@ xfs_read_merkle_tree_page(
 		.valuelen	= bs,
 	};
 	int			error = 0;
+	bool			is_checked = true;
+	struct xfs_verity_buf_list	*buf_list;
 
 	page = alloc_page(GFP_KERNEL);
 	if (!page)
 		return ERR_PTR(-ENOMEM);
 
-	error = xfs_attr_get(&args);
-	if (error) {
-		kmem_free(args.value);
-		xfs_buf_rele(args.bp);
+	buf_list = kzalloc(sizeof(struct xfs_verity_buf_list), GFP_KERNEL);
+	if (!buf_list) {
 		put_page(page);
-		return ERR_PTR(-EFAULT);
+		return ERR_PTR(-ENOMEM);
 	}
 
-	if (args.bp->b_flags & XBF_VERITY_CHECKED)
+	/*
+	 * Fill the page with Merkle tree blocks. The blcoks_per_page is higher
+	 * than 1 when fs block size != PAGE_SIZE or Merkle tree block size !=
+	 * PAGE SIZE
+	 */
+	for (n = 0; n < blocks_per_page; n++) {
+		offset = bs * n;
+		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
+		args.name = (const uint8_t *)&name;
+
+		error = xfs_attr_get(&args);
+		if (error) {
+			kmem_free(args.value);
+			/*
+			 * No more Merkle tree blocks (e.g. this was the last
+			 * block of the tree)
+			 */
+			if (error == -ENOATTR)
+				break;
+			xfs_buf_rele(args.bp);
+			put_page(page);
+			kmem_free(buf_list);
+			return ERR_PTR(-EFAULT);
+		}
+
+		buf_list->bufs[buf_list->buf_count++] = args.bp;
+
+		/* One of the buffers was dropped */
+		if (!(args.bp->b_flags & XBF_VERITY_CHECKED))
+			is_checked = false;
+
+		memcpy(page_address(page) + offset, args.value, args.valuelen);
+		kmem_free(args.value);
+		args.value = NULL;
+	}
+
+	if (is_checked)
 		SetPageChecked(page);
+	page->private = (unsigned long)buf_list;
 
-	page->private = (unsigned long)args.bp;
-	memcpy(page_address(page), args.value, args.valuelen);
-
-	kmem_free(args.value);
 	return page;
 }
 
@@ -191,16 +228,21 @@ xfs_write_merkle_tree_block(
 
 static void
 xfs_drop_page(
-	struct page	*page)
+	struct page			*page)
 {
-	struct xfs_buf *buf = (struct xfs_buf *)page->private;
+	int				i = 0;
+	struct xfs_verity_buf_list	*buf_list =
+		(struct xfs_verity_buf_list *)page->private;
 
-	ASSERT(buf != NULL);
+	ASSERT(buf_list != NULL);
 
-	if (PageChecked(page))
-		buf->b_flags |= XBF_VERITY_CHECKED;
+	for (i = 0; i < buf_list->buf_count; i++) {
+		if (PageChecked(page))
+			buf_list->bufs[i]->b_flags |= XBF_VERITY_CHECKED;
+		xfs_buf_rele(buf_list->bufs[i]);
+	}
 
-	xfs_buf_rele(buf);
+	kmem_free(buf_list);
 	put_page(page);
 }
 
diff --git a/fs/xfs/xfs_verity.h b/fs/xfs/xfs_verity.h
index ae5d87ca32a8..433b2f4ae3bc 100644
--- a/fs/xfs/xfs_verity.h
+++ b/fs/xfs/xfs_verity.h
@@ -16,4 +16,12 @@ extern const struct fsverity_operations xfs_verity_ops;
 #define xfs_verity_ops NULL
 #endif	/* CONFIG_FS_VERITY */
 
+/* Minimal Merkle tree block size is 1024 */
+#define XFS_VERITY_MAX_MBLOCKS_PER_PAGE (1 << (PAGE_SHIFT - 10))
+
+struct xfs_verity_buf_list {
+	unsigned int	buf_count;
+	struct xfs_buf	*bufs[XFS_VERITY_MAX_MBLOCKS_PER_PAGE];
+};
+
 #endif	/* __XFS_VERITY_H__ */
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
