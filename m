Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 249D476D281
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDzM-0000OD-SX;
	Wed, 02 Aug 2023 15:42:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDzL-0000O7-FR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZozxeyMGKtkHoR7QtYaUPrxcN8fxX1IcTx0bj1m0eVM=; b=FMNlTWsb79LlTomhJ4WQJNaaR0
 qzUuYinm8/JQxz5JrZZaK4tgMAxSQDGOWZ3V+XXkqmLsRRcMNOyEcw/6YkS5+1ce5K+f19PnphpNi
 OCiciVEZmPEa78jml5lw8mbxK/VrVWYv0hNyXnxhkaPQlhu9NI8e2c7/SEN2oMELmVRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZozxeyMGKtkHoR7QtYaUPrxcN8fxX1IcTx0bj1m0eVM=; b=P4okKdpgIGTw1QBdzthHZEtfT1
 gSv5XF5tYGXAUSnCosj/bSQoJIgCtUyQx1USwn2JA11Exn9KcFN6tBhaFMgiB7FoWHW4u8Jkatnbj
 kAHpL9S4mS/ICNQn/yuZWVs319Iw57/18xfajo9kS9o4touNGw2UdZvKjocbikwJCpL8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDzL-0004TT-Vc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ZozxeyMGKtkHoR7QtYaUPrxcN8fxX1IcTx0bj1m0eVM=; b=tmx+7o4GP5sBLM4xYrSsgh9Bda
 +QbMMfDpv1DNC4tqjwNcuPtyVRBYZ5oHVHlh96dQf4IlYjTn55/fw/emJuHrTvhSTgLn4CKM9zq4t
 yT98ZOv03AtsAwaRoj6DqU98ep41F8AzGg/vBGkfVEdAUr4avk2zKXcHV0RtlssyfziJvzMueYqIu
 KhQzE7/xrzzJxOSxfghcWbWDsTFToL/ymn6ov4rjA65Xpl2PHUsmr14itMLIKsS6o6PNsi4Ntd7Pn
 Had/kLEX3WJqsmYXpRsZO5n2YtV4JiZvaKZR7L9CDniwRiSZTphwqLxU2Uxztca27xF+6dVMKrhoR
 wAcOwFaA==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDzA-005GKj-0K; Wed, 02 Aug 2023 15:42:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:27 +0200
Message-Id: <20230802154131.2221419-9-hch@lst.de>
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
 Content preview: Export fs_holder_ops so that file systems that open
 additional
 block devices can use it as well. Signed-off-by: Christoph Hellwig
 <hch@lst.de>
 --- fs/super.c | 3 ++- include/linux/blkdev.h | 2 ++ 2 files changed,
 4 insertions(+), 1 deletion(-) 
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
X-Headers-End: 1qRDzL-0004TT-Vc
Subject: [f2fs-dev] [PATCH 08/12] fs: export fs_holder_ops
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

Export fs_holder_ops so that file systems that open additional block
devices can use it as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/super.c             | 3 ++-
 include/linux/blkdev.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/super.c b/fs/super.c
index 0cda4af0a7e16c..dac05f96ab9ac8 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1244,9 +1244,10 @@ static void fs_mark_dead(struct block_device *bdev)
 	up_read(&sb->s_umount);
 }
 
-static const struct blk_holder_ops fs_holder_ops = {
+const struct blk_holder_ops fs_holder_ops = {
 	.mark_dead		= fs_mark_dead,
 };
+EXPORT_SYMBOL_GPL(fs_holder_ops);
 
 static int set_bdev_super(struct super_block *s, void *data)
 {
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index ed44a997f629f5..83262702eea71a 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1464,6 +1464,8 @@ struct blk_holder_ops {
 	void (*mark_dead)(struct block_device *bdev);
 };
 
+extern const struct blk_holder_ops fs_holder_ops;
+
 /*
  * Return the correct open flags for blkdev_get_by_* for super block flags
  * as stored in sb->s_flags.
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
