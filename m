Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D4E22F5A2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jul 2020 18:45:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k06Fb-0004A8-QH; Mon, 27 Jul 2020 16:45:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1k06FZ-00049o-Pm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 16:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Ej7ertLr9Ntr8hJaE0dbCJHmtGbryDVoFj4JRSbVso=; b=XfFSrUSyWc8MBhnh/QBh6WGAM2
 OxAWumJ37+BBB6XsnAZ2oN0vFoKCQ7sh0+tRhiSNKehERka/OjB97DhmOYKx/JPaxHves8S5dhk/s
 9is7U5p+KorqEuJEQARmNMCVHt0rZd78QlwrVV0nXd7lt+5IF+sU0gbMHsUMLcfI4MQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Ej7ertLr9Ntr8hJaE0dbCJHmtGbryDVoFj4JRSbVso=; b=QNiBzuhhvzHfNJhTW5te5p+HXQ
 +YVoFXw3wzOtP1GwIcid099nHjgUNu1uEN7WLRLDo/PFwXJ636JqwIky6qJrinJsS4+d78F/7AjXF
 3MFgOC3h0b0gNbiVi4qzaQuWeST83jApwqqjYcrdxqMJmVGqGRppWjd2mWbCeNgUG9V0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k06FY-004Fcs-JA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 16:45:17 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9D2C20729;
 Mon, 27 Jul 2020 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595868310;
 bh=Y+WD95sdH0wkH5EJvEWNHVBOc12vKJ3VFxESA0EXbJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=05yBUaSDAOP3S38lPECXjCakK/MCIToC7TOXpsu91VGhjXm7eVriyBOClN2zzXa2q
 V1jAjxYNkpVyPN3PGRU5H+Ra1LBAITD3yMT9MG8w1C1DScvyxtYQyFKzFwEM9RVZ8P
 CKxGsmqi8KNPkQVmmpj9NdHYV50J6dO6CH0nUiSo=
Date: Mon, 27 Jul 2020 09:45:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20200727164508.GE1138@sol.localdomain>
References: <20200708091237.3922153-1-drosen@google.com>
 <20200720170951.GE1292162@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720170951.GE1292162@gmail.com>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k06FY-004Fcs-JA
Subject: Re: [f2fs-dev] [PATCH v12 0/4] Prepare for upcoming
 Casefolding/Encryption patches
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 20, 2020 at 10:09:51AM -0700, Eric Biggers wrote:
> On Wed, Jul 08, 2020 at 02:12:33AM -0700, Daniel Rosenberg wrote:
> > This lays the ground work for enabling casefolding and encryption at the
> > same time for ext4 and f2fs. A future set of patches will enable that
> > functionality.
> > 
> > These unify the highly similar dentry_operations that ext4 and f2fs both
> > use for casefolding. In addition, they improve d_hash by not requiring a
> > new string allocation.
> > 
> > Daniel Rosenberg (4):
> >   unicode: Add utf8_casefold_hash
> >   fs: Add standard casefolding support
> >   f2fs: Use generic casefolding support
> >   ext4: Use generic casefolding support
> > 
> 
> Ted, are you interested in taking this through the ext4 tree for 5.9?
> 
> - Eric

Ping?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
