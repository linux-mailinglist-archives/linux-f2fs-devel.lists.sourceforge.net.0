Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB542F021A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Jan 2021 18:11:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyHmH-0000iD-4j; Sat, 09 Jan 2021 17:11:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kyHmF-0000i4-UO
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 17:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZYhJUc5ZXLsKUyRktfIqadLFqckCilBHf3LctYd4O60=; b=klLCMFqAVdD6+U0SqBacJQWxTe
 lthFYBNWV4QOEoFQiFgP8VL2T1Zril8f5nlWhXHNjoLKS4z7X5YQU2PSnXOX9si4krl+Y3qExpW1j
 +gOfCQjOgwz0DATWyGZ+eNbVfZTasPPjQys62y1IMEdN3yE9jUfDTlym54QgWtVKDfSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZYhJUc5ZXLsKUyRktfIqadLFqckCilBHf3LctYd4O60=; b=fiSEWuLwaCfqioZKoWELm4E2gf
 uFyHkFRf0Wpf33IeOVSxH+W7vyLy8kSenUgtrmqiABLX9sGHYApGmDAHZCDqig33n38TKF5eq0deO
 XP1mrbYTvrbNJ7YWO40ROfT3fvTbLMmXZFaBRplzWN5IDs8+9eTr+DKuX579LmP/Xt84=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyHm7-0055s6-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 17:11:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52DF32343F;
 Sat,  9 Jan 2021 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610212293;
 bh=i8Ku1/73rYowfl/ZwVRB3ZZQr3ISV6I1jnO+n26Fujk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4xvqIKvtTClFnLpzv7E3zlN8gpkDmspUC18y8blQE4mEjl6J6DwpUtkg0AsMFn1w
 ahciPeIFOIkv0TJP21Q5uwxKXvqczOXaqsxkAdxXVwlK56MB8+oMpWb4Nw+NU/RxLy
 4RN1VQdBnnYwcBHRHIoo4cH8g3cXIMNLklV7weqsNXYImcGPtwbDUg1HEEA2ymKlsX
 7VcGOa7iZHIzvZSbFwgEOJKArpB7AGolFYsXhzq3Vczv2+9gDwbED9svjGEmxeDOix
 AdBRfOG7b7GylsjDdJGyv9ZUWnrgrlXqXp0DGM4CA6dhfjb4ciODpHGf0HPh58yrTa
 6gHyWRrhARYqw==
Date: Sat, 9 Jan 2021 09:11:31 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <X/njw9b+qqK3vlMs@sol.localdomain>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-2-ebiggers@kernel.org>
 <20210107144709.GG12990@quack2.suse.cz>
 <20210108090133.GD1438@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108090133.GD1438@lst.de>
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
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kyHm7-0055s6-Aq
Subject: Re: [f2fs-dev] [PATCH 01/13] fs: avoid double-writing inodes on
 lazytime expiration
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
Cc: Jan Kara <jack@suse.cz>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 08, 2021 at 10:01:33AM +0100, Christoph Hellwig wrote:
> > +	/*
> > +	 * If inode has dirty timestamps and we need to write them, call
> > +	 * mark_inode_dirty_sync() to notify filesystem about it.
> > +	 */
> > +	if (inode->i_state & I_DIRTY_TIME &&
> > +	    (wbc->for_sync || wbc->sync_mode == WB_SYNC_ALL ||
> > +	     time_after(jiffies, inode->dirtied_time_when +
> > +			dirtytime_expire_interval * HZ))) {
> 
> If we're touching this area, it would be nice to split this condition
> into a readable helper ala:
> 
> static inline bool inode_needs_timestamp_sync(struct writeback_control *wbc,
> 		struct inode *inode)
> {
> 	if (!(inode->i_state & I_DIRTY_TIME))
> 		return false;
> 	if (wbc->for_sync || wbc->sync_mode == WB_SYNC_ALL)
> 		return true;
> 	return time_after(jiffies, inode->dirtied_time_when +
> 			  dirtytime_expire_interval * HZ);
> }

I didn't end up doing this since it would only be called once, and IMO it's more
readable to keep it inlined next to the comment that explains what's going on.
Especially considering the later patch that drops the check for wbc->for_sync.

-  Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
