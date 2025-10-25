Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6CC099EC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Oct 2025 18:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfKmLjWeLqac0dNwN8UCFLFGh6vGW2GM0Ubh/X7gQYI=; b=VUGrmv87tmO1hQ856zoYkyosJq
	UQVCQGjJW26sp/wwjVuXj4dPYT0K0efbB33csBCi84o0jgYMDCXvIXlx0vXn0QnSyr45adTZMzno4
	FKTjH2drPxWCuv34I1S/gnaUdz1uK/kW2IfUEiLXCHorvikG6eKUrUKxaGVxZIWzCA3w=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vChKg-0000am-26;
	Sat, 25 Oct 2025 16:41:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yury.norov@gmail.com>) id 1vChKe-0000af-QC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Oct 2025 16:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=; b=c2irdOdkn5RxVg167fbscIzu81
 UiwynJxlK+/zN5q98MZPkYGoE8qhwni8yMmqlO0AAks5TCuOUmtYom5XbXiLDAORlsseDzAG99XzM
 QVsUPbMFIK7FE95WDA2X3lSir7uR+LjQ5pIU8kregPqWUP4RRS4VF/wWmEjXVimbGaDo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=; b=fDhvME5rNkNczgNeMa+N1wWODJ
 aikOT60cIMvETiJeYJHzXqvqn3E4UJJluzwR7/ASEq/J1s3oFICfWbgUso0mi8hN67WltomVgHCnh
 z1TODUxO3bD0BMDvq9eJlYd8yASyl0FZcjDM+/xIingqnD8PgLSUxeXLUMk9k3NgieJ4=;
Received: from mail-qt1-f181.google.com ([209.85.160.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vChKe-0004Z9-BN for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Oct 2025 16:41:32 +0000
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4e8b90e9328so23782631cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Oct 2025 09:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761410481; x=1762015281; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=;
 b=cL4036iTzCfi1Uft6+NRObblQ84QknJCyXDWgoGKv1mwymssg2DPDcRm6hNO5BdcW+
 xT4lfaFasVdhlSj3b7hDlSukYRsS0mBHBcjZOwEKcpWfLtes3aQmdb8IRGd1YmoJxAHp
 wire1CTt65Vz/0EXq43iSPqqCAwYFwc0UkYIaz2nNvjPqsyEgURyiwZ0q/ZY1KX4ouui
 LJxiaYFfp9ZTtGMJvGE+03djAcKfpfdtJ8dmq/4vrVLeDEY5reuoYNGRkZ+OdcI+x3ps
 499EA3rNrPMBwb4a3uE/AaCivOYuHYPLrV+X2iG2kxeKprDK5Mv/Qx10ow6J9RJziTvN
 QxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761410481; x=1762015281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=;
 b=O2yVIJC1OcWlQ8JbMax7TtR1cl5535Bpx3ii3GJtw4a3De8PQLt/kcWXAOZSl0IbUN
 Xljm5qk9D98pNvZ7AWK+a8eMJWQSCF3LSvudA6gFUurpr9+F5KSGTZqjQo0PwQ9Vxf6G
 Y6OnDSQ19rp8Q3605Px5dLjwLIN3P1V7abyBDOLcPVLEp8OtPLW65/6hmKYUgia44fPH
 38NWZp9MapdSKyh/t6Jkrr+WRx4UEt6SX6cFXt5YbjCKYXDLeO+x0YwbpipScAxoZLyt
 zKSWsZ1P6VgsVPaqVeCNoh5E2PX5T8RHarNlQj/qlj0Ni3Oz4HtqgeVjTfuspeH/cH5b
 MV+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/bo2r87ma7xBDGqpO94Mn+BHCLXGD4LXVNzEWal4NguzLMsda0ULO3d42EhymU3gWZejFANJ4WdWqvj28QEKj@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwuxA+FJj1XbLMzO5bGND4vD9XMbloHCm/rQC3aAr+shXwYG4oA
 5zH1knGf//Z7hHPZy3izvuTdwksPXIUnxN6NUJOrgyFnPD8nCZNo2/va
X-Gm-Gg: ASbGncvD+qoZPlWeDMRoTEi9VzRTYXTIRD1zf93qce/c2yTzNzQokF4HOaL7sraA/QC
 KfDtZBjJedFFv+qf90Dm/pOj4/8uY78ujVmJa+y9RcTHLp1anPHNTnbVWrU1bIpbh04OJ82K7F+
 HklizwF58bZrPL15vI1eNk0lARAE5JwdR7gBjJ5KO6rcoalPX4kMXgXnyYittghevGGpYcRL5SX
 yvsIwZGHtQbJK4HFOePgWy/nNIsbw/w21S75UWmD0EqpnWogtp9OhCGE4jh9gp6iCQlOgmRzg+A
 ZXDkrh5XnZpjoNvZg48y2WdEPJErhJ46bf2jwRbqy85XVgsaS4nfpucdNNbFRhRFsmavxAoPuJ+
 9vTVB7EA5Klv15U06onAUmnHNXRwduVewwgEyfewYenio4Hd6eZdOydWtJnF2OZh5Vn0V9oUj
X-Google-Smtp-Source: AGHT+IEbSTHOPYn/ssbsalfndo2SE/aquOPMKCRUcU70dpCWt75EhJinxXayNqNWEpmv6XMRvXc8Dg==
X-Received: by 2002:a05:622a:48f:b0:4e8:aad2:391c with SMTP id
 d75a77b69052e-4e8aad23e00mr349567941cf.1.1761410481317; 
 Sat, 25 Oct 2025 09:41:21 -0700 (PDT)
Received: from localhost ([12.22.141.131]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4eba3858f1esm15257191cf.29.2025.10.25.09.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Oct 2025 09:41:20 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Jinjiang Tu <tujinjiang@huawei.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Andrei Vagin <avagin@gmail.com>,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Sat, 25 Oct 2025 12:40:18 -0400
Message-ID: <20251025164023.308884-20-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025164023.308884-1-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  GENMASK(high, low) notation is confusing. FIRST/LAST_BITS()
 are more appropriate. Signed-off-by: Yury Norov (NVIDIA) ---
 fs/erofs/internal.h
 | 2 +- fs/f2fs/data.c | 2 +- fs/f2fs/inode.c | 2 +- fs/f2fs/segment.c | 2
 +- fs/f2fs/super.c | 2 +- fs/proc/task_mmu.c | 2 +- fs/resctrl/ps [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yury.norov(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vChKe-0004Z9-BN
Subject: [f2fs-dev] [PATCH 19/21] fs: don't use GENMASK()
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
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Yury Norov \(NVIDIA\)" <yury.norov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

GENMASK(high, low) notation is confusing. FIRST/LAST_BITS() are
more appropriate.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 fs/erofs/internal.h      | 2 +-
 fs/f2fs/data.c           | 2 +-
 fs/f2fs/inode.c          | 2 +-
 fs/f2fs/segment.c        | 2 +-
 fs/f2fs/super.c          | 2 +-
 fs/proc/task_mmu.c       | 2 +-
 fs/resctrl/pseudo_lock.c | 2 +-
 include/linux/f2fs_fs.h  | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index f7f622836198..6e0f03092c52 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -250,7 +250,7 @@ static inline u64 erofs_nid_to_ino64(struct erofs_sb_info *sbi, erofs_nid_t nid)
 	 * Note: on-disk NIDs remain unchanged as they are primarily used for
 	 * compatibility with non-LFS 32-bit applications.
 	 */
-	return ((nid << 1) & GENMASK_ULL(63, 32)) | (nid & GENMASK(30, 0)) |
+	return ((nid << 1) & LAST_BITS_ULL(32)) | (nid & FIRST_BITS(31)) |
 		((nid >> EROFS_DIRENT_NID_METABOX_BIT) << 31);
 }
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 775aa4f63aa3..ef08464e003f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -416,7 +416,7 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 
 static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 {
-	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
+	unsigned int temp_mask = FIRST_BITS(NR_TEMP_TYPE);
 	unsigned int fua_flag, meta_flag, io_flag;
 	blk_opf_t op_flags = 0;
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8c4eafe9ffac..42a43f558136 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -524,7 +524,7 @@ static int do_read_inode(struct inode *inode)
 			fi->i_compress_level = compress_flag >>
 						COMPRESS_LEVEL_OFFSET;
 			fi->i_compress_flag = compress_flag &
-					GENMASK(COMPRESS_LEVEL_OFFSET - 1, 0);
+						FIRST_BITS(COMPRESS_LEVEL_OFFSET);
 			fi->i_cluster_size = BIT(fi->i_log_cluster_size);
 			set_inode_flag(inode, FI_COMPRESSED_FILE);
 		}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b45eace879d7..64433d3b67d4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5425,7 +5425,7 @@ static int do_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 		wp_block = zbd->start_blk + (zone.wp >> log_sectors_per_block);
 		wp_segno = GET_SEGNO(sbi, wp_block);
 		wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
-		wp_sector_off = zone.wp & GENMASK(log_sectors_per_block - 1, 0);
+		wp_sector_off = zone.wp & FIRST_BITS(log_sectors_per_block);
 
 		if (cs->segno == wp_segno && cs->next_blkoff == wp_blkoff &&
 				wp_sector_off == 0)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index db7afb806411..96621fd45cdc 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4501,7 +4501,7 @@ static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
 	unsigned long flags;
 
 	spin_lock_irqsave(&sbi->error_lock, flags);
-	if (sbi->stop_reason[reason] < GENMASK(BITS_PER_BYTE - 1, 0))
+	if (sbi->stop_reason[reason] < FIRST_BITS(BITS_PER_BYTE))
 		sbi->stop_reason[reason]++;
 	spin_unlock_irqrestore(&sbi->error_lock, flags);
 }
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index fc35a0543f01..71de487b244c 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1845,7 +1845,7 @@ struct pagemapread {
 
 #define PM_ENTRY_BYTES		sizeof(pagemap_entry_t)
 #define PM_PFRAME_BITS		55
-#define PM_PFRAME_MASK		GENMASK_ULL(PM_PFRAME_BITS - 1, 0)
+#define PM_PFRAME_MASK		FIRST_BITS_ULL(PM_PFRAME_BITS)
 #define PM_SOFT_DIRTY		BIT_ULL(55)
 #define PM_MMAP_EXCLUSIVE	BIT_ULL(56)
 #define PM_UFFD_WP		BIT_ULL(57)
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 87bbc2605de1..45703bbd3bca 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -30,7 +30,7 @@
  */
 static unsigned int pseudo_lock_major;
 
-static unsigned long pseudo_lock_minor_avail = GENMASK(MINORBITS, 0);
+static unsigned long pseudo_lock_minor_avail = FIRST_BITS(MINORBITS + 1);
 
 static char *pseudo_lock_devnode(const struct device *dev, umode_t *mode)
 {
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 6afb4a13b81d..9996356b79e0 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -356,7 +356,7 @@ enum {
 	OFFSET_BIT_SHIFT
 };
 
-#define OFFSET_BIT_MASK		GENMASK(OFFSET_BIT_SHIFT - 1, 0)
+#define OFFSET_BIT_MASK		FIRST_BITS(OFFSET_BIT_SHIFT)
 
 struct f2fs_node {
 	/* can be one of three types: inode, direct, and indirect types */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
