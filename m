Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75648784ED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 08:27:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrz8J-0005ov-1d; Mon, 29 Jul 2019 06:27:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hrz8I-0005oj-EE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 06:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AttUOLAfPmqgIuiljyA3sVuTUv41ruq2gn5OJLHE1zY=; b=Q2/6XkIlqxooNX2OEzP13f09X+
 SXkSLmCdfCyD1Xd+jJs1DAM5xqfkTLY+U5fxZ47nd4p56rRs9oAYt89qe0zClyiYNIU3a5CBgkq+n
 zPVdPBTEbSR8Z0HxAFT3j9too3s1AKvg4+/BOZmJVf7dQUl02rU9kgEG5uW00/R/10PA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AttUOLAfPmqgIuiljyA3sVuTUv41ruq2gn5OJLHE1zY=; b=UIiRqQPGEBL2m7GhU3+QC9HNdE
 rjjZ8ACEFveAAM0utH0IqmzXIpmJ9w6iL/JKx/PnOlwhgrlEr5TD8OcmtxcuABUutQ1GYB7TF/SEo
 ADfRe6dsUVCgxZc2wSXaP0oAoHLodv4zoKylcaQfLNDXy4H+8X3FWYpB7X77BSquwVbA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrz8H-002fCR-BF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 06:27:42 +0000
Received: from localhost (c-98-234-77-170.hsd1.ca.comcast.net [98.234.77.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE1F22070B;
 Mon, 29 Jul 2019 06:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564381655;
 bh=eEx0tfy6aPFIS7G1N250q6V4oZYc59T12k/6VuKoVPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i/PDpCLZZOp8JsopUOk6P8DZ7g88WXGcbHCTZIrlJ9+HsEBtD2PZKtLN5faIawQqp
 ym4H3iLdi1MdrcnRAPmHy+2PffkZK4DULhZ6nmD+2Rq+INEuK9ELmzckGZLUKO5s/2
 ucU5Zl66a0LGwL1OX/O3CbMJ2aJr1w+0U2k8I3L8=
Date: Sun, 28 Jul 2019 23:27:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190729062735.GA98839@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190723230529.251659-1-drosen@google.com>
 <20190723230529.251659-4-drosen@google.com>
 <9362e4ed-2be8-39f5-b4d9-9c86e37ab993@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9362e4ed-2be8-39f5-b4d9-9c86e37ab993@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hrz8H-002fCR-BF
Subject: Re: [f2fs-dev] [PATCH v4 3/3] f2fs: Support case-insensitive file
 name lookups
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
Cc: Jonathan Corbet <corbet@lwn.net>, Daniel Rosenberg <drosen@google.com>,
 linux-doc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/28, Chao Yu wrote:
> On 2019-7-24 7:05, Daniel Rosenberg via Linux-f2fs-devel wrote:
> >  /* Flags that are appropriate for regular files (all but dir-specific ones). */
> >  #define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL))
> 
> We missed to add F2FS_CASEFOLD_FL here to exclude it in F2FS_REG_FLMASK.

Applied.

> 
> > @@ -1660,7 +1660,16 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> >  		return -EPERM;
> >  
> >  	oldflags = fi->i_flags;
> > +	if ((iflags ^ oldflags) & F2FS_CASEFOLD_FL) {
> > +		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
> > +			return -EOPNOTSUPP;
> > +
> > +		if (!S_ISDIR(inode->i_mode))
> > +			return -ENOTDIR;
> >  
> > +		if (!f2fs_empty_dir(inode))
> > +			return -ENOTEMPTY;
> > +	}

Modified like this:
@@ -1665,6 +1665,13 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
        if (IS_NOQUOTA(inode))
                return -EPERM;

+       if ((iflags ^ fi->i_flags) & F2FS_CASEFOLD_FL) {
+               if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
+                       return -EOPNOTSUPP;
+               if (!f2fs_empty_dir(inode))
+                       return -ENOTEMPTY;
+       }
+

Note that, directory is checked by above change.

I've uploaded in f2fs.git, so could you check it out and test a bit?

Thanks,

> 
> I applied the patches based on last Jaegeuk's dev branch, it seems we needs to
> adjust above code a bit. Otherwise it looks good to me.
> 
> BTW, it looks the patchset works fine with generic/556 testcase.
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
