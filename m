Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEB3A740CF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 23:28:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txvhb-0002a3-5A;
	Thu, 27 Mar 2025 22:27:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1txvha-0002Zx-AS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 22:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BQLhRRUns0wvtK+tj9shAxMJqCW3FhfLqBKTfUps+yE=; b=OMdGo3JmVTOGiYF2oFnPmU9XnR
 AYqQ66e+RNmTN99JYrC8PWJc8KVDBwwq6TwG2XrvBMcbUNFrF+7g+ub9hgOFzyTrytVi3cwFluPhg
 tcsZYaRiThm7R/oqA5nitTDKhg+KGnUZIrk6xf9U0JI9xnqgXKfRZsumwGl3vnJToL8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BQLhRRUns0wvtK+tj9shAxMJqCW3FhfLqBKTfUps+yE=; b=i22dCaqUlFPMQesqDSX3aJbTPL
 uSxyHoCF+PaeQyDvEHwI6Eh2kW2rcThX7Sl1hwQYZ8hlR3QQzkd4zMYm5NLXm0jDjrTVhvnEnkjtb
 QN/ov3Za1IJ4ajtMX4nMFef/kCR7Idrf+GCCbFJbZ5kdlBROATZYMUWXu6Oa+s0vfnhU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txvhZ-0004ov-Gw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 22:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AE1276113B;
 Thu, 27 Mar 2025 22:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4EAC4CEDD;
 Thu, 27 Mar 2025 22:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743114462;
 bh=FzIjcx9dBnfY4ctyzoIH3XwzJbef24djr7Tb+00ZDJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ppS7nWzqshJOtPe5St3wFnGfv9q45JbWKKvTn5/5mr7PaBtQ4goFI/XReyZxQZtOT
 g8QOonmhqMCFDEhPyran1KmrG60CzHIaZpT9kHt+W3qNOmCgh/WywpMEDn9Fz74v2V
 /LS7v1BzOgeRJk5BSvpihlI81ZTkK9EObGaiFzfwwir9jEC8o+8Rbwe6yFwkz3gGW2
 /x56F57URYEaWr9Dd2BeGeOaajlAHU6hQfsPEgRL4CnB0fSSljPULzhU2f7nTKRkOZ
 cCmrJ02Kc4XRH8Yo37xgsIWiiVV0P53R3LjkWQs9r05lmZQr096HYCr1cWrCVGpoJL
 C1k8BEDzdVxJA==
Date: Thu, 27 Mar 2025 22:27:40 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Z-XQ3NFrfi2-bd3U@google.com>
References: <20250307182151.3397003-1-willy@infradead.org>
 <174172263873.214029.5458881997469861795.git-patchwork-notify@kernel.org>
 <Z9DSym8c9h53Xmr8@casper.infradead.org>
 <Z9Dh4UL7uTm3cQM3@google.com>
 <Z9RR2ubkS9CafUdE@casper.infradead.org>
 <Z9Shx72mSqnQxCh3@google.com>
 <Z-N2hsKd2NJeNiKN@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z-N2hsKd2NJeNiKN@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/26, Matthew Wilcox wrote: > On Fri, Mar 14, 2025 at
 09:38:15PM +0000, Jaegeuk Kim wrote: > > On 03/14, Matthew Wilcox wrote: >
 > > Unfortunately, I thnk I have to abandon this effort. It's only [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txvhZ-0004ov-Gw
Subject: Re: [f2fs-dev] [PATCH 0/4] f2fs: Remove uses of writepage
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/26, Matthew Wilcox wrote:
> On Fri, Mar 14, 2025 at 09:38:15PM +0000, Jaegeuk Kim wrote:
> > On 03/14, Matthew Wilcox wrote:
> > > Unfortunately, I thnk I have to abandon this effort.  It's only going
> > > to make supporting large folios harder (ie there would then need to be
> > > an equivalently disruptive series adding support for large folios).
> > > 
> > > The fundamental problem is that f2fs has no concept of block size !=
> > > PAGE_SIZE.  So if you create a filesystem on a 4kB PAGE_SIZE kernel,
> > > you can't mount it on a 16kB PAGE_SIZE kernel.  An example:
> > > 
> > > int f2fs_recover_inline_xattr(struct inode *inode, struct page *page)
> > > {
> > >         struct f2fs_inode *ri;
> > >         ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
> > >         ri = F2FS_INODE(page);
> > > 
> > > so an inode number is an index into the filesystem in PAGE_SIZE units,
> > > not in filesystem block size units.  Fixing this is a major effort, and
> > > I lack the confidence in my abilities to do it without breaking anything.
> > > 
> > > As an outline of what needs to happen, I think that rather than passing
> > > around so many struct page pointers, we should be passing around either
> > > folio + offset, or we should be passing around struct f2fs_inode pointers.
> > > My preference is for the latter.  We can always convert back to the
> > > folio containing the inode if we need to (eg to mark it dirty) and it
> > > adds some typesafety by ensuring that we're passing around pointers that
> > > we believe belong to an inode and not, say, a struct page which happens
> > > to contain a directory entry.
> > > 
> > > This is a monster task, I think.  I'm going to have to disable f2fs
> > > from testing with split page/folio.  This is going to be a big problem
> > > for Android.
> > 
> > I see. fyi; in Android, I'm thinking to run 16KB page kernel with 16KB format
> > natively to keep block_size = PAGE_SIZE. Wasn't large folio to support a set
> > of pages while keeping block_size = PAGE_SIZE?
> 
> Oh, I think I do see a possible argument for continuing this work.
> 
> If we have an f2fs filesystem with a 16kB block size, we can use order-0
> folios with a 16kB PAGE_SIZE kernel, and if we want to mount it on a
> kernel with a 4kB PAGE_SIZE kernel, then we can use order-2 folios to
> do that.
> 
> Is that a useful improvement to f2fs?  It's not really the intent of
> large folios; it's supposed to be used to support arbitrary order folios.
> But we have all the pieces in place such that we could tell the page
> cache min-order = max-order = 2.

It may be helpful in case where someone wants to try 4KB page kernel back,
after Android ships 16KB page/block products. Does it require a big surgery?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
