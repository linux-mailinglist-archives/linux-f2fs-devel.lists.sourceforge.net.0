Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9507C2A3A2B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 03:02:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZleo-000613-E2; Tue, 03 Nov 2020 02:02:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kZlen-00060w-5F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 02:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0TD4/S4aQQAajYWi73B3X2CDpobQkXc4OFQ6amMJzIk=; b=bD8KonVQyBN17NLfpCNpeLdTEA
 cs/vF7CNA2g5jP7tDylEXyisX1Yl1Q9H8jC4jB4eqbHnu2VNRrtQbvcs20iMZAZQoAuFgeQQ/+nPY
 2r+383LcWoCkFBNIrkRHlcsTLi/pHC/8u8X/fe33mrrZ4PdyZ+pl0yq5i8cuE4k2rBCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0TD4/S4aQQAajYWi73B3X2CDpobQkXc4OFQ6amMJzIk=; b=FWHfDGtGdMVJdZKdD+WVVFnqKp
 UOBJn8Fv8otMKb8TFGVaKhw7sShYCQIxJMl4VJ+/Dol7WY7K4PkbGNMS8O5b/RtevAKGD220hqFvH
 hpGRxg8KYMps3GuQgTkZS/QbHt/PSzlH643OQeO8C3ikXRCn6gX/c4yn7vLJGqqhJu/Q=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZlef-00H1jS-P6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 02:02:45 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQChw1pVFzhfy2;
 Tue,  3 Nov 2020 10:02:24 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 3 Nov 2020
 10:02:23 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20201102122333.76667-1-yuchao0@huawei.com>
 <20201102163123.GD529594@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <756e482c-b638-1c09-3868-ae45d33ed2c2@huawei.com>
Date: Tue, 3 Nov 2020 10:02:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201102163123.GD529594@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kZlef-00H1jS-P6
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: support chksum
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/3 0:31, Jaegeuk Kim wrote:
> On 11/02, Chao Yu wrote:
>> This patch supports to store chksum value with compressed
>> data, and verify the integrality of compressed data while
>> reading the data.
>>
>> The feature can be enabled through specifying mount option
>> 'compress_chksum'.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   Documentation/filesystems/f2fs.rst |  1 +
>>   fs/f2fs/compress.c                 | 20 ++++++++++++++++++++
>>   fs/f2fs/f2fs.h                     | 13 ++++++++++++-
>>   fs/f2fs/inode.c                    |  3 +++
>>   fs/f2fs/super.c                    |  9 +++++++++
>>   include/linux/f2fs_fs.h            |  2 +-
>>   6 files changed, 46 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
>> index b8ee761c9922..985ae7d35066 100644
>> --- a/Documentation/filesystems/f2fs.rst
>> +++ b/Documentation/filesystems/f2fs.rst
>> @@ -260,6 +260,7 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
>>   			 For other files, we can still enable compression via ioctl.
>>   			 Note that, there is one reserved special extension '*', it
>>   			 can be set to enable compression for all files.
>> +compress_chksum		 Support verifying chksum of raw data in compressed cluster.
>>   inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
>>   			 files using the blk-crypto framework rather than
>>   			 filesystem-layer encryption. This allows the use of
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 14262e0f1cd6..a4e0d2c745b6 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -602,6 +602,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>>   				f2fs_cops[fi->i_compress_algorithm];
>>   	unsigned int max_len, new_nr_cpages;
>>   	struct page **new_cpages;
>> +	u32 chksum = 0;
>>   	int i, ret;
>>   
>>   	trace_f2fs_compress_pages_start(cc->inode, cc->cluster_idx,
>> @@ -655,6 +656,11 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>>   
>>   	cc->cbuf->clen = cpu_to_le32(cc->clen);
>>   
>> +	if (fi->i_compress_flag & 1 << COMPRESS_CHKSUM)
>> +		chksum = f2fs_crc32(F2FS_I_SB(cc->inode),
>> +					cc->cbuf->cdata, cc->clen);
>> +	cc->cbuf->chksum = cpu_to_le32(chksum);
>> +
>>   	for (i = 0; i < COMPRESS_DATA_RESERVED_SIZE; i++)
>>   		cc->cbuf->reserved[i] = cpu_to_le32(0);
>>   
>> @@ -721,6 +727,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
>>   			(struct decompress_io_ctx *)page_private(page);
>>   	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
>>   	struct f2fs_inode_info *fi= F2FS_I(dic->inode);
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
>>   	const struct f2fs_compress_ops *cops =
>>   			f2fs_cops[fi->i_compress_algorithm];
>>   	int ret;
>> @@ -790,6 +797,19 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
>>   
>>   	ret = cops->decompress_pages(dic);
>>   
>> +	if (!ret && fi->i_compress_flag & 1 << COMPRESS_CHKSUM) {
>> +		u32 provided = le32_to_cpu(dic->cbuf->chksum);
>> +		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
>> +
>> +		if (provided != calculated) {
>> +			printk_ratelimited(
>> +				"%sF2FS-fs (%s): checksum invalid, nid = %lu, %x vs %x",
>> +				KERN_INFO, sbi->sb->s_id, dic->inode->i_ino,
>> +				provided, calculated);
>> +			ret = -EFSCORRUPTED;
> 
> Do we need to change fsck.f2fs to recover this?

Yes, prepared to update inode layout in fsck.f2fs w/ kernel side change.

Thanks,

> 
>> +		}
>> +	}
>> +
>>   out_vunmap_cbuf:
>>   	vm_unmap_ram(dic->cbuf, dic->nr_cpages);
>>   out_vunmap_rbuf:
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 99bcf4b44a9c..2ae254ab7b7d 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -147,7 +147,8 @@ struct f2fs_mount_info {
>>   
>>   	/* For compression */
>>   	unsigned char compress_algorithm;	/* algorithm type */
>> -	unsigned compress_log_size;		/* cluster log size */
>> +	unsigned char compress_log_size;	/* cluster log size */
>> +	bool compress_chksum;			/* compressed data chksum */
>>   	unsigned char compress_ext_cnt;		/* extension count */
>>   	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
>>   };
>> @@ -731,6 +732,7 @@ struct f2fs_inode_info {
>>   	atomic_t i_compr_blocks;		/* # of compressed blocks */
>>   	unsigned char i_compress_algorithm;	/* algorithm type */
>>   	unsigned char i_log_cluster_size;	/* log of cluster size */
>> +	unsigned short i_compress_flag;		/* compress flag */
>>   	unsigned int i_cluster_size;		/* cluster size */
>>   };
>>   
>> @@ -1270,9 +1272,15 @@ enum compress_algorithm_type {
>>   	COMPRESS_MAX,
>>   };
>>   
>> +enum compress_flag {
>> +	COMPRESS_CHKSUM,
>> +	COMPRESS_MAX_FLAG,
>> +};
>> +
>>   #define COMPRESS_DATA_RESERVED_SIZE		5
>>   struct compress_data {
>>   	__le32 clen;			/* compressed data size */
>> +	__le32 chksum;			/* compressed data chksum */
>>   	__le32 reserved[COMPRESS_DATA_RESERVED_SIZE];	/* reserved */
>>   	u8 cdata[];			/* compressed data */
>>   };
>> @@ -3882,6 +3890,9 @@ static inline void set_compress_context(struct inode *inode)
>>   			F2FS_OPTION(sbi).compress_algorithm;
>>   	F2FS_I(inode)->i_log_cluster_size =
>>   			F2FS_OPTION(sbi).compress_log_size;
>> +	F2FS_I(inode)->i_compress_flag =
>> +			F2FS_OPTION(sbi).compress_chksum ?
>> +				1 << COMPRESS_CHKSUM : 0;
>>   	F2FS_I(inode)->i_cluster_size =
>>   			1 << F2FS_I(inode)->i_log_cluster_size;
>>   	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index 657db2fb6739..de8f7fc89efa 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -456,6 +456,7 @@ static int do_read_inode(struct inode *inode)
>>   					le64_to_cpu(ri->i_compr_blocks));
>>   			fi->i_compress_algorithm = ri->i_compress_algorithm;
>>   			fi->i_log_cluster_size = ri->i_log_cluster_size;
>> +			fi->i_compress_flag = ri->i_compress_flag;
>>   			fi->i_cluster_size = 1 << fi->i_log_cluster_size;
>>   			set_inode_flag(inode, FI_COMPRESSED_FILE);
>>   		}
>> @@ -634,6 +635,8 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
>>   					&F2FS_I(inode)->i_compr_blocks));
>>   			ri->i_compress_algorithm =
>>   				F2FS_I(inode)->i_compress_algorithm;
>> +			ri->i_compress_flag =
>> +				cpu_to_le16(F2FS_I(inode)->i_compress_flag);
>>   			ri->i_log_cluster_size =
>>   				F2FS_I(inode)->i_log_cluster_size;
>>   		}
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 00eff2f51807..f8de4d83a5be 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -146,6 +146,7 @@ enum {
>>   	Opt_compress_algorithm,
>>   	Opt_compress_log_size,
>>   	Opt_compress_extension,
>> +	Opt_compress_chksum,
>>   	Opt_atgc,
>>   	Opt_err,
>>   };
>> @@ -214,6 +215,7 @@ static match_table_t f2fs_tokens = {
>>   	{Opt_compress_algorithm, "compress_algorithm=%s"},
>>   	{Opt_compress_log_size, "compress_log_size=%u"},
>>   	{Opt_compress_extension, "compress_extension=%s"},
>> +	{Opt_compress_chksum, "compress_chksum"},
>>   	{Opt_atgc, "atgc"},
>>   	{Opt_err, NULL},
>>   };
>> @@ -934,10 +936,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>   			F2FS_OPTION(sbi).compress_ext_cnt++;
>>   			kfree(name);
>>   			break;
>> +		case Opt_compress_chksum:
>> +			F2FS_OPTION(sbi).compress_chksum = true;
>> +			break;
>>   #else
>>   		case Opt_compress_algorithm:
>>   		case Opt_compress_log_size:
>>   		case Opt_compress_extension:
>> +		case Opt_compress_chksum:
>>   			f2fs_info(sbi, "compression options not supported");
>>   			break;
>>   #endif
>> @@ -1523,6 +1529,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
>>   		seq_printf(seq, ",compress_extension=%s",
>>   			F2FS_OPTION(sbi).extensions[i]);
>>   	}
>> +
>> +	if (F2FS_OPTION(sbi).compress_chksum)
>> +		seq_puts(seq, ",compress_chksum");
>>   }
>>   
>>   static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
>> index a5dbb57a687f..7dc2a06cf19a 100644
>> --- a/include/linux/f2fs_fs.h
>> +++ b/include/linux/f2fs_fs.h
>> @@ -273,7 +273,7 @@ struct f2fs_inode {
>>   			__le64 i_compr_blocks;	/* # of compressed blocks */
>>   			__u8 i_compress_algorithm;	/* compress algorithm */
>>   			__u8 i_log_cluster_size;	/* log of cluster size */
>> -			__le16 i_padding;		/* padding */
>> +			__le16 i_compress_flag;		/* compress flag */
>>   			__le32 i_extra_end[0];	/* for attribute size calculation */
>>   		} __packed;
>>   		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */
>> -- 
>> 2.26.2
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
