Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9E1EA887
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 02:08:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPywj-00034A-Ra; Thu, 31 Oct 2019 01:08:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <valdis@vt.edu>) id 1iPywi-000343-SI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 01:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A6x5zvKJWNelVsaR2qz0QPsCww3yKpvWiohVOKat7vg=; b=TRfLCDZ1HpJLStXGrP1pnHqsox
 h1jwOWNPMKmhKigUr/m7GAFU9W0k/nmcQgD8daWuiweiQT6fkaAvKYXiEXCml8w4RroUp/OxIWYrp
 DGIkukisO9a6EaL/1v35Ky+HjfAFLgscQULMzUzpuxkIbmR9NILb+WGWZfS5Rs9xCK8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A6x5zvKJWNelVsaR2qz0QPsCww3yKpvWiohVOKat7vg=; b=b
 a/5tfruKOhiFm/5zRbEAXJBjvQlvuNSVfpOSxwHqu7e3SXBdmQ8l0ha5LUMo3Xh5Jn33E0Ylhejyl
 pSTwQFGQpMnKWvXBRQnC5+Tdd0ZvaRkQnfKQnL+n/giKpYeaT3bdVBV/0Uq/iwpu/xN1HD+Lt0Gds
 Xpwp1rcP6S9f9Mbw=;
Received: from outbound.smtp.vt.edu ([198.82.183.121] helo=omr1.cc.vt.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPywe-00BfzX-PB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 01:08:16 +0000
Received: from mr1.cc.vt.edu (inbound.smtp.ipv6.vt.edu
 [IPv6:2607:b400:92:9:0:9d:8fcb:4116])
 by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x9V181Se019590
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 30 Oct 2019 21:08:02 -0400
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mr1.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x9V17uSY017392
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 30 Oct 2019 21:08:01 -0400
Received: by mail-qt1-f200.google.com with SMTP id h39so4486809qth.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Oct 2019 18:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=A6x5zvKJWNelVsaR2qz0QPsCww3yKpvWiohVOKat7vg=;
 b=TVJeEmSG1PFGcP9tE+RjWS0HfwVTjF1Eil013VRHi+bK5DwP+i127gMBif8QHJj8J9
 xZ4aCrAcWeeAb4BSy+Btv3Gfl+iWiNeZiznIz27JRDA7HpNG7mLgFmUjPZgEMrJpxnRH
 l3x/Rv58WRfk6N7VPhVj/OnXRY/Io+3w2qngDvOUrv2XAHt9JSwvSG9ajIBX18UYpWr+
 8vNo8M2+W+pXQe/UqIPGi85Kew3lHczYVdlp33e3ltensr8NszehfAh01Wf+ZODZ/09Q
 8pLETF8DMi55eLBFmsWIoyNdKGcXj5/z3ioVZ1LyW430NY7iqBW/kt62nggR0NrCxb7E
 6Dew==
X-Gm-Message-State: APjAAAXP5aq4mDN9hHbu3hZY2DLd8qDx3UpUF0DLsMqxEv2lPfhpymCa
 n83/pxIERGYupReUS0i/FrJXndSRtpU5BLY2bDM1wOctECAP5WyGUEHhq5rnIPt8RqiAAK/l+Rs
 5Qe+lUx5YQOc8CMONxh5vQ1qBTHNSkmuovJCqOKrqUQK2A0cM
X-Received: by 2002:a05:620a:12c2:: with SMTP id
 e2mr2944280qkl.162.1572484075630; 
 Wed, 30 Oct 2019 18:07:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlE8kPCGfGf/g8Sz78JkaUwhSUp0GYw6gPnzEQRzaLcuBtPOcj575mA0HsP7G//KxKX1X8dA==
X-Received: by 2002:a05:620a:12c2:: with SMTP id
 e2mr2944240qkl.162.1572484075278; 
 Wed, 30 Oct 2019 18:07:55 -0700 (PDT)
Received: from turing-police.lan ([2601:5c0:c001:c9e1::359])
 by smtp.gmail.com with ESMTPSA id u9sm1042529qke.50.2019.10.30.18.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 18:07:53 -0700 (PDT)
From: Valdis Kletnieks <valdis.kletnieks@vt.edu>
X-Google-Original-From: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 30 Oct 2019 21:07:33 -0400
Message-Id: <20191031010736.113783-1-Valdis.Kletnieks@vt.edu>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vt.edu]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iPywe-00BfzX-PB
Subject: [f2fs-dev] [RFC] errno.h: Provide EFSCORRUPTED for everybody
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
Cc: devel@driverdev.osuosl.org, linux-arch@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fsdevel@vger.kernel.org, Valdis Kletnieks <valdis.kletnieks@vt.edu>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Three questions: (a) ACK/NAK on this patch, (b) should it be all in one
patch, or one to add to errno.h and 6 patches for 6 filesystems?), and
(c) if one patch, who gets to shepherd it through?


There's currently 6 filesystems that have the same #define. Move it
into errno.h so it's defined in just one place.

Signed-off-by: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
---
 drivers/staging/exfat/exfat.h    | 2 --
 fs/erofs/internal.h              | 2 --
 fs/ext4/ext4.h                   | 1 -
 fs/f2fs/f2fs.h                   | 1 -
 fs/xfs/xfs_linux.h               | 1 -
 include/linux/jbd2.h             | 1 -
 include/uapi/asm-generic/errno.h | 1 +
 7 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 84de1123e178..3cf7e54af0b7 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -30,8 +30,6 @@
 #undef DEBUG
 #endif
 
-#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
-
 #define DENTRY_SIZE		32	/* dir entry size */
 #define DENTRY_SIZE_BITS	5
 
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 544a453f3076..3980026a8882 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -425,7 +425,5 @@ static inline int z_erofs_init_zip_subsystem(void) { return 0; }
 static inline void z_erofs_exit_zip_subsystem(void) {}
 #endif	/* !CONFIG_EROFS_FS_ZIP */
 
-#define EFSCORRUPTED    EUCLEAN         /* Filesystem is corrupted */
-
 #endif	/* __EROFS_INTERNAL_H */
 
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 03db3e71676c..a86c2585457d 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3396,6 +3396,5 @@ static inline int ext4_buffer_uptodate(struct buffer_head *bh)
 #endif	/* __KERNEL__ */
 
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
-#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
 
 #endif	/* _EXT4_H */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4024790028aa..04ebe77569a3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3752,6 +3752,5 @@ static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
 }
 
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
-#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
 
 #endif /* _LINUX_F2FS_H */
diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
index ca15105681ca..3409d02a7d21 100644
--- a/fs/xfs/xfs_linux.h
+++ b/fs/xfs/xfs_linux.h
@@ -123,7 +123,6 @@ typedef __u32			xfs_nlink_t;
 
 #define ENOATTR		ENODATA		/* Attribute not found */
 #define EWRONGFS	EINVAL		/* Mount with wrong filesystem type */
-#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
 
 #define SYNCHRONIZE()	barrier()
diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h
index 564793c24d12..1ecd3859d040 100644
--- a/include/linux/jbd2.h
+++ b/include/linux/jbd2.h
@@ -1657,6 +1657,5 @@ static inline tid_t  jbd2_get_latest_transaction(journal_t *journal)
 #endif	/* __KERNEL__ */
 
 #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
-#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
 
 #endif	/* _LINUX_JBD2_H */
diff --git a/include/uapi/asm-generic/errno.h b/include/uapi/asm-generic/errno.h
index cf9c51ac49f9..1d5ffdf54cb0 100644
--- a/include/uapi/asm-generic/errno.h
+++ b/include/uapi/asm-generic/errno.h
@@ -98,6 +98,7 @@
 #define	EINPROGRESS	115	/* Operation now in progress */
 #define	ESTALE		116	/* Stale file handle */
 #define	EUCLEAN		117	/* Structure needs cleaning */
+#define	EFSCORRUPTED	EUCLEAN
 #define	ENOTNAM		118	/* Not a XENIX named type file */
 #define	ENAVAIL		119	/* No XENIX semaphores available */
 #define	EISNAM		120	/* Is a named type file */
-- 
2.24.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
