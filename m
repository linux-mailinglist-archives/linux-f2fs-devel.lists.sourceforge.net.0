Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC7A257131
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 02:24:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCXcV-0006uL-7z; Mon, 31 Aug 2020 00:24:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kCXcT-0006u7-GH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 00:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZnfXYUbCB2BbWKqT6zdvNTUKiLkNrjoRnmWZrCX/fz8=; b=UEC1t/L4TvELd/WHFv7eaYRXtJ
 AzdDK3tipLg8iSoTG4n8msHlHitH9BlEQtR9f/OlGWNAo1m77cI+xbMq+zgPN4r56xKjev2SPEuU2
 adI0B40hH81WehR5muK8FdiPGKEsHaBgYqFGy5fTP+kJu5rQXh+K940qJRR1K2qCXmP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZnfXYUbCB2BbWKqT6zdvNTUKiLkNrjoRnmWZrCX/fz8=; b=R
 1Ig2UeNioatIEAKnD2DaxDQkqO8XMW66Ontfxxqaad0tzOnYNQ7uXYHCeUc3NJZBRZ8Zn9xFOTMjm
 i0U//EtxStDrnNzHqnNMlbEdiABE1kJrt/zpzAuO3l1RcUJxw31sKjXGPB6DVJwSSa3cVhn2Ttklx
 tggEdbPC3AXHlGvA=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kCXcN-005wBp-7c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 00:24:21 +0000
Received: by mail-pj1-f68.google.com with SMTP id kx11so2086394pjb.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 30 Aug 2020 17:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZnfXYUbCB2BbWKqT6zdvNTUKiLkNrjoRnmWZrCX/fz8=;
 b=nftfqZ8DnVy4hFsXpIRjiH68UiYa/itmOgKxyJ8MtRpETwtiFJSTo0RhIvPObdIiY9
 nDlO0/B9dtHyjgyLPWLM+2wCwsrBlZqGDjDp7PK1wIL/Npo5eUmrWKrMa/haOcTSEAVV
 9F7DjOt8O93v4r+x69+HXwwjF2A9xW2S8RfWZadS3vBFgW5J2MkdvDrjyTVIFPaToAVp
 daKOR28aP1Xrh0JonpUVoTEPh6ZzEhyty1DB8lwKEgQ7uH0vjBMDORM6K5i/wvPOLQkA
 UNQcpiys4UE5avtviwdPsmiuXK/GpfQgFpB4CyNoBTRCF4zHkucKJHbfx5PnuODnzFBU
 Dj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZnfXYUbCB2BbWKqT6zdvNTUKiLkNrjoRnmWZrCX/fz8=;
 b=FM2/HmREocd0mGPorC7TpjQoYbQMQG6Z2SaPXCxc8WPZP+sS1CKggf+9Pabira7BR7
 bfTIRzHf9PgoNmRfVwz2c8Bh2P8AWqwIALRxlluYMXKAsPKNM9xXFPYTrdu0qcmxxYdF
 tuCYmpZSlp2Z/LXFwyqX4k5mLe+aqzt/xEiBVmnQcOXCTwMy3McdhwSFkVDKCwbqSrKp
 BVx/e3x/q4nKzORS+I2TpYkwQHq7xsDyuJn/aY+9YVG00iZma38z6cBSL8+hYZc+0mcA
 8teacBHcyKTM0KUz9ZTBNs4da8e/V+r120gqMq/uPRSdxLVvx4yS4/XhrcfXJWKRF0m0
 oFJg==
X-Gm-Message-State: AOAM531GnEfFkOxEiuMTNgVlL8grm/5K4vsL4SD/t8s0JYMvqr9BFTfu
 5kgiIFUhLouwxhL+/VcKzaM=
X-Google-Smtp-Source: ABdhPJxU3uC9s/QR9RBkZO0HL/4Vd28NyPzLtSUUf2pebZcDvM1d2R8ZoAsqQXsstWSWBAJEn3zBIA==
X-Received: by 2002:a17:90a:eb17:: with SMTP id
 j23mr8148264pjz.151.1598833449671; 
 Sun, 30 Aug 2020 17:24:09 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id r33sm5244826pgm.75.2020.08.30.17.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 17:24:08 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 31 Aug 2020 09:24:01 +0900
Message-Id: <20200831002401.3159134-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kCXcN-005wBp-7c
Subject: [f2fs-dev] [PATCH] f2fs: add block address limit check to
 compressed file
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Need to add block address range check to compressed file case and
avoid calling get_data_block_bmap() for compressed file.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c1b676be67b9..48cab85205e2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1755,10 +1755,6 @@ static int get_data_block_dio(struct inode *inode, sector_t iblock,
 static int get_data_block_bmap(struct inode *inode, sector_t iblock,
 			struct buffer_head *bh_result, int create)
 {
-	/* Block number less than F2FS MAX BLOCKS */
-	if (unlikely(iblock >= F2FS_I_SB(inode)->max_file_blocks))
-		return -EFBIG;
-
 	return __get_data_block(inode, iblock, bh_result, create,
 						F2FS_GET_BLOCK_BMAP, NULL,
 						NO_CHECK_TYPE, create);
@@ -3753,11 +3749,16 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 	if (mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
 		filemap_write_and_wait(mapping);
 
-	if (f2fs_compressed_file(inode))
-		blknr = f2fs_bmap_compress(inode, block);
+	/* Block number less than F2FS MAX BLOCKS */
+	if (unlikely(block >= F2FS_I_SB(inode)->max_file_blocks))
+		goto out;
 
-	if (!get_data_block_bmap(inode, block, &tmp, 0))
-		blknr = tmp.b_blocknr;
+	if (f2fs_compressed_file(inode)) {
+		blknr = f2fs_bmap_compress(inode, block);
+	} else {
+		if (!get_data_block_bmap(inode, block, &tmp, 0))
+			blknr = tmp.b_blocknr;
+	}
 out:
 	trace_f2fs_bmap(inode, block, blknr);
 	return blknr;
-- 
2.28.0.402.g5ffc5be6b7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
