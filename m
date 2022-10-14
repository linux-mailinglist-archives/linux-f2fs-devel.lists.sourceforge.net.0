Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EFF5FEB0F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 10:50:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ojGOU-0006vU-OV;
	Fri, 14 Oct 2022 08:50:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hrkanabar@gmail.com>) id 1ojGOC-0006t9-0r;
 Fri, 14 Oct 2022 08:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=noZwzVYPpBsDl5CECnOrP5rsHRqU5K36GF5tioVqhvo=; b=VJP+4HejsMcY+WVh5Tq71jLCJq
 j/IK/f60bO7iIAxhGhmqjSA9Aa+cD8MbrweP9ds8RysI9O/e56jQ4FNEn5TmTi5+Kjm4ukF5TSe51
 OPywC2La4PB8zBIk6mdRu+kG6HP0MQ6v3Ztu4Mjt8X/XZ1Qp5oZTP+yLCPJLzvCRaJfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=noZwzVYPpBsDl5CECnOrP5rsHRqU5K36GF5tioVqhvo=; b=Cg+u39YEjGGN9ArVIHoUAYHrXK
 trhYKnGg+YzXQ3+Dguy5kTNIViVs4LVgYsjy28l66jddHdnebGKG7YRh8lSgsHqfepQkg/rjEdpyD
 UIeM9J6WpJMpwz0RpRxFyc7mdTiEROf525gHzAgYCOIPC4wtgRqT25vkXISE3hJrXhKs=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ojGOB-003OLH-Df; Fri, 14 Oct 2022 08:49:55 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 c9-20020a05600c100900b003c6da0f9b62so2546417wmc.1; 
 Fri, 14 Oct 2022 01:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=noZwzVYPpBsDl5CECnOrP5rsHRqU5K36GF5tioVqhvo=;
 b=FQxuL83NlA1dTcPa+tFZaBKev/381N92shWjcokB6Cq01pDQV8v3dKmLzskweZmrg7
 Jz6tAKO28qyNZhcKa1omEDpp9WjDAaZzKcErysdgfT7V0um+TyLLNk2Cij8EO/EsRY7j
 mM4PW1pXSuwF/LnXS5kzwEDyOA+AX2w5cE1DhAa9FuWqFFyXvj/NZ+KCCIthXLghAk0u
 a86+6OK4+3IB+C4bjSyDRdPIS9Ojxhjig1vaZtK+KEGWoBJunSCvCvMdY3KFEsTnmGGH
 vhkRbzjwDO4lnOX6LHYeQne4mhhiyroqBB3oVZA+u+phCefTTmPtrCeo3CV7uh6afgQ3
 Zvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=noZwzVYPpBsDl5CECnOrP5rsHRqU5K36GF5tioVqhvo=;
 b=XccDuX4tqglyNS268qzjJbMpv7c4CVh0MunW7ON7D56z5OCVt+lSPZRHuo3hR4ylH/
 Y6YtBTeYhLQv/iP3T1m+q6mGGM2VNu0s2inmnoVUK52BO2T1ILkrfnGO35a1OaCvishp
 k0EDZLIdXQ4qQku9v4uuL7xOy8XRM4V8fwMHwYRgh20326vv69NADjpXONwERNXSCAS+
 2gh/b17R3pczYkFgKFZZWyhQEQvDPwHwWndsPeFmCJhmbf6XJfgnbUsKPNQzOOObaapj
 uPZGm4AlONY8R5b/lssDRfLl1etrjmvVKQLdyvC9ccgT7nZ6tQWpyXxX+FH3sIukkNgX
 peXw==
X-Gm-Message-State: ACrzQf1WneDTMkrLW3s0iXytcrYHNXGJdqqZrF3am6083sOMaIlB03te
 V+/0wM8H22ZwiolWT0x56bY=
X-Google-Smtp-Source: AMsMyM6LLqWRPo+UV+uMhtdyCnYVRTjSPNIcPtvijlT4VjYFItZbopCVgihpcI5ZnJzpKiPc+FN/Aw==
X-Received: by 2002:a05:600c:288:b0:3c6:c44a:1d30 with SMTP id
 8-20020a05600c028800b003c6c44a1d30mr9545255wmk.46.1665737388927; 
 Fri, 14 Oct 2022 01:49:48 -0700 (PDT)
Received: from hrutvik.c.googlers.com.com
 (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
 by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003c6c4639ac6sm1547372wmz.34.2022.10.14.01.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:49:48 -0700 (PDT)
From: Hrutvik Kanabar <hrkanabar@gmail.com>
To: Hrutvik Kanabar <hrutvik@google.com>
Date: Fri, 14 Oct 2022 08:48:33 +0000
Message-Id: <20221014084837.1787196-4-hrkanabar@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221014084837.1787196-1-hrkanabar@gmail.com>
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Hrutvik Kanabar When `DISABLE_FS_CSUM_VERIFICATION`
 is enabled, bypass checksum verification. Signed-off-by: Hrutvik Kanabar ---
 fs/btrfs/check-integrity.c | 3 ++- fs/btrfs/disk-io.c | 6 ++++--
 fs/btrfs/free-space-cache.c
 | 3 ++- fs/btrfs/inode.c | 3 ++- fs/btrfs/scrub.c | 9 ++++++--- 5 file [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hrkanabar[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.41 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ojGOB-003OLH-Df
Subject: [f2fs-dev] [PATCH RFC 3/7] fs/btrfs: support
 `DISABLE_FS_CSUM_VERIFICATION` config option
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, kasan-dev@googlegroups.com,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Anton Altaparmakov <anton@tuxera.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Aleksandr Nogikh <nogikh@google.com>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hrutvik Kanabar <hrutvik@google.com>

When `DISABLE_FS_CSUM_VERIFICATION` is enabled, bypass checksum
verification.

Signed-off-by: Hrutvik Kanabar <hrutvik@google.com>
---
 fs/btrfs/check-integrity.c  | 3 ++-
 fs/btrfs/disk-io.c          | 6 ++++--
 fs/btrfs/free-space-cache.c | 3 ++-
 fs/btrfs/inode.c            | 3 ++-
 fs/btrfs/scrub.c            | 9 ++++++---
 5 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/fs/btrfs/check-integrity.c b/fs/btrfs/check-integrity.c
index 98c6e5feab19..eab82593a325 100644
--- a/fs/btrfs/check-integrity.c
+++ b/fs/btrfs/check-integrity.c
@@ -1671,7 +1671,8 @@ static noinline_for_stack int btrfsic_test_for_metadata(
 		crypto_shash_update(shash, data, sublen);
 	}
 	crypto_shash_final(shash, csum);
-	if (memcmp(csum, h->csum, fs_info->csum_size))
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    memcmp(csum, h->csum, fs_info->csum_size))
 		return 1;
 
 	return 0; /* is metadata */
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index a2da9313c694..7cd909d44b24 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -184,7 +184,8 @@ static int btrfs_check_super_csum(struct btrfs_fs_info *fs_info,
 	crypto_shash_digest(shash, raw_disk_sb + BTRFS_CSUM_SIZE,
 			    BTRFS_SUPER_INFO_SIZE - BTRFS_CSUM_SIZE, result);
 
-	if (memcmp(disk_sb->csum, result, fs_info->csum_size))
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    memcmp(disk_sb->csum, result, fs_info->csum_size))
 		return 1;
 
 	return 0;
@@ -494,7 +495,8 @@ static int validate_extent_buffer(struct extent_buffer *eb)
 	header_csum = page_address(eb->pages[0]) +
 		get_eb_offset_in_page(eb, offsetof(struct btrfs_header, csum));
 
-	if (memcmp(result, header_csum, csum_size) != 0) {
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    memcmp(result, header_csum, csum_size) != 0) {
 		btrfs_warn_rl(fs_info,
 "checksum verify failed on logical %llu mirror %u wanted " CSUM_FMT " found " CSUM_FMT " level %d",
 			      eb->start, eb->read_mirror,
diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index f4023651dd68..203c8a9076a6 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -574,7 +574,8 @@ static int io_ctl_check_crc(struct btrfs_io_ctl *io_ctl, int index)
 	io_ctl_map_page(io_ctl, 0);
 	crc = btrfs_crc32c(crc, io_ctl->orig + offset, PAGE_SIZE - offset);
 	btrfs_crc32c_final(crc, (u8 *)&crc);
-	if (val != crc) {
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    val != crc) {
 		btrfs_err_rl(io_ctl->fs_info,
 			"csum mismatch on free space cache");
 		io_ctl_unmap_page(io_ctl);
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index b0807c59e321..1a49d897b5c1 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -3434,7 +3434,8 @@ int btrfs_check_sector_csum(struct btrfs_fs_info *fs_info, struct page *page,
 	crypto_shash_digest(shash, kaddr, fs_info->sectorsize, csum);
 	kunmap_local(kaddr);
 
-	if (memcmp(csum, csum_expected, fs_info->csum_size))
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    memcmp(csum, csum_expected, fs_info->csum_size))
 		return -EIO;
 	return 0;
 }
diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
index f260c53829e5..a7607b492f47 100644
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@ -1997,7 +1997,8 @@ static int scrub_checksum_data(struct scrub_block *sblock)
 
 	crypto_shash_digest(shash, kaddr, fs_info->sectorsize, csum);
 
-	if (memcmp(csum, sector->csum, fs_info->csum_size))
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    memcmp(csum, sector->csum, fs_info->csum_size))
 		sblock->checksum_error = 1;
 	return sblock->checksum_error;
 }
@@ -2062,7 +2063,8 @@ static int scrub_checksum_tree_block(struct scrub_block *sblock)
 	}
 
 	crypto_shash_final(shash, calculated_csum);
-	if (memcmp(calculated_csum, on_disk_csum, sctx->fs_info->csum_size))
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    memcmp(calculated_csum, on_disk_csum, sctx->fs_info->csum_size))
 		sblock->checksum_error = 1;
 
 	return sblock->header_error || sblock->checksum_error;
@@ -2099,7 +2101,8 @@ static int scrub_checksum_super(struct scrub_block *sblock)
 	crypto_shash_digest(shash, kaddr + BTRFS_CSUM_SIZE,
 			BTRFS_SUPER_INFO_SIZE - BTRFS_CSUM_SIZE, calculated_csum);
 
-	if (memcmp(calculated_csum, s->csum, sctx->fs_info->csum_size))
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    memcmp(calculated_csum, s->csum, sctx->fs_info->csum_size))
 		++fail_cor;
 
 	return fail_cor + fail_gen;
-- 
2.38.0.413.g74048e4d9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
