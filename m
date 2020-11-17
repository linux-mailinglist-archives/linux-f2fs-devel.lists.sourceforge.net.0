Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC52B6870
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 16:16:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xz/klGmQdBDPYZUxFthFqf8XwLU0EZmaJZC+47H90LM=; b=k7ZAzOhgKTUIbRKGzrBLdyNTI
	eI7sLhLB+mS7snKpveq45e2myTy2Wb8ClWJcEo3GYd0YFuR1n/ZyDV62cb3z5NIe9+OKENBMaANRr
	RMCpzFGoWG6Nqo5niaWNrYe2SIfeQMoJvVt/32x5M1fIJXBOP1KgtQOKKBxpttGWTSdqY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf2id-0002xE-2a; Tue, 17 Nov 2020 15:16:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3HNmzXwYKAKETBUZBUHPPHMF.DPN@flex--satyat.bounces.google.com>)
 id 1kf2ia-0002wf-K9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 15:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R5CBswLlpIQJapBKDpTXO8RLcdpazdMLHFE+h8xz3Es=; b=Sg4edKjX9KJ4AeOZvxGff1rEn
 9ZW/8nPmbuTh1WUNNaO3ZRNgeBwVC9dGbbJ6HcrZc2JCycO1meWr9dduB9FxJN9QvtmAR1x3q5zn7
 dtUhkOeW+ljFso4MKTl+QLKoLdqHu4zBz2vYE+aVhGb32J0G+Ljn1j39PKKxJ2mXTqx+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R5CBswLlpIQJapBKDpTXO8RLcdpazdMLHFE+h8xz3Es=; b=Xb8F4T6NaFTB2txzh4JmO7+ms1
 fyFZ9VqO+CgMCNjzcu5kz58o+7qAWIHKGNPYpBj/0JcCkr6NFrz41K6YC5uCPDXZB5qZsOIPatPa/
 eLkvaKroMf36GLxREundxYVLkSsYrq8ypwmqap1EI/L0nLUiwMVDaFRgi7OY2WlNFT04=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kf2iN-00AZvy-HA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 15:16:27 +0000
Received: by mail-pl1-f201.google.com with SMTP id x3so9610368plr.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 07:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=R5CBswLlpIQJapBKDpTXO8RLcdpazdMLHFE+h8xz3Es=;
 b=A1VqI+LMloxuA0/HprdxN9YHfC55pEdsHf9BWLtT4qqvVhKEvzYgxNkj+PEH42zjXI
 OeoVgtNcR3CaOyVZPb0/+EZGu6RDYd31W6zu2oEy2+C+HnSD+jn7TyQ7D+HZa8IjozkG
 4hAqocgyLQCoHqVkyG8GyLQLIaRU2/fq6uT/ZkAsK9xFCvgEfNnS4Hongmf7BNJPyj8x
 UbUJ9UUgodrohuPK1/l/tCv4x6Xms0f/fdtBrte0iHuY0WAnhEc6rzUTBxXXLvNrFyIl
 IaO2TCGhJ4uq4s+QPe2kWWVsyJGVNENdgx1rzkljewjoPQlOzUEgn/9ZvFhUmL7E+Gll
 5Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=R5CBswLlpIQJapBKDpTXO8RLcdpazdMLHFE+h8xz3Es=;
 b=L82i/rJMtRyiRPYNJxfVntSULdIj2rZUwonSpsHSquGkONq4Ql+fNHsG6FofZmwO6t
 BLj+FpyZs58FltU7nm5CliVKzO6sbyU48FmLqin0EQTH0aGbQpia9zUjiD7G+PjncMcP
 F2o3+US11T9JhYx8i5kjObTeffstK/WQ2HLrQR1kY93FlQ0UkVgy3G0P3zZcHgh2fswZ
 0vRQUZePqI2iZsZZYMHzC9cz3wgHAO6edbJPElJRTZ9Bj6oOFO0XQsUkY2kWDkCvP4+y
 CoLWK7ArPYZVXqYDXe8TO8TZfQdPysUl3Obbun8tTQtPEbeCocjWgyAHk5fes+YVDSsX
 I+jA==
X-Gm-Message-State: AOAM532UxHPpT8wnO8jnF9SL1yE/m6Rmahmv+/UNvzS421LJji9lUgno
 C3PSkoeV6uDa9irvqcw/delsZsNXzKQ=
X-Google-Smtp-Source: ABdhPJyWmh3Iv+b4cPEzHM54qrtBxKCx9Mi+c3ZCqdPzBuuo/b+Pkvkr7t7Q1Y5hP7E1a6CpiFyWdFgF074=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a62:17c8:0:b029:18b:5a97:a8d1 with SMTP id
 191-20020a6217c80000b029018b5a97a8d1mr18265685pfx.15.1605622044271; Tue, 17
 Nov 2020 06:07:24 -0800 (PST)
Date: Tue, 17 Nov 2020 14:07:06 +0000
In-Reply-To: <20201117140708.1068688-1-satyat@google.com>
Message-Id: <20201117140708.1068688-7-satyat@google.com>
Mime-Version: 1.0
References: <20201117140708.1068688-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.201 listed in wl.mailspike.net]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kf2iN-00AZvy-HA
Subject: [f2fs-dev] [PATCH v7 6/8] ext4: support direct I/O with fscrypt
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
Cc: linux-block@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up ext4 with fscrypt direct I/O support. Direct I/O with fscrypt is
only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
have been enabled, the 'inlinecrypt' mount option must have been specified,
and either hardware inline encryption support must be present or
CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
direct I/O on encrypted files is only supported when the *length* of the
I/O is aligned to the filesystem block size (which is *not* necessarily the
same as the block device's block size).

fscrypt_limit_io_blocks() is called before setting up the iomap to ensure
that the blocks of each bio that iomap will submit will have contiguous
DUNs. Note that fscrypt_limit_io_blocks() is normally a no-op, as normally
the DUNs simply increment along with the logical blocks. But it's needed
to handle an edge case in one of the fscrypt IV generation methods.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/ext4/file.c  | 10 ++++++----
 fs/ext4/inode.c |  7 +++++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 3ed8c048fb12..be77b7732c8e 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -36,9 +36,11 @@
 #include "acl.h"
 #include "truncate.h"
 
-static bool ext4_dio_supported(struct inode *inode)
+static bool ext4_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
 {
-	if (IS_ENABLED(CONFIG_FS_ENCRYPTION) && IS_ENCRYPTED(inode))
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	if (!fscrypt_dio_supported(iocb, iter))
 		return false;
 	if (fsverity_active(inode))
 		return false;
@@ -61,7 +63,7 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		inode_lock_shared(inode);
 	}
 
-	if (!ext4_dio_supported(inode)) {
+	if (!ext4_dio_supported(iocb, to)) {
 		inode_unlock_shared(inode);
 		/*
 		 * Fallback to buffered I/O if the operation being performed on
@@ -495,7 +497,7 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	}
 
 	/* Fallback to buffered I/O if the inode does not support direct I/O. */
-	if (!ext4_dio_supported(inode)) {
+	if (!ext4_dio_supported(iocb, from)) {
 		if (ilock_shared)
 			inode_unlock_shared(inode);
 		else
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 0d8385aea898..0ef3d805bb8c 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3473,6 +3473,13 @@ static int ext4_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (ret < 0)
 		return ret;
 out:
+	/*
+	 * When inline encryption is enabled, sometimes I/O to an encrypted file
+	 * has to be broken up to guarantee DUN contiguity. Handle this by
+	 * limiting the length of the mapping returned.
+	 */
+	map.m_len = fscrypt_limit_io_blocks(inode, map.m_lblk, map.m_len);
+
 	ext4_set_iomap(inode, iomap, &map, offset, length);
 
 	return 0;
-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
