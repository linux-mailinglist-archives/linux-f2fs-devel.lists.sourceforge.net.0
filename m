Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D7927093
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 09:29:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPGuW-0001X3-FE;
	Thu, 04 Jul 2024 07:29:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sPGuV-0001Wq-Au
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 07:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4wIu4IchBAgCNNGcnBNWGqlPZc4iW3G0bzlsIgm+SOE=; b=Q4KY7xPyUXHJfWhSMb2l8w5yTz
 xJfXb07+BUKc1tTP/FGY8WtrBHzpSmKnHVu4B15bPpC//eAoRFbgBhAyLr/Ql9/ft+2j9X/JNTg3o
 CdPGgrEHUMaEKZu6Fy1MOqT9oY4fUm5V7FcvAvNFIV8tmGNxfmSzo5i/lbCbS31ChvFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4wIu4IchBAgCNNGcnBNWGqlPZc4iW3G0bzlsIgm+SOE=; b=TxzSD3IX0Q+fACAJF/82kbZ8HU
 vizQ1dhqEhmnv+E7xc9cyyLWNLiNPPhD5JIctm7U9Tzfz4jmdfXQI2dJfVYjU/TAfOPPLNauOEAID
 1S1qJ7lO9gXa6btL2yQRf099aJfe2udbhxDvsMCncWQARIMCPsym1s3RP2XXE5RtjWTw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPGuW-0004F1-FY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 07:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B4AB6254F;
 Thu,  4 Jul 2024 07:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB94C3277B;
 Thu,  4 Jul 2024 07:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720078173;
 bh=rXlG36XXP03P3vm34Nm3zetfWK4IvqNBp3LU4LgW9ZY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eN5Psmmjywz+WsV1Qc9tL7H5W/NKERKpwbh7wtrlaq/VHCPk0TfWgb6VlUCVzFshK
 bK/jKRnnpCv/1CPZzsNIZPAWxm6Dl4iQNYSIHv0cK8a6w93JF+11NeD56Ek/B27LY+
 onAUti07AVh06i8+Y342T/XX+hG0jbgDu1hdKMly0pzFp5m6KEvGbJy1YE3bZVuDWj
 kgPslXe0p6H9TOZNyf/cy/XCbgoh+UX60pk87NhZFeTiPKMyIAZ1uijgBUnvsCPOuC
 CfwsMM83dtrWmOq04l/63Qvff9NBJdp/FUT0AmjwpOec5zB3tlLI4aXudP9QpTQFwE
 FD81yAoQDeSlA==
Message-ID: <5d8802d6-0132-4986-8238-9385d1758719@kernel.org>
Date: Thu, 4 Jul 2024 15:29:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sunmin Jeong <s_min.jeong@samsung.com>, jaegeuk@kernel.org
References: <CGME20240702120631epcas1p1c7044f77b56009471e2dc07d4e135a99@epcas1p1.samsung.com>
 <20240702120624.476067-1-s_min.jeong@samsung.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240702120624.476067-1-s_min.jeong@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/2 20:06, Sunmin Jeong wrote: > The page cache of
 the atomic file keeps new data pages which will be > stored in the COW file.
 It can also keep old data pages when GCing the > atomic file. In [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPGuW-0004F1-FY
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use meta inode for GC of atomic
 file
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, daehojeong@google.com,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/2 20:06, Sunmin Jeong wrote:
> The page cache of the atomic file keeps new data pages which will be
> stored in the COW file. It can also keep old data pages when GCing the
> atomic file. In this case, new data can be overwritten by old data if a
> GC thread sets the old data page as dirty after new data page was
> evicted.
> 
> Also, since all writes to the atomic file are redirected to COW inodes,
> GC for the atomic file is not working well as below.
> 
> f2fs_gc(gc_type=FG_GC)
>    - select A as a victim segment
>    do_garbage_collect
>      - iget atomic file's inode for block B
>      move_data_page
>        f2fs_do_write_data_page
>          - use dn of cow inode
>          - set fio->old_blkaddr from cow inode
>      - seg_freed is 0 since block B is still valid
>    - goto gc_more and A is selected as victim again
> 
> To solve the problem, let's separate GC writes and updates in the atomic
> file by using the meta inode for GC writes.
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Cc: stable@vger.kernel.org #v5.19+
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
> ---
>   fs/f2fs/f2fs.h    | 5 +++++
>   fs/f2fs/gc.c      | 6 +++---
>   fs/f2fs/segment.c | 4 ++--
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index a000cb024dbe..59c5117e54b1 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4267,6 +4267,11 @@ static inline bool f2fs_post_read_required(struct inode *inode)
>   		f2fs_compressed_file(inode);
>   }
>   
> +static inline bool f2fs_meta_inode_gc_required(struct inode *inode)
> +{
> +	return f2fs_post_read_required(inode) || f2fs_is_atomic_file(inode);
> +}
> +
>   /*
>    * compress.c
>    */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index a079eebfb080..136b9e8180a3 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1580,7 +1580,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   			start_bidx = f2fs_start_bidx_of_node(nofs, inode) +
>   								ofs_in_node;
>   
> -			if (f2fs_post_read_required(inode)) {
> +			if (f2fs_meta_inode_gc_required(inode)) {
>   				int err = ra_data_block(inode, start_bidx);
>   
>   				f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> @@ -1631,7 +1631,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   
>   			start_bidx = f2fs_start_bidx_of_node(nofs, inode)
>   								+ ofs_in_node;
> -			if (f2fs_post_read_required(inode))
> +			if (f2fs_meta_inode_gc_required(inode))
>   				err = move_data_block(inode, start_bidx,
>   							gc_type, segno, off);
>   			else
> @@ -1639,7 +1639,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   								segno, off);
>   
>   			if (!err && (gc_type == FG_GC ||
> -					f2fs_post_read_required(inode)))
> +					f2fs_meta_inode_gc_required(inode)))
>   				submitted++;
>   
>   			if (locked) {
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 7e47b8054413..b55fc4bd416a 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3823,7 +3823,7 @@ void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr)
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct page *cpage;
>   
> -	if (!f2fs_post_read_required(inode))
> +	if (!f2fs_meta_inode_gc_required(inode))
>   		return;
>   
>   	if (!__is_valid_data_blkaddr(blkaddr))
> @@ -3842,7 +3842,7 @@ void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	block_t i;
>   
> -	if (!f2fs_post_read_required(inode))
> +	if (!f2fs_meta_inode_gc_required(inode))
>   		return;
>   
>   	for (i = 0; i < len; i++)

f2fs_write_single_data_page()
...
		.post_read = f2fs_post_read_required(inode) ? 1 : 0,

Do we need to use f2fs_meta_inode_gc_required() here?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
