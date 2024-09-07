Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A534996FEB0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Sep 2024 02:21:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smjC9-0006RH-P5;
	Sat, 07 Sep 2024 00:20:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1smjC7-0006RB-EG
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Sep 2024 00:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mZsxDhy/tbEoHb0wi2xxibzAW0j965vdd1sxwIoN+m0=; b=QEa9UjxYx9u7xe6X6wS0QZTo4S
 zKP185NRwBjJxng81f70r1sey+UpWHrYjiuxDyA/y0WjsuRd5HZSV0Or58jAnG6cR/BeuSzRAApki
 6rhk7QhMgV9nn9EoCj9VaSP6VObBVnOLrF86yYwp+NDpEIp6GipQUw7NJ9OAehqofuTM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mZsxDhy/tbEoHb0wi2xxibzAW0j965vdd1sxwIoN+m0=; b=hGQ7qqtGDB+YR4fBd/+NMKmU/V
 bFY7a88Nh970vXDYNWZSQ2+FDmfqYmIUCW6lT6GVJ1BowHlo3Q7T2TgKTL5EhTlJWuKhMfC0DKsRK
 ynFezKTvKjjQP/jK02ExzFSdIc/S1K1JN7uJJgfRUDZZLXw0D47JoZihpRIf099s+LHg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1smjC3-0006Sx-Of for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Sep 2024 00:20:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 846D8A41085;
 Sat,  7 Sep 2024 00:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995A9C4CEC4;
 Sat,  7 Sep 2024 00:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725668436;
 bh=2JsXmXHCI/vvEN1dfsC6/fiJDlrKzKgztVoQ+NpX9nc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WKjVNYki9NedoztvyX0gPo/tWytogW7NGkE4+RINQ/+aZHa52gy1yYZfKcCAtCYQ4
 fKNv9NJl2/hiiAcH1u9hgVJvdsXpZQ+zzfrCpCUXFnpwEP58eSB2R4zzEn6QRMAiTZ
 6bWw7kn48YP29c0D3l3gvXdN47VtGQCmTuGGCghkPT0Cq6V3pI9qLMxhEHIoSW+/dm
 l7Eu4A+eio0WKLyAIhjQ/WEuElB4bC4Yk5ErRhfPnucNFTTl9ohOtbKQzG1cBAZvkB
 6EYAXGiSkzD6hlbo7yY47hvXc1oAMV3UpzVwXyVeOb97JNDKM//rwFz7cR/9X2eUOg
 CdIds++FHH3Rw==
Date: Sat, 7 Sep 2024 00:20:33 +0000
To: Daejun Park <daejun7.park@samsung.com>
Message-ID: <ZtucUU1vjLsbssPA@google.com>
References: <CGME20240904011217epcms2p5a1b15db8e0ae50884429da7be4af4de4@epcms2p5>
 <20240904011217epcms2p5a1b15db8e0ae50884429da7be4af4de4@epcms2p5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904011217epcms2p5a1b15db8e0ae50884429da7be4af4de4@epcms2p5>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Applied this change for Android build. --- a/fsck/mount.c
 +++ b/fsck/mount.c @@ -4222, 7 +4222,
 7 @@ int f2fs_sparse_initialize_meta(struct
 f2fs_sb_info *sbi) DBG(1,
 "\tSparse: filling sit area at block offset: 0x%08"PRIx64"
 len: %u\n", sit_ [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1smjC3-0006Sx-Of
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: add write hint support
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Nayeon Kim <nayeoni.kim@samsung.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Applied this change for Android build.

--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -4222,7 +4222,7 @@ int f2fs_sparse_initialize_meta(struct f2fs_sb_info *sbi)
        DBG(1, "\tSparse: filling sit area at block offset: 0x%08"PRIx64" len: %u\n",
                                                        sit_seg_addr, sit_size);
        ret = dev_fill(NULL, sit_seg_addr * F2FS_BLKSIZE,
-                                       sit_size * F2FS_BLKSIZE);
+                       sit_size * F2FS_BLKSIZE, WRITE_LIFE_NONE);
        if (ret) {
                MSG(1, "\tError: While zeroing out the sit area "
                                "on disk!!!\n");
@@ -4236,7 +4236,7 @@ int f2fs_sparse_initialize_meta(struct f2fs_sb_info *sbi)
        DBG(1, "\tSparse: filling nat area at block offset 0x%08"PRIx64" len: %u\n",
                                                        nat_seg_addr, nat_size);
        ret = dev_fill(NULL, nat_seg_addr * F2FS_BLKSIZE,
-                                       nat_size * F2FS_BLKSIZE);
+                       nat_size * F2FS_BLKSIZE, WRITE_LIFE_NONE);
        if (ret) {
                MSG(1, "\tError: While zeroing out the nat area "
                                "on disk!!!\n");
@@ -4248,7 +4248,7 @@ int f2fs_sparse_initialize_meta(struct f2fs_sb_info *sbi)
        DBG(1, "\tSparse: filling bitmap area at block offset 0x%08"PRIx64" len: %u\n",
                                        payload_addr, get_sb(cp_payload));
        ret = dev_fill(NULL, payload_addr * F2FS_BLKSIZE,
-                                       get_sb(cp_payload) * F2FS_BLKSIZE);
+                       get_sb(cp_payload) * F2FS_BLKSIZE, WRITE_LIFE_NONE);
        if (ret) {
                MSG(1, "\tError: While zeroing out the nat/sit bitmap area "
                                "on disk!!!\n");
@@ -4260,7 +4260,7 @@ int f2fs_sparse_initialize_meta(struct f2fs_sb_info *sbi)
        DBG(1, "\tSparse: filling bitmap area at block offset 0x%08"PRIx64" len: %u\n",
                                        payload_addr, get_sb(cp_payload));
        ret = dev_fill(NULL, payload_addr * F2FS_BLKSIZE,
-                                       get_sb(cp_payload) * F2FS_BLKSIZE);
+                       get_sb(cp_payload) * F2FS_BLKSIZE, WRITE_LIFE_NONE);
        if (ret) {
                MSG(1, "\tError: While zeroing out the nat/sit bitmap area "
                                "on disk!!!\n");
diff --git a/include/android_config.h b/include/android_config.h
index 9c8b163dac22..f5cd4dea0c99 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -1,9 +1,11 @@
 #if defined(__linux__)
+#define HAVE_ARCH_STRUCT_FLOCK 1
 #define HAVE_BLK_ZONE_REP_V2 1
 #define HAVE_BYTESWAP_H 1
 #define HAVE_FCNTL_H 1
 #define HAVE_FALLOC_H 1
 #define HAVE_FSYNC 1
+#define HAVE_LINUX_FCNTL_H 1
 #define HAVE_LINUX_HDREG_H 1
 #define HAVE_LINUX_LIMITS_H 1
 #define HAVE_LINUX_LOOP_H 1

On 09/04, Daejun Park wrote:
> This patch enables support for write hints by segment type.
> 
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> ---
> 
> v2:
>  - Add -H option for write hint enabling.
>  - Keep last write hint to reduce fnctl call.
> 
>  configure.ac            |   2 +
>  fsck/defrag.c           |   5 +-
>  fsck/dir.c              |  27 +++++++---
>  fsck/fsck.c             |  24 +++++----
>  fsck/inject.c           |   4 +-
>  fsck/main.c             |  22 ++++++--
>  fsck/mount.c            |  43 ++++++++-------
>  fsck/node.c             |  11 ++--
>  fsck/resize.c           |  37 +++++++------
>  fsck/segment.c          |  21 +++++---
>  fsck/xattr.c            |   6 ++-
>  include/f2fs_fs.h       |  26 +++++++--
>  lib/libf2fs.c           |   6 +--
>  lib/libf2fs_io.c        | 117 ++++++++++++++++++++++++++++++----------
>  man/defrag.f2fs.8       |   6 +++
>  man/fsck.f2fs.8         |   6 +++
>  man/mkfs.f2fs.8         |   6 +++
>  man/resize.f2fs.8       |   6 +++
>  mkfs/f2fs_format.c      |  52 ++++++++++--------
>  mkfs/f2fs_format_main.c |   9 +++-
>  20 files changed, 309 insertions(+), 127 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 21c6391..2053a65 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -139,6 +139,8 @@ AC_CHECK_HEADERS(m4_flatten([
>  	fcntl.h
>  	kernel/uapi/linux/blkzoned.h
>  	linux/blkzoned.h
> +	linux/rw_hint.h
> +	linux/fcntl.h
>  	linux/falloc.h
>  	linux/fiemap.h
>  	linux/fs.h
> diff --git a/fsck/defrag.c b/fsck/defrag.c
> index 361fe73..9889b70 100644
> --- a/fsck/defrag.c
> +++ b/fsck/defrag.c
> @@ -23,12 +23,13 @@ static int migrate_block(struct f2fs_sb_info *sbi, u64 from, u64 to)
>  	ret = dev_read_block(raw, from);
>  	ASSERT(ret >= 0);
>  
> +	/* get segment type */
> +	se = get_seg_entry(sbi, GET_SEGNO(sbi, from));
>  	/* write to */
> -	ret = dev_write_block(raw, to);
> +	ret = dev_write_block(raw, to, f2fs_io_type_to_rw_hint(se->type));
>  	ASSERT(ret >= 0);
>  
>  	/* update sit bitmap & valid_blocks && se->type */
> -	se = get_seg_entry(sbi, GET_SEGNO(sbi, from));
>  	offset = OFFSET_IN_SEG(sbi, from);
>  	type = se->type;
>  	se->valid_blocks--;
> diff --git a/fsck/dir.c b/fsck/dir.c
> index 3fac850..4debda8 100644
> --- a/fsck/dir.c
> +++ b/fsck/dir.c
> @@ -299,7 +299,9 @@ add_dentry:
>  
>  	if (c.zoned_model == F2FS_ZONED_HM) {
>  		if (datablk_alloced) {
> -			ret = dev_write_block(dentry_blk, dn.data_blkaddr);
> +			/* dentry uses hot data segment */
> +			ret = dev_write_block(dentry_blk, dn.data_blkaddr,
> +				f2fs_io_type_to_rw_hint(CURSEG_HOT_DATA));
>  		} else {
>  			ret = update_block(sbi, dentry_blk, &dn.data_blkaddr,
>  					dn.node_blk);
> @@ -309,7 +311,9 @@ add_dentry:
>  				dn.ndirty = 1;
>  		}
>  	} else {
> -		ret = dev_write_block(dentry_blk, dn.data_blkaddr);
> +		/* dentry uses hot data segment */
> +		ret = dev_write_block(dentry_blk, dn.data_blkaddr,
> +				f2fs_io_type_to_rw_hint(CURSEG_HOT_DATA));
>  	}
>  	ASSERT(ret >= 0);
>  
> @@ -336,8 +340,13 @@ add_dentry:
>  	}
>  
>  	if (dn.ndirty) {
> +		struct seg_entry *se;
> +
> +		/* get segment type for rw hint */
> +		se = get_seg_entry(sbi, GET_SEGNO(sbi, dn.node_blkaddr));
>  		ret = dn.alloced ?
> -			dev_write_block(dn.node_blk, dn.node_blkaddr) :
> +			dev_write_block(dn.node_blk, dn.node_blkaddr,
> +					f2fs_io_type_to_rw_hint(se->type)) :
>  			update_block(sbi, dn.node_blk, &dn.node_blkaddr, NULL);
>  		ASSERT(ret >= 0);
>  	}
> @@ -388,7 +397,8 @@ static void make_empty_dir(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
>  	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_DATA, 0);
>  	ASSERT(!ret);
>  
> -	ret = dev_write_block(dent_blk, blkaddr);
> +	ret = dev_write_block(dent_blk, blkaddr,
> +			      f2fs_io_type_to_rw_hint(CURSEG_HOT_DATA));
>  	ASSERT(ret >= 0);
>  
>  	inode->i.i_addr[get_extra_isize(inode)] = cpu_to_le32(blkaddr);
> @@ -424,7 +434,8 @@ static void page_symlink(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
>  	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_WARM_DATA, 0);
>  	ASSERT(!ret);
>  
> -	ret = dev_write_block(data_blk, blkaddr);
> +	ret = dev_write_block(data_blk, blkaddr,
> +			      f2fs_io_type_to_rw_hint(CURSEG_WARM_DATA));
>  	ASSERT(ret >= 0);
>  
>  	inode->i.i_addr[get_extra_isize(inode)] = cpu_to_le32(blkaddr);
> @@ -618,7 +629,8 @@ int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
>  		memcpy(dst.filename, src.filename, src.max * F2FS_SLOT_LEN);
>  
>  		ret = datablk_alloced ?
> -			dev_write_block(dentry_blk, dn.data_blkaddr) :
> +			dev_write_block(dentry_blk, dn.data_blkaddr,
> +					f2fs_io_type_to_rw_hint(CURSEG_HOT_DATA)) :
>  			update_block(sbi, dentry_blk, &dn.data_blkaddr, NULL);
>  		ASSERT(ret >= 0);
>  
> @@ -818,7 +830,8 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
>  	update_nat_blkaddr(sbi, de->ino, de->ino, blkaddr);
>  
>  write_child_dir:
> -	ret = nodeblk_alloced ? dev_write_block(child, blkaddr) :
> +	ret = nodeblk_alloced ? dev_write_block(child, blkaddr,
> +			f2fs_io_type_to_rw_hint(CURSEG_HOT_NODE)) :
>  		update_block(sbi, child, &blkaddr, NULL);
>  	ASSERT(ret >= 0);
>  
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index a18bee9..e4d4aae 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -216,7 +216,7 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
>  		int ret2;
>  
>  		ssa_blk = GET_SUM_BLKADDR(sbi, segno);
> -		ret2 = dev_write_block(sum_blk, ssa_blk);
> +		ret2 = dev_write_block(sum_blk, ssa_blk, WRITE_LIFE_NONE);
>  		ASSERT(ret2 >= 0);
>  	}
>  out:
> @@ -350,7 +350,7 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
>  		int ret2;
>  
>  		ssa_blk = GET_SUM_BLKADDR(sbi, segno);
> -		ret2 = dev_write_block(sum_blk, ssa_blk);
> +		ret2 = dev_write_block(sum_blk, ssa_blk, WRITE_LIFE_NONE);
>  		ASSERT(ret2 >= 0);
>  	}
>  out:
> @@ -2153,7 +2153,8 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
>  		if (f2fs_dev_is_writable() && c.fix_on &&
>  				entry_count != new_entry_count) {
>  			F2FS_ORPHAN_BLOCK_FOOTER(new_blk)->entry_count = cpu_to_le32(new_entry_count);
> -			ret = dev_write_block(new_blk, start_blk + i);
> +			ret = dev_write_block(new_blk, start_blk + i,
> +					      WRITE_LIFE_NONE);
>  			ASSERT(ret >= 0);
>  		}
>  		memset(orphan_blk, 0, F2FS_BLKSIZE);
> @@ -2569,12 +2570,13 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
>  	if (sbi->cur_cp == 2)
>  		cp_blk_no += 1 << get_sb(log_blocks_per_seg);
>  
> -	ret = dev_write_block(cp, cp_blk_no++);
> +	ret = dev_write_block(cp, cp_blk_no++, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	for (i = 0; i < get_sb(cp_payload); i++) {
>  		ret = dev_write_block(((unsigned char *)cp) +
> -					(i + 1) * F2FS_BLKSIZE, cp_blk_no++);
> +					(i + 1) * F2FS_BLKSIZE, cp_blk_no++,
> +					WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  	}
>  
> @@ -2586,7 +2588,8 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
>  		if (!(flags & CP_UMOUNT_FLAG) && IS_NODESEG(i))
>  			continue;
>  
> -		ret = dev_write_block(curseg->sum_blk, cp_blk_no++);
> +		ret = dev_write_block(curseg->sum_blk, cp_blk_no++,
> +				      WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  	}
>  
> @@ -2597,7 +2600,7 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
>  	ret = f2fs_fsync_device();
>  	ASSERT(ret >= 0);
>  
> -	ret = dev_write_block(cp, cp_blk_no++);
> +	ret = dev_write_block(cp, cp_blk_no++, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	ret = f2fs_fsync_device();
> @@ -3328,9 +3331,11 @@ static int chk_and_fix_wp_with_sit(int UNUSED(i), void *blkzone, void *opaque)
>  	if (ret) {
>  		u64 fill_sects = blk_zone_length(blkz) -
>  			(blk_zone_wp_sector(blkz) - blk_zone_sector(blkz));
> +		struct seg_entry *se = get_seg_entry(sbi, wp_segno);
>  		printf("[FSCK] Finishing zone failed: %s\n", dev->path);
>  		ret = dev_fill(NULL, wp_block * F2FS_BLKSIZE,
> -			(fill_sects >> log_sectors_per_block) * F2FS_BLKSIZE);
> +			(fill_sects >> log_sectors_per_block) * F2FS_BLKSIZE,
> +			f2fs_io_type_to_rw_hint(se->type));
>  		if (ret)
>  			printf("[FSCK] Fill up zone failed: %s\n", dev->path);
>  	}
> @@ -3646,7 +3651,8 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  					ssa_blk = GET_SUM_BLKADDR(sbi,
>  							curseg->segno);
>  					ret = dev_write_block(curseg->sum_blk,
> -							ssa_blk);
> +							ssa_blk,
> +							WRITE_LIFE_NONE);
>  					ASSERT(ret >= 0);
>  				}
>  				if (c.roll_forward)
> diff --git a/fsck/inject.c b/fsck/inject.c
> index 9dc085f..e24f3f5 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -565,7 +565,7 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  	}
>  	print_raw_nat_entry_info(ne);
>  
> -	ret = dev_write_block(nat_blk, blk_addr);
> +	ret = dev_write_block(nat_blk, blk_addr, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  	/* restore NAT version bitmap */
>  	if (is_set)
> @@ -724,7 +724,7 @@ static int inject_ssa(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  	print_sum_footer_info(footer);
>  
>  	ssa_blkaddr = GET_SUM_BLKADDR(sbi, segno);
> -	ret = dev_write_block(sum_blk, ssa_blkaddr);
> +	ret = dev_write_block(sum_blk, ssa_blkaddr, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  out:
> diff --git a/fsck/main.c b/fsck/main.c
> index 8881936..43b807f 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -77,6 +77,7 @@ void fsck_usage()
>  	MSG(0, "  -d debug level [default:0]\n");
>  	MSG(0, "  -f check/fix entire partition\n");
>  	MSG(0, "  -g add default options\n");
> +	MSG(0, "  -H support write hint\n");
>  	MSG(0, "  -l show superblock/checkpoint\n");
>  	MSG(0, "  -M show a file map\n");
>  	MSG(0, "  -O feature1[feature2,feature3,...] e.g. \"encrypt\"\n");
> @@ -108,6 +109,7 @@ void dump_usage()
>  	MSG(0, "  -b blk_addr (in 4KB)\n");
>  	MSG(0, "  -r dump out from the root inode\n");
>  	MSG(0, "  -f do not prompt before dumping\n");
> +	MSG(0, "  -H support write hint\n");
>  	MSG(0, "  -y alias for -f\n");
>  	MSG(0, "  -o dump inodes to the given path\n");
>  	MSG(0, "  -P preserve mode/owner/group for dumped inode\n");
> @@ -122,6 +124,7 @@ void defrag_usage()
>  	MSG(0, "\nUsage: defrag.f2fs [options] device\n");
>  	MSG(0, "[options]:\n");
>  	MSG(0, "  -d debug level [default:0]\n");
> +	MSG(0, "  -H support write hint\n");
>  	MSG(0, "  -s start block address [default: main_blkaddr]\n");
>  	MSG(0, "  -S sparse_mode\n");
>  	MSG(0, "  -l length [default:512 (2MB)]\n");
> @@ -136,6 +139,7 @@ void resize_usage()
>  	MSG(0, "\nUsage: resize.f2fs [options] device\n");
>  	MSG(0, "[options]:\n");
>  	MSG(0, "  -d debug level [default:0]\n");
> +	MSG(0, "  -H support write hint\n");
>  	MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
>  	MSG(0, "  -o overprovision percentage [default:auto]\n");
>  	MSG(0, "  -s safe resize (Does not resize metadata)\n");
> @@ -246,7 +250,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  	}
>  
>  	if (!strcmp("fsck.f2fs", prog)) {
> -		const char *option_string = ":aC:c:m:Md:fg:lO:p:q:StyV";
> +		const char *option_string = ":aC:c:m:Md:fg:HlO:p:q:StyV";
>  		int opt = 0, val;
>  		char *token;
>  		struct option long_opt[] = {
> @@ -295,6 +299,10 @@ void f2fs_parse_options(int argc, char *argv[])
>  					MSG(0, "Info: Set conf for android\n");
>  				}
>  				break;
> +			case 'H':
> +				c.need_whint = true;
> +				c.whint = WRITE_LIFE_NOT_SET;
> +				break;
>  			case 'l':
>  				c.layout = 1;
>  				break;
> @@ -517,7 +525,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  #endif
>  	} else if (!strcmp("defrag.f2fs", prog)) {
>  #ifdef WITH_DEFRAG
> -		const char *option_string = "d:s:Sl:t:iV";
> +		const char *option_string = "d:Hs:Sl:t:iV";
>  
>  		c.func = DEFRAG;
>  		while ((option = getopt(argc, argv, option_string)) != EOF) {
> @@ -533,6 +541,10 @@ void f2fs_parse_options(int argc, char *argv[])
>  				MSG(0, "Info: Debug level = %d\n",
>  							c.dbg_lv);
>  				break;
> +			case 'H':
> +				c.need_whint = true;
> +				c.whint = WRITE_LIFE_NOT_SET;
> +				break;
>  			case 's':
>  				if (strncmp(optarg, "0x", 2))
>  					ret = sscanf(optarg, "%"PRIu64"",
> @@ -577,7 +589,7 @@ void f2fs_parse_options(int argc, char *argv[])
>  #endif
>  	} else if (!strcmp("resize.f2fs", prog)) {
>  #ifdef WITH_RESIZE
> -		const char *option_string = "d:fst:io:V";
> +		const char *option_string = "d:fHst:io:V";
>  
>  		c.func = RESIZE;
>  		while ((option = getopt(argc, argv, option_string)) != EOF) {
> @@ -597,6 +609,10 @@ void f2fs_parse_options(int argc, char *argv[])
>  				c.force = 1;
>  				MSG(0, "Info: Force to resize\n");
>  				break;
> +			case 'H':
> +				c.need_whint = true;
> +				c.whint = WRITE_LIFE_NOT_SET;
> +				break;
>  			case 's':
>  				c.safe_resize = 1;
>  				break;
> diff --git a/fsck/mount.c b/fsck/mount.c
> index dab0611..4bb1cde 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -889,7 +889,7 @@ void update_superblock(struct f2fs_super_block *sb, int sb_mask)
>  	memcpy(buf + F2FS_SUPER_OFFSET, sb, sizeof(*sb));
>  	for (addr = SB0_ADDR; addr < SB_MAX_ADDR; addr++) {
>  		if (SB_MASK(addr) & sb_mask) {
> -			ret = dev_write_block(buf, addr);
> +			ret = dev_write_block(buf, addr, WRITE_LIFE_NONE);
>  			ASSERT(ret >= 0);
>  		}
>  	}
> @@ -1783,7 +1783,8 @@ void write_nat_bits(struct f2fs_sb_info *sbi,
>  	DBG(1, "\tWriting NAT bits pages, at offset 0x%08x\n", blkaddr);
>  
>  	for (i = 0; i < nat_bits_blocks; i++) {
> -		if (dev_write_block(nat_bits + i * F2FS_BLKSIZE, blkaddr + i))
> +		if (dev_write_block(nat_bits + i * F2FS_BLKSIZE, blkaddr + i,
> +				    WRITE_LIFE_NONE))
>  			ASSERT_MSG("\tError: write NAT bits to disk!!!\n");
>  	}
>  	MSG(0, "Info: Write valid nat_bits in checkpoint\n");
> @@ -2155,7 +2156,8 @@ void update_sum_entry(struct f2fs_sb_info *sbi, block_t blk_addr,
>  							SUM_TYPE_DATA;
>  
>  	/* write SSA all the time */
> -	ret = dev_write_block(sum_blk, GET_SUM_BLKADDR(sbi, segno));
> +	ret = dev_write_block(sum_blk, GET_SUM_BLKADDR(sbi, segno),
> +			      WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
> @@ -2262,7 +2264,7 @@ void rewrite_current_sit_page(struct f2fs_sb_info *sbi,
>  {
>  	block_t blk_addr = current_sit_addr(sbi, segno);
>  
> -	ASSERT(dev_write_block(sit_blk, blk_addr) >= 0);
> +	ASSERT(dev_write_block(sit_blk, blk_addr, WRITE_LIFE_NONE) >= 0);
>  }
>  
>  void check_block_count(struct f2fs_sb_info *sbi,
> @@ -2552,7 +2554,7 @@ void update_nat_blkaddr(struct f2fs_sb_info *sbi, nid_t ino,
>  		entry->ino = cpu_to_le32(ino);
>  	entry->block_addr = cpu_to_le32(newaddr);
>  
> -	ret = dev_write_block(nat_block, block_addr);
> +	ret = dev_write_block(nat_block, block_addr, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  update_cache:
>  	if (c.func == FSCK)
> @@ -2848,7 +2850,7 @@ next:
>  	memcpy(&nat_block->entries[entry_off], &nat_in_journal(journal, i),
>  					sizeof(struct f2fs_nat_entry));
>  
> -	ret = dev_write_block(nat_block, block_addr);
> +	ret = dev_write_block(nat_block, block_addr, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  	i++;
>  	goto next;
> @@ -3028,7 +3030,8 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
>  			}
>  
>  			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
> -			ret = dev_write_block(curseg->sum_blk, ssa_blk);
> +			ret = dev_write_block(curseg->sum_blk, ssa_blk,
> +					      WRITE_LIFE_NONE);
>  			ASSERT(ret >= 0);
>  
>  			curseg->segno = segno;
> @@ -3133,7 +3136,7 @@ void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
>  
>  	/* update original SSA too */
>  	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
> -	ret = dev_write_block(curseg->sum_blk, ssa_blk);
> +	ret = dev_write_block(curseg->sum_blk, ssa_blk, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  bypass_ssa:
>  	to = from;
> @@ -3286,7 +3289,7 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
>  		FIX_MSG("Remove nid [0x%x] in NAT", nid);
>  	}
>  
> -	ret = dev_write_block(nat_block, block_addr);
> +	ret = dev_write_block(nat_block, block_addr, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  	free(nat_block);
>  }
> @@ -3318,7 +3321,7 @@ void duplicate_checkpoint(struct f2fs_sb_info *sbi)
>  	ASSERT(ret >= 0);
>  
>  	ret = dev_write(buf, dst << F2FS_BLKSIZE_BITS,
> -				seg_size << F2FS_BLKSIZE_BITS);
> +				seg_size << F2FS_BLKSIZE_BITS, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	free(buf);
> @@ -3383,7 +3386,7 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>  		cp_blk_no += 1 << get_sb(log_blocks_per_seg);
>  
>  	/* write the first cp */
> -	ret = dev_write_block(cp, cp_blk_no++);
> +	ret = dev_write_block(cp, cp_blk_no++, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	/* skip payload */
> @@ -3399,13 +3402,15 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>  		if (!(flags & CP_UMOUNT_FLAG) && IS_NODESEG(i))
>  			continue;
>  
> -		ret = dev_write_block(curseg->sum_blk, cp_blk_no++);
> +		ret = dev_write_block(curseg->sum_blk, cp_blk_no++,
> +				      WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  
>  		if (!(get_sb(feature) & F2FS_FEATURE_RO)) {
>  			/* update original SSA too */
>  			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
> -			ret = dev_write_block(curseg->sum_blk, ssa_blk);
> +			ret = dev_write_block(curseg->sum_blk, ssa_blk,
> +					      WRITE_LIFE_NONE);
>  			ASSERT(ret >= 0);
>  		}
>  	}
> @@ -3419,7 +3424,7 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>  	ASSERT(ret >= 0);
>  
>  	/* write the last cp */
> -	ret = dev_write_block(cp, cp_blk_no++);
> +	ret = dev_write_block(cp, cp_blk_no++, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	ret = f2fs_fsync_device();
> @@ -3455,12 +3460,12 @@ void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
>  		cp_blkaddr += 1 << get_sb(log_blocks_per_seg);
>  
>  	/* write the first cp block in this CP pack */
> -	ret = dev_write_block(cp, cp_blkaddr);
> +	ret = dev_write_block(cp, cp_blkaddr, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	/* write the second cp block in this CP pack */
>  	cp_blkaddr += get_cp(cp_pack_total_block_count) - 1;
> -	ret = dev_write_block(cp, cp_blkaddr);
> +	ret = dev_write_block(cp, cp_blkaddr, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  }
>  
> @@ -3695,6 +3700,7 @@ static int loop_node_chain_fix(block_t blkaddr_fast,
>  		block_t blkaddr, struct f2fs_node *node_blk)
>  {
>  	block_t blkaddr_entry, blkaddr_tmp;
> +	enum rw_hint whint;
>  	int err;
>  
>  	/* find the entry point of the looped node chain */
> @@ -3722,10 +3728,11 @@ static int loop_node_chain_fix(block_t blkaddr_fast,
>  
>  	/* fix the blkaddr of last node with NULL_ADDR. */
>  	F2FS_NODE_FOOTER(node_blk)->next_blkaddr = NULL_ADDR;
> +	whint = f2fs_io_type_to_rw_hint(CURSEG_WARM_NODE);
>  	if (IS_INODE(node_blk))
> -		err = write_inode(node_blk, blkaddr_tmp);
> +		err = write_inode(node_blk, blkaddr_tmp, whint);
>  	else
> -		err = dev_write_block(node_blk, blkaddr_tmp);
> +		err = dev_write_block(node_blk, blkaddr_tmp, whint);
>  	if (!err)
>  		FIX_MSG("Fix looped node chain on blkaddr %u\n",
>  				blkaddr_tmp);
> diff --git a/fsck/node.c b/fsck/node.c
> index 632151a..8d4479c 100644
> --- a/fsck/node.c
> +++ b/fsck/node.c
> @@ -78,7 +78,7 @@ int f2fs_rebuild_qf_inode(struct f2fs_sb_info *sbi, int qtype)
>  		goto err_out;
>  	}
>  
> -	ret = write_inode(raw_node, blkaddr);
> +	ret = write_inode(raw_node, blkaddr, f2fs_io_type_to_rw_hint(CURSEG_HOT_NODE));
>  	if (ret < 0) {
>  		MSG(1, "\tError: While rebuilding the quota inode to disk!\n");
>  		goto err_out;
> @@ -282,8 +282,13 @@ int get_dnode_of_data(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
>  			/* Parent node has changed */
>  			if (!parent_alloced)
>  				ret = update_block(sbi, parent, &nblk[i - 1], NULL);
> -			else
> -				ret = dev_write_block(parent, nblk[i - 1]);
> +			else {
> +				struct seg_entry *se;
> +
> +				se = get_seg_entry(sbi, GET_SEGNO(sbi, nblk[i - 1]));
> +				ret = dev_write_block(parent, nblk[i - 1],
> +						f2fs_io_type_to_rw_hint(se->type));
> +			}
>  			ASSERT(ret >= 0);
>  
>  			/* Function new_node_blk get a new f2fs_node blk and update*/
> diff --git a/fsck/resize.c b/fsck/resize.c
> index 049ddd3..9b3b071 100644
> --- a/fsck/resize.c
> +++ b/fsck/resize.c
> @@ -189,7 +189,8 @@ static void migrate_main(struct f2fs_sb_info *sbi, unsigned int offset)
>  			ASSERT(ret >= 0);
>  
>  			to = from + offset;
> -			ret = dev_write_block(raw, to);
> +			ret = dev_write_block(raw, to,
> +					      f2fs_io_type_to_rw_hint(se->type));
>  			ASSERT(ret >= 0);
>  
>  			get_sum_entry(sbi, from, &sum);
> @@ -218,7 +219,8 @@ static void move_ssa(struct f2fs_sb_info *sbi, unsigned int segno,
>  	if (type < SEG_TYPE_MAX) {
>  		int ret;
>  
> -		ret = dev_write_block(sum_blk, new_sum_blk_addr);
> +		ret = dev_write_block(sum_blk, new_sum_blk_addr,
> +				      WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  		DBG(1, "Write summary block: (%d) segno=%x/%x --> (%d) %x\n",
>  				type, segno, GET_SUM_BLKADDR(sbi, segno),
> @@ -252,7 +254,8 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
>  			if (blkaddr < expand_sum_blkaddr) {
>  				move_ssa(sbi, offset++, blkaddr++);
>  			} else {
> -				ret = dev_write_block(zero_block, blkaddr++);
> +				ret = dev_write_block(zero_block, blkaddr++,
> +						      WRITE_LIFE_NONE);
>  				ASSERT(ret >=0);
>  			}
>  		}
> @@ -261,7 +264,8 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
>  		offset = MAIN_SEGS(sbi) - 1;
>  		while (blkaddr >= new_sum_blkaddr) {
>  			if (blkaddr >= expand_sum_blkaddr) {
> -				ret = dev_write_block(zero_block, blkaddr--);
> +				ret = dev_write_block(zero_block, blkaddr--,
> +						      WRITE_LIFE_NONE);
>  				ASSERT(ret >=0);
>  			} else {
>  				move_ssa(sbi, offset--, blkaddr--);
> @@ -360,7 +364,7 @@ static void migrate_nat(struct f2fs_sb_info *sbi,
>  				(block_off & ((1 << sbi->log_blocks_per_seg) - 1)));
>  
>  		/* new bitmap should be zeros */
> -		ret = dev_write_block(nat_block, block_addr);
> +		ret = dev_write_block(nat_block, block_addr, WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  	}
>  	/* zero out newly assigned nids */
> @@ -381,7 +385,7 @@ static void migrate_nat(struct f2fs_sb_info *sbi,
>  		block_addr = (pgoff_t)(new_nat_blkaddr +
>  				(seg_off << sbi->log_blocks_per_seg << 1) +
>  				(block_off & ((1 << sbi->log_blocks_per_seg) - 1)));
> -		ret = dev_write_block(nat_block, block_addr);
> +		ret = dev_write_block(nat_block, block_addr, WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  		DBG(3, "Write NAT: %lx\n", block_addr);
>  	}
> @@ -407,7 +411,8 @@ static void migrate_sit(struct f2fs_sb_info *sbi,
>  
>  	/* initialize with zeros */
>  	for (index = 0; index < sit_blks; index++) {
> -		ret = dev_write_block(sit_blk, get_newsb(sit_blkaddr) + index);
> +		ret = dev_write_block(sit_blk, get_newsb(sit_blkaddr) + index,
> +				      WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  		DBG(3, "Write zero sit: %x\n", get_newsb(sit_blkaddr) + index);
>  	}
> @@ -425,7 +430,8 @@ static void migrate_sit(struct f2fs_sb_info *sbi,
>  
>  		if (ofs != pre_ofs) {
>  			blk_addr = get_newsb(sit_blkaddr) + pre_ofs;
> -			ret = dev_write_block(sit_blk, blk_addr);
> +			ret = dev_write_block(sit_blk, blk_addr,
> +					      WRITE_LIFE_NONE);
>  			ASSERT(ret >= 0);
>  			DBG(1, "Write valid sit: %x\n", blk_addr);
>  
> @@ -439,7 +445,7 @@ static void migrate_sit(struct f2fs_sb_info *sbi,
>  							se->valid_blocks);
>  	}
>  	blk_addr = get_newsb(sit_blkaddr) + ofs;
> -	ret = dev_write_block(sit_blk, blk_addr);
> +	ret = dev_write_block(sit_blk, blk_addr, WRITE_LIFE_NONE);
>  	DBG(1, "Write valid sit: %x\n", blk_addr);
>  	ASSERT(ret >= 0);
>  
> @@ -558,12 +564,12 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>  		new_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
>  
>  	/* write first cp */
> -	ret = dev_write_block(new_cp, new_cp_blk_no++);
> +	ret = dev_write_block(new_cp, new_cp_blk_no++, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	memset(buf, 0, F2FS_BLKSIZE);
>  	for (i = 0; i < get_newsb(cp_payload); i++) {
> -		ret = dev_write_block(buf, new_cp_blk_no++);
> +		ret = dev_write_block(buf, new_cp_blk_no++, WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  	}
>  
> @@ -573,7 +579,7 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>  		ret = dev_read_block(buf, orphan_blk_no++);
>  		ASSERT(ret >= 0);
>  
> -		ret = dev_write_block(buf, new_cp_blk_no++);
> +		ret = dev_write_block(buf, new_cp_blk_no++, WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  	}
>  
> @@ -581,12 +587,13 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>  	for (i = 0; i < NO_CHECK_TYPE; i++) {
>  		struct curseg_info *curseg = CURSEG_I(sbi, i);
>  
> -		ret = dev_write_block(curseg->sum_blk, new_cp_blk_no++);
> +		ret = dev_write_block(curseg->sum_blk, new_cp_blk_no++,
> +				      WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  	}
>  
>  	/* write the last cp */
> -	ret = dev_write_block(new_cp, new_cp_blk_no++);
> +	ret = dev_write_block(new_cp, new_cp_blk_no++, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	/* Write nat bits */
> @@ -595,7 +602,7 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>  
>  	/* disable old checkpoint */
>  	memset(buf, 0, F2FS_BLKSIZE);
> -	ret = dev_write_block(buf, old_cp_blk_no);
> +	ret = dev_write_block(buf, old_cp_blk_no, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	free(buf);
> diff --git a/fsck/segment.c b/fsck/segment.c
> index 9bea105..96de22a 100644
> --- a/fsck/segment.c
> +++ b/fsck/segment.c
> @@ -322,12 +322,16 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
>  		ASSERT(remained_blkentries > 0);
>  
>  		if (!has_data) {
> +			struct seg_entry *se;
> +
> +			se = get_seg_entry(sbi, GET_SEGNO(sbi, dn.node_blkaddr));
>  			dn.data_blkaddr = addr_type;
>  			set_data_blkaddr(&dn);
>  			idirty |= dn.idirty;
>  			if (dn.ndirty) {
>  				ret = dn.alloced ? dev_write_block(dn.node_blk,
> -					dn.node_blkaddr) :
> +					dn.node_blkaddr,
> +					f2fs_io_type_to_rw_hint(se->type)) :
>  					update_block(sbi, dn.node_blk,
>  					&dn.node_blkaddr, NULL);
>  				ASSERT(ret >= 0);
> @@ -365,7 +369,8 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
>  
>  		if (c.zoned_model == F2FS_ZONED_HM) {
>  			if (datablk_alloced) {
> -				ret = dev_write_block(wbuf, blkaddr);
> +				ret = dev_write_block(wbuf, blkaddr,
> +					f2fs_io_type_to_rw_hint(CURSEG_WARM_DATA));
>  			} else {
>  				ret = update_block(sbi, wbuf, &blkaddr,
>  						dn.node_blk);
> @@ -375,7 +380,8 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
>  					dn.ndirty = 1;
>  			}
>  		} else {
> -			ret = dev_write_block(wbuf, blkaddr);
> +			ret = dev_write_block(wbuf, blkaddr,
> +					f2fs_io_type_to_rw_hint(CURSEG_WARM_DATA));
>  		}
>  		ASSERT(ret >= 0);
>  
> @@ -386,8 +392,11 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
>  
>  		dn.ofs_in_node++;
>  		if ((--remained_blkentries == 0 || count == 0) && (dn.ndirty)) {
> +			struct seg_entry *se;
> +			se = get_seg_entry(sbi, GET_SEGNO(sbi, dn.node_blkaddr));
>  			ret = dn.alloced ?
> -				dev_write_block(dn.node_blk, dn.node_blkaddr) :
> +				dev_write_block(dn.node_blk, dn.node_blkaddr,
> +						f2fs_io_type_to_rw_hint(se->type)) :
>  				update_block(sbi, dn.node_blk, &dn.node_blkaddr, NULL);
>  			ASSERT(ret >= 0);
>  		}
> @@ -764,7 +773,7 @@ int update_block(struct f2fs_sb_info *sbi, void *buf, u32 *blkaddr,
>  	int ret, type;
>  
>  	if (c.zoned_model != F2FS_ZONED_HM)
> -		return dev_write_block(buf, old_blkaddr);
> +		return dev_write_block(buf, old_blkaddr, WRITE_LIFE_NONE);
>  
>  	/* update sit bitmap & valid_blocks && se->type for old block*/
>  	se = get_seg_entry(sbi, GET_SEGNO(sbi, old_blkaddr));
> @@ -784,7 +793,7 @@ int update_block(struct f2fs_sb_info *sbi, void *buf, u32 *blkaddr,
>  		ASSERT(0);
>  	}
>  
> -	ret = dev_write_block(buf, new_blkaddr);
> +	ret = dev_write_block(buf, new_blkaddr, f2fs_io_type_to_rw_hint(type));
>  	ASSERT(ret >= 0);
>  
>  	*blkaddr = new_blkaddr;
> diff --git a/fsck/xattr.c b/fsck/xattr.c
> index 241e339..6373c06 100644
> --- a/fsck/xattr.c
> +++ b/fsck/xattr.c
> @@ -95,6 +95,7 @@ void write_all_xattrs(struct f2fs_sb_info *sbi,
>  	u64 inline_size = inline_xattr_size(&inode->i);
>  	int ret;
>  	bool xattrblk_alloced = false;
> +	struct seg_entry *se;
>  
>  	memcpy(inline_xattr_addr(&inode->i), txattr_addr, inline_size);
>  
> @@ -126,8 +127,9 @@ void write_all_xattrs(struct f2fs_sb_info *sbi,
>  	xattr_addr = (void *)xattr_node;
>  	memcpy(xattr_addr, txattr_addr + inline_size,
>  			F2FS_BLKSIZE - sizeof(struct node_footer));
> -
> -	ret = xattrblk_alloced ? dev_write_block(xattr_node, blkaddr) :
> +	se = get_seg_entry(sbi, GET_SEGNO(sbi, blkaddr));
> +	ret = xattrblk_alloced ? dev_write_block(xattr_node, blkaddr,
> +					f2fs_io_type_to_rw_hint(se->type)) :
>  		update_block(sbi, xattr_node, &blkaddr, NULL);
>  
>  free_xattr_node:
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 15a1c82..d1c656d 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -60,6 +60,19 @@
>  #include <linux/blkzoned.h>
>  #endif
>  
> +#ifdef HAVE_LINUX_RW_HINT_H
> +#include <linux/rw_hint.h>
> +#else
> +enum rw_hint {
> +	WRITE_LIFE_NOT_SET	= 0,
> +	WRITE_LIFE_NONE,
> +	WRITE_LIFE_SHORT,
> +	WRITE_LIFE_MEDIUM,
> +	WRITE_LIFE_LONG,
> +	WRITE_LIFE_EXTREME
> +};
> +#endif
> +
>  #ifdef HAVE_LIBSELINUX
>  #include <selinux/selinux.h>
>  #include <selinux/label.h>
> @@ -1520,6 +1533,8 @@ struct f2fs_configuration {
>  	time_t fixed_time;
>  	int roll_forward;
>  	bool need_fsync;
> +	bool need_whint;
> +	int whint;
>  
>  	/* mkfs parameters */
>  	int fake_seed;
> @@ -1581,7 +1596,7 @@ extern unsigned int addrs_per_page(struct f2fs_inode *, bool);
>  extern unsigned int f2fs_max_file_offset(struct f2fs_inode *);
>  extern __u32 f2fs_inode_chksum(struct f2fs_node *);
>  extern __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *);
> -extern int write_inode(struct f2fs_node *, u64);
> +extern int write_inode(struct f2fs_node *, u64, enum rw_hint);
>  
>  extern int get_bits_in_byte(unsigned char n);
>  extern int test_and_set_bit_le(u32, u8 *);
> @@ -1618,15 +1633,16 @@ extern int dev_readahead(__u64, size_t);
>  #else
>  extern int dev_readahead(__u64, size_t UNUSED(len));
>  #endif
> -extern int dev_write(void *, __u64, size_t);
> -extern int dev_write_block(void *, __u64);
> +extern enum rw_hint f2fs_io_type_to_rw_hint(int);
> +extern int dev_write(void *, __u64, size_t, enum rw_hint);
> +extern int dev_write_block(void *, __u64, enum rw_hint);
>  extern int dev_write_dump(void *, __u64, size_t);
>  #if !defined(__MINGW32__)
>  extern int dev_write_symlink(char *, size_t);
>  #endif
>  /* All bytes in the buffer must be 0 use dev_fill(). */
> -extern int dev_fill(void *, __u64, size_t);
> -extern int dev_fill_block(void *, __u64);
> +extern int dev_fill(void *, __u64, size_t, enum rw_hint);
> +extern int dev_fill_block(void *, __u64, enum rw_hint);
>  
>  extern int dev_read_block(void *, __u64);
>  extern int dev_reada_block(__u64);
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 1e0f422..ecd22d4 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -603,12 +603,12 @@ __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *cp)
>  	return chksum;
>  }
>  
> -int write_inode(struct f2fs_node *inode, u64 blkaddr)
> +int write_inode(struct f2fs_node *inode, u64 blkaddr, enum rw_hint whint)
>  {
>  	if (c.feature & F2FS_FEATURE_INODE_CHKSUM)
>  		inode->i.i_inode_checksum =
>  			cpu_to_le32(f2fs_inode_chksum(inode));
> -	return dev_write_block(inode, blkaddr);
> +	return dev_write_block(inode, blkaddr, whint);
>  }
>  
>  /*
> @@ -1005,7 +1005,7 @@ int get_device_info(int i)
>  #endif
>  
>  	if (!c.sparse_mode) {
> -		if (dev->zoned_model == F2FS_ZONED_HM && c.func == FSCK)
> +		if (dev->zoned_model == F2FS_ZONED_HM)
>  			flags |= O_DSYNC;
>  
>  		if (S_ISBLK(stat_buf->st_mode) &&
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index f39367a..c40d826 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -39,6 +39,11 @@
>  #include <inttypes.h>
>  #include "f2fs_fs.h"
>  
> +#ifdef HAVE_LINUX_FCNTL_H
> +#define HAVE_ARCH_STRUCT_FLOCK
> +#include <linux/fcntl.h>
> +#endif
> +
>  struct f2fs_configuration c;
>  
>  #ifdef HAVE_SPARSE_SPARSE_H
> @@ -553,11 +558,86 @@ int dev_readahead(__u64 offset, size_t UNUSED(len))
>  	return 0;
>  #endif
>  }
> +/*
> + * Copied from fs/f2fs/segment.c
> + */
> +/*
> + * This returns write hints for each segment type. This hints will be
> + * passed down to block layer as below by default.
> + *
> + * User                  F2FS                     Block
> + * ----                  ----                     -----
> + *                       META                     WRITE_LIFE_NONE|REQ_META
> + *                       HOT_NODE                 WRITE_LIFE_NONE
> + *                       WARM_NODE                WRITE_LIFE_MEDIUM
> + *                       COLD_NODE                WRITE_LIFE_LONG
> + * ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
> + * extension list        "                        "
> + *
> + * -- buffered io
> + *                       COLD_DATA                WRITE_LIFE_EXTREME
> + *                       HOT_DATA                 WRITE_LIFE_SHORT
> + *                       WARM_DATA                WRITE_LIFE_NOT_SET
> + *
> + * -- direct io
> + * WRITE_LIFE_EXTREME    COLD_DATA                WRITE_LIFE_EXTREME
> + * WRITE_LIFE_SHORT      HOT_DATA                 WRITE_LIFE_SHORT
> + * WRITE_LIFE_NOT_SET    WARM_DATA                WRITE_LIFE_NOT_SET
> + * WRITE_LIFE_NONE       "                        WRITE_LIFE_NONE
> + * WRITE_LIFE_MEDIUM     "                        WRITE_LIFE_MEDIUM
> + * WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
> + */
> +enum rw_hint f2fs_io_type_to_rw_hint(int seg_type)
> +{
> +	switch (seg_type) {
> +	case CURSEG_WARM_DATA:
> +		return WRITE_LIFE_NOT_SET;
> +	case CURSEG_HOT_DATA:
> +		return WRITE_LIFE_SHORT;
> +	case CURSEG_COLD_DATA:
> +		return WRITE_LIFE_EXTREME;
> +	case CURSEG_WARM_NODE:
> +		return WRITE_LIFE_MEDIUM;
> +	case CURSEG_HOT_NODE:
> +		return WRITE_LIFE_NONE;
> +	case CURSEG_COLD_NODE:
> +		return WRITE_LIFE_LONG;
> +	default:
> +		return WRITE_LIFE_NONE;
> +	}
> +}
>  
> -int dev_write(void *buf, __u64 offset, size_t len)
> +static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
>  {
> +	bool set_whint = (c.need_whint && (c.whint != whint));
>  	int fd;
>  
> +	fd = __get_device_fd(&offset);
> +	if (fd < 0)
> +		return fd;
> +
> +	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
> +		return -1;
> +
> +	if (set_whint) {
> +		u64 hint = whint;
> +		int ret;
> +
> +		ret = fcntl(fd, F_SET_RW_HINT, &hint);
> +		if (ret != -1)
> +			c.whint = whint;
> +	}
> +
> +	if (write(fd, buf, len) < 0)
> +		return -1;
> +
> +	c.need_fsync = true;
> +
> +	return 0;
> +}
> +
> +int dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
> +{
>  	if (c.dry_run)
>  		return 0;
>  
> @@ -572,21 +652,12 @@ int dev_write(void *buf, __u64 offset, size_t len)
>  	if (dcache_update_cache(buf, offset, len) < 0)
>  		return -1;
>  
> -	fd = __get_device_fd(&offset);
> -	if (fd < 0)
> -		return fd;
> -
> -	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
> -		return -1;
> -	if (write(fd, buf, len) < 0)
> -		return -1;
> -	c.need_fsync = true;
> -	return 0;
> +	return __dev_write(buf, offset, len, whint);
>  }
>  
> -int dev_write_block(void *buf, __u64 blk_addr)
> +int dev_write_block(void *buf, __u64 blk_addr, enum rw_hint whint)
>  {
> -	return dev_write(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
> +	return dev_write(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE, whint);
>  }
>  
>  int dev_write_dump(void *buf, __u64 offset, size_t len)
> @@ -608,32 +679,22 @@ int dev_write_symlink(char *buf, size_t len)
>  }
>  #endif
>  
> -int dev_fill(void *buf, __u64 offset, size_t len)
> +int dev_fill(void *buf, __u64 offset, size_t len, enum rw_hint whint)
>  {
> -	int fd;
> -
>  	if (c.sparse_mode)
>  		return sparse_write_zeroed_blk(offset / F2FS_BLKSIZE,
>  						len / F2FS_BLKSIZE);
>  
> -	fd = __get_device_fd(&offset);
> -	if (fd < 0)
> -		return fd;
> -
>  	/* Only allow fill to zero */
>  	if (*((__u8*)buf))
>  		return -1;
> -	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
> -		return -1;
> -	if (write(fd, buf, len) < 0)
> -		return -1;
> -	c.need_fsync = true;
> -	return 0;
> +
> +	return __dev_write(buf, offset, len, whint);
>  }
>  
> -int dev_fill_block(void *buf, __u64 blk_addr)
> +int dev_fill_block(void *buf, __u64 blk_addr, enum rw_hint whint)
>  {
> -	return dev_fill(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
> +	return dev_fill(buf, blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE, whint);
>  }
>  
>  int dev_read_block(void *buf, __u64 blk_addr)
> diff --git a/man/defrag.f2fs.8 b/man/defrag.f2fs.8
> index 34113de..fcbe3bc 100644
> --- a/man/defrag.f2fs.8
> +++ b/man/defrag.f2fs.8
> @@ -18,6 +18,9 @@ defrag.f2fs \- relocate blocks in a given area to the specified region
>  .I target block address
>  ]
>  [
> +.B \-H
> +]
> +[
>  .B \-i
>  .I direction
>  ]
> @@ -53,6 +56,9 @@ Specify the number of blocks to move.
>  .BI \-t " target block address"
>  Specify the destination block address.
>  .TP
> +.BI \-H
> +Specify support write hint.
> +.TP
>  .BI \-i " direction"
>  Set the direction to left. If it is not set, the direction becomes right
>  by default.
> diff --git a/man/fsck.f2fs.8 b/man/fsck.f2fs.8
> index aff4ff2..e39a846 100644
> --- a/man/fsck.f2fs.8
> +++ b/man/fsck.f2fs.8
> @@ -14,6 +14,9 @@ fsck.f2fs \- check a Linux F2FS file system
>  .I enable force fix
>  ]
>  [
> +.B \-H
> +]
> +[
>  .B \-M
>  .I show file map
>  ]
> @@ -48,6 +51,9 @@ module. It is disabled by default.
>  .BI \-f " enable force fix"
>  Enable to fix all the inconsistency in the partition.
>  .TP
> +.BI \-H
> +Specify support write hint.
> +.TP
>  .BI \-M " show files map"
>  Enable to show all the filenames and inode numbers stored in the image
>  .TP
> diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
> index 1f0c724..de885be 100644
> --- a/man/mkfs.f2fs.8
> +++ b/man/mkfs.f2fs.8
> @@ -31,6 +31,9 @@ mkfs.f2fs \- create an F2FS file system
>  .I default-options
>  ]
>  [
> +.B \-H
> +]
> +[
>  .B \-i
>  ]
>  [
> @@ -152,6 +155,9 @@ The following values are supported:
>  Use default options for Android having "-d1 -f -w 4096 -R 0:0 -O encrypt -O project_quota,extra_attr,{quota} -O verity".
>  .RE
>  .TP
> +.BI \-H
> +Specify support write hint.
> +.TP
>  .BI \-i
>  Enable extended node bitmap.
>  .TP
> diff --git a/man/resize.f2fs.8 b/man/resize.f2fs.8
> index 3288760..d41ad79 100644
> --- a/man/resize.f2fs.8
> +++ b/man/resize.f2fs.8
> @@ -18,6 +18,9 @@ resize.f2fs \- resize filesystem size
>  .I overprovision-ratio-percentage
>  ]
>  [
> +.B \-H
> +]
> +[
>  .B \-i
>  ]
>  [
> @@ -53,6 +56,9 @@ Specify the percentage of the volume that will be used as overprovision area.
>  This area is hidden to users, and utilized by F2FS cleaner. If not specified, the
>  best number will be assigned automatically according to the partition size.
>  .TP
> +.BI \-H
> +Specify support write hint.
> +.TP
>  .BI \-i
>  Enable extended node bitmap.
>  .TP
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 247a836..8960b71 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -640,7 +640,7 @@ static int f2fs_init_sit_area(void)
>  
>  	DBG(1, "\tFilling sit area at offset 0x%08"PRIx64"\n", sit_seg_addr);
>  	for (index = 0; index < (get_sb(segment_count_sit) / 2); index++) {
> -		if (dev_fill(zero_buf, sit_seg_addr, seg_size)) {
> +		if (dev_fill(zero_buf, sit_seg_addr, seg_size, WRITE_LIFE_NONE)) {
>  			MSG(1, "\tError: While zeroing out the sit area "
>  					"on disk!!!\n");
>  			free(zero_buf);
> @@ -674,7 +674,7 @@ static int f2fs_init_nat_area(void)
>  
>  	DBG(1, "\tFilling nat area at offset 0x%08"PRIx64"\n", nat_seg_addr);
>  	for (index = 0; index < get_sb(segment_count_nat) / 2; index++) {
> -		if (dev_fill(nat_buf, nat_seg_addr, seg_size)) {
> +		if (dev_fill(nat_buf, nat_seg_addr, seg_size, WRITE_LIFE_NONE)) {
>  			MSG(1, "\tError: While zeroing out the nat area "
>  					"on disk!!!\n");
>  			free(nat_buf);
> @@ -855,14 +855,14 @@ static int f2fs_write_check_point_pack(void)
>  
>  	DBG(1, "\tWriting main segments, cp at offset 0x%08"PRIx64"\n",
>  						cp_seg_blk);
> -	if (dev_write_block(cp, cp_seg_blk)) {
> +	if (dev_write_block(cp, cp_seg_blk, WRITE_LIFE_NONE)) {
>  		MSG(1, "\tError: While writing the cp to disk!!!\n");
>  		goto free_cp_payload;
>  	}
>  
>  	for (i = 0; i < get_sb(cp_payload); i++) {
>  		cp_seg_blk++;
> -		if (dev_fill_block(cp_payload, cp_seg_blk)) {
> +		if (dev_fill_block(cp_payload, cp_seg_blk, WRITE_LIFE_NONE)) {
>  			MSG(1, "\tError: While zeroing out the sit bitmap area "
>  					"on disk!!!\n");
>  			goto free_cp_payload;
> @@ -943,7 +943,7 @@ static int f2fs_write_check_point_pack(void)
>  	cp_seg_blk++;
>  	DBG(1, "\tWriting Segment summary for HOT/WARM/COLD_DATA, at offset 0x%08"PRIx64"\n",
>  			cp_seg_blk);
> -	if (dev_write_block(sum_compact, cp_seg_blk)) {
> +	if (dev_write_block(sum_compact, cp_seg_blk, WRITE_LIFE_NONE)) {
>  		MSG(1, "\tError: While writing the sum_blk to disk!!!\n");
>  		goto free_cp_payload;
>  	}
> @@ -957,7 +957,7 @@ static int f2fs_write_check_point_pack(void)
>  	cp_seg_blk++;
>  	DBG(1, "\tWriting Segment summary for HOT_NODE, at offset 0x%08"PRIx64"\n",
>  			cp_seg_blk);
> -	if (dev_write_block(sum, cp_seg_blk)) {
> +	if (dev_write_block(sum, cp_seg_blk, WRITE_LIFE_NONE)) {
>  		MSG(1, "\tError: While writing the sum_blk to disk!!!\n");
>  		goto free_cp_payload;
>  	}
> @@ -969,7 +969,7 @@ static int f2fs_write_check_point_pack(void)
>  	cp_seg_blk++;
>  	DBG(1, "\tWriting Segment summary for WARM_NODE, at offset 0x%08"PRIx64"\n",
>  			cp_seg_blk);
> -	if (dev_write_block(sum, cp_seg_blk)) {
> +	if (dev_write_block(sum, cp_seg_blk, WRITE_LIFE_NONE)) {
>  		MSG(1, "\tError: While writing the sum_blk to disk!!!\n");
>  		goto free_cp_payload;
>  	}
> @@ -980,7 +980,7 @@ static int f2fs_write_check_point_pack(void)
>  	cp_seg_blk++;
>  	DBG(1, "\tWriting Segment summary for COLD_NODE, at offset 0x%08"PRIx64"\n",
>  			cp_seg_blk);
> -	if (dev_write_block(sum, cp_seg_blk)) {
> +	if (dev_write_block(sum, cp_seg_blk, WRITE_LIFE_NONE)) {
>  		MSG(1, "\tError: While writing the sum_blk to disk!!!\n");
>  		goto free_cp_payload;
>  	}
> @@ -988,7 +988,7 @@ static int f2fs_write_check_point_pack(void)
>  	/* cp page2 */
>  	cp_seg_blk++;
>  	DBG(1, "\tWriting cp page2, at offset 0x%08"PRIx64"\n", cp_seg_blk);
> -	if (dev_write_block(cp, cp_seg_blk)) {
> +	if (dev_write_block(cp, cp_seg_blk, WRITE_LIFE_NONE)) {
>  		MSG(1, "\tError: While writing the cp to disk!!!\n");
>  		goto free_cp_payload;
>  	}
> @@ -1011,7 +1011,8 @@ static int f2fs_write_check_point_pack(void)
>  
>  		for (i = 0; i < nat_bits_blocks; i++) {
>  			if (dev_write_block(nat_bits + i *
> -						F2FS_BLKSIZE, cp_seg_blk + i)) {
> +						F2FS_BLKSIZE, cp_seg_blk + i,
> +						WRITE_LIFE_NONE)) {
>  				MSG(1, "\tError: write NAT bits to disk!!!\n");
>  				goto free_cp_payload;
>  			}
> @@ -1029,14 +1030,14 @@ static int f2fs_write_check_point_pack(void)
>  	cp_seg_blk = get_sb(segment0_blkaddr) + c.blks_per_seg;
>  	DBG(1, "\tWriting cp page 1 of checkpoint pack 2, at offset 0x%08"PRIx64"\n",
>  				cp_seg_blk);
> -	if (dev_write_block(cp, cp_seg_blk)) {
> +	if (dev_write_block(cp, cp_seg_blk, WRITE_LIFE_NONE)) {
>  		MSG(1, "\tError: While writing the cp to disk!!!\n");
>  		goto free_cp_payload;
>  	}
>  
>  	for (i = 0; i < get_sb(cp_payload); i++) {
>  		cp_seg_blk++;
> -		if (dev_fill_block(cp_payload, cp_seg_blk)) {
> +		if (dev_fill_block(cp_payload, cp_seg_blk, WRITE_LIFE_NONE)) {
>  			MSG(1, "\tError: While zeroing out the sit bitmap area "
>  					"on disk!!!\n");
>  			goto free_cp_payload;
> @@ -1048,7 +1049,7 @@ static int f2fs_write_check_point_pack(void)
>  					get_sb(cp_payload) - 1);
>  	DBG(1, "\tWriting cp page 2 of checkpoint pack 2, at offset 0x%08"PRIx64"\n",
>  				cp_seg_blk);
> -	if (dev_write_block(cp, cp_seg_blk)) {
> +	if (dev_write_block(cp, cp_seg_blk, WRITE_LIFE_NONE)) {
>  		MSG(1, "\tError: While writing the cp to disk!!!\n");
>  		goto free_cp_payload;
>  	}
> @@ -1082,7 +1083,7 @@ static int f2fs_write_super_block(void)
>  	memcpy(zero_buff + F2FS_SUPER_OFFSET, sb, sizeof(*sb));
>  	DBG(1, "\tWriting super block, at offset 0x%08x\n", 0);
>  	for (index = 0; index < 2; index++) {
> -		if (dev_write_block(zero_buff, index)) {
> +		if (dev_write_block(zero_buff, index, WRITE_LIFE_NONE)) {
>  			MSG(1, "\tError: While while writing super_blk "
>  					"on disk!!! index : %d\n", index);
>  			free(zero_buff);
> @@ -1135,7 +1136,8 @@ static int f2fs_discard_obsolete_dnode(void)
>  		memset(raw_node, 0, F2FS_BLKSIZE);
>  
>  		DBG(1, "\tDiscard dnode, at offset 0x%08"PRIx64"\n", offset);
> -		if (dev_write_block(raw_node, offset)) {
> +		if (dev_write_block(raw_node, offset,
> +				    f2fs_io_type_to_rw_hint(CURSEG_WARM_NODE))) {
>  			MSG(1, "\tError: While discarding direct node!!!\n");
>  			free(raw_node);
>  			return -1;
> @@ -1256,7 +1258,8 @@ static block_t f2fs_add_default_dentry_root(void)
>  	data_blkaddr = alloc_next_free_block(CURSEG_HOT_DATA);
>  
>  	DBG(1, "\tWriting default dentry root, at offset 0x%x\n", data_blkaddr);
> -	if (dev_write_block(dent_blk, data_blkaddr)) {
> +	if (dev_write_block(dent_blk, data_blkaddr,
> +			    f2fs_io_type_to_rw_hint(CURSEG_HOT_DATA))) {
>  		MSG(1, "\tError: While writing the dentry_blk to disk!!!\n");
>  		free(dent_blk);
>  		return 0;
> @@ -1301,7 +1304,8 @@ static int f2fs_write_root_inode(void)
>  	F2FS_NODE_FOOTER(raw_node)->next_blkaddr = cpu_to_le32(node_blkaddr + 1);
>  
>  	DBG(1, "\tWriting root inode (hot node), offset 0x%x\n", node_blkaddr);
> -	if (write_inode(raw_node, node_blkaddr) < 0) {
> +	if (write_inode(raw_node, node_blkaddr,
> +			f2fs_io_type_to_rw_hint(CURSEG_HOT_NODE)) < 0) {
>  		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
>  		free(raw_node);
>  		return -1;
> @@ -1377,7 +1381,8 @@ static int f2fs_write_default_quota(int qtype, __le32 raw_id)
>  	for (i = 0; i < QUOTA_DATA; i++) {
>  		blkaddr = alloc_next_free_block(CURSEG_HOT_DATA);
>  
> -		if (dev_write_block(filebuf + i * F2FS_BLKSIZE, blkaddr)) {
> +		if (dev_write_block(filebuf + i * F2FS_BLKSIZE, blkaddr,
> +				    f2fs_io_type_to_rw_hint(CURSEG_HOT_DATA))) {
>  			MSG(1, "\tError: While writing the quota_blk to disk!!!\n");
>  			free(filebuf);
>  			return 0;
> @@ -1439,7 +1444,8 @@ static int f2fs_write_qf_inode(int qtype)
>  					cpu_to_le32(data_blkaddr + i);
>  
>  	DBG(1, "\tWriting quota inode (hot node), offset 0x%x\n", node_blkaddr);
> -	if (write_inode(raw_node, node_blkaddr) < 0) {
> +	if (write_inode(raw_node, node_blkaddr,
> +			f2fs_io_type_to_rw_hint(CURSEG_HOT_NODE)) < 0) {
>  		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
>  		free(raw_node);
>  		return -1;
> @@ -1476,7 +1482,7 @@ static int f2fs_update_nat_default(void)
>  
>  	DBG(1, "\tWriting nat root, at offset 0x%08"PRIx64"\n",
>  					nat_seg_blk_offset);
> -	if (dev_write_block(nat_blk, nat_seg_blk_offset)) {
> +	if (dev_write_block(nat_blk, nat_seg_blk_offset, WRITE_LIFE_NONE)) {
>  		MSG(1, "\tError: While writing the nat_blk set0 to disk!\n");
>  		free(nat_blk);
>  		return -1;
> @@ -1516,7 +1522,8 @@ static block_t f2fs_add_default_dentry_lpf(void)
>  
>  	DBG(1, "\tWriting default dentry lost+found, at offset 0x%x\n",
>  							data_blkaddr);
> -	if (dev_write_block(dent_blk, data_blkaddr)) {
> +	if (dev_write_block(dent_blk, data_blkaddr,
> +			    f2fs_io_type_to_rw_hint(CURSEG_HOT_DATA))) {
>  		MSG(1, "\tError While writing the dentry_blk to disk!!!\n");
>  		free(dent_blk);
>  		return 0;
> @@ -1563,7 +1570,8 @@ static int f2fs_write_lpf_inode(void)
>  
>  	DBG(1, "\tWriting lost+found inode (hot node), offset 0x%x\n",
>  								node_blkaddr);
> -	if (write_inode(raw_node, node_blkaddr) < 0) {
> +	if (write_inode(raw_node, node_blkaddr,
> +			f2fs_io_type_to_rw_hint(CURSEG_HOT_NODE)) < 0) {
>  		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
>  		err = -1;
>  		goto exit;
> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> index c98e73c..d9cdd61 100644
> --- a/mkfs/f2fs_format_main.c
> +++ b/mkfs/f2fs_format_main.c
> @@ -56,6 +56,7 @@ static void mkfs_usage()
>  	MSG(0, "  -E [hot file ext list] e.g. \"db\"\n");
>  	MSG(0, "  -f force overwrite of the existing filesystem\n");
>  	MSG(0, "  -g add default options\n");
> +	MSG(0, "  -H support write hint\n");
>  	MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
>  	MSG(0, "  -l label\n");
>  	MSG(0, "  -U uuid\n");
> @@ -173,7 +174,7 @@ static void add_default_options(void)
>  
>  static void f2fs_parse_options(int argc, char *argv[])
>  {
> -	static const char *option_string = "qa:b:c:C:d:e:E:g:hil:mo:O:rR:s:S:z:t:T:U:Vfw:Z:";
> +	static const char *option_string = "qa:b:c:C:d:e:E:g:hHil:mo:O:rR:s:S:z:t:T:U:Vfw:Z:";
>  	static const struct option long_opts[] = {
>  		{ .name = "help", .has_arg = 0, .flag = NULL, .val = 'h' },
>  		{ .name = NULL, .has_arg = 0, .flag = NULL, .val = 0 }
> @@ -228,6 +229,10 @@ static void f2fs_parse_options(int argc, char *argv[])
>  		case 'h':
>  			mkfs_usage();
>  			break;
> +		case 'H':
> +			c.need_whint = true;
> +			c.whint = WRITE_LIFE_NOT_SET;
> +			break;
>  		case 'i':
>  			c.large_nat_bitmap = 1;
>  			break;
> @@ -475,7 +480,7 @@ int main(int argc, char *argv[])
>  		}
>  		/* wipe out other FS magics mostly first 4MB space */
>  		for (i = 0; i < 1024; i++)
> -			if (dev_fill_block(zero_buf, i))
> +			if (dev_fill_block(zero_buf, i, WRITE_LIFE_NONE))
>  				break;
>  		free(zero_buf);
>  		if (i != 1024) {
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
