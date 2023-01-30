Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61551680AB9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jan 2023 11:23:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMRK8-0004sF-5o;
	Mon, 30 Jan 2023 10:23:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1pMRK5-0004ry-Kf
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 10:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BLiX2orlLVR8Om06HTLjVOiQtZCv0fK99yWY7KzsHm8=; b=Lu1gI8HRvrrznC2l9tPChnJFrc
 0BWhp4ykUcwV1NmeTBRBJpCNrkORD2gJeC4SvKwJ9rHd1br14hxsaF6R9r6Tb4+6vSQyFXgBkbMTO
 wjOyg+SpZ+5k0WjkJgaHlNnZEfPFAlsE5k5tWK6D9Fc16ksMuuHCBxk/PDWXi5HOeOsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BLiX2orlLVR8Om06HTLjVOiQtZCv0fK99yWY7KzsHm8=; b=CbBgp++ymFWnoPlq2tZepK/BWn
 eQ/UCF+XTuleFJ5Xi3LsZAfutZKWI3+XXT7AZ/mAChQoCq2pfiMRYtPOFS1TbXtNuo/6/f3sB7Tm7
 kLa/kvWxfFTE1MciyzOU72+CB09Bn9kWNZKnkpRVU6Xn0AQKaSqO3wf/M4jr+0WlS8WA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMRK3-003WHb-33 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 10:23:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB75C60EE8;
 Mon, 30 Jan 2023 10:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848BCC433EF;
 Mon, 30 Jan 2023 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675074209;
 bh=JNTyAwdnYzLmCEymJc/ZUWnk+Q8qvEe4IQT1QMUZUUk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JN3lXwEWVDPGXUGplDwCOYjrW8++AmiuyWsKytBrUAmwH5pYzbdpE0vlm5QMheggM
 NBh8TxCmRl0oiVPGeH0p588WtzUGa4Dhxdj47urWqRw5C3YGCL7sEtEpljLyqeU2qK
 hZMY3SfpZs4a7G1hzx2PjWG4oBFdjJLdjf/CAOLVLdkBRxoWDtbAN1LxJYt5Pv5/uW
 JiIhf6J6BcQzCzFwiWHxFBJvn0+sgbTbzFveW5be89tbifEA4YoFlo/yhqSIZATMj0
 cya32Nkc883EMLF+aa2JEWlyaIljfcXui3HQsRaEUKig3vqEj5vhHo9pWtvCv6EINs
 lzNgfo6NIXgGw==
Date: Mon, 30 Jan 2023 11:23:22 +0100
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230130102322.kkq5u72skrmykilh@wittgenstein>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org>
 <20230130091052.72zglqecqvom7hin@wittgenstein>
 <20230130091615.GB5178@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130091615.GB5178@lst.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 30, 2023 at 10:16:15AM +0100, Christoph Hellwig
 wrote: > On Mon, Jan 30, 2023 at 10:10:52AM +0100, Christian Brauner wrote:
 > > However, a few filesystems still rely on the ->list() method [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMRK3-003WHb-33
Subject: Re: [f2fs-dev] [PATCH 00/12] acl: remove remaining posix acl
 handlers
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
Cc: reiserfs-devel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, Seth Forshee <sforshee@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 30, 2023 at 10:16:15AM +0100, Christoph Hellwig wrote:
> On Mon, Jan 30, 2023 at 10:10:52AM +0100, Christian Brauner wrote:
> > However, a few filesystems still rely on the ->list() method of the
> > generix POSIX ACL xattr handlers in their ->listxattr() inode operation.
> > This is a very limited set of filesystems. For most of them there is no
> > dependence on the generic POSIX ACL xattr handler in any way.
> > 
> > In addition, during inode initalization in inode_init_always() the
> > registered xattr handlers in sb->s_xattr are used to raise IOP_XATTR in
> > inode->i_opflags.
> > 
> > With the incoming removal of the legacy POSIX ACL handlers it is at
> > least possible for a filesystem to only implement POSIX ACLs but no
> > other xattrs. If that were to happen we would miss to raise IOP_XATTR
> > because sb->s_xattr would be NULL. While there currently is no such
> > filesystem we should still make sure that this just works should it ever
> > happen in the future.
> 
> Now the real questions is: do we care?  Once Posix ACLs use an
> entirely separate path, nothing should rely on IOP_XATTR for them.
> So instead I think we're better off auditing all users of IOP_XATTR
> and making sure that nothing relies on them for ACLs, as we've very
> much split the VFS concept of ACLs from that from xattrs otherwise.

I had a patch like that but some filesystems create inodes that
explicitly remove IOP_XATTR to prevent any xattrs from being set on
specific inodes. I remember this for at least reiserfs and btrfs.

So we would probably need IOP_NOACL that can be raised by a filesystem
to explicitly opt out of them for specific inodes. That's probably fine
and avoids having to introduce something like SB_I_XATTR.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
