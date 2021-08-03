Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F0B3DE3F6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Aug 2021 03:25:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAjBO-00028n-FS; Tue, 03 Aug 2021 01:25:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mAjBM-00028Y-U6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Aug 2021 01:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w5VTUvIU2QSLvLVurqmNxMyRnox+U+YUo9mAt5vJ/hw=; b=GoWWbINFeIahBpdnlr4Xj44vJq
 1TcbT3cltj+va1lWcNK8yajkaP5mjrR1gS7jcIMtMZ4M2Syub+AtlD7u9wyErekt2xRJyXHAmq7Rx
 iMvKcLlTxnyuoyWZaBfz2H8jzTE+H5f2Mj4aBmAZxl6W5U0wgmE0GcdpQHF9zfk9F04U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w5VTUvIU2QSLvLVurqmNxMyRnox+U+YUo9mAt5vJ/hw=; b=b9Ui+CJ2Oo6FXXq82tiAfKUvGG
 btnRrUrkLKfhvbw/CM61qm01Apkxz3dZtMH0+inLSGqyvz0i3u72IwCBR85KVTamK0oaQ/CDDk4yJ
 +u9e2yaiW0PjibGrFtJqM7Kn9h+H+OHXu2JkBJtVaXddUXs+JIH9EpJlVe+eQzP6RIv4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAjBG-00AhF1-8G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Aug 2021 01:25:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A57160FC4;
 Tue,  3 Aug 2021 01:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627953910;
 bh=DJFbQz8pBMO15mtnbbjzTE0d/buN7m/N36mMycitwDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YOF1SBM0NbV/Iyx/47TT4L7doisVwJuR0LGj5z+3SoKIsUrrfI+PiiOIuvri060sh
 oI75PECkeugm7ZVVhaX+PU0I1Qub4uXQsxMcNCPr4dTIJqEZD45RMotL0giSjUoCEs
 0zmUtRUC9QatSCfSNyEIyIsrcMqxmbCF774cwVscWl64adimK7IL7ZPNI8QKS6LoVC
 paqX9vFz7Qa9FBsW0bFJtN6YJbAtJitXTDCxI8y1sM0Cnh2Q4qq6NPaI+guQg6Wc2A
 mKPqX1emEYuGZJusLy8lyiGMdFgTLFaJpOYhqYdOmzfhO4pDUumchgLkyqzrb1vTXC
 a0uXP7n+9Vv8g==
Date: Mon, 2 Aug 2021 18:25:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YQia9FBvQIRgr6cm@google.com>
References: <20210707015815.1978-1-chao@kernel.org>
 <YQRQ4kHvdRTBnb10@google.com>
 <51565c85-a475-bcb8-bbb2-e3125c5223a3@kernel.org>
 <YQgziuikMr0fvlT7@google.com>
 <3256dc39-2a82-cb60-038b-69e262c32d18@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3256dc39-2a82-cb60-038b-69e262c32d18@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mAjBG-00AhF1-8G
Subject: Re: [f2fs-dev] [RFC NO MERGE] f2fs: extent cache: support unaligned
 extent
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/03, Chao Yu wrote:
> On 2021/8/3 2:03, Jaegeuk Kim wrote:
> > On 08/01, Chao Yu wrote:
> > > On 2021/7/31 3:20, Jaegeuk Kim wrote:
> > > > On 07/07, Chao Yu wrote:
> > > > > Currently, it only works in readonly format f2fs image.
> > > 
> > > There wouldn't be any race condition because unaligned extent only works
> > > for ro feature now?
> > 
> > Isn't your patch proposing on writable partition?
> 
> Please check description in patch message, now it was designed only for
                                                 --
                                                 what do you refer "it"?

> compression case w/ ro feature, let's check and support rw partition later.

Quite confused the patch description and code changes as well. You added some
change with this as well which is for RW.

+       if (is_inode_flag_set(dn->inode, FI_COMPRESSED_FILE) &&
+                       !f2fs_sb_has_readonly(sbi)) {

> 
> Thanks,
> 
> > 
> > > 
> > > > Is there any race condition between the address in extent_cache and the one in
> > > > dnode? I feel that we could synchronize it by locking its dnode block.
> > > 
> > > Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
