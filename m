Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B9A526C5C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 May 2022 23:35:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npcwl-0003Np-Dx; Fri, 13 May 2022 21:35:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1npcwk-0003Nj-2m
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 21:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F6fFje3UFA0NGMWqdkluti+XU8nkP8Ba29D9mj2ZrOA=; b=BaibgXfM657Tfg+AuA+4+3X2N5
 TgtCV5E575cFauBLmPB/Ivue7JYreBlv2EoTCzqDvCgomnNm+M5y0xFHCOHFJaURrklkq5fCdCOqG
 jZi4SZhxPIohDlho1GeoXeeSENPyjqDgg3jY81WpmnDhiopwQj0OQz6UOO6HHC1tJeM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F6fFje3UFA0NGMWqdkluti+XU8nkP8Ba29D9mj2ZrOA=; b=ZpDbP0ucioOmYxfSElPUxN49Gw
 mLXdELaXWrcl+DTcN2q71v/Ahww9RVo1iswANnwDO/rVPBbg815tBzGE65SuqKIH+S27F48L7ZEgV
 Pl0yS70u8WxripXDtafJ5YqPDu1BMYfnisJBPI5rhawL3g0yoVE41mC9VVZb6YJYUJ4Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npcwh-00BJTp-2B
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 21:35:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADE3B62314;
 Fri, 13 May 2022 21:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C8BC34100;
 Fri, 13 May 2022 21:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652477729;
 bh=sx2bwmhNQlNyoUz+xU1PiTmPAEPmRqJTm0P57WXd3+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DJ9MRcVyk0DuC8ZEgJ/NpeHw9e2dfL9j7bLUpRS1LLbEm/I5c+hXTtHAQ/EZMTWKn
 XId61mKMQlh0URGFmFeFUYuIAKSsD1jLmlK8sPvKSe+w35h38P2K6Gg56gGY5JDnoi
 8A3T+w3butCj41O3C8K+d0J1sLzR0DrtXlfKzSO2ueLSJbIgndgAwSSCMZbmOLaU5e
 YVO/8kdv7w3wa1T6OxirBN1ZzgvAjikJXDplosn4RgFx7CMB3djzqQ5A0eJgpRHlHs
 ZagQAv83xFg3dHGdn6yVECLElFseCGH1fiZBRFlZkklBgJ5+AYFRDKaWr+ZcsxiAuv
 udiF8nclKlF3A==
Date: Fri, 13 May 2022 14:35:27 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yn7PH6BDBSDtiaZV@google.com>
References: <20220428024940.12102-1-chao@kernel.org>
 <YnLwDx1smguDQ6qC@google.com>
 <173c51c2-eff3-8d76-7041-e9c58024a97e@kernel.org>
 <YnNFCEdSpyVSaTZq@google.com>
 <142acf95-c940-8d4a-7f00-08f1bb816c49@kernel.org>
 <c717cdc3-bb6f-d437-f039-d05418c9dd88@kernel.org>
 <YnlH929igOSi+Iv3@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnlH929igOSi+Iv3@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/09, Jaegeuk Kim wrote: > On 05/08, Chao Yu wrote: >
 > Ping, > > This is in my TODO list, but will take some time. Sorry. Got this.
 sanity_check_inode: inode (ino=1125d, mode=41471) reason(0, 98, 3452, 4,
 0, 0) should not have inline_data, run fsck to fix 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npcwh-00BJTp-2B
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check for inline inode
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
Cc: Ming Yan <yanming@tju.edu.cn>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/09, Jaegeuk Kim wrote:
> On 05/08, Chao Yu wrote:
> > Ping,
> 
> This is in my TODO list, but will take some time. Sorry.

Got this.

sanity_check_inode: inode (ino=1125d, mode=41471) reason(0, 98, 3452, 4, 0, 0) should not have inline_data, run fsck to fix

Ok, this is a symlink, which was encrypted having inline_data.

> 
> > 
> > On 2022/5/5 22:33, Chao Yu wrote:
> > > On 2022/5/5 11:31, Jaegeuk Kim wrote:
> > > > On 05/05, Chao Yu wrote:
> > > > > On 2022/5/5 5:28, Jaegeuk Kim wrote:
> > > > > > On 04/28, Chao Yu wrote:
> > > > > > > As Yanming reported in bugzilla:
> > > > > > > 
> > > > > > > https://bugzilla.kernel.org/show_bug.cgi?id=215895
> > > > > > > 
> > > > > > > I have encountered a bug in F2FS file system in kernel v5.17.
> > > > > > > 
> > > > > > > The kernel message is shown below:
> > > > > > > 
> > > > > > > kernel BUG at fs/inode.c:611!
> > > > > > > Call Trace:
> > > > > > >     evict+0x282/0x4e0
> > > > > > >     __dentry_kill+0x2b2/0x4d0
> > > > > > >     dput+0x2dd/0x720
> > > > > > >     do_renameat2+0x596/0x970
> > > > > > >     __x64_sys_rename+0x78/0x90
> > > > > > >     do_syscall_64+0x3b/0x90
> > > > > > > 
> > > > > > > The root cause is: fuzzed inode has both inline_data flag and encrypted
> > > > > > > flag, so after it was deleted by rename(), during f2fs_evict_inode(),
> > > > > > > it will cause inline data conversion due to flags confilction, then
> > > > > > > page cache will be polluted and trigger panic in clear_inode().
> > > > > > > 
> > > > > > > This patch tries to fix the issue by do more sanity checks for inline
> > > > > > > data inode in sanity_check_inode().
> > > > > > > 
> > > > > > > Cc: stable@vger.kernel.org
> > > > > > > Reported-by: Ming Yan <yanming@tju.edu.cn>
> > > > > > > Signed-off-by: Chao Yu <chao.yu@oppo.com>
> > > > > > > ---
> > > > > > >     fs/f2fs/f2fs.h  | 7 +++++++
> > > > > > >     fs/f2fs/inode.c | 3 +--
> > > > > > >     2 files changed, 8 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > > > > index 27aa93caec06..64c511b498cc 100644
> > > > > > > --- a/fs/f2fs/f2fs.h
> > > > > > > +++ b/fs/f2fs/f2fs.h
> > > > > > > @@ -4173,6 +4173,13 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
> > > > > > >      */
> > > > > > >     static inline bool f2fs_post_read_required(struct inode *inode)
> > > > > > >     {
> > > > > > > +	/*
> > > > > > > +	 * used by sanity_check_inode(), when disk layout fields has not
> > > > > > > +	 * been synchronized to inmem fields.
> > > > > > > +	 */
> > > > > > > +	if (file_is_encrypt(inode) || file_is_verity(inode) ||
> > > > > > > +			F2FS_I(inode)->i_flags & F2FS_COMPR_FL)
> > > > > > > +		return true;
> > > > > > >     	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
> > > > > > >     		f2fs_compressed_file(inode);
> > > > > > >     }
> > > > > > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > > > > > index 83639238a1fe..234b8ed02644 100644
> > > > > > > --- a/fs/f2fs/inode.c
> > > > > > > +++ b/fs/f2fs/inode.c
> > > > > > > @@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
> > > > > > >     		}
> > > > > > >     	}
> > > > > > > -	if (f2fs_has_inline_data(inode) &&
> > > > > > > -			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
> > > > > > > +	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode)) {
> > > > > > 
> > > > > > It seems f2fs_may_inline_data() is breaking the atomic write case. Please fix.
> > > > > 
> > > > > sanity_check_inode() change only affect f2fs_iget(), during inode initialization,
> > > > > file should not be set as atomic one, right?
> > > > > 
> > > > > I didn't see any failure during 'f2fs_io write atomic_write' testcase... could you
> > > > > please provide me detail of the testcase?
> > > > 
> > > > I just applied this into my device and was getting lots of the below error
> > > > messages resulting in open failures of database files.
> > > 
> > > Could you please help to apply below patch and dump the log?
> > > 
> > > From: Chao Yu <chao@kernel.org>
> > > Subject: [PATCH] f2fs: fix to do sanity check for inline inode
> > > 
> > > Signed-off-by: Chao Yu <chao.yu@oppo.com>
> > > ---
> > >    fs/f2fs/f2fs.h  |  7 +++++++
> > >    fs/f2fs/inode.c | 11 +++++++----
> > >    2 files changed, 14 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index 0f8c426aed50..13a9212d6cb6 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -4159,6 +4159,13 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
> > >     */
> > >    static inline bool f2fs_post_read_required(struct inode *inode)
> > >    {
> > > +	/*
> > > +	 * used by sanity_check_inode(), when disk layout fields has not
> > > +	 * been synchronized to inmem fields.
> > > +	 */
> > > +	if (file_is_encrypt(inode) || file_is_verity(inode) ||
> > > +			F2FS_I(inode)->i_flags & F2FS_COMPR_FL)
> > > +		return true;
> > >    	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
> > >    		f2fs_compressed_file(inode);
> > >    }
> > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > index 02630c17da93..a98614a24ad0 100644
> > > --- a/fs/f2fs/inode.c
> > > +++ b/fs/f2fs/inode.c
> > > @@ -276,11 +276,14 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
> > >    		}
> > >    	}
> > > 
> > > -	if (f2fs_has_inline_data(inode) &&
> > > -			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
> > > +	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode)) {
> > >    		set_sbi_flag(sbi, SBI_NEED_FSCK);
> > > -		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
> > > -			  __func__, inode->i_ino, inode->i_mode);
> > > +		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) reason(%d, %llu, %ld, %d, %d, %lu) should not have inline_data, run fsck to fix",
> > > +			  __func__, inode->i_ino, inode->i_mode,
> > > +			  f2fs_is_atomic_file(inode),
> > > +			  i_size_read(inode), MAX_INLINE_DATA(inode),
> > > +			  file_is_encrypt(inode), file_is_verity(inode),
> > > +			  F2FS_I(inode)->i_flags & F2FS_COMPR_FL);
> > >    		return false;
> > >    	}
> > > 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
