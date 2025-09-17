Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C7B7EBD0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Sep 2025 14:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJyw+GbN/jKG4uq2b9VwmvdYKpjHxKMT9JHG/MDnYzY=; b=A+YnBz/W7rKobUkNVvSanDe/OU
	UYOn5NHTb+0Lxk4UK47JRnVQ32x5STeIVNuABDOMhguMVxgB/mY7/mvOjqnxcJXx/KEIEPrrEFRCx
	Ppyrp2K+UxN3ZHzkt4EHQMsLvoNI+ay9NXv8cYG3S3hHoV5ctLOVCCIGvg30hL8zabVU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uylrQ-0001rR-Sd;
	Wed, 17 Sep 2025 06:41:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uylrP-0001rF-O5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 06:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wL1jqRw9MG7/oB4iS8sukXzaqvw4yc8khVU0vTlEixA=; b=mI9ehRVtaG0y8n6LDTk2WxWzbF
 H3oaze7M4Ta1PNt5HHEfGoiIzR2EfbubbYXsnqh9BgQQMeTGBmfHGUdiLo2zVXvDlrjScczNBCRnQ
 hltKRg0r23VC2F9JjeuQbgO/eMHczDgBPTkFqP9BIpJAJyq+ztLgqpfLa1wJU2FILI5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wL1jqRw9MG7/oB4iS8sukXzaqvw4yc8khVU0vTlEixA=; b=WwBwwiOd2FVhVSV0IdcTuR9U8j
 hqjAGi2j+lQlpgUbsULKNmWgjU3Qb5kX9xidqJqpPsIPrAKQuXsAXO097IySU2yduKKhh3Rl4Ga0q
 hn6VfgMSoAiqYpWi4K/FwNrRMQC5TKiC01XGHMJsFcVbxUTG+R4410qUFqsZ9Uv2k3hk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uylrP-0004nq-Vs for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 06:41:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E348601DA;
 Wed, 17 Sep 2025 06:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B8DC4CEF0;
 Wed, 17 Sep 2025 06:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758091302;
 bh=T0iVRqYjMl2xvDtrQJ16kWmCb8PF43r3K+G5IOGlLhc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hMisa/RvND4bb/dave5KS+GBDAZAZVR5esdP59RdY9gVhIyPdxgVwSOuSpbeVafXi
 TlFp7W/OFxNNhhcUbThltBYfxCG/mFZdeguy9I6q5MDsBrVdW9RgYbezGwfpBdQmyC
 LiOC2L9Af4aRVNEllF9IoyH5VXsBdORWLzcoNhJXo7VFe2DY6EyFTzT0Msva73pdaG
 jX3LLIfRmsoG5HUxHPtxtKMk/PrCsL4ujuQTi9Fre7UPEWNkIQniQvTFS1PJMVIPAS
 /CvyDs85oKnkj1DzXn2pkiZjLWwR0XL5RZFda12WPzl/IKpHHdknu4QEzkVygw2EpM
 QtHXV15jRTAJQ==
Message-ID: <760669e9-22ec-490f-adc2-2981d2a56709@kernel.org>
Date: Wed, 17 Sep 2025 14:41:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250917023622.516052-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250917023622.516052-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/17/25 10:36, wangzijie wrote: > Script to reproduce:
 > f2fs_io write 1 0 1881 rand dsync testfile > f2fs_io fallocate 0 7708672
 4096 testfile > f2fs_io write 1 1881 1 rand buffered testfile > fsy [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uylrP-0004nq-Vs
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: fix zero-sized extent for
 precache extents
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
Cc: linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/17/25 10:36, wangzijie wrote:
> Script to reproduce:
> f2fs_io write 1 0 1881 rand dsync testfile
> f2fs_io fallocate 0 7708672 4096 testfile
> f2fs_io write 1 1881 1 rand buffered testfile
> fsync testfile
> umount
> mount
> f2fs_io precache_extents testfile
> 
> When the data layout is something like this:
> dnode1:                     dnode2:
> [0]      A                  [0]    NEW_ADDR
> [1]      A+1                [1]    0x0
> ...
> [1016]   A+1016
> [1017]   B (B!=A+1017)      [1017] 0x0
> 
> During precache_extents, we map the last block(valid blkaddr) in dnode1:
> map->m_flags |= F2FS_MAP_MAPPED;
> map->m_pblk = blkaddr(valid blkaddr);
> map->m_len = 1;
> then we goto next_dnode, meet the first block in dnode2(hole), goto sync_out:
> map->m_flags & F2FS_MAP_MAPPED == true, and we make zero-sized extent:
> 
> map->m_len = 1
> ofs = start_pgofs - map->m_lblk = 1882 - 1881 = 1
> ei.fofs = start_pgofs = 1882
> ei.len = map->m_len - ofs = 1 - 1 = 0
> 
> 
> Rebased on patch[1], this patch can cover these cases to avoid zero-sized extent:
> A,B,C is valid blkaddr
> case1:
> dnode1:                     dnode2:
> [0]      A                  [0]    NEW_ADDR
> [1]      A+1                [1]    0x0
> ...                         ....
> [1016]   A+1016
> [1017]   B (B!=A+1017)      [1017] 0x0
> 
> case2:
> dnode1:                     dnode2:
> [0]      A                  [0]    C (C!=B+1)
> [1]      A+1                [1]    C+1
> ...                         ....
> [1016]   A+1016
> [1017]   B (B!=A+1017)      [1017] 0x0
> 
> case3:
> dnode1:                     dnode2:
> [0]      A                  [0]    C (C!=B+2)
> [1]      A+1                [1]    C+1
> ...                         ....
> [1015]   A+1015
> [1016]   B (B!=A+1016)
> [1017]   B+1                [1017] 0x0
> 
> [1] https://lore.kernel.org/linux-f2fs-devel/20250912081250.44383-1-chao@kernel.org/
> 
> Fixes: c4020b2da4c9 ("f2fs: support F2FS_IOC_PRECACHE_EXTENTS")
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
