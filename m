Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99743C0CA29
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 10:24:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NB07RQ2e/HazBbyvA2TBOaX7qO1yqbHe40eT1WP6dj4=; b=CmeHwDZh4fwDO9bDLnH9p3DwLY
	gTayw96CDTpmkFqwKYWzSJYKLuujDktivFeXDAmzqlD5S42yy2keHy1k8RbsJO9Kqj82UYQAhmaxE
	Eal9JQQIhMXjbn5qO56PR3rTVLnpVWJBJFP1tCE1SF0HtNuekjokZIb2shjioQZYIFcA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDJSx-0003ve-5V;
	Mon, 27 Oct 2025 09:24:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hexiaole1994@126.com>) id 1vDJSZ-0003uo-LT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 09:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oBP7+tHGxe9BmbqxkJRcuHmO2ZjvxtiBHaeh2QGjUL0=; b=TrTYwQkbcJD/9vmqmA6nBxvjl0
 g0Pj4RHS+tUvh1PCYTtCkpoSdf437iLs0/dwlqQENdFM1w2lDUTSf7+by5zpnT3C/bc6+DaU2JU52
 lg3qYtIHodFDprXh8XL1ociAqhHzI91mTNDKw2qDnuLubWfV2Z64gahQhLWZQ8n7g/c8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oBP7+tHGxe9BmbqxkJRcuHmO2ZjvxtiBHaeh2QGjUL0=; b=erMI3mICnczv5rsQHnXVdiZfZl
 QyhzWRPodMSBUblvV/uiTl35nyLTExfRnfqJwoHdWkpnH6AjJ6ffNUT5gJnPJo+GyeUNuvHKbfPap
 doKSDZLilINQcz2aqDgCc7Zy7gcd2OlmW3ROmRG5UYmsue4v9s7O9s1GaRypndf5T73k=;
Received: from m16.mail.126.com ([117.135.210.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDJSR-0006cR-P6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 09:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oB
 P7+tHGxe9BmbqxkJRcuHmO2ZjvxtiBHaeh2QGjUL0=; b=Nv+qhXxZzR7Ok2d+VM
 Ix7vgAHJHdeai35Z4TQP0OYIS3o/8/12wAD7VDZZ129mRvkv77oPm+fNsfgRLvPS
 IIs9tGlVtt/Z8EFiJ9EyBOKtpbXRbGs/MIxtXmoXxhDPXVdcSI0WxRH5hGf+7LM3
 SuXVPGzLpyiE9XNjx/+bzQq5Y=
Received: from gt-ubuntu22-04-cmd-v3-0-64gb-25m.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3p5YgOv9otPZyAg--.9797S2; 
 Mon, 27 Oct 2025 17:23:45 +0800 (CST)
From: Xiaole He <hexiaole1994@126.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 27 Oct 2025 17:23:41 +0800
Message-Id: <20251027092341.5011-1-hexiaole1994@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023035416.7943-1-hexiaole1994@126.com>
References: <20251023035416.7943-1-hexiaole1994@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3p5YgOv9otPZyAg--.9797S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gr43CFWDXrW7ur4fCw4Durg_yoW7CrWDp3
 4xCF15Kr45uw48Xa92vr1kCF1S9w4kJFWxGrZFy34jva45X34fWF1kt345ZrWvqF4rXF1D
 Za1Y934UJw1UGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziK0PfUUUUU=
X-Originating-IP: [36.103.234.105]
X-CM-SenderInfo: 5kh0xt5rohimizu6ij2wof0z/1tbijgnzBmj-NLOCkQAAsx
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The age extent cache uses last_blocks (derived from
 allocated_data_blocks)
 to determine data age. However, there's a conflict between the deletion marker
 (last_blocks=0) and legitimate last_blocks=0 c [...] 
 Content analysis details:   (1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [hexiaole1994(at)126.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [hexiaole1994(at)126.com]
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [117.135.210.9 listed in dnsbl-2.uceprotect.net]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vDJSR-0006cR-P6
Subject: [f2fs-dev] [PATCH v2] f2fs: fix age extent cache insertion skip on
 counter overflow
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
Cc: jaegeuk@kernel.org, Xiaole He <hexiaole1994@126.com>,
 linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The age extent cache uses last_blocks (derived from
allocated_data_blocks) to determine data age. However, there's a
conflict between the deletion
marker (last_blocks=0) and legitimate last_blocks=0 cases when
allocated_data_blocks overflows to 0 after reaching ULLONG_MAX.

In this case, valid extents are incorrectly skipped due to the
"if (!tei->last_blocks)" check in __update_extent_tree_range().

This patch fixes the issue by:
1. Reserving ULLONG_MAX as an invalid/deletion marker
2. Limiting allocated_data_blocks to range [0, ULLONG_MAX-1]
3. Using F2FS_EXTENT_AGE_INVALID for deletion scenarios
4. Adjusting overflow age calculation from ULLONG_MAX to (ULLONG_MAX-1)

Reproducer (using a patched kernel with allocated_data_blocks
initialized to ULLONG_MAX - 3 for quick testing):

Step 1: Mount and check initial state
  # dd if=/dev/zero of=/tmp/test.img bs=1M count=100
  # mkfs.f2fs -f /tmp/test.img
  # mkdir -p /mnt/f2fs_test
  # mount -t f2fs -o loop,age_extent_cache /tmp/test.img /mnt/f2fs_test
  # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
  Allocated Data Blocks: 18446744073709551612 # ULLONG_MAX - 3
  Inner Struct Count: tree: 1(0), node: 0

Step 2: Create files and write data to trigger overflow
  # touch /mnt/f2fs_test/{1,2,3,4}.txt; sync
  # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
  Allocated Data Blocks: 18446744073709551613 # ULLONG_MAX - 2
  Inner Struct Count: tree: 5(0), node: 1

  # dd if=/dev/urandom of=/mnt/f2fs_test/1.txt bs=4K count=1; sync
  # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
  Allocated Data Blocks: 18446744073709551614 # ULLONG_MAX - 1
  Inner Struct Count: tree: 5(0), node: 2

  # dd if=/dev/urandom of=/mnt/f2fs_test/2.txt bs=4K count=1; sync
  # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
  Allocated Data Blocks: 18446744073709551615 # ULLONG_MAX
  Inner Struct Count: tree: 5(0), node: 3

  # dd if=/dev/urandom of=/mnt/f2fs_test/3.txt bs=4K count=1; sync
  # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
  Allocated Data Blocks: 0 # Counter overflowed!
  Inner Struct Count: tree: 5(0), node: 4

Step 3: Trigger the bug - next write should create node but gets skipped
  # dd if=/dev/urandom of=/mnt/f2fs_test/4.txt bs=4K count=1; sync
  # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
  Allocated Data Blocks: 1
  Inner Struct Count: tree: 5(0), node: 4

  Expected: node: 5 (new extent node for 4.txt)
  Actual: node: 4 (extent insertion was incorrectly skipped due to
  last_blocks = allocated_data_blocks = 0 in __get_new_block_age)

After this fix, the extent node is correctly inserted and node count
becomes 5 as expected.

Fixes: 71644dff4811 ("f2fs: add block_age-based extent cache")
Cc: stable@kernel.org
Signed-off-by: Xiaole He <hexiaole1994@126.com>
---
Changes in v2:
- Added Fixes tag and Cc stable
- Updated reproducer to use 'grep -A 4' for better output clarity
---
 fs/f2fs/extent_cache.c | 5 +++--
 fs/f2fs/f2fs.h         | 6 ++++++
 fs/f2fs/segment.c      | 9 +++++++--
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 33e09c453c70..0ed84cc065a7 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -808,7 +808,7 @@ static void __update_extent_tree_range(struct inode *inode,
 	}
 	goto out_read_extent_cache;
 update_age_extent_cache:
-	if (!tei->last_blocks)
+	if (tei->last_blocks == F2FS_EXTENT_AGE_INVALID)
 		goto out_read_extent_cache;
 
 	__set_extent_info(&ei, fofs, len, 0, false,
@@ -912,7 +912,7 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
 			cur_age = cur_blocks - tei.last_blocks;
 		else
 			/* allocated_data_blocks overflow */
-			cur_age = ULLONG_MAX - tei.last_blocks + cur_blocks;
+			cur_age = (ULLONG_MAX - 1) - tei.last_blocks + cur_blocks;
 
 		if (tei.age)
 			ei->age = __calculate_block_age(sbi, cur_age, tei.age);
@@ -1114,6 +1114,7 @@ void f2fs_update_age_extent_cache_range(struct dnode_of_data *dn,
 	struct extent_info ei = {
 		.fofs = fofs,
 		.len = len,
+		.last_blocks = F2FS_EXTENT_AGE_INVALID,
 	};
 
 	if (!__may_extent_tree(dn->inode, EX_BLOCK_AGE))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5b4e9548a231..fa3c676adc30 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -707,6 +707,12 @@ enum extent_type {
 	NR_EXTENT_CACHES,
 };
 
+/*
+ * Reserved value to mark invalid age extents, hence valid block range
+ * from 0 to ULLONG_MAX-1
+ */
+#define F2FS_EXTENT_AGE_INVALID	ULLONG_MAX
+
 struct extent_info {
 	unsigned int fofs;		/* start offset in a file */
 	unsigned int len;		/* length of the extent */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b45eace879d7..a473cd1fb37d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3863,8 +3863,13 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
 	locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
 	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
 
-	if (IS_DATASEG(curseg->seg_type))
-		atomic64_inc(&sbi->allocated_data_blocks);
+	if (IS_DATASEG(curseg->seg_type)) {
+		unsigned long long new_val;
+
+		new_val = atomic64_inc_return(&sbi->allocated_data_blocks);
+		if (unlikely(new_val == ULLONG_MAX))
+			atomic64_set(&sbi->allocated_data_blocks, 0);
+	}
 
 	up_write(&sit_i->sentry_lock);
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
