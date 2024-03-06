Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4E872C82
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 03:02:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhgc4-0001La-TE;
	Wed, 06 Mar 2024 02:02:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rhgc2-0001LT-Qi
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 02:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cNGfJ5he+9xZj1KEapC1Sz/t08SeAozowW9tVr2gfYQ=; b=XjrIuvUAlcfgg2SRWkC28aSnIS
 bQmOFt8sDAv9GcRtsf40ARXViYysv6ThzcHeBnRlhu6SzXtVONtyO4Yl80aVd10Gf/nGXl66Ph7W0
 ApOMq70AbZc/IpcI+GawQjzS2P5v6E8nbFtvsSzrFeld4C2K8RvBjYuGuZEOidTiYzLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cNGfJ5he+9xZj1KEapC1Sz/t08SeAozowW9tVr2gfYQ=; b=fXWHjtuU9O8Wk486iuSuLIafkP
 +pegxZVy3G1i2RgBBbj7V/dVxbN8E2lfaRAyeTeOv/IoKpBICIRPdKmkxm8lmJuYJe6bMXahyn4H8
 M/25nmOVALPcUTH5zeFY1qcRIMXyvaYSNnetjUmWwO+e2uZAgpQJ23J6nF0vwrcO8FZk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhgbr-0006MY-U3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 02:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 51C54CE1E57;
 Wed,  6 Mar 2024 02:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D2AC43330;
 Wed,  6 Mar 2024 02:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709690533;
 bh=SqTqs8brnRlrOZ5UQ84OFtXIsP8I8DaSL4YqK61FhFc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eUfvk2ar4wNc3wSGfsc6XVaxtcbMnX30g4OKHea/TZ1iPjUum/UDOrmkvPECKTXjZ
 QtPl2A4SPSZCnpXx2WhY396QXfCy/dYB9AELjdhcI2WzhGcGjc5lzmLQwc/RItKOEj
 JcHIzffzcr1rRPy4cwRosQ1qRvLAVZmWr0OaCK9alQWUSF/OKS4hcGNVrVGye0T0xg
 sNa6cP4N0dJohnStgTkb7QkKiRUBeolVbOoL2Te0vRUtFucXVB+WYpt3x0AjgQ/H3D
 xRkzY7wdjeupc6wC3SnS5PkHJwm9cCGTZZkKcJ8nfzXmep9av9/A1yYnNDb+nuw51Q
 iklqA+dxA1INg==
Message-ID: <f4bc07b0-a32b-4074-a66e-9388cb1b4461@kernel.org>
Date: Wed, 6 Mar 2024 10:02:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xiuhong Wang <xiuhong.wang@unisoc.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20240305084023.3686070-1-xiuhong.wang@unisoc.com>
 <20240305084023.3686070-2-xiuhong.wang@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240305084023.3686070-2-xiuhong.wang@unisoc.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/5 16:40, Xiuhong Wang wrote: > When a file only
 needs one direct_node, performing the following > operations will cause the
 file to be unrepairable: > > unisoc # ./f2fs_io compress test.apk [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhgbr-0006MY-U3
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: compress: fix reserve_cblocks
 counting error when out of space
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hongyu.jin.cn@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/5 16:40, Xiuhong Wang wrote:
> When a file only needs one direct_node, performing the following
> operations will cause the file to be unrepairable:
> 
> unisoc # ./f2fs_io compress test.apk
> unisoc #df -h | grep dm-48
> /dev/block/dm-48 112G 112G 1.2M 100% /data
> 
> unisoc # ./f2fs_io release_cblocks test.apk
> 924
> unisoc # df -h | grep dm-48
> /dev/block/dm-48 112G 112G 4.8M 100% /data
> 
> unisoc # dd if=/dev/random of=file4 bs=1M count=3
> 3145728 bytes (3.0 M) copied, 0.025 s, 120 M/s
> unisoc # df -h | grep dm-48
> /dev/block/dm-48 112G 112G 1.8M 100% /data
> 
> unisoc # ./f2fs_io reserve_cblocks test.apk
> F2FS_IOC_RESERVE_COMPRESS_BLOCKS failed: No space left on device
> 
> adb reboot
> unisoc # df -h  | grep dm-48
> /dev/block/dm-48             112G 112G   11M 100% /data
> unisoc # ./f2fs_io reserve_cblocks test.apk
> 0
> 
> This is because the file has only one direct_node. After returning
> to -ENOSPC, reserved_blocks += ret will not be executed. As a result,
> the reserved_blocks at this time is still 0, which is not the real
> number of reserved blocks. Therefore, fsck cannot be set to repair
> the file.
> 
> After this patch, the fsck flag will be set to fix this problem.
> 
> unisoc # df -h | grep dm-48
> /dev/block/dm-48             112G 112G  1.8M 100% /data
> unisoc # ./f2fs_io reserve_cblocks test.apk
> F2FS_IOC_RESERVE_COMPRESS_BLOCKS failed: No space left on device
> 
> adb reboot then fsck will be executed
> unisoc # df -h  | grep dm-48
> /dev/block/dm-48             112G 112G   11M 100% /data
> unisoc # ./f2fs_io reserve_cblocks test.apk
> 924
> 
> Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
> Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/file.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 572d7bd4d161..97a7233c7ea7 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3624,10 +3624,10 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>   	return ret;
>   }
>   
> -static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
> +static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count,
> +		unsigned int *reserved_blocks)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
> -	unsigned int reserved_blocks = 0;
>   	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
>   	block_t blkaddr;
>   	int i;
> @@ -3691,12 +3691,12 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>   
>   		f2fs_i_compr_blocks_update(dn->inode, compr_blocks, true);
>   
> -		reserved_blocks += reserved;
> +		*reserved_blocks += reserved;
>   next:
>   		count -= cluster_size;
>   	}
>   
> -	return reserved_blocks;
> +	return 0;
>   }
>   
>   static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
> @@ -3740,6 +3740,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   	while (page_idx < last_idx) {
>   		struct dnode_of_data dn;
>   		pgoff_t end_offset, count;
> +		unsigned int tmp_reserved_blocks;
>   
>   		set_new_dnode(&dn, inode, NULL, NULL, 0);
>   		ret = f2fs_get_dnode_of_data(&dn, page_idx, LOOKUP_NODE);
> @@ -3757,7 +3758,8 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
>   		count = round_up(count, F2FS_I(inode)->i_cluster_size);
>   
> -		ret = reserve_compress_blocks(&dn, count);
> +		ret = reserve_compress_blocks(&dn, count, &tmp_reserved_blocks);

How about passing &reserved_blocks into reserve_compress_blocks()?

Thanks,

> +		reserved_blocks += tmp_reserved_blocks;
>   
>   		f2fs_put_dnode(&dn);
>   
> @@ -3765,13 +3767,12 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   			break;
>   
>   		page_idx += count;
> -		reserved_blocks += ret;
>   	}
>   
>   	filemap_invalidate_unlock(inode->i_mapping);
>   	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>   
> -	if (ret >= 0) {
> +	if (!ret) {
>   		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
>   		inode_set_ctime_current(inode);
>   		f2fs_mark_inode_dirty_sync(inode, true);
> @@ -3780,7 +3781,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>   	inode_unlock(inode);
>   	mnt_drop_write_file(filp);
>   
> -	if (ret >= 0) {
> +	if (!ret) {
>   		ret = put_user(reserved_blocks, (u64 __user *)arg);
>   	} else if (reserved_blocks &&
>   			atomic_read(&F2FS_I(inode)->i_compr_blocks)) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
