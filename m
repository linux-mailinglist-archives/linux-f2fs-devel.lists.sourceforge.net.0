Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 926C222CE09
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 20:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R761vhhU9gqptoxiGf9YQLpCvvswflgcqjpLQkPe/vs=; b=CqnOkpjB7Sp6FZP1hwbOmvPse
	h4vOmFAHoqfGXy3tbNnIaaYgA8wKa766XpwxsUjNtM0iut/hlDQYRVXYeZHgZALesipR8bSfLfrpj
	Wy88a6SK3D8V+TtGLbM24TFj0Unfg25deTIfndMOL2ntFaiSYX81YlavGpwqEcaKslrCU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz2h5-0007ja-6s; Fri, 24 Jul 2020 18:45:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3NywbXwYKAPoucv0cviqqing.eqo@flex--satyat.bounces.google.com>)
 id 1jz2h3-0007jN-SN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cZRHJd9vm6wSJv/XnptuJQLr+rxaeXJfolkFtRJQLFQ=; b=EVdCkAwGnXZwghrkboY8niqDq
 pOaAuvGDz33+IM/24MOJK0sKfZ/Pw7MShIx4onVL4LrwvQd3Jg1k/EmSfTIGZuDBDIIiIHTgf3YsC
 QHp2AXtUoOrDvUvuK+gUxVE3BeWZLN3tyTZZmrUnqEdUmFpa9z9hHzIlG0cAenJpx07d4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cZRHJd9vm6wSJv/XnptuJQLr+rxaeXJfolkFtRJQLFQ=; b=Qtx+CJvb/9aDiqqVeJRa9S34D/
 YRjVOHq4MgXyNQsOA4chwCONev7vH7kya9ORDSWnsaL4RopE0UrNJ/wqKPkT3L9rsv+QkNy5Ns4Pg
 09nNtx0cyuCKFwJeqy/DSQ+WSRJFhTz/w7oafep4MOVDcJHbF5fGGEMFjs/LaVZkUKAw=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jz2h2-00GEOL-PX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:17 +0000
Received: by mail-pg1-f202.google.com with SMTP id t6so6984185pgv.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 11:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=cZRHJd9vm6wSJv/XnptuJQLr+rxaeXJfolkFtRJQLFQ=;
 b=cLH6fzkpbrIyelFo1byJfRWbdqDhF3ZuMGCQS4DuqoFfUVEI6AqUb/cLmCcnxe2DB/
 NuclTLQUseIGENpT7nSaTyqpx9/aizcWbC3NKqN5eALGkn02PLzSafBJR0zP+YtgRdjx
 iiqFAGrcWbXnR1oSAceanlMou1uN1NcKZaHO7V6Fq14CfHQBbuPffCJrhM+PHcdgXacy
 ZTIPrXi3DslzIjo4fnTej7bdyl7kq0p1qIzcLMEMzdaXiKnZj5yIvjZYQny4aGeAndIA
 PQZfy+PrHHJBs5Hj0M8Ccv3m4ELMXmcv4DxI8RLO/We8K9PWuYUCvp83BPAYwnWrSsLM
 6aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cZRHJd9vm6wSJv/XnptuJQLr+rxaeXJfolkFtRJQLFQ=;
 b=fFQWTLp9FWHtXaaIinyCe2pBQ7AnP6XdCy8O0jZ3sWGCrYqVtiGhEHWex91fc7ICkV
 jbR2xcps/X5Lt33k7lD2tZsBcG/G33ymhAL2tY1jkKBPa1xG3CUrMVdhrPom/mtRc8YY
 Wp89bGXeEtqKmf/zIqIJfFQ0tAaaNOeGYlg5lLLvTVkUpYNCRi2SDAcotNUHNM1hBTcs
 T8nZ3AD3oRy1Ce12NHLP5/gwAKorouS55CWqO4EPA1qe3MvuAw6GrL2hmogfV1hGT0QM
 j8POT1MRzDEzCxz7CnvIblU9MxmQ//uEb3odTBG7nUweqUZNS9HvTIkmWVtPS8r6aFRF
 ncfQ==
X-Gm-Message-State: AOAM530KXG6ftUPiUT4ypf2R5VXgwyzf3SMIbFikoz0DLYr6urCzEUBd
 kvs5XLEyH1F4jgLt+rWfJOEb8nn11os=
X-Google-Smtp-Source: ABdhPJw8fcIvmjHR7H+eb8aZqwFTcCm45Bq/Yx+3nVsrxPL6bXnXqOMUT4Dox/jUn8rhKVdlkFqNAmoD0JI=
X-Received: by 2002:a62:1acc:: with SMTP id a195mr9957629pfa.32.1595616311087; 
 Fri, 24 Jul 2020 11:45:11 -0700 (PDT)
Date: Fri, 24 Jul 2020 18:44:57 +0000
In-Reply-To: <20200724184501.1651378-1-satyat@google.com>
Message-Id: <20200724184501.1651378-4-satyat@google.com>
Mime-Version: 1.0
References: <20200724184501.1651378-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz2h2-00GEOL-PX
Subject: [f2fs-dev] [PATCH v6 3/7] iomap: support direct I/O with fscrypt
 using blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-xfs@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Set bio crypt contexts on bios by calling into fscrypt when required.
No DUN contiguity checks are done - callers are expected to set up the
iomap correctly to ensure that each bio submitted by iomap will not have
blocks with incontiguous DUNs by calling fscrypt_limit_io_blocks()
appropriately.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/iomap/direct-io.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index ec7b78e6feca..a8785bffdc7c 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/compiler.h>
 #include <linux/fs.h>
+#include <linux/fscrypt.h>
 #include <linux/iomap.h>
 #include <linux/backing-dev.h>
 #include <linux/uio.h>
@@ -183,11 +184,14 @@ static void
 iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
 		unsigned len)
 {
+	struct inode *inode = file_inode(dio->iocb->ki_filp);
 	struct page *page = ZERO_PAGE(0);
 	int flags = REQ_SYNC | REQ_IDLE;
 	struct bio *bio;
 
 	bio = bio_alloc(GFP_KERNEL, 1);
+	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
+				  GFP_KERNEL);
 	bio_set_dev(bio, iomap->bdev);
 	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 	bio->bi_private = dio;
@@ -270,6 +274,8 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		}
 
 		bio = bio_alloc(GFP_KERNEL, nr_pages);
+		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
+					  GFP_KERNEL);
 		bio_set_dev(bio, iomap->bdev);
 		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 		bio->bi_write_hint = dio->iocb->ki_hint;
-- 
2.28.0.rc0.142.g3c755180ce-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
