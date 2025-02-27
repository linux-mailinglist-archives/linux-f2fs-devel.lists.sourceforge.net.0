Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BEEA48A85
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2025 22:31:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tnlTS-0006lB-2g;
	Thu, 27 Feb 2025 21:31:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tnlTQ-0006l3-DK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Feb 2025 21:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=21L/EqPraoZhH5P2r+VPekiFyK6vEPhatZbEQIHgLeY=; b=YAg40a2aeR1nylNGTXXFM0KjA3
 15NQhORumgqQeZsbLp72koH/vmh/HLmU2DwWaNGZ/nPegTB0AvhZik7tawmD2kPmI6H7yl1jPdxUF
 CjC+Dq1xB9ERz/YTF0EXT90ZLVLAsiMV0hO+WlbSGYdlGQ9ipXjeDo4o0GCdYN6KDuWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=21L/EqPraoZhH5P2r+VPekiFyK6vEPhatZbEQIHgLeY=; b=eYf5dUMfklSpJRyyeMRJJRlE0v
 x2+I7CzIa5qo7CzLiw69JBWANcjW3Zt3NotcA3tJxazelbgCZw2BprJjVjul3FtJEl3LvnAIKB2T4
 yNYqRyx6JiZDD1KBPpjyWMhLctijD8v4PFYG06j3Aoq253eTooCrBhTHOrP99IUE8dak=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tnlTQ-00079p-EZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Feb 2025 21:31:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 278455C4BAF;
 Thu, 27 Feb 2025 21:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76740C4CEDD;
 Thu, 27 Feb 2025 21:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740691870;
 bh=Uex2exXxw8sF1aGanevdICvCrEBztUODkzUSVwWbgfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kyMxHtaYNfUw+Wnf7dmzPePMLnz/klDd+UjLGFIZKBumQ8CSYJL95PkR7wKyXyvav
 k3XHNKLiSKrmoBxcsE9xjByQCkOVN6LgDy5FoRN+HyzzinURFusWOwQu3V6RaC75GB
 /kafT7gSLJeEBtALaTcpr7PcIM+TY/8HyWxOzyhwFoyn0yk0Hpp+80PhOlbq45ykTD
 hQfyR2ydu7IzOfiVUZnWkG2qqxLMnsau9mkua1IE3vPYl1tzXq4ITCnU9wbPm2HGLm
 hlru3JMKACjnHtBQoDqUK9sJNYchjj0sr14L2V1b/9QgbCGgAs9Sp7g0P8Zl7bHJ8T
 XNhyPU+35kUrg==
Date: Thu, 27 Feb 2025 21:31:08 +0000
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <Z8DZnHBF_o8JSkPp@google.com>
References: <20250218055203.591403-1-willy@infradead.org>
 <20250218055203.591403-4-willy@infradead.org>
 <Z7gHNEBYx5XdfQw5@google.com> <Z7wdb8nnXaUnD0CJ@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7wdb8nnXaUnD0CJ@google.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/24, Jaegeuk Kim wrote: > Hi Matthew, > > On 02/21,
 Jaegeuk Kim wrote: > > On 02/18,
 Matthew Wilcox (Oracle) wrote: > > > Convert f2fs_put_page()
 to f2fs_folio_put() and add a wrapper. > > > Repl [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tnlTQ-00079p-EZ
Subject: Re: [f2fs-dev] [PATCH 03/27] f2fs: Add f2fs_folio_put()
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/24, Jaegeuk Kim wrote:
> Hi Matthew,
> 
> On 02/21, Jaegeuk Kim wrote:
> > On 02/18, Matthew Wilcox (Oracle) wrote:
> > > Convert f2fs_put_page() to f2fs_folio_put() and add a wrapper.
> > > Replaces three calls to compound_head() with one.
> > > 
> > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > ---
> > >  fs/f2fs/f2fs.h | 15 ++++++++++-----
> > >  1 file changed, 10 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index b05653f196dd..5e01a08afbd7 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -2806,16 +2806,21 @@ static inline struct page *f2fs_pagecache_get_page(
> > >  	return pagecache_get_page(mapping, index, fgp_flags, gfp_mask);
> > >  }
> > >  
> > > -static inline void f2fs_put_page(struct page *page, int unlock)
> > > +static inline void f2fs_folio_put(struct folio *folio, bool unlock)
> > >  {
> > > -	if (!page)
> > > +	if (!folio)
> > >  		return;
> > >  
> > >  	if (unlock) {
> > > -		f2fs_bug_on(F2FS_P_SB(page), !PageLocked(page));
> > > -		unlock_page(page);
> > > +		f2fs_bug_on(F2FS_F_SB(folio), !folio_test_locked(folio));
> > > +		folio_unlock(folio);
> > >  	}
> > > -	put_page(page);
> > > +	folio_put(folio);
> > > +}
> > > +
> > > +static inline void f2fs_put_page(struct page *page, int unlock)
> > > +{
> > 
> > I got a kernel panic, since there are still several places to pass a null
> > page pointer, which feeds to page_folio() which doesn't expect the null.
> > 
> > Applying this can avoid the panic.
> > 
> > 	if (!page)
> > 		return;
> 
> Please let me know, if you want me to apply this to your patch directly, or post
> v2.

I applied the fix into your patch. Thanks.

> 
> Thanks,
> 
> > 
> > > +	f2fs_folio_put(page_folio(page), unlock);
> > >  }
> > >  
> > >  static inline void f2fs_put_dnode(struct dnode_of_data *dn)
> > > -- 
> > > 2.47.2
> > > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
