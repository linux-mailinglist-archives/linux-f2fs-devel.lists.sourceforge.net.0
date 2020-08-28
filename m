Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D092553DB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Aug 2020 06:45:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kBVP2-00034P-7F; Fri, 28 Aug 2020 03:50:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kBVP0-00034I-GR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Aug 2020 03:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ril6mM8eHq++BAUOfHk3aWEeikdrpFxtZWvZ7zO9QRg=; b=dN1RG7nrTF3I8LNlcs9chpvvk6
 Q1LLHEU8Xw0aByNio/PSs17ijeSsm6z/V+yK/aFBMCl1RE7CGAWIu9VpOTTHBX79mhKRuPR6XHq+O
 Wnl+JSftnISCNMj+FOfrpAim+UvjGOM9yvas8qw2iXH650GxASo5Ks+EPnv8DWNZNhoY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ril6mM8eHq++BAUOfHk3aWEeikdrpFxtZWvZ7zO9QRg=; b=U
 1myOxyX08MyUdBgB2KtxVk/2Yf1j5ggNaou4ke5RKYZOu2UGmK1tH5OMq3tvQfrPDBfz6R7hrT2IX
 3mSa7lLeA9Z5+wZm+EMHpSfg39Czc8h836UwM6nf8iRLrfq6B24KZN+yF7wUiGKVGhc6nx4eWMEgE
 BWb+5ne4Rw01v0g8=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kBVOw-008Doj-9e
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Aug 2020 03:50:10 +0000
Received: by mail-pf1-f196.google.com with SMTP id t185so5113967pfd.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Aug 2020 20:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ril6mM8eHq++BAUOfHk3aWEeikdrpFxtZWvZ7zO9QRg=;
 b=PwLq5JbY5jLfQxWzR9cG/5+zL7h9uYDDkawWkmdLX5CcG2vSWFtp4TR2MxB4Mb4aVl
 xzqC+6pIWigkjb2mtxatGMiiWe+T9FIDqD6wjwZVgiIGARNUhOk/f0UW/pIwQWJupSnB
 ASScs20C3ryf30Rhyvdaq0THE96xQcvRU9qRGPOwz7wX5VjIhZtQJSVBPRqT05eOKHxS
 Eb5/ArjtyFpM7HCi7G7LQhBsZ4DLrwPW9/OAckiY1aW6mhK4POUzGl6V9K5oDBFyv//j
 XfqwUeQZxZ+PwX1wTn+BfIMIgrdwHOs1gYH1fJPXIJeyNQhuAQ8ZszkkRU/mdbp5phHy
 qyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ril6mM8eHq++BAUOfHk3aWEeikdrpFxtZWvZ7zO9QRg=;
 b=HHbhP6zgNij3O43wQkwbq4Gb3u5xcv9Tv/maFMNMtM2Dkx8080BxW0RjZfD4gxQ/SS
 BMEwFB+EnUWpjNHyy6UKvfUjpZ+dxSLLZbTbj1LNHTF7ZPcBuY1fhl670xJkxajdVyMi
 yzSLJjl+OMAAhG6dDvCr3f2+AKeto99EuIbofxbBYoatlZZVW0FmmxrjbGUQOKvThK8w
 f3HMDTHkLWfAmjI8Y3BHaKPqO1S//f39pv3hIyFGRWUH8fysvxeBn53cn5w/18Bzrg7P
 feczb7jVzOCm6n15rw4w7SvnTBTm7yB+eRjFdmZUNq5764MnE2kqzJOugaYpzYkLU2JI
 F+zA==
X-Gm-Message-State: AOAM530Fv3zihT/KQ81qV0WbkUD9S9Lcom2pUfL1bsSbTp15eu/Yf87t
 pclXzZS9L4/e0N1jJxK0rPo=
X-Google-Smtp-Source: ABdhPJykyulWdg7Brj9+hcRFRnuiRui2vd+PyMnAaNGqaM5ee1pPQhyFXHFwS5lhCvyjtsSY7+EX0Q==
X-Received: by 2002:a63:f09:: with SMTP id e9mr3706068pgl.334.1598586600598;
 Thu, 27 Aug 2020 20:50:00 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id il13sm3271523pjb.0.2020.08.27.20.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 20:49:59 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 28 Aug 2020 12:49:53 +0900
Message-Id: <20200828034953.354267-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kBVOw-008Doj-9e
Subject: [f2fs-dev] [PATCH] f2fs: make fibmap consistent with fiemap for
 compression chunk
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Currently fibmap returns zero address for compression chunk. But it
is not consistent with the output of fiemap, since fiemap returns
real pysical block address related to the compression chunk. Therefore
I suggest fibmap returns the same output with fiemap.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c1b676be67b9..8c26c5d0c778 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3708,36 +3708,6 @@ static int f2fs_set_data_page_dirty(struct page *page)
 	return 0;
 }
 
-
-static sector_t f2fs_bmap_compress(struct inode *inode, sector_t block)
-{
-#ifdef CONFIG_F2FS_FS_COMPRESSION
-	struct dnode_of_data dn;
-	sector_t start_idx, blknr = 0;
-	int ret;
-
-	start_idx = round_down(block, F2FS_I(inode)->i_cluster_size);
-
-	set_new_dnode(&dn, inode, NULL, NULL, 0);
-	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
-	if (ret)
-		return 0;
-
-	if (dn.data_blkaddr != COMPRESS_ADDR) {
-		dn.ofs_in_node += block - start_idx;
-		blknr = f2fs_data_blkaddr(&dn);
-		if (!__is_valid_data_blkaddr(blknr))
-			blknr = 0;
-	}
-
-	f2fs_put_dnode(&dn);
-	return blknr;
-#else
-	return 0;
-#endif
-}
-
-
 static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 {
 	struct inode *inode = mapping->host;
@@ -3753,9 +3723,6 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 	if (mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
 		filemap_write_and_wait(mapping);
 
-	if (f2fs_compressed_file(inode))
-		blknr = f2fs_bmap_compress(inode, block);
-
 	if (!get_data_block_bmap(inode, block, &tmp, 0))
 		blknr = tmp.b_blocknr;
 out:
-- 
2.28.0.402.g5ffc5be6b7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
