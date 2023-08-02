Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9D076D26A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDzE-0002JS-F4;
	Wed, 02 Aug 2023 15:42:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDzC-0002JI-Qg for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RYN7DH9joo3rTfq03kLfw85iskRMJeYrOUPHdC0m2mc=; b=I2UDJBQxuQ37DJCnnqCrF8ywni
 KfCWavOkOwJGDniEVtAFG0+Y+kpEUXbAWMwbDtaNcC7UoVghcbjvEsHXu3VKMJIpFSc0zP38FzBYB
 mhEJlfNYkXWtkp3ZskAywx/XTsHeptmYmTEgzuJC7Mz+rtnUkQdeYpE7JlefDX2siTP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RYN7DH9joo3rTfq03kLfw85iskRMJeYrOUPHdC0m2mc=; b=Urq7qZJmSC5n3OD9kA8CLs4TEI
 +I4uerXP2IFYQWUUYurrjqksOU1WYrG7eKSkBAtO73hiXZx0bg/wr3BhCEJ7LWI7svmtsekgJTrAj
 8ZBAlmd8WGwmY82a0ZXEu5y2oZnmV1xiGmrAfH/w8R9JKufvUdJlv3l0r5s0s18urUQk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDz8-0004Se-2k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RYN7DH9joo3rTfq03kLfw85iskRMJeYrOUPHdC0m2mc=; b=VueuQORBH0Zx8oecpphGDd2a+f
 C5wXJWADk0ImZU6N80BupX/ZLTEluwHdf0bUw2wgbIVHzC4QM/bCJjgsnQEUhtU031a1gtB+mS3iG
 DTTgblzl2urUf4SSKGYW0eqzGYAHnbkFQK9ShplN/L36EJF1csgfmjTtDPks6m8MLcM2NSfBkK0yk
 YInd8oNc8nohhh1lAb9WMtyUjnN0afRF7aLxK2HUoGXeYbQoyvZu3JkZfcleLpxakg5nfDO3SoERw
 qQn+nJoxuqkTDCbHCSGJS69vnqYxfYRvoOWnioqmewoq+36B/XNMiyvu+GiTGedFDHOvVA6F1eKOM
 g49DmvlA==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDyw-005GFw-0I; Wed, 02 Aug 2023 15:41:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:24 +0200
Message-Id: <20230802154131.2221419-6-hch@lst.de>
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
 Content preview: Check for sb->s_type which is the right place to look at the
 file system type, not the holder, which is just an implementation detail
 in the VFS helpers. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/ext4/super.c
 | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-) 
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
X-Headers-End: 1qRDz8-0004Se-2k
Subject: [f2fs-dev] [PATCH 05/12] ext4: make the IS_EXT2_SB/IS_EXT3_SB
 checks more robust
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

Check for sb->s_type which is the right place to look at the file system
type, not the holder, which is just an implementation detail in the VFS
helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index c94ebf704616e5..193d665813b611 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -140,7 +140,7 @@ static struct file_system_type ext2_fs_type = {
 };
 MODULE_ALIAS_FS("ext2");
 MODULE_ALIAS("ext2");
-#define IS_EXT2_SB(sb) ((sb)->s_bdev->bd_holder == &ext2_fs_type)
+#define IS_EXT2_SB(sb) ((sb)->s_type == &ext2_fs_type)
 #else
 #define IS_EXT2_SB(sb) (0)
 #endif
@@ -156,7 +156,7 @@ static struct file_system_type ext3_fs_type = {
 };
 MODULE_ALIAS_FS("ext3");
 MODULE_ALIAS("ext3");
-#define IS_EXT3_SB(sb) ((sb)->s_bdev->bd_holder == &ext3_fs_type)
+#define IS_EXT3_SB(sb) ((sb)->s_type == &ext3_fs_type)
 
 
 static inline void __ext4_read_bh(struct buffer_head *bh, blk_opf_t op_flags,
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
