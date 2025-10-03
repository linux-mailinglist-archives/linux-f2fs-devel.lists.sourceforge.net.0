Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96EBB5D82
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Oct 2025 05:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFKDYr3LwjboCt6jdAUKHgzAnG+8MHzjd1Ly4P7nvUc=; b=R0StLu/5CCS6VcPAXA9/xHMpTf
	MnO0JM0Be6buiryHPqBjN5ZIyuVGt4chQsHQfd0EZ1VUuW5JW82RqD/Pw3L/tKrBv90wdW35A3RH5
	dJ3ams/okUqbrOtc++SzLW6t8rr4zq5zn2yAj2no25zdSxb1nqcxReEBQQMrviW+04m4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4WGn-0003LJ-W6;
	Fri, 03 Oct 2025 03:15:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v4WGm-0003LC-QV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 03:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7PzGQkg6xtkXSWM+lxYLmMsQEbxT9RCE/8o2TV+piYw=; b=m8i63Q7QEt9gwl5C0n5csf3uWQ
 0fulQGJu3Riq0xs3XJx0Fz7XDwH29N0RE5mAXrFXDule9h/BcMRW9XDVY1MgtCmZUQGyTSyfemsyV
 s9HGObOdsquBM+vuMfn/hhoero73yczt7KypcdfJsXTB1Zf1lTZotuTsUruEyw5y3M4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7PzGQkg6xtkXSWM+lxYLmMsQEbxT9RCE/8o2TV+piYw=; b=Z8ueJnzlGI62CTO2+TqfMnOe+r
 ZfCc8kIuUYYWMXlyiZn8KDqCo1bJz12iTx3m7MtUDganhZmG076cfjgvf5tqGi7PA33xYYc59j2bl
 93LOPjncuRXdU+xtA2BPCpa+8zmemxlKpjGB94U5sDYmwFuZwvo9OFM8i0qUPdn0mqDY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4WGm-0001oW-1A for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 03:15:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AF4B4368D;
 Fri,  3 Oct 2025 03:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCCDC4CEF4;
 Fri,  3 Oct 2025 03:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759461333;
 bh=sk3y8tknfOwTAtWs2x2BOp4Uzd3iFdPo7zrPBdb6P4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ahh9/NqIy7/60+4tECOftLkCVDmack28EU778HdJ8yX5sjjp/DpO567ReWibvG0IM
 g9PK9I/85fRD41KNQMdnhdSoGhQZWY1ixYvsCm4TJRe/XpI2BPqFh1pVdlCsSclxaz
 txICycc584ykAmYE1dmsNZv1Q13UEtw/KdmQE5tHRNqfS7hyroeznLTIm/5xQB5zsY
 Zjjlg0QJpzaQA3ELd0zA8mtaKsVFvyIQSJbL6CryJMYd/dNJRYlWTuU/+NeLxSMtbw
 n6g+88agY4d+EOkJEg5/yPBTULNhtVL716TNYEJeRL8OedayViNByARBhEzv/g+LOG
 4rdTJI+/pkIXQ==
Date: Fri, 3 Oct 2025 03:15:31 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aN8_05vg6Lz1eAkF@google.com>
References: <tencent_3FA2C956B557ED4D050EB26922B50D3CF40A@qq.com>
 <3bdcdb11-2d67-4842-b21c-2b41ce5faea9@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bdcdb11-2d67-4842-b21c-2b41ce5faea9@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/03, Chao Yu wrote: > On 2025/9/30 17:16, Haofeng Li
 wrote: > > From: Haofeng Li <lihaofeng@kylinos.cn> > > > > Fixes a memory
 leak issue in f2fs_move_inline_dirents() where > > the ifolio is not [...]
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
X-Headers-End: 1v4WGm-0001oW-1A
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix ifolio memory leak in
 f2fs_move_inline_dirents error path
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Haofeng Li <lihaofeng@kylinos.cn>, Haofeng Li <13266079573@163.com>,
 linux-kernel@vger.kernel.org, Haofeng Li <920484857@qq.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/03, Chao Yu wrote:
> On 2025/9/30 17:16, Haofeng Li wrote:
> > From: Haofeng Li <lihaofeng@kylinos.cn>
> > 
> > Fixes a memory leak issue in f2fs_move_inline_dirents() where
> > the ifolio is not properly released in certain error paths.
> > 
> > Problem Analysis:
> > - In f2fs_try_convert_inline_dir(), ifolio is acquired via f2fs_get_inode_folio()
> > - When do_convert_inline_dir() fails, the caller expects ifolio to be released
> > - However, in f2fs_move_inline_dirents(), two specific error paths don't release ifolio
> > 
> > Fixes: 201a05be9628a ("f2fs: add key function to handle inline dir")
> > Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> > ---
> >   fs/f2fs/inline.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> > index 58ac831ef704..2496866fc45d 100644
> > --- a/fs/f2fs/inline.c
> > +++ b/fs/f2fs/inline.c
> > @@ -425,7 +425,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
> >   	set_new_dnode(&dn, dir, ifolio, NULL, 0);
> >   	err = f2fs_reserve_block(&dn, 0);
> 
> f2fs_reserve_block() will call f2fs_put_dnode() in its error path, it has
> unlocked & released inode folio?
> 
> >   	if (err)
> > -		goto out;
> > +		goto out_put_ifolio;
> >   	if (unlikely(dn.data_blkaddr != NEW_ADDR)) {
> >   		f2fs_put_dnode(&dn);
> 
> Ditto, or am I missing something?

It seems you're right. Let me drop this patch.

> 
> Thanks,
> 
> > @@ -434,7 +434,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
> >   			  __func__, dir->i_ino, dn.data_blkaddr);
> >   		f2fs_handle_error(F2FS_F_SB(folio), ERROR_INVALID_BLKADDR);
> >   		err = -EFSCORRUPTED;
> > -		goto out;
> > +		goto out_put_ifolio;
> >   	}
> >   	f2fs_folio_wait_writeback(folio, DATA, true, true);
> > @@ -479,6 +479,10 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
> >   out:
> >   	f2fs_folio_put(folio, true);
> >   	return err;
> > +
> > +out_put_ifolio:
> > +	f2fs_folio_put(ifolio, true);
> > +	goto out;
> >   }
> >   static int f2fs_add_inline_entries(struct inode *dir, void *inline_dentry)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
