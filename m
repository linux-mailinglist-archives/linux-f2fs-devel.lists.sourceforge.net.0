Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 812E2AFFFCF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 12:54:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lf0tli6P/WwDzhT6qUPmFkvK5+o7VlWTmRD+2P9bbY=; b=kOg4WqKSBqvE/BHBo/EZouzo5J
	ZtzEiQnvI+fGBUrhy2iyVm/HoTPx9Y0NExh/wwlKjF9dFwawj8gc0bO8XtO/bZmo5sDv0jSiUJxPI
	TpJiAgdv8MzB8LjJIRTnaqwnbTWBRp+1PIJhCQNsYpaaD0al8+gdTvgl8S7FrsnrQki0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZoux-0006gv-6n;
	Thu, 10 Jul 2025 10:54:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+2e715cd67e78fc9cab88+7991+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uZouv-0006go-2j for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 10:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0yeu9AVJZq7XsJ/NofubcOe4TkI8w75i5jtGUPaKRhY=; b=G9hy8gvbSkGVuoLl9u9oo3Eh6d
 8nrZAU3L/6HKojS1ZaQb03GB5xt5SbRJZrtx4vHjU9s6drTM0xPUFiU0473enJIwkw1agO2GQE1J3
 3tqpNbkHYwkEwASwD3h+0FUhsUqGuQt4jbz5sGZfYMJdfAwiYDAPTyTsb2DngcQYYBhM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0yeu9AVJZq7XsJ/NofubcOe4TkI8w75i5jtGUPaKRhY=; b=HXyttaWb9Qi6jiPkpeUmj3Mg0i
 F9Gd27OsSXRubtIRuGytT3uLU3Ha43xwqcqRIBP36l3M8g8wpWrJx4qLF54OtQtr0MAPx1oRRM9ZY
 4K/Kxw7IT9csza0L9ENZ8dMlfRqTQE7UOVHUvcnknGt+6APh4nDmPXTI9RqdovlhylQk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZouu-0006Cg-O1 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 10:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0yeu9AVJZq7XsJ/NofubcOe4TkI8w75i5jtGUPaKRhY=; b=QQf1nX+rxWvBDzBjXAkHamOoe8
 T+DYoYnfuomu+IQtuhFaCjlX4pzRCDJMStjBg+QmdisOEVnjMRydP+1AeNWKALESnz3YiaQ3iaqbj
 GkxBLV+twxmqgmLbwahiwKvasuKNY5fnFaCMlAm5HQXlcqmw5koSOQKjx7r9ozIcUiFiylgl8MtsI
 KLJI1hf7DF9CJXj2oBE7XjIcuYj6lg2m4IFy/2UQQG1D0YC5inAXVALU1VXLTSfR22PFfSmElixw+
 1F79n2ltfN2qFTs1stsD4WUD/o5DBl9ZIYv7fzMwcP7R44oj30/DfufQ2V9jwNoGLhx085Uiad+Se
 Ni53zqPg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZoun-0000000BXn2-2LbQ;
 Thu, 10 Jul 2025 10:54:09 +0000
Date: Thu, 10 Jul 2025 03:54:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <aG-b0UiIEX4G2-UC@infradead.org>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <20250708-geahndet-rohmaterial-0419fd6a76b3@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708-geahndet-rohmaterial-0419fd6a76b3@brauner>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 08, 2025 at 09:55:14AM +0200, Christian Brauner
 wrote: > I think letting filesystems implement their own holder ops should
 be > avoided if we can. Christoph may chime in here. Ccing helps for that..
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZouu-0006Cg-O1
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
Cc: ntfs3@lists.linux.dev, jack@suse.cz, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 08, 2025 at 09:55:14AM +0200, Christian Brauner wrote:
> I think letting filesystems implement their own holder ops should be
> avoided if we can. Christoph may chime in here.

Ccing helps for that..

>
> I have no appettite for
> exporting stuff like get_bdev_super() unless absolutely necessary. We
> tried to move all that handling into the VFS to eliminate a slew of
> deadlocks we detected and fixed. I have no appetite to repeat that
> cycle.

Exactly.

> The shutdown method is implemented only by block-based filesystems and
> arguably shutdown was always a misnomer because it assumed that the
> filesystem needs to actually shut down when it is called. IOW, we made
> it so that it is a call to action but that doesn't have to be the case.
> Calling it ->remove_bdev() is imo the correct thing because it gives
> block based filesystem the ability to handle device events how they see
> fit.
> 
> Once we will have non-block based filesystems that need a method to
> always shut down the filesystem itself we might have to revisit this
> design anyway but no one had that use-case yet.

I'm not sure what non-block file systems would need it for except
maybe for a generic IOC_SHUTDOWN implementation, but that would have
a different signature anyway as it needs to pass flags that don't
fit here.  So that would be a separate method.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
