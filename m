Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 228E7611D92
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 00:48:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooY8x-0004Th-Ry;
	Fri, 28 Oct 2022 22:48:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ooY8v-0004TT-Sk
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 22:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0yDmuGLRkQy6J7Eq5voxPkJGN2w/HvLKatZbP6I888o=; b=Fa5tpsjT6CWsUrDv9xGW05lpuS
 Qp+Q3ckkUeu+Rn2krsGdl0NyTniIpFoM6JJVncX6PGf7b3DRjt2W2Zv8SL503+wb4mKU+YkZyYPOx
 l/50pIA4NEGZjY/jSndowyHaG3GKwF9wqsYx7BUKS5iOh0cuhKdfMIRQOXwbuUUXkgD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0yDmuGLRkQy6J7Eq5voxPkJGN2w/HvLKatZbP6I888o=; b=fTrXIx4MBRKtETYpicFKPZq1FW
 z99qS+h/yxwwdjubkJiGNGi+Tgy14ibd+d3GVolzBf6UvWt1xxJidyBQvkKdi5qmqBNtB5/qpPgfR
 VM5r8WorevdYhKp996N6FiL0zktTBtrQogT7qdGw9D031xHV2quu6uV9LYrPsLpcq00I=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooY8s-0007GN-9W for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 22:48:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 03C00CE2EA2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Oct 2022 22:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9EEC43470;
 Fri, 28 Oct 2022 22:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666997266;
 bh=bqK81I/T6k3G4i3s/QXoplbiUG5b/2q9qN47fUeLeWQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iw9YE3wb75BUEOFeFHw5T2uj6gkdp+UdqpvS6EZgDy36esM9mRbr6PCr9iHEOp1yy
 EcNOS70sj+GbP1Coa89lWAZsPe7RubuqyUm37SNUfCiQtTCwaw1OTs493O4AxwlW2u
 7ANrvU1NFT3nO6/TiQDMlRZ4EtiZvNfLBI8rIT6y4ADKJRJycR3DKWLtD+Ongrpes3
 vBXcQMu8t5B/k5SHqyr3KxngyzSBzqhOk7Sb2qAh6CJf5ua1uVSxp8i8nE4Ea/UEuI
 XLWPs0uSmdY6a8BxGO5Iz6XFwo+5VkXnIUEhpwOIfy3TzZUvmM4cASyjOIPh+3navN
 UIT4TNd6qrKUw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 28 Oct 2022 15:45:36 -0700
Message-Id: <20221028224539.171818-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221028224539.171818-1-ebiggers@kernel.org>
References: <20221028224539.171818-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Now that the
 implementation
 of FS_IOC_ENABLE_VERITY has changed to not involve reading back Merkle tree
 blocks that were previously written, there is no need for ext4_readpage_limit()
 to allow for thi [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooY8s-0007GN-9W
Subject: [f2fs-dev] [PATCH 3/6] ext4: simplify ext4_readpage_limit()
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that the implementation of FS_IOC_ENABLE_VERITY has changed to not
involve reading back Merkle tree blocks that were previously written,
there is no need for ext4_readpage_limit() to allow for this case.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/readpage.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index e604ea4e102b7..babaa7160c556 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -211,8 +211,7 @@ static void ext4_set_bio_post_read_ctx(struct bio *bio,
 
 static inline loff_t ext4_readpage_limit(struct inode *inode)
 {
-	if (IS_ENABLED(CONFIG_FS_VERITY) &&
-	    (IS_VERITY(inode) || ext4_verity_in_progress(inode)))
+	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
 		return inode->i_sb->s_maxbytes;
 
 	return i_size_read(inode);
-- 
2.38.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
