Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C870682C8C9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 02:32:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOSt4-0001gw-Dn;
	Sat, 13 Jan 2024 01:32:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rOSt3-0001gq-Nq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 01:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fuIgvipIk+TrqlKc4aH6hPEPb6kz1GxYVhTZBcCZT4E=; b=BN0THBlIQGLKNolEKG5eqTjw2p
 B4QgJxxMrbhJkiM3I6Id2g4kLE+jWt0JzMcgeQh2M63o9IuK0VP9zoddJmHueri1dhfTbDPo07TFF
 L2GgAS6HfW27Fv1ckW/fZFPpYDUAskPgCOuW8shILNmmtlH4PBnIdfqvTadAZV0FVTxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fuIgvipIk+TrqlKc4aH6hPEPb6kz1GxYVhTZBcCZT4E=; b=X5LRAgB/jOmDXHltotTgs5bdHz
 mdZTutbfLaDqPKqiNopn9ZF/fIM9G9i1xfQgn2c2O/ZtsszoV9sW2QiELP/b1tIljxDmvaa/JNu/E
 BGQL9mdeiN67qkpeWct2eoZVa+lsNZ8pmz4kUV9iPobInjgg7AOqXf1CDg0AcM5eSE10=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOSt2-0007CX-Da for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 01:32:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AA2B2B8235E;
 Sat, 13 Jan 2024 01:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E054DC433F1;
 Sat, 13 Jan 2024 01:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705109545;
 bh=zms05XbPtiWQSjgNbT4Hk4ahueRQsyvUh2ZMlMAK9bA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eppEFryAK7fJTRqr9kpAWdU67HJfntqiD6uQFgwgtiOP1qidtQdtkgzoAlyxiVr3e
 xZWACLrS8JVCUEowEYOrDdJZyDwY6zpMbsbweTdaq1rsVbLfZCFbVJQ4n25LGQuegu
 OP5RNYdZsw0aGUS/+K4cr7ia/4Cm6YOvY1iOvTDhoXcLlBpRzVVvdWGZSj1pxHEidp
 mQR6f6+0DHigmwa5mraNaflqNjmqoqczfxijU50HDChgJ3rm6rQZxb+a9Yzk9PTNsW
 8LFrzJ9Ieh8pH65wlFlojygfpTReNDMpoLPRHaUd3rL/j12ktT+DvCZoKkUSidF13T
 G7AWn5cunNVCQ==
Date: Fri, 12 Jan 2024 17:32:23 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20240113013223.GA40156@sol.localdomain>
References: <20240113005031.GA1147@sol.localdomain>
 <20240113005747.38887-1-ebiggers@kernel.org>
 <20240113010118.GB1147@sol.localdomain>
 <ZaHnPyZeJPtsJQKF@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZaHnPyZeJPtsJQKF@google.com>
X-Spam-Score: -4.6 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 12, 2024 at 05:28:31PM -0800, Jaegeuk Kim wrote:
 > On 01/12, Eric Biggers wrote: > > On Fri, Jan 12, 2024 at 04:57:47PM -0800, 
 Eric Biggers wrote: > > > From: Eric Biggers <ebiggers@google [...] 
 Content analysis details:   (-4.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOSt2-0007CX-Da
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix double free of f2fs_sb_info
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
Cc: syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com,
 linux-fscrypt@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 12, 2024 at 05:28:31PM -0800, Jaegeuk Kim wrote:
> On 01/12, Eric Biggers wrote:
> > On Fri, Jan 12, 2024 at 04:57:47PM -0800, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > kill_f2fs_super() is called even if f2fs_fill_super() fails.
> > > f2fs_fill_super() frees the struct f2fs_sb_info, so it must set
> > > sb->s_fs_info to NULL to prevent it from being freed again.
> > > 
> > > Fixes: 275dca4630c1 ("f2fs: move release of block devices to after kill_block_super()")
> > > Reported-by: syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com
> > > Closes: https://lore.kernel.org/r/0000000000006cb174060ec34502@google.com
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > 
> > Jaegeuk, I'd be glad to take this through the fscrypt tree since that's where my
> 
> Ok, are you heading to push this in -rc1?
> 
> > broken commit came from.  But let me know if you want to just take this through
> > the f2fs tree.
> > 

Yes, we should get this into -rc1.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
