Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8D616B3A8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 23:18:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6M36-0001Rv-83; Mon, 24 Feb 2020 22:18:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+fd4c774fa746ae91f5d1+6028+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j6M34-0001Ro-Ql
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 22:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SD1yx0YoAU9Bzlni+o86AkG96/rc/8SSS4sRPjtuIYU=; b=MEE8A2QIEYVb0Ly9GH0uYntwiT
 3MajKndST6YY6SxyhDUPadC1oVRdMRD4ectDlzkAVaH0pmltQHMcm1aSM6u3x2j2pi4umPpxS7ue4
 MwFVJ4WxtRCmsOH4GsodbdTT5NqVqc2rFOynilrxz2e0E8k4msrHD4JJ6Cux7jrX18YQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SD1yx0YoAU9Bzlni+o86AkG96/rc/8SSS4sRPjtuIYU=; b=lDBXCAnagxlW+fNSm9U9T7deNm
 0yzd8CVjxyN1rMebOo/2NgPZGL7RYgUBl8/SlwPRWDXXLck+5zi9AYfSbfn0/rSqQYXbb+TdPXSY9
 ap5eYaTKrlD0UyxcZChowhiUWd+IQ7gcjO0qnfapGD1CCnE1Hl4NCmq0uiMLGm7e4Lw8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6M32-005U70-Ls
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 22:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SD1yx0YoAU9Bzlni+o86AkG96/rc/8SSS4sRPjtuIYU=; b=pB+5oZWVTu+RlW3J/EESOvRbJB
 BhenyWBT/6m8GOFdFElQJCxMbpx1xaeKthjka5pjD6jbGH4Yb4isWW678N/C1jEWJrUjOlo+gO3Wr
 Fc+GPx4uW5jDWOEduKUpXye86IX3XAlQeX17eAH1O9MrALkq72vBwumB3SryCX1PQ21Cu5rjB+LH+
 LFNujmpdrRUyH0LpGKYHkHsi54xutUiobEdAg4riDPA5mRYuMsyFoBP03wVQn0kFpk94BKaabAiRg
 qtA4ThIZJjuV+zv0m358v08Y+jltVma43bg6qDq7T97btYMe7X25tdyvSveobCz77SFx4CC7cEIkX
 lGoig/Dw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6M2v-00087x-1f; Mon, 24 Feb 2020 22:17:49 +0000
Date: Mon, 24 Feb 2020 14:17:49 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224221749.GA22231@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-22-willy@infradead.org>
 <20200220154741.GB19577@infradead.org>
 <20200220162404.GY24185@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220162404.GY24185@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1j6M32-005U70-Ls
Subject: Re: [f2fs-dev] [PATCH v7 21/24] iomap: Restructure
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 20, 2020 at 08:24:04AM -0800, Matthew Wilcox wrote:
> On Thu, Feb 20, 2020 at 07:47:41AM -0800, Christoph Hellwig wrote:
> > On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > > 
> > > By putting the 'have we reached the end of the page' condition at the end
> > > of the loop instead of the beginning, we can remove the 'submit the last
> > > page' code from iomap_readpages().  Also check that iomap_readpage_actor()
> > > didn't return 0, which would lead to an endless loop.
> > 
> > I'm obviously biassed a I wrote the original code, but I find the new
> > very much harder to understand (not that the previous one was easy, this
> > is tricky code..).
> 
> Agreed, I found the original code hard to understand.  I think this is
> easier because now cur_page doesn't leak outside this loop, so it has
> an obvious lifecycle.

I really don't like this patch, and would prefer if the series goes
ahead without it, as the current sctructure works just fine even
with the readahead changes.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
