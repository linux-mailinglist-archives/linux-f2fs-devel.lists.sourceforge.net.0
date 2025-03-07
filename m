Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB294A56DE1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 17:36:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqagB-00026g-MW;
	Fri, 07 Mar 2025 16:36:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jyh429@gmail.com>) id 1tqag9-00026S-QH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 16:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3/1TblqPLns6jPBBvXv/kgUjFkYTE2ZlCuQ4AlF1Mc=; b=P6fqd6MDh61YbAB5pWuednoFm4
 A2v4NuMOv///Y/rA1u7P2xxkT7aBCJYnXA8FYkdiiUzCPmran8AqBSaSm99Sq5TdKoO5aQ7yCLsmJ
 lofnH4pfzeSyMIXqhO13mS3OYHw8buFYMCxjn5mRiacCmJEGKDZkIjKvkKkYKKuLrVC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T3/1TblqPLns6jPBBvXv/kgUjFkYTE2ZlCuQ4AlF1Mc=; b=e
 YWMqN06fsZ2TLuuRWc0j5zmxu8ZGYDxCJOfXn1N6kuGDgxHlyFcRz2t9yydAc7vu5a3oV6/H3Wi3q
 jLWUoLdD7vM9IP+X9x/FzBnudL3sCCFVvSvS+iECDuyEjQAG0H5Xg/z9ihSrsKD1lIVtHqkDgOCmv
 0xrtviUoI0W5+f/I=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tqZ8T-0002mJ-N5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 14:57:15 +0000
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2fecba90cc3so4022667a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 07 Mar 2025 06:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741359428; x=1741964228; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T3/1TblqPLns6jPBBvXv/kgUjFkYTE2ZlCuQ4AlF1Mc=;
 b=KrNsntAokBsBBqnfz63Zwf3TSMPLJoma+s1faiKk9Z1EnBbNBKHHuuM79NE4sxb//Y
 6rXF2yIh2FiizRFuwXoK1T0GNqpF6AwnyeAmd33VfMyF6eUprvlHHDf6yUqFv1wA7bOJ
 by7oj3sChHS4efC6fKj6y/YmBLwRs4Qe6r6JaZDdZvWrgzfR9gr+B4qNpXO/w0795Kk1
 +svbp1GHCfBjnoYNV9S1dVZs2vrGdefLIE3vX1y4FuBOUWk/LSkTv3BltszUTE2whNVm
 xKENk81GfdofxQc3NuAYfDvwxRWmXimZq3jMbApPiE+UWsFbniql5kXe19dK2B6jTyGZ
 bCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741359428; x=1741964228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T3/1TblqPLns6jPBBvXv/kgUjFkYTE2ZlCuQ4AlF1Mc=;
 b=O09TkmaaUS1IgISLBBx7y30dyXQ7nxUXjW+CJGl+N3d5oh7rg1vyrZRhvPb1jJaRdF
 wzQ/qqUXc4+9m2Atm1LPvsh46I8sYLcKA+A4ufU5czRjsNjGFvO6NNSLuuSAbhiCX7ef
 f5vNY1dIc1M9awN4rpnv6md/gFOrS7jX+5JYgH0c1S1+KqzAsDcAAWnLgO41azbnlGM8
 DIPpK2OrUuqiokl1x44QV40cpB+D5Cbi2OpMOx5DIQEsLr6l01OUGo4NoYzv6QDyzsmd
 lK0a+08YvT/IdbvcBG9ZD6fI7CEmfd8QO2UTYAQ5LYPiyqVCljhFFRI7Ka3z75wiU0cI
 IKjw==
X-Gm-Message-State: AOJu0YwjPGmU8JhZ6b47c1WvRSJ/r3VSn1ABxJMtFArX456BlX1m3/WK
 zdYhYp163gGNu5aGvfDZOeA3LrQkzoHaqZSYv21IV+n8WFnJQHvZ
X-Gm-Gg: ASbGncvspzlBupghV7gt7iL6fDLRDj/cyoR2HZsJUJUojfijFTcuQuNezKRjxBaspfi
 NIdhZVcJKIhlxXhXNptdDGvzo989YWtIkrG0FNwNUsTQMqcicq+orN/HFoNDwPGtkJxlIobI7/C
 pXugFionwbQAKfqQ70x8uoH72yqK4XoXbZA8CZ1kzKuNVjg4ZLj3v20/eVzKlV+/e73twF5JBk/
 xPeyofJq2v4sn0ejG//b7V8ERVFh7GudWRTGdAJgIW5X+Df2u7yajbMIvAgJzBkKqqnU2ZGjYRd
 JvsxUo5KiXATgbc8QuzWtxLclUdy/Y4Ylyxs1ZB8cZppBsaeJnSSsi/FgCCFCdHUsdwh8c52uQ=
 =
X-Google-Smtp-Source: AGHT+IGBMkybK8LNpELvScIet/VbiDV1S6TPQmThy3Vq2qoHJxC3y1ofM+O+wkhBnBKHMhYfwdPVwQ==
X-Received: by 2002:a17:90b:35cd:b0:2ff:6608:78cd with SMTP id
 98e67ed59e1d1-2ff7ce632a3mr6394441a91.9.1741359427882; 
 Fri, 07 Mar 2025 06:57:07 -0800 (PST)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff6935339dsm3118754a91.15.2025.03.07.06.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 06:57:07 -0800 (PST)
From: Yohan Joung <jyh429@gmail.com>
X-Google-Original-From: Yohan Joung <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Date: Fri,  7 Mar 2025 23:56:50 +0900
Message-Id: <20250307145650.568-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: this is unnecessary when we know we are overwriting already
 allocated blocks and the overhead of starting a transaction can be significant
 especially for multithreaded workloads doing small writes. Signed-off-by:
 Yohan Joung --- fs/f2fs/data.c | 20 ++++++++++++++++++++ fs/f2fs/f2fs.h |
 1 + fs/f2fs/file.c | 5 ++++- 3 files changed, 25 insertions(+), 1 deletion(-)
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.44 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.44 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jyh429[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jyh429[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tqZ8T-0002mJ-N5
Subject: [f2fs-dev] [PATCH] f2fs: optimize f2fs DIO overwrites
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

this is unnecessary when we know we are overwriting already allocated
blocks and the overhead of starting a transaction can be significant
especially for multithreaded workloads doing small writes.

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/data.c | 20 ++++++++++++++++++++
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/file.c |  5 ++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 09437dbd1b42..728630037b74 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4267,6 +4267,26 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	return 0;
 }
 
+static int f2fs_iomap_overwrite_begin(struct inode *inode, loff_t offset,
+		loff_t length, unsigned flags, struct iomap *iomap,
+		struct iomap *srcmap)
+{
+	int ret;
+
+	/*
+	 * Even for writes we don't need to allocate blocks, so just pretend
+	 * we are reading to save overhead of starting a transaction.
+	 */
+	flags &= ~IOMAP_WRITE;
+	ret = f2fs_iomap_begin(inode, offset, length, flags, iomap, srcmap);
+	WARN_ON_ONCE(!ret && iomap->type != IOMAP_MAPPED);
+	return ret;
+}
+
 const struct iomap_ops f2fs_iomap_ops = {
 	.iomap_begin	= f2fs_iomap_begin,
 };
+
+const struct iomap_ops f2fs_iomap_overwrite_ops = {
+	.iomap_begin	= f2fs_iomap_overwrite_begin,
+};
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c6cc2694f9ac..0511ab5ed42a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3936,6 +3936,7 @@ void f2fs_destroy_post_read_processing(void);
 int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
 void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
 extern const struct iomap_ops f2fs_iomap_ops;
+extern const struct iomap_ops f2fs_iomap_overwrite_ops;
 
 static inline struct page *f2fs_find_data_page(struct inode *inode,
 		pgoff_t index, pgoff_t *next_pgofs)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 82b21baf5628..bb2fe6dac9b6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4985,6 +4985,7 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 	const ssize_t count = iov_iter_count(from);
 	unsigned int dio_flags;
 	struct iomap_dio *dio;
+	const struct iomap_ops *iomap_ops = &f2fs_iomap_ops;
 	ssize_t ret;
 
 	trace_f2fs_direct_IO_enter(inode, iocb, count, WRITE);
@@ -5025,7 +5026,9 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 	dio_flags = 0;
 	if (pos + count > inode->i_size)
 		dio_flags |= IOMAP_DIO_FORCE_WAIT;
-	dio = __iomap_dio_rw(iocb, from, &f2fs_iomap_ops,
+	else if (f2fs_overwrite_io(inode, pos, count))
+		iomap_ops = &f2fs_iomap_overwrite_ops;
+	dio = __iomap_dio_rw(iocb, from, iomap_ops,
 			     &f2fs_iomap_dio_write_ops, dio_flags, NULL, 0);
 	if (IS_ERR_OR_NULL(dio)) {
 		ret = PTR_ERR_OR_ZERO(dio);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
