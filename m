Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C4251B698
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 May 2022 05:31:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmSDJ-0002BK-Fp; Thu, 05 May 2022 03:31:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nmSDI-0002BE-Ih
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 May 2022 03:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bv5kdC5oT7s+zX8kQLqv+N/CLrcxGuqi8eX2iAcd8vg=; b=V8HxpRwrINHWVRdUotaJj9SIvl
 rjCCVF7bLBDcPCtXcBK1KxEccaMrdSltV+NjPd+h45WjetFAINkA3iWbLB6VdCt9fg0hP4lCGibLT
 s6PTg8astmN8oZDIl7pQw5FpJoYDD6gFja7YMcUPgKTi2D0uT9o1/rkBBQf1JkG1hKHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bv5kdC5oT7s+zX8kQLqv+N/CLrcxGuqi8eX2iAcd8vg=; b=RziUggTjoIEZHjQ3KRSel2MNYj
 HcHTIsaF6igGpb4Sz39OHN675YOeQTAe4R19G6dnzW67KQxntXIV9c+711IyXUfQGMqT1kDnKFjQ7
 UeH4nIYdwWA4DDOA7IEq/hfaJ5QehoSvDNXZ3002dZPI6sQIb3ix1/JHLGq3Z53Z1rSk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmSDH-0008DC-Um
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 May 2022 03:31:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86A8661949;
 Thu,  5 May 2022 03:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF665C385A4;
 Thu,  5 May 2022 03:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651721482;
 bh=IV3Mf95tV8RyHlUqSjHikLwYM8HbN6LL9XwPEkV1Fvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ftjzWD5NQavEZdwSc9mBnUJzli9C/rymLutCH7nfMwdOaa2x7QKMh1SrOKmQo2qGI
 fke1S4GddSirPfEDSgYIwN8ZlGK6hEV8FL4bWb4a2JXB62p/KUFQwSsmb1i5n9LAKu
 zF7rt3YbTY6/jEo3D4+NihJIyx8Nvha/7KASPCGxewc04KBV46kLabFQvqbkv4hq/D
 hYTJJN6uv12HjxCvkNO6+R5gJzvtI8GcO4J/sSA8mtCGlqyfMrowSVerNlBL8DulO1
 gvK0DQE7EJFvP6HsEYJw8FHamZRsCbxEVAi+4OCrXzldTI9a3WWPRKkwxbok3rlT6J
 ozjTpY2cKN9uw==
Date: Wed, 4 May 2022 20:31:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YnNFCEdSpyVSaTZq@google.com>
References: <20220428024940.12102-1-chao@kernel.org>
 <YnLwDx1smguDQ6qC@google.com>
 <173c51c2-eff3-8d76-7041-e9c58024a97e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <173c51c2-eff3-8d76-7041-e9c58024a97e@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/05, Chao Yu wrote: > On 2022/5/5 5:28,
 Jaegeuk Kim wrote:
 > > On 04/28, Chao Yu wrote: > > > As Yanming reported in bugzilla: > > >
 > > > https://bugzilla.kernel.org/show_bug.cgi?id=215895 > > > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nmSDH-0008DC-Um
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

On 05/05, Chao Yu wrote:
> On 2022/5/5 5:28, Jaegeuk Kim wrote:
> > On 04/28, Chao Yu wrote:
> > > As Yanming reported in bugzilla:
> > > 
> > > https://bugzilla.kernel.org/show_bug.cgi?id=215895
> > > 
> > > I have encountered a bug in F2FS file system in kernel v5.17.
> > > 
> > > The kernel message is shown below:
> > > 
> > > kernel BUG at fs/inode.c:611!
> > > Call Trace:
> > >   evict+0x282/0x4e0
> > >   __dentry_kill+0x2b2/0x4d0
> > >   dput+0x2dd/0x720
> > >   do_renameat2+0x596/0x970
> > >   __x64_sys_rename+0x78/0x90
> > >   do_syscall_64+0x3b/0x90
> > > 
> > > The root cause is: fuzzed inode has both inline_data flag and encrypted
> > > flag, so after it was deleted by rename(), during f2fs_evict_inode(),
> > > it will cause inline data conversion due to flags confilction, then
> > > page cache will be polluted and trigger panic in clear_inode().
> > > 
> > > This patch tries to fix the issue by do more sanity checks for inline
> > > data inode in sanity_check_inode().
> > > 
> > > Cc: stable@vger.kernel.org
> > > Reported-by: Ming Yan <yanming@tju.edu.cn>
> > > Signed-off-by: Chao Yu <chao.yu@oppo.com>
> > > ---
> > >   fs/f2fs/f2fs.h  | 7 +++++++
> > >   fs/f2fs/inode.c | 3 +--
> > >   2 files changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index 27aa93caec06..64c511b498cc 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -4173,6 +4173,13 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
> > >    */
> > >   static inline bool f2fs_post_read_required(struct inode *inode)
> > >   {
> > > +	/*
> > > +	 * used by sanity_check_inode(), when disk layout fields has not
> > > +	 * been synchronized to inmem fields.
> > > +	 */
> > > +	if (file_is_encrypt(inode) || file_is_verity(inode) ||
> > > +			F2FS_I(inode)->i_flags & F2FS_COMPR_FL)
> > > +		return true;
> > >   	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
> > >   		f2fs_compressed_file(inode);
> > >   }
> > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > index 83639238a1fe..234b8ed02644 100644
> > > --- a/fs/f2fs/inode.c
> > > +++ b/fs/f2fs/inode.c
> > > @@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
> > >   		}
> > >   	}
> > > -	if (f2fs_has_inline_data(inode) &&
> > > -			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
> > > +	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode)) {
> > 
> > It seems f2fs_may_inline_data() is breaking the atomic write case. Please fix.
> 
> sanity_check_inode() change only affect f2fs_iget(), during inode initialization,
> file should not be set as atomic one, right?
> 
> I didn't see any failure during 'f2fs_io write atomic_write' testcase... could you
> please provide me detail of the testcase?

I just applied this into my device and was getting lots of the below error
messages resulting in open failures of database files.

> 
> Thanks,
> 
> > 
> > >   		set_sbi_flag(sbi, SBI_NEED_FSCK);
> > >   		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
> > >   			  __func__, inode->i_ino, inode->i_mode);
> > > -- 
> > > 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
