Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A71D55E584C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Sep 2022 03:54:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1obBQC-0007Wd-Ur;
	Thu, 22 Sep 2022 01:54:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1obBQB-0007WW-Ag
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Sep 2022 01:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ny+q5DoJI/hBJoiZgUrJz7sNYbSXBW4CVRac03vjAOE=; b=CArODcpwinnBFCXZ7/pC6mg19F
 zYh2E3YN9NQhYAQ51yD19fLRkoh5awfy+4ndjbUtMbI92x7pU7a2IyHlLP+stVBBiy18lxrP0Vq+0
 4D3VWiipuVJs95svTtnVIFVQdpXrRHAhPdPfbwYbiB5BdcenyDrJMlbzikgFsxJk346Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ny+q5DoJI/hBJoiZgUrJz7sNYbSXBW4CVRac03vjAOE=; b=FyAljfVStgpIG04aqqBgPMe9fk
 6LSbqyuAo9PonuyWpAmVuaT8J+FWMQq2JjKObMC89FrG/sQdH5/b8kZywBp+Pq0owbm/OfOzvouxn
 vRhuMwjsV0vCgGHBfU3fUl3q/DXxXSDyRdTl6BbJ0UpGIpUnG/rpCqzbRxcZAArUXzNU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obBQ4-00064f-MY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Sep 2022 01:54:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3C07B819F6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Sep 2022 01:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E545C433D6;
 Thu, 22 Sep 2022 01:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663811660;
 bh=daKmN7uJuDeH1R9QVXhts08inJKQ5l61NyNLAVl0mw8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P2BbwMgGbIs43cgBkNNo0FkR8WQutLBQUetMagrS+69fFNB11WgGFnCchJ3YWd3c1
 jvhTnp5j4u6fQrPODLUgmdpe3VdY0S8vexR7eoQbKpMy++YSfAhoPi1vSBdwCO7M3D
 qPkZPQ/5MnRy1KoUJL13g39/9HY8rKPWA7PftAYKIGNIAMgcD2wQREmlIk/Y7oT6ci
 JGMgDxaIpd75TtxD/xz7E5aenj2kwR6ftOvRVnVtgD4P2/ilCOISRSyAFoM6A8DEur
 TOvX33449C40W6rKb3q7kYC0ETljarGWcl/rOI6JFIfi7e8nUV9QJitfmAGQpZb3ps
 RiCY75RhVNw8A==
Message-ID: <44a1eca6-568b-a752-ef01-06de489eb466@kernel.org>
Date: Thu, 22 Sep 2022 09:54:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: jaegeuk@kernel.org
References: <20220913074812.2300528-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220913074812.2300528-1-chao@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping, On 2022/9/13 15:48, Chao Yu wrote: > It is possible
 that ino of dirent or orphan inode is corrupted in a > fuzzed image,
 occasionally, 
 if corrupted ino is equal to meta ino: > meta_ino, node_ino or co [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1obBQ4-00064f-MY
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to detect corrupted meta ino
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

Ping,

On 2022/9/13 15:48, Chao Yu wrote:
> It is possible that ino of dirent or orphan inode is corrupted in a
> fuzzed image, occasionally, if corrupted ino is equal to meta ino:
> meta_ino, node_ino or compress_ino, caller of f2fs_iget() from below
> call paths will get meta inode directly, it's not allowed, let's
> add sanity check to detect such cases.
> 
> case #1
> - recover_dentry
>   - __f2fs_find_entry
>   - f2fs_iget_retry
> 
> case #2
> - recover_orphan_inode
>   - f2fs_iget_retry
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - update commit title/message
> - change logic inside f2fs_iget() rather than its caller
>   fs/f2fs/inode.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index cde0a3dc80c3..1baac6056733 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -487,6 +487,12 @@ static int do_read_inode(struct inode *inode)
>   	return 0;
>   }
>   
> +static bool is_meta_ino(struct f2fs_sb_info *sbi, unsigned int ino)
> +{
> +	return ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi) ||
> +		ino == F2FS_COMPRESS_INO(sbi);
> +}
> +
>   struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> @@ -497,17 +503,22 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>   	if (!inode)
>   		return ERR_PTR(-ENOMEM);
>   
> +	if (is_meta_ino(sbi, ino)) {
> +		if (!(inode->i_state & I_NEW)) {
> +			f2fs_err(sbi, "detect corrupted inode no:%lu, run fsck to repair", ino);
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			ret = -EFSCORRUPTED;
> +			trace_f2fs_iget_exit(inode, ret);
> +			iput(inode);
> +			return ERR_PTR(ret);
> +		}
> +		goto make_now;
> +	}
> +
>   	if (!(inode->i_state & I_NEW)) {
>   		trace_f2fs_iget(inode);
>   		return inode;
>   	}
> -	if (ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi))
> -		goto make_now;
> -
> -#ifdef CONFIG_F2FS_FS_COMPRESSION
> -	if (ino == F2FS_COMPRESS_INO(sbi))
> -		goto make_now;
> -#endif
>   
>   	ret = do_read_inode(inode);
>   	if (ret)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
