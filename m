Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5FC972B0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 08:43:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0KKm-0006w9-Mf; Wed, 21 Aug 2019 06:43:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <boojin.kim@samsung.com>) id 1i0KKl-0006vs-CO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 06:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VSDGagmX1Sh84QSpP/Zxc7H3ZzEBBEugPOm00XWkwx0=; b=JkeVSFi/AHq4Jym7QHsXZTOUXU
 FzXkIr9d3y2M0AyFrHu+gZqgO2GKKR2NCovM+UZa5Qc9xixeCcGeVbnmsOmxlrxvjmyVcTy5MOzFl
 slv49k5ZJExcOlQf3I2j5cchrNR0dX5gmRNJMXb1eWRbf+VMvNYWOrLVsJ3RJWhFb9Eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VSDGagmX1Sh84QSpP/Zxc7H3ZzEBBEugPOm00XWkwx0=; b=A
 KTIyNyTjL8cI2mtb37V5DXpcv5VdM1xjOWSl7bo0fOX5W/8YxXsoHAksCz55W6N2EUb3FJlOvUnkV
 NnQ8XvMETGvFK6esqii48z5j1nyRx1lacJbKE4KfmGRUWSTmnFsCpRCx5sMq8pKbcIn6Psol02bqa
 RgEpLtIyfQfXf/Vw=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0KKZ-00AEp3-5Z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 06:43:03 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20190821064244epoutp0388dc75886284d610611a82a9af260c90~83QB3FxN31490714907epoutp03v
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Aug 2019 06:42:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20190821064244epoutp0388dc75886284d610611a82a9af260c90~83QB3FxN31490714907epoutp03v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566369764;
 bh=VSDGagmX1Sh84QSpP/Zxc7H3ZzEBBEugPOm00XWkwx0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=kp+wYQgRZgOk30PDx/G0sx/S9JGS+WMOAxGeYQOhxCwTFhWXPjRLlfq8V9XoQIv0d
 kHIa7c4cXTlVNxtlfwoIdCtGC/wTh4kmgGazf6okMXcPFgpg3rvBuzO43DuhAjt4p8
 oOf7qdS2iGASi+TD52hxrG8LkB+SI6sEhePULqAM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20190821064243epcas2p1513f6c689a79a36dc0dc1754286752d7~83QBVTBwc0977609776epcas2p1p;
 Wed, 21 Aug 2019 06:42:43 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.185]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 46CylQ4jGyzMqYkc; Wed, 21 Aug
 2019 06:42:42 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 29.63.04068.2E7EC5D5; Wed, 21 Aug 2019 15:42:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20190821064241epcas2p2bf71ad8055188f8b47870b06480c8368~83P-e0YIv2515525155epcas2p2D;
 Wed, 21 Aug 2019 06:42:41 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190821064241epsmtrp2ffa0d72b199a07928d6700dafdc21bfb~83P-dxpZv2242122421epsmtrp2m;
 Wed, 21 Aug 2019 06:42:41 +0000 (GMT)
X-AuditID: b6c32a47-5a1ff70000000fe4-d0-5d5ce7e276af
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E8.E2.03638.1E7EC5D5; Wed, 21 Aug 2019 15:42:41 +0900 (KST)
Received: from KORDO035251 (unknown [12.36.165.204]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20190821064241epsmtip103e0e63af169ffafdce3a6511ac306af~83P_uPq-h0421904219epsmtip1n;
 Wed, 21 Aug 2019 06:42:41 +0000 (GMT)
From: "boojin.kim" <boojin.kim@samsung.com>
To: "'Theodore Ts'o'" <tytso@mit.edu>, "'Andreas Dilger'"
 <adilger.kernel@dilger.ca>, <linux-ext4@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
Date: Wed, 21 Aug 2019 15:42:41 +0900
Message-ID: <004401d557eb$a1989480$e4c9bd80$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AdVX6KvjWZDiSF7MRaiKA5mSaSDrOQ==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0wTZxjed3e9O5ldbpVtn82m3U2WCSm2sOLHIm5RI5fIEozJXFwbOOEC
 zP5Kr0VdFmsMdNiRASE6WzqjqCOrIltLkDBgBgSqwFhGcJbAWEaDGwTdysQA6tZ6NeO/533e
 53l/5M1L4woPpaTLzHbBZuaNLJlEtPVu3qr+/a7eoPENpaAH/1QRqOVWP44uT9aQaPDUMIZ8
 IxUE6rrXIEPNnY9w9PnsqyjS4sXRnWWXDNVMz+FoZORbCgWmb8tQ13gamvp1CUOesxMk+rkx
 F82eXSRQZ9dNAo12+Eh0498agM6MdGPI9d0DgCqrlyg00Lz/vfVc6zdhjKsIHubarqdwo8MO
 LuA/SXITtztJLnjRyX1/bgHjTgz14dz97jGS+6LVD7iFwIb8tQeM20oFvliwqQRzkaW4zFyS
 w+7ZV7CzQJel0aq12WgrqzLzJiGH3ZWXr95dZoztzqrKeaMjRuXzoshu2b7NZnHYBVWpRbTn
 sIK12GjVaq3pIm8SHeaS9CKL6R2tRpOhiykLjaXu5nqZdVF95LcvV6jj4HyKG6yhIfM27Bxf
 IdwgiVYw7QBe9DfJpCAK4N8//UFKwSKAXncV/szyqC6USHQBOFlRl/D/CeD4w5AsriKZNBgc
 8IN4Ipm5BqB76cnTAGeeUDAS7YlZaHodo4VXfHvjBoJJgb3hMBbHciYbzgTnKAm/CG96IkQc
 48xGeG3elxhDBduH50AcJzPp8P5yEylpkmHDSVdC85iCF/pfi7eCzC541QUleh2cHWilJKyE
 C/e6SAk74djXF6j4mJCpBnBo2ZUQZULvzGcgXgdnNsOWji1SyTfgjfHEZC/Aqt7HlETLYZVL
 IRk3wa+io5hEK+Ff1cckmoMzTaexWvC6d9WK3lUrelet4v2/7TlA+MHLglU0lQhihjVz9a0D
 4OlbpOa2g7Yf83oAQwN2rbzwl48MChlfLh419QBI42yy/IjvgEEhL+aPfiLYLAU2h1EQe4Au
 doE6XPlSkSX2ZGZ7gVaXkZWlydYhXVYGYl+RB54P6xVMCW8XDgmCVbA982H0GuVxkLuj+kTb
 6VDImbN+sNF5K1NVbgre7T/sntA34JsawHOGJL2n3iO8uT1p7+WD6lMHm/r24O8eG/508EPn
 pd75UNrAB3kr+h8ifZeEjzcgn2ls/tCO6fMbp/Kmoo3LtWFf5EplVFNpqa85s/P9/XR3x4wh
 Fbs6Ueu7vq/wregkuvOQJcRSXpuK20T+P4eFjIYsBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsWy7bCSnO7D5zGxBucmmlh8/dLBYrH+1DFm
 i9V3+9ksTk89y2Qx53wLi8Xed7NZLdbu+cNs0f1KxuLJ+lnMFjd+tbFa9D9+zWxx/vwGdotN
 j6+xWuy9pW1x/95PJouZ8+6wWVxa5G7xat43Fos9e0+yWFzeNYfN4sj/fkaLGef3MVm0bfzK
 aNHa85Pd4vjacAdJjy0rbzJ5tGwu99h2QNXj8tlSj02rOtk87lzbw+axeUm9x+4Fn5k8ms4c
 ZfZ4v+8qm0ffllWMHp83yQXwRHHZpKTmZJalFunbJXBldK2dzFrwTbfiwfTf7A2MC1W7GDk5
 JARMJP5MPMHWxcjFISSwm1Fi0enpzBAJKYmt7XugbGGJ+y1HWCGKnjNKrFjRxwKSYBPQlth8
 fBUjSEIEpPvVqY2MIAlmgWkcErs+iHcxcnAICxhKrJkTCBJmEVCVOHzzJhOIzStgKfFs82t2
 CFtQ4uTMJywg5cwCehJtMFPkJba/nQN1g4LEjrOvweIiQCXvfy1ng6gRkZjd2cY8gVFwFpJJ
 sxAmzUIyaRaSjgWMLKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYKTgJbWDsYTJ+IP
 MQpwMCrx8O64GR0rxJpYVlyZe4hRgoNZSYS3Yk5UrBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe
 +fxjkUIC6YklqdmpqQWpRTBZJg5OqQbG1j+X7p0ojljf0sTdnBLg/IotLzPO5cnquTv/Kex8
 9Ek2b7r81+i/PGV67/55MljZOEgETd3B97fnlLDkLI2LH5pTlU7yX/27L+7F3b885SK7D9Q2
 r+59+J/plWpgl83hdP4X20qjImp16mawORmfZxFZL7Fnb4SEvXlfcc/d9nmG3J+abPSVWIoz
 Eg21mIuKEwEfL/cX/gIAAA==
X-CMS-MailID: 20190821064241epcas2p2bf71ad8055188f8b47870b06480c8368
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190821064241epcas2p2bf71ad8055188f8b47870b06480c8368
References: <CGME20190821064241epcas2p2bf71ad8055188f8b47870b06480c8368@epcas2p2.samsung.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0KKZ-00AEp3-5Z
Subject: [f2fs-dev] [PATCH 8/9] fs: ext4: support diskcipher
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
Cc: 'Ulf
 Hansson' <ulf.hansson@linaro.org>, 'Mike Snitzer' <snitzer@redhat.com>,
 dm-devel@redhat.com, 'Andreas Dilger' <adilger.kernel@dilger.ca>,
 'Alasdair Kergon' <agk@redhat.com>, 'Eric Biggers' <ebiggers@kernel.org>,
 linux-samsung-soc@vger.kernel.org, 'Herbert Xu' <herbert@gondor.apana.org.au>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 'Jaehoon Chung' <jh80.chung@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, 'Jaegeuk Kim' <jaegeuk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 'Jens Axboe' <axboe@kernel.dk>,
 'Theodore Ts'o' <tytso@mit.edu>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "'David S. Miller'" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ext4 checks the crypto properties of the inode,
and if it is a diskcipher, sets it to BIO before submitting the BIO.
When using diskcipher, Ext4 does not encrypt the data before submitting
the BIO and decrypt the data on complete of the BIO.

Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>
Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
---
 fs/ext4/inode.c    | 39 +++++++++++++++++++++++++++++++++------
 fs/ext4/page-io.c  |  8 +++++++-
 fs/ext4/readpage.c |  7 +++++++
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 5bcc96f..7f9e1fa 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1223,7 +1223,14 @@ static int ext4_block_write_begin(struct page *page,
loff_t pos, unsigned len,
 		if (!buffer_uptodate(bh) && !buffer_delay(bh) &&
 		    !buffer_unwritten(bh) &&
 		    (block_start < from || block_end > to)) {
-			ll_rw_block(REQ_OP_READ, 0, 1, &bh);
+			if (S_ISREG(inode->i_mode) && IS_ENCRYPTED(inode)
+					&&
fscrypt_has_encryption_key(inode)) {
+				bh->b_private =
fscrypt_get_diskcipher(inode);
+				ll_rw_block(REQ_OP_READ,
+					bh->b_private ? REQ_CRYPT : 0, 1,
&bh);
+			} else {
+				ll_rw_block(REQ_OP_READ, 0, 1, &bh);
+			}
 			wait[nr_wait++] = bh;
 		}
 	}
@@ -1237,7 +1244,8 @@ static int ext4_block_write_begin(struct page *page,
loff_t pos, unsigned len,
 	}
 	if (unlikely(err)) {
 		page_zero_new_buffers(page, from, to);
-	} else if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode)) {
+	} else if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
+			!bh->b_private) {
 		for (i = 0; i < nr_wait; i++) {
 			int err2;
 
@@ -3670,6 +3678,13 @@ const struct iomap_ops ext4_iomap_ops = {
 	.iomap_end		= ext4_iomap_end,
 };
 
+static void ext4_submit_dio(struct bio *bio, struct inode *inode,
+							loff_t file_offset)
+{
+	fscrypt_set_bio(inode, bio, 0);
+	submit_bio(bio);
+}
+
 static int ext4_end_io_dio(struct kiocb *iocb, loff_t offset,
 			    ssize_t size, void *private)
 {
@@ -3801,7 +3816,9 @@ static ssize_t ext4_direct_IO_write(struct kiocb
*iocb, struct iov_iter *iter)
 		dio_flags = DIO_LOCKING;
 	}
 	ret = __blockdev_direct_IO(iocb, inode, inode->i_sb->s_bdev, iter,
-				   get_block_func, ext4_end_io_dio, NULL,
+				   get_block_func, ext4_end_io_dio,
+				   !fscrypt_disk_encrypted(inode) ?
+				   NULL : ext4_submit_dio,
 				   dio_flags);
 
 	if (ret > 0 && !overwrite && ext4_test_inode_state(inode,
@@ -3909,7 +3926,8 @@ static ssize_t ext4_direct_IO(struct kiocb *iocb,
struct iov_iter *iter)
 	ssize_t ret;
 
 #ifdef CONFIG_FS_ENCRYPTION
-	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
+	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode)
+		&& !fscrypt_disk_encrypted(inode))
 		return 0;
 #endif
 	if (fsverity_active(inode))
@@ -4090,7 +4108,15 @@ static int __ext4_block_zero_page_range(handle_t
*handle,
 
 	if (!buffer_uptodate(bh)) {
 		err = -EIO;
-		ll_rw_block(REQ_OP_READ, 0, 1, &bh);
+		if (S_ISREG(inode->i_mode) && IS_ENCRYPTED(inode)
+				&& fscrypt_has_encryption_key(inode)) {
+			bh->b_private = fscrypt_get_diskcipher(inode);
+			ll_rw_block(REQ_OP_READ, bh->b_private ? REQ_CRYPT :
0,
+					1, &bh);
+		} else {
+			ll_rw_block(REQ_OP_READ, 0, 1, &bh);
+		}
+
 		wait_on_buffer(bh);
 		/* Uhhuh. Read error. Complain and punt. */
 		if (!buffer_uptodate(bh))
@@ -4098,7 +4124,8 @@ static int __ext4_block_zero_page_range(handle_t
*handle,
 		if (S_ISREG(inode->i_mode) && IS_ENCRYPTED(inode)) {
 			/* We expect the key to be set. */
 			BUG_ON(!fscrypt_has_encryption_key(inode));
-			WARN_ON_ONCE(fscrypt_decrypt_pagecache_blocks(
+			if (!bh->b_private)
+
WARN_ON_ONCE(fscrypt_decrypt_pagecache_blocks(
 					page, blocksize, bh_offset(bh)));
 		}
 	}
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 12ceadef..3e41788 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -345,6 +345,11 @@ void ext4_io_submit(struct ext4_io_submit *io)
 				  REQ_SYNC : 0;
 		io->io_bio->bi_write_hint = io->io_end->inode->i_write_hint;
 		bio_set_op_attrs(io->io_bio, REQ_OP_WRITE, io_op_flags);
+#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_CRYPTO_DISKCIPHER)
+		if (IS_ENCRYPTED(io->io_end->inode) &&
+				S_ISREG(io->io_end->inode->i_mode))
+			fscrypt_set_bio(io->io_end->inode, io->io_bio, 0);
+#endif
 		submit_bio(io->io_bio);
 	}
 	io->io_bio = NULL;
@@ -474,7 +479,8 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 	 * (e.g. holes) to be unnecessarily encrypted, but this is rare and
 	 * can't happen in the common case of blocksize == PAGE_SIZE.
 	 */
-	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) && nr_to_submit) {
+	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) && nr_to_submit &&
+			!fscrypt_disk_encrypted(inode)) {
 		gfp_t gfp_flags = GFP_NOFS;
 		unsigned int enc_bytes = round_up(len, i_blocksize(inode));
 
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index a30b203..aab2cf7c 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -183,6 +183,9 @@ static struct bio_post_read_ctx
*get_bio_post_read_ctx(struct inode *inode,
 	unsigned int post_read_steps = 0;
 	struct bio_post_read_ctx *ctx = NULL;
 
+	if (fscrypt_disk_encrypted(inode))
+		return NULL;
+
 	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
 		post_read_steps |= 1 << STEP_DECRYPT;
 
@@ -376,6 +379,10 @@ int ext4_mpage_readpages(struct address_space *mapping,
 			bio->bi_private = ctx;
 			bio_set_op_attrs(bio, REQ_OP_READ,
 						is_readahead ? REQ_RAHEAD :
0);
+#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_CRYPTO_DISKCIPHER)
+			if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
+				fscrypt_set_bio(inode, bio, 0);
+#endif
 		}
 
 		length = first_hole << blkbits;
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
