Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07315D01E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 03:43:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2QwX-0000Da-Io; Fri, 14 Feb 2020 02:43:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j2QwV-0000DL-Ur
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 02:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1pbdFYtYD2Et2jYCTnnFcs+QJJdWijgMG9h8qQP8hCc=; b=HxQ+2Lnm2vgJQK0mwVLQ+ONFxo
 V4xiB3bf5v/g9t+1ODvp2+VCWZCtgwiNkCWChKurdPI68B6wJ9EfRfJEPbuECxjMtlzUQ1J3uYatx
 sUQ7MmIGltAZoah5jVaiz67aWzx39cIOzql24+Cj/glme9oVNrsyyZJRIaqQuP1Hv6p8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1pbdFYtYD2Et2jYCTnnFcs+QJJdWijgMG9h8qQP8hCc=; b=ioSop/Kknc8zIgxVR2WImXjuht
 Vwpl9U6y7hwCl5cFFXfzyiTdg6vjE4ft73z3ktsQYJQWKGHlmiOUkQpQUJ5ih+iGeqzCIyiOxMo7L
 /uay0pWQyTYTl4POHZgmvVjtooZ6xh/YnY16i+vcoVBknYk6Y3foiI9GXUbIODCKQEZM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2QwT-003Sk9-5o
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 02:42:59 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 84623F842BC3B938455B;
 Fri, 14 Feb 2020 10:32:09 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 14 Feb
 2020 10:32:08 +0800
To: <jaegeuk@kernel.org>
References: <20180127094301.29154-1-yuchao0@huawei.com>
 <20180127094301.29154-2-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2826070a-82f6-2911-4c77-2b895182c964@huawei.com>
Date: Fri, 14 Feb 2020 10:32:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180127094301.29154-2-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j2QwT-003Sk9-5o
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support {d,id,did,x}node checksum
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

Hi Jaegeuk,

Is it time to consider this metadata chksum feature? Maybe for 5.7 version.

Thanks,

On 2018/1/27 17:43, Chao Yu wrote:
> This patch adds to support {d,id,did,x}node checksum in kernel side.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/f2fs.h          | 15 +++++++-
>  fs/f2fs/inode.c         | 98 +++++++++++++++++++++++++++++++------------------
>  fs/f2fs/node.c          |  2 +-
>  fs/f2fs/segment.c       |  2 +-
>  fs/f2fs/sysfs.c         |  7 ++++
>  include/linux/f2fs_fs.h | 10 ++++-
>  6 files changed, 93 insertions(+), 41 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 6f5e41657c62..ad48d389fea4 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -128,6 +128,7 @@ struct f2fs_mount_info {
>  #define F2FS_FEATURE_QUOTA_INO		0x0080
>  #define F2FS_FEATURE_INODE_CRTIME	0x0100
>  #define F2FS_FEATURE_EXTENDED_NODE	0x0200
> +#define F2FS_FEATURE_NODE_CHECKSUM	0x0400
>  
>  #define F2FS_HAS_FEATURE(sb, mask)					\
>  	((F2FS_SB(sb)->raw_super->feature & cpu_to_le32(mask)) != 0)
> @@ -2570,6 +2571,11 @@ static inline int get_inline_xattr_addrs(struct inode *inode)
>  		sizeof((f2fs_inode)->field))			\
>  		<= (F2FS_OLD_ATTRIBUTE_SIZE + extra_isize))	\
>  
> +#define F2FS_FITS_IN_NODE(extra_nsize, field)		\
> +		((offsetof(struct f2fs_node, footer) -	\
> +		offsetof(struct f2fs_node, field))	\
> +		<= (extra_nsize))			\
> +
>  static inline void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
>  {
>  	int i;
> @@ -2616,8 +2622,8 @@ int f2fs_pin_file_control(struct inode *inode, bool inc);
>   * inode.c
>   */
>  void f2fs_set_inode_flags(struct inode *inode);
> -bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page);
> -void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
> +bool f2fs_node_chksum_verify(struct f2fs_sb_info *sbi, struct page *page);
> +void f2fs_node_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
>  struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
>  struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
>  int try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
> @@ -3252,6 +3258,11 @@ static inline int f2fs_sb_has_extended_node(struct super_block *sb)
>  	return F2FS_HAS_FEATURE(sb, F2FS_FEATURE_EXTENDED_NODE);
>  }
>  
> +static inline int f2fs_sb_has_node_checksum(struct super_block *sb)
> +{
> +	return F2FS_HAS_FEATURE(sb, F2FS_FEATURE_NODE_CHECKSUM);
> +}
> +
>  #ifdef CONFIG_BLK_DEV_ZONED
>  static inline int get_blkz_type(struct f2fs_sb_info *sbi,
>  			struct block_device *bdev, block_t blkaddr)
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index f5b5606ca273..f879f0a65986 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -111,75 +111,103 @@ static void __recover_inline_status(struct inode *inode, struct page *ipage)
>  	return;
>  }
>  
> -static bool f2fs_enable_inode_chksum(struct f2fs_sb_info *sbi, struct page *page)
> +static bool f2fs_enable_node_chksum(struct f2fs_sb_info *sbi, struct page *page)
>  {
> -	struct f2fs_inode *ri = &F2FS_NODE(page)->i;
> -	int extra_isize = le32_to_cpu(ri->i_extra_isize);
> -
> -	if (!f2fs_sb_has_inode_chksum(sbi->sb))
> -		return false;
> -
> -	if (!RAW_IS_INODE(F2FS_NODE(page)) || !(ri->i_inline & F2FS_EXTRA_ATTR))
> -		return false;
> -
> -	if (!F2FS_FITS_IN_INODE(ri, extra_isize, i_inode_checksum))
> -		return false;
> +	if (IS_INODE(page)) {
> +		struct f2fs_inode *ri = &F2FS_NODE(page)->i;
> +		int extra_isize = le32_to_cpu(ri->i_extra_isize);
> +
> +		if (!(ri->i_inline & F2FS_EXTRA_ATTR))
> +			return false;
> +		if (!f2fs_sb_has_inode_chksum(sbi->sb))
> +			return false;
> +		if (!F2FS_FITS_IN_INODE(ri, extra_isize, i_inode_checksum))
> +			return false;
> +	} else {
> +		if (!f2fs_sb_has_extended_node(sbi->sb))
> +			return false;
> +		if (!f2fs_sb_has_node_checksum(sbi->sb))
> +			return false;
> +		if (!F2FS_FITS_IN_NODE(sbi->extra_nsize, node_checksum))
> +			return false;
> +	}
>  
>  	return true;
>  }
>  
> -static __u32 f2fs_inode_chksum(struct f2fs_sb_info *sbi, struct page *page)
> +static __u32 f2fs_node_chksum(struct f2fs_sb_info *sbi, struct page *page)
>  {
>  	struct f2fs_node *node = F2FS_NODE(page);
> -	struct f2fs_inode *ri = &node->i;
> -	__le32 ino = node->footer.ino;
> -	__le32 gen = ri->i_generation;
> -	__u32 chksum, chksum_seed;
> -	__u32 dummy_cs = 0;
> -	unsigned int offset = offsetof(struct f2fs_inode, i_inode_checksum);
> -	unsigned int cs_size = sizeof(dummy_cs);
> +	__le32 append, ino = node->footer.ino;
> +	__u32 chksum, chksum_seed, dummy_cs = 0;
> +	unsigned int offset, cs_size = sizeof(dummy_cs);
> +	bool is_inode = RAW_IS_INODE(node);
> +
> +	if (is_inode) {
> +		append = node->i.i_generation;
> +		offset = offsetof(struct f2fs_inode, i_inode_checksum);
> +	} else {
> +		append = node->footer.nid;
> +		offset = offsetof(struct f2fs_node, node_checksum);
> +	}
>  
>  	chksum = f2fs_chksum(sbi, sbi->s_chksum_seed, (__u8 *)&ino,
>  							sizeof(ino));
> -	chksum_seed = f2fs_chksum(sbi, chksum, (__u8 *)&gen, sizeof(gen));
> +	chksum_seed = f2fs_chksum(sbi, chksum, (__u8 *)&append, sizeof(append));
>  
> -	chksum = f2fs_chksum(sbi, chksum_seed, (__u8 *)ri, offset);
> +	chksum = f2fs_chksum(sbi, chksum_seed, (__u8 *)node, offset);
>  	chksum = f2fs_chksum(sbi, chksum, (__u8 *)&dummy_cs, cs_size);
>  	offset += cs_size;
> -	chksum = f2fs_chksum(sbi, chksum, (__u8 *)ri + offset,
> +	chksum = f2fs_chksum(sbi, chksum, (__u8 *)node + offset,
>  						F2FS_BLKSIZE - offset);
>  	return chksum;
>  }
>  
> -bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page)
> +bool f2fs_node_chksum_verify(struct f2fs_sb_info *sbi, struct page *page)
>  {
> -	struct f2fs_inode *ri;
> +	struct f2fs_node *rn;
>  	__u32 provided, calculated;
>  
> -	if (!f2fs_enable_inode_chksum(sbi, page) ||
> +	if (!f2fs_enable_node_chksum(sbi, page) ||
>  			PageDirty(page) || PageWriteback(page))
>  		return true;
>  
> -	ri = &F2FS_NODE(page)->i;
> -	provided = le32_to_cpu(ri->i_inode_checksum);
> -	calculated = f2fs_inode_chksum(sbi, page);
> +	rn = F2FS_NODE(page);
> +	if (RAW_IS_INODE(rn))
> +		provided = le32_to_cpu(rn->i.i_inode_checksum);
> +	else
> +		provided = le32_to_cpu(rn->node_checksum);
> +	calculated = f2fs_node_chksum(sbi, page);
>  
>  	if (provided != calculated)
>  		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"checksum invalid, ino = %x, %x vs. %x",
> -			ino_of_node(page), provided, calculated);
> +			"checksum invalid, ino = %u, nid = %u, %x vs. %x",
> +			ino_of_node(page), nid_of_node(page),
> +			provided, calculated);
> +
> +	else
> +		f2fs_msg(sbi->sb, KERN_WARNING,
> +			"checksum is valid, ino = %u, nid = %u, %x vs. %x",
> +			ino_of_node(page), nid_of_node(page),
> +			provided, calculated);
>  
>  	return provided == calculated;
>  }
>  
> -void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
> +void f2fs_node_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
>  {
> -	struct f2fs_inode *ri = &F2FS_NODE(page)->i;
> +	struct f2fs_node *rn = F2FS_NODE(page);
> +	__le32 chksum;
>  
> -	if (!f2fs_enable_inode_chksum(sbi, page))
> +	if (!f2fs_enable_node_chksum(sbi, page))
>  		return;
>  
> -	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
> +	chksum = cpu_to_le32(f2fs_node_chksum(sbi, page));
> +
> +	if (RAW_IS_INODE(rn))
> +		rn->i.i_inode_checksum = chksum;
> +	else
> +		rn->node_checksum = chksum;
>  }
>  
>  static int do_read_inode(struct inode *inode)
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index bc8424babf36..613e6bc65f9c 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1194,7 +1194,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
>  		goto out_err;
>  	}
>  
> -	if (!f2fs_inode_chksum_verify(sbi, page)) {
> +	if (!f2fs_node_chksum_verify(sbi, page)) {
>  		err = -EBADMSG;
>  		goto out_err;
>  	}
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index ba8cd4e5ad75..5aa2c24cdcd8 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2678,7 +2678,7 @@ void allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  	if (page && IS_NODESEG(type)) {
>  		fill_node_footer_blkaddr(page, NEXT_FREE_BLKADDR(sbi, curseg));
>  
> -		f2fs_inode_chksum_set(sbi, page);
> +		f2fs_node_chksum_set(sbi, page);
>  	}
>  
>  	if (add_list) {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index f25a6fc0a17e..24d3b82c7bf0 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -119,6 +119,9 @@ static ssize_t features_show(struct f2fs_attr *a,
>  	if (f2fs_sb_has_extended_node(sb))
>  		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
>  				len ? ", " : "", "extended_node");
> +	if (f2fs_sb_has_node_checksum(sb))
> +		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
> +				len ? ", " : "", "node_checksum");
>  	len += snprintf(buf + len, PAGE_SIZE - len, "\n");
>  	return len;
>  }
> @@ -240,6 +243,7 @@ enum feat_id {
>  	FEAT_QUOTA_INO,
>  	FEAT_INODE_CRTIME,
>  	FEAT_EXTENDED_NODE,
> +	FEAT_NODE_CHECKSUM,
>  };
>  
>  static ssize_t f2fs_feature_show(struct f2fs_attr *a,
> @@ -256,6 +260,7 @@ static ssize_t f2fs_feature_show(struct f2fs_attr *a,
>  	case FEAT_QUOTA_INO:
>  	case FEAT_INODE_CRTIME:
>  	case FEAT_EXTENDED_NODE:
> +	case FEAT_NODE_CHECKSUM:
>  		return snprintf(buf, PAGE_SIZE, "supported\n");
>  	}
>  	return 0;
> @@ -335,6 +340,7 @@ F2FS_FEATURE_RO_ATTR(flexible_inline_xattr, FEAT_FLEXIBLE_INLINE_XATTR);
>  F2FS_FEATURE_RO_ATTR(quota_ino, FEAT_QUOTA_INO);
>  F2FS_FEATURE_RO_ATTR(inode_crtime, FEAT_INODE_CRTIME);
>  F2FS_FEATURE_RO_ATTR(extended_node, FEAT_EXTENDED_NODE);
> +F2FS_FEATURE_RO_ATTR(node_checksum, FEAT_NODE_CHECKSUM);
>  
>  #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
>  static struct attribute *f2fs_attrs[] = {
> @@ -390,6 +396,7 @@ static struct attribute *f2fs_feat_attrs[] = {
>  	ATTR_LIST(quota_ino),
>  	ATTR_LIST(inode_crtime),
>  	ATTR_LIST(extended_node),
> +	ATTR_LIST(node_checksum),
>  	NULL,
>  };
>  
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index a6bacfdd378d..941b5330c504 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -295,8 +295,14 @@ struct f2fs_node {
>  	/* can be one of three types: inode, direct, and indirect types */
>  	union {
>  		struct f2fs_inode i;
> -		struct direct_node dn;
> -		struct indirect_node in;
> +		union {
> +			struct {
> +				__le32 data[1017];
> +				__le32 node_checksum;
> +			};
> +			struct direct_node dn;
> +			struct indirect_node in;
> +		};
>  	};
>  	struct node_footer footer;
>  } __packed;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
