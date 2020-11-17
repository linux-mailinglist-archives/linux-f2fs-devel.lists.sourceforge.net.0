Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8692B6857
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 16:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aLWSsLK86qZEo7DwBPuaCYjl/okwwMSrVx1IjT062qc=; b=bbToU1Ngr5ovwSDg13ToBXaP6
	zTHW7Da3TMrLAgJyk+XDA/Gei8gqQnVUmP7RRMRX4XbIditwIZBnFgOd5cOvR2GzJGjPKwqUE0XRo
	CwMag8gtJ43WrWlbhl3ttlJxlDSa1mCFu+lxvdBOACeeyBnVN29SjeCAotVdDz6WqhIak=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf2dn-0001DV-69; Tue, 17 Nov 2020 15:11:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3GNmzXwYKAJ0P7QV7QDLLDIB.9LJ@flex--satyat.bounces.google.com>)
 id 1kf2dm-0001DN-DD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 15:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4NJdRU1Ce0aa6Hnfqmub71YUmFd4Qx8kk5Y17DesY40=; b=NKC+VSaXZ1iAUQBsI1qNOHSd7
 MeOOpklclxAfEE7d65Hd70YseBUd/i8ZJtNfUFjN6cMnb/6yUdlHbAwSdjha16zA9aryEXYI0C28V
 tCdeAEFaLFebGimPX9l0oM1LKc6V0ClZQmaKmK+Y4jFJ8vvLAs+BmcMcvo3LUh1QR+06A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4NJdRU1Ce0aa6Hnfqmub71YUmFd4Qx8kk5Y17DesY40=; b=YH6JQzURQERdWw3cEkN9mTLlW7
 uvA11wu9EN4qALGswYjDvGfxe8bDOuJPuVkRSG+jsgFt1nl8ntkZcZcPWIeXrGxtm7/UHb6XFBT60
 lu4GO2XkQYOMTuQpYyH6fnXUiKM1I0bF+odHPPKXBkViVz+Ti2ofuWZpo8lqvZOuWSGc=;
Received: from mail-ot1-f73.google.com ([209.85.210.73])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kf2dR-000tY7-HY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 15:11:29 +0000
Received: by mail-ot1-f73.google.com with SMTP id w1so3709225otp.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 07:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=4NJdRU1Ce0aa6Hnfqmub71YUmFd4Qx8kk5Y17DesY40=;
 b=nFNLxAfPd8e/zZTqlZUXpXuN77+dJdfeaniNFRSeDnLdmkHZ4pPlCypUrVhliOogm2
 4Dwh4eHqmw2aUK8kmS7CCa6ww0SDvMftt2FkxmnXssuFtIw0EusEu5Tkclj14gnChFDP
 nxiC5qrIaleDvreRVgMA2Wlvc7e6OAIU8ncMChxF9U+5y5/JiD5FTbKCl+/WuKfwvoEH
 mCKaCC4qnI+2FSmVaNkQ7Him8OftmfrHMw8NaMSBnAohoHm15k5RFsSppzf8zmthwEic
 mYwEOwBuIURqwBhUSgbh3+kM8mQOu63f4FrhK7OWUC5IlMyZLtGBLvhREdbtOF4tBIKo
 hkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4NJdRU1Ce0aa6Hnfqmub71YUmFd4Qx8kk5Y17DesY40=;
 b=UtbYi+fp2ztnm+16QEDZXNJiAU132irRKcA3wLP5rdIYQuTsv0+oD8rzCr9Zocv5Wo
 v5USKVq6ievDAAnckfkVC3SsxwNGeDxVwAIV2bDkYpduS4BdnxEmghFmxCqtTULuFn2t
 zDtEjM/Yps9seXJwVoimbzIe/N08kaMMlJCxNqi5si5nPuWk52omzq2Fq7jxbh9cT7p5
 ndGwpI3br4UZKBc+IiOOm0slhZ0Lx+59juUxEtCWToC1RAGFYbQz+GqiOo40Kh0//0cL
 iWY/QqXPaCADYmBFeclBEcbKsLnlrGo+maUOroe/QE/kVwoPGuIXLDQvPz2c68WuPNbZ
 DbZA==
X-Gm-Message-State: AOAM533Rio6LfTns14a+n7OODrMcnWY3tdyoNMGp5ON809x0I+aNc8Gp
 he9xyONYByictEWn1NSC0QrRQ5Ut7dY=
X-Google-Smtp-Source: ABdhPJxfrRrknOI/BvOJaGPc6TEIdJJ1naDUKZko8kN45MeyLyMTe361mEhiYF+cx+Qes0o2OJZjXCGY5eY=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a17:90a:8043:: with SMTP id
 e3mr4901058pjw.52.1605622040427; Tue, 17 Nov 2020 06:07:20 -0800 (PST)
Date: Tue, 17 Nov 2020 14:07:04 +0000
In-Reply-To: <20201117140708.1068688-1-satyat@google.com>
Message-Id: <20201117140708.1068688-5-satyat@google.com>
Mime-Version: 1.0
References: <20201117140708.1068688-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kf2dR-000tY7-HY
Subject: [f2fs-dev] [PATCH v7 4/8] direct-io: add support for fscrypt using
 blk-crypto
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

Set bio crypt contexts on bios by calling into fscrypt when required,
and explicitly check for DUN continuity when adding pages to the bio.
(While DUN continuity is usually implied by logical block contiguity,
this is not the case when using certain fscrypt IV generation methods
like IV_INO_LBLK_32).

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/direct-io.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index d53fa92a1ab6..f6672c4030e3 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/fs.h>
+#include <linux/fscrypt.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
@@ -392,6 +393,7 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
 	      sector_t first_sector, int nr_vecs)
 {
 	struct bio *bio;
+	struct inode *inode = dio->inode;
 
 	/*
 	 * bio_alloc() is guaranteed to return a bio when allowed to sleep and
@@ -399,6 +401,9 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
 	 */
 	bio = bio_alloc(GFP_KERNEL, nr_vecs);
 
+	fscrypt_set_bio_crypt_ctx(bio, inode,
+				  sdio->cur_page_fs_offset >> inode->i_blkbits,
+				  GFP_KERNEL);
 	bio_set_dev(bio, bdev);
 	bio->bi_iter.bi_sector = first_sector;
 	bio_set_op_attrs(bio, dio->op, dio->op_flags);
@@ -763,9 +768,17 @@ static inline int dio_send_cur_page(struct dio *dio, struct dio_submit *sdio,
 		 * current logical offset in the file does not equal what would
 		 * be the next logical offset in the bio, submit the bio we
 		 * have.
+		 *
+		 * When fscrypt inline encryption is used, data unit number
+		 * (DUN) contiguity is also required.  Normally that's implied
+		 * by logical contiguity.  However, certain IV generation
+		 * methods (e.g. IV_INO_LBLK_32) don't guarantee it.  So, we
+		 * must explicitly check fscrypt_mergeable_bio() too.
 		 */
 		if (sdio->final_block_in_bio != sdio->cur_page_block ||
-		    cur_offset != bio_next_offset)
+		    cur_offset != bio_next_offset ||
+		    !fscrypt_mergeable_bio(sdio->bio, dio->inode,
+					   cur_offset >> dio->inode->i_blkbits))
 			dio_bio_submit(dio, sdio);
 	}
 
-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
