Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B7F96B2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Nov 2019 18:10:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUZgA-0000AC-J4; Tue, 12 Nov 2019 17:10:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1iUZg9-0000A6-Hn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 17:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4WA+PEBnl++LiSfh1fWDfOWjZhCbJbW28o5ZDRzbgHA=; b=C+2OneILP8WkcfgOSsVk2SRR3P
 qvV2uNqSzajy18Fb8B4gUe5F6sZi7S/FLFGk2tkRxF0Dx1epz459AoKuj6wLXPgL98p0HaS1v4k9H
 e2FLybQU5fo4LqN3AD1L1COLJTnmYMJFbwgly2E16kaharXeqcbCa7eJXS0WRiGSBS8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4WA+PEBnl++LiSfh1fWDfOWjZhCbJbW28o5ZDRzbgHA=; b=kJH6Im31Z6CQY4jAeVnOGWSC88
 hzSv8qbWT6dSN7piqzUwXbRV70U/st5smWCBejgvP59b182Z22Axco1h8/Ku6Erre0XtTIh8tisPt
 l+2nlLzU0W8M0Tsb3p559ZB+Nk6VK/ejJdu2N+koOL8c0fjHKgZhCyVAUPHTOXuaczw8=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUZg7-00DZ6l-FD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 17:10:09 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 09:10:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,297,1569308400"; d="scan'208";a="255751160"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Nov 2019 09:10:01 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 12 Nov 2019 09:10:01 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 12 Nov 2019 09:10:01 -0800
Received: from crsmsx151.amr.corp.intel.com (172.18.7.86) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 12 Nov 2019 09:10:01 -0800
Received: from crsmsx101.amr.corp.intel.com ([169.254.1.94]) by
 CRSMSX151.amr.corp.intel.com ([169.254.3.96]) with mapi id 14.03.0439.000;
 Tue, 12 Nov 2019 11:09:59 -0600
From: "Weiny, Ira" <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Thread-Topic: [PATCH 2/2] fs: Move swap_[de]activate to file_operations
Thread-Index: AQHVmPEJn03RPDacYEWb7WKbk7sMtKeHfu+AgABGKCA=
Date: Tue, 12 Nov 2019 17:09:58 +0000
Message-ID: <2807E5FD2F6FDA4886F6618EAC48510E92BB4EFE@CRSMSX101.amr.corp.intel.com>
References: <20191112003452.4756-1-ira.weiny@intel.com>
 <20191112003452.4756-3-ira.weiny@intel.com>
 <20191112065507.GA15915@infradead.org>
In-Reply-To: <20191112065507.GA15915@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTM5NDE5MDYtMjAzNy00Nzc4LWEzYmEtNmZkNWU4YWQ2ZmM4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUEUrZUdXeGJIYm5OR3QzM0J0eTNySG1wRXZDTmw3OENZdDlmYkwzY1RoaFlMS1wvZTBGdWFhZTI3aDVoNG1icnMifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.18.205.10]
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUZg7-00DZ6l-FD
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
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> 
> On Mon, Nov 11, 2019 at 04:34:52PM -0800, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> >
> > swap_activate() and swap_deactivate() have nothing to do with address
> > spaces.  We want to eventually make the address space operations
> > dynamic to switch inode flags on the fly.  So to simplify this code as
> > well as properly track these operations we move these functions to the
> > file_operations vector.
> 
> What is the point?  If we switch aops for DAX vs not we might as well switch
> file operations as well, as they pretty much are entirely different.

Obviously I was not clear enough.  The point is to have 2 fewer a_ops functions to worry about synchronizing.

I see Jan already replied.  So I'll leave it at that.

Ira



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
