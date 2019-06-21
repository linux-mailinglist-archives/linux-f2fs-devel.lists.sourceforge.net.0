Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C92064DE37
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2019 02:55:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1he7pu-0004aW-PT; Fri, 21 Jun 2019 00:55:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1he7pt-0004aL-B5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 00:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6dAfEP10mYLzrMjbDQx3yrRDWC6z2OR5tbIbKtzt5Bg=; b=BfiOws+zJ8tsF+629dvDc5G25X
 PtEwljsg8xsLLQavya2QqLRQGQ9rS1Kt6qwVvbZ86L6msPK0MzAQnvAIvQkWVhKwl/TWd3yZYCPyH
 KP3UJpnEVlVbiAwxD21eEoK9CeYUctHJK+dOaFq8BnE3+evt+oKw2SRT8YClSqU5/FjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6dAfEP10mYLzrMjbDQx3yrRDWC6z2OR5tbIbKtzt5Bg=; b=g9O5xYuCt3DqyX1ZVtAIq/FQ/k
 4bzgJsyVsTus01htMjPEbHjYl38qXGAOToLjUTc6MlM9QW3SR/TGNgrISMtuSJprhk+9i37pfdRHW
 /ukx7ySPw5PufUFM7OfU4q4XuLkhZ28T08wg68JXy1QS1JugX5OLabCCJ85IRijtoZVY=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1he7pt-006kPo-KP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 00:55:27 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x5L0sK0h000800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2019 20:54:21 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 28403420484; Thu, 20 Jun 2019 20:54:20 -0400 (EDT)
Date: Thu, 20 Jun 2019 20:54:20 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190621005420.GH4650@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 matthew.garrett@nebula.com, yuchao0@huawei.com,
 ard.biesheuvel@linaro.org, josef@toxicpanda.com, clm@fb.com,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk, jack@suse.com,
 dsterba@suse.com, jaegeuk@kernel.org, jk@ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-efi@vger.kernel.org,
 devel@lists.orangefs.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
References: <156022836912.3227213.13598042497272336695.stgit@magnolia>
 <156022837711.3227213.11787906519006016743.stgit@magnolia>
 <20190620215212.GG4650@mit.edu> <20190620221306.GD5375@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620221306.GD5375@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1he7pt-006kPo-KP
Subject: Re: [f2fs-dev] [PATCH 1/6] mm/fs: don't allow writes to immutable
 files
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
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-mm@kvack.org,
 clm@fb.com, adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
 linux-nilfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, josef@toxicpanda.com, reiserfs-devel@vger.kernel.org,
 viro@zeniv.linux.org.uk, dsterba@suse.com, jaegeuk@kernel.org,
 ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jk@ozlabs.org, jack@suse.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 20, 2019 at 03:13:06PM -0700, Darrick J. Wong wrote:
> > I note that this patch doesn't allow writes to swap files.  So Amir's
> > generic/554 test will still fail for those file systems that don't use
> > copy_file_range.
> 
> I didn't add any IS_SWAPFILE checks here, so I'm not sure to what you're
> referring?

Sorry, my bad; I mistyped.  What I should have said is this patch
doesn't *prohibit* writes to swap files....

(And so Amir's generic/554 test, even modified so it allow reads from
swapfiles, but not writes, when using copy_file_range, is still
failing for ext4.  I was looking to see if I could remove it from my
exclude list, but not yet.  :-)

> > I'm indifferent as to whether you add a new patch, or include that
> > change in this patch, but perhaps we should fix this while we're
> > making changes in these code paths?
> 
> The swapfile patches should be in a separate patch, which I was planning
> to work on but hadn't really gotten around to it.

Ok, great, thanks!!

				- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
