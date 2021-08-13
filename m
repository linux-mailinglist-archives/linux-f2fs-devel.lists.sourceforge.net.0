Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6945D3EAE0E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Aug 2021 03:09:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mELgs-00014l-CH; Fri, 13 Aug 2021 01:08:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mELgr-00014e-4z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 01:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GCBDKXG7dt1PAtCuAPp127EcHoTjhxftRhGgiKUKokg=; b=c6/FLFVTeSBkUrWyDWLgg7gZIM
 YgnkhhH6szvYQEf0ypG5Jy53S3K9mm1+kiwv1xRVc+R5LZDe9LuoiMZT+Amhu8GlShcdTHcPS+zE9
 QJe1jh7uSOzD8+lR36vn0R99pZDp9uenSASaQzgvtQu+yuvStZI+alxPT96vH8dV/sNY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GCBDKXG7dt1PAtCuAPp127EcHoTjhxftRhGgiKUKokg=; b=dKowuuGsanDDICokK0yVaSOmfh
 QXwgaF/3msvpqMn6+9qkf8vqls8lRXDYkIx4P20HYw85AbzyjNKX8Xhp7MYWZ7SbB3OYTAllnM1h5
 TnkIL4gE/SzcC0l9XU9nt37xknJj1t27yN03rDmthKMpyI9fatUB+zpGNFWKHN5rzjnQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mELgp-004ho4-AH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 01:08:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DEC960EE5;
 Fri, 13 Aug 2021 01:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628816925;
 bh=cZnNtsiOMmc0YunlGSU9luW8T3Bv8V4gCes8aen3ifY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ELnzOUixwczaEi1gRSz+1oQ0nz66qYjwy+ojdpwNq1n1/kRljnWHW0OMH/UeSiuzk
 UQPVuyshpIceQmmAgubQflRDYx+6lnNpfoLEvckeygqz+pLt5uruNOegJvcN1SwcmJ
 8/AdkdtXMR02REXHmK5QEFJv3AX1dS7XSFXQBUOylI73jp8evNrhHO/wZ+W6i0Rtpu
 zMWxDQqoQO/dKm2nQ/hgDrnbFWL7prESJV8Tyib/yzfFsChHyA6AbdBV/Nl4/NH54u
 Nl2XuyZOypfpwhqioErLrtVVt3Tr6mMZQ9E74rVfvRx+v7QE0IKdTfqdY00zsDwiXj
 YkK12EbVhtkdA==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210806000250.39728-1-chao@kernel.org>
 <YRWJan4JTXHN3RFr@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <f957a9a4-8c59-2df7-147a-1cd5887246e8@kernel.org>
Date: Fri, 13 Aug 2021 09:08:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRWJan4JTXHN3RFr@google.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mELgp-004ho4-AH
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: do sanity check on cluster
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/13 4:49, Jaegeuk Kim wrote:
> On 08/06, Chao Yu wrote:
>> This patch adds f2fs_sanity_check_cluster() to support doing
>> sanity check on cluster of compressed file, it will be triggered
>> from below two paths:
>>
>> - __f2fs_cluster_blocks()
>> - f2fs_map_blocks(F2FS_GET_BLOCK_FIEMAP)
>>
>> And it can detect below three kind of cluster insanity status.
>>
>> C: COMPRESS_ADDR
>> N: NULL_ADDR or NEW_ADDR
>> V: valid blkaddr
>> *: any value
>>
>> 1. [*|C|*|*]
>> 2. [C|*|C|*]
>> 3. [C|N|N|V]
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - cover all map_block cases
>> - give EFSCORRUPTED only when CHECK_FS is enabled for fiemap()
>>   fs/f2fs/compress.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
>>   fs/f2fs/data.c     |  9 ++++++++
>>   fs/f2fs/f2fs.h     |  1 +
>>   3 files changed, 63 insertions(+)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 7dbfd6965b97..f25b32a6893a 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -898,6 +898,54 @@ static bool cluster_has_invalid_data(struct compress_ctx *cc)
>>   	return false;
>>   }
>>   
>> +bool f2fs_sanity_check_cluster(struct dnode_of_data *dn)
>> +{
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
>> +	unsigned int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
>> +	bool compressed = dn->data_blkaddr == COMPRESS_ADDR;
>> +	int cluster_end = 0;
>> +	int i;
>> +	char *reason = "";
>> +
>> +	if (!compressed)
>> +		return false;
>> +
>> +	/* [..., COMPR_ADDR, ...] */
>> +	if (dn->ofs_in_node % cluster_size) {
>> +		reason = "[*|C|*|*]";
>> +		goto out;
>> +	}
>> +
>> +	for (i = 1; i < cluster_size; i++) {
>> +		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
>> +							dn->ofs_in_node + i);
>> +
>> +		/* [COMPR_ADDR, ..., COMPR_ADDR] */
>> +		if (blkaddr == COMPRESS_ADDR) {
>> +			reason = "[C|*|C|*]";
>> +			goto out;
>> +		}
>> +		if (compressed) {
>> +			if (!__is_valid_data_blkaddr(blkaddr)) {
>> +				if (!cluster_end)
>> +					cluster_end = i;
>> +				continue;
>> +			}
>> +			/* [COMPR_ADDR, NULL_ADDR or NEW_ADDR, valid_blkaddr] */
>> +			if (cluster_end) {
>> +				reason = "[C|N|N|V]";
>> +				goto out;
>> +			}
>> +		}
>> +	}
>> +	return false;
>> +out:
>> +	f2fs_warn(sbi, "access invalid cluster, ino:%lu, nid:%u, ofs_in_node:%u, reason:%s",
>> +			dn->inode->i_ino, dn->nid, dn->ofs_in_node, reason);
>> +	set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +	return true;
>> +}
>> +
>>   static int __f2fs_cluster_blocks(struct inode *inode,
>>   				unsigned int cluster_idx, bool compr)
>>   {
>> @@ -915,6 +963,11 @@ static int __f2fs_cluster_blocks(struct inode *inode,
>>   		goto fail;
>>   	}
>>   
>> +	if (f2fs_sanity_check_cluster(&dn)) {
>> +		ret = -EFSCORRUPTED;
>> +		goto fail;
>> +	}
>> +
>>   	if (dn.data_blkaddr == COMPRESS_ADDR) {
>>   		int i;
>>   
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index df5e8d8c654e..d4c9aeba0842 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -1552,6 +1552,15 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>>   			map->m_flags |= F2FS_MAP_NEW;
>>   			blkaddr = dn.data_blkaddr;
>>   		} else {
>> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> 
> I tried to remove ifdef. Please check f2fs/dev branch.

It's fine to me.

Thanks,

> 
>> +			if (f2fs_compressed_file(inode) &&
>> +					f2fs_sanity_check_cluster(&dn) &&
>> +					(flag != F2FS_GET_BLOCK_FIEMAP ||
>> +					IS_ENABLED(CONFIG_F2FS_CHECK_FS))) {
>> +				err = -EFSCORRUPTED;
>> +				goto sync_out;
>> +			}
>> +#endif
>>   			if (flag == F2FS_GET_BLOCK_BMAP) {
>>   				map->m_pblk = 0;
>>   				goto sync_out;
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index e97b4d8c5efc..3b368bcbc4d7 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4074,6 +4074,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
>>   							block_t blkaddr);
>>   bool f2fs_cluster_is_empty(struct compress_ctx *cc);
>>   bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
>> +bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
>>   void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
>>   int f2fs_write_multi_pages(struct compress_ctx *cc,
>>   						int *submitted,
>> -- 
>> 2.22.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
