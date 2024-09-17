Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA3497AB5C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Sep 2024 08:20:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqRZZ-00069s-C2;
	Tue, 17 Sep 2024 06:20:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1sqRZX-00069k-73
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Sep 2024 06:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e/0YPUvuaLiWEAkJzh1AOKZrqRluEA0zzP4hr9kHNrg=; b=K2ACSkPM6a7yUnFLlM38EuGhKi
 xcMlAI3imtJN7lvMrEZ5lCOqrTGQl4hOdW+l4Pn4VsrGNaaJUUrZjHg6hFSHRGmu2/bCT0MgCPtmX
 csH8bTlJIz7cM4oNh3/eX2vYhIj0cBa+Xq/9pZHe39IxjrskBA97IIjrGEg6puc6jyX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e/0YPUvuaLiWEAkJzh1AOKZrqRluEA0zzP4hr9kHNrg=; b=QgMbNpsnBr0umeNBzIzf6jESBF
 5d+Zgfp8hV91oa2X4X8kFL9EP5Bn6NJzni4t6Gn5K+aOUF0rYuH9lfdVjJpaKobsIHnPn2NribZ/K
 htG2DAfSXvaGIPSELV8QMQAhx56t8QWgIyirq4E8qXc7vGNVjjLInSLa95BG39upBoSU=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqRZW-00067W-3W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Sep 2024 06:20:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id C391B227ACB; Tue, 17 Sep 2024 08:20:07 +0200 (CEST)
Date: Tue, 17 Sep 2024 08:20:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240917062007.GA4170@lst.de>
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c@epcas5p3.samsung.com>
 <20240910150200.6589-5-joshi.k@samsung.com> <20240912130235.GB28535@lst.de>
 <e6ae5391-ae84-bae4-78ea-4983d04af69f@samsung.com>
 <20240913080659.GA30525@lst.de>
 <4a39215a-1b0e-3832-93bd-61e422705f8b@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a39215a-1b0e-3832-93bd-61e422705f8b@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 16, 2024 at 07:19:21PM +0530,
 Kanchan Joshi wrote:
 > > Maybe part of the problem is that the API is very confusing. A smal >
 > part of that is of course that the existing temperature hints [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sqRZW-00067W-3W
Subject: Re: [f2fs-dev] [PATCH v5 4/5] sd: limit to use write life hints
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
Cc: vishak.g@samsung.com, jack@suse.cz, linux-nvme@lists.infradead.org,
 James.Bottomley@HansenPartnership.com, Christoph Hellwig <hch@lst.de>,
 sagi@grimberg.me, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 Nitesh Shetty <nj.shetty@samsung.com>, linux-block@vger.kernel.org,
 viro@zeniv.linux.org.uk, kbusch@kernel.org, jaegeuk@kernel.org,
 bvanassche@acm.org, axboe@kernel.dk, brauner@kernel.org,
 martin.petersen@oracle.com, jlayton@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, chuck.lever@oracle.com,
 linux-fsdevel@vger.kernel.org, javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Sep 16, 2024 at 07:19:21PM +0530, Kanchan Joshi wrote:
> > Maybe part of the problem is that the API is very confusing.  A smal
> > part of that is of course that the existing temperature hints already
> > have some issues, but this seems to be taking them make it significantly
> > worse.
> 
> Can you explain what part is confusing. This is a simple API that takes 
> type/value pair. Two types (and respective values) are clearly defined 
> currently, and more can be added in future.

I though I outlined that below.

> > But if we increase this to a variable number of hints that don't have
> > any meaning (and even if that is just the rough order of the temperature
> > hints assigned to them), that doesn't really work.  We'll need an API
> > to check if these stream hints are supported and how many of them,
> > otherwise the applications can't make any sensible use of them.
> 
> - Since writes are backward compatible, nothing bad happens if the 
> passed placement-hint value is not supported. Maybe desired outcome (in 
> terms of WAF reduction) may not come but that's not a kernel problem 
> anyway. It's rather about how well application is segregating and how 
> well device is doing its job.

What do you mean with "writes are backward compatible" ?

> - Device is perfectly happy to work with numbers (0 to 256 in current 
> spec) to produce some value (i.e., WAF reduction). Any extra 
> semantics/abstraction on these numbers only adds to the work without 
> increasing that value. If any application needs that, it's free to 
> attach any meaning/semantics to these numbers.

If the device (or file system, which really needs to be in control
for actual files vs just block devices) does not support all 256
we need to reduce them to less than that.  The kernel can help with
that a bit if the streams have meanings (collapsing temperature levels
that are close), but not at all if they don't have meanings.  The
application can and thus needs to know the number of separate
streams available.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
