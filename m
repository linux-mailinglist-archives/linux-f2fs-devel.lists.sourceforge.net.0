Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EE4C07336
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Oct 2025 18:09:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZXdHDoEm5qkAfcSFv+AqJ7vgC2Ky8+G4zOksI5fjiWM=; b=dt3tmJYc+LWHcYGHAxbPqm0s86
	etfXH7Dke5JDfcbMO5UCCEQ5G6kB/nb5LA41VsSVjdhTA/M+Thltd7ypqo8L6grK0XSC5xujJrcO+
	wOg7K9rhlmJeRawsQKNRDk6VNxTZxMkQqd9ehetaha0OBvM/n1hKjLyScjyR8z8mDca8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vCKMF-0002Yp-Kb;
	Fri, 24 Oct 2025 16:09:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vCKMD-0002Yi-JQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Oct 2025 16:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lfJyNJy2g4hJHaSFk9142xyHqlbf9daLrWyI97iGZ60=; b=ijJ/enm2NvV+gMq9yVkkAAdLDs
 e20az61MbIfo2n1mRhIeheZfcUHx0W5AgIATkSUbw2clT+3nlB+evjpztJwRmUTCU6yqLrwBpbCNu
 RYdtR7jYxckInld0KoqJpI5KtBZ87ylUbzHaJ9oEPlrAtrLMi4eA5j++iABTreV+g1aQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lfJyNJy2g4hJHaSFk9142xyHqlbf9daLrWyI97iGZ60=; b=e
 m5iWVgExe5zghmbuDClV3mw4qefqjmlPx5EdCr8oKhq7XwYOybxI+JzK7zGypAa9b4PeTnBDbc6LP
 Wx4N3irnCTFscs9u5CcmysUFaUoJhJqSbxiFxR3CFJ4zy/DOYzkUK0eYFVv1X3KjQvB9zCjTDo7lq
 GOwgMDw8hKeCIKwc=;
Received: from mail-qv1-f48.google.com ([209.85.219.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vCKMD-0000cd-2P for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Oct 2025 16:09:37 +0000
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-87c1a760df5so29688196d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Oct 2025 09:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761322171; x=1761926971; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lfJyNJy2g4hJHaSFk9142xyHqlbf9daLrWyI97iGZ60=;
 b=JFzwbAjYXmkjoZzjtbj4TLf3UK877Tv24DAbrSN1Fpz9moDQ6XvWDJSQUYbPMeWJgi
 boTznRuiM2DYcV6p+0SoG536ZKojvgjGbt3a4AH2xUHpXelmWtqwvOPGDzXc17a01WWd
 +1hL0mP4ynJhMneixFtlMV6gyGEAkOyqRNcnGSLkB9kYUq7jgVJ/8V5mYcyT7rbn3Kiq
 Skgf8L8qu3i8e8hy2Kl1autDYQo2ua/Jauig3z0iM6Cf8/wUgODmGvlGqaBwjaRzMV+y
 asby1DNkEDRHA5YXrQuNKyu/DtDpy6+9OE9+Vfo5bTAQqP2zB8hLEdlibmadJ7crULBN
 mvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761322171; x=1761926971;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lfJyNJy2g4hJHaSFk9142xyHqlbf9daLrWyI97iGZ60=;
 b=OrG/eC/iGfj8RUbcIdQZ/BLqm3wFrx2+QAkGLZbcOkZJrQmPOUyU5fimqYRRN/hMFW
 F5CnoQBuz4druHuMqDGg4i/kinfoVyhwPeoYHk5Xy1miA56/5ZQAoXmQHR98KgOIPK8X
 ETUXptFUfyOaS3GKqEELtXHuyNhn95bLS9JohdsA7K9Xn98kPJQ03fjfp0ObCEYc1Qkn
 B887W4Ci0iOdMzek76LmHmGS4lPuTuN3uvd5k6haxYsr6iCtEJDaTZYQjLw/zKUFaCl7
 wcbNVPKLH32t6qsE5Ajh37NUdmlGCAyUrwaOHEnZT9y6H7E9vL0Uhs6XEaQ3VfUZZZ5i
 tVzg==
X-Gm-Message-State: AOJu0YwgDEeCw8/jYs22k1BA5ujEp9uHktVRwyOHZ6miO8buKRswBdwu
 mrd8LbGLKspLuzZf5//TmnLysY2GAgmwzh9Ni849M+kOgJ31WjIGylqFnA9BZfccPNY=
X-Gm-Gg: ASbGncs0zIi0G1sm6UGr3ia52Ro6uw4tnt7GqJyp3BvRfPfl38c3EGxVXsW1cX9reIR
 EpjiszFBZb/+W3TgnI8t/66GwVvMEL9CkFCwYmzNd4Zpl/VKz/TYKXLWviL95bLRNsydomBod4Q
 5c7MTg50exwa1obZj4QrWv5csQXQFmEIKQz2xSZcfUr1tAr8zN/Wxt9w/3r6CpAJNWfftqmwn6l
 /GwvGx+NHyF6kRVnL/2l9G0pwfrW/f0AyBsx5dGeWsEuydIrupks1pykCI6s3wX6Jja0fNMdI4U
 7fJHhQenrZmZH6BtDugMjLA14/cZMaCqsZ3EzvMozVGDNM1Skzu2QpVBVsZTnnvMCzWThlNnlwb
 ttHqVnCZxMrdaHhyHPAYYLuQpRwHpGQv0vzVWoaP3bUocH+ZagnkcXR8+VLu9u7R2tGYO5MtM56
 5S7xPeO3MkriCu4UVG+6O0odaJs2J56Y1cYLZz+GdD2lV0avrVVtsdIqLGn2Mtg7FpdADg
X-Google-Smtp-Source: AGHT+IEjYW9LC3gV2fXaU9nISn7WTXOR/uFauVDFN51rZa1KO7vSZ/KnagIAm/ywCwCHp7f0GxbaRA==
X-Received: by 2002:a17:902:d587:b0:269:a4ed:13c3 with SMTP id
 d9443c01a7336-290c9c8c7d8mr358966585ad.5.1761311640545; 
 Fri, 24 Oct 2025 06:14:00 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e108e0asm55458845ad.91.2025.10.24.06.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 06:14:00 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 24 Oct 2025 21:13:44 +0800
Message-ID: <20251024131344.144972-1-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Change the type of the unlock parameter
 of f2fs_put_page to bool. All callers should consistently pass true or false.
 No logical change. Signed-off-by: Yongpeng Yang --- fs/f2fs/compress.c |
 8 ++++---- fs/f2fs/data.c | 12 ++++-------- fs/f2fs/f2fs.h | 2 +- fs/f2fs/gc.c
 | 6 +++--- fs/f2fs/inline.c | 4 ++-- fs/f2fs/namei.c | 4 ++-- 6 f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.48 listed in wl.mailspike.net]
X-Headers-End: 1vCKMD-0000cd-2P
Subject: [f2fs-dev] [PATCH] f2fs: change the unlock parameter of
 f2fs_put_page to bool
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Change the type of the unlock parameter of f2fs_put_page to bool.
All callers should consistently pass true or false. No logical change.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/compress.c |  8 ++++----
 fs/f2fs/data.c     | 12 ++++--------
 fs/f2fs/f2fs.h     |  2 +-
 fs/f2fs/gc.c       |  6 +++---
 fs/f2fs/inline.c   |  4 ++--
 fs/f2fs/namei.c    |  4 ++--
 6 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 811bfe38e5c0..716004ba44dc 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -120,7 +120,7 @@ static void f2fs_unlock_rpages(struct compress_ctx *cc, int len)
 }
 
 static void f2fs_put_rpages_wbc(struct compress_ctx *cc,
-		struct writeback_control *wbc, bool redirty, int unlock)
+		struct writeback_control *wbc, bool redirty, bool unlock)
 {
 	unsigned int i;
 
@@ -1202,7 +1202,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 	if (copied)
 		set_cluster_dirty(&cc);
 
-	f2fs_put_rpages_wbc(&cc, NULL, false, 1);
+	f2fs_put_rpages_wbc(&cc, NULL, false, true);
 	f2fs_destroy_compress_ctx(&cc, false);
 
 	return first_index;
@@ -1605,7 +1605,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 			add_compr_block_stat(cc->inode, cc->cluster_size);
 			goto write;
 		} else if (err) {
-			f2fs_put_rpages_wbc(cc, wbc, true, 1);
+			f2fs_put_rpages_wbc(cc, wbc, true, true);
 			goto destroy_out;
 		}
 
@@ -1619,7 +1619,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 	f2fs_bug_on(F2FS_I_SB(cc->inode), *submitted);
 
 	err = f2fs_write_raw_pages(cc, submitted, wbc, io_type);
-	f2fs_put_rpages_wbc(cc, wbc, false, 0);
+	f2fs_put_rpages_wbc(cc, wbc, false, false);
 destroy_out:
 	f2fs_destroy_compress_ctx(cc, false);
 	return err;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1f090c018f1b..daca2a42b20c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3621,8 +3621,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 		folio_lock(folio);
 		if (folio->mapping != mapping) {
 			/* The folio got truncated from under us */
-			folio_unlock(folio);
-			folio_put(folio);
+			f2fs_folio_put(folio, true);
 			goto repeat;
 		}
 	}
@@ -3653,8 +3652,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 
 		folio_lock(folio);
 		if (unlikely(folio->mapping != mapping)) {
-			folio_unlock(folio);
-			folio_put(folio);
+			f2fs_folio_put(folio, true);
 			goto repeat;
 		}
 		if (unlikely(!folio_test_uptodate(folio))) {
@@ -3665,8 +3663,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	return 0;
 
 put_folio:
-	folio_unlock(folio);
-	folio_put(folio);
+	f2fs_folio_put(folio, true);
 fail:
 	f2fs_write_failed(inode, pos + len);
 	return err;
@@ -3722,8 +3719,7 @@ static int f2fs_write_end(const struct kiocb *iocb,
 					pos + copied);
 	}
 unlock_out:
-	folio_unlock(folio);
-	folio_put(folio);
+	f2fs_folio_put(folio, true);
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 	return copied;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 94eb9a2d3a73..32fb2e7338b7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2979,7 +2979,7 @@ static inline void f2fs_folio_put(struct folio *folio, bool unlock)
 	folio_put(folio);
 }
 
-static inline void f2fs_put_page(struct page *page, int unlock)
+static inline void f2fs_put_page(struct page *page, bool unlock)
 {
 	if (!page)
 		return;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 22fe6e2c6d5c..fd8bb0424bf3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1278,7 +1278,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	err = f2fs_submit_page_bio(&fio);
 	if (err)
 		goto put_encrypted_page;
-	f2fs_put_page(fio.encrypted_page, 0);
+	f2fs_put_page(fio.encrypted_page, false);
 	f2fs_folio_put(folio, true);
 
 	f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
@@ -1286,7 +1286,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 
 	return 0;
 put_encrypted_page:
-	f2fs_put_page(fio.encrypted_page, 1);
+	f2fs_put_page(fio.encrypted_page, true);
 put_folio:
 	f2fs_folio_put(folio, true);
 	return err;
@@ -1442,7 +1442,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	f2fs_update_data_blkaddr(&dn, newaddr);
 	set_inode_flag(inode, FI_APPEND_WRITE);
 
-	f2fs_put_page(fio.encrypted_page, 1);
+	f2fs_put_page(fio.encrypted_page, true);
 recover_block:
 	if (err)
 		f2fs_do_replace_block(fio.sbi, &sum, newaddr, fio.old_blkaddr,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 58ac831ef704..e5c6a08b7e4f 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -287,7 +287,7 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	set_inode_flag(inode, FI_DATA_EXIST);
 
 	folio_clear_f2fs_inline(ifolio);
-	f2fs_folio_put(ifolio, 1);
+	f2fs_folio_put(ifolio, true);
 	return 0;
 }
 
@@ -577,7 +577,7 @@ static int f2fs_move_rehashed_dirents(struct inode *dir, struct folio *ifolio,
 	f2fs_i_depth_write(dir, 0);
 	f2fs_i_size_write(dir, MAX_INLINE_DATA(dir));
 	folio_mark_dirty(ifolio);
-	f2fs_folio_put(ifolio, 1);
+	f2fs_folio_put(ifolio, true);
 
 	kfree(backup_dentry);
 	return err;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 68b33e8089b0..07ceed173ffe 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1259,11 +1259,11 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	return 0;
 out_new_dir:
 	if (new_dir_entry) {
-		f2fs_folio_put(new_dir_folio, 0);
+		f2fs_folio_put(new_dir_folio, false);
 	}
 out_old_dir:
 	if (old_dir_entry) {
-		f2fs_folio_put(old_dir_folio, 0);
+		f2fs_folio_put(old_dir_folio, false);
 	}
 out_new:
 	f2fs_folio_put(new_folio, false);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
