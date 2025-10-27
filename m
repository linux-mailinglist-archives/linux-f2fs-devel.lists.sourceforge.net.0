Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1422C0DB93
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 13:57:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a1ufrlXebR90bvxZSDa4n+GyQ+TRArgZMNGxiD0dn9M=; b=Cytx6UQeYSxBRKfPxFc/Unu/0d
	osoJMJ+5o9joXZhPEEsSNH+PJEH4SE4TAn02PNvKD6XZX7ylDH9J9fY/niaDWs2PLflCHEIKNqwfv
	n4biTIIJ/VfBCAngvoTNGbM34EuoHXCAE8550aikmWsuqBl2T/H1x0cZ67H6CBPx3fVA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDMmb-0003Cs-6l;
	Mon, 27 Oct 2025 12:57:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vDMlq-0003Bw-Kz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 12:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=peDaTjQYA7YgCfn13hg53lbAEYUIBJFyu6U+34GyXig=; b=EsB/MVpFsqGJpgJ8JdcPJO0Riy
 zKXlt6NvfVI/tgiuUb7LryJlOrsFgWvuW68HfQnJr/MLxLklD2Wgroa83jOX/Up7yGooGYQh8Iapv
 BDMANgXrIMS5OgGGheR+Jo7ggsm/NA5ZxWLKvCcHYJDjHGy1JnVeiH/M4WIC+n+IaHD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=peDaTjQYA7YgCfn13hg53lbAEYUIBJFyu6U+34GyXig=; b=X
 Mi16P39Vuvt+wWz0sP3YHxOy+G90+T5txY2j4jUnOLvS+0NkfVxP30rNkyFKZ1iv/Www3zfKvuMWL
 gxvl+/fLRwE/p6X1j2vBLWwDDteL9xztztnCRT58vy3ElsG1i8j5ptFtF1XfOYOrIGu37iE1Tpwea
 3FqVO+hiyGT7vdTI=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vDMlq-0001e1-4z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 12:56:22 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-33ba5d8f3bfso4038153a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Oct 2025 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761569771; x=1762174571; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=peDaTjQYA7YgCfn13hg53lbAEYUIBJFyu6U+34GyXig=;
 b=PXYTTw1qyopIP7ddhpjnhoEiN+8VS7wRtmsQEDKR7cnoHd3pxkd3yVsVrhQ0xGiyHl
 Hfr9SrEjFXarbk9fpPFs9CQW+PX6gxGNerS6TpavuSAN7DYedlFCzOIzpXrUi1li7Opd
 6YmnND/J67DbSs7VfbUkNMPA7bNGoWZjD2u0Zyl7dH6Evx9mm7YWsCLU3aWA8GRQWAEh
 8B0cobnKJC6J1bB85PDnUN/c6oRH7BCA0wule45AxpkVlfUbdM2JZtz/A4U3ynBFDb1w
 l4tZJGrSWvt3XMb+W47udULj6jzqNwlXuRBw3CwqHpkBso2FpyBGe8Bqs6ltzlTJXNHM
 ucWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761569771; x=1762174571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=peDaTjQYA7YgCfn13hg53lbAEYUIBJFyu6U+34GyXig=;
 b=uswiDCPWlGxTdcZJTGuS+X41hbpsf558Aao2PshycHoBG1P/ndAE6S+jjVZW639UYO
 r9dB3wSH80oMioetiQl5fhCEMWphhvYS0s+Kt6DN3E09eaeU/c2ItsdO2spxhXrcLL4W
 rRkMquwpOCyWVH82tHXdSIxilzF8+cZH6kn/q5R8XfxRIDH4a5CKkiVA+yxCSJj5P9Fr
 a/ZJ+Tm0LtMbE4IDW9d1G0MzghmsLGLChXqzgKKLks6adX2+d9yd1e6g2m033/3M8lrT
 kkN43qOfOCPuXymYJdP97lJddZJj7Jvn247Wbx+W3HSqfyBuiG5dmOi7+lm/UJHt2nkK
 OHRA==
X-Gm-Message-State: AOJu0YwmcmCcfbXFv9eMxDH5PrVHC+a0fRQTeymTV/3mqAOAPvpxDOua
 o0mJLwwo4wB1fOdEPf6o4eIv3TJ3CS3y64BMNNcUXYT6PCn+fmhvD0en/wJfRHywbAY=
X-Gm-Gg: ASbGnctTE0VLnPKTxMydGvG9Cj6bJULTYt5sdyaYfFmmQlw//CeJJ2YdQxb/3SXcsil
 QtcKER+OqkyYQPfMwQmZX9GWjW6/T1ULvx8lXgmPNelBfGkHveixXYyraUmXeU/k7c0F8Oq2Myr
 dlKxI43UnmiUoZ20lss2X+28JDR5xJSo1AgsZgmncXJ+LgAer7IqXsrdgAEOyCuy7hHHbzq7KLu
 3Msya1u5FduW+7vznPeWgE5yaiFBv/QvUVjfl8Z7VUfWH6HZYPSuuz9aj2TAd/sZEDjw4TijQug
 UHcRkgfqGD82D1V/GrDaU2ytaq8nYj2mkMaIU1pacfTEpZ2vnS0rkZO352kFAu2Mhajp6BI7qR5
 yJwGrehCKZPQ7k8K8jJU/SqVFS1Lrs8Bsx57sX9v5dFY/NtFx2OuFf8xG3mF9DOJdlJtmap4uDP
 4G1cUmN4ExotdwFokwcbM0Xt2iXaD6/VsiegBiybO2MzJX7nLqxoq1WrB5eA==
X-Google-Smtp-Source: AGHT+IFprgMMIsfCK+QpBRdr91IiqTF/fDNiEfgXeEzCGUPfHF06jiyonh0uWMVMUE1k8qntuILrmw==
X-Received: by 2002:a17:90b:5290:b0:32e:a54a:be5d with SMTP id
 98e67ed59e1d1-33bcf85abbfmr40812115a91.2.1761569771269; 
 Mon, 27 Oct 2025 05:56:11 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fed81c8e0sm8566277a91.18.2025.10.27.05.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 05:56:11 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 27 Oct 2025 20:55:43 +0800
Message-ID: <20251027125543.633506-1-yangyongpeng.storage@gmail.com>
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
 No logical change. Signed-off-by: Yongpeng Yang --- v2: - Avoid calling
 f2fs_folio_put()
 when folio->mapping is NULL. --- fs/f2fs/compress.c | 8 ++++----
 fs/f2fs/data.c
 | 6 ++---- fs/f2fs/f2fs.h | 2 +- fs/f2fs/gc.c | [...] 
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vDMlq-0001e1-4z
Subject: [f2fs-dev] [PATCH v2] f2fs: change the unlock parameter of
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
v2:
- Avoid calling f2fs_folio_put() when folio->mapping is NULL.
---
 fs/f2fs/compress.c | 8 ++++----
 fs/f2fs/data.c     | 6 ++----
 fs/f2fs/f2fs.h     | 2 +-
 fs/f2fs/gc.c       | 6 +++---
 fs/f2fs/inline.c   | 4 ++--
 fs/f2fs/namei.c    | 4 ++--
 6 files changed, 14 insertions(+), 16 deletions(-)

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
index 1f090c018f1b..047230379680 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3665,8 +3665,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	return 0;
 
 put_folio:
-	folio_unlock(folio);
-	folio_put(folio);
+	f2fs_folio_put(folio, true);
 fail:
 	f2fs_write_failed(inode, pos + len);
 	return err;
@@ -3722,8 +3721,7 @@ static int f2fs_write_end(const struct kiocb *iocb,
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
