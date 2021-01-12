Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 779CB2F3131
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jan 2021 14:23:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzJeC-0007z3-Hn; Tue, 12 Jan 2021 13:23:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1kzJeB-0007yq-6A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 13:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eabuVjBsAa5J0KMMVi9kNri7jQ0qsf91JyCWIJ0Ohn8=; b=laNvw0boEmMvKrrtSFO2Zl0M2U
 10nbukWGJq4quSgs9WDEdWHO9V2vNz7CDvCi0ZZcsdtq20Q6IZ8nYmI5UYTNC1QabLJWLkV/8kw6u
 ingmPfsgsfBn53T4zJ18lw3b32K6ZmOGBpS6R9lWtD6/AJRQqx0jUIEDyJbomAzjBgL0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eabuVjBsAa5J0KMMVi9kNri7jQ0qsf91JyCWIJ0Ohn8=; b=Kz1uW93eZkp1bYIbDUCP560Z36
 Z2f2Na8e9mFN0c3oOqM8pgIiYmdezh0gNEjaTu/41RuhFZlO8dJhuOxfLKkEVokJoLqxsjTzsKJ6w
 BoDWJ0DS+WtNEWGzv63uKx/Qlv9sOlLx5ITGOhL8PxFvtynsV5ALOtcHC4UizjScuChE=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzJe0-00ED6b-Eh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 13:23:42 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B37E067373; Tue, 12 Jan 2021 14:23:15 +0100 (CET)
Date: Tue, 12 Jan 2021 14:23:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210112132315.GA13780@lst.de>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-5-ebiggers@kernel.org> <20210111105201.GB2502@lst.de>
 <X/ysA8PuJ/+JXQYL@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/ysA8PuJ/+JXQYL@sol.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kzJe0-00ED6b-Eh
Subject: Re: [f2fs-dev] [PATCH v2 04/12] fat: only specify I_DIRTY_TIME when
 needed in fat_update_time()
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 11, 2021 at 11:50:27AM -0800, Eric Biggers wrote:
> On Mon, Jan 11, 2021 at 11:52:01AM +0100, Christoph Hellwig wrote:
> > On Fri, Jan 08, 2021 at 11:58:55PM -0800, Eric Biggers wrote:
> > > +	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
> > > +		dirty_flags |= I_DIRTY_SYNC;
> > 
> > fat does not support i_version updates, so this bit can be skipped.
> 
> Is that really the case?  Any filesystem (including fat) can be mounted with
> "iversion", which causes SB_I_VERSION to be set.
> 
> A lot of filesystems (including fat) don't store i_version to disk, but it looks
> like it will still get updated in-memory.  Could anything be relying on that?

As Dave pointed out i_version can't really work for fat.  But I guess
that is indeed out of scope for this series, so let's go ahead with this
version for now:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
