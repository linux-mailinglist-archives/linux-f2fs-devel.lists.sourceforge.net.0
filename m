Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 874EB163CB8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 06:36:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4I1e-0001QX-ON; Wed, 19 Feb 2020 05:35:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4I1d-0001Q8-KP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 05:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i5jjRMxpChRQy+2J/xRxaZpOqmFrFWQR+xd6cg6u2PI=; b=FQfd/iYO1wASKU+yu4PB1fk2mv
 kR2PAxr6JjOtxOjMPRuEUhDRiUXts7JcgMaNjwLyhiKDmDz7eDcIObBym/OOX511aO642ZPmDvGpW
 +x4efuvJYB6cKb1BA3k2fKlX5QgI2otjE2MrynfKqYC90REfRewaRKy7aL0zrnu+8btI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i5jjRMxpChRQy+2J/xRxaZpOqmFrFWQR+xd6cg6u2PI=; b=HWdjHX4/hnF9Zu6mtdlBeyCX1T
 xPQS95UWp7H41P/N1KdGmisyjuT3vjOd42uq7wo4NDD5Aad/V9RfNKsAfSCwYDm0SBzG/+DROQo1h
 sCPECiFZfg1MyaEhStECtnGZcWNJRaEcplrzrVbkULHJiVlyp2jn4LT1lMIg3kf6DKVM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4I1c-007Z9D-Dn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 05:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=i5jjRMxpChRQy+2J/xRxaZpOqmFrFWQR+xd6cg6u2PI=; b=DuVHuymBPWn5wDST1aeEelhfNM
 /bXL88FT9MFQnHGtbK4rSNZ+luoUIXATKSnNmq0w0g+oFVWjyKpy66W6FFgRGnswoBOWQpscJbJQP
 4VedcAPQbAlzmDR4kFU3J0Di3kgpR1We770va4VzU0v+3uU5Psu/vRRzwnfoiQqbwdrygPBoB0Acc
 Kj/viayLIFCgDZTYuGeW41k0nXnLmWVc48ZXm+FRjozkqV+sHubRee661ywX49PCOT/E1uqhfX2Ny
 D9csTE5YF0U7xa7/EP5Jtkli2RRKOHF+UMVo8N/d71C108g1DAP7O0iiHuaezDNJcoHL5lnGSyTJU
 QRfWManA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4I1Q-0004Jt-TF; Wed, 19 Feb 2020 05:35:44 +0000
Date: Tue, 18 Feb 2020 21:35:44 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200219053544.GN24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-31-willy@infradead.org>
 <d4803ef9-7a2f-965f-8f0f-c5e15396d892@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4803ef9-7a2f-965f-8f0f-c5e15396d892@nvidia.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4I1c-007Z9D-Dn
Subject: Re: [f2fs-dev] [PATCH v6 17/19] iomap: Restructure
 iomap_readpages_actor
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 18, 2020 at 07:17:18PM -0800, John Hubbard wrote:
> > -	for (done = 0; done < length; done += ret) {
> 
> nit: this "for" loop was perfect just the way it was. :) I'd vote here for reverting
> the change to a "while" loop. Because with this change, now the code has to 
> separately initialize "done", separately increment "done", and the beauty of a
> for loop is that the loop init and control is all clearly in one place. For things
> that follow that model (as in this case!), that's a Good Thing.
> 
> And I don't see any technical reason (even in the following patch) that requires 
> this change.

It's doing the increment in the wrong place.  We want the increment done in
the middle of the loop, before we check whether we've got to the end of
the page.  Not at the end of the loop.

> > +	BUG_ON(ctx.cur_page);
> 
> Is a full BUG_ON() definitely called for here? Seems like a WARN might suffice...

Dave made a similar comment; I'll pick this up there.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
