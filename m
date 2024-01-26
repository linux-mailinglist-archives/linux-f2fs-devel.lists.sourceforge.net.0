Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB9F83E38D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jan 2024 22:01:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTTKG-0008Ml-NG;
	Fri, 26 Jan 2024 21:01:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1rTTKE-0008Ma-SP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 21:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r/QEG1+GRs70rQ+r6RwZXc9jTJs5Jf1cK8sS2vy9OTU=; b=eiExbmWqsmtpO3vZoPCoDZ6CEC
 hF/RMCE9KhgXPssIhcXdgh1tM7Z6zQHU7sEg+ZRXCajJU8VwliE0kEzj6a5irBrVFU73rORKzeVcH
 1arFnkxWj9/6a/gPrURKOoKy0ZXjYaFg5YsMRHJdy9YH9kLl5JiK4jTlVXoz16NcaGJQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r/QEG1+GRs70rQ+r6RwZXc9jTJs5Jf1cK8sS2vy9OTU=; b=Xef0rGdDlB6XybHSN7a6HNXx2k
 EVL//fk4rjBs+2vJZEvWHg0iM2iv81mVQIDp1OiQMnrGierpRUXayKjPwX9RiZHEcQsertc2+aAIv
 DyEBZn9UPV1HeQ6XJ09WoSeDex7uDSFR7iaSVOGG9+ygcm5hh8qui8CXnEaLnpjtWLhE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTTKD-0003BR-1n for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 21:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=r/QEG1+GRs70rQ+r6RwZXc9jTJs5Jf1cK8sS2vy9OTU=; b=a6nigD30c17ynoFn1++uO4A7rB
 gBLNhhEo+pCSqVhVYWH0mQV6ltDRyprpRDjL6ZBPRRZEpeyZpNb/IZbOXUdO9Cj6m2GKVXw+2Dj0T
 MdRat3pIfEqyJ8iv7xrggI+qBxtQuetCP89u3dcSf3mcZI2Kw9J6bJly4sclyfPZfo214N3SwhMvT
 yy4ufWAt98IFJ2EHzZmNeRiRWxDwzn9T2LrRSWM45f1wBizs0lEuWmYfrZG3ofJkG3CMweKlUwv21
 Dvz3wChQlBJd/S7n1XHNcZCuYY9DfjNi063dK0fGrElQSJ45A/Gzy2azctDB6oPreBUMcbXB7tgac
 wpF82cMg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTTJz-0000000EqNO-07FO;
 Fri, 26 Jan 2024 21:01:07 +0000
Date: Fri, 26 Jan 2024 21:01:06 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZbQdkiwEs8o4h807@casper.infradead.org>
References: <Y4ZaBd1r45waieQs@casper.infradead.org>
 <20221130124804.79845-1-frank.li@vivo.com>
 <Y4d0UReDb+EmUJOz@casper.infradead.org>
 <Y5D8wYGpp/95ShTV@bombadil.infradead.org>
 <ZbLI63UHBErD6_L2@casper.infradead.org>
 <ZbLKl25vxw0eTzGE@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZbLKl25vxw0eTzGE@bombadil.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 25, 2024 at 12:54:47PM -0800, Luis Chamberlain
 wrote: > On Thu, Jan 25, 2024 at 08:47:39PM +0000, Matthew Wilcox wrote:
 > > On Wed, Dec 07, 2022 at 12:51:13PM -0800, Luis Chamberlain wrote [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rTTKD-0003BR-1n
Subject: Re: [f2fs-dev] [PATCH] f2fs: Support enhanced hot/cold data
 separation for f2fs
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, Yangtao Li <frank.li@vivo.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 vishal.moola@gmail.com, linux-mm@kvack.org,
 Adam Manzanares <a.manzanares@samsung.com>,
 Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier.gonz@samsung.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 25, 2024 at 12:54:47PM -0800, Luis Chamberlain wrote:
> On Thu, Jan 25, 2024 at 08:47:39PM +0000, Matthew Wilcox wrote:
> > On Wed, Dec 07, 2022 at 12:51:13PM -0800, Luis Chamberlain wrote:
> > > Me and Pankaj are very interested in helping on this front. And so we'll
> > > start to organize and talk every week about this to see what is missing.
> > > First order of business however will be testing so we'll have to
> > > establish a public baseline to ensure we don't regress. For this we intend
> > > on using kdevops so that'll be done first.
> > > 
> > > If folks have patches they want to test in consideration for folio /
> > > iomap enhancements feel free to Cc us :)
> > > 
> > > After we establish a baseline we can move forward with taking on tasks
> > > which will help with this conversion.
> > 
> > So ... it's been a year.  How is this project coming along?  There
> > weren't a lot of commits to f2fs in 2023 that were folio related.
> 
> The review at LSFMM revealed iomap based filesystems were the priority
> and so that has been the priority. Once we tackle that and get XFS
> support we can revisit which next fs to help out with. Testing has been
> a *huge* part of our endeavor, and naturally getting XFS patches up to
> what is required has just taken a bit more time. But you can expect
> patches for that within a month or so.

Is anyone working on the iomap conversion for f2fs?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
