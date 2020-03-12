Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E9C18261A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2020 01:07:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jCBNu-0005WB-2x; Thu, 12 Mar 2020 00:07:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jCBNq-0005W1-4R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 00:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7QmlHbZATTp+7vr88Hz0bCf4LqGoT8UpSGyuqFP8AJs=; b=BJDhaVFF8MA3PgiNyD2kpInQRw
 71ghi1qy2PIeif+OR/dBCBq5Tv4ka9CF2gRVSNK5+Y45DBtJ9ownOOwlaFhP7uM0lEO6u2s2G912E
 i68G/6WnoJP8U9S+Jwef4ZzELCo4ozc8Fkz5tShy9KWzFhWTJW7+UM0li4kXwmanIT9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7QmlHbZATTp+7vr88Hz0bCf4LqGoT8UpSGyuqFP8AJs=; b=MoQRfeICRVbxFEMZ7gpZ6M1ejq
 Xs/0WSlMM8ti4duF1IDWWqnAE1yzU7KrJLnPMltPj+GAZ18Pb+bFksqe4y4TF4Q73n8EDdH4T7xER
 IrY04tfwxobOsJ9UyCMaO7rEqdN+skmnb5xcBL+XNchgGIieieYYsvKWBkV6dwo9WfXU=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jCBNo-008o3C-Ar
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 00:07:29 +0000
Received: from dread.disaster.area (pa49-195-202-68.pa.nsw.optusnet.com.au
 [49.195.202.68])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id A23E43A23AD;
 Thu, 12 Mar 2020 11:07:18 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jCBNd-0005Ob-1C; Thu, 12 Mar 2020 11:07:17 +1100
Date: Thu, 12 Mar 2020 11:07:17 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20200312000716.GY10737@dread.disaster.area>
References: <20200306004555.GB225345@gmail.com>
 <20200307020043.60118-1-tytso@mit.edu>
 <20200311032009.GC46757@gmail.com> <20200311125749.GA7159@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311125749.GA7159@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
 a=mqTaRPt+QsUAtUurwE173Q==:117 a=mqTaRPt+QsUAtUurwE173Q==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=SS2py6AdgQ4A:10
 a=7-415B0cAAAA:8 a=hha5DUukJWGJSOMOPv8A:9 a=CjuIK1q_8ugA:10
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [211.29.132.249 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jCBNo-008o3C-Ar
Subject: Re: [f2fs-dev] [PATCH] writeback: avoid double-writing the inode on
 a lazytime expiration
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
Cc: Eric Biggers <ebiggers@kernel.org>,
 Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 11, 2020 at 08:57:49AM -0400, Theodore Y. Ts'o wrote:
> On Tue, Mar 10, 2020 at 08:20:09PM -0700, Eric Biggers wrote:
> > Thanks Ted!  This fixes the fscrypt test failure.
> > 
> > However, are you sure this works correctly on all filesystems?  I'm not sure
> > about XFS.  XFS only implements ->dirty_inode(), not ->write_inode(), and in its
> > ->dirty_inode() it does:
>   ...
> > 		if (flag != I_DIRTY_SYNC || !(inode->i_state & I_DIRTY_TIME))
> > 			return;
> 
> That's true, but when the timestamps were originally modified,
> dirty_inode() will be called with flag == I_DIRTY_TIME, which will
> *not* be a no-op; which is to say, XFS will force the timestamps to be
> updated on disk when the timestamps are first dirtied, because it
> doesn't support I_DIRTY_TIME.

We log the initial timestamp change, and then ignore timestamp
updates until the dirty time expires and the inode is set
I_DIRTY_SYNC via __mark_inode_dirty_sync(). IOWs, on expiry, we have
time stamps that may be 24 hours out of date in memory, and they
still need to be flushed to the journal.

However, your change does not mark the inode dirtying on expiry
anymore, so...

> So I think we're fine.

... we're not fine. This breaks XFS and any other filesystem that
relies on a I_DIRTY_SYNC notification to handle dirty time expiry
correctly.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
