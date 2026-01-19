Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 403BCD3A7E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 13:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WB8RqI9FS1PMM1BM17PrRNuGe7YnCKRHmhMeXOks8Ek=; b=h7+ZOtuTGzDkg9Etudtc9cGcE4
	xqFa95vyrTb/8bhc+omM2TqdMx5uPpiH3mp3UGBq6XQo0G29AvKWAdvfSa1STylVgg30GmmbEPMlY
	yeT6TsrNMvbJnJpqpmlx/+m4bq/Z76tKZsbbt/L9BzWlJqJd+cYyKth5BnnS4CXbw2jI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vho1b-0000do-Dj;
	Mon, 19 Jan 2026 12:06:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vho1Z-0000dg-Pe
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 12:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=25bupFG3LbVCBA+mOqgPL3BFSrXRxSp8im/fM36C+ws=; b=PQkwBI4nOSqe4KTMilUmFW4H+y
 HLK2gUBvovjTbWILUtYX0UksBPv0UjLDDbvfM7qaANWnn9KBY55WKInH8M3E7XxQyN2PbMeALG+0b
 dixztCGEJB75eyak5kmfWJ9QdL0Id9T0IpLyuYJ6DIrzfoaavvsyVSb2kzJeGeAM1fcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=25bupFG3LbVCBA+mOqgPL3BFSrXRxSp8im/fM36C+ws=; b=gry7y1JOtoJQ7CWKnnOsdx58M+
 ZoTiyhaoi4zBSPTzKZCQnjGaASoIqeGa8EO3Az29iOqG75LJoWFN0drCIS9rHI1neJR+qMxU9CbJS
 GUnNALCP9+ecYSoVtIvkUikv9JpCV2upzlCFegdWYvounjZVRwSyh9vF+SIAFxUnugzc=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vho1Y-000115-OR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 12:06:25 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9BBA6227A88; Mon, 19 Jan 2026 13:06:11 +0100 (CET)
Date: Mon, 19 Jan 2026 13:06:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20260119120611.GA23787@lst.de>
References: <20260119062250.3998674-1-hch@lst.de>
 <20260119062250.3998674-4-hch@lst.de>
 <20260119-davon-krippenkind-78d683621491@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-davon-krippenkind-78d683621491@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 11:02:37AM +0100, Christian Brauner
 wrote: > > + if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) { > >
 + if (filp->f_mode & FMODE_WRITE) > > + return -EPERM; > > + return [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vho1Y-000115-OR
Subject: Re: [f2fs-dev] [PATCH 3/6] fs,
 fsverity: handle fsverity in generic_file_open
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
Cc: fsverity@lists.linux.dev, Jan Kara <jack@suse.cz>,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 19, 2026 at 11:02:37AM +0100, Christian Brauner wrote:
> > +	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) {
> > +		if (filp->f_mode & FMODE_WRITE)
> > +			return -EPERM;
> > +		return fsverity_file_open(inode, filp);
> > +	}
> 
> This is the only one where I'm not happy about the location.
> This hides the ordering requirement between fsverity and fscrypt. It's
> easier to miss now. This also really saves very little compared to the
> other changes. So I wonder whether it's really that big of a deal to
> have the call located in the open routines of the filesystems.

So my idea was to do a similar pass for fscrypt eventually, and enforce
the ordering in one place, instead of relying on file systems to get it
right.  I'd be fine with delaying this patch until then and give it
another try.  The good thing is that unlike say the stat hook fsverity
will simply not work without wiring this up, so it can't be easily
forgotten.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
