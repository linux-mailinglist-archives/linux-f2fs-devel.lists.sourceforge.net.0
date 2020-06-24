Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D3E206BD6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2020 07:37:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jny6Q-0008DJ-NR; Wed, 24 Jun 2020 05:37:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jny6P-0008DB-21
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 05:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wb4QukjekILuiNOvt3WtAggRANvs3/DPlF6kk/OZN9A=; b=Q1b3WOtyPF8UUz1qeZ5qQgX4Py
 UrQUv3mvUv+Idg5BOBnzm5kFfGvaayC9DwHZAbWxLuFX4/a0eAlw2m3B1NopZwduEh3jwWYRV9sy7
 PhPna0WQfMq7C0+7JJHFI6KGUFCTLS1fEODs6iBv2OMJB5RpJ3tWOp7mfDVKuYLUx2Co=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wb4QukjekILuiNOvt3WtAggRANvs3/DPlF6kk/OZN9A=; b=dIiPyMASadj7ws+7blRP4vs+sj
 j8LUxtIPjUcjxup2K0VrCtst4RnHaVI239PMBqgSxFVbpyNOVt/WTFmzZIiySf0N1RdpJvnwaPY5t
 Fj6QNF4RRaYkRnIhrqLBmOYJ070kA6u93BhFv5aHJYyBBibaSjCiZkWHdQK0WDTcK9i4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jny6O-00DiaD-26
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 05:37:40 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC0C82072E;
 Wed, 24 Jun 2020 05:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592977051;
 bh=wb4QukjekILuiNOvt3WtAggRANvs3/DPlF6kk/OZN9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ME2/ILyRl01EO6yDPEjuIw5z41jE6WT0YL/dZxeFp1FPcCqTGoXmWlZASWXMdQg+d
 Gg6ZXHBJaopVsT69BCF292QvgQpMxHWYMvgoHHUbOyO2xDDrO8HZyvDEPplfoZjCZF
 oVsC9NaAewstXOI+yLeiPyQ9MDInXF4S2T12EQBY=
Date: Tue, 23 Jun 2020 22:37:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200624053729.GE844@sol.localdomain>
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624043341.33364-2-drosen@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jny6O-00DiaD-26
Subject: Re: [f2fs-dev] [PATCH v9 1/4] unicode: Add utf8_casefold_hash
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 23, 2020 at 09:33:38PM -0700, Daniel Rosenberg wrote:
> This adds a case insensitive hash function to allow taking the hash
> without needing to allocate a casefolded copy of the string.

It would be helpful to add a few more details in this commit message.
Somewhat along the lines of: ->d_hash() for casefolding currently allocates
memory, it needs to use GFP_ATOMIC due to ->d_hash() being called in rcu-walk
mode, this is unreliable and inefficient, and this patch allows solving that
problem by removing the need to allocate memory.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
