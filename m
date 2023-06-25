Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B373CEEA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jun 2023 09:27:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDK99-0007Vg-Kt;
	Sun, 25 Jun 2023 07:26:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qDK97-0007Va-Oc
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 07:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+IoA0p5Rmsy3ydFGtipF4G4ikjibdxITR1JXUdNlHXQ=; b=RCgkOvXgKBa1bnNmicPWXcAJ5h
 Qr/fZHyIKl12CbS2k72AYTXrs/I9ZOLfsWCsanBOzId01OXShtXyL8rFOOZy7BrovX5CIxGo11mNt
 P39MLyKmRd0QIHec5aMFx3jAC/5yk8HdhqnTMk8nLvWAoXNQXiICTUCEtU4kDhkz8DU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+IoA0p5Rmsy3ydFGtipF4G4ikjibdxITR1JXUdNlHXQ=; b=DXzBOpcrYr8YiX1hinNYf7tPmy
 3kz2w+iPHDPbSXJFrzBvWw2Wpw825wFV9KxCc6tyjWOWgfYwgD4Hx9m026MYnfl5A0yZpu7RCUqsI
 MuPhfivJ60uo8FIMqToteRNUCdT+5z9cKnefkFivrLwkUBTGJHzhSNIW0xSHIjiqPxuQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDK96-0004vl-Ke for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 07:26:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF59560B37
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Jun 2023 07:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7499AC433C0;
 Sun, 25 Jun 2023 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687678003;
 bh=n8NJrHW6O64INrNVioHV6r1iMPZT7RdhdOdSbYch9jI=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=agH9X662vWufI4ggY1kdPZubOHqMvSfpdKqkjFf/pAKcgkK5f3Ffa9njfQLtzuEJ9
 MZdzkBMZcteZrDs6eJglF0DiP9BQj2yD5kApVjDZOLYM9VdpAPybfvvTbHIzYcjmYK
 VUZXb6aEQTxoPsiGneLISxPh6DejVRU+G215qMOxEHiWMI9LZnPTIkIgqubNI0njoX
 sM2gW5rsmaW6b57QmrlBhqCrb5wjIIOzk/6rln+ZE3r8gfD+uWnFdUsarHy6agMCFb
 dpkJ/Ab9kGmcv3voxbe7QSFroqMKAn6L+5e4qen8u3GZG2zOwRgp2uCMaFOuzyFJLA
 m6mj2Ipz2urmQ==
Message-ID: <e5788348-b547-8e10-21af-90544f3aa75c@kernel.org>
Date: Sun, 25 Jun 2023 15:26:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230613233940.3643362-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230613233940.3643362-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/14 7:39, Jaegeuk Kim wrote: > This reverts commit
 27161f13e3c3 "f2fs: avoid race in between read xattr & write xattr". > >
 That introduced a deadlock case: > > Thread #1: > > [122554.641906] [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qDK96-0004vl-Ke
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove i_xattr_sem to avoid deadlock
 and fix the original issue
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/14 7:39, Jaegeuk Kim wrote:
> This reverts commit 27161f13e3c3 "f2fs: avoid race in between read xattr & write xattr".
> 
> That introduced a deadlock case:
> 
> Thread #1:
> 
> [122554.641906][   T92]  f2fs_getxattr+0xd4/0x5fc
>      -> waiting for f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> 
> [122554.641927][   T92]  __f2fs_get_acl+0x50/0x284
> [122554.641948][   T92]  f2fs_init_acl+0x84/0x54c
> [122554.641969][   T92]  f2fs_init_inode_metadata+0x460/0x5f0
> [122554.641990][   T92]  f2fs_add_inline_entry+0x11c/0x350
>      -> Locked dir->inode_page by f2fs_get_node_page()
> 
> [122554.642009][   T92]  f2fs_do_add_link+0x100/0x1e4
> [122554.642025][   T92]  f2fs_create+0xf4/0x22c
> [122554.642047][   T92]  vfs_create+0x130/0x1f4
> 
> Thread #2:
> 
> [123996.386358][   T92]  __get_node_page+0x8c/0x504
>      -> waiting for dir->inode_page lock
> 
> [123996.386383][   T92]  read_all_xattrs+0x11c/0x1f4
> [123996.386405][   T92]  __f2fs_setxattr+0xcc/0x528
> [123996.386424][   T92]  f2fs_setxattr+0x158/0x1f4
>      -> f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
> 
> [123996.386443][   T92]  __f2fs_set_acl+0x328/0x430
> [123996.386618][   T92]  f2fs_set_acl+0x38/0x50
> [123996.386642][   T92]  posix_acl_chmod+0xc8/0x1c8
> [123996.386669][   T92]  f2fs_setattr+0x5e0/0x6bc
> [123996.386689][   T92]  notify_change+0x4d8/0x580
> [123996.386717][   T92]  chmod_common+0xd8/0x184
> [123996.386748][   T92]  do_fchmodat+0x60/0x124
> [123996.386766][   T92]  __arm64_sys_fchmodat+0x28/0x3c
> 
> Let's take a look at the original issue back.
> 
> Thread A:                                       Thread B:
> -f2fs_getxattr
>     -lookup_all_xattrs
>        -xnid = F2FS_I(inode)->i_xattr_nid;
>                                                  -f2fs_setxattr
>                                                      -__f2fs_setxattr
>                                                          -write_all_xattrs
>                                                              -truncate_xattr_node
>                                                                    ...  ...
>                                                  -write_checkpoint
>                                                                    ...  ...
>                                                  -alloc_nid   <- nid reuse
>            -get_node_page
>                -f2fs_bug_on  <- nid != node_footer->nid

One concern below:

Thread A:					Thread B:
- f2fs_getxattr
  - lookup_all_xattrs
   - read_inline_xattr
    - f2fs_get_node_page(ino)
    - memcpy inline xattr
    - f2fs_put_page
						- f2fs_setxattr
						 - __f2fs_setxattr
						  - __f2fs_setxattr
						   - write_all_xattrs
						    - write xnode and inode
   ---> inline xattr may out of update here.
   - read_xattr_block
    - f2fs_get_node_page(xnid)
    - memcpy xnode xattr
    - f2fs_put_page

Do we need to keep xattr_{get,set} being atomical operation?

Thanks,

> 
> I think we don't need to truncate xattr pages eagerly which introduces lots of
> data races without big benefits.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/f2fs.h  |  1 -
>   fs/f2fs/super.c |  1 -
>   fs/f2fs/xattr.c | 31 ++++++++-----------------------
>   3 files changed, 8 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 3f5b161dd743..7b9af2d51656 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -838,7 +838,6 @@ struct f2fs_inode_info {
>   
>   	/* avoid racing between foreground op and gc */
>   	struct f2fs_rwsem i_gc_rwsem[2];
> -	struct f2fs_rwsem i_xattr_sem; /* avoid racing between reading and changing EAs */
>   
>   	int i_extra_isize;		/* size of extra space located in i_addr */
>   	kprojid_t i_projid;		/* id for project quota */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1b2c788ed80d..c917fa771f0e 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1418,7 +1418,6 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
>   	INIT_LIST_HEAD(&fi->gdirty_list);
>   	init_f2fs_rwsem(&fi->i_gc_rwsem[READ]);
>   	init_f2fs_rwsem(&fi->i_gc_rwsem[WRITE]);
> -	init_f2fs_rwsem(&fi->i_xattr_sem);
>   
>   	/* Will be used by directory only */
>   	fi->i_dir_level = F2FS_SB(sb)->dir_level;
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index 213805d3592c..bdc8a55085a2 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -433,7 +433,7 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	size_t inline_size = inline_xattr_size(inode);
> -	struct page *in_page = NULL;
> +	struct page *in_page = ipage;
>   	void *xattr_addr;
>   	void *inline_addr = NULL;
>   	struct page *xpage;
> @@ -446,29 +446,19 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
>   
>   	/* write to inline xattr */
>   	if (inline_size) {
> -		if (ipage) {
> -			inline_addr = inline_xattr_addr(inode, ipage);
> -		} else {
> +		if (!in_page) {
>   			in_page = f2fs_get_node_page(sbi, inode->i_ino);
>   			if (IS_ERR(in_page)) {
>   				f2fs_alloc_nid_failed(sbi, new_nid);
>   				return PTR_ERR(in_page);
>   			}
> -			inline_addr = inline_xattr_addr(inode, in_page);
>   		}
> +		inline_addr = inline_xattr_addr(inode, in_page);
>   
> -		f2fs_wait_on_page_writeback(ipage ? ipage : in_page,
> -							NODE, true, true);
> -		/* no need to use xattr node block */
> +		f2fs_wait_on_page_writeback(in_page, NODE, true, true);
>   		if (hsize <= inline_size) {
> -			err = f2fs_truncate_xattr_node(inode);
> -			f2fs_alloc_nid_failed(sbi, new_nid);
> -			if (err) {
> -				f2fs_put_page(in_page, 1);
> -				return err;
> -			}
>   			memcpy(inline_addr, txattr_addr, inline_size);
> -			set_page_dirty(ipage ? ipage : in_page);
> +			set_page_dirty(in_page);
>   			goto in_page_out;
>   		}
>   	}
> @@ -502,12 +492,13 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
>   	memcpy(xattr_addr, txattr_addr + inline_size, VALID_XATTR_BLOCK_SIZE);
>   
>   	if (inline_size)
> -		set_page_dirty(ipage ? ipage : in_page);
> +		set_page_dirty(in_page);
>   	set_page_dirty(xpage);
>   
>   	f2fs_put_page(xpage, 1);
>   in_page_out:
> -	f2fs_put_page(in_page, 1);
> +	if (in_page != ipage)
> +		f2fs_put_page(in_page, 1);
>   	return err;
>   }
>   
> @@ -528,10 +519,8 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
>   	if (len > F2FS_NAME_LEN)
>   		return -ERANGE;
>   
> -	f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
>   	error = lookup_all_xattrs(inode, ipage, index, len, name,
>   				&entry, &base_addr, &base_size, &is_inline);
> -	f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
>   	if (error)
>   		return error;
>   
> @@ -565,9 +554,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>   	int error;
>   	size_t rest = buffer_size;
>   
> -	f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
>   	error = read_all_xattrs(inode, NULL, &base_addr);
> -	f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
>   	if (error)
>   		return error;
>   
> @@ -794,9 +781,7 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
>   	f2fs_balance_fs(sbi, true);
>   
>   	f2fs_lock_op(sbi);
> -	f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
>   	err = __f2fs_setxattr(inode, index, name, value, size, ipage, flags);
> -	f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
>   	f2fs_unlock_op(sbi);
>   
>   	f2fs_update_time(sbi, REQ_TIME);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
