Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0411176F1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 21:01:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iePEB-0004hv-66; Mon, 09 Dec 2019 20:01:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iePE8-0004hX-FH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 20:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4AoLVPH4NkdBu2XxO2BeuAIreOR3WaxfioDUSGaO4Cs=; b=bphwHkpwyBTmVeT4xWfOBVLeP5
 +SbbG5ORLikLU6fZ94BK7Ackjyp1bFhxZE2HWgu/YKQCO50dCAAtPNDlA2IZhgxAgsS2448cICkz6
 DcGnFPpOc35YSWfMT6fNdPx6B2lE7WYTHkYst94rPouzZShF78FoB8C/DOmlOCYxgukk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4AoLVPH4NkdBu2XxO2BeuAIreOR3WaxfioDUSGaO4Cs=; b=M
 kVK/eQCnYHvfRv29nOvY0BqVTZyh7jQKByzyosx2T6DoPaIyO+PPrlFiddH0JfHncuQOxHHe9pOc8
 7Lu5Ext2SfnU3MKlpT3RC9gJjprNBSfDWoNcUyhDYGnxOhotYSW1+jneiRZnEz4dM4Szcn1Nn/pcR
 f5rHL7x7iL82NOJo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iePE6-00GQJ5-JJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 20:01:52 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C210207FF;
 Mon,  9 Dec 2019 20:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575921703;
 bh=K1d911qmlv1lt+lM91/RWn4jQvLczI5FAJzlB1rg+t4=;
 h=From:To:Cc:Subject:Date:From;
 b=cg/H6mPUzr8Li5z+rJENvwBBYqtRHdnrkBtX+3f/107hzIHP/WxjS+SscCVweBB8S
 zsM9X8KuEx1Eqp8xq649mLGxFi8wuz5aKMKYsQM9DFsS9cVix1IcnGsF1Kl7eDp8SH
 a8TDcjX3+b6n2/3zo/asKApOonQJlkxjmjLToDs8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon,  9 Dec 2019 12:00:55 -0800
Message-Id: <20191209200055.204040-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
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
X-Headers-End: 1iePE6-00GQJ5-JJ
Subject: [f2fs-dev] [PATCH] f2fs: don't keep META_MAPPING pages used for
 moving verity file blocks
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
Cc: linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

META_MAPPING is used to move blocks for both encrypted and verity files.
So the META_MAPPING invalidation condition in do_checkpoint() should
consider verity too, not just encrypt.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/checkpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index ffdaba0c55d29..44e84ac5c9411 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1509,10 +1509,10 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	f2fs_wait_on_all_pages_writeback(sbi);
 
 	/*
-	 * invalidate intermediate page cache borrowed from meta inode
-	 * which are used for migration of encrypted inode's blocks.
+	 * invalidate intermediate page cache borrowed from meta inode which are
+	 * used for migration of encrypted or verity inode's blocks.
 	 */
-	if (f2fs_sb_has_encrypt(sbi))
+	if (f2fs_sb_has_encrypt(sbi) || f2fs_sb_has_verity(sbi))
 		invalidate_mapping_pages(META_MAPPING(sbi),
 				MAIN_BLKADDR(sbi), MAX_BLKADDR(sbi) - 1);
 
-- 
2.24.0.393.g34dc348eaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
