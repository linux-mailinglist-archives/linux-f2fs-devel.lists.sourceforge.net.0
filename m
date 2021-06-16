Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC63AA089
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 17:57:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltXvE-00044p-VP; Wed, 16 Jun 2021 15:57:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1ltXv6-00044T-B2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 15:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MzEXeyUJtYhb/jhKtsstzQNYPYyugeSQ7deyI5/x/eg=; b=O5vYZaoziMLVznYRukm2JfzU3j
 QV/GKpRsO3dMT3LHnVdLR+yJ5YuK5tWIgk+eaxtKGb6chpXdKQ7PAmqM2qWW9wjItam2vV69AVZ14
 PfQtxAWU0ClsxOPixSilw0t0SXzrU6KKzdk5w8jQ6sNivNO2XEKnq+wPrInRfcTnHjgk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MzEXeyUJtYhb/jhKtsstzQNYPYyugeSQ7deyI5/x/eg=; b=WSxwBX3Wc5tqRYyHomGE3Z0evf
 E06Jt5IJyyNN6Wm3m/KnENi0zhNb3bTtw9ZBTfmvdrtCCJCOTSYHWcN2rgmAJrs0RRZbmor2VlMhw
 F/KSvTuNQkmNIpb4RncU1afjObz6SMwFS01Fv6vBbAiJ9NlNIm5OtvTHtJN6U2lf26yc=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1ltXux-0000Ab-1R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 15:57:36 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4D62F21A32;
 Wed, 16 Jun 2021 15:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623859034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MzEXeyUJtYhb/jhKtsstzQNYPYyugeSQ7deyI5/x/eg=;
 b=QluPc+xaSD6lMsYHFrTXOo9S19BGMh1dPOZCU9V9lAjMlVkbzEPC76NIYkzAlyHL6z0G2X
 6V1D7RAO4dKfvHWXp9WKGolBz/Xim2qqndj/0aTBqw4NNJ/W710NpTjVSzVtUU+bCo6ztK
 HR1Cd37auJvcp2UU0GST9EsPQ8ys2k8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623859034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MzEXeyUJtYhb/jhKtsstzQNYPYyugeSQ7deyI5/x/eg=;
 b=jHTUUdWi2cy0yZq6g8W0CohAQJWdKoqUkM3WbwT5QWy5M/vj4YqpLcOCdoKxgHFiAm+6jn
 h8dOe0bJlFuiCtAw==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 638F1A3BAE;
 Wed, 16 Jun 2021 15:57:13 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4FE0F1F2C68; Wed, 16 Jun 2021 17:57:12 +0200 (CEST)
Date: Wed, 16 Jun 2021 17:57:12 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210616155712.GC28250@quack2.suse.cz>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-7-jack@suse.cz>
 <YMmOCK4wHc9lerEc@infradead.org>
 <20210616085304.GA28250@quack2.suse.cz>
 <20210616154705.GE158209@locust>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616154705.GE158209@locust>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ltXux-0000Ab-1R
Subject: Re: [f2fs-dev] [PATCH 07/14] xfs: Refactor xfs_isilocked()
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
Cc: Jan Kara <jack@suse.cz>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, linux-cifs@vger.kernel.org,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 linux-ext4@vger.kernel.org, Eric Sandeen <sandeen@redhat.com>,
 Dave Chinner <dchinner@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, Pavel Reichl <preichl@redhat.com>,
 Johannes Thumshirn <jth@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 16-06-21 08:47:05, Darrick J. Wong wrote:
> On Wed, Jun 16, 2021 at 10:53:04AM +0200, Jan Kara wrote:
> > On Wed 16-06-21 06:37:12, Christoph Hellwig wrote:
> > > On Tue, Jun 15, 2021 at 11:17:57AM +0200, Jan Kara wrote:
> > > > From: Pavel Reichl <preichl@redhat.com>
> > > > 
> > > > Refactor xfs_isilocked() to use newly introduced __xfs_rwsem_islocked().
> > > > __xfs_rwsem_islocked() is a helper function which encapsulates checking
> > > > state of rw_semaphores hold by inode.
> > > 
> > > __xfs_rwsem_islocked doesn't seem to actually existing in any tree I
> > > checked yet?
> > 
> > __xfs_rwsem_islocked is introduced by this patch so I'm not sure what are
> > you asking about... :)
> 
> The sentence structure implies that __xfs_rwsem_islocked was previously
> introduced.  You might change the commit message to read:
> 
> "Introduce a new __xfs_rwsem_islocked predicate to encapsulate checking
> the state of a rw_semaphore, then refactor xfs_isilocked to use it."
> 
> Since it's not quite a straight copy-paste of the old code.

Ah, ok. Sure, I can rephrase the changelog (or we can just update it on
commit if that's the only problem with this series...). Oh, now I've
remembered I've promised you a branch to pull :) Here it is with this
change and Christoph's Reviewed-by tags:

git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git hole_punch_fixes

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
