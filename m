Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D434E717121
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 00:59:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q48Iq-0003o6-Vu;
	Tue, 30 May 2023 22:58:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q48Ip-0003ny-9n
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 22:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L/dhWHNllEaEQXfmN2HZVi9reABIX8Y6hHzyIC5efpc=; b=TPs8WQl6K0SubZwy8FT4nsXxwF
 Wfi0ACc9wQaQznDdxi0HZqLSXCZaI1G4T09/0MuquicaMJ9hlb3cLYlJ2H7quOnSRYTvskd3mk7Wr
 HedHk2ofTZ/g4TMchnl9DlCyH8QseXzRP5OFXIwXwQDDExy3cNKfzI8X9/shmEvKuEI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L/dhWHNllEaEQXfmN2HZVi9reABIX8Y6hHzyIC5efpc=; b=eyKV9NXZDKARMdWtwp/dk7266o
 eSGU02ALhnqZtoVvbiJysMlY+ks3KO5PJwRQD+GsQH1azdY/1j4h23gTCLMkQSOYfACRGKWnbl83U
 BRxRaYut2KKeR9ssQmhLIXoND4qwlRPeFDVFTYnHRZovR2e9iZ2H8MZgnPOH4vlkdPK8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q48Ip-0007sb-Dh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 22:58:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3361E60FED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 May 2023 22:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89482C433D2;
 Tue, 30 May 2023 22:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685487528;
 bh=zfTqgzO/JotWGyGtsN2wEF9z4IQswRPkp9lPiyR1Af4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fqrDM8OSnY2/WmlyaywnoiN+rwkmKL1IbUNS3/c9cvsS/uXK00jGJMHieYt/Y9LwD
 Mx36DJnO2PeTRuOm4C1h1z86TE8wMRw7eYFoCk02uNbDAQtQBU5eDkTt7r5ZL3Qeh3
 MlqgFyVYyuc7VJI2DOz5X4snpWpqFsFWqR3XNXPpJQKD/rkcB+dASr+7+7ZZK/A9in
 3bJz0KdPMrHw+pmFIXbA66jMnTXqtISw2GXdfEqm7w4MCHOkK6LTk3Wbo8BbgMZzjX
 +iWUm/hmBEVzOdRRQQvcXNIJCWulwvV5zzW+Ali11HwN0Po//dtZMtiOkdgMid19JO
 MYIlQcDCAfvcQ==
Date: Tue, 30 May 2023 15:58:46 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZHZ/psv3hNbP0UBK@google.com>
References: <20230528080709.1692640-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230528080709.1692640-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/28,
 Chao Yu wrote: > and use le32_to_cpu() in IS_INODE().
 > > Signed-off-by: Chao Yu <chao@kernel.org> > --- > fsck/fsck.c | 7 +++----
 > fsck/mount.c | 4 ++-- > fsck/node.h | 3 ++- > 3 files cha [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q48Ip-0007sb-Dh
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: clean up codes with IS_INODE()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/28, Chao Yu wrote:
> and use le32_to_cpu() in IS_INODE().
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fsck/fsck.c  | 7 +++----
>  fsck/mount.c | 4 ++--
>  fsck/node.h  | 3 ++-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index e6ad71d..a4db2a3 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -247,7 +247,7 @@ static int is_valid_summary(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  		goto out;
>  
>  	/* check its block address */
> -	if (node_blk->footer.nid == node_blk->footer.ino) {
> +	if (IS_INODE(node_blk)) {
>  		int ofs = get_extra_isize(node_blk);
>  
>  		if (ofs + ofs_in_node >= DEF_ADDRS_PER_INODE)
> @@ -447,8 +447,7 @@ static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
>  				nid, ni->ino, le32_to_cpu(node_blk->footer.ino));
>  		return -EINVAL;
>  	}
> -	if (ntype != TYPE_INODE &&
> -			node_blk->footer.nid == node_blk->footer.ino) {
> +	if (ntype != TYPE_INODE && IS_INODE(node_blk)) {
>  		ASSERT_MSG("nid[0x%x] footer.nid[0x%x] footer.ino[0x%x]",
>  				nid, le32_to_cpu(node_blk->footer.nid),
>  				le32_to_cpu(node_blk->footer.ino));
> @@ -3080,7 +3079,7 @@ static int fsck_reconnect_file(struct f2fs_sb_info *sbi)
>  			ASSERT(err >= 0);
>  
>  			/* reconnection will restore these nodes if needed */
> -			if (node->footer.ino != node->footer.nid) {
> +			if (!IS_INODE(node)) {
>  				DBG(1, "Not support non-inode node [0x%x]\n",
>  				    nid);
>  				continue;
> diff --git a/fsck/mount.c b/fsck/mount.c
> index f1fb525..90ecabf 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2394,7 +2394,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
>  	ASSERT(ret >= 0);
>  
>  	/* check its block address */
> -	if (node_blk->footer.nid == node_blk->footer.ino) {
> +	if (IS_INODE(node_blk)) {
>  		int ofs = get_extra_isize(node_blk);
>  
>  		oldaddr = le32_to_cpu(node_blk->i.i_addr[ofs + ofs_in_node]);
> @@ -2409,7 +2409,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
>  	}
>  
>  	/* check extent cache entry */
> -	if (node_blk->footer.nid != node_blk->footer.ino) {
> +	if (!IS_INODE(node_blk)) {
>  		get_node_info(sbi, le32_to_cpu(node_blk->footer.ino), &ni);
>  
>  		/* read inode block */
> diff --git a/fsck/node.h b/fsck/node.h
> index 99139b1..2ba7b8c 100644
> --- a/fsck/node.h
> +++ b/fsck/node.h
> @@ -20,7 +20,8 @@
>  
>  static inline int IS_INODE(struct f2fs_node *node)

return bool?

>  {
> -	return ((node)->footer.nid == (node)->footer.ino);
> +	return le32_to_cpu(node->footer.ino) ==
> +			le32_to_cpu(node->footer.nid);

Again, why do we need this conversion which looks uncessary?

>  }
>  
>  static inline unsigned int ADDRS_PER_PAGE(struct f2fs_sb_info *sbi,
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
