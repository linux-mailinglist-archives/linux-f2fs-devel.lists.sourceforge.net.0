Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB3D30D2C6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Feb 2021 06:12:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l7ASe-0001TP-2T; Wed, 03 Feb 2021 05:12:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1l7ASc-0001TF-IT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Feb 2021 05:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zVjc4sV53oulGGumsLcIZLWU5uXjgKzaoOSA3sZJpVc=; b=F80jVEoVCfpUdIdrR9s7qebcA/
 A6QHFSpHr4OyjSlls9r8N3Go03//lDN9Kq9WZdd6hvOEmuVF9yhe6R+M0d/wBA68ER73BultCyksO
 fCkM57LrOkbbJFttLBwov3ox6qwGReJ4jE1bXxWMA3R6nWEO9M87ByQHu2TW/tOwwo3Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zVjc4sV53oulGGumsLcIZLWU5uXjgKzaoOSA3sZJpVc=; b=ctpV8/CF/sJRAiXSwjiFN50Hl0
 O1CBkpSrJG7tmQ34gKFByQ2qYz+aqapeGZL6njwUhMcok9HPQy0ayBpbGhQiTjYr7lnbnOLNZK+Rj
 I+qKn7sZGu3QPHaXOVifZqmPRKXIPTNXLhg0/ESAFva1JbdpL/e5dUjZlpQ35TBHfho0=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l7AST-000IlR-QZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Feb 2021 05:12:14 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 1135BrLY016312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Feb 2021 00:11:53 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id E4E2C15C39E2; Wed,  3 Feb 2021 00:11:52 -0500 (EST)
Date: Wed, 3 Feb 2021 00:11:52 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YBowmPPHfZUTBgz1@mit.edu>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210111151517.GK18475@quack2.suse.cz>
 <X/y4s12YrXiUwWfN@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/y4s12YrXiUwWfN@sol.localdomain>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [18.9.28.11 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l7AST-000IlR-QZ
Subject: Re: [f2fs-dev] [PATCH v2 00/12] lazytime fix and cleanups
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
Cc: Jan Kara <jack@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 11, 2021 at 12:44:35PM -0800, Eric Biggers wrote:
> > 
> > The series look good to me. How do you plan to merge it (after resolving
> > Christoph's remarks)? I guess either Ted can take it through the ext4 tree
> > or I can take it through my tree...
> 
> I think taking it through your tree would be best, unless Al or Ted wants to
> take it.

I'm happy to take it through the ext4 tree.  Are you planning on
issuing a newer version of this patch series to resolve Christoph's
comments?

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
