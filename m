Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0607710CE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Aug 2023 19:13:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSKqG-0002t2-Sc;
	Sat, 05 Aug 2023 17:13:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qSKqE-0002sw-Mj
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 05 Aug 2023 17:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dhm/JW5SkC4rjA1loNWUHQ5RIZWIu5ijoCJ4p5iGZ+4=; b=BEN+iEdE1IfSCXdcBDrTwCixrd
 qnOPpUfnboUoqchCV6Yt0eVcDMl2sfG8kdlmNelZeowl3xumzgRuqD1Gb7EjlhJ80wUo8UODUmXZt
 VS/yWU3YNN9SksTl1+0i5jZkLRbFjzY/c7d9rR45U5F9yGK/bB1UTL0bbpTiLo+4E8UI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dhm/JW5SkC4rjA1loNWUHQ5RIZWIu5ijoCJ4p5iGZ+4=; b=f2CPw1XEAz9a/GchtaoI5dApk8
 e6uMHK/8QirzPXLYefU72b2cRxePF/TgnrHqDqaQe+nOnT2/mRgRNfuyz0icEhWzBxJsAoimvmNPB
 nDpTbkEFYFRM/BkP7nqJjPWUSOd7fOGmburVzNP/i9JTu5Qc3WcL0oAZ2KnMWJxJVBcA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qSKqE-0001J3-Fz for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 05 Aug 2023 17:13:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8DE360B56;
 Sat,  5 Aug 2023 17:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48498C433C8;
 Sat,  5 Aug 2023 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691255600;
 bh=ZfbjUjtwjQ3RdoKZ4m9be+A3vKSXVdCSc1xlaCOCYaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GPg8Jk0hmq/xHabhON9f9Wy4e6exu8iJEYNopK5zDw8GmrFoQGT2DAXxd87LbWap8
 4/d+lARj/a+CAYc0aXP8vt0XyFD50NbrypchRRdrvRVesi8hQ5+cEJMlEIBNxUxc+d
 ju3eCdqdVSpgSL9LURl8ByQA2GFWm47ugH4yf4iithQ0PhmracdrwHb7oSvfUhq7Ai
 nCDi4+LRW1PkLg70nBcnYsgykVajnsxEbLJ7zF6Rc6eY3wzAXbqT8zx3H+lqrTWMP6
 IHpiobC/SI7B85Kpm8M7ejKRDRklWb6ijfPX4OnHfxRBF3MQG4f0ma58crs+q7UJ0a
 TmEspZ09z2ylw==
Date: Sat, 5 Aug 2023 19:13:13 +0200
From: Christian Brauner <brauner@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230805-langzeitfolgen-notation-dfd8a0175060@brauner>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-12-hch@lst.de>
 <20230802163219.GW11352@frogsfrogsfrogs>
 <20230805083239.GA29780@lst.de>
 <20230805161904.GM11377@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230805161904.GM11377@frogsfrogsfrogs>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Aug 05, 2023 at 09:19:04AM -0700, Darrick J. Wong
 wrote: > On Sat, Aug 05, 2023 at 10:32:39AM +0200, Christoph Hellwig wrote:
 > > On Wed, Aug 02, 2023 at 09:32:19AM -0700, Darrick J. Wong wrot [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qSKqE-0001J3-Fz
Subject: Re: [f2fs-dev] [PATCH 11/12] xfs: drop s_umount over opening the
 log and RT devices
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, linux-nilfs@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Aug 05, 2023 at 09:19:04AM -0700, Darrick J. Wong wrote:
> On Sat, Aug 05, 2023 at 10:32:39AM +0200, Christoph Hellwig wrote:
> > On Wed, Aug 02, 2023 at 09:32:19AM -0700, Darrick J. Wong wrote:
> > > > +	/* see get_tree_bdev why this is needed and safe */
> > > 
> > > Which part of get_tree_bdev?  Is it this?
> > > 
> > > 		/*
> > > 		 * s_umount nests inside open_mutex during
> > > 		 * __invalidate_device().  blkdev_put() acquires
> > > 		 * open_mutex and can't be called under s_umount.  Drop
> > > 		 * s_umount temporarily.  This is safe as we're
> > > 		 * holding an active reference.
> > > 		 */
> > > 		up_write(&s->s_umount);
> > > 		blkdev_put(bdev, fc->fs_type);
> > > 		down_write(&s->s_umount);
> > 
> > Yes.  With the refactoring earlier in the series get_tree_bdev should
> > be trivial enough to not need a more specific reference.  If you
> > think there's a better way to refer to it I can update the comment,
> > though.
> 
> How about:
> 
> 	/*
> 	 * blkdev_put can't be called under s_umount, see the comment in
> 	 * get_tree_bdev for more details
> 	 */
> 
> with that and the label name change,
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>

Added that comment and you rvb in-tree.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
