Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 678CD3CCF5B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jul 2021 10:25:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5Oaw-0003q9-Vz; Mon, 19 Jul 2021 08:25:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m5Oav-0003pm-79
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 08:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gWpHbEx3k0TY/t9blwV+62JVrNIZFgFaDIQEYdvGtCw=; b=IQ2zqJPtI8Vo5f/vBZW74oNEL9
 C7Cc9m0tfqjP78RNK7OIDTYR6Tp1zvz+Oj80r7/niCc0O08LBevlwecnhnz83Hq1wkcYLo+5S0uCd
 T/1JFFIuCFLzkjHxHSTGFicpJtfxQb84YdIi0rhkNNRiCUCQdpGIins7kldKYz8Axpe8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gWpHbEx3k0TY/t9blwV+62JVrNIZFgFaDIQEYdvGtCw=; b=e
 Ne7+pYzhGtjvAK8jvfIBZmSKH6NdD/m1bQLsO9fbhveQWcmC39LWQn9dorqBBLrNDOuScO5mmOguP
 ERlhCmSoVJyVlx1bSrvj2RpJtPRgnPr33aFmVcnq0LnD46dPbQAMfaTuJi4JjE5MhzQGO1gCNpz4A
 i6nZVdjYVXgKWWWY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5Oap-00DNwS-SH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 08:25:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5BFC611CD;
 Mon, 19 Jul 2021 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626683132;
 bh=uph86ebcBQVwv9v5F9MQ8H//nKzarMFLSL6XNec3dHc=;
 h=From:To:Cc:Subject:Date:From;
 b=CWhO5XrgDKAVI/Mfs4i+PZTgWj0COIJ7KLXywdD2xm2INXNTxn3JpQp+F2fRebnBF
 pyXFZ9ZN20gnZ12gyo8Ge5m7PLprXTuyF1VBLN0o5zATztjODES3HdkqtdI9yrb9/5
 Fb4W6V9KuqEfDU/XlFPJzMSkDpXI4hum4saVqINUJ1GLdzwfMvuSaK6rzSFlubWMQu
 ztSydaTcVqiQ+jlOJjmAT9+AED8w1SnuMpwmcvNWa15QmRcU3/yyAFGAvRPpOlqu5f
 ys3m9/f3tI4bag3Gkv8y/9DYvwp2Ja41hWw3YoojU/7EA/z/PIv6NZ9LIEcdvuKY7J
 rGc0928sOKAAg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 19 Jul 2021 16:25:29 +0800
Message-Id: <20210719082529.17948-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5Oap-00DNwS-SH
Subject: [f2fs-dev] [PATCH] f2fs: fix wrong inflight page stats for directIO
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, we use sbi->nr_pages[] to account direct IO, the count should
be based on page granularity rather than bio granularity, fix it.

Fixes: 02b16d0a34a1 ("f2fs: add to account direct IO")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 10 ++++++----
 fs/f2fs/f2fs.h | 13 +++++++++++++
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e6f107de4c92..1198d6cb4811 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3494,8 +3494,9 @@ static void f2fs_dio_end_io(struct bio *bio)
 {
 	struct f2fs_private_dio *dio = bio->bi_private;
 
-	dec_page_count(F2FS_I_SB(dio->inode),
-			dio->write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
+	dec_page_counts(F2FS_I_SB(dio->inode),
+			dio->write ? F2FS_DIO_WRITE : F2FS_DIO_READ,
+			dio->blkcnt);
 
 	bio->bi_private = dio->orig_private;
 	bio->bi_end_io = dio->orig_end_io;
@@ -3519,13 +3520,14 @@ static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
 	dio->inode = inode;
 	dio->orig_end_io = bio->bi_end_io;
 	dio->orig_private = bio->bi_private;
+	dio->blkcnt = blkcnt;
 	dio->write = write;
 
 	bio->bi_end_io = f2fs_dio_end_io;
 	bio->bi_private = dio;
 
-	inc_page_count(F2FS_I_SB(inode),
-			write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
+	inc_page_counts(F2FS_I_SB(inode),
+			write ? F2FS_DIO_WRITE : F2FS_DIO_READ, dio->blkcnt);
 
 	submit_bio(bio);
 	return;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 867f2c5d9559..7369f8087f64 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1759,6 +1759,7 @@ struct f2fs_private_dio {
 	struct inode *inode;
 	void *orig_private;
 	bio_end_io_t *orig_end_io;
+	unsigned int blkcnt;
 	bool write;
 };
 
@@ -2267,6 +2268,12 @@ static inline void inc_page_count(struct f2fs_sb_info *sbi, int count_type)
 		set_sbi_flag(sbi, SBI_IS_DIRTY);
 }
 
+static inline void inc_page_counts(struct f2fs_sb_info *sbi, int count_type,
+							unsigned int count)
+{
+	atomic_add(count, &sbi->nr_pages[count_type]);
+}
+
 static inline void inode_inc_dirty_pages(struct inode *inode)
 {
 	atomic_inc(&F2FS_I(inode)->dirty_pages);
@@ -2281,6 +2288,12 @@ static inline void dec_page_count(struct f2fs_sb_info *sbi, int count_type)
 	atomic_dec(&sbi->nr_pages[count_type]);
 }
 
+static inline void dec_page_counts(struct f2fs_sb_info *sbi, int count_type,
+							unsigned int count)
+{
+	atomic_sub(count, &sbi->nr_pages[count_type]);
+}
+
 static inline void inode_dec_dirty_pages(struct inode *inode)
 {
 	if (!S_ISDIR(inode->i_mode) && !S_ISREG(inode->i_mode) &&
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
