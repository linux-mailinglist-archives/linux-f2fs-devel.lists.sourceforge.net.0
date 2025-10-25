Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A91C098B0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Oct 2025 18:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfKmLjWeLqac0dNwN8UCFLFGh6vGW2GM0Ubh/X7gQYI=; b=I+bt2QJADZ8+f2qpKO5NM7iWrN
	1isO94B6/XjS8p7o60dfm6aOiSmK86ffTB0/rdNU4OzWsUwh37ASELjnJDH23iF4UvPhDpmWj+AN8
	CfUsbmOtDcnk0povSG2PEJTF4GlOUJmyppNUX9FYbdDP8jDQ8Gp1GGy/+KSUiFXHNjvQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vChDx-0000uI-GJ;
	Sat, 25 Oct 2025 16:34:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yury.norov@gmail.com>) id 1vChD4-0000tA-Hs
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Oct 2025 16:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=; b=N9iOKz2LhnXVt3/UcBeg1ZP4ww
 BvNl2DSvoyuNg/zGvJa8NR1D5zlqkYy0R8X4VIl3DJ2w8xWtz69JzjX1WDSG3Uwexz+I3i4SakxUh
 L1JKSBLRb+DRQnie5nZvYIJ75BYz3reQrqE4yJJJaqFPWKvCU4ZeRKlzjxzloutMUI6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=; b=g0s8IXFnjpRf5MSFDsVEvP/Sta
 EsArV6xIjY7oXFZHO8KvGBjh+Lkpfc0P5hdkcm7hQOrWgCjeUvi2IBUfqjHA1YFcruhtfxXjnxFYe
 rnjrqZQugvjsIw7L4LBg7O5LUj+oaurR6NUc1cUsmST7cuh8Ma+dyY6B0WNCydWDSTkY=;
Received: from mail-qv1-f54.google.com ([209.85.219.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vChD4-00042f-23 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Oct 2025 16:33:42 +0000
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-87de60d0e3eso31617016d6.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Oct 2025 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761410016; x=1762014816; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=;
 b=LrzD9mO244lCfL+T57qYPqfM+Zj4pLkWBv53Y+Ca3jXaI+Vkc6Z2OVCSwA4jKI154v
 lDTo58KBwX9vrK6sgVgUCqMMHW8bqpqdgcmKxsONdm3gAW1Y5ohFXVEy4zVIfUOstPEp
 H3OF8ueHqsBCU4//Jl0Ou4cX2i/4KKZ2okxteciuILmHrKNj1QS5P5QJUHRU3/+ytJwT
 6os2feXjTdO8OHkfHjo4MMb4EjsJXt2P2BCL7s3StoF9QtQPajCxAeNXIIJhgQFMeFjG
 xmZy1nVHyqsDzJJORpxmsui+ngoLUZ2AvL+Mb2F9ZKiCKNbJvrhcxzrk0/qWMC8iXLLX
 wCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761410016; x=1762014816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+kdgwxqgLpSk+BXagyhyh0KizQR0PlmXlxRpNRvoio=;
 b=kqQeMLBRwhnVh32+sAwrwsOkiTbxQCd14SrmFGdg+vN0pVAxA/i6tyDmonlH1+Hjg4
 edcB51a6iM4XS3SJkxe6YL0mauKu88MmQ1dzyHIDuJezfxtTeGkSngQYcCPC5En49+zf
 JwbEGrZDwmMNdq4c0zKxF3BdV3XWQhLCCwW52Hiemxh1sdSsZmIULrf+pokfK/OZ2dt9
 EOdicLXcfRnHeW/u/IqMrmNakJmp5q017y0m+jO04+AJeT5jg5L6qVQ2pgpeBWonentB
 WvoS9Iji5Uzcznme5J3obJie/krGxsUEs4oqkezCCInHoX+MDPT1WuUP43qr02rT6/HH
 E8cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWokREpmsEGS8EslJPintnBYkzYmqovw/VdtVzP36yhqCFj2fSREa2XnU+FQJbkuiBC6OSO3g58KddvmPR0L/+G@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzbWyci4+bm961DzJpV0XfXKtyXeM67XS50di+SSeceN8y5Wsfp
 YNF+oOKQecFmd5s51OlZ3zC+MeRyJDC/t5jVck+b9nsARGO6NnbyHGMn
X-Gm-Gg: ASbGncuqK5fMe25YMrRBCoeECktAH8GqvR2fU0yLn6LR/tLGFmP1YjShE8h+k/1SEJw
 1FBif5urPJ13Bqyfk5sf6S6d4xz4DEjE6vfiAoKFsyW8/3h7owp1nvAucBObbJDF6vTZ1glpdzs
 OnovK7y+hRME0O7G3A3PgBS2WEgHCsHQqTTr0E7zxkTgPsqoARmjKzo0Mbd+QjJtspNJc7gIGUQ
 pfPBNBZX+2r7OLs+udMkOhU5Nbzs9t/C8iO/skFztsA33UApIleXm80h1o/w5rIoNs9fVwuvm1t
 cZ2Doz5A24a9vw/CQ0XiTr/JSwdedpRqD15jyhrjYjUMx9Dew6GMbydw1J4zWd5bszeuExAWb4I
 ntD/AmUBRUQhPsUS5WVMxPQmn09sJEz4L6UfHvSlCzLSvpwLszXcBYGymVTo3hSH4Hl7F86lT
X-Google-Smtp-Source: AGHT+IFUNq9E9F5tkFvF4iIGRPUJo2bGn0CXF3o3/vXLG4KH0hAs0g3n//wSNOK/rhmKbOn3qmKqqg==
X-Received: by 2002:a05:6214:f6d:b0:87c:1032:e849 with SMTP id
 6a1803df08f44-87f9edc81b9mr140672916d6.30.1761410016037; 
 Sat, 25 Oct 2025 09:33:36 -0700 (PDT)
Received: from localhost ([12.22.141.131]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc48a8bc4sm16252346d6.7.2025.10.25.09.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Oct 2025 09:33:35 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Sat, 25 Oct 2025 12:33:01 -0400
Message-ID: <20251025163305.306787-12-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yury.norov(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.219.54 listed in list.dnswl.org]
X-Headers-End: 1vChD4-00042f-23
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
Cc: "Yury Norov \(NVIDIA\)" <yury.norov@gmail.com>
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
