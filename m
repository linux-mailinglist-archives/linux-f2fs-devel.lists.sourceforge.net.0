Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7C22002B6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 09:29:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmBSZ-00083c-EF; Fri, 19 Jun 2020 07:29:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jmBSX-00083V-U9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 07:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+4o14Ew+zQbkfmpe0oEPK9VzxlEWj9t3quenLA3sNFA=; b=hUhLSU3GPMwlqXU7C57SPEkkKp
 DzB3vUZtCpHeRyA+lrYUurlju63zkGvhmyq7rpKwNZRxa6ABdLFcyzbCd6hCjiTgqhCc2j2MxZMeQ
 32ZPKdUX1cS/f0OL/UmKmNkkO/JrDUunfzfPYHdXsdg+AlMTzZn8cjC4TkqLEb8KzSoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+4o14Ew+zQbkfmpe0oEPK9VzxlEWj9t3quenLA3sNFA=; b=DWrwLXb6+EMXMXzooXqwlbexHL
 aazOdUeQbUZnQ0JYZkkO8QyX2qyzYNxx7Kmgb12BOlzYxb6KaeVmIjCNgrqHaFGaT3OWmgQ1Woh6+
 zFh0157D/zQLF4Y6TDkxE2eg/A57QpT9B45o9hqqcYwdM4dcdHA5eNasVq0mBEAPxMIk=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jmBSV-00Bgok-4Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 07:29:09 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C6557FF27759ABF67639;
 Fri, 19 Jun 2020 15:28:54 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 19 Jun
 2020 15:28:51 +0800
To: <zhaowuyun@wingtech.com>, <jaegeuk@kernel.org>
References: <1592548634-1065-1-git-send-email-zhaowuyun@wingtech.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2b44ed71-deba-2c48-bd8a-6b6099fe5a8f@huawei.com>
Date: Fri, 19 Jun 2020 15:28:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1592548634-1065-1-git-send-email-zhaowuyun@wingtech.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wingtech.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jmBSV-00Bgok-4Q
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: introduce set_node_footer to
 initialize node footer
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

On 2020/6/19 14:37, zhaowuyun@wingtech.com wrote:
> From: Wuyun Zhao <zhaowuyun@wingtech.com>
> 
> the filesystem will use the cold flag, so deal with it to avoid
> potential issue of inconsistency
> 
> Signed-off-by: Wuyun Zhao <zhaowuyun@wingtech.com>
> ---
>  fsck/dir.c         |  6 +-----
>  fsck/node.c        |  9 +++++----
>  include/f2fs_fs.h  | 20 ++++++++++++++++++++
>  mkfs/f2fs_format.c | 14 +++++---------
>  4 files changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/fsck/dir.c b/fsck/dir.c
> index 5f4f75e..64aa539 100644
> --- a/fsck/dir.c
> +++ b/fsck/dir.c
> @@ -517,11 +517,7 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
>  	}
>  
>  	set_file_temperature(sbi, node_blk, de->name);
> -
> -	node_blk->footer.ino = cpu_to_le32(de->ino);
> -	node_blk->footer.nid = cpu_to_le32(de->ino);
> -	node_blk->footer.flag = 0;
> -	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
> +	set_node_footer(node_blk, de->ino, de->ino, 0, le64_to_cpu(ckpt->checkpoint_ver), S_ISDIR(mode));
>  
>  	if (S_ISDIR(mode)) {
>  		make_empty_dir(sbi, node_blk);
> diff --git a/fsck/node.c b/fsck/node.c
> index 229a99c..66e8a81 100644
> --- a/fsck/node.c
> +++ b/fsck/node.c
> @@ -69,16 +69,17 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
>  	block_t blkaddr = NULL_ADDR;
>  	int type;
>  	int ret;
> +	u32 ino;

nid_t ino;

> +	u64 cp_ver;
>  
>  	f2fs_inode = dn->inode_blk;
>  
>  	node_blk = calloc(BLOCK_SZ, 1);
>  	ASSERT(node_blk);
>  
> -	node_blk->footer.nid = cpu_to_le32(dn->nid);
> -	node_blk->footer.ino = f2fs_inode->footer.ino;
> -	node_blk->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
> -	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
> +	ino = le32_to_cpu(f2fs_inode->footer.ino);
> +	cp_ver = le64_to_cpu(ckpt->checkpoint_ver);
> +	set_node_footer(node_blk, dn->nid, ino, ofs, cp_ver, S_ISDIR(le16_to_cpu(f2fs_inode->i.i_mode)));
>  
>  	type = CURSEG_COLD_NODE;
>  	if (IS_DNODE(node_blk)) {
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 709bfd8..3583df4 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -923,6 +923,26 @@ struct f2fs_node {
>  	struct node_footer footer;
>  } __attribute__((packed));
>  
> +static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
> +{
> +	unsigned int flag = le32_to_cpu(rn->footer.flag);
> +
> +	if (is_dir)
> +		flag &= ~(0x1 << COLD_BIT_SHIFT);
> +	else
> +		flag |= (0x1 << COLD_BIT_SHIFT);
> +	rn->footer.flag = cpu_to_le32(flag);
> +}
> +
> +static inline void set_node_footer(struct f2fs_node *rn, u32 nid, u32 ino, u32 ofs, u64 ver, bool is_dir)

Sorry, I forgot to add parameter for next_blkaddr...

Could you check this?

From: Wuyun Zhao <zhaowuyun@wingtech.com>
Subject: [PATCH] f2fs-tools: introduce set_node_footer to initialize node
 footer

the filesystem will use the cold flag, so deal with it to avoid
potential issue of inconsistency

Signed-off-by: Wuyun Zhao <zhaowuyun@wingtech.com>
---
 fsck/dir.c         |  7 ++-----
 fsck/node.c        |  8 ++++----
 include/f2fs_fs.h  | 23 +++++++++++++++++++++++
 mkfs/f2fs_format.c | 34 +++++++++++++---------------------
 4 files changed, 42 insertions(+), 30 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 5f4f75ebed77..b067aec9cffd 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -517,11 +517,8 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 	}

 	set_file_temperature(sbi, node_blk, de->name);
-
-	node_blk->footer.ino = cpu_to_le32(de->ino);
-	node_blk->footer.nid = cpu_to_le32(de->ino);
-	node_blk->footer.flag = 0;
-	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
+	set_node_footer(node_blk, de->ino, de->ino, 0,
+			le64_to_cpu(ckpt->checkpoint_ver), 0, S_ISDIR(mode));

 	if (S_ISDIR(mode)) {
 		make_empty_dir(sbi, node_blk);
diff --git a/fsck/node.c b/fsck/node.c
index 229a99cab481..da010ff669cc 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -69,16 +69,16 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 	block_t blkaddr = NULL_ADDR;
 	int type;
 	int ret;
+	nid_t ino = le32_to_cpu(f2fs_inode->footer.ino);
+	u64 cp_ver = le64_to_cpu(ckpt->checkpoint_ver);

 	f2fs_inode = dn->inode_blk;

 	node_blk = calloc(BLOCK_SZ, 1);
 	ASSERT(node_blk);

-	node_blk->footer.nid = cpu_to_le32(dn->nid);
-	node_blk->footer.ino = f2fs_inode->footer.ino;
-	node_blk->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
-	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
+	set_node_footer(node_blk, dn->nid, ino, ofs, cp_ver, 0,
+			S_ISDIR(le16_to_cpu(f2fs_inode->i.i_mode)));

 	type = CURSEG_COLD_NODE;
 	if (IS_DNODE(node_blk)) {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 265f50c69fd1..0fe478ed820c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -923,6 +923,29 @@ struct f2fs_node {
 	struct node_footer footer;
 } __attribute__((packed));

+static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
+{
+	unsigned int flag = le32_to_cpu(rn->footer.flag);
+
+	if (is_dir)
+		flag &= ~(0x1 << COLD_BIT_SHIFT);
+	else
+		flag |= (0x1 << COLD_BIT_SHIFT);
+	rn->footer.flag = cpu_to_le32(flag);
+}
+
+static inline void set_node_footer(struct f2fs_node *rn, u32 nid, u32 ino,
+					u32 ofs, u64 ver, block_t blkaddr,
+					bool is_dir)
+{
+	rn->footer.nid = cpu_to_le32(nid);
+	rn->footer.ino = cpu_to_le32(ino);
+	rn->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
+	rn->footer.cp_ver = cpu_to_le64(ver);
+	rn->footer.next_blkaddr = cpu_to_le32(blkaddr);
+	set_cold_node(rn, is_dir);
+}
+
 /*
  * For NAT entries
  */
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 44575e0049fa..cb40e5a76332 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1094,6 +1094,9 @@ static int f2fs_write_root_inode(void)
 	struct f2fs_node *raw_node = NULL;
 	u_int64_t blk_size_bytes, data_blk_nor;
 	u_int64_t main_area_node_seg_blk_offset = 0;
+	nid_t nid = le32_to_cpu(sb->root_ino);
+	block_t blkaddr = cpu_to_le32(get_sb(main_blkaddr) +
+				c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg + 1);

 	raw_node = calloc(F2FS_BLKSIZE, 1);
 	if (raw_node == NULL) {
@@ -1101,13 +1104,7 @@ static int f2fs_write_root_inode(void)
 		return -1;
 	}

-	raw_node->footer.nid = sb->root_ino;
-	raw_node->footer.ino = sb->root_ino;
-	raw_node->footer.cp_ver = cpu_to_le64(1);
-	raw_node->footer.next_blkaddr = cpu_to_le32(
-			get_sb(main_blkaddr) +
-			c.cur_seg[CURSEG_HOT_NODE] *
-			c.blks_per_seg + 1);
+	set_node_footer(raw_node, nid, nid, 0, 1, blkaddr, 1);

 	raw_node->i.i_mode = cpu_to_le16(0x41ed);
 	if (c.lpf_ino)
@@ -1256,6 +1253,10 @@ static int f2fs_write_qf_inode(int qtype)
 	u_int64_t main_area_node_seg_blk_offset = 0;
 	__le32 raw_id;
 	int i;
+	nid_t qf_ino = le32_to_cpu(sb->qf_ino[qtype]);
+	block_t blkaddr = cpu_to_le32(get_sb(main_blkaddr) +
+					c.cur_seg[CURSEG_HOT_NODE] *
+					c.blks_per_seg + 1 + qtype + 1);

 	raw_node = calloc(F2FS_BLKSIZE, 1);
 	if (raw_node == NULL) {
@@ -1263,13 +1264,7 @@ static int f2fs_write_qf_inode(int qtype)
 		return -1;
 	}

-	raw_node->footer.nid = sb->qf_ino[qtype];
-	raw_node->footer.ino = sb->qf_ino[qtype];
-	raw_node->footer.cp_ver = cpu_to_le64(1);
-	raw_node->footer.next_blkaddr = cpu_to_le32(
-			get_sb(main_blkaddr) +
-			c.cur_seg[CURSEG_HOT_NODE] *
-			c.blks_per_seg + 1 + qtype + 1);
+	set_node_footer(raw_node, qf_ino, qf_ino, 0, 1, blkaddr, 0);

 	raw_node->i.i_mode = cpu_to_le16(0x8180);
 	raw_node->i.i_links = cpu_to_le32(1);
@@ -1447,6 +1442,9 @@ static int f2fs_write_lpf_inode(void)
 	struct f2fs_node *raw_node;
 	u_int64_t blk_size_bytes, main_area_node_seg_blk_offset;
 	block_t data_blk_nor;
+	block_t blkaddr = cpu_to_le32(get_sb(main_blkaddr) +
+				c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg +
+				1 + c.quota_inum + 1);
 	int err = 0;

 	ASSERT(c.lpf_ino);
@@ -1457,13 +1455,7 @@ static int f2fs_write_lpf_inode(void)
 		return -1;
 	}

-	raw_node->footer.nid = cpu_to_le32(c.lpf_ino);
-	raw_node->footer.ino = raw_node->footer.nid;
-	raw_node->footer.cp_ver = cpu_to_le64(1);
-	raw_node->footer.next_blkaddr = cpu_to_le32(
-			get_sb(main_blkaddr) +
-			c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg +
-			1 + c.quota_inum + 1);
+	set_node_footer(raw_node, c.lpf_ino, c.lpf_ino, 0, 1, blkaddr, 1);

 	raw_node->i.i_mode = cpu_to_le16(0x41c0); /* 0700 */
 	raw_node->i.i_links = cpu_to_le32(2);
-- 
2.26.2




> +{
> +	rn->footer.nid = cpu_to_le32(nid);
> +	rn->footer.ino = cpu_to_le32(ino);
> +	rn->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
> +	rn->footer.cp_ver = cpu_to_le64(ver);
> +	set_cold_node(rn, is_dir);
> +}
> +
>  /*
>   * For NAT entries
>   */
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 44575e0..b371adf 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -1101,9 +1101,7 @@ static int f2fs_write_root_inode(void)
>  		return -1;
>  	}
>  
> -	raw_node->footer.nid = sb->root_ino;
> -	raw_node->footer.ino = sb->root_ino;
> -	raw_node->footer.cp_ver = cpu_to_le64(1);
> +	set_node_footer(raw_node, le32_to_cpu(sb->root_ino), le32_to_cpu(sb->root_ino), 0, 1, 1);
>  	raw_node->footer.next_blkaddr = cpu_to_le32(
>  			get_sb(main_blkaddr) +
>  			c.cur_seg[CURSEG_HOT_NODE] *
> @@ -1256,6 +1254,7 @@ static int f2fs_write_qf_inode(int qtype)
>  	u_int64_t main_area_node_seg_blk_offset = 0;
>  	__le32 raw_id;
>  	int i;
> +	u32 qf_ino;
>  
>  	raw_node = calloc(F2FS_BLKSIZE, 1);
>  	if (raw_node == NULL) {
> @@ -1263,9 +1262,8 @@ static int f2fs_write_qf_inode(int qtype)
>  		return -1;
>  	}
>  
> -	raw_node->footer.nid = sb->qf_ino[qtype];
> -	raw_node->footer.ino = sb->qf_ino[qtype];
> -	raw_node->footer.cp_ver = cpu_to_le64(1);
> +	qf_ino = le32_to_cpu(sb->qf_ino[qtype]);
> +	set_node_footer(raw_node, qf_ino, qf_ino, 0, 1, 0);
>  	raw_node->footer.next_blkaddr = cpu_to_le32(
>  			get_sb(main_blkaddr) +
>  			c.cur_seg[CURSEG_HOT_NODE] *
> @@ -1457,9 +1455,7 @@ static int f2fs_write_lpf_inode(void)
>  		return -1;
>  	}
>  
> -	raw_node->footer.nid = cpu_to_le32(c.lpf_ino);
> -	raw_node->footer.ino = raw_node->footer.nid;
> -	raw_node->footer.cp_ver = cpu_to_le64(1);
> +	set_node_footer(raw_node, c.lpf_ino, c.lpf_ino, 0, 1, 1);
>  	raw_node->footer.next_blkaddr = cpu_to_le32(
>  			get_sb(main_blkaddr) +
>  			c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg +
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
