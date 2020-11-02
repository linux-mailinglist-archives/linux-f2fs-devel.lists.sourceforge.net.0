Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9262A231C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Nov 2020 03:39:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZPky-0000KX-KS; Mon, 02 Nov 2020 02:39:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kZPkx-0000KQ-VY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 02:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wJPiE5vUPwX3fKD+8pZPzoP27o+QwRSC4JOV23YGLyY=; b=fDWvtoLNyRLCXpbdPek5PKjA2K
 xvEN0i1mjevbejKJVwMxfhMXh2zNZN/91CnWJTKiZ8FvvYb3+gLQzEiB8nSwI/f4adktw3Z4HShae
 JpUgTtIpEVI+pk5DvpJFjy1KQor4WiQXX97f4S1aaUKBVP/Kpr514P4H5Tb0sAb7Nyps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wJPiE5vUPwX3fKD+8pZPzoP27o+QwRSC4JOV23YGLyY=; b=PWi2n561Hj6NQfqlJFlI2YTazN
 LamuohW9RRj8j+nwwqSnCRcG7XDrOt9bphU1jY52NtUQRdDX+082rhamizxyNhuw0nRtFPzd8mZfH
 SsDzJi67+h04Q6ixHGJ0V8zItsR+ffX+nw+TEJ73u1Ay0KCp1o2a4aWDb5F0IB85RIWg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZPks-00FoTS-Np
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 02:39:39 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34506221FF;
 Mon,  2 Nov 2020 02:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604284764;
 bh=CRd8jdR18lq6qCw00cZZJ8fHl48i5Q4wo7jUREblCHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0vWjK3tbg2w36KNPge9Yn6O3JXrNkyihpT2PeDXZuv06+fRzhnzt9RDSTvomVwhoG
 tXZZXJbAQAR17b7J4+RQ9GD5mlOuauSPzTLpZnbw1LYzct1GdX/Hs09U36MX1aGqVh
 3k/MTu/Ad7UnvPK/cH2s89WZk+rSCEiXTGIZOfMw=
Date: Sun, 1 Nov 2020 18:39:22 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201102023922.GA1419858@sol.localdomain>
References: <20200407100107.4356-1-yuchao0@huawei.com>
 <20200407100107.4356-2-yuchao0@huawei.com>
 <20201031234848.GC936@sol.localdomain>
 <95ba132f-0dc0-d391-26b4-68eef132f931@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95ba132f-0dc0-d391-26b4-68eef132f931@huawei.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZPks-00FoTS-Np
Subject: Re: [f2fs-dev] [PATCH 2/2] fsck.f2fs: fix to check validation of
 i_xattr_nid
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
Cc: kilobyte@angband.pl, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 02, 2020 at 09:31:09AM +0800, Chao Yu wrote:
> On 2020/11/1 7:48, Eric Biggers wrote:
> > Hi Chao,
> > 
> > On Tue, Apr 07, 2020 at 06:01:07PM +0800, Chao Yu wrote:
> > > Otherwise, fsck.f2fs will access invalid memory address as below:
> > > 
> > > - fsck_verify
> > >   - dump_node
> > >    - dump_file
> > >     - dump_inode_blk
> > >      - dump_xattr
> > >       - read_all_xattrs
> > >         - get_node_info
> > >          access &(F2FS_FSCK(sbi)->entries[nid])
> > > 
> > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > ---
> > >   fsck/dump.c  |  2 ++
> > >   fsck/fsck.c  |  8 ++++++++
> > >   fsck/fsck.h  |  3 +++
> > >   fsck/mount.c |  8 +++++---
> > >   fsck/xattr.c | 20 ++++++++++++++++++--
> > >   5 files changed, 36 insertions(+), 5 deletions(-)
> > > 
> > 
> > This commit caused a regression where 'dump.f2fs -i <inode> <device>'
> > now segfaults if the inode has any extended attributes.
> > 
> > It's because read_all_xattrs() now calls fsck_sanity_check_nid(), which
> > eventually dereferences f2fs_fsck::main_area_bitmap, which is NULL.
> > 
> > I'm not sure what was intended here.
> 
> Eric, could you please have a try with below commit:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/chao/f2fs-tools.git/commit/?h=dev-test&id=aad80ed0099fb9530ae3af9789362353ff580252
> 

Works for me.  I was wondering whether the fix would be more than that, but
maybe not.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
