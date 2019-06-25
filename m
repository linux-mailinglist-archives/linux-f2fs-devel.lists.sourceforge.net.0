Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C1454CDD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2019 12:58:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hfj95-0008Sj-RB; Tue, 25 Jun 2019 10:57:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+c5155a46dc30cc8634d8+5784+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1hfj93-0008S9-JF; Tue, 25 Jun 2019 10:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w1VYtukMDFjClOBWrgBSEg29TnKHWzUm3jllxU3LtVU=; b=jNvu1ewCMpqggrSbhQMdsZmBuH
 nJ68hfzIup36B6/8IreLSXUWyk4EkzIzzdDti5Ydn5bZl6/m19DW2dMoHyAimrQqURRfZ+DOAkEBy
 rQwfcyqnJGZS3zJVaf9nKetWvUxWGJcEcKt0ZTfejrHUa4NBmwvJngUiyjxNVLxo7HVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w1VYtukMDFjClOBWrgBSEg29TnKHWzUm3jllxU3LtVU=; b=SOb8CEWcLldyuLWhdFnFskX9ze
 Rzj8rx0WdNYb5eraxFS/tA9lckTomLk0HCwyEZ5qvR68aaN0bPRt5RcAle120zF//RE/fnWPf30CR
 QD1sN4IrZbBncuFSt5vnTtCJVCgbbtqfVe/Ie5bLUt4nhRuwOC43NjO+d1F1B4Xrvj4w=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hfj9C-00D0J2-Et; Tue, 25 Jun 2019 10:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w1VYtukMDFjClOBWrgBSEg29TnKHWzUm3jllxU3LtVU=; b=rtyLtNjDw4p6TnPt3CncrQp7X
 Yig8xdu1UY0SGixxHVqiAUm4+cZrSK5chsUKK9EMREb+mlNfL9i+ASyJtGUl9lbRpApvZxGV6jgM8
 CvJ01GtDiZvoVuwXj6AwcDh4cc8+cSuWzIQrsaZNRIdKkaxStTj45iVZnU96w90FX3npVKivwPQEp
 LBlgmJK0t12LzaGtFfBZ3+6X6fbsF6fndebssjuzYDk0YQqRc2Eg5hv1jmmklxbKVcTpnNb2++kCp
 EUgN7ABdtwwvX787EWwMu7qEOjjyXSgk6EygJw0HsQtj3+auaeg9xRyyL026ARdwIQi/Ag6aNi+qj
 l/lkg6fsg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hfj8f-0000HH-M9; Tue, 25 Jun 2019 10:57:25 +0000
Date: Tue, 25 Jun 2019 03:57:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190625105725.GB26085@infradead.org>
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
 <156116138952.1664814.16552129914959122837.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156116138952.1664814.16552129914959122837.stgit@magnolia>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hfj9C-00D0J2-Et
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-btrfs@vger.kernel.org, clm@fb.com, adilger.kernel@dilger.ca,
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-ext4@vger.kernel.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 21, 2019 at 04:56:29PM -0700, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Create a generic checking function for the incoming FS_IOC_FSSETXATTR
> fsxattr values so that we can standardize some of the implementation
> behaviors.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> ---
>  fs/btrfs/ioctl.c   |   21 +++++++++-------
>  fs/ext4/ioctl.c    |   27 ++++++++++++++------
>  fs/f2fs/file.c     |   26 ++++++++++++++-----
>  fs/inode.c         |   17 +++++++++++++
>  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++++++++++----------------------
>  include/linux/fs.h |    3 ++
>  6 files changed, 111 insertions(+), 53 deletions(-)
> 
> 
> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index f408aa93b0cf..7ddda5b4b6a6 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -366,6 +366,13 @@ static int check_xflags(unsigned int flags)
>  	return 0;
>  }
>  
> +static void __btrfs_ioctl_fsgetxattr(struct btrfs_inode *binode,
> +				     struct fsxattr *fa)
> +{
> +	memset(fa, 0, sizeof(*fa));
> +	fa->fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);

Is there really much of a point in this helper? Epeciall as
the zeroing could easily be done in the variable declaration
line using

	struct fsxattr fa = { };

> +	memset(fa, 0, sizeof(struct fsxattr));
> +	fa->fsx_xflags = ext4_iflags_to_xflags(ei->i_flags & EXT4_FL_USER_VISIBLE);

Overly lone line.

> +	if (ext4_has_feature_project(inode->i_sb)) {
> +		fa->fsx_projid = (__u32)from_kprojid(&init_user_ns,
> +				ei->i_projid);

The cast here looks bogus.  Same comment for f2fs.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
