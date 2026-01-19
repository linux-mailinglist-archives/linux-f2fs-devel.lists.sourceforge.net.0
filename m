Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05433D3A2DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 10:27:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPaqgncGZRTdvCDcgZGDguZKBjIjl+QRJEz5LQrMvE0=; b=GnjL0KxXZnLRHckaYDLHBvx4Zr
	wk6nJiiKn/pCaqHMpoHsOj16ZlGvBqgbQ00QJ+RZXcKSw2ihHNTL8vpmA4R8VsXvq808VSxKovthN
	QTa3wbZmo9t1EQTt7bMbjZpBeTqxeawc26gqeqTjckSxO3zWMsw2FqrezDMctPCjWYOk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhlXR-0005Vz-RA;
	Mon, 19 Jan 2026 09:27:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vhlXQ-0005Vt-6o
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 09:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cA0xUxJPRkJ1xPXXe1e/+Zc0kvABv8zM3Bsh+POaVSQ=; b=IzfeffE+dpivbpB90ai0zCJGaq
 gMZ69YDjzcw+zv1vCX/Pb1MkRyqLY73JfFX+SPsbyNrI3OffwAP2HiB2hF/IQkxISZ9M5AbmbRSU0
 ZEu+CEHU16faPUirc8AKgnmp5oUL9JXIw7I0qDENEFNZmOun4K7JFdMIM+Mqz8qdoSYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cA0xUxJPRkJ1xPXXe1e/+Zc0kvABv8zM3Bsh+POaVSQ=; b=NUPSYdARt5RbO5xWKAcNYSnfBJ
 IX4rPrFp/AQ7HBfH02ydz0jTYF1GjWyilzXV+HBbjM2nQMKO9bEx7GG/AuuotFUFmbXkKXLj8JbBL
 SnplyL1s3AswHxLrtMM/Pf8wa5RLFGidB06cVVmZbASDIDD/YasMXSY1R/czQ0RYtAY4=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhlXP-0000Kz-Hy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 09:27:08 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 95285227AA8; Mon, 19 Jan 2026 10:26:53 +0100 (CET)
Date: Mon, 19 Jan 2026 10:26:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20260119092653.GA10032@lst.de>
References: <20260119062250.3998674-1-hch@lst.de>
 <20260119062250.3998674-4-hch@lst.de>
 <tn4evey6q4ktzfu4vd2fmaz5j233cigw2grnyvzc4cnholsolb@z44vyuenknkl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tn4evey6q4ktzfu4vd2fmaz5j233cigw2grnyvzc4cnholsolb@z44vyuenknkl>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 10:05:56AM +0100, Jan Kara wrote:
 > > + if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) { > > + if
 (filp->f_mode
 & FMODE_WRITE) > > + return -EPERM; > > + return fsverity [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vhlXP-0000Kz-Hy
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 19, 2026 at 10:05:56AM +0100, Jan Kara wrote:
> > +	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) {
> > +		if (filp->f_mode & FMODE_WRITE)
> > +			return -EPERM;
> > +		return fsverity_file_open(inode, filp);
> > +	}
> 
> Why do you check f_mode here when fsverity_file_open() checks for it as
> well?

Probably because it's a left over from when I tried to open code
fsverity_file_open here.  I'll fix it up.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
