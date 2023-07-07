Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F774ADED
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jul 2023 11:41:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHhxU-0002nt-BJ;
	Fri, 07 Jul 2023 09:41:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+5a4ca43f00c3395d7048+7257+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qHhxS-0002nn-FR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jul 2023 09:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iNSFWWILdKuyxqqKG9xcEz6tN3PAD56T4ksQ+pt8tdU=; b=XPT4awgYqOI6uuQ63oW9p3qa/v
 OwR7fWFoWa4j3SmHAqNkO3MqI8YCUmN47aFQzamjiW4lQLE9ggCfCacNmz2AOE9HRsTfEVP7/iA4u
 dfjeZjk/vVG5YD70/cT9KZwu6I6bn9a5r43weCmpKi1F6nVz1/nTF1FLK7riHyH4e4hw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iNSFWWILdKuyxqqKG9xcEz6tN3PAD56T4ksQ+pt8tdU=; b=h
 fJfdg0rZrdg0GxoSPKPwLxYSFxoJ+P+ponE1EDXLwhWSAAQR0X6aFEg4fj60Bovx6bXDUER8nO3DC
 LT2P6O+pmatSBpqeN5D7me8U+y3xSYouTWFfF/CQ/g4Y1vKrszJh8KK5wvFmHimBSrplJ6sWslI7v
 3Ze+wkHl+buY/QOM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHhxO-0000vF-JL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jul 2023 09:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=iNSFWWILdKuyxqqKG9xcEz6tN3PAD56T4ksQ+pt8tdU=; b=aejeKuDT4AdHKinTJ8g3VOt7ts
 IenIcX2+cZwm6ConRentrZ26tzwHUSmG23uvJ1CYyeCg2plh1DM+SORz5nbZPReCU9RFXluC0Nkiq
 fzGpoE5QVRdjF+fid2YSbF/yAZV2zUDslh4KPb71vWM4gnuYFzqmzYPT21TxmSwUB7dmhopWByLco
 Y1gpvB42r84SB7Vfy308ghYi8jOI1Dvg2jBb4HC5BE+MZ+nH6IfZdcM3Qsbyjhzswj+HjZ+hQo4jy
 kQ+uLdOucjTGpzrMkJvPd/b3mHwOsCh++wUQ6MYQFF6jg5GcDitCqZJgVbyE3RK8l5zkDbuhLzogg
 f0hkCN4Q==;
Received: from [89.144.223.112] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qHhxB-0048wu-26; Fri, 07 Jul 2023 09:40:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri,  7 Jul 2023 11:40:28 +0200
Message-Id: <20230707094028.107898-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
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
 Content preview: f2fs_scan_devices reopens the main device since the very
 beginning, 
 which has always been useless, and also means that we don't pass the right
 holder for the reopen, which now leads to a warning as th [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qHhxO-0000vF-JL
Subject: [f2fs-dev] [PATCH] f2fs: don't reopen the main block device in
 f2fs_scan_devices
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
Cc: linux-block@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_scan_devices reopens the main device since the very beginning, which
has always been useless, and also means that we don't pass the right
holder for the reopen, which now leads to a warning as the core super.c
holder ops aren't passed in for the reopen.

Fixes: 3c62be17d4f5 ("f2fs: support multiple devices")
Fixes: 0718afd47f70 ("block: introduce holder ops")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/super.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ca31163da00a55..8d11d4a5ec331d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1560,7 +1560,8 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
 {
 	int i;
 
-	for (i = 0; i < sbi->s_ndevs; i++) {
+	kvfree(FDEV(0).blkz_seq);
+	for (i = 1; i < sbi->s_ndevs; i++) {
 		blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
 #ifdef CONFIG_BLK_DEV_ZONED
 		kvfree(FDEV(i).blkz_seq);
@@ -4190,16 +4191,12 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 	sbi->aligned_blksize = true;
 
 	for (i = 0; i < max_devices; i++) {
-
-		if (i > 0 && !RDEV(i).path[0])
+		if (i == 0)
+			FDEV(0).bdev = sbi->sb->s_bdev;
+		else if (!RDEV(i).path[0])
 			break;
 
-		if (max_devices == 1) {
-			/* Single zoned block device mount */
-			FDEV(0).bdev =
-				blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev, mode,
-						  sbi->sb->s_type, NULL);
-		} else {
+		if (max_devices > 1) {
 			/* Multi-device mount */
 			memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
 			FDEV(i).total_segments =
@@ -4215,10 +4212,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 				FDEV(i).end_blk = FDEV(i).start_blk +
 					(FDEV(i).total_segments <<
 					sbi->log_blocks_per_seg) - 1;
+				FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path,
+					mode, sbi->sb->s_type, NULL);
 			}
-			FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path, mode,
-							  sbi->sb->s_type,
-							  NULL);
 		}
 		if (IS_ERR(FDEV(i).bdev))
 			return PTR_ERR(FDEV(i).bdev);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
