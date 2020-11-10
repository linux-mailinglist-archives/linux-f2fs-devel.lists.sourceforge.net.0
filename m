Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3F22ACE87
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 05:24:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcLCd-0007cj-E2; Tue, 10 Nov 2020 04:24:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kcLCY-0007c8-Jh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 04:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I+QLNpL9K6sa/fdDrx/wIxuuZSkUARyeFxrzGaucddE=; b=TyfT2BAk8tavAJ3323x1iCxCzy
 uyHHVPFm/AhyJO+vipPV4I8ojGgh9GBJOfid0MF2+cnA5h0F1kw0BKSD+B8RiaudYT5JJ6JjhlHeb
 a7PmED2aYEcml2ck1drD72VdSVQPQg07Sek8CyPNd2h1eIxnkRExqOH9P6bUNgTbBpCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I+QLNpL9K6sa/fdDrx/wIxuuZSkUARyeFxrzGaucddE=; b=lmk66CQ2zul3wF/avXq3QIMXs7
 Vx9JrUpVo5rwJal45Pcshj+ur3mrAhgE9h4rB1hTlxPs7G6Iyf0T8VosrR5NbzZ35iRTjO2KtxN8U
 sq244+EMfL9eWK77cX2kXeF0hr7AQeyLTnZGJehZ2Vt3bFAa+yT7ScHeulC+UO17ZlyU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcLCL-006L4S-2q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 04:24:14 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6885E2068D;
 Tue, 10 Nov 2020 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604982235;
 bh=glio37ldLzoa1aZIW4luE98uGWUJz3opTtSALzng72Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UyXBvaV+x/wyv5JrhJ2oEWVSHVgZtJaoI59l8kdZx4ghgBcqgHGREafO2WLBKT4G6
 cDrLXKJgfMr38FwB9ooxkvjOxF4pNmz6n/Nr51rLfKfJ6eGFC9P/c2cVidIk7ZGY3l
 RbAe0IKslWNKS+gUtI8CI5Rc1yIVGtdY8Bqb3jQU=
Date: Mon, 9 Nov 2020 20:23:53 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201110042353.GB1598246@google.com>
References: <20201102122333.76667-1-yuchao0@huawei.com>
 <20201102163123.GD529594@google.com>
 <756e482c-b638-1c09-3868-ae45d33ed2c2@huawei.com>
 <6b5bce0e-c967-b9cf-3544-a8e65595059c@huawei.com>
 <20201106211247.GA1474936@google.com>
 <908682bb-486c-222f-bea7-43fc961ef1b0@huawei.com>
 <20201109170625.GB2129970@google.com>
 <3417aea5-ace8-74be-ec26-f491dddea676@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3417aea5-ace8-74be-ec26-f491dddea676@huawei.com>
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
X-Headers-End: 1kcLCL-006L4S-2q
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/10, Chao Yu wrote:
> On 2020/11/10 1:06, Jaegeuk Kim wrote:
> > On 11/09, Chao Yu wrote:
> > > On 2020/11/7 5:12, Jaegeuk Kim wrote:
> > > > On 11/03, Chao Yu wrote:
> > > > > On 2020/11/3 10:02, Chao Yu wrote:
> > > > > > On 2020/11/3 0:31, Jaegeuk Kim wrote:
> > > > > > > On 11/02, Chao Yu wrote:
> > > > > > > > This patch supports to store chksum value with compressed
> > > > > > > > data, and verify the integrality of compressed data while
> > > > > > > > reading the data.
> > > > > > > > 
> > > > > > > > The feature can be enabled through specifying mount option
> > > > > > > > 'compress_chksum'.
> > > > > > > > 
> > > > > > > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > > > > > > ---
> > > > > > > >      Documentation/filesystems/f2fs.rst |  1 +
> > > > > > > >      fs/f2fs/compress.c                 | 20 ++++++++++++++++++++
> > > > > > > >      fs/f2fs/f2fs.h                     | 13 ++++++++++++-
> > > > > > > >      fs/f2fs/inode.c                    |  3 +++
> > > > > > > >      fs/f2fs/super.c                    |  9 +++++++++
> > > > > > > >      include/linux/f2fs_fs.h            |  2 +-
> > > > > > > >      6 files changed, 46 insertions(+), 2 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> > > > > > > > index b8ee761c9922..985ae7d35066 100644
> > > > > > > > --- a/Documentation/filesystems/f2fs.rst
> > > > > > > > +++ b/Documentation/filesystems/f2fs.rst
> > > > > > > > @@ -260,6 +260,7 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
> > > > > > > >      			 For other files, we can still enable compression via ioctl.
> > > > > > > >      			 Note that, there is one reserved special extension '*', it
> > > > > > > >      			 can be set to enable compression for all files.
> > > > > > > > +compress_chksum		 Support verifying chksum of raw data in compressed cluster.
> > > > > > > >      inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
> > > > > > > >      			 files using the blk-crypto framework rather than
> > > > > > > >      			 filesystem-layer encryption. This allows the use of
> > > > > > > > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > > > > > > > index 14262e0f1cd6..a4e0d2c745b6 100644
> > > > > > > > --- a/fs/f2fs/compress.c
> > > > > > > > +++ b/fs/f2fs/compress.c
> > > > > > > > @@ -602,6 +602,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
> > > > > > > >      				f2fs_cops[fi->i_compress_algorithm];
> > > > > > > >      	unsigned int max_len, new_nr_cpages;
> > > > > > > >      	struct page **new_cpages;
> > > > > > > > +	u32 chksum = 0;
> > > > > > > >      	int i, ret;
> > > > > > > >      	trace_f2fs_compress_pages_start(cc->inode, cc->cluster_idx,
> > > > > > > > @@ -655,6 +656,11 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
> > > > > > > >      	cc->cbuf->clen = cpu_to_le32(cc->clen);
> > > > > > > > +	if (fi->i_compress_flag & 1 << COMPRESS_CHKSUM)
> > > > > > > > +		chksum = f2fs_crc32(F2FS_I_SB(cc->inode),
> > > > > > > > +					cc->cbuf->cdata, cc->clen);
> > > > > > > > +	cc->cbuf->chksum = cpu_to_le32(chksum);
> > > > > > > > +
> > > > > > > >      	for (i = 0; i < COMPRESS_DATA_RESERVED_SIZE; i++)
> > > > > > > >      		cc->cbuf->reserved[i] = cpu_to_le32(0);
> > > > > > > > @@ -721,6 +727,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
> > > > > > > >      			(struct decompress_io_ctx *)page_private(page);
> > > > > > > >      	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
> > > > > > > >      	struct f2fs_inode_info *fi= F2FS_I(dic->inode);
> > > > > > > > +	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
> > > > > > > >      	const struct f2fs_compress_ops *cops =
> > > > > > > >      			f2fs_cops[fi->i_compress_algorithm];
> > > > > > > >      	int ret;
> > > > > > > > @@ -790,6 +797,19 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
> > > > > > > >      	ret = cops->decompress_pages(dic);
> > > > > > > > +	if (!ret && fi->i_compress_flag & 1 << COMPRESS_CHKSUM) {
> > > > > > > > +		u32 provided = le32_to_cpu(dic->cbuf->chksum);
> > > > > > > > +		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
> > > > > > > > +
> > > > > > > > +		if (provided != calculated) {
> > > > > > > > +			printk_ratelimited(
> > > > > > > > +				"%sF2FS-fs (%s): checksum invalid, nid = %lu, %x vs %x",
> > > > > > > > +				KERN_INFO, sbi->sb->s_id, dic->inode->i_ino,
> > > > > > > > +				provided, calculated);
> > > > > > > > +			ret = -EFSCORRUPTED;
> > > > > > > 
> > > > > > > Do we need to change fsck.f2fs to recover this?
> > > > > 
> > > > > However, we don't know which one is correct, compressed data or chksum value?
> > > > > if compressed data was corrupted, repairing chksum value doesn't help.
> > > > > 
> > > > > Or how about adding chksum values for both raw data and compressed data.
> > > > > 
> > > > > #define COMPRESS_DATA_RESERVED_SIZE	3
> > > > > struct compress_data {
> > > > > 	__le32 clen;			/* compressed data size */
> > > > > +	__le32 raw_chksum;		/* raw data chksum */
> > > > > +	__le32 compress_chksum;		/* compressed data chksum */
> > > > > 	__le32 reserved[COMPRESS_DATA_RESERVED_SIZE];	/* reserved */
> > > > > 	u8 cdata[];			/* compressed data */
> > > > > };
> > > > > 
> > > > > 	raw_chksum	compress_chksum
> > > > > 	match		match			-> data is verified, pass
> > > > > 	not match	match			-> repair raw_chksum
> > > > > 	matcth		not match		-> repair compress_chksum
> > > > 
> > > > I think only compress_chksum would be enough. BTW, can we give WARN_ON and
> > > > marking a FSCK flag without returning EFSCORRUPTED, since we don't really
> > > > know who was corrupted. If data was corrupted, we should be able to see app
> > > > corruption. In that case, we can check the kernel log. If checksum was simply
> > > 
> > > I don't think that app will always corrupt once data was corrupted, I doubt its
> > > behavior could be slightly abnormal in some cases, e.g. it can just cause apps to
> > > show wrong number in interaction interface.
> > 
> > I didn't say we can always get it. But, it's likely to happen with something
> > like that.
> > 
> > > 
> > > In this case, if we fix chksum in fsck, the wrong data will never be found due to
> > > data's chksum matches data itself after repair.
> > 
> > At least, we should see that log as a hint.
> > 
> > > 
> > > IMO, the chksum and data was a whole dataset, once they are mismatch, we can
> > > not trust either of them, fsck should do nothing on them unless we store parity
> > > bits or replica.
> > 
> > Yeah, the point is those are not written as a transaction. Three concerns to me:
> 
> Just to confirm:
> 
> > 1) agreed to see compressed data corruption by checksum
> 
> return EFSBADCRC always like we did as inode chksum feature.

inode chksum is a bit different, since 4KB write is atomic. If chksum is
corrupted, inode should be broken.

> 
> 2) I don't want to see the error messages all the time
> 
> Something like below?
> 
> if (provided != calculated) {
> 	if (!is_inode_flag_set(,FI_DATA_CORRUPTED)) {
> 		printk_ratelimited();
> 		WARN_ON()
> 		set_inode_flag(, FI_DATA_CORRUPTED);
> 	}
> 	return EFSBADCRC;

No, what if only checksum was wrong? I mean giving WARN_ON() and setting
FSCK_FLAG to stop endless WARN_ON().

> }
> 
> 3) don't touch the data, even if it was corrupted, since there's no way to fix it.
> 
> It seems that we don't need to change fsck.f2fs finally...
> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > corrupted, next fsck will fix the checksum. So, in general, I hope to keep
> > > > the data as is and raise a flag by the checksum.
> > > > 
> > > > > 	not match	not match		-> corrupted, can not repair
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > > 
> > > > > > Yes, prepared to update inode layout in fsck.f2fs w/ kernel side change. >
> > > > > > Thanks,
> > > > > > 
> > > > > > > 
> > > > > > > > +		}
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > >      out_vunmap_cbuf:
> > > > > > > >      	vm_unmap_ram(dic->cbuf, dic->nr_cpages);
> > > > > > > >      out_vunmap_rbuf:
> > > > > > > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > > > > > index 99bcf4b44a9c..2ae254ab7b7d 100644
> > > > > > > > --- a/fs/f2fs/f2fs.h
> > > > > > > > +++ b/fs/f2fs/f2fs.h
> > > > > > > > @@ -147,7 +147,8 @@ struct f2fs_mount_info {
> > > > > > > >      	/* For compression */
> > > > > > > >      	unsigned char compress_algorithm;	/* algorithm type */
> > > > > > > > -	unsigned compress_log_size;		/* cluster log size */
> > > > > > > > +	unsigned char compress_log_size;	/* cluster log size */
> > > > > > > > +	bool compress_chksum;			/* compressed data chksum */
> > > > > > > >      	unsigned char compress_ext_cnt;		/* extension count */
> > > > > > > >      	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
> > > > > > > >      };
> > > > > > > > @@ -731,6 +732,7 @@ struct f2fs_inode_info {
> > > > > > > >      	atomic_t i_compr_blocks;		/* # of compressed blocks */
> > > > > > > >      	unsigned char i_compress_algorithm;	/* algorithm type */
> > > > > > > >      	unsigned char i_log_cluster_size;	/* log of cluster size */
> > > > > > > > +	unsigned short i_compress_flag;		/* compress flag */
> > > > > > > >      	unsigned int i_cluster_size;		/* cluster size */
> > > > > > > >      };
> > > > > > > > @@ -1270,9 +1272,15 @@ enum compress_algorithm_type {
> > > > > > > >      	COMPRESS_MAX,
> > > > > > > >      };
> > > > > > > > +enum compress_flag {
> > > > > > > > +	COMPRESS_CHKSUM,
> > > > > > > > +	COMPRESS_MAX_FLAG,
> > > > > > > > +};
> > > > > > > > +
> > > > > > > >      #define COMPRESS_DATA_RESERVED_SIZE		5
> > > > > > > >      struct compress_data {
> > > > > > > >      	__le32 clen;			/* compressed data size */
> > > > > > > > +	__le32 chksum;			/* compressed data chksum */
> > > > > > > >      	__le32 reserved[COMPRESS_DATA_RESERVED_SIZE];	/* reserved */
> > > > > > > >      	u8 cdata[];			/* compressed data */
> > > > > > > >      };
> > > > > > > > @@ -3882,6 +3890,9 @@ static inline void set_compress_context(struct inode *inode)
> > > > > > > >      			F2FS_OPTION(sbi).compress_algorithm;
> > > > > > > >      	F2FS_I(inode)->i_log_cluster_size =
> > > > > > > >      			F2FS_OPTION(sbi).compress_log_size;
> > > > > > > > +	F2FS_I(inode)->i_compress_flag =
> > > > > > > > +			F2FS_OPTION(sbi).compress_chksum ?
> > > > > > > > +				1 << COMPRESS_CHKSUM : 0;
> > > > > > > >      	F2FS_I(inode)->i_cluster_size =
> > > > > > > >      			1 << F2FS_I(inode)->i_log_cluster_size;
> > > > > > > >      	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
> > > > > > > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > > > > > > index 657db2fb6739..de8f7fc89efa 100644
> > > > > > > > --- a/fs/f2fs/inode.c
> > > > > > > > +++ b/fs/f2fs/inode.c
> > > > > > > > @@ -456,6 +456,7 @@ static int do_read_inode(struct inode *inode)
> > > > > > > >      					le64_to_cpu(ri->i_compr_blocks));
> > > > > > > >      			fi->i_compress_algorithm = ri->i_compress_algorithm;
> > > > > > > >      			fi->i_log_cluster_size = ri->i_log_cluster_size;
> > > > > > > > +			fi->i_compress_flag = ri->i_compress_flag;
> > > > > > > >      			fi->i_cluster_size = 1 << fi->i_log_cluster_size;
> > > > > > > >      			set_inode_flag(inode, FI_COMPRESSED_FILE);
> > > > > > > >      		}
> > > > > > > > @@ -634,6 +635,8 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
> > > > > > > >      					&F2FS_I(inode)->i_compr_blocks));
> > > > > > > >      			ri->i_compress_algorithm =
> > > > > > > >      				F2FS_I(inode)->i_compress_algorithm;
> > > > > > > > +			ri->i_compress_flag =
> > > > > > > > +				cpu_to_le16(F2FS_I(inode)->i_compress_flag);
> > > > > > > >      			ri->i_log_cluster_size =
> > > > > > > >      				F2FS_I(inode)->i_log_cluster_size;
> > > > > > > >      		}
> > > > > > > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > > > > > index 00eff2f51807..f8de4d83a5be 100644
> > > > > > > > --- a/fs/f2fs/super.c
> > > > > > > > +++ b/fs/f2fs/super.c
> > > > > > > > @@ -146,6 +146,7 @@ enum {
> > > > > > > >      	Opt_compress_algorithm,
> > > > > > > >      	Opt_compress_log_size,
> > > > > > > >      	Opt_compress_extension,
> > > > > > > > +	Opt_compress_chksum,
> > > > > > > >      	Opt_atgc,
> > > > > > > >      	Opt_err,
> > > > > > > >      };
> > > > > > > > @@ -214,6 +215,7 @@ static match_table_t f2fs_tokens = {
> > > > > > > >      	{Opt_compress_algorithm, "compress_algorithm=%s"},
> > > > > > > >      	{Opt_compress_log_size, "compress_log_size=%u"},
> > > > > > > >      	{Opt_compress_extension, "compress_extension=%s"},
> > > > > > > > +	{Opt_compress_chksum, "compress_chksum"},
> > > > > > > >      	{Opt_atgc, "atgc"},
> > > > > > > >      	{Opt_err, NULL},
> > > > > > > >      };
> > > > > > > > @@ -934,10 +936,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> > > > > > > >      			F2FS_OPTION(sbi).compress_ext_cnt++;
> > > > > > > >      			kfree(name);
> > > > > > > >      			break;
> > > > > > > > +		case Opt_compress_chksum:
> > > > > > > > +			F2FS_OPTION(sbi).compress_chksum = true;
> > > > > > > > +			break;
> > > > > > > >      #else
> > > > > > > >      		case Opt_compress_algorithm:
> > > > > > > >      		case Opt_compress_log_size:
> > > > > > > >      		case Opt_compress_extension:
> > > > > > > > +		case Opt_compress_chksum:
> > > > > > > >      			f2fs_info(sbi, "compression options not supported");
> > > > > > > >      			break;
> > > > > > > >      #endif
> > > > > > > > @@ -1523,6 +1529,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
> > > > > > > >      		seq_printf(seq, ",compress_extension=%s",
> > > > > > > >      			F2FS_OPTION(sbi).extensions[i]);
> > > > > > > >      	}
> > > > > > > > +
> > > > > > > > +	if (F2FS_OPTION(sbi).compress_chksum)
> > > > > > > > +		seq_puts(seq, ",compress_chksum");
> > > > > > > >      }
> > > > > > > >      static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
> > > > > > > > diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> > > > > > > > index a5dbb57a687f..7dc2a06cf19a 100644
> > > > > > > > --- a/include/linux/f2fs_fs.h
> > > > > > > > +++ b/include/linux/f2fs_fs.h
> > > > > > > > @@ -273,7 +273,7 @@ struct f2fs_inode {
> > > > > > > >      			__le64 i_compr_blocks;	/* # of compressed blocks */
> > > > > > > >      			__u8 i_compress_algorithm;	/* compress algorithm */
> > > > > > > >      			__u8 i_log_cluster_size;	/* log of cluster size */
> > > > > > > > -			__le16 i_padding;		/* padding */
> > > > > > > > +			__le16 i_compress_flag;		/* compress flag */
> > > > > > > >      			__le32 i_extra_end[0];	/* for attribute size calculation */
> > > > > > > >      		} __packed;
> > > > > > > >      		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */
> > > > > > > > -- 
> > > > > > > > 2.26.2
> > > > > > > .
> > > > > > > 
> > > > > > 
> > > > > > 
> > > > > > _______________________________________________
> > > > > > Linux-f2fs-devel mailing list
> > > > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > > > > > .
> > > > > > 
> > > > .
> > > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
