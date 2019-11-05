Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDADEF3A5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 03:46:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRoru-0004gP-Kc; Tue, 05 Nov 2019 02:46:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <valdis@vt.edu>) id 1iRort-0004gI-5m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 02:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZNcm7tJHE7PJ/B2fVNd5i/u7+ifnx25OIt2h3zpLOo=; b=FRsAoD9qnMss71TSjkoZo8/X8u
 LtKyw/Uw72at9PjEHqWL7t8owGOMGlXyVdv4RG1mB/sjinl2BubrJrbCrJ5Lm0ERGwn01IftjwDHP
 F8GhhR4pUXrbXthu7gBVqrKbqreoMotaKTYP9RYHXmy0N9v4gKfCToIJE25izz1mR2CQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RZNcm7tJHE7PJ/B2fVNd5i/u7+ifnx25OIt2h3zpLOo=; b=U
 PHZIIxldGqbTitt8EBi0jzvjWXeYUCiFNRtzGZzo9fbAp2L/g/X4nWjN89NYZxMY5D4c4VuxFVswk
 P1ws3QkIgPlu3RgzlpJz6s3AEFFWi6pAb6oSY6MUc809DH3NN7/bDHhCfpgk8jqDyqXdbJVfFsBbq
 WEnVZGDgOoSQGM5o=;
Received: from outbound.smtp.vt.edu ([198.82.183.121] helo=omr2.cc.vt.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRorp-000Mh9-Cx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 02:46:53 +0000
Received: from mr2.cc.vt.edu (junk.cc.ipv6.vt.edu
 [IPv6:2607:b400:92:9:0:9d:8fcb:4116])
 by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id xA52kb3G027470
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 4 Nov 2019 21:46:37 -0500
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mr2.cc.vt.edu (8.14.7/8.14.7) with ESMTP id xA52kWXX024907
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 4 Nov 2019 21:46:37 -0500
Received: by mail-qt1-f199.google.com with SMTP id r12so12381035qtp.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Nov 2019 18:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RZNcm7tJHE7PJ/B2fVNd5i/u7+ifnx25OIt2h3zpLOo=;
 b=J0ekCa5PrGR2C5fy/d7I8FWVL2OXKMQB+FJn76W73Mplf++tHNR5tjUIyy9v/EkSSu
 4dKuaYRJNGypmwJgwbyLZiMkf48MUSofZZ8kwvz+JdDqdamcFSTn5MxKwMiIlcLnywqL
 s6CECHMpdVB9Rsi+UIQTJLRTA9bfP29G1wZ+2tUfMMKLtwt1G+z0iW16+77zmvp2YUyW
 9NaMO4PQOURbk21KZo6yfU5T7XzlV/Ul+ASEJ6EqvnHUaTfVZONzdbRqaX5nAp/1ptwm
 2uSVYkmW6dsbnPwi50wJyFGnWKpNFVDV7M5geBLK4UJV8Y5JF4Nzwg75/mEWqutdj5z0
 iJ+Q==
X-Gm-Message-State: APjAAAWTvo2Oir9VXqvzbKA/Bgktm6vRbRvlhwuYjhx/wDeE+nyauTjY
 tUQ5/PM7ZWjNgPAUbnK7ham/+YHXTe3Ld8GnhzmaQCI27iPfo5RDwmAq6gLO0hcZRV0jUOnMmaF
 I1sO/paHvV/r+D0HCSlTKN2+cCqfim/KdDXl73vOQ0r6yNWz3
X-Received: by 2002:ad4:5349:: with SMTP id v9mr23621298qvs.55.1572921992482; 
 Mon, 04 Nov 2019 18:46:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqyXzA6HviTv6QlEgIOFkTmQMi16KNYqK2sd8+KO7QEzhWvkSciXAH9zdUWTp/6s496+Fl8aKA==
X-Received: by 2002:ad4:5349:: with SMTP id v9mr23621285qvs.55.1572921992189; 
 Mon, 04 Nov 2019 18:46:32 -0800 (PST)
Received: from turing-police.lan ([2601:5c0:c001:c9e1::359])
 by smtp.gmail.com with ESMTPSA id s21sm12156815qtc.12.2019.11.04.18.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 18:46:30 -0800 (PST)
From: Valdis Kletnieks <valdis.kletnieks@vt.edu>
X-Google-Original-From: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
To: 
Date: Mon,  4 Nov 2019 21:46:14 -0500
Message-Id: <20191105024618.194134-1-Valdis.Kletnieks@vt.edu>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vt.edu]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iRorp-000Mh9-Cx
Subject: [f2fs-dev] [PATCH 1/1] errno.h: Provide EFSBADCRC for everybody
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
Cc: linux-arch@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Arnd Bergmann <arnd@arndb.de>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Valdis Kletnieks <Valdis.Kletnieks@vt.edu>,
 linux-ext4@vger.kernel.org, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Four filesystems have their own defines for this. Move it
into errno.h so it's defined in just one place.

Signed-off-by: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
---
 fs/ext4/ext4.h                   | 2 --
 fs/f2fs/f2fs.h                   | 2 --
 fs/xfs/xfs_linux.h               | 1 -
 include/linux/jbd2.h             | 2 --
 include/uapi/asm-generic/errno.h | 1 +
 5 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index a86c2585457d..79b3fd8291ab 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3395,6 +3395,4 @@ static inline int ext4_buffer_uptodate(struct buffer_head *bh)
 
 #endif	/* __KERNEL__ */
 
-#define EFSBADCRC	EBADMSG		/* Bad CRC detected */
-
 #endif	/* _EXT4_H */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 04ebe77569a3..ba23fd18d44a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3751,6 +3751,4 @@ static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
 	return false;
 }
 
-#define EFSBADCRC	EBADMSG		/* Bad CRC detected */
-
 #endif /* _LINUX_F2FS_H */
diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
index 3409d02a7d21..abdfc506618d 100644
--- a/fs/xfs/xfs_linux.h
+++ b/fs/xfs/xfs_linux.h
@@ -123,7 +123,6 @@ typedef __u32			xfs_nlink_t;
 
 #define ENOATTR		ENODATA		/* Attribute not found */
 #define EWRONGFS	EINVAL		/* Mount with wrong filesystem type */
-#define EFSBADCRC	EBADMSG		/* Bad CRC detected */
 
 #define SYNCHRONIZE()	barrier()
 #define __return_address __builtin_return_address(0)
diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h
index 69411d7e0431..e07692fe6f20 100644
--- a/include/linux/jbd2.h
+++ b/include/linux/jbd2.h
@@ -1656,6 +1656,4 @@ static inline tid_t  jbd2_get_latest_transaction(journal_t *journal)
 
 #endif	/* __KERNEL__ */
 
-#define EFSBADCRC	EBADMSG		/* Bad CRC detected */
-
 #endif	/* _LINUX_JBD2_H */
diff --git a/include/uapi/asm-generic/errno.h b/include/uapi/asm-generic/errno.h
index 1d5ffdf54cb0..e4cae9a9ae79 100644
--- a/include/uapi/asm-generic/errno.h
+++ b/include/uapi/asm-generic/errno.h
@@ -55,6 +55,7 @@
 #define	EMULTIHOP	72	/* Multihop attempted */
 #define	EDOTDOT		73	/* RFS specific error */
 #define	EBADMSG		74	/* Not a data message */
+#define EFSBADCRC	EBADMSG	/* Bad CRC detected */
 #define	EOVERFLOW	75	/* Value too large for defined data type */
 #define	ENOTUNIQ	76	/* Name not unique on network */
 #define	EBADFD		77	/* File descriptor in bad state */
-- 
2.24.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
