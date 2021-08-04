Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E183DF900
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Aug 2021 02:48:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mB55N-0003mj-Dd; Wed, 04 Aug 2021 00:48:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mB55C-0003mO-Od
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 00:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g9TjeiQXIBw7RTQTiCXmLORHp3aACk7nwUPLxqGFffw=; b=DsxUI9+oovMAZBmp17UsfK1mHN
 Yl9Jmpgf39/b9HyVq5q8RP63eaz8EwJ3ZFW9B/b1QeZv5DJpA9eUE9RaJipb1rdf6M/2peGa7GjWg
 hq/FmY9DmT1JPJk7tNfDJV8A/el2KZGFldmtaLxXUos+XuL6b9xBI8mblU5CVYpNoxDo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g9TjeiQXIBw7RTQTiCXmLORHp3aACk7nwUPLxqGFffw=; b=E46M+9Y1aQZXQ47Z3QuBQLdOcL
 Moqk598pNYZKgL5V5xYyVdWZXEKGEtwuqDB5G5UgUqsil+QIvNuNQiq8rLg93xz2jEBCjtGKhdo0g
 B4oFJ97r95omKSyoZkWVp6Sb04bxzhFZFdtI9Xe3ZsHTM13j7lX6TkUneR225xminK9Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mB556-0004T2-KK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 00:48:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E3D760E96;
 Wed,  4 Aug 2021 00:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628038099;
 bh=qryCkmtCCzYl6IUItcfTqmNU85mlOle7WLkyevLkkQU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YMFSrp0pxERpVxJIsi0mP6fod+3AAVF++IhN3kwTwoCMAsv2Pvj4UVUxePV71Ko8Y
 kWL+HnKGEdlYG604a0kKO71fwRmuVBMYIH+BGwl8rh0CHS03p3k9xcFhn/gZ30zzM2
 W/OODDvO+BE4pNSjCmQIGYQEhFBwPuVV8v7NwQdyplnrnGhsKkVmjB3u1StMyeMqpu
 g+6pgaFEmZBHaVOFQDv5xEdIRpUdfJ0wq79dYAfz6Ldwi1/fGCiZvRbZnhobzYqpCL
 mSPMT7pI0OuBkyiYSjgBtitQWC6fSviW15INdf5iq9k83eywYiKcXCzCFffkVWST8C
 emqfm6KNt7MgQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210803103952.737222-1-chao@kernel.org>
 <YQmKQVxQwJL2GU09@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <275b4ec7-d7fd-b169-ff43-3ceec37b47b9@kernel.org>
Date: Wed, 4 Aug 2021 08:48:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQmKQVxQwJL2GU09@google.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mB556-0004T2-KK
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: do sanity check on cluster
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

On 2021/8/4 2:26, Jaegeuk Kim wrote:
> On 08/03, Chao Yu wrote:
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
>>   fs/f2fs/compress.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
>>   fs/f2fs/data.c     | 21 ++++++++++++------
>>   fs/f2fs/f2fs.h     |  1 +
>>   3 files changed, 68 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 455561826c7d..4aa166d3d9bf 100644
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
>> index 948083c88d17..75dda2035f68 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -1558,13 +1558,20 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>>   			}
>>   			if (flag == F2FS_GET_BLOCK_PRECACHE)
>>   				goto sync_out;
>> -			if (flag == F2FS_GET_BLOCK_FIEMAP &&
>> -						blkaddr == NULL_ADDR) {
>> -				if (map->m_next_pgofs)
>> -					*map->m_next_pgofs = pgofs + 1;
>> -				goto sync_out;
>> -			}
>> -			if (flag != F2FS_GET_BLOCK_FIEMAP) {
>> +			if (flag == ) {
>> +				if (blkaddr == NULL_ADDR) {
>> +					if (map->m_next_pgofs)
>> +						*map->m_next_pgofs = pgofs + 1;
>> +					goto sync_out;
>> +				}
>> +#ifdef CONFIG_F2FS_FS_COMPRESSION
>> +				if (f2fs_compressed_file(inode) &&
>> +					f2fs_sanity_check_cluster(&dn)) {
>> +					err = -EFSCORRUPTED;
> 
> I prefer to give the block map as is instead of giving an error, since this\

It looks the policy is not consistent with the one we did in
f2fs_is_valid_blkaddr().

> takes away to debug the problem from user-land.

We can debug through "dump.f2fs -i" command? also once f2fs_sanity_check_cluster()
fails, it will print kernel message for further debuging.

Thanks,

> 
>> +					goto sync_out;
>> +				}
>> +#endif
>> +			} else {
>>   				/* for defragment case */
>>   				if (map->m_next_pgofs)
>>   					*map->m_next_pgofs = pgofs + 1;
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 20389b9b3eac..86d416ffad61 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4060,6 +4060,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
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
