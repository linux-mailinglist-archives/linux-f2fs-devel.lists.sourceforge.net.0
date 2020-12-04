Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D972CE4A6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 01:59:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkzRU-0000zV-KQ; Fri, 04 Dec 2020 00:59:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kkzRT-0000zI-H1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 00:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B2GdugjcABCFFYqF5Ss710yIiKdBWRhwPg5hBXvzqgQ=; b=Si9Z5OdC2nRCPs/KcykwvNWcb+
 HIsfsqp5/zVMpX3pbkS6eg6/cb0yM7GwyWIZzm8eyHqCfcClTcwKd4STTCIx9i5GhcDto5XKJ5Dgw
 jSlaa4gcuGaw2N35mcsB1k63Q4SlUTxBx5W+amzy1IDUjoypEfg0G856z6Jt9CigdNKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=B2GdugjcABCFFYqF5Ss710yIiKdBWRhwPg5hBXvzqgQ=; b=I
 d8X/gnBKs4msnyZ336HvXpp6djd4VJHGBP25HGhaf5Ekx7nO/EW6dZUCsTU2mee9N7ir1jflwOXUQ
 9ITIN1JYmivmD3NvuGhZ7fAnhTzgf2dqPBCy3/tqc+6iNcEqcIMoL6Ad9AYb3NNK/J+zzQm7/WOOp
 BwwkR/E+CfPWihnM=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kkzRE-000v2r-VS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 00:59:23 +0000
Received: by mail-pj1-f68.google.com with SMTP id v1so2103884pjr.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 16:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B2GdugjcABCFFYqF5Ss710yIiKdBWRhwPg5hBXvzqgQ=;
 b=kxhO1V1NPowvnogMzpWtPh0iTFVXZLDurDgT+3EUZDgMGzVS14kKhnbFoqQP/2IoVu
 BcmyXK0s09ZA31XVYTlNSxppjd02rm6TAQ4QoivdxRqVNNBucoK5vxqo522PdWpWe5bd
 hGznvXTiCYrhBAUZB5we5HT9jUrnj9gxogBZN4gTxs0JyEhynZCv2/JSGNXjUNXW3fwe
 glVOAhOsKXGNsCkruJP5yf/Vhqgxwh7QtKPudrkKblr25abVQcdrrlsCouE+ls8IngJ/
 hrEKnQRy3i6tClhIxDM+B1InajqmVcpKFxhLBR5Bhn+N0LnFrx32buFjr2Cp/InR717K
 1H9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B2GdugjcABCFFYqF5Ss710yIiKdBWRhwPg5hBXvzqgQ=;
 b=poxMps4ed8sm96bJP2HO51T6IQI5onJd/VYV54ibysY0i2l52sG5J5m5PgHWiZhIIh
 pxeVMUlF845JBBKTAgR12s8S9pw7RgCP4XCRDdr083ksofFtlV7K9D0G2+7UqR5ze4Bf
 aJS/k8jWm7DG4MId5HfqooWi/vKsg5yloS1/vVbPV7EHuDjpmFQnYPnOPHw6WPO36NWg
 eYMwcqDWRgYUS9jVnV7Stu+UK4NuGMFmtDBfoR8w/H4cEJmYMy/licvGPv5ZAqzY5xVt
 0T2dzHF0vFNoksSb+cpvgtiunqZabBc5cckjKMwBXjl6L9fXYw0SFLeKG7N4MZ/72nvE
 tixQ==
X-Gm-Message-State: AOAM5331DscTNCX+FuVvRRiplcF1kUsBDu0vTtX3IcrEZFBEbEeQuwz0
 VJj3yW5a7ez5YDdFUl6Fb/o=
X-Google-Smtp-Source: ABdhPJz+1teRJkEgEykEx66mRpfwtEn7m8LkBRryWwxYmAt0dtO8PaP7l6asFTa69aV+igHdsDAbhg==
X-Received: by 2002:a17:90a:4f03:: with SMTP id
 p3mr1722135pjh.69.1607043536197; 
 Thu, 03 Dec 2020 16:58:56 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id u205sm2945781pfc.146.2020.12.03.16.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 16:58:55 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  4 Dec 2020 09:58:47 +0900
Message-Id: <20201204005847.654074-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kkzRE-000v2r-VS
Subject: [f2fs-dev] [PATCH] f2fs: fix race of pending_pages in decompression
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

I found out f2fs_free_dic() is invoked in a wrong timing, but
f2fs_verify_bio() still needed the dic info and it triggered the
below kernel panic. It has been caused by the race condition of
pending_pages value between decompression and verity logic, when
the same compression cluster had been split in different bios.
By split bios, f2fs_verify_bio() ended up with decreasing
pending_pages value before it is reset to nr_cpages by
f2fs_decompress_pages() and caused the kernel panic.

[ 4416.564763] Unable to handle kernel NULL pointer dereference
               at virtual address 0000000000000000
...
[ 4416.896016] Workqueue: fsverity_read_queue f2fs_verity_work
[ 4416.908515] pc : fsverity_verify_page+0x20/0x78
[ 4416.913721] lr : f2fs_verify_bio+0x11c/0x29c
[ 4416.913722] sp : ffffffc019533cd0
[ 4416.913723] x29: ffffffc019533cd0 x28: 0000000000000402
[ 4416.913724] x27: 0000000000000001 x26: 0000000000000100
[ 4416.913726] x25: 0000000000000001 x24: 0000000000000004
[ 4416.913727] x23: 0000000000001000 x22: 0000000000000000
[ 4416.913728] x21: 0000000000000000 x20: ffffffff2076f9c0
[ 4416.913729] x19: ffffffff2076f9c0 x18: ffffff8a32380c30
[ 4416.913731] x17: ffffffc01f966d97 x16: 0000000000000298
[ 4416.913732] x15: 0000000000000000 x14: 0000000000000000
[ 4416.913733] x13: f074faec89ffffff x12: 0000000000000000
[ 4416.913734] x11: 0000000000001000 x10: 0000000000001000
[ 4416.929176] x9 : ffffffff20d1f5c7 x8 : 0000000000000000
[ 4416.929178] x7 : 626d7464ff286b6b x6 : ffffffc019533ade
[ 4416.929179] x5 : 000000008049000e x4 : ffffffff2793e9e0
[ 4416.929180] x3 : 000000008049000e x2 : ffffff89ecfa74d0
[ 4416.929181] x1 : 0000000000000c40 x0 : ffffffff2076f9c0
[ 4416.929184] Call trace:
[ 4416.929187]  fsverity_verify_page+0x20/0x78
[ 4416.929189]  f2fs_verify_bio+0x11c/0x29c
[ 4416.929192]  f2fs_verity_work+0x58/0x84
[ 4417.050667]  process_one_work+0x270/0x47c
[ 4417.055354]  worker_thread+0x27c/0x4d8
[ 4417.059784]  kthread+0x13c/0x320
[ 4417.063693]  ret_from_fork+0x10/0x18

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/compress.c |  4 ++--
 fs/f2fs/data.c     | 24 +++++++++++++++++++-----
 fs/f2fs/f2fs.h     |  1 +
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 87090da8693d..cdf72e153da0 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -803,8 +803,6 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 	if (cops->destroy_decompress_ctx)
 		cops->destroy_decompress_ctx(dic);
 out_free_dic:
-	if (verity)
-		atomic_set(&dic->pending_pages, dic->nr_cpages);
 	if (!verity)
 		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
 								ret, false);
@@ -1498,6 +1496,8 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	dic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	dic->inode = cc->inode;
 	atomic_set(&dic->pending_pages, cc->nr_cpages);
+	if (fsverity_active(cc->inode))
+		atomic_set(&dic->verity_pages, cc->nr_cpages);
 	dic->cluster_idx = cc->cluster_idx;
 	dic->cluster_size = cc->cluster_size;
 	dic->log_cluster_size = cc->log_cluster_size;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 42254d3859c7..be0567dcace9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -202,7 +202,7 @@ static void f2fs_verify_bio(struct bio *bio)
 		dic = (struct decompress_io_ctx *)page_private(page);
 
 		if (dic) {
-			if (atomic_dec_return(&dic->pending_pages))
+			if (atomic_dec_return(&dic->verity_pages))
 				continue;
 			f2fs_verify_pages(dic->rpages,
 						dic->cluster_size);
@@ -2266,15 +2266,29 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 					is_readahead ? REQ_RAHEAD : 0,
 					page->index, for_write);
 			if (IS_ERR(bio)) {
+				unsigned int remained = dic->nr_cpages - i;
+				bool release = false;
+
 				ret = PTR_ERR(bio);
 				dic->failed = true;
-				if (!atomic_sub_return(dic->nr_cpages - i,
-							&dic->pending_pages)) {
+
+				if (fsverity_active(inode)) {
+					if (!atomic_sub_return(remained,
+						&dic->verity_pages))
+						release = true;
+				} else {
+					if (!atomic_sub_return(remained,
+						&dic->pending_pages))
+						release = true;
+				}
+
+				if (release) {
 					f2fs_decompress_end_io(dic->rpages,
-							cc->cluster_size, true,
-							false);
+						cc->cluster_size, true,
+						false);
 					f2fs_free_dic(dic);
 				}
+
 				f2fs_put_dnode(&dn);
 				*bio_ret = NULL;
 				return ret;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 94d16bde5e24..f328f55fb0a0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1341,6 +1341,7 @@ struct decompress_io_ctx {
 	size_t rlen;			/* valid data length in rbuf */
 	size_t clen;			/* valid data length in cbuf */
 	atomic_t pending_pages;		/* in-flight compressed page count */
+	atomic_t verity_pages;		/* in-flight page count for verity */
 	bool failed;			/* indicate IO error during decompression */
 	void *private;			/* payload buffer for specified decompression algorithm */
 	void *private2;			/* extra payload buffer */
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
