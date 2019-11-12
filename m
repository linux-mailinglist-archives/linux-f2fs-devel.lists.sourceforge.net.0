Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3C2F9E8E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 00:52:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUfxr-0000ls-Ki; Tue, 12 Nov 2019 23:52:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1iUfxq-0000ld-B2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 23:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F1gpK46hU6YW3vD1XAu4kcFqrHgwDLQgihoXmvtSY3c=; b=OFTuetNGipmRWsmyS0k3XEgCsB
 hIeFijNL/rl+q9XZkPOSIpVQypIyenZpjscmtAnHbgD7EUTNevnLg/4gmLsMdi4Q9h+Mq2NfOMB08
 yJSy39ho/MWbMrZ1Z2ijQc/JKlJwXmHSqIy3wQQCXZpiLJgWxWf6qwKLmtzHyvnu14V8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F1gpK46hU6YW3vD1XAu4kcFqrHgwDLQgihoXmvtSY3c=; b=cek7xlgeuMaTbS1T+O/o4R3DWp
 hC+/IyxrESkve5dF/4X5vNSi/ryruKhH8xSN0DKg3FWl0cAKYe685z2xnRkx5sIScczetqIYq8skn
 RDelxt4+wLaq3LkSmb6HiD/j1Pa8RtNhUMmJzIv0AmBe5RkDLrphBge/RsL74Dwf6mX4=;
Received: from mga12.intel.com ([192.55.52.136])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUfxo-00EBBT-0b
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 23:52:50 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 15:52:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,298,1569308400"; d="scan'208";a="235064254"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2019 15:52:41 -0800
Date: Tue, 12 Nov 2019 15:52:41 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20191112235240.GB5792@iweiny-DESK2.sc.intel.com>
References: <20191112003452.4756-1-ira.weiny@intel.com>
 <20191112003452.4756-3-ira.weiny@intel.com>
 <20191112012017.GT6219@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112012017.GT6219@magnolia>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUfxo-00EBBT-0b
Subject: Re: [f2fs-dev] [PATCH 2/2] fs: Move swap_[de]activate to
 file_operations
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
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Dave Chinner <david@fromorbit.com>, Josef Bacik <josef@toxicpanda.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 11, 2019 at 05:20:17PM -0800, Darrick J. Wong wrote:
> On Mon, Nov 11, 2019 at 04:34:52PM -0800, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> >  };
> > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > index 865543e41fb4..3d2e89ac72ed 100644
> > --- a/fs/xfs/xfs_file.c
> > +++ b/fs/xfs/xfs_file.c
> > @@ -1294,6 +1294,17 @@ xfs_file_mmap(
> >  	return 0;
> >  }
> >  
> > +static int
> > +xfs_iomap_swapfile_activate(
> 
> Might as well rename this xfs_file_swap_activate().

Done.

V1 with fixed btrfs, to be out shortly.

Ira



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
