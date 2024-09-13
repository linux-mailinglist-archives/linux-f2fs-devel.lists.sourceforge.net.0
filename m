Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE88B977AA8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Sep 2024 10:07:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sp1Km-0006qM-Ea;
	Fri, 13 Sep 2024 08:07:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1sp1Kk-0006pu-Nz
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 08:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oEeV1sbzLAtDYxQWJxm7FS6uaKIISmSEVCYRh8rE8tE=; b=hvXwFcorhYgnIsofGCt+mQsU6f
 m/Gc5H4Ca4zP907CvbVgzFEaozYNFQcyh/W2ltrURtJbl//WXAALdHQeTCAdyufij6kn6JGTPKUcG
 wpZP/zkM39TSNFVoRLbwBGmLHFZ5gmDXq35mLYkz0jGNnuVO2bJTftk3EE93p3akaaOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oEeV1sbzLAtDYxQWJxm7FS6uaKIISmSEVCYRh8rE8tE=; b=GRSnPtU0nb+3NexPQ+ZgPjP+YY
 jZgnSh9llpQ0x5PJFXpYF6ovtUQ8VSwhJQF/9m4rdYu5kTQNTUoFu+4JP1/HmNmW/f1dWKM/TZwiZ
 IfDuBGU9P7hOrIVqTg1cg+Z05obAJuW51xv7eQtLUWiScF0PiGI8+YETAxUJifiCwl00=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sp1Kk-0004Yt-7A for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 08:07:15 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3DAE2227ABD; Fri, 13 Sep 2024 10:07:00 +0200 (CEST)
Date: Fri, 13 Sep 2024 10:06:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240913080659.GA30525@lst.de>
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c@epcas5p3.samsung.com>
 <20240910150200.6589-5-joshi.k@samsung.com> <20240912130235.GB28535@lst.de>
 <e6ae5391-ae84-bae4-78ea-4983d04af69f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6ae5391-ae84-bae4-78ea-4983d04af69f@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 12, 2024 at 10:01:00PM +0530,
 Kanchan Joshi wrote:
 > Please see the response in patch #1. My worries were: > (a) adding a new
 field and propagating it across the stack will cause > code du [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1sp1Kk-0004Yt-7A
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

On Thu, Sep 12, 2024 at 10:01:00PM +0530, Kanchan Joshi wrote:
> Please see the response in patch #1. My worries were:
> (a) adding a new field and propagating it across the stack will cause 
> code duplication.
> (b) to add a new field we need to carve space within inode, bio and 
> request.
> We had a hole in request, but it is set to vanish after ongoing 
> integrity refactoring patch of Keith [1]. For inode also, there is no 
> liberty at this point [2].
> 
> I think current multiplexing approach is similar to ioprio where 
> multiple io priority classes/values are expressed within an int type. 
> And few kernel components choose to interpret certain ioprio values at will.
> 
> And all this is still in-kernel details. Which can be changed if/when 
> other factors start helping.

Maybe part of the problem is that the API is very confusing.  A smal
part of that is of course that the existing temperature hints already
have some issues, but this seems to be taking them make it significantly
worse.

Note: this tries to include highlevel comments from the discussion of
the previous patches instead of splitting them over multiple threads.

F_{S,G}ET_RW_HINT works on arbitrary file descriptors with absolutely no
check for support by the device or file system and not check for the
file type.  That's not exactly good API design, but not really a major
because they are clearly designed as hints with a fixed number of
values, allowing the implementation to map them if not enough are
supported.

But if we increase this to a variable number of hints that don't have
any meaning (and even if that is just the rough order of the temperature
hints assigned to them), that doesn't really work.  We'll need an API
to check if these stream hints are supported and how many of them,
otherwise the applications can't make any sensible use of them.

If these aren't just stream hints of the file system but you actually
want them as an abstract API for FDP you'll also need to actually
expose even more information like the reclaim unit size, but let's
ignore that for this part of the discssion.

Back the the API: the existing lifetime hints have basically three
layers:

 1) syscall ABI
 2) the hint stored in the inode
 3) the hint passed in the bio

1) is very much fixed for the temperature API, we just need to think if
   we want to support it at the same time as a more general hints API.
   Or if we can map one into another.  Or if we can't support them at
   the same time how that is communicated.

For 2) and 3) we can use an actual union if we decide to not support
both at the same time, keyed off a flag outside the field, but if not
we simply need space for both.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
