Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD3E14783D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 06:43:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iurkI-0001J2-5t; Fri, 24 Jan 2020 05:43:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iurkH-0001Iv-Ik
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mFLiWJaLCQ+CW+PIlgpT+PDyeCi9t9TXCuWpjL/IOkc=; b=ccmQwkcumsiEOmkenGMGZooUkb
 /96pW0BsWIrVOgXoA8OZncZT75jBd31m640+GYW8xQZj9LEEUxTj0zT+ufCiQNrNYL9hu1KMBEMVx
 Gef8nQSiApNG3QCs1SnlqhDzo/Yb9Wq165UTr8XFr4zlQt4+Dz00tziaDUdKgKhYr6mY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mFLiWJaLCQ+CW+PIlgpT+PDyeCi9t9TXCuWpjL/IOkc=; b=LRGU5c6+HiwgxzPrdLOwv4olga
 O9JFS8jdRENgIWjyXYgR6DgJeR9XxZrGO9XVOKWIiOgf0RB/zsLNKJx/UszQ3iYwOUgcAY0HUqhzF
 sD3BmVROhgY6air+yxFG8aMm9Yz15hY8M9sqXleNcq3Q6lz2JMrDf2nv8DijBm5p1uig=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iurkG-003J81-0b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 05:43:05 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CEDE2070A;
 Fri, 24 Jan 2020 05:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579844578;
 bh=UtXlQmAwVpIV4UVkULwSxcBxj3f1rwjkrvqd+IMtrm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gHZoFfUfHkbxCFtJeTBNinZ/zDprtq6eg9/MVNYgeL82NiDWUtWTiqMDe4DOtiM70
 xdTFSRWqRr9C87t/SulBsXb/TeI1wl6PGQYgFnLLS8shbSH78TyKf1/Z5uZqqWjwVT
 uWVf1KoxKRFRDgOcVd4Yu4ZLUxDsSDoMNw9deF+8=
Date: Thu, 23 Jan 2020 21:42:56 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gao Xiang <hsiangkao@aol.com>
Message-ID: <20200124054256.GC832@sol.localdomain>
References: <20200124041234.159740-1-ebiggers@kernel.org>
 <20200124050423.GA31271@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200124051601.GB832@sol.localdomain>
 <20200124053415.GC31271@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124053415.GC31271@hsiangkao-HP-ZHAN-66-Pro-G1>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iurkG-003J81-0b
Subject: Re: [f2fs-dev] [PATCH] ext4: fix race conditions in ->d_compare()
 and ->d_hash()
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
Cc: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 24, 2020 at 01:34:23PM +0800, Gao Xiang wrote:
> On Thu, Jan 23, 2020 at 09:16:01PM -0800, Eric Biggers wrote:
> 
> []
> 
> > So we need READ_ONCE() to ensure that a consistent value is used.
> 
> By the way, my understanding is all pointer could be accessed
> atomicly guaranteed by compiler. In my opinion, we generally
> use READ_ONCE() on pointers for other uses (such as, avoid
> accessing a variable twice due to compiler optimization and
> it will break some logic potentially or need some data
> dependency barrier...)
> 
> Thanks,
> Gao Xiang

But that *is* why we need READ_ONCE() here.  Without it, there's no guarantee
that the compiler doesn't load the variable twice.  Please read:
https://github.com/google/ktsan/wiki/READ_ONCE-and-WRITE_ONCE

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
