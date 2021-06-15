Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFC43A7A30
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jun 2021 11:18:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lt5DQ-0006bF-Nb; Tue, 15 Jun 2021 09:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lt5DH-0006aY-NU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 09:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y1jAxj7HpC0zj00ojIU7+2/5URp27cwg5ekGhnTUbK4=; b=PzJeWyM0fTSlgiAoByr+Qmse3f
 GPAZMIf7d9o3EQpo2JCgvoz2lpheqLOS+tsDY/ScwPPf0DqhDZPpyfLQeybCfbqKBav4Zv3hRDkRE
 +G4N8mtloKooU+h73TFDG8jZ5A6G7ocjfFSpzzxqyYTg2b7xZXTC8+atjbMKpzsLYQ9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y1jAxj7HpC0zj00ojIU7+2/5URp27cwg5ekGhnTUbK4=; b=hzyW/QA5udTBEprflO1c1NylAk
 5lDVmLsJeaD7mJ+MW1fxh1iLVKWGQELo7CyqDUjEKNGu0st0pz+CHEsTE3VRNyUW59AfoCE+B3xVS
 gFgcCj7u5do0WKVVIoiZWx2rYC7I5UFSbymxv5evpWYS6ng3XdoLOBfLsZcMO1RWPswk=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lt5DA-0001Hk-Ty
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 09:18:29 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0685E1FD2A;
 Tue, 15 Jun 2021 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623748695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1jAxj7HpC0zj00ojIU7+2/5URp27cwg5ekGhnTUbK4=;
 b=kCTrnnv24k3P/naCGHeylkCPKtqvzZxc8HE4GZmrgKCn4fBuRnMlMLYLxDGCigyj6jIFYN
 zdaypn8Hx68KoUHM2O7mDOg+f9zqD4tAa6Ci2/E5hofojZ6q9OQaAlJlLPr+p2/F0L6T2C
 jJJo4WJYSCVMwgQ2lbb0V4OfZdjxT3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623748695;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1jAxj7HpC0zj00ojIU7+2/5URp27cwg5ekGhnTUbK4=;
 b=hRwu7qMP9TmzHT2FplW6HkPp9wFYpk2/9ffOuKo+lEZhGKIH5Jp86yoVXflv5Z/3I4YxVO
 nntGHBOo1ltBnyAA==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 5E75AA3B94;
 Tue, 15 Jun 2021 09:18:14 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 2836A1F2CBA; Tue, 15 Jun 2021 11:18:14 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 15 Jun 2021 11:17:52 +0200
Message-Id: <20210615091814.28626-2-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210615090844.6045-1-jack@suse.cz>
References: <20210615090844.6045-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2278; h=from:subject;
 bh=+JHTm1BDQQGdP9H1PUT1wwFK/NSOXnEkL9zE0DdMSHk=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBgyHBBtH3fQO/hIgFbbEMhZxePOrm925VwhMgEiw4b
 MZAHXzCJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYMhwQQAKCRCcnaoHP2RA2ZrVB/
 4otmqFQT04mmx22L2rIYmUffhR+JPydLyuYvgT1FPWPnO1TI9dNS9xy0tDTRSbAPFXlF+vrVzDTIDc
 2wX9BM5mXwYA/nBka5hJRtCBta9M+gqe8ng9MzNyrZJ7IKLfTNaUPK6K1TaDPWDZZANR197c4ou3Gq
 SiqqPfMp70BQilo9ZLbtF3EK85t10niL7v/2/Riv/ERxXvJPszraejpZIjHB3cWwOhRIb4WgltUCIQ
 RCzi0gZ7m9O2CBe7F/Jkqml+OQu3Y2mTWORroM2K+wd+4xijA4Y+5sTYOk0Wb3BDNa0XK3tXCQYP5Q
 gN5oby6zn3gxDbmppHygxOKACiihcA
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lt5DA-0001Hk-Ty
Subject: [f2fs-dev] [PATCH 02/14] documentation: Sync file_operations
 members with reality
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sync listing of struct file_operations members with the real one in
fs.h.

Acked-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 Documentation/filesystems/locking.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index 1e894480115b..4ed2b22bd0a8 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -506,6 +506,7 @@ prototypes::
 	ssize_t (*write) (struct file *, const char __user *, size_t, loff_t *);
 	ssize_t (*read_iter) (struct kiocb *, struct iov_iter *);
 	ssize_t (*write_iter) (struct kiocb *, struct iov_iter *);
+	int (*iopoll) (struct kiocb *kiocb, bool spin);
 	int (*iterate) (struct file *, struct dir_context *);
 	int (*iterate_shared) (struct file *, struct dir_context *);
 	__poll_t (*poll) (struct file *, struct poll_table_struct *);
@@ -518,12 +519,6 @@ prototypes::
 	int (*fsync) (struct file *, loff_t start, loff_t end, int datasync);
 	int (*fasync) (int, struct file *, int);
 	int (*lock) (struct file *, int, struct file_lock *);
-	ssize_t (*readv) (struct file *, const struct iovec *, unsigned long,
-			loff_t *);
-	ssize_t (*writev) (struct file *, const struct iovec *, unsigned long,
-			loff_t *);
-	ssize_t (*sendfile) (struct file *, loff_t *, size_t, read_actor_t,
-			void __user *);
 	ssize_t (*sendpage) (struct file *, struct page *, int, size_t,
 			loff_t *, int);
 	unsigned long (*get_unmapped_area)(struct file *, unsigned long,
@@ -536,6 +531,14 @@ prototypes::
 			size_t, unsigned int);
 	int (*setlease)(struct file *, long, struct file_lock **, void **);
 	long (*fallocate)(struct file *, int, loff_t, loff_t);
+	void (*show_fdinfo)(struct seq_file *m, struct file *f);
+	unsigned (*mmap_capabilities)(struct file *);
+	ssize_t (*copy_file_range)(struct file *, loff_t, struct file *,
+			loff_t, size_t, unsigned int);
+	loff_t (*remap_file_range)(struct file *file_in, loff_t pos_in,
+			struct file *file_out, loff_t pos_out,
+			loff_t len, unsigned int remap_flags);
+	int (*fadvise)(struct file *, loff_t, loff_t, int);
 
 locking rules:
 	All may block.
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
