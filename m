Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F2283E5D3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jan 2024 23:49:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTV0d-0000WX-3E;
	Fri, 26 Jan 2024 22:49:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3yC-0ZQYKAC0MaXbNWPXXPUN.LXV@flex--drosen.bounces.google.com>)
 id 1rTV0a-0000WC-CA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 22:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VvtxBMBvF/R8LHmcH12L5RxNotJBNU7EMF56KO0LBm0=; b=CkScaO9vcb86fn8VimALsndpRB
 17SFM2hKoCWIyqXOVFL97RsAkDcKVXC6OPJ9kkS5x9lNIeDl8ePC0zbdjAV+Ii2GLShkwyaR0uQSW
 ygAjKx6W/hews1RQN7sZexBwhmPoe4dC4N+BQWHYWIkrzUOr0PXH5hOIS5D+199OEwCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VvtxBMBvF/R8LHmcH12L5RxNotJBNU7EMF56KO0LBm0=; b=i
 VEgOO6U/kUIDvQIcNUmgPzglBUXnvNugXWyKdWQT/FCbyN6OYOyEmTzd0C9jilT9Lm5/U4ak6kkaD
 zzQw08ZxLKSk0Pbr88+/1b55FIXKSC8S7qg468JeFGHoqfeKoiG4Bp72PmszB5+n0JShLkQQMAQYO
 PCThKEnQ/bLhD8k0=;
Received: from mail-vk1-f202.google.com ([209.85.221.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rTV0Z-0002Qp-Fv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 22:49:12 +0000
Received: by mail-vk1-f202.google.com with SMTP id
 71dfb90a1353d-4bddd10a870so600010e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jan 2024 14:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1706309341; x=1706914141;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VvtxBMBvF/R8LHmcH12L5RxNotJBNU7EMF56KO0LBm0=;
 b=TyG6m8w51Gg8vS4I5AGdVhwuVko8AdfxEJzmJUfT6IS6QFvaX8qKbtJPskGSTe1lw4
 Xw2y3ll8lZPEUyPfyEfGHbUZQlpj6rovec6MujOVJyf+t4SQTefhXbNf7L+mw20+v98v
 Z/D467XpgKdESsjG0haGKg1JeP17gGvazP7BdFmFk++wMG+q+TaD4gq+M41ZHVAQp2+N
 IHGlpPY9HF4N2/fI0p737O0uOasuy1Mm/GJhylUqNf50DECxHdAlA2AuACP2Ts2EjIyJ
 Siwsei/iQR8UKDzj/n8CGwaPH/gCAt+Vz3BQAVu91arelBJ8RR8S/DntFc0m8wmG4CTc
 5U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706309341; x=1706914141;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VvtxBMBvF/R8LHmcH12L5RxNotJBNU7EMF56KO0LBm0=;
 b=sD65n5BIWStS9MT541ngxrPMuoXtSZql0a6mPvXYIWK/XfDQR9gtX1Q3N0YC5Rirx7
 oQCeE0zPmEXRk1FgVroBaT25GUktT1xouEAUexMSO7ZDMarRw5Kpj4g6z5kIgE57Lyk9
 Nj+kN/sz7Q26vf+3puVE74zInOMzI0nWxWUgKUeWiM2lZyF120sdarfdk6CZ2CsSzvAs
 1KEKuoHgkQXbKc6b85ZLtFlT/UmXYBe/KuWTPUaZS3jtfJqR+Vbfap3FiTPGaD3jQ4As
 boI/VcfEQF+PkdSQ22DeS2RnQAOAFRD9BPbrFTN1g12Kxh/KWCjRbQDE13xGskhd8kAO
 H/Qg==
X-Gm-Message-State: AOJu0Yw5qm3Uq1i6z3VeEHo2Yp+KZlIcbnQ0AIxcKkg/puRBJN+BDbtG
 Xpg5p1CsTMYauRXtL7D/HOeefl50zfhXL5HjM3577PcmjRyx35SjGv36/2soTN2BepCKJrsoLDY
 nN0NbHW5aN2SOuaLcAXgZuhDZvedrnOhs7p6r/tHCzahxsIENZHn8OJHuCp6iYonVxhwHy61bQu
 xCXHVxrE5vzFBIZZJAUuvum7XCAQ4Sb61dBWh4HK5IMFvxDINSFrf1lw==
X-Google-Smtp-Source: AGHT+IEMegmqSNXm5Jg7+9YLBvuM7Bq5JW7GiWyZBvHNzzCTCoYvJQotPtwfPZeURUL+nYLRZVLApYrbxk8=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:2056:76c7:fa0d:88ae])
 (user=drosen job=sendgmr) by 2002:a0d:df93:0:b0:602:c1e2:c6f7 with SMTP id
 i141-20020a0ddf93000000b00602c1e2c6f7mr532395ywe.2.1706307528006; Fri, 26 Jan
 2024 14:18:48 -0800 (PST)
Date: Fri, 26 Jan 2024 14:18:44 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240126221845.265859-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since we may not know the block size when initializing sparse
 files,
 we should assume that the sparse file's blocksize is correct. Signed-off-by:
 Daniel Rosenberg <drosen@google.com> --- fsck/mount.c | 20
 +++++++++++++-------
 lib/libf2fs_io.c | 11 +++++++---- 2 files changed, 20 insertions(+),
 11 deletions(-)
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1rTV0Z-0002Qp-Fv
Subject: [f2fs-dev] [PATCH 1/2] libf2fs: Accept Sparse files with non 4K
 Blocksize
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since we may not know the block size when initializing sparse files, we
should assume that the sparse file's blocksize is correct.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fsck/mount.c     | 20 +++++++++++++-------
 lib/libf2fs_io.c | 11 +++++++----
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 30c6228..7bbec3f 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -995,6 +995,10 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 		return -1;
 
 	blocksize = 1 << get_sb(log_blocksize);
+	if (c.sparse_mode && F2FS_BLKSIZE != blocksize) {
+		MSG(0, "Invalid blocksize (%u), does not equal sparse file blocksize (%u)",
+			F2FS_BLKSIZE);
+	}
 	if (blocksize < F2FS_MIN_BLKSIZE || blocksize > F2FS_MAX_BLKSIZE) {
 		MSG(0, "Invalid blocksize (%u), must be between 4KB and 16KB\n",
 			blocksize);
@@ -3965,20 +3969,22 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 	sbi->active_logs = NR_CURSEG_TYPE;
 	ret = validate_super_block(sbi, SB0_ADDR);
 	if (ret) {
-		/* Assuming 4K Block Size */
-		c.blksize_bits = 12;
-		c.blksize = 1 << c.blksize_bits;
-		MSG(0, "Looking for secondary superblock assuming 4K Block Size\n");
+		if (!c.sparse_mode) {
+			/* Assuming 4K Block Size */
+			c.blksize_bits = 12;
+			c.blksize = 1 << c.blksize_bits;
+			MSG(0, "Looking for secondary superblock assuming 4K Block Size\n");
+		}
 		ret = validate_super_block(sbi, SB1_ADDR);
-		if (ret) {
+		if (ret && !c.sparse_mode) {
 			/* Trying 16K Block Size */
 			c.blksize_bits = 14;
 			c.blksize = 1 << c.blksize_bits;
 			MSG(0, "Looking for secondary superblock assuming 16K Block Size\n");
 			ret = validate_super_block(sbi, SB1_ADDR);
-			if (ret)
-				return -1;
 		}
+		if (ret)
+			return -1;
 	}
 	sb = F2FS_RAW_SUPER(sbi);
 	c.cache_config.num_cache_entry = num_cache_entry;
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index d76da83..97c91ef 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -662,14 +662,17 @@ int f2fs_init_sparse_file(void)
 		if (!f2fs_sparse_file)
 			return -1;
 
+		c.blksize = sparse_file_block_size(f2fs_sparse_file);
+		c.blksize_bits = log_base_2(c.blksize);
+		if (c.blksize_bits == -1) {
+			MSG(0, "\tError: Sparse file blocksize not a power of 2.\n");
+			return -1;
+		}
+
 		c.device_size = sparse_file_len(f2fs_sparse_file, 0, 0);
 		c.device_size &= (~((uint64_t)(F2FS_BLKSIZE - 1)));
 	}
 
-	if (sparse_file_block_size(f2fs_sparse_file) != F2FS_BLKSIZE) {
-		MSG(0, "\tError: Corrupted sparse file\n");
-		return -1;
-	}
 	blocks_count = c.device_size / F2FS_BLKSIZE;
 	blocks = calloc(blocks_count, sizeof(char *));
 	if (!blocks) {

base-commit: bf5100606d63f6928799846b7322aa6f3f158bcf
-- 
2.43.0.429.g432eaa2c6b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
