Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B39C22D3956
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 04:54:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmqYa-00072b-Si; Wed, 09 Dec 2020 03:54:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kmqYZ-00072P-8d
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 03:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=95xA0Bua//pgPCQEsKX/o8DOeoACiwNyHZVwOB2HKo4=; b=O2v0Xu1HwRH5SBLO9hWhUaAiNS
 uGLUKFwWOeJhnYBaOq5H8AtEhWmpKq0Blxi3T6gKaV0q+z7bRQCm1/bqS1JkBuIy8jMSA7EGnxjLF
 MCTpXLlxbn1dtv7NmAyWx7Q/MUxxe2OKXrLs5457Q7al6aOoEjPWBHhnMERtQRmzuggk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=95xA0Bua//pgPCQEsKX/o8DOeoACiwNyHZVwOB2HKo4=; b=gWw+/NDf6J7xDekJ7dP9T0VccC
 F+37JT3/+AqB8fzz8Z7Il1oTkPjd3TgQTqMGyxqAgbKHdCI6gM56tDvaoDyx8tywfsUll82JM3Dir
 1ovdywtV34cz7dm1LY6md9vVeQWu69/sse35rZYlNRp/ihkfXQ3ROnQCh/gZcNkAHgJQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmqYS-004Rg2-9G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 03:54:23 +0000
Date: Tue, 8 Dec 2020 19:54:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607486049;
 bh=1ChwpTu2ugzatPiOPZ+16AxMsjbL80C0N8xZ1jqn/j8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=fRcFX8w9pprZvSHYLY45IyddF9UoUredwzoL43NBiYE6KAR3psnzsPv7Z8k33MppG
 NfrMJ4a/IbBL8t03KJrInG8dv3PQQt2VMukSzzN/zMgpfoVUMl7hxCDk/1IRkfzkWx
 2govk0NcdFNVxL13rz81UgmIdEDqbCHvoOXXZ5vL9moCAkVidrS7xuhuacUtHqlPnN
 LnQ7W82GeQSy/23LZxV0r24jFAPtgBXDpITbt6OY4dj1E013hmfz8fhGUQEpWNBDhA
 U3Tm1ZGMjclHQyTNKKEkgeNQhpEv+ABcXK0OtDL/Ab1eW1fRgdp4zbK9opDHUVBkgz
 flI0W2+sdD/FA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X9BKX9PUMFkts9bI@google.com>
References: <20201208031437.56627-1-yuchao0@huawei.com>
 <22ac4df6-53ec-fb7c-c4dd-26435352a701@huawei.com>
 <X9A7Jn+cHRRcAmIi@google.com>
 <37d89d34-add1-5254-380b-233ef7a460d4@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37d89d34-add1-5254-380b-233ef7a460d4@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmqYS-004Rg2-9G
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: support chksum
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

On 12/09, Chao Yu wrote:
> On 2020/12/9 10:49, Jaegeuk Kim wrote:
> > On 12/09, Chao Yu wrote:
> > > Hello guys,
> > > 
> > > Any further comments on compress related patches?
> > > 
> > > Jaegeuk, could you please queue these patches in dev-test? let me know
> > > if there is any problem.
> > 
> > Chao, could you please rebase and post them in a series? I lost the patch order
> > and got some conflicts when trying to merge.
> 
> I can't rebase on your dev branch, because in your branch, there is old version
> of "f2fs: compress:support chksum", could you please drop old one and apply last
> v4 one in the same place? and push to kernel.org.

Ah, could you please write another patch to adjust the new changes?

> 
> Then I can rebase and resend patches.
> 
> Thanks,
> 
> > 
> > > 
> > > On 2020/12/8 11:14, Chao Yu wrote:
> > > > This patch supports to store chksum value with compressed
> > > > data, and verify the integrality of compressed data while
> > > > reading the data.
> > > > 
> > > > The feature can be enabled through specifying mount option
> > > > 'compress_chksum'.
> > > > 
> > > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > > ---
> > > > v4:
> > > > - enhance readability
> > > > - remove WARN_ON_ONCE()
> > > >    Documentation/filesystems/f2fs.rst |  1 +
> > > >    fs/f2fs/compress.c                 | 22 ++++++++++++++++++++++
> > > >    fs/f2fs/f2fs.h                     | 16 ++++++++++++++--
> > > >    fs/f2fs/inode.c                    |  3 +++
> > > >    fs/f2fs/super.c                    |  9 +++++++++
> > > >    include/linux/f2fs_fs.h            |  2 +-
> > > >    6 files changed, 50 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> > > > index b8ee761c9922..985ae7d35066 100644
> > > > --- a/Documentation/filesystems/f2fs.rst
> > > > +++ b/Documentation/filesystems/f2fs.rst
> > > > @@ -260,6 +260,7 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
> > > >    			 For other files, we can still enable compression via ioctl.
> > > >    			 Note that, there is one reserved special extension '*', it
> > > >    			 can be set to enable compression for all files.
> > > > +compress_chksum		 Support verifying chksum of raw data in compressed cluster.
> > > >    inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
> > > >    			 files using the blk-crypto framework rather than
> > > >    			 filesystem-layer encryption. This allows the use of
> > > > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > > > index 14262e0f1cd6..9313c8695855 100644
> > > > --- a/fs/f2fs/compress.c
> > > > +++ b/fs/f2fs/compress.c
> > > > @@ -602,6 +602,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
> > > >    				f2fs_cops[fi->i_compress_algorithm];
> > > >    	unsigned int max_len, new_nr_cpages;
> > > >    	struct page **new_cpages;
> > > > +	u32 chksum = 0;
> > > >    	int i, ret;
> > > >    	trace_f2fs_compress_pages_start(cc->inode, cc->cluster_idx,
> > > > @@ -655,6 +656,11 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
> > > >    	cc->cbuf->clen = cpu_to_le32(cc->clen);
> > > > +	if (fi->i_compress_flag & 1 << COMPRESS_CHKSUM)
> > > > +		chksum = f2fs_crc32(F2FS_I_SB(cc->inode),
> > > > +					cc->cbuf->cdata, cc->clen);
> > > > +	cc->cbuf->chksum = cpu_to_le32(chksum);
> > > > +
> > > >    	for (i = 0; i < COMPRESS_DATA_RESERVED_SIZE; i++)
> > > >    		cc->cbuf->reserved[i] = cpu_to_le32(0);
> > > > @@ -790,6 +796,22 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
> > > >    	ret = cops->decompress_pages(dic);
> > > > +	if (!ret && (fi->i_compress_flag & 1 << COMPRESS_CHKSUM)) {
> > > > +		u32 provided = le32_to_cpu(dic->cbuf->chksum);
> > > > +		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
> > > > +
> > > > +		if (provided != calculated) {
> > > > +			if (!is_inode_flag_set(dic->inode, FI_COMPRESS_CORRUPT)) {
> > > > +				set_inode_flag(dic->inode, FI_COMPRESS_CORRUPT);
> > > > +				printk_ratelimited(
> > > > +					"%sF2FS-fs (%s): checksum invalid, nid = %lu, %x vs %x",
> > > > +					KERN_INFO, sbi->sb->s_id, dic->inode->i_ino,
> > > > +					provided, calculated);
> > > > +			}
> > > > +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> > > > +		}
> > > > +	}
> > > > +
> > > >    out_vunmap_cbuf:
> > > >    	vm_unmap_ram(dic->cbuf, dic->nr_cpages);
> > > >    out_vunmap_rbuf:
> > > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > index 0d25f5ca5618..0b314b2034d8 100644
> > > > --- a/fs/f2fs/f2fs.h
> > > > +++ b/fs/f2fs/f2fs.h
> > > > @@ -147,7 +147,8 @@ struct f2fs_mount_info {
> > > >    	/* For compression */
> > > >    	unsigned char compress_algorithm;	/* algorithm type */
> > > > -	unsigned compress_log_size;		/* cluster log size */
> > > > +	unsigned char compress_log_size;	/* cluster log size */
> > > > +	bool compress_chksum;			/* compressed data chksum */
> > > >    	unsigned char compress_ext_cnt;		/* extension count */
> > > >    	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
> > > >    };
> > > > @@ -676,6 +677,7 @@ enum {
> > > >    	FI_ATOMIC_REVOKE_REQUEST, /* request to drop atomic data */
> > > >    	FI_VERITY_IN_PROGRESS,	/* building fs-verity Merkle tree */
> > > >    	FI_COMPRESSED_FILE,	/* indicate file's data can be compressed */
> > > > +	FI_COMPRESS_CORRUPT,	/* indicate compressed cluster is corrupted */
> > > >    	FI_MMAP_FILE,		/* indicate file was mmapped */
> > > >    	FI_MAX,			/* max flag, never be used */
> > > >    };
> > > > @@ -733,6 +735,7 @@ struct f2fs_inode_info {
> > > >    	atomic_t i_compr_blocks;		/* # of compressed blocks */
> > > >    	unsigned char i_compress_algorithm;	/* algorithm type */
> > > >    	unsigned char i_log_cluster_size;	/* log of cluster size */
> > > > +	unsigned short i_compress_flag;		/* compress flag */
> > > >    	unsigned int i_cluster_size;		/* cluster size */
> > > >    };
> > > > @@ -1272,9 +1275,15 @@ enum compress_algorithm_type {
> > > >    	COMPRESS_MAX,
> > > >    };
> > > > -#define COMPRESS_DATA_RESERVED_SIZE		5
> > > > +enum compress_flag {
> > > > +	COMPRESS_CHKSUM,
> > > > +	COMPRESS_MAX_FLAG,
> > > > +};
> > > > +
> > > > +#define COMPRESS_DATA_RESERVED_SIZE		4
> > > >    struct compress_data {
> > > >    	__le32 clen;			/* compressed data size */
> > > > +	__le32 chksum;			/* compressed data chksum */
> > > >    	__le32 reserved[COMPRESS_DATA_RESERVED_SIZE];	/* reserved */
> > > >    	u8 cdata[];			/* compressed data */
> > > >    };
> > > > @@ -3888,6 +3897,9 @@ static inline void set_compress_context(struct inode *inode)
> > > >    			F2FS_OPTION(sbi).compress_algorithm;
> > > >    	F2FS_I(inode)->i_log_cluster_size =
> > > >    			F2FS_OPTION(sbi).compress_log_size;
> > > > +	F2FS_I(inode)->i_compress_flag =
> > > > +			F2FS_OPTION(sbi).compress_chksum ?
> > > > +				1 << COMPRESS_CHKSUM : 0;
> > > >    	F2FS_I(inode)->i_cluster_size =
> > > >    			1 << F2FS_I(inode)->i_log_cluster_size;
> > > >    	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
> > > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > > index 657db2fb6739..349d9cb933ee 100644
> > > > --- a/fs/f2fs/inode.c
> > > > +++ b/fs/f2fs/inode.c
> > > > @@ -456,6 +456,7 @@ static int do_read_inode(struct inode *inode)
> > > >    					le64_to_cpu(ri->i_compr_blocks));
> > > >    			fi->i_compress_algorithm = ri->i_compress_algorithm;
> > > >    			fi->i_log_cluster_size = ri->i_log_cluster_size;
> > > > +			fi->i_compress_flag = le16_to_cpu(ri->i_compress_flag);
> > > >    			fi->i_cluster_size = 1 << fi->i_log_cluster_size;
> > > >    			set_inode_flag(inode, FI_COMPRESSED_FILE);
> > > >    		}
> > > > @@ -634,6 +635,8 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
> > > >    					&F2FS_I(inode)->i_compr_blocks));
> > > >    			ri->i_compress_algorithm =
> > > >    				F2FS_I(inode)->i_compress_algorithm;
> > > > +			ri->i_compress_flag =
> > > > +				cpu_to_le16(F2FS_I(inode)->i_compress_flag);
> > > >    			ri->i_log_cluster_size =
> > > >    				F2FS_I(inode)->i_log_cluster_size;
> > > >    		}
> > > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > index 82baaa89c893..f3d919ee4dee 100644
> > > > --- a/fs/f2fs/super.c
> > > > +++ b/fs/f2fs/super.c
> > > > @@ -146,6 +146,7 @@ enum {
> > > >    	Opt_compress_algorithm,
> > > >    	Opt_compress_log_size,
> > > >    	Opt_compress_extension,
> > > > +	Opt_compress_chksum,
> > > >    	Opt_atgc,
> > > >    	Opt_err,
> > > >    };
> > > > @@ -214,6 +215,7 @@ static match_table_t f2fs_tokens = {
> > > >    	{Opt_compress_algorithm, "compress_algorithm=%s"},
> > > >    	{Opt_compress_log_size, "compress_log_size=%u"},
> > > >    	{Opt_compress_extension, "compress_extension=%s"},
> > > > +	{Opt_compress_chksum, "compress_chksum"},
> > > >    	{Opt_atgc, "atgc"},
> > > >    	{Opt_err, NULL},
> > > >    };
> > > > @@ -934,10 +936,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> > > >    			F2FS_OPTION(sbi).compress_ext_cnt++;
> > > >    			kfree(name);
> > > >    			break;
> > > > +		case Opt_compress_chksum:
> > > > +			F2FS_OPTION(sbi).compress_chksum = true;
> > > > +			break;
> > > >    #else
> > > >    		case Opt_compress_algorithm:
> > > >    		case Opt_compress_log_size:
> > > >    		case Opt_compress_extension:
> > > > +		case Opt_compress_chksum:
> > > >    			f2fs_info(sbi, "compression options not supported");
> > > >    			break;
> > > >    #endif
> > > > @@ -1523,6 +1529,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
> > > >    		seq_printf(seq, ",compress_extension=%s",
> > > >    			F2FS_OPTION(sbi).extensions[i]);
> > > >    	}
> > > > +
> > > > +	if (F2FS_OPTION(sbi).compress_chksum)
> > > > +		seq_puts(seq, ",compress_chksum");
> > > >    }
> > > >    static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
> > > > diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> > > > index a5dbb57a687f..7dc2a06cf19a 100644
> > > > --- a/include/linux/f2fs_fs.h
> > > > +++ b/include/linux/f2fs_fs.h
> > > > @@ -273,7 +273,7 @@ struct f2fs_inode {
> > > >    			__le64 i_compr_blocks;	/* # of compressed blocks */
> > > >    			__u8 i_compress_algorithm;	/* compress algorithm */
> > > >    			__u8 i_log_cluster_size;	/* log of cluster size */
> > > > -			__le16 i_padding;		/* padding */
> > > > +			__le16 i_compress_flag;		/* compress flag */
> > > >    			__le32 i_extra_end[0];	/* for attribute size calculation */
> > > >    		} __packed;
> > > >    		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */
> > > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
