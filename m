Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C51555FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2019 19:32:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hfpJF-0008Rs-Mt; Tue, 25 Jun 2019 17:32:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dsterba@suse.cz>)
 id 1hfpJ7-0008RN-2A; Tue, 25 Jun 2019 17:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w2HcbNl+zhL+dwRMUqcT41NLApXI65euOiiPXvQ12TM=; b=NPdykFFCWPa6TDENUwCujAmGlI
 i30A8ogdnSUPoGLeNDPRVCqp4jQNYtZ2xxIAs5HsJY8L5nwH6UIcQZ+VNJfadlAoM9dKEGZgdfF74
 cMCmMYfYQxmRfPbwO1UA4FmBCp1nU7rIvdSTrFpg+vjymwO8TGs36F7JpzDo0CwMm+WI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w2HcbNl+zhL+dwRMUqcT41NLApXI65euOiiPXvQ12TM=; b=g8sTFsHfzCyYtII0gLZ0z4JkPF
 hNRvperJ1UCp49wwE+2asQ4xY+akmicV0bYpwWR7FK7NVALD6Tq/L5YVY1Km/PJtUzFPAy2KN+xwk
 v0fMN7ixZ5O3sX/0CkRpnLGo+jcIeIINurMlu+a7vS/OddbKhTHCl4DTxBfWUr7ufUT0=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hfpJ9-009mRC-4n; Tue, 25 Jun 2019 17:32:41 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E8FBAD8A;
 Tue, 25 Jun 2019 17:32:32 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 2D2B6DA8F6; Tue, 25 Jun 2019 19:33:16 +0200 (CEST)
Date: Tue, 25 Jun 2019 19:33:16 +0200
From: David Sterba <dsterba@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190625173316.GU8917@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Christoph Hellwig <hch@infradead.org>, matthew.garrett@nebula.com,
 yuchao0@huawei.com, tytso@mit.edu, shaggy@kernel.org,
 ard.biesheuvel@linaro.org, josef@toxicpanda.com, clm@fb.com,
 adilger.kernel@dilger.ca, jk@ozlabs.org, jack@suse.com,
 dsterba@suse.com, jaegeuk@kernel.org, viro@zeniv.linux.org.uk,
 cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
 reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
 <156116138952.1664814.16552129914959122837.stgit@magnolia>
 <20190625105725.GB26085@infradead.org>
 <20190625170248.GS8917@twin.jikos.cz>
 <20190625171616.GB2230847@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625171616.GB2230847@magnolia>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hfpJ9-009mRC-4n
Subject: Re: [f2fs-dev] [PATCH 2/4] vfs: create a generic checking function
 for FS_IOC_FSSETXATTR
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
Reply-To: dsterba@suse.cz
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-btrfs@vger.kernel.org, dsterba@suse.cz, clm@fb.com,
 adilger.kernel@dilger.ca, matthew.garrett@nebula.com, cluster-devel@redhat.com,
 Christoph Hellwig <hch@infradead.org>, linux-ext4@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, josef@toxicpanda.com,
 linux-nilfs@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 25, 2019 at 10:16:16AM -0700, Darrick J. Wong wrote:
> On Tue, Jun 25, 2019 at 07:02:48PM +0200, David Sterba wrote:
> > On Tue, Jun 25, 2019 at 03:57:25AM -0700, Christoph Hellwig wrote:
> > > On Fri, Jun 21, 2019 at 04:56:29PM -0700, Darrick J. Wong wrote:
> > > > From: Darrick J. Wong <darrick.wong@oracle.com>
> > > > 
> > > > Create a generic checking function for the incoming FS_IOC_FSSETXATTR
> > > > fsxattr values so that we can standardize some of the implementation
> > > > behaviors.
> > > > 
> > > > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > > Reviewed-by: Jan Kara <jack@suse.cz>
> > > > ---
> > > >  fs/btrfs/ioctl.c   |   21 +++++++++-------
> > > >  fs/ext4/ioctl.c    |   27 ++++++++++++++------
> > > >  fs/f2fs/file.c     |   26 ++++++++++++++-----
> > > >  fs/inode.c         |   17 +++++++++++++
> > > >  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++++++++++----------------------
> > > >  include/linux/fs.h |    3 ++
> > > >  6 files changed, 111 insertions(+), 53 deletions(-)
> > > > 
> > > > 
> > > > diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> > > > index f408aa93b0cf..7ddda5b4b6a6 100644
> > > > --- a/fs/btrfs/ioctl.c
> > > > +++ b/fs/btrfs/ioctl.c
> > > > @@ -366,6 +366,13 @@ static int check_xflags(unsigned int flags)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static void __btrfs_ioctl_fsgetxattr(struct btrfs_inode *binode,
> > > > +				     struct fsxattr *fa)
> > > > +{
> > > > +	memset(fa, 0, sizeof(*fa));
> > > > +	fa->fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);
> > > 
> > > Is there really much of a point in this helper? Epeciall as
> > > the zeroing could easily be done in the variable declaration
> > > line using
> > > 
> > > 	struct fsxattr fa = { };
> > 
> > Agreed, not counting the initialization the wrapper is merely another
> > name for btrfs_inode_flags_to_xflags. I also find it slightly confusing
> > that __btrfs_ioctl_fsgetxattr name is too close to the ioctl callback
> > implementation btrfs_ioctl_fsgetxattr but only does some initialization.
> 
> Ok; it's easily enough changed to:
> 
> 	struct fsxattr old_fa = {
> 		.fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags),
> 	};

Works for me, thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
