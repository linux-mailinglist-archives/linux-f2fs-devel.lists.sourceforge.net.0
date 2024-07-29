Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9CC93FDE6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2024 20:58:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYVZF-0002ZV-9F;
	Mon, 29 Jul 2024 18:57:58 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+22cce97e185fdc5e0b5f+7645+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1sYVZD-0002ZM-2f for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 18:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bI98vnr4STfnlezdFEzg4Ja3ISFYbT1ZwioxbeX8MKA=; b=JynX1OL8DPZXaeorpKQSHQv9Po
 UracLfg5am3zqSxPePigRIIXnz1nwyeq1GUves4aYS/jtcZByW/IgBvsvHbdyGKX5CFMqebsyXMsN
 oDrvMi36xrePn+uOmkYePb5CFcZ/xw2ZuRFfxjnvZnEF9MS4McV/82d898syPjk5e7Ig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bI98vnr4STfnlezdFEzg4Ja3ISFYbT1ZwioxbeX8MKA=; b=S/3CHcciemNsPnJ063XKHViKnk
 U91zaE83W8t4JLWaKoQLz3iMaI4lskpd0rgcDFUGOfwduDVQG2rkVBoqw6p/7JZ7UKcubTSWo3kgl
 7xbrhBTnXWAq77kBaOXmnJ3NsOF3nq/eyD3RP67THIOi/rVKbgptjaVE3SI0L7a+xiWs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYVZC-0005YK-FW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 18:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bI98vnr4STfnlezdFEzg4Ja3ISFYbT1ZwioxbeX8MKA=; b=ej0EAM7w2vW2zx7IVBK5UWb6kj
 wN1ljrPR09MnAd97P+fTuB/kR5lUi1RXb/2QVebNH54cfJkcVdn1DRLq3wIEF0L6HoO11Wpaq31KH
 b3HS8xuAqVh03lWz/yE/u/Ow4kdwDfTmmKIn1lYNQAiHIsSLGMaD6CF3yGFFxC5Vu9WtjGlQ60UOy
 Q4BgloNHbkwvChMYnO+355i5pha1GxRbPUdTrd6mvYaBUccsoS/rnsx/t69CMPNmh+bDgQ7LKqIkf
 Sjd3SluVefNGGxsPirSouasiVgrHnm6V+d9KUEa831qxQ9pkwr7Uw7PFflXMznzSAxHEHWl7Kshw0
 rtNYHKgA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sYVYt-0000000CPTa-3gro;
 Mon, 29 Jul 2024 18:57:35 +0000
Date: Mon, 29 Jul 2024 11:57:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <ZqfmH9vJo4ikr1RG@infradead.org>
References: <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
 <ZqKreStOD-eRkKZU@infradead.org>
 <91bfea9b-ad7e-4f35-a2c1-8cd41499b0c0@linux.dev>
 <ZqOs84hdYkSV_YWd@infradead.org>
 <20240726152237.GH17473@twin.jikos.cz>
 <20240726175800.GC131596@mit.edu> <ZqPmPufwqbGOTyGI@infradead.org>
 <20240727145232.GA377174@mit.edu>
 <23862652-a702-4a5d-b804-db9ee9f6f539@linux.dev>
 <20240729024412.GD377174@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729024412.GD377174@mit.edu>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jul 28, 2024 at 10:44:12PM -0400,
 Theodore Ts'o wrote:
 > > > > Personally, I prefer the implementation of method two. > > But there's
 also method zero --- keep things the way they are, and > d [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [198.137.202.133 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sYVZC-0005YK-FW
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 Youling Tang <tangyouling@kylinos.cn>, linux-f2fs-devel@lists.sourceforge.net,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 kreijack@inwind.it, David Sterba <dsterba@suse.cz>,
 Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@infradead.org>,
 Chris Mason <clm@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 Youling Tang <youling.tang@linux.dev>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jul 28, 2024 at 10:44:12PM -0400, Theodore Ts'o wrote:
> >
> > Personally, I prefer the implementation of method two.
> 
> But there's also method zero --- keep things the way they are, and
> don't try to add a new astraction.
> 
> Advantage:
> 
>  -- Code has worked for decades, so it is very well tested
>  -- Very easy to understand and maintain
> 
> Disadvantage
> 
>  --- A few extra lines of C code.
> 
> which we need to weigh against the other choices.

I think option zero is the right option for you and David and anyone
scared of link order issues.

But I know for XFS or the nvme code having multiple initcalls per
module would be extremely helpfu.  I don't really want to drag Youling
into implementing something he is not behind, but I plan to try that
out myself once I find a little time.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
