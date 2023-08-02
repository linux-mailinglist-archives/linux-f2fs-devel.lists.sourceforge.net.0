Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C03C676D267
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDz6-0005VC-Ik;
	Wed, 02 Aug 2023 15:42:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDz5-0005V6-Fx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yR3dj+eONAtbKM/zIO7ew4m4jCWdaatgpKXh7YubtNo=; b=CoNHc2n2bspU5KL6h7LIdujEXW
 ujTYqsFzyLhZuM94H3wp9ZJvFt/9Rflm3mWq2Ozbb2QPqq8aAYQOao7RSnqIRrT/jXQlnFw7OVYQk
 8VUi2IIKnOZbAiPn/0xLShi6gKOFK4ZzIJpPYdYYVMbujgl1kpTI05MTzKegIvfeG50U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yR3dj+eONAtbKM/zIO7ew4m4jCWdaatgpKXh7YubtNo=; b=ChUsL3VbipRir/iOzJ7dlpW0LX
 6p5wxBHWHGqln48yFIpdBqrABxE7OBIvlqb/XvRz9k92sw07u5uc+cP/NwKZgHt6Rw38p86m1DHvw
 lrs+ThUXBlU549SisieH2dQLMYVXCIt/ovj2QL+IPdmpR22ZU+nImXqrw/hhjX/RY9rM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDz1-00ArNK-4Z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yR3dj+eONAtbKM/zIO7ew4m4jCWdaatgpKXh7YubtNo=; b=mhaGQnhVJ1uO0sXkPgK8YqFZc5
 sx4T/ucx2OPuff6PNBCxPLw0lRV53g6hNyTwuVkRXmfF5ms72GkE+0x1uqrIpsNzHaHP6+Py4j6Tt
 9XFmrppR/JGamizKFARycs9Ei0Zd6NCt6jtO/emxLVKW+oJppL6xK9oZ0QyDSOt4KwCRRE5Fb3/qV
 nd1M5X+TDd19RtkW7i16PyY3kk/HSZISBliaimAqK2zb2qyMjYGvY5ilv8+9zMumwN7d615Bm9309
 WGSgzj/m+SQzHji61NEj7z0Pag2YVdzThx00Fv79SfAWHCvcSS285h67bPeQfgF/88NmzMiFiyxid
 AaZCwhZg==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDyk-005GE4-1b; Wed, 02 Aug 2023 15:41:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:20 +0200
Message-Id: <20230802154131.2221419-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802154131.2221419-1-hch@lst.de>
References: <20230802154131.2221419-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We'll want to use setup_bdev_super instead of duplicating
 it in nilfs2. Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/super.c
 | 3 ++- include/linux/fs_context.h | 2 ++ 2 files changed, 4 insertions(+),
 1 deletion(-) 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qRDz1-00ArNK-4Z
Subject: [f2fs-dev] [PATCH 01/12] fs: export setup_bdev_super
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We'll want to use setup_bdev_super instead of duplicating it in nilfs2.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/super.c                 | 3 ++-
 include/linux/fs_context.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/super.c b/fs/super.c
index 3ef39df5bec506..6aaa275fa8630d 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1243,7 +1243,7 @@ static int test_bdev_super_fc(struct super_block *s, struct fs_context *fc)
 		s->s_dev == *(dev_t *)fc->sget_key;
 }
 
-static int setup_bdev_super(struct super_block *sb, int sb_flags,
+int setup_bdev_super(struct super_block *sb, int sb_flags,
 		struct fs_context *fc)
 {
 	blk_mode_t mode = sb_open_mode(sb_flags);
@@ -1295,6 +1295,7 @@ static int setup_bdev_super(struct super_block *sb, int sb_flags,
 	sb_set_blocksize(sb, block_size(bdev));
 	return 0;
 }
+EXPORT_SYMBOL_GPL(setup_bdev_super);
 
 /**
  * get_tree_bdev - Get a superblock based on a single block device
diff --git a/include/linux/fs_context.h b/include/linux/fs_context.h
index ff6341e09925bc..58ef8433a94b8c 100644
--- a/include/linux/fs_context.h
+++ b/include/linux/fs_context.h
@@ -158,6 +158,8 @@ extern int get_tree_keyed(struct fs_context *fc,
 					   struct fs_context *fc),
 			 void *key);
 
+int setup_bdev_super(struct super_block *sb, int sb_flags,
+		struct fs_context *fc);
 extern int get_tree_bdev(struct fs_context *fc,
 			       int (*fill_super)(struct super_block *sb,
 						 struct fs_context *fc));
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
