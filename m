Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BCE2EC66E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Jan 2021 23:57:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxHkM-00064o-E4; Wed, 06 Jan 2021 22:57:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kxHkK-00064f-8P
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jan 2021 22:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7wGi83LwIOhbIoWol+i6UOB5pa8v+ef6GGNLV5Lq8dQ=; b=OGp1E8PBY4qXrTU6MIiKnG2FXS
 aX7fkBfBUxB5V5c5meq978jtZjNnPuPOMtNn8CpqUDl1rM+hjAmlYBO8YFrLQbBzHea62s0MBKEJq
 7hgzIqCc0T3YLY1LOx2nRKi1Lqxt9n/RHItNJWIFGOR4orKGaQd4TxEGWH6mULnZFV94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7wGi83LwIOhbIoWol+i6UOB5pa8v+ef6GGNLV5Lq8dQ=; b=ZnGCUqPOR3DM+VY47VZxh1z1jN
 +qPw6Qzexn2R5BlLebnWkw6N+8enAgHHAGgbrErTgF0c01Q73mfHqiTiYRRS64Moyy3NZV6ruKIYG
 p2tNVBugVAOGbJ/G1/EKdIWHw315/ACD2EZFLz0CsHV1ndk2nBzrf3kPA8EiVuPg09QE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxHk7-000BCt-DX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jan 2021 22:57:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 081FC23158;
 Wed,  6 Jan 2021 22:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609973837;
 bh=HagOfnxHv14aYZJzvyeyqqpOBa/jOzBmTN01NxJeKA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgqwyciRDfzG8aotUMcOrV9GmUi42pSr9zHKb+ogU/u6ZDcQyIZt6iHm3YPKE23lf
 AibxqQAZhEBhiwiakdrCE63H58OAoAv7qTj9+/cPSnCGrgxlqUXphD02xxGCypOMkh
 ijy2+lUKhnR4NKd5rNiCx7Lu/U6LbmWTYtX0YHuuK6TlmTwfl5RGVySAiXqrAItEm3
 NOaeZizRp6vwktlGjhKtLucj+KYm3qAxuA1h3LpLgj7y15Dxmb9nnXR72eT5CSO6yZ
 mmwq1qbVyCUGlhqOHAiXBmKE78rmgRFSlbE7SRXUac92jsShRiG3SgvW91OjY2+IUH
 7z7PDUWfOgMGA==
Date: Wed, 6 Jan 2021 14:57:15 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X/ZAS6oyFiudshe2@google.com>
References: <20201230075557.108818-1-yuchao0@huawei.com>
 <X/Y5pJr4Aaf0bBqj@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/Y5pJr4Aaf0bBqj@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kxHk7-000BCt-DX
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to keep isolation of atomic
 write
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/06, Jaegeuk Kim wrote:
> Hi Chao,
> 
> With a quick test, this patch causes down_write failure resulting in blocking
> process. I didn't dig in the bug so, please check the code again. :P

nvm. I can see it works now.

> 
> On 12/30, Chao Yu wrote:
> > ThreadA					ThreadB
> > - f2fs_ioc_start_atomic_write
> > - write
> > - f2fs_ioc_commit_atomic_write
> >  - f2fs_commit_inmem_pages
> >  - f2fs_drop_inmem_pages
> >  - f2fs_drop_inmem_pages
> >   - __revoke_inmem_pages
> > 					- f2fs_vm_page_mkwrite
> > 					 - set_page_dirty
> > 					  - tag ATOMIC_WRITTEN_PAGE and add page
> > 					    to inmem_pages list
> >   - clear_inode_flag(FI_ATOMIC_FILE)
> > 					- f2fs_vm_page_mkwrite
> > 					  - set_page_dirty
> > 					   - f2fs_update_dirty_page
> > 					    - f2fs_trace_pid
> > 					     - tag inmem page private to pid
> > 					- truncate
> > 					 - f2fs_invalidate_page
> > 					 - set page->mapping to NULL
> > 					  then it will cause panic once we
> > 					  access page->mapping
> > 
> > The root cause is we missed to keep isolation of atomic write in the case
> > of commit_atomic_write vs mkwrite, let commit_atomic_write helds i_mmap_sem
> > lock to avoid this issue.
> > 
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> > v2:
> > - use i_mmap_sem to avoid mkwrite racing with below flows:
> >  * f2fs_ioc_start_atomic_write
> >  * f2fs_drop_inmem_pages
> >  * f2fs_commit_inmem_pages
> > 
> >  fs/f2fs/file.c    | 3 +++
> >  fs/f2fs/segment.c | 7 +++++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 4e6d4b9120a8..a48ec650d691 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -2050,6 +2050,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> >  		goto out;
> >  
> >  	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> > +	down_write(&F2FS_I(inode)->i_mmap_sem);
> >  
> >  	/*
> >  	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
> > @@ -2060,6 +2061,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> >  			  inode->i_ino, get_dirty_pages(inode));
> >  	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
> >  	if (ret) {
> > +		up_write(&F2FS_I(inode)->i_mmap_sem);
> >  		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> >  		goto out;
> >  	}
> > @@ -2073,6 +2075,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> >  	/* add inode in inmem_list first and set atomic_file */
> >  	set_inode_flag(inode, FI_ATOMIC_FILE);
> >  	clear_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
> > +	up_write(&F2FS_I(inode)->i_mmap_sem);
> >  	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> >  
> >  	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index d8570b0359f5..dab870d9faf6 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -327,6 +327,8 @@ void f2fs_drop_inmem_pages(struct inode *inode)
> >  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> >  	struct f2fs_inode_info *fi = F2FS_I(inode);
> >  
> > +	down_write(&F2FS_I(inode)->i_mmap_sem);
> > +
> >  	while (!list_empty(&fi->inmem_pages)) {
> >  		mutex_lock(&fi->inmem_lock);
> >  		__revoke_inmem_pages(inode, &fi->inmem_pages,
> > @@ -344,6 +346,8 @@ void f2fs_drop_inmem_pages(struct inode *inode)
> >  		sbi->atomic_files--;
> >  	}
> >  	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
> > +
> > +	up_write(&F2FS_I(inode)->i_mmap_sem);
> >  }
> >  
> >  void f2fs_drop_inmem_page(struct inode *inode, struct page *page)
> > @@ -467,6 +471,7 @@ int f2fs_commit_inmem_pages(struct inode *inode)
> >  	f2fs_balance_fs(sbi, true);
> >  
> >  	down_write(&fi->i_gc_rwsem[WRITE]);
> > +	down_write(&F2FS_I(inode)->i_mmap_sem);
> >  
> >  	f2fs_lock_op(sbi);
> >  	set_inode_flag(inode, FI_ATOMIC_COMMIT);
> > @@ -478,6 +483,8 @@ int f2fs_commit_inmem_pages(struct inode *inode)
> >  	clear_inode_flag(inode, FI_ATOMIC_COMMIT);
> >  
> >  	f2fs_unlock_op(sbi);
> > +
> > +	up_write(&F2FS_I(inode)->i_mmap_sem);
> >  	up_write(&fi->i_gc_rwsem[WRITE]);
> >  
> >  	return err;
> > -- 
> > 2.29.2
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
