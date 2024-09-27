Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1C0987F54
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Sep 2024 09:24:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1su5KU-0001Py-2x;
	Fri, 27 Sep 2024 07:23:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1su5KS-0001Pp-A0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Sep 2024 07:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bKvR6u7Z+4asRr044F0emGgCRq2BudWA4bDNeltmyac=; b=fjHKs8iOagoxfC/cP/nNITIv0B
 zsEA1XvYi28X6csV4WNhWHsm/Hyma1KO4XMqnrtBCvXascNk1k+SS/5QE1zk4puHP35yoj/gzcvGG
 4Lk0cEmKW62tQxDG3O7wrg9E3FKq44fiSk9032zGkvkTUEoZQ9KR16IgRhePQCeCubPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bKvR6u7Z+4asRr044F0emGgCRq2BudWA4bDNeltmyac=; b=W
 AT7cjxOouVFd12y3EytVmfv9nDl3YVrTxK2JzunPLRWxrlPhXBH7XEXTS2IuY2cIekbPV96iV87/F
 Xz9BwGoaYvURAbtUCfeVEJmkW4CfCPwQ3AGgKJer/gH3qwpdO8IWvUPzAAYPg73ekX9szBzl8pE/Q
 yguGdYpHVtNQvI2Y=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1su5KO-0004zh-TM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Sep 2024 07:23:51 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240927072341epoutp04fd94b201b7c4929602674147bde38816~5CP6pQQlS0305603056epoutp04J
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Sep 2024 07:23:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240927072341epoutp04fd94b201b7c4929602674147bde38816~5CP6pQQlS0305603056epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727421821;
 bh=bKvR6u7Z+4asRr044F0emGgCRq2BudWA4bDNeltmyac=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=ZNTpQ1Qtm8GiG8QPWC3p+M/+GRwyFIxkRenrLcK/Bynbmy1r3lVZUHOKnI9jb30RG
 32x0lwiYOFWvpWueBB+QFjk5/+EDBxqk/hLuXy2QFjaywzJjYJsftCQTjOq0z7uIcp
 CcHQUH6DT5lX+zTSL4ly08xiuTevfS7JKhGIzzJ0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20240927072340epcas2p46f7fde9a46e9e16745dc35ec128a3ee1~5CP5kd2pl0197001970epcas2p4G;
 Fri, 27 Sep 2024 07:23:40 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4XFMQN1R8rz4x9Q2; Fri, 27 Sep
 2024 07:23:40 +0000 (GMT)
X-AuditID: b6c32a46-4b7fa70000002752-ed-66f65d7b5b4e
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 AE.68.10066.B7D56F66; Fri, 27 Sep 2024 16:23:40 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240927072239epcms2p48e5ae61717652c25e1fe3c87ce53573c@epcms2p4>
Date: Fri, 27 Sep 2024 16:22:39 +0900
X-CMS-MailID: 20240927072239epcms2p48e5ae61717652c25e1fe3c87ce53573c
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphk+LIzCtJLcpLzFFi42LZdljTVLcm9luawf85TBanp55lsnh5SNNi
 1YNwix8nTSyerJ/FbHFpkbvF5V1z2CzOT3zNZDH1/BEmB06PTas62Tx2L/jM5NG3ZRWjx+dN
 cgEsUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUB3
 KCmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKzAv0ihNzi0vz0vXyUkusDA0MjEyB
 ChOyM3bfvcJWcMe54u2/VewNjJssuhg5OSQETCRuNBxg72Lk4hAS2MEocfD3DdYuRg4OXgFB
 ib87hEFqhAWsJE7PbWUBsYUElCTWX5zFDhHXk7j1cA0jiM0moCMx/cR9sLiIwCtGiTOrRUFs
 ZoFFjBJv11VA7OKVmNH+lAXClpbYvnwrI4StIfFjWS8zhC0qcXP1W3YY+/2x+VA1IhKt985C
 1QhKPPi5GyouKXF77iao+nyJ/1eWQ9k1EtsOzIOy9SWudWwE28sr4Ctxa80EMJtFQFXi7J9G
 JpB3JQRcJHa/LII4WV5i+9s5zCBhZgFNifW79CEqlCWO3GKBqOCT6Dj8lx3mqYaNv7Gyd8x7
 wgRhq0ms+7keapGMxK15jBMYlWYhQnkWkrWzENYuYGRexSiWWlCcm55abFRgBI/Y5PzcTYzg
 5KjltoNxytsPeocYmTgYDzFKcDArifBanfuaJsSbklhZlVqUH19UmpNafIjRFOjficxSosn5
 wPScVxJvaGJpYGJmZmhuZGpgriTOe691boqQQHpiSWp2ampBahFMHxMHp1QDU+6s5rl97x4E
 /w81yHruFMBa7fJz9hQuX+m9Fkr3BbeWuRYK3JFWvHm8he3mpgKZhG1pjP9a3r7kmGySeXmi
 fcnG3LdGchqCrHlpvyNPXJtu4bfy/3Erpnkl60pvOLMLnA/h+/bzRsC5VS+7Bc+ln3P3Pvah
 /bFb14W2jXNeG7gacc1h+bnyxdJMf922NUUz1yc1fk1olr2czvxeY46Q93QBzmMfpobwnHs6
 TcH2mou5w9dCicNczpNtk/h3S8jP3VQVI8/zuiTBOWC15A6ZP+0i2WoM3X7f3Lm0z12affbY
 tV8br6wUrWXZmXpnoen6rJ65gv9Mdx+zXqZ2MvYSmyP3vNwp7U597iEpi3rKlFiKMxINtZiL
 ihMB1SFMpRcEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240927072239epcms2p48e5ae61717652c25e1fe3c87ce53573c
References: <CGME20240927072239epcms2p48e5ae61717652c25e1fe3c87ce53573c@epcms2p4>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With zoned storage, F2FS avoids direct IO writes and uses
 buffered writes with page cache flushes to prevent unaligned writes. However, 
 the unaligned write can be avoided by allowing only a single thr [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1su5KO-0004zh-TM
Subject: [f2fs-dev] [PATCH] f2fs: support dio write for zoned storage
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
Reply-To: daejun7.park@samsung.com
Cc: Dongjin Kim <dongjin_.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

With zoned storage, F2FS avoids direct IO writes and uses buffered writes
with page cache flushes to prevent unaligned writes. However, the
unaligned write can be avoided by allowing only a single thread per zone
to perform direct writes.

To achieve direct writes in zoned storage, it uses semephores to serialize
block allocation and writes per zone.

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 fs/f2fs/data.c    | 28 ++++++++++++++++++++++++++-
 fs/f2fs/f2fs.h    |  7 +++++--
 fs/f2fs/file.c    | 48 ++++++++++++++++++++++++++++++++++++++++-------
 fs/f2fs/gc.c      |  4 ++--
 fs/f2fs/segment.c |  6 +++---
 fs/f2fs/super.c   |  5 ++++-
 6 files changed, 82 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b94cf6eea2f9..fa2bd88a2ed2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -922,7 +922,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
-static bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr)
+bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr)
 {
 	struct block_device *bdev = sbi->sb->s_bdev;
 	int devi = 0;
@@ -4207,6 +4207,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 			    struct iomap *srcmap)
 {
 	struct f2fs_map_blocks map = {};
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	pgoff_t next_pgofs = 0;
 	int err;
 
@@ -4218,6 +4219,18 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (flags & IOMAP_WRITE)
 		map.m_may_create = true;
 
+	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_is_pinned_file(inode)) {
+		struct f2fs_rwsem *io_order_lock =
+				&sbi->io_order_lock[map.m_seg_type];
+
+		f2fs_down_write(io_order_lock);
+
+		/* set io order lock */
+		iomap->private = io_order_lock;
+	} else {
+		iomap->private = NULL;
+	}
+
 	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);
 	if (err)
 		return err;
@@ -4273,6 +4286,19 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	return 0;
 }
 
+static int f2fs_iomap_end(struct inode *inode, loff_t pos, loff_t length,
+		ssize_t written, unsigned int flags, struct iomap *iomap)
+{
+	struct f2fs_rwsem *io_order_lock = iomap->private;
+
+	/* ordered write */
+	if (io_order_lock)
+		f2fs_up_write(io_order_lock);
+
+	return 0;
+}
+
 const struct iomap_ops f2fs_iomap_ops = {
 	.iomap_begin	= f2fs_iomap_begin,
+	.iomap_end	= f2fs_iomap_end,
 };
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 33f5449dc22d..06ed132f22ad 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1582,8 +1582,8 @@ struct f2fs_sb_info {
 
 	/* for bio operations */
 	struct f2fs_bio_info *write_io[NR_PAGE_TYPE];	/* for write bios */
-	/* keep migration IO order for LFS mode */
-	struct f2fs_rwsem io_order_lock;
+	/* keep IO order for LFS mode */
+	struct f2fs_rwsem io_order_lock[NR_CURSEG_DATA_TYPE];
 	pgoff_t page_eio_ofs[NR_PAGE_TYPE];	/* EIO page offset */
 	int page_eio_cnt[NR_PAGE_TYPE];		/* EIO count */
 
@@ -3863,6 +3863,9 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi);
 int f2fs_submit_page_bio(struct f2fs_io_info *fio);
 int f2fs_merge_page_bio(struct f2fs_io_info *fio);
+#ifdef CONFIG_BLK_DEV_ZONED
+bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr);
+#endif
 void f2fs_submit_page_write(struct f2fs_io_info *fio);
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
 		block_t blk_addr, sector_t *sector);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 99903eafa7fe..fde49f3e54cf 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -869,13 +869,7 @@ static bool f2fs_force_buffered_io(struct inode *inode, int rw)
 	/* disallow direct IO if any of devices has unaligned blksize */
 	if (f2fs_is_multi_device(sbi) && !sbi->aligned_blksize)
 		return true;
-	/*
-	 * for blkzoned device, fallback direct IO to buffered IO, so
-	 * all IOs can be serialized by log-structured write.
-	 */
-	if (f2fs_sb_has_blkzoned(sbi) && (rw == WRITE) &&
-	    !f2fs_is_pinned_file(inode))
-		return true;
+
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED))
 		return true;
 
@@ -4815,6 +4809,17 @@ static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
 	return 0;
 }
 
+#ifdef CONFIG_BLK_DEV_ZONED
+static void f2fs_dio_zone_write_end_io(struct bio *bio)
+{
+	struct f2fs_bio_info *io = (struct f2fs_bio_info *)bio->bi_private;
+
+	bio->bi_private = io->bi_private;
+	complete(&io->zone_wait);
+	iomap_dio_bio_end_io(bio);
+}
+#endif
+
 static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
 					struct bio *bio, loff_t file_offset)
 {
@@ -4824,6 +4829,31 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
 	enum temp_type temp = f2fs_get_segment_temp(seg_type);
 
 	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
+
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_is_pinned_file(inode)) {
+		struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
+		block_t last_blkaddr = SECTOR_TO_BLOCK(bio_end_sector(bio) - 1);
+
+		f2fs_down_write(&io->io_rwsem);
+		if (io->zone_pending_bio) {
+			wait_for_completion_io(&io->zone_wait);
+			bio_put(io->zone_pending_bio);
+			io->zone_pending_bio = NULL;
+			io->bi_private = NULL;
+		}
+
+		if (is_end_zone_blkaddr(sbi, last_blkaddr)) {
+			bio_get(bio);
+			reinit_completion(&io->zone_wait);
+			io->bi_private = bio->bi_private;
+			bio->bi_private = io;
+			bio->bi_end_io = f2fs_dio_zone_write_end_io;
+			io->zone_pending_bio = bio;
+		}
+		f2fs_up_write(&io->io_rwsem);
+	}
+#endif
 	submit_bio(bio);
 }
 
@@ -4897,6 +4927,10 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 	dio_flags = 0;
 	if (pos + count > inode->i_size)
 		dio_flags |= IOMAP_DIO_FORCE_WAIT;
+
+	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_is_pinned_file(inode))
+		dio_flags |= IOMAP_DIO_FORCE_WAIT;
+
 	dio = __iomap_dio_rw(iocb, from, &f2fs_iomap_ops,
 			     &f2fs_iomap_dio_write_ops, dio_flags, NULL, 0);
 	if (IS_ERR_OR_NULL(dio)) {
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 9322a7200e31..49270713f739 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1361,7 +1361,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
 
 	if (lfs_mode)
-		f2fs_down_write(&fio.sbi->io_order_lock);
+		f2fs_down_write(&fio.sbi->io_order_lock[CURSEG_COLD_DATA]);
 
 	mpage = f2fs_grab_cache_page(META_MAPPING(fio.sbi),
 					fio.old_blkaddr, false);
@@ -1444,7 +1444,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 							true, true, true);
 up_out:
 	if (lfs_mode)
-		f2fs_up_write(&fio.sbi->io_order_lock);
+		f2fs_up_write(&fio.sbi->io_order_lock[CURSEG_COLD_DATA]);
 put_out:
 	f2fs_put_dnode(&dn);
 out:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1766254279d2..d602ae4d79e3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3796,10 +3796,10 @@ void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
 static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 {
 	int type = __get_segment_type(fio);
-	bool keep_order = (f2fs_lfs_mode(fio->sbi) && type == CURSEG_COLD_DATA);
+	bool keep_order = (f2fs_lfs_mode(fio->sbi) && type <= CURSEG_COLD_DATA);
 
 	if (keep_order)
-		f2fs_down_read(&fio->sbi->io_order_lock);
+		f2fs_down_read(&fio->sbi->io_order_lock[type]);
 
 	if (f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
 			&fio->new_blkaddr, sum, type, fio)) {
@@ -3819,7 +3819,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 	f2fs_update_device_state(fio->sbi, fio->ino, fio->new_blkaddr, 1);
 out:
 	if (keep_order)
-		f2fs_up_read(&fio->sbi->io_order_lock);
+		f2fs_up_read(&fio->sbi->io_order_lock[type]);
 }
 
 void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct folio *folio,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fc2c586c7619..5289b6f5f6f3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3833,7 +3833,10 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 
 	INIT_LIST_HEAD(&sbi->s_list);
 	mutex_init(&sbi->umount_mutex);
-	init_f2fs_rwsem(&sbi->io_order_lock);
+
+	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++)
+		init_f2fs_rwsem(&sbi->io_order_lock[i]);
+
 	spin_lock_init(&sbi->cp_lock);
 
 	sbi->dirty_device = 0;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
