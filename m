Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BFB37BE93
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 15:46:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgpCF-0003qF-Pi; Wed, 12 May 2021 13:46:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lgpCC-0003po-8y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 13:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lk7KBT5ZiYvhccuNilA5BAF8HpqJCTgi83U7AEOzoXI=; b=IeauWQAZLR+SdfHzWc07dZkS1P
 OsrT3VvkX3GgPmCsBKG8MFVUxYOeckk9B6gsyefm/h6Aij8tTFNc7DtjG+YUJXY+jpLYvJoJO+Rwr
 lPo+4HjwbZlvp/N35aCF89e4/cZKumA7XoYlKp1StDrG3m5xv0LmfMOgPJtfA3pvzorg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lk7KBT5ZiYvhccuNilA5BAF8HpqJCTgi83U7AEOzoXI=; b=GgDFVfR7RWWsJ3v5cAfiytv/Xz
 dxPxSfSHiIAWbNtKijKsLsQhpa9xBxTIWWyP6MGd9NEaeJurRXUL7rDTcsjX42Nj0XjW6DgFBgMZh
 B5D5m/9euI3YuOvkkWARGtpOWG3vt8A+c5geVWTwnWfo9vS8133hApLFAPgqx+XrCprA=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgpCB-005UIb-9z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 13:46:42 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56D65B1AB;
 Wed, 12 May 2021 13:46:32 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id D98701E0A80; Wed, 12 May 2021 15:46:31 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Wed, 12 May 2021 15:46:10 +0200
Message-Id: <20210512134631.4053-2-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210512101639.22278-1-jack@suse.cz>
References: <20210512101639.22278-1-jack@suse.cz>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lgpCB-005UIb-9z
Subject: [f2fs-dev] [PATCH 02/11] documentation: Sync file_operations
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
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sync listing of struct file_operations members with the real one in
fs.h.

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
