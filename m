Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCAC5FEAFE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 10:50:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ojGOM-0006WH-Tv;
	Fri, 14 Oct 2022 08:50:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hrkanabar@gmail.com>) id 1ojGOI-0006Vv-Uy;
 Fri, 14 Oct 2022 08:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gOV3h57ut5GHhGlnLsxkEHBnkvFbonX9ORLLuFusyi0=; b=IMaD6jP4sKoY1qJat0hJBlUA8v
 7gL+rfYWe559VZxJSEUGRoHQJMggfRRrWU11MJ4VsQcato8lKTxywy8u8tbqTd6N5Kp/KKw0e7I/g
 PPfvCe9UtHSRZOXMlNhtxGi0/hlTNQ/jFn5DZir9NtJ2pRpZSrtITtubxcwMmjT8AI0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gOV3h57ut5GHhGlnLsxkEHBnkvFbonX9ORLLuFusyi0=; b=bBLF6wpsk2lRbc9uGkTdzGdEyk
 voXPssnkBWWIqWgI/VDv9GPJW2GuIEVvYUDx+nMoXVPI0JDKll65azgW9jOFaFmZU0yHv7skSB2GK
 lK2JiZb4QOFXJbekVdtDfsAfLQZNTdaeBea53SvvCeWpDgx4Kn14NtlhAb+ChrqM1w6U=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ojGOG-0002JR-AK; Fri, 14 Oct 2022 08:50:01 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 c9-20020a05600c100900b003c6da0f9b62so2546531wmc.1; 
 Fri, 14 Oct 2022 01:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOV3h57ut5GHhGlnLsxkEHBnkvFbonX9ORLLuFusyi0=;
 b=GfG0sfEgh2ptierbWCnoguBubKf8JDmmicxf1uJSpFpGObOsFWBqAhZpEYJ5Krl+yo
 ZD1cwtaOtRSGc/If6NW2e99cfjHy447Mfkim3JBoO6lFHYVO43xdxReqY6l8QyFBn4Qc
 tGp1dAr825o3wC1fJ3+NYRhGU424uQwhoZSV5IZH/fycyAueUF0kXNr3kuIlzRScRjEM
 aqxVZim71FxWOLPQbEMG0l3htKZad0jBeYIJY2DLYtsbqGW8wiG+xF4GplnsrmQkllp0
 oM0aAGnq+3SiJfldcLJyIp7maRrgbF8Lv6EtCNGsqquNz1rjsbw3Zxsk5zbVXT/52SAq
 oChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOV3h57ut5GHhGlnLsxkEHBnkvFbonX9ORLLuFusyi0=;
 b=FlH5puwwQUbX5h+yOYxd/SDAtMbGywhph8SuRGmIFJfFOuAmu6uClV83tUN25KCeVR
 SUMtApefhSaTNMdVoIrWa+L/l0wtsllVgJHW7YKfYXI4/j09HJ3g1Te0e2oBZfTuhbGw
 n64kgnGSJf3SUI8gmNmqZTBI8XJDZTHbqvOrPThL79WtrmYRnm98zHXOdYEz9rzFkwCj
 f4Ir//RRziPT7W6ntZY+SFp59JoyCGgB1gDOpSuIEmfR9LzI9JtQ2ZH4i6ywQSNDp4C3
 bLiIqeDDscnrbQM+gg5enzD9zoFRL+blWNSLSqurS0BKWoxgmHzQIkmJu3x9mRgWQfOf
 yUHw==
X-Gm-Message-State: ACrzQf22iqiCbS1er38PiwBtmpzrcEjA9QNWegXtyq5O1e3W3LcA5FBo
 VwSaon7ZEOgvCu8F9MTcjek=
X-Google-Smtp-Source: AMsMyM77yv8Pg3D5oDIyozFj8+3/IZB1l6YKqrDliEThMChfauLgTj828aJxH3GHPZOHomGULwIXmw==
X-Received: by 2002:a05:600c:4f93:b0:3b4:c026:85a1 with SMTP id
 n19-20020a05600c4f9300b003b4c02685a1mr9583025wmq.39.1665737394358; 
 Fri, 14 Oct 2022 01:49:54 -0700 (PDT)
Received: from hrutvik.c.googlers.com.com
 (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
 by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003c6c4639ac6sm1547372wmz.34.2022.10.14.01.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:49:54 -0700 (PDT)
From: Hrutvik Kanabar <hrkanabar@gmail.com>
To: Hrutvik Kanabar <hrutvik@google.com>
Date: Fri, 14 Oct 2022 08:48:37 +0000
Message-Id: <20221014084837.1787196-8-hrkanabar@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221014084837.1787196-1-hrkanabar@gmail.com>
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Hrutvik Kanabar When `DISABLE_FS_CSUM_VERIFICATION`
 is enabled, bypass checksum verification. Signed-off-by: Hrutvik Kanabar ---
 fs/f2fs/checkpoint.c | 3 ++- fs/f2fs/compress.c | 3 ++- fs/f2fs/f2fs.h |
 2 ++ fs/f2fs/inode.c | 3 +++ 4 files changed, 9 insertions(+), 2 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.41 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hrkanabar[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ojGOG-0002JR-AK
Subject: [f2fs-dev] [PATCH RFC 7/7] fs/f2fs: support
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
 fs/f2fs/checkpoint.c | 3 ++-
 fs/f2fs/compress.c   | 3 ++-
 fs/f2fs/f2fs.h       | 2 ++
 fs/f2fs/inode.c      | 3 +++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 0c82dae082aa..cc5043fbffcb 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -864,7 +864,8 @@ static int get_checkpoint_version(struct f2fs_sb_info *sbi, block_t cp_addr,
 	}
 
 	crc = f2fs_checkpoint_chksum(sbi, *cp_block);
-	if (crc != cur_cp_crc(*cp_block)) {
+	if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+	    crc != cur_cp_crc(*cp_block)) {
 		f2fs_put_page(*cp_page, 1);
 		f2fs_warn(sbi, "invalid crc value");
 		return -EINVAL;
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d315c2de136f..d0bce92dbf38 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -772,7 +772,8 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 		u32 provided = le32_to_cpu(dic->cbuf->chksum);
 		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
 
-		if (provided != calculated) {
+		if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+		    provided != calculated) {
 			if (!is_inode_flag_set(dic->inode, FI_COMPRESS_CORRUPT)) {
 				set_inode_flag(dic->inode, FI_COMPRESS_CORRUPT);
 				printk_ratelimited(
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..b27f1ec9b49f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1976,6 +1976,8 @@ static inline u32 f2fs_crc32(struct f2fs_sb_info *sbi, const void *address,
 static inline bool f2fs_crc_valid(struct f2fs_sb_info *sbi, __u32 blk_crc,
 				  void *buf, size_t buf_size)
 {
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION))
+		return true;
 	return f2fs_crc32(sbi, buf, buf_size) == blk_crc;
 }
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9f0d3864d9f1..239bb08e45b1 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -181,6 +181,9 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page)
 #endif
 		return true;
 
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION))
+		return true;
+
 	ri = &F2FS_NODE(page)->i;
 	provided = le32_to_cpu(ri->i_inode_checksum);
 	calculated = f2fs_inode_chksum(sbi, page);
-- 
2.38.0.413.g74048e4d9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
