Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4312608BF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Sep 2020 04:44:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFTcd-0003Ab-G8; Tue, 08 Sep 2020 02:44:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kFTcb-0003AU-W3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 02:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0P27m9R7gToJuIq48PNYPlUAE0qvbBGpOoq6ApSizFo=; b=DEl/j7LqlVcAdS/VLKxZZ2xatQ
 ULWrrnVFH3mc2rURHhfbSxM8f8aqTLPjCudNQJ6n8k6CIwQIFiXHWaK395RON6q4R6b494FdmJyEq
 kKsTxupwtC1I8OOvLHh5N0OLE3HmPuT/JBVxLBExtlCLSD6o8zKMWa7dSq8cvHS2kngI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0P27m9R7gToJuIq48PNYPlUAE0qvbBGpOoq6ApSizFo=; b=jkcz3KCiEtxEoswt+OXtdHabdu
 mMcqjN3vvfO3BXVrstj62o8oy5ou6rjB6WcIjrD3vUoPYdDAizNxv/bzOHSbQwaaAv8zc3BnpU54x
 KeEr5kW196CB2MR6wsbch5fEORh5l/ieg5JUXenWnZP8k3YTZewPj8PNpU9yoHOksZ6o=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kFTcW-00GOXJ-S2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 02:44:37 +0000
Received: by mail-pg1-f194.google.com with SMTP id w186so8992664pgb.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Sep 2020 19:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0P27m9R7gToJuIq48PNYPlUAE0qvbBGpOoq6ApSizFo=;
 b=vczFrOgDy05uM4dJXuUq5Ps3zZiABg17INaardSitIE3ye5d3062684fRNHn84NPC9
 7YZJpHJUvukhiT+N01yyjPlmdCCHtOfLbqVfuUfkSZ/Bfz9n/UeC1kccWmBHpOR3B4DW
 H+43iY6EDTPUHzhyoWDs2O7K0DoaJKvS2Un9pl+yf+cHb4uCvdz9Fa4f9xwYlH2yEdws
 7w2NOEi9EYC+m6Xo390jyqtvGlSeGmIjJzwfizfnpVybkJo8c0HHD2gXFZPXO5zg2AGW
 VW34NRe4qmQoxkQnhd7EFGwDy+z2XhZpQRgbEKUS0NfEg/t3UwJua7qfFVrAtf1kuslB
 4ZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0P27m9R7gToJuIq48PNYPlUAE0qvbBGpOoq6ApSizFo=;
 b=owXOHGyZ6Pw/79eE79BZJwzXt7qebflVgUeVRfDyKYy8ZHUekMPiEK8sWkIX/mS2wA
 6sCVL8gpWjUKtbTl/bFLNgy0FW/5CzPFJpw6D9sBO3oIrW2fyEy/9wDOt776nu9COv0x
 l+HVkevcz6macKHS6hzBwuMIF309JIp3A+o+MguDe4synfcxRMUesnhhf7xSF+h8+HSa
 ZmT7KqLURpH9OtORg62Dmjpczs1vaQPYWgknDbABmqPvW5bALi5ldcLDe9fB6GlOVa0F
 17Iub0npJ/7D1OEaXWXAw9l9ZlGc40U3CPT/qfAZiewhGzyS8jb36NON8+323+8ZwefR
 M80Q==
X-Gm-Message-State: AOAM532BBpqE2JC2FNrHeaINUBh5OqeOoKwyiTkTGRKDH6HXtcdi9Egg
 /TResx7YAREyLWB1/H9StU4=
X-Google-Smtp-Source: ABdhPJwo/IKdZRdBXmJEAvfC/PKHjgUztBwGXwrKS+jA+PxL8ucfBWllRCUgMeb8MmTeDmOVSjWhaQ==
X-Received: by 2002:a63:4451:: with SMTP id t17mr17916980pgk.92.1599533067267; 
 Mon, 07 Sep 2020 19:44:27 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id k24sm16237390pfg.148.2020.09.07.19.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 19:44:26 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  8 Sep 2020 11:44:11 +0900
Message-Id: <20200908024411.2692388-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200908024411.2692388-1-daeho43@gmail.com>
References: <20200908024411.2692388-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kFTcW-00GOXJ-S2
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: change return value of
 f2fs_disable_compressed_file to bool
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

The returned integer is not required anywhere. So we need to change
the return value to bool type.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c |  2 +-
 fs/f2fs/f2fs.h | 17 ++++++-----------
 fs/f2fs/file.c |  4 ++--
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 48cab85205e2..f30348063017 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3936,7 +3936,7 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (ret)
 		return ret;
 
-	if (f2fs_disable_compressed_file(inode))
+	if (!f2fs_disable_compressed_file(inode))
 		return -EINVAL;
 
 	ret = check_swap_activate(sis, file, span);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c615e75c82fd..a33c837e833a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3930,26 +3930,21 @@ static inline void set_compress_context(struct inode *inode)
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
-static inline u32 f2fs_disable_compressed_file(struct inode *inode)
+static inline bool f2fs_disable_compressed_file(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	u32 i_compr_blocks;
 
 	if (!f2fs_compressed_file(inode))
-		return 0;
-	if (S_ISREG(inode->i_mode)) {
-		if (get_dirty_pages(inode))
-			return 1;
-		i_compr_blocks = atomic_read(&fi->i_compr_blocks);
-		if (i_compr_blocks)
-			return i_compr_blocks;
-	}
+		return true;
+	if (S_ISREG(inode->i_mode) &&
+		(get_dirty_pages(inode) || atomic_read(&fi->i_compr_blocks)))
+		return false;
 
 	fi->i_flags &= ~F2FS_COMPR_FL;
 	stat_dec_compr_inode(inode);
 	clear_inode_flag(inode, FI_COMPRESSED_FILE);
 	f2fs_mark_inode_dirty_sync(inode, true);
-	return 0;
+	return true;
 }
 
 #define F2FS_FEATURE_FUNCS(name, flagname) \
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index adc4acad488a..d69def08e25e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1828,7 +1828,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 
 	if ((iflags ^ masked_flags) & F2FS_COMPR_FL) {
 		if (masked_flags & F2FS_COMPR_FL) {
-			if (f2fs_disable_compressed_file(inode))
+			if (!f2fs_disable_compressed_file(inode))
 				return -EINVAL;
 		}
 		if (iflags & F2FS_NOCOMP_FL)
@@ -3258,7 +3258,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	if (ret)
 		goto out;
 
-	if (f2fs_disable_compressed_file(inode)) {
+	if (!f2fs_disable_compressed_file(inode)) {
 		ret = -EOPNOTSUPP;
 		goto out;
 	}
-- 
2.28.0.526.ge36021eeef-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
