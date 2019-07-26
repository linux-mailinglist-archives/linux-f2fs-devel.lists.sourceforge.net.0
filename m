Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 047A27743D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jul 2019 00:46:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hr8yW-0005RT-Fe; Fri, 26 Jul 2019 22:46:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hr8yV-0005RC-2R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 22:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hx2pqvBe7XsYHCSJU8SEyYMNF3h2BpzCSkUizwFWlKc=; b=YsueGiyiPhxMYxFycI06NfnYyR
 WPLqvr9hI56y9c3VHvlKl9NGRIVc3Afa3oFdG33Cbdu1y3xR92nIDcK73p85CIa7M/rrb1/XZYhAQ
 NCgQ19p8TrqQk2KoQovknpqhjNIJLsS8+melLrAP4ZZIuc7Lwi/jA/hXrsZDGEuMQHkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hx2pqvBe7XsYHCSJU8SEyYMNF3h2BpzCSkUizwFWlKc=; b=nVMGOHooCFXuqAxC79NTbADstk
 5p8jq5UgVQAzvKAHlhlyXdtYeUyG4uxAdwVGdxI2GifvhNO2TICqI/svCiWnnJ3Yy93pG+yeP804/
 fes8EqZaMwSb5hR/0DnlAFjJpb3nCatuhd0YWHZg4+CwcQ/muWqxGDukNkS3HI0Fi30A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hr8yR-000WrY-F7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 22:46:07 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DD1822CBD;
 Fri, 26 Jul 2019 22:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564181157;
 bh=p4b6lbT/vXeFl+ohiAaEXRqD9wNsZb1Lt4uv7EKQyOw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MM4D5gPH69GqpF3b8koFKDX+wIjuAy9mAzlqBgU4GxwWONYReUxJpZMjDuHqN9sX7
 KFar2HJkjx/eselAi4+v1u3xS4T25z4juBkm2/lgPh1KAYsPHa2e7NsUlZ/Vn8w2X4
 962saN8QDBZExRtmNSRMceMrLT2+JyxT3Nc/B2ek=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 26 Jul 2019 15:41:29 -0700
Message-Id: <20190726224141.14044-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726224141.14044-1-ebiggers@kernel.org>
References: <20190726224141.14044-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hr8yR-000WrY-F7
Subject: [f2fs-dev] [PATCH v7 04/16] fscrypt: add ->ci_inode to fscrypt_info
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add an inode back-pointer to 'struct fscrypt_info', such that
inode->i_crypt_info->ci_inode == inode.

This will be useful for:

1. Evicting the inodes when a fscrypt key is removed, since we'll track
   the inodes using a given key by linking their fscrypt_infos together,
   rather than the inodes directly.  This avoids bloating 'struct inode'
   with a new list_head.

2. Simplifying the per-file key setup, since the inode pointer won't
   have to be passed around everywhere just in case something goes wrong
   and it's needed for fscrypt_warn().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h | 3 +++
 fs/crypto/keyinfo.c         | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index fae411b2f78dc..d345a7d28df8c 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -73,6 +73,9 @@ struct fscrypt_info {
 	 */
 	struct fscrypt_mode *ci_mode;
 
+	/* Back-pointer to the inode */
+	struct inode *ci_inode;
+
 	/*
 	 * If non-NULL, then this inode uses a master key directly rather than a
 	 * derived key, and ci_ctfm will equal ci_master_key->mk_ctfm.
diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
index 22345ddede119..2d45a86f09db2 100644
--- a/fs/crypto/keyinfo.c
+++ b/fs/crypto/keyinfo.c
@@ -556,6 +556,8 @@ int fscrypt_get_encryption_info(struct inode *inode)
 	if (!crypt_info)
 		return -ENOMEM;
 
+	crypt_info->ci_inode = inode;
+
 	crypt_info->ci_flags = ctx.flags;
 	crypt_info->ci_data_mode = ctx.contents_encryption_mode;
 	crypt_info->ci_filename_mode = ctx.filenames_encryption_mode;
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
