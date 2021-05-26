Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 959003914BE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 12:19:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llqct-0001Yd-50; Wed, 26 May 2021 10:18:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1llqcq-0001YP-HF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 10:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zy950XykkrJ6BQwKrm2bOZ69SbTGj6TawhTTxHONnfc=; b=h786jLGLIW5NEyUFXtvaxpgzWH
 riEDSqD4tO2RlRwchrF8CRh2cmYWvvoeo0Vr7kr5oR/Yo6v33CD/CT5tAnHsPvgml2nG6eS8J8nzz
 //ybZanSbXUYp2I42LlbJ3lGe+GzWq3zhNikIyxG3vikOrHyXkPDeHhwLkc2x74woDF8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zy950XykkrJ6BQwKrm2bOZ69SbTGj6TawhTTxHONnfc=; b=ARFwCX0DwPpBVpepgb+TAKciZy
 RLPetKa7DW86bqbHWDSZp3BkwvwHJbGWxBqNnPUr0oiNTWo9R8Ux5OdGHiyG5dQWI0rp1rPdDem2E
 m6y9SnITrv7L1zlLRQVCukAgGjRZWx5dl0w/i0Jn7Dn8Ah2l0kXJqiOmu5iRqnl8okEk=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1llqch-006PZS-86
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 10:18:57 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622024321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zy950XykkrJ6BQwKrm2bOZ69SbTGj6TawhTTxHONnfc=;
 b=wkbwouza/uoHMYVNU2DGIsOW7TInyVbvT0rZ7N1OWO6Rh+djnaSCfcAyeF6DN/8dJ1wL64
 rHi+2qgfiyBeulHqBiX0hnyvOgf4l2CuTdZW8kUS6fzCEFHDQuky3UGZGOSXymBaLH4KHR
 Lm88zZdt8iZCUNRO0yBGBjg/FShyHHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622024321;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zy950XykkrJ6BQwKrm2bOZ69SbTGj6TawhTTxHONnfc=;
 b=9hNfRZyzRnis/OPuk5nHQikSuG7UpjGYzqxh8Fx9LtXgJhKisRFsTmBBlUbXWJw3rWKKnj
 KP4FtPqoswh/zIAA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD935B23D;
 Wed, 26 May 2021 10:18:40 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 643461F2CAC; Wed, 26 May 2021 12:18:40 +0200 (CEST)
Date: Wed, 26 May 2021 12:18:40 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210526101840.GC30369@quack2.suse.cz>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-7-jack@suse.cz>
 <20210525213729.GC202144@locust>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525213729.GC202144@locust>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1llqch-006PZS-86
Subject: Re: [f2fs-dev] [PATCH 07/13] xfs: Convert to use invalidate_lock
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Jan Kara <jack@suse.cz>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Ted Tso <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue 25-05-21 14:37:29, Darrick J. Wong wrote:
> On Tue, May 25, 2021 at 03:50:44PM +0200, Jan Kara wrote:
> > Use invalidate_lock instead of XFS internal i_mmap_lock. The intended
> > purpose of invalidate_lock is exactly the same. Note that the locking in
> > __xfs_filemap_fault() slightly changes as filemap_fault() already takes
> > invalidate_lock.
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > CC: <linux-xfs@vger.kernel.org>
> > CC: "Darrick J. Wong" <darrick.wong@oracle.com>
> 
> It's djwong@kernel.org now.

OK, updated.

> > @@ -355,8 +358,11 @@ xfs_isilocked(
> >  
> >  	if (lock_flags & (XFS_MMAPLOCK_EXCL|XFS_MMAPLOCK_SHARED)) {
> >  		if (!(lock_flags & XFS_MMAPLOCK_SHARED))
> > -			return !!ip->i_mmaplock.mr_writer;
> > -		return rwsem_is_locked(&ip->i_mmaplock.mr_lock);
> > +			return !debug_locks ||
> > +				lockdep_is_held_type(
> > +					&VFS_I(ip)->i_mapping->invalidate_lock,
> > +					0);
> > +		return rwsem_is_locked(&VFS_I(ip)->i_mapping->invalidate_lock);
> 
> This doesn't look right...
> 
> If lockdep is disabled, we always return true for
> xfs_isilocked(ip, XFS_MMAPLOCK_EXCL) even if nobody holds the lock?
> 
> Granted, you probably just copy-pasted from the IOLOCK_SHARED clause
> beneath it.  Er... oh right, preichl was messing with all that...
> 
> https://lore.kernel.org/linux-xfs/20201016021005.548850-2-preichl@redhat.com/

Indeed copy-paste programming ;) It certainly makes the assertions happy
but useless. Should I pull the patch you reference into the series? It
seems to have been uncontroversial and reviewed. Or will you pull the
series to xfs tree so I can just rebase on top?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
