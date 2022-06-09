Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAFB544237
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jun 2022 05:56:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nz9HV-0000Qk-Hs; Thu, 09 Jun 2022 03:56:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+a39afe573ddbd6ff3389+6864+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nz9HU-0000QY-7H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jun 2022 03:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k5NOE2/mOchRWcRvMdsOMX23IRbR4XjJRm5kjerQYfs=; b=PhWy+Z7+RVEMPSnp63mRs6Yo0F
 oYVHt4LOmVCoIV8kvwXdgR/GAGNwcd92xhVVFp8OybGgKJobLaGhYM+BdG5mbLWbXrDii6E7NQXjQ
 kVwClJ3Pc/oVnSIeq8fjfkNBpjfeEZgHYlurW3TAbQIjUVHaHRf22/5eq9CUHme1NpUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k5NOE2/mOchRWcRvMdsOMX23IRbR4XjJRm5kjerQYfs=; b=SlgWH1+j3avNpTS6g4piPz09CJ
 vqaJn2DZrcefY1jN20r1ZK+L2UR0C0HvAkDIjXACu5YIcf5NTzCit1lNkAaePMH60gMeGqkKew0Zu
 nPL/oVnF3mBQPIR7M81Pz9fZNJ1AkFqhhzB2s/FFSzHGqDsKjDKy+2vMeTggfo++JUi8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nz9HR-0006v2-RV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jun 2022 03:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=k5NOE2/mOchRWcRvMdsOMX23IRbR4XjJRm5kjerQYfs=; b=UMDExU/q7tF8/mqWoSgLYxhOpC
 FkB/nDKRBlAlwMswJxYlpwOD+T9b3fHuzs5Xk9HKsw1RzKM18Nvzmz2zvtMnyPCsG0qy2kU/WHu9X
 mVccNPi9V87DFgmPksbjSq32mvZYh7FU9kikejkUfrcbqMujPYOK4OsnGEYmxwRBuH+8cz929MoC+
 J1L5P254VCbTHcr/3B4+pgfRdz1mWvdV10u33rtAMJjWsHP0HN5sU7QukTrtM4bSJeT0tiNaLZ0sf
 okORJ39zhtNOHmkrX4y3W5zWBlbmRyPPS8qKqjL4e2oY+q3FEDzI+tyRYIGUkaqgz1VdTJg+hKLV8
 s6Jccx+g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nz9HM-00G0pb-DO; Thu, 09 Jun 2022 03:56:16 +0000
Date: Wed, 8 Jun 2022 20:56:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YqFvYAlGGWW7ohTZ@infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
 <20220605193854.2371230-9-willy@infradead.org>
 <YqBYxNPu3tLiN5kI@infradead.org>
 <YqDPIv5IgNHK/pJT@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqDPIv5IgNHK/pJT@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 08, 2022 at 05:32:34PM +0100,
 Matthew Wilcox wrote:
 > On Wed, Jun 08, 2022 at 01:07:32AM -0700, Christoph Hellwig wrote: > >
 On Sun, Jun 05, 2022 at 08:38:52PM +0100, Matthew Wilcox (Oracl [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nz9HR-0006v2-RV
Subject: Re: [f2fs-dev] [PATCH 08/10] vmscan: Add
 check_move_unevictable_folios()
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

On Wed, Jun 08, 2022 at 05:32:34PM +0100, Matthew Wilcox wrote:
> On Wed, Jun 08, 2022 at 01:07:32AM -0700, Christoph Hellwig wrote:
> > On Sun, Jun 05, 2022 at 08:38:52PM +0100, Matthew Wilcox (Oracle) wrote:
> > > Change the guts of check_move_unevictable_pages() over to use folios
> > > and add check_move_unevictable_pages() as a wrapper.
> > 
> > The changes here look fine, but please also add patches for converting
> > the two callers (which looks mostly trivial to me).
> 
> I do want to get rid of pagevecs entirely, but that conversion isn't
> going to happen in time for the next merge window.  for_each_sgt_page()
> is a little intimidating.

for_each_sgt_page, just like other creative scatterlist abuse in the gpu
code is a beast.  But, instead of doing a for_each_sgt_page to add
pages to the pagevec and then do a loop over the pagevec to add to
the folio batch it should be pretty trivial to just cut out the
middle man.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
