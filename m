Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D677FA18D3A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jan 2025 09:00:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1taVet-0000SH-L3;
	Wed, 22 Jan 2025 08:00:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1taVeg-0000Ry-EU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Jan 2025 08:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MjO8E2pE42HxkF6mGXrt7F3BfWCaZN+jPRpx0W6C1zA=; b=lbXpOt0CGJdExmlsK+loLN4XUU
 +340xHZSlfu2p/oTWNEFolIw1+fDtfxYmQFuyDVOWGFwgg6oofudHskXxnOpSo0JObh+UTmYatAaO
 jHEjDijBsR2PH2HK8pd10tInF576Y77YAi32RbbIFcmM+ucBu5VFMj6va7vBzk/2fGPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MjO8E2pE42HxkF6mGXrt7F3BfWCaZN+jPRpx0W6C1zA=; b=EhLanzMtzalpeHL5TCq9B2q1F4
 vNAC8iGIXEEcBWVMo9cwhMXhLb5unKAMW49cVjuChPuY1GXnLUIskglg8ZolejNgmd55Vo8DlKadE
 H3VXiXR1Bq/wROerEQpXS6udztJqR54wjnVBrU/In3TaoZtZembp+XezMXktYHrWPAxk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taVef-0003vR-6F for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Jan 2025 08:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 51B635C5C54;
 Wed, 22 Jan 2025 07:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BA1C4CEE2;
 Wed, 22 Jan 2025 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737532799;
 bh=XZR+Lbwn+51cbpVcvb76qT7XPGh3f1kyTvqwCNl0mJs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=oMDvrbOeq10HjGz3L5X5Qqe8oZ8csuaOljpkO8pzyfVtNKt7BnaN62rBx+RXNxMSm
 4fELTetbhpp2k1m3vGdLp5JF4ZlrTW+sVFk3rG0hTCkNxs8drjEIPon01xjDz1herF
 EfhvDyF72WUouRCg4pdp7wQs9bBVUwY5UkUR3FoT8jLKj2XJqgURT4XmIq4G/ogbQB
 BE7mJw8+8LmFJ8N0BRyUvkBhdfUmnBRcLsQ73hGEVBvkgcPEzcsn9rvLkxTOEtjtlK
 p4QRPLOJjG4+StFLZlOJKR1ie5GeQ18RZs98AvR9TlwlTKiUo5cZ1SWBRY4RAMi1Ju
 GJ/yfUIUfaslg==
Message-ID: <63bb967d-5464-4d6b-9daa-7059608bfba2@kernel.org>
Date: Wed, 22 Jan 2025 15:59:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yi Sun <yi.sun@unisoc.com>, jaegeuk@kernel.org
References: <20250113014702.2312729-1-yi.sun@unisoc.com>
Content-Language: en-US
In-Reply-To: <20250113014702.2312729-1-yi.sun@unisoc.com>
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/13/25 09:47,
 Yi Sun wrote: > Now f2fs_invalidate_blocks()
 supports a continuous range of addresses, > so the for loop can be omitted.
 > > Signed-off-by: Yi Sun <yi.sun@unisoc.com> > Signed-off-by [...] 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1taVef-0003vR-6F
Subject: Re: [f2fs-dev] [PATCH] f2fs: Clean up the loop outside of
 f2fs_invalidate_blocks()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Ke.Wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/13/25 09:47, Yi Sun wrote:
> Now f2fs_invalidate_blocks() supports a continuous range of addresses,
> so the for loop can be omitted.
> 
> Signed-off-by: Yi Sun <yi.sun@unisoc.com>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Actually, this can be merged into "f2fs: add parameter @len to 
f2fs_invalidate_blocks()", but, anyway, I guess it's fine to merge it separately.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   fs/f2fs/file.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 9980d17ef9f5..4baafad7a00c 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -811,10 +811,8 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
>   	if (IS_DEVICE_ALIASING(inode)) {
>   		struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
>   		struct extent_info ei = et->largest;
> -		unsigned int i;
>   
> -		for (i = 0; i < ei.len; i++)
> -			f2fs_invalidate_blocks(sbi, ei.blk + i, 1);
> +		f2fs_invalidate_blocks(sbi, ei.blk, ei.len);
>   
>   		dec_valid_block_count(sbi, inode, ei.len);
>   		f2fs_update_time(sbi, REQ_TIME);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
