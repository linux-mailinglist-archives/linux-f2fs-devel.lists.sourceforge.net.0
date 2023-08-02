Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBF976D280
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDzK-0004DX-KO;
	Wed, 02 Aug 2023 15:42:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDzI-0004DE-To for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H3MTtQkLFkLtQvQuadZGreptlnpEa/QPHhaLm59CLeo=; b=SllETIZ2eOPlmdKwUnKHFnOEgl
 dCUUXZD8I//p6++SrBFbyFkQVN0AKCghcGZ6jSuFzFxo6oTWYoiH6G0GIBVkyqc3cQkeFFTruh9zl
 A+9fGQNqE3HT6xufiMDZodcKGlOaiLSi2I8c/e4ufx2LDjYVJCbsPnKnVdmEXjhbjis0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H3MTtQkLFkLtQvQuadZGreptlnpEa/QPHhaLm59CLeo=; b=U5S8XlAndMpyn0WzdMhFl0tu0v
 eDna6SeeHtUBGcNO6Ry5p+m/GGhhRL3/7xZUNvd5v2QVlzRuLEOTIa+9BfW8HOqG3s9EGzeEqE2/P
 OaEY7Ww3DSg1i3n9aC6XZyuFIbIAg0jrE0KS7Wa1vYINa3EHNS9ETHjeMikgWvE3zFys=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDzI-00ArOQ-C2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=H3MTtQkLFkLtQvQuadZGreptlnpEa/QPHhaLm59CLeo=; b=3JXg/prj0HfTjXvS5Acr1C9TH8
 tBCdwieLU44WmKkY3yg459RwXOD3Ksk/8LYtSODjqVxZt/pb+SwDXBOYev1CR9j0Gzt6WBv9+Yb9n
 0d6Gg7s326FEZsZfpcNZDOIYGoDpH0mESnTfRIiZI3w8I2NMPDqxnxJLbxNPkqle4gMEcQKYp1EgX
 7CEBSecV3ExtqrQHb8ny4H4fzi1LfiImJPIEpcVxedd+2YDNFXNgP5/iHFTm9wdAgHoWSi4D7/T4A
 qQP6+/T+EtbyBae5S1gS5DirSjkxKBoWa/sIWZn8/4j/f/cAkgIIVu/nkTbTc3SB4lzPFWqQHZ5An
 LLzbtv3w==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDz6-005GJQ-2m; Wed, 02 Aug 2023 15:42:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:26 +0200
Message-Id: <20230802154131.2221419-8-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802154131.2221419-1-hch@lst.de>
References: <20230802154131.2221419-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fs_mark_dead currently uses get_super to find the superblock
 for the block device that is going away. This means it is limited to the
 main device stored in sb->s_dev, leading to a lot of code duplicat [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRDzI-00ArOQ-C2
Subject: [f2fs-dev] [PATCH 07/12] fs: stop using get_super in fs_mark_dead
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

fs_mark_dead currently uses get_super to find the superblock for the
block device that is going away.  This means it is limited to the
main device stored in sb->s_dev, leading to a lot of code duplication
for file systems that can use multiple block devices.

Now that the holder for all block devices used by file systems is set
to the super_block, we can instead look at that holder and then check
if the file system is born and active, so do that instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/super.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index 09b65ee1a8b737..0cda4af0a7e16c 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1209,17 +1209,39 @@ int get_tree_keyed(struct fs_context *fc,
 EXPORT_SYMBOL(get_tree_keyed);
 
 #ifdef CONFIG_BLOCK
+/*
+ * Lock a super block that the callers holds a reference to.
+ *
+ * The caller needs to ensure that the super_block isn't being freed while
+ * calling this function, e.g. by holding a lock over the call to this function
+ * and the place that clears the pointer to the superblock used by this function
+ * before freeing the superblock.
+ */
+static bool lock_active_super(struct super_block *sb)
+{
+	down_read(&sb->s_umount);
+	if (!sb->s_root ||
+	    (sb->s_flags & (SB_ACTIVE | SB_BORN)) != (SB_ACTIVE | SB_BORN)) {
+		up_read(&sb->s_umount);
+		return false;
+	}
+	return true;
+}
+
 static void fs_mark_dead(struct block_device *bdev)
 {
-	struct super_block *sb;
+	struct super_block *sb = bdev->bd_holder;
 
-	sb = get_super(bdev);
-	if (!sb)
+	/* bd_holder_lock ensures that the sb isn't freed */
+	lockdep_assert_held(&bdev->bd_holder_lock);
+
+	if (!lock_active_super(sb))
 		return;
 
 	if (sb->s_op->shutdown)
 		sb->s_op->shutdown(sb);
-	drop_super(sb);
+
+	up_read(&sb->s_umount);
 }
 
 static const struct blk_holder_ops fs_holder_ops = {
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
