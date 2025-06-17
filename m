Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F8DADC18C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 07:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qABdyssOaG3Crf2ZLNg5fHniQtP9BNuGo6PWTTJKJxw=; b=D8z7ArdhfrW/LhIJ+BMXU+Nv3+
	2B9qZNnl0OyVMwcR1unQAwyF+6bgavuq1ftSrOLaNINFrtq7rSQ64Qo9ZsQjIF7lqx/wkJ37v+pL1
	ZTBnGvGalBmiij9E2augXrzEle1CX2Q4VvrLWBCGu11cM9Ldmc+j/nODM3zEgbEZh9yc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uROms-0005eJ-AT;
	Tue, 17 Jun 2025 05:23:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uROmr-0005eD-CE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 05:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YVT0ejVJgJhb0+YFC8mPUC0K74kelyAaW0wWW5xhj0Y=; b=eL4PKkUxbDK/lYWiDe4cKK8iCl
 k4S1/myt2qNpz0WtzkA6QgsRGiZMqoWkBCpeSk8TtEwedT6Xu6I8XlfEHHz/PYAPE4iCZUbuSN9VV
 wPz1OwuXaSYD79joj4IF9dZXF3IJeRNEs8g4jDgSdfzNl4ZrVoYfNWwo3Iogp8xwzBk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YVT0ejVJgJhb0+YFC8mPUC0K74kelyAaW0wWW5xhj0Y=; b=SCpswZXqVL+j3KlYTaT62cJgGU
 YKStx51eBOMIIbayj9luGngkhUM/cwahTHZH6tJSi5VlyMvLbmMYp14slxydcL/Pamwvk8Nx9nHoR
 PgYhkimdg9640idfnOQwxmfqeNz4yFOsKKwYw9Mxr9hrpPqRRKVXQnYzIfnItWXLuB8I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uROmq-0003Cb-SI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 05:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E25DE5C5BB8;
 Tue, 17 Jun 2025 05:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AFBC4CEE3;
 Tue, 17 Jun 2025 05:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750137778;
 bh=tFRSsMCPVFwL8Dbfsu98Pw3xF+UngvzyuxWLkGDBlVQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=VcCl3JUFDqh3Wv2Jv9k36Ydx18j59hpGR2r9C36Kr/XszRMP8iFC64mv2SkbK7TEz
 oocpefpn9KkpQcoWbl9F0MuiQd8bxi0nUnyB1Oc82guB7FqlM5bfcm+sb1zrlnKKTY
 Fa0FiLBrlMF9E+d1iPdyvfhU7d5xkeSp7HujsjMPsenkSBQngzgEEzoSQppt8uzqV/
 PMYfTr511qeTSu9edTStthARWVHe3eT6JBTnzv5nA+EYx64LkVMO2/OKL/WDoOXyeu
 7l0DSPSc8Ij/7k9OEVTidFjiAz9PdUxrG24VcxWVllJhirndbKN02uhJuwjQS/6ioI
 RdMfU39jN8auQ==
Message-ID: <6ccfdae1-13f7-421d-b7d3-76883c2e7b8b@kernel.org>
Date: Tue, 17 Jun 2025 13:22:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250617035711.2342823-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250617035711.2342823-1-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/17/25 11:57,
 wangzijie wrote: > To prevent non-section-aligned
 size pinned file generated from truncation, > add check condition in setattr.
 > > Signed-off-by: wangzijie <wangzijie1@honor.com> > [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uROmq-0003Cb-SI
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: avoid non-section-aligned size
 pinned file generation
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/17/25 11:57, wangzijie wrote:
> To prevent non-section-aligned size pinned file generated from truncation,
> add check condition in setattr.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>  fs/f2fs/file.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f..72f7d1b4a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1026,6 +1026,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  {
>  	struct inode *inode = d_inode(dentry);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	int err;
>  
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> @@ -1047,6 +1048,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  			!IS_ALIGNED(attr->ia_size,
>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>  			return -EINVAL;
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size < i_size_read(inode) &&

Do we need to consider attr->ia_size > i_size case?

Thanks,

> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
> +			return -EINVAL;
>  	}
>  
>  	err = setattr_prepare(idmap, dentry, attr);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
