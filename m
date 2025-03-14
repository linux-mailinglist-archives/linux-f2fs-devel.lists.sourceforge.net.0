Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6288A61E4A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Mar 2025 22:38:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ttCje-0003JR-GZ;
	Fri, 14 Mar 2025 21:38:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ttCjd-0003JJ-PB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 21:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=52kMjaFTz2ki83l5oxeZPwzTGe8Hl7aACtzIdIBZkWE=; b=dlv1cmPlSqpt/QBM/6YGvCy9e0
 Q8bjbwqhNWVgycLmwNcgUmx4S7gWSWz66G4x6Wxq/IWQnpwv2XvlZmTz8fGf0Qv6Tn2QOIftgJ7+2
 M/on8zQfK8d1igFi3i98QeESbKqPMQ6sWKasD3s96GuGN0p5usYj7j7la2cQWKE7aZtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=52kMjaFTz2ki83l5oxeZPwzTGe8Hl7aACtzIdIBZkWE=; b=FfonzY45JvTjJDzS2/QKGDExWw
 GHEQpOIKzog1/z/+X5HB0NnUioclSWrLwm5lDX3n3EpXbPa7iGvGQbQSKbwRev5ev7IcQ1iyGT3j2
 p0daUatDrpmGCiobwSgGPEf6urdQVMtS4B6GiEXjeaODGoRdF364eAPHwRstdYyeHL7s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ttCjX-0005Dv-EF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 21:38:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74D4E5C04C4;
 Fri, 14 Mar 2025 21:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C66C4CEE3;
 Fri, 14 Mar 2025 21:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741988297;
 bh=IRXjJzAr7EsTIKu9jsqdnzEQqA3yrEBhqvwHTh/5aWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DpdZwmGx7956G3KCAXqk7wnSE0jR0t0HLGZUQcxQppEPPNRD5Lf4RqNN7iHC9egwY
 9NPv0hTBAUeeADxwlmjHTyPlGEyB6ox6gPS41fooANbgkbGvWlof4bmUZufGvD9hBH
 ++6u9VJ7c6+Rik6QYDSAm7sGNlmPK8qYd30SHefVUIklvVCDDA12AjQqdc3E1rZZDj
 tL5E7uMawgSiXHAJhJzJgVG8sTLiyXzSW0YDJ7S3SRzO/ZSrrgb/cSwpz4Sp8pM2PR
 B6GG8nFUc8KaZgh9E0geBAqfv9+3Qp0+faBZ2wfMHkLtjToIS17zYUrA8XeEgBThL2
 3nUV3fHoiHg+w==
Date: Fri, 14 Mar 2025 21:38:15 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Z9Shx72mSqnQxCh3@google.com>
References: <20250307182151.3397003-1-willy@infradead.org>
 <174172263873.214029.5458881997469861795.git-patchwork-notify@kernel.org>
 <Z9DSym8c9h53Xmr8@casper.infradead.org>
 <Z9Dh4UL7uTm3cQM3@google.com>
 <Z9RR2ubkS9CafUdE@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9RR2ubkS9CafUdE@casper.infradead.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/14, Matthew Wilcox wrote: > On Wed, Mar 12, 2025 at
 01:22:41AM +0000, Jaegeuk Kim wrote: > > On 03/12, Matthew Wilcox wrote: >
 > > On Tue, Mar 11, 2025 at 07:50:38PM +0000, patchwork-bot+f2fs@ke [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ttCjX-0005Dv-EF
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

On 03/14, Matthew Wilcox wrote:
> On Wed, Mar 12, 2025 at 01:22:41AM +0000, Jaegeuk Kim wrote:
> > On 03/12, Matthew Wilcox wrote:
> > > On Tue, Mar 11, 2025 at 07:50:38PM +0000, patchwork-bot+f2fs@kernel.org wrote:
> > > > Hello:
> > > > 
> > > > This series was applied to jaegeuk/f2fs.git (dev)
> > > > by Jaegeuk Kim <jaegeuk@kernel.org>:
> > > 
> > > Thanks!
> > > 
> > > FWIW, I have a tree with 75 patches in it on top of this that do more
> > > folio conversion work.  It's not done yet; maybe another 200 patches to
> > > go?  I don't think it's worth posting at this point in the cycle, so
> > > I'll wait until -rc1 to post, by which point it'll probably be much
> > > larger.
> > 
> > Ok, thanks for the work! Will keep an eye on.
> 
> Unfortunately, I thnk I have to abandon this effort.  It's only going
> to make supporting large folios harder (ie there would then need to be
> an equivalently disruptive series adding support for large folios).
> 
> The fundamental problem is that f2fs has no concept of block size !=
> PAGE_SIZE.  So if you create a filesystem on a 4kB PAGE_SIZE kernel,
> you can't mount it on a 16kB PAGE_SIZE kernel.  An example:
> 
> int f2fs_recover_inline_xattr(struct inode *inode, struct page *page)
> {
>         struct f2fs_inode *ri;
>         ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
>         ri = F2FS_INODE(page);
> 
> so an inode number is an index into the filesystem in PAGE_SIZE units,
> not in filesystem block size units.  Fixing this is a major effort, and
> I lack the confidence in my abilities to do it without breaking anything.
> 
> As an outline of what needs to happen, I think that rather than passing
> around so many struct page pointers, we should be passing around either
> folio + offset, or we should be passing around struct f2fs_inode pointers.
> My preference is for the latter.  We can always convert back to the
> folio containing the inode if we need to (eg to mark it dirty) and it
> adds some typesafety by ensuring that we're passing around pointers that
> we believe belong to an inode and not, say, a struct page which happens
> to contain a directory entry.
> 
> This is a monster task, I think.  I'm going to have to disable f2fs
> from testing with split page/folio.  This is going to be a big problem
> for Android.

I see. fyi; in Android, I'm thinking to run 16KB page kernel with 16KB format
natively to keep block_size = PAGE_SIZE. Wasn't large folio to support a set
of pages while keeping block_size = PAGE_SIZE?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
