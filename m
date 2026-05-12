Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDgKAdC8AmrKwAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 07:38:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C38D51A3B2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 07:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BgXoFXlxDMO3nD6MQpvKB9fUBAaN2IFqR6Uly82Lzg=; b=aVTPDIkN4pIN5azJNJRTaNCmhu
	BA38YdMHX6njS0LI/qKql7nsQGVCg79GXQLy7SqdBqyR0FZgVny5+tln7kywaojmArufDOwJUx6iB
	iDr0c3aV+tuYg9elp1ClvvXJsN9b3TSD0/7f7NTZRpu0v36tiBo5ou3vqjM8oKreXHYk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMfp2-0007ky-N2;
	Tue, 12 May 2026 05:38:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9f3c1ea353498f61ccd0+8297+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wMfp2-0007kp-81 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 05:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jmg1/5AYnhQfPDVo7U8v9UEsn9gIbFRK+B6p/Lo/5oA=; b=m3sUZmuj9L3SeLWfFBzY1EjRe5
 7olHgPa62/XCBAxdgK2+dlXsrTZvdVixAP4En/qN0TYx+9naR3DSxZEfRodY5KrxpoZgTzTfp1B0k
 lCcnjQHaAYGnQsMZ6/BK1E9zZYPit+TLVIJnmHrBegMvELkm7l/PTmjr3Tqkh2ReWinU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jmg1/5AYnhQfPDVo7U8v9UEsn9gIbFRK+B6p/Lo/5oA=; b=J1Z+eOagGonM/lncWU1TsoLmCu
 TA6JOjeaQW2K8TcYaGbDjv+l6lfxf6sWtmwS4u+ZvgrUSGgGLmes8XHPiemxXStCUwQe6k+BBAQRZ
 9plY2tTn7TY/ZK4sDX0lAYt3ayOkttz9EzwftVtSQM/JWO5LgW6HoLXfu7uPqWQ1nlF8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMfox-0004t2-O5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 05:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=jmg1/5AYnhQfPDVo7U8v9UEsn9gIbFRK+B6p/Lo/5oA=; b=QqOqi+Vu+e1lyd8X/LTzUvV1/s
 7nNzu+X/+UiipnmFD2UKvwRucWeks9YwyuibcySNp6WMvDeX4F1yrLmj6KlC1j/U0itxoREq7ty5j
 psvrVCvEVE+DGyltDxt2h7xbnHc2o21Dhshp4eRz7jXJmo5FP7/eNIyvbsR+we+lvpzS80HlOZuRL
 BtnTXIz7jT4ZN+GcEikcH8RCK3DW5D+Xs/Gyj3cUHsE6zHFR8tSGQ7eYtKmIGSQyp9kOpyNnIomyR
 LyJEvGDuooiyrdDlFLckwWnhjoGoOBRE7uRV1WGSBrGTTCxlFVT/UybEtrMcMglFTm5s3NOUdudR+
 Bvu6vXiw==;
Received: from
 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wMfoh-0000000FfXA-48rG; Tue, 12 May 2026 05:38:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>
Date: Tue, 12 May 2026 07:35:28 +0200
Message-ID: <20260512053625.2950900-13-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512053625.2950900-1-hch@lst.de>
References: <20260512053625.2950900-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  swap_info_struct is now internal to the MM subsystem,
 so remove
 it from the public header. Signed-off-by: Christoph Hellwig <hch@lst.de>
 --- include/linux/swap.h | 98 + mm/swap.h | 92
 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 in [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1wMfox-0004t2-O5
Subject: [f2fs-dev] [PATCH 12/12] swap: move swap_info_struct to mm/swap.h
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
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 "Darrick J . Wong " <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 8C38D51A3B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:trondmy@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,mit.edu,lists.sourceforge.net,samba.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

swap_info_struct is now internal to the MM subsystem, so remove it from
the public header.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/swap.h | 98 +-------------------------------------------
 mm/swap.h            | 92 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 96 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 95237ee065c2..31eef9b74949 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -16,9 +16,9 @@
 #include <uapi/linux/mempolicy.h>
 #include <asm/page.h>
 
-struct notifier_block;
-
 struct bio;
+struct notifier_block;
+struct swap_info_struct;
 
 #define SWAP_FLAG_PREFER	0x8000	/* set if swap priority specified */
 #define SWAP_FLAG_PRIO_MASK	0x7fff
@@ -178,29 +178,6 @@ struct sysinfo;
 struct writeback_control;
 struct zone;
 
-/*
- * Max bad pages in the new format..
- */
-#define MAX_SWAP_BADPAGES \
-	((offsetof(union swap_header, magic.magic) - \
-	  offsetof(union swap_header, info.badpages)) / sizeof(int))
-
-enum {
-	SWP_USED	= (1 << 0),	/* is slot in swap_info[] used? */
-	SWP_WRITEOK	= (1 << 1),	/* ok to write to this swap?	*/
-	SWP_DISCARDABLE = (1 << 2),	/* blkdev support discard */
-	SWP_DISCARDING	= (1 << 3),	/* now discarding a free cluster */
-	SWP_SOLIDSTATE	= (1 << 4),	/* blkdev seeks are cheap */
-	SWP_BLKDEV	= (1 << 6),	/* its a block device */
-	SWP_ACTIVATED	= (1 << 7),	/* set after swap_activate success */
-	SWP_FS_OPS	= (1 << 8),	/* swapfile operations go through fs */
-	SWP_AREA_DISCARD = (1 << 9),	/* single-time swap area discards */
-	SWP_PAGE_DISCARD = (1 << 10),	/* freed swap page-cluster discards */
-	SWP_STABLE_WRITES = (1 << 11),	/* no overwrite PG_writeback pages */
-	SWP_SYNCHRONOUS_IO = (1 << 12),	/* synchronous IO is efficient */
-					/* add others here before... */
-};
-
 #define SWAP_CLUSTER_MAX 32UL
 #define SWAP_CLUSTER_MAX_SKIPPED (SWAP_CLUSTER_MAX << 10)
 #define COMPACT_CLUSTER_MAX SWAP_CLUSTER_MAX
@@ -219,56 +196,6 @@ enum {
 #define SWAP_NR_ORDERS		1
 #endif
 
-/*
- * We keep using same cluster for rotational device so IO will be sequential.
- * The purpose is to optimize SWAP throughput on these device.
- */
-struct swap_sequential_cluster {
-	unsigned int next[SWAP_NR_ORDERS]; /* Likely next allocation offset */
-};
-
-/*
- * The in-memory structure used to track swap areas.
- */
-struct swap_info_struct {
-	struct percpu_ref users;	/* indicate and keep swap device valid. */
-	unsigned long	flags;		/* SWP_USED etc: see above */
-	signed short	prio;		/* swap priority of this type */
-	struct plist_node list;		/* entry in swap_active_head */
-	signed char	type;		/* strange name for an index */
-	unsigned int	max;		/* size of this swap device */
-	unsigned long *zeromap;		/* kvmalloc'ed bitmap to track zero pages */
-	struct swap_cluster_info *cluster_info; /* cluster info. Only for SSD */
-	struct list_head free_clusters; /* free clusters list */
-	struct list_head full_clusters; /* full clusters list */
-	struct list_head nonfull_clusters[SWAP_NR_ORDERS];
-					/* list of cluster that contains at least one free slot */
-	struct list_head frag_clusters[SWAP_NR_ORDERS];
-					/* list of cluster that are fragmented or contented */
-	unsigned int pages;		/* total of usable pages of swap */
-	atomic_long_t inuse_pages;	/* number of those currently in use */
-	struct swap_sequential_cluster *global_cluster; /* Use one global cluster for rotating device */
-	spinlock_t global_cluster_lock;	/* Serialize usage of global cluster */
-	struct rb_root swap_extent_root;/* root of the swap extent rbtree */
-	struct block_device *bdev;	/* swap device or bdev of swap file */
-	struct file *swap_file;		/* seldom referenced */
-	struct completion comp;		/* seldom referenced */
-	spinlock_t lock;		/*
-					 * protect map scan related fields like
-					 * inuse_pages and all cluster lists.
-					 * Other fields are only changed
-					 * at swapon/swapoff, so are protected
-					 * by swap_lock. changing flags need
-					 * hold this lock and swap_lock. If
-					 * both locks need hold, hold swap_lock
-					 * first.
-					 */
-	struct work_struct discard_work; /* discard worker */
-	struct work_struct reclaim_work; /* reclaim worker */
-	struct list_head discard_clusters; /* discard clusters list */
-	struct plist_node avail_list;   /* entry in swap_avail_head */
-};
-
 static inline swp_entry_t page_swap_entry(struct page *page)
 {
 	struct folio *folio = page_folio(page);
@@ -423,10 +350,7 @@ int find_first_swap(dev_t *device);
 extern unsigned int count_swap_pages(int, int);
 extern sector_t swapdev_block(int, pgoff_t);
 extern int __swap_count(swp_entry_t entry);
-extern bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry);
 extern int swp_swapcount(swp_entry_t entry);
-struct backing_dev_info;
-extern struct swap_info_struct *get_swap_device(swp_entry_t entry);
 sector_t swap_folio_sector(struct folio *folio);
 
 /*
@@ -452,20 +376,7 @@ bool folio_free_swap(struct folio *folio);
 swp_entry_t swap_alloc_hibernation_slot(int type);
 void swap_free_hibernation_slot(swp_entry_t entry);
 
-static inline void put_swap_device(struct swap_info_struct *si)
-{
-	percpu_ref_put(&si->users);
-}
-
 #else /* CONFIG_SWAP */
-static inline struct swap_info_struct *get_swap_device(swp_entry_t entry)
-{
-	return NULL;
-}
-
-static inline void put_swap_device(struct swap_info_struct *si)
-{
-}
 
 #define get_nr_swap_pages()			0L
 #define total_swap_pages			0L
@@ -497,11 +408,6 @@ static inline int __swap_count(swp_entry_t entry)
 	return 0;
 }
 
-static inline bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry)
-{
-	return false;
-}
-
 static inline int swp_swapcount(swp_entry_t entry)
 {
 	return 0;
diff --git a/mm/swap.h b/mm/swap.h
index a77016f2423b..70974495bf15 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -8,6 +8,79 @@ struct swap_iocb;
 
 extern int page_cluster;
 
+/*
+ * We keep using same cluster for rotational device so IO will be sequential.
+ * The purpose is to optimize SWAP throughput on these device.
+ */
+struct swap_sequential_cluster {
+	unsigned int next[SWAP_NR_ORDERS]; /* Likely next allocation offset */
+};
+
+/*
+ * The in-memory structure used to track swap areas.
+ */
+struct swap_info_struct {
+	struct percpu_ref users;	/* indicate and keep swap device valid. */
+	unsigned long	flags;		/* SWP_USED etc: see above */
+	signed short	prio;		/* swap priority of this type */
+	struct plist_node list;		/* entry in swap_active_head */
+	signed char	type;		/* strange name for an index */
+	unsigned int	max;		/* size of this swap device */
+	unsigned long *zeromap;		/* kvmalloc'ed bitmap to track zero pages */
+	struct swap_cluster_info *cluster_info; /* cluster info. Only for SSD */
+	struct list_head free_clusters; /* free clusters list */
+	struct list_head full_clusters; /* full clusters list */
+	struct list_head nonfull_clusters[SWAP_NR_ORDERS];
+					/* list of cluster that contains at least one free slot */
+	struct list_head frag_clusters[SWAP_NR_ORDERS];
+					/* list of cluster that are fragmented or contented */
+	unsigned int pages;		/* total of usable pages of swap */
+	atomic_long_t inuse_pages;	/* number of those currently in use */
+	struct swap_sequential_cluster *global_cluster; /* Use one global cluster for rotating device */
+	spinlock_t global_cluster_lock;	/* Serialize usage of global cluster */
+	struct rb_root swap_extent_root;/* root of the swap extent rbtree */
+	struct block_device *bdev;	/* swap device or bdev of swap file */
+	struct file *swap_file;		/* seldom referenced */
+	struct completion comp;		/* seldom referenced */
+	spinlock_t lock;		/*
+					 * protect map scan related fields like
+					 * inuse_pages and all cluster lists.
+					 * Other fields are only changed
+					 * at swapon/swapoff, so are protected
+					 * by swap_lock. changing flags need
+					 * hold this lock and swap_lock. If
+					 * both locks need hold, hold swap_lock
+					 * first.
+					 */
+	struct work_struct discard_work; /* discard worker */
+	struct work_struct reclaim_work; /* reclaim worker */
+	struct list_head discard_clusters; /* discard clusters list */
+	struct plist_node avail_list;   /* entry in swap_avail_head */
+};
+
+/*
+ * Max bad pages in the new format..
+ */
+#define MAX_SWAP_BADPAGES \
+	((offsetof(union swap_header, magic.magic) - \
+	  offsetof(union swap_header, info.badpages)) / sizeof(int))
+
+enum {
+	SWP_USED	= (1 << 0),	/* is slot in swap_info[] used? */
+	SWP_WRITEOK	= (1 << 1),	/* ok to write to this swap?	*/
+	SWP_DISCARDABLE = (1 << 2),	/* blkdev support discard */
+	SWP_DISCARDING	= (1 << 3),	/* now discarding a free cluster */
+	SWP_SOLIDSTATE	= (1 << 4),	/* blkdev seeks are cheap */
+	SWP_BLKDEV	= (1 << 6),	/* its a block device */
+	SWP_ACTIVATED	= (1 << 7),	/* set after swap_activate success */
+	SWP_FS_OPS	= (1 << 8),	/* swapfile operations go through fs */
+	SWP_AREA_DISCARD = (1 << 9),	/* single-time swap area discards */
+	SWP_PAGE_DISCARD = (1 << 10),	/* freed swap page-cluster discards */
+	SWP_STABLE_WRITES = (1 << 11),	/* no overwrite PG_writeback pages */
+	SWP_SYNCHRONOUS_IO = (1 << 12),	/* synchronous IO is efficient */
+					/* add others here before... */
+};
+
 #ifdef CONFIG_THP_SWAP
 #define SWAPFILE_CLUSTER	HPAGE_PMD_NR
 #define swap_entry_order(order)	(order)
@@ -352,6 +425,13 @@ static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
 	return i;
 }
 
+bool swap_entry_swapped(struct swap_info_struct *si, swp_entry_t entry);
+struct swap_info_struct *get_swap_device(swp_entry_t entry);
+static inline void put_swap_device(struct swap_info_struct *si)
+{
+	percpu_ref_put(&si->users);
+}
+
 #else /* CONFIG_SWAP */
 struct swap_iocb;
 static inline struct swap_cluster_info *swap_cluster_lock(
@@ -498,5 +578,17 @@ static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
 {
 	return 0;
 }
+static inline bool swap_entry_swapped(struct swap_info_struct *si,
+		swp_entry_t entry)
+{
+	return false;
+}
+static inline struct swap_info_struct *get_swap_device(swp_entry_t entry)
+{
+	return NULL;
+}
+static inline void put_swap_device(struct swap_info_struct *si)
+{
+}
 #endif /* CONFIG_SWAP */
 #endif /* _MM_SWAP_H */
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
