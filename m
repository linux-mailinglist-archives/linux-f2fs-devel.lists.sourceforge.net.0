Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 315A575D482
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jul 2023 21:21:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMvhH-0003xV-3N;
	Fri, 21 Jul 2023 19:21:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qMvhF-0003xO-Ii
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jul 2023 19:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+VrvBJNW8fd3iSx5c8Al5P1Jn33nmvubN4ywWiqsQpA=; b=RdZZdbXifLyBXWzXKnRcZwkdIq
 BSOFCV6wAaYGunzTZI86zFJBbn1bNXqn9p98PL8qJes8csiWzTIgyfZqqjK8RgDRiiWP/YLUEocZA
 qIbt+GuCWrpnQzFVaaeiL6V99cwJl9Ex75iP4QAylf0RIGVGz2n+uMY9tCcKUusQtDSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+VrvBJNW8fd3iSx5c8Al5P1Jn33nmvubN4ywWiqsQpA=; b=R7RTXuXzXNGlLkTt4h2fS6Zr76
 0BHnYoVBcG2BCowzIV7hL/SFzHGWe/rNjj/yGJrW8yxE1lc9dtVMAbXP+QXvk8YWOIXXc3qe+sXij
 oisoNGQ4N29a/SWGY2bNjvTmfPh6+44cfnDuSRhf6Uh83CISTlPt9dHFJ5xQDm88TqK0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qMvhF-00FfgI-SW for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jul 2023 19:21:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51D9F61D54
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Jul 2023 19:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62D6C433C7;
 Fri, 21 Jul 2023 19:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689967303;
 bh=fGyNpq58X8tGzGtuy1WcC2v3pKbuUmVPo0HzGbYqIYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MK6HScizLBVem+44lXtCbdDtB+ZKCBCCrWDaZspIFavuur1DrQWsxwfPvbMBNYK4q
 TiTyHEH2A8fbMohHpiRB4iHfWOlgqxxL1JTgwwjRf8hxY6pEglYxrfP3QB3JeODriv
 50UTaQbbsut4NhtVeFRrecdtOX3st6z+yfcyYXKQkJZRFCFY4jH1xUo3a+aQu6VuR9
 Me8szwbnN1WrXU/3/LwXTDd2NHPyV35m7zA9HISfmB+sj3IfvPL7VOQJxsOZY4gj+2
 6gadV82tREGtZ2D9HkjxYrvL7s5d2o+nu2FqZ1h+8dKcE3sSWJxNS0ghKarD6B5HDe
 Zw25058/4E9NQ==
Date: Fri, 21 Jul 2023 12:21:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZLraxrFLLD1RNDv8@google.com>
References: <20230718040523.1171058-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718040523.1171058-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/18,
 Chao Yu wrote: > If there are corrupted xattr entries
 in xattr space, it may cause > traversing across end of xattr space issue,
 this patch adds sanity > check during xattr traverse to avoid [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qMvhF-00FfgI-SW
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: do sanity check on xattr entry
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

On 07/18, Chao Yu wrote:
> If there are corrupted xattr entries in xattr space, it may cause
> traversing across end of xattr space issue, this patch adds sanity
> check during xattr traverse to avoid such issue.
> 
> This patch synchronizes kernel commits:
> 
> 2777e654371d ("f2fs: fix to avoid accessing xattr across the boundary")
> 688078e7f36c ("f2fs: fix to avoid memory leakage in f2fs_listxattr")
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fsck/dump.c  |  9 +++++++++
>  fsck/mount.c | 18 ++++++++++++++----
>  fsck/xattr.c | 21 ++++++++++++++++++---
>  fsck/xattr.h |  6 ++++++
>  4 files changed, 47 insertions(+), 7 deletions(-)
> 
> diff --git a/fsck/dump.c b/fsck/dump.c
> index 6deaa7e..e7a1c5c 100644
> --- a/fsck/dump.c
> +++ b/fsck/dump.c
> @@ -354,6 +354,7 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
>  static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
>  {
>  	void *xattr;
> +	void *last_base_addr;
>  	struct f2fs_xattr_entry *ent;
>  	char xattr_name[F2FS_NAME_LEN] = {0};
>  	int ret;
> @@ -362,10 +363,18 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
>  	if (!xattr)
>  		return;
>  
> +	last_base_addr = (void *)xattr + XATTR_SIZE(&node_blk->i);
> +
>  	list_for_each_xattr(ent, xattr) {
>  		char *name = strndup(ent->e_name, ent->e_name_len);
>  		void *value = ent->e_name + ent->e_name_len;
>  
> +		if ((void *)(ent) + sizeof(__u32) > last_base_addr ||
> +			(void *)XATTR_NEXT_ENTRY(ent) > last_base_addr) {
> +			MSG(0, "xattr entry crosses the end of xattr space\n");
> +			break;
> +		}
> +
>  		if (!name)
>  			continue;
>  
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 2691b2f..3ee003d 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -274,6 +274,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
>  {
>  	struct f2fs_inode *inode = &node->i;
>  	void *xattr_addr;
> +	void *last_base_addr;
>  	struct f2fs_xattr_entry *ent;
>  	char en[F2FS_PRINT_NAMELEN];
>  	unsigned int i = 0;
> @@ -370,13 +371,22 @@ void print_inode_info(struct f2fs_sb_info *sbi,
>  	DISP_u32(inode, i_nid[4]);	/* double indirect */
>  
>  	xattr_addr = read_all_xattrs(sbi, node);
> -	if (xattr_addr) {
> -		list_for_each_xattr(ent, xattr_addr) {
> -			print_xattr_entry(ent);
> +	if (!xattr_addr)
> +		goto out;
> +
> +	last_base_addr = (void *)xattr_addr + XATTR_SIZE(&node->i);
> +
> +	list_for_each_xattr(ent, xattr_addr) {
> +		if ((void *)(ent) + sizeof(__u32) > last_base_addr ||
> +			(void *)XATTR_NEXT_ENTRY(ent) > last_base_addr) {
> +			MSG(0, "xattr entry crosses the end of xattr space\n");
> +			break;
>  		}
> -		free(xattr_addr);
> +		print_xattr_entry(ent);
>  	}
> +	free(xattr_addr);
>  
> +out:
>  	printf("\n");
>  }
>  
> diff --git a/fsck/xattr.c b/fsck/xattr.c
> index 04c2879..4593709 100644
> --- a/fsck/xattr.c
> +++ b/fsck/xattr.c
> @@ -55,11 +55,19 @@ void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
>  	return txattr_addr;
>  }
>  
> -static struct f2fs_xattr_entry *__find_xattr(void *base_addr, int index,
> -		size_t len, const char *name)
> +static struct f2fs_xattr_entry *__find_xattr(void *base_addr,
> +				void *last_base_addr, int index,
> +				size_t len, const char *name)
>  {
>  	struct f2fs_xattr_entry *entry;
> +
>  	list_for_each_xattr(entry, base_addr) {
> +		if ((void *)(entry) + sizeof(__u32) > last_base_addr ||
> +			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr) {
> +			MSG(0, "xattr entry crosses the end of xattr space\n");
> +			return NULL;
> +		}
> +
>  		if (entry->e_name_index != index)
>  			continue;
>  		if (entry->e_name_len != len)
> @@ -125,6 +133,7 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
>  {
>  	struct f2fs_node *inode;
>  	void *base_addr;
> +	void *last_base_addr;
>  	struct f2fs_xattr_entry *here, *last;
>  	struct node_info ni;
>  	int error = 0;
> @@ -159,7 +168,13 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
>  	base_addr = read_all_xattrs(sbi, inode);
>  	ASSERT(base_addr);
>  
> -	here = __find_xattr(base_addr, index, len, name);
> +	last_base_addr = (void *)base_addr + XATTR_SIZE(&inode->i);
> +
> +	here = __find_xattr(base_addr, last_base_addr, index, len, name);
> +	if (!here) {
> +		error = -EUCLEAN;

Fixed build error by replacing this with:

-               error = -EUCLEAN;
+               MSG(0, "Need to run fsck due to corrupted xattr.\n");
+               error = -EINVAL;

> +		goto exit;
> +	}
>  
>  	found = IS_XATTR_LAST_ENTRY(here) ? 0 : 1;
>  
> diff --git a/fsck/xattr.h b/fsck/xattr.h
> index bf1dd7e..867349c 100644
> --- a/fsck/xattr.h
> +++ b/fsck/xattr.h
> @@ -182,6 +182,12 @@ static inline int f2fs_acl_count(int size)
>  			!IS_XATTR_LAST_ENTRY(entry); \
>  			entry = XATTR_NEXT_ENTRY(entry))
>  
> +#define VALID_XATTR_BLOCK_SIZE	(F2FS_BLKSIZE - sizeof(struct node_footer))
> +
> +#define XATTR_SIZE(i)		((le32_to_cpu((i)->i_xattr_nid) ?	\
> +					VALID_XATTR_BLOCK_SIZE : 0) +	\
> +						(inline_xattr_size(i)))
> +
>  #define MIN_OFFSET	XATTR_ALIGN(F2FS_BLKSIZE -		\
>  		sizeof(struct node_footer) - sizeof(__u32))
>  
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
