Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13177F969B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Nov 2019 18:06:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUZc0-0005vX-Cc; Tue, 12 Nov 2019 17:05:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1iUZbx-0005vG-0T
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 17:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IRx/51fIh5cfdSaK/Vw3R1KA5B7vYGceSFl+LT3eUdM=; b=g/T8T5jRW+++7M6YG02iViwUlL
 VBYiWMJtL2GGPYFD4Oro2otHuD4LimeWwzfbpGCe90XtdSPvDBkjCno+SYeVyWgwIldCDFEqjGWYT
 Vc/2MxjsN6SSm/D/LQ4LfpmawOzvS/Mn/YPS11FgGSwyGq8tnLatRkuzKIJG9iQeElcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IRx/51fIh5cfdSaK/Vw3R1KA5B7vYGceSFl+LT3eUdM=; b=JygVPjm2+Qp+YkXVypfMs0IFfO
 7g0UI81oVdc9zhcJaQYS0noEFO4FVJbXK03UNBo87jA2NELJIv4poZ6DSIMix7daIZ5BB3ozpVS/4
 seF/b9DG6cUxjCyaDlDJo0Rtnt6050XpabjQsKS+FaXenWFZcEc9vH9tXIq30sXcMaqs=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUZbv-00DY3r-80
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 17:05:48 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 09:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,297,1569308400"; d="scan'208";a="287602412"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga001.jf.intel.com with ESMTP; 12 Nov 2019 09:05:28 -0800
Received: from crsmsx103.amr.corp.intel.com (172.18.63.31) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 12 Nov 2019 09:05:28 -0800
Received: from crsmsx101.amr.corp.intel.com ([169.254.1.94]) by
 CRSMSX103.amr.corp.intel.com ([169.254.4.168]) with mapi id 14.03.0439.000;
 Tue, 12 Nov 2019 11:05:26 -0600
From: "Weiny, Ira" <ira.weiny@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Thread-Topic: [PATCH 2/2] fs: Move swap_[de]activate to file_operations
Thread-Index: AQHVmPEJn03RPDacYEWb7WKbk7sMtKeHFw8AgACtkeA=
Date: Tue, 12 Nov 2019 17:05:25 +0000
Message-ID: <2807E5FD2F6FDA4886F6618EAC48510E92BB4EBE@CRSMSX101.amr.corp.intel.com>
References: <20191112003452.4756-1-ira.weiny@intel.com>
 <20191112003452.4756-3-ira.weiny@intel.com>
 <20191111164320.80f814161469055b14f27045@linux-foundation.org>
In-Reply-To: <20191111164320.80f814161469055b14f27045@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTM4NDllYjMtZWQxZS00MTQ3LWIzNzgtMTdmZmQwOTcxOGVhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiN3FwcGdWcUNHd0IrWmkwYnd0YWZoTHNTTmx4OTNaaklldUZFb05tZWQ0aHJ1UlwvRktzb1RlV3JGRUNlZFBqNGMifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.18.205.10]
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUZbv-00DY3r-80
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Dave Chinner <david@fromorbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Anna Schumaker <anna.schumaker@netapp.com>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> 
> On Mon, 11 Nov 2019 16:34:52 -0800 ira.weiny@intel.com wrote:
> 
> > From: Ira Weiny <ira.weiny@intel.com>
> >
> > swap_activate() and swap_deactivate() have nothing to do with address
> > spaces.  We want to eventually make the address space operations
> > dynamic to switch inode flags on the fly.
> 
> What does this mean?
> 
> >  So to simplify this code as
> > well as properly track these operations we move these functions to the
> > file_operations vector.
> >
> > This has been tested with XFS but not NFS, f2fs, or btrfs.
> >
> > Also note f2fs and xfs have simple moves of their functions to
> > facilitate compilation.  No functional changes are contained within
> > those functions.
> >
> > ...
> >
> > --- a/fs/btrfs/inode.c
> > +++ b/fs/btrfs/inode.c
> > @@ -11002,6 +11002,8 @@ static const struct file_operations
> > btrfs_dir_file_operations = {  #endif
> >  	.release        = btrfs_release_file,
> >  	.fsync		= btrfs_sync_file,
> > +	.swap_activate	= btrfs_swap_activate,
> > +	.swap_deactivate = btrfs_swap_deactivate,
> >  };
> 
> Shouldn't this be btrfs_file_operations?
> 

Shoot...  yes it should and I even thought that as I was moving it and must have still made the mistake...

Sorry, I'll update.
Ira


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
