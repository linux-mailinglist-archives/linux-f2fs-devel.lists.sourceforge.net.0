Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A04F21063F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 10:32:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqYAf-0007fB-1m; Wed, 01 Jul 2020 08:32:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+501e1de201b53739768b+6156+infradead.org+hch@casper.srs.infradead.org>)
 id 1jqYAd-0007ey-Rq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 08:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vXiGSDx0OBTNUoDDVLCHJpE3R5npVOLQYlpMjYD89gk=; b=fYQiruI8Sg50/JWxwimN+6gCYf
 JxPGhB7NLY2ChEQFFaGnsYI4nx0wVxWnKhtYkt3BexU1n+U7NxLCW/+9Va21GH+l2oTjjVFrw98tV
 p6+3N7Av6Wb+vvhkBQRXtBRBEqzi8hI5Mtk01VS3v1Mg33U2GjCIGqK5rhy0qsp0gI4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vXiGSDx0OBTNUoDDVLCHJpE3R5npVOLQYlpMjYD89gk=; b=fyryTxfhQqGSvwOLt5UiL4N+bp
 jdyH76n771/FET5OEmZ4eKSNCOhCCBYySwdkPRVQIWNE/Ji9pKjQWjlfiNvMPh6tO0oLfAwKndfVZ
 rIYRvvR4ZhEbaOqSrbRE/ZkznrorR24TIH4L2QnLH9P4WIzNa8j7Us4xmFS3vo09t/ag=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqYAa-006pLu-LV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 08:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vXiGSDx0OBTNUoDDVLCHJpE3R5npVOLQYlpMjYD89gk=; b=qdapIMox4Ek2eTE/n0txbbOjGF
 oJGKiOEgDQ9amafICkn7wMpGQazpixnCsCP9vzB1sWllWfYlQ8DIw/BDrv8it538xchboPP1a3fnT
 /r7lFtLJtFEe6qnkJAw62zmPT8rzrymyJ0nyAnw3cv66pExz0H6f2mtFbMKtbsSNR4N0LR36rhtwO
 F0i0ZUtDzzu+A9TrM/ZBHha+soKQAt4lO4WQQDJtMr2tjHFNu5+PkR/hO/DfBja+fSrsZGFpUIUZL
 IBFfzOqiowRXWGc4J2ORzoUaahAdW3PFVchNzsU3fVXrakWnQC9lWtXr6awjsuselgLhI1YRCo/YC
 rWe3CgMQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jqYAK-0006UI-BJ; Wed, 01 Jul 2020 08:32:24 +0000
Date: Wed, 1 Jul 2020 09:32:24 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Eric Sandeen <sandeen@sandeen.net>
Message-ID: <20200701083224.GI20101@infradead.org>
References: <c8271324-9132-388c-5242-d7699f011892@redhat.com>
 <20200630054217.GA27221@infradead.org>
 <59265a9d-ee0f-4432-3f86-00d076aeb8e8@sandeen.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59265a9d-ee0f-4432-3f86-00d076aeb8e8@sandeen.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jqYAa-006pLu-LV
Subject: Re: [f2fs-dev] [PATCH] doc: cgroup: add f2fs and xfs to supported
 list for writeback
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
Cc: Eric Sandeen <sandeen@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 cgroups@vger.kernel.org, linux-xfs <linux-xfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 30, 2020 at 08:59:34AM -0500, Eric Sandeen wrote:
> On 6/30/20 12:42 AM, Christoph Hellwig wrote:
> > On Mon, Jun 29, 2020 at 02:08:09PM -0500, Eric Sandeen wrote:
> >> f2fs and xfs have both added support for cgroup writeback:
> >>
> >> 578c647 f2fs: implement cgroup writeback support
> >> adfb5fb xfs: implement cgroup aware writeback
> >>
> >> so add them to the supported list in the docs.
> >>
> >> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> >> ---
> >>
> >> TBH I wonder about the wisdom of having this detail in
> >> the doc, as it apparently gets missed quite often ...
> > 
> > I'd rather remove the list of file systems.  It has no chance of
> > staying uptodate.
> 
> Is there any way for a user to know whether a filesytem does or doesn't
> support it, in practice?

git-grep SB_I_CGROUPWB


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
