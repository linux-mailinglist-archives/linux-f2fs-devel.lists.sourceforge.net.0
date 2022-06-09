Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA38544236
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jun 2022 05:55:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nz9GU-00060p-H7; Thu, 09 Jun 2022 03:55:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+a39afe573ddbd6ff3389+6864+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nz9GS-00060i-UR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jun 2022 03:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0YPt1S1jhSTaWf/8ZoCL0bFChcDXSklVsTmgZM2rLiI=; b=bmh11ELykM9xMiop+OWwCMPj9g
 Ab5tH4aqLKESm0TjKNfj5ekE3ANM4+xw0pXLavDMbQdoD6sGfVjOyQ3fpGSFsYdt9GJaPofaRgx7V
 5TFJvsz5l3aHF8Pt4A5rfzvnT9QmDZ2sgJx6ENNnBX0Im0QvDqBxu8nYBrS85T3xTaYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0YPt1S1jhSTaWf/8ZoCL0bFChcDXSklVsTmgZM2rLiI=; b=iuQZcSqHiryn2acw57GuKZxkva
 5VHn7jGLVeljqmKQbxumK7j9Xs4dRnCU1YE036K83o4ds/8MxTo6prGDNoaqT6oBcvnSSHLLUK4La
 YWvIjuCpqPOedcWuh09qXERvuF9xicbwY2e1tlS+2LcDHNheyGAqxZJIRvxPWseMv3kY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nz9GQ-0006sF-OZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jun 2022 03:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0YPt1S1jhSTaWf/8ZoCL0bFChcDXSklVsTmgZM2rLiI=; b=Dl8JGvKpB6vphg8GJGusCTANit
 1GxyGnn679NvRWS0MV6dl/ia8FXbFkazmnr+IDjn5zzr3og7XZfjMLZjWL06OF3evRoMrBFjxFrsx
 Htg+vfwV+x7T9mmYPRX8P6cJKrK8y0bBndusBU0lXk/KdOK8xByq3REx/zxGsoZUuF/x5DHkNPje8
 NDEHhrWuv4dfciQdbKDCDBmbUI7HxHBS2K/veQeFd3r7wooBpR0eTx87J+TG8yrH1ANVnPBJkU+b9
 h1sAP8J3H9vbFRWHN3eOBnx3OSPTyjl+SZp0lSY+nu4GUzBF+V4Qw/fg17+wG32FZfTnYTo9p6g96
 gaHUWy6g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nz9GE-00G0Iz-DU; Thu, 09 Jun 2022 03:55:06 +0000
Date: Wed, 8 Jun 2022 20:55:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YqFvGgKTyGPxStkx@infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
 <20220605193854.2371230-4-willy@infradead.org>
 <YqBXjjkRZsP8K8fO@infradead.org>
 <YqDIIH2d7iu1o7D0@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqDIIH2d7iu1o7D0@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 08, 2022 at 05:02:40PM +0100,
 Matthew Wilcox wrote:
 > On Wed, Jun 08, 2022 at 01:02:22AM -0700, Christoph Hellwig wrote: > >
 On Sun, Jun 05, 2022 at 08:38:47PM +0100, Matthew Wilcox (Oracl [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nz9GQ-0006sF-OZ
Subject: Re: [f2fs-dev] [PATCH 03/10] ext4: Convert
 mpage_release_unused_pages() to use filemap_get_folios()
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
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 08, 2022 at 05:02:40PM +0100, Matthew Wilcox wrote:
> On Wed, Jun 08, 2022 at 01:02:22AM -0700, Christoph Hellwig wrote:
> > On Sun, Jun 05, 2022 at 08:38:47PM +0100, Matthew Wilcox (Oracle) wrote:
> > > If the folio is large, it may overlap the beginning or end of the
> > > unused range.  If it does, we need to avoid invalidating it.
> > 
> > It's never going to be larger for ext4, is it?  But either way,
> > those precautions looks fine.
> 
> I don't want to say "never".  Today, it's not, but if ext4 ever does
> gain support for large folios, then this is a precaution it will need
> to take.  I'm trying not to leave traps when I do conversions.

FYI, this wasn't an objection to the patch, just a hint that the commit
log could spell this out a bit better.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
