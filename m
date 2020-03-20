Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 021D418C573
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 03:47:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jF7gd-0003ug-Em; Fri, 20 Mar 2020 02:47:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1jF7gb-0003uO-5u
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 02:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UkAcQB5U9VHFgkPL2ucHINC2tRFVs+Clqkm0Dk0Z5DE=; b=m1JvpXwTJ2bP2AInBKE4yoaX2b
 XYipwDXFJCPQMQRjokKspha7l8rLqXbng9YckIKs+E16W61GhrRtlKu8thdADXMa56/PsjLRBbNzy
 OV0iEsoeqH6rXD/fGzTGzKTgLHGYv+vzjuecAc+QehzH4qVZAc9KpLrwoIeQLB4nxeRc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UkAcQB5U9VHFgkPL2ucHINC2tRFVs+Clqkm0Dk0Z5DE=; b=bgk8io0Z6k0REXo93GuRRVa8Co
 oCsu++oR2Buk7DAkT9VNoy9fh4BVQjCZVJz6JwabQz2qvagJBtLBSjbRVn4CJAbBgOzeMW3iSzVpv
 EIOhgQ/oetzpaThjpP0DhmIvtLuUgaoVwxI9L810FIfgOAykOyEbmosAmpE3j3vvXLFY=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jF7gZ-009ZRl-6x
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 02:47:01 +0000
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net
 [72.93.95.157]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 02K2kepw014400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 22:46:40 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id CDE30420EBA; Thu, 19 Mar 2020 22:46:39 -0400 (EDT)
Date: Thu, 19 Mar 2020 22:46:39 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200320024639.GH1067245@mit.edu>
References: <20200306004555.GB225345@gmail.com>
 <20200307020043.60118-1-tytso@mit.edu>
 <20200311032009.GC46757@gmail.com> <20200311125749.GA7159@mit.edu>
 <20200312000716.GY10737@dread.disaster.area>
 <20200312143445.GA19160@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312143445.GA19160@infradead.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jF7gZ-009ZRl-6x
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
Cc: linux-xfs@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 12, 2020 at 07:34:45AM -0700, Christoph Hellwig wrote:
> I haven't seen the original mail this replies to, but if we could
> get the lazytime expirty by some other means (e.g. an explicit
> callback), XFS could opt out of all the VFS inode tracking again,
> which would simplify a few things.

Part of my thinking of calling 

       inode->i_sb->s_op->dirty_inode(inode, I_DIRTY_TIME_EXPIRED);

So that it would be an explicit callback to XFS.  So why don't I break
this as two patches --- one which uses I_DIRTY_SYNC, as before, and a
second one which changes calls dirty_inode() with
I_DIRTY_TIME_EXPIRED, and with a change to XFS so that it recognizes
I_DIRTY_TIME_EXPIRED as if it were I_DIRTY_SYNC.  If this would then
allow XFS to simplify how it handles VFS tracking, you could do that
in a separate patch.

Does that work?  I'll send out the two patches, and if you can
review/ack the second patch, that would be great.

	       	      	     	  	- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
