Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1563340A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Nov 2022 04:41:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxK9X-0005Iz-Ax;
	Tue, 22 Nov 2022 03:40:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1oxK9U-0005Is-7a
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 03:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VnTub4Y5HXxdbq9kgRXMlJDj14X+1QruDCzpXxBbgMA=; b=gQO9SpDpV4YUadtPr1Y+JXV6hl
 XnDdWAEct+TVCe7W7/haONe/PpgrLb7/SEETU1SpaX9y7b8PgFYrWpqTwwDR2oBBmTzObiRuacnnG
 coFKLmHwwoB0gAe4YQetIcH6CF+xGul1XiI1kdAX5lT4qfEoA8tethaQZoZgSzLmfuEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VnTub4Y5HXxdbq9kgRXMlJDj14X+1QruDCzpXxBbgMA=; b=kEGg/LMZ0ViSAlpeNCtaGliPV6
 dTj3Xm5ZhqepWC4t/dIrbC+KyY+zu1Sd8bBTBuOq6Fs444Bp8l1c3aF5GBplJ3K063mYJ/feXuZ+f
 UjFDf/hVs+vZ2XcshEX68upqNKz+y8uMqllXXG1/DHdcLDA2gI5RSF4IXLFrX8cOcmQY=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxK9Q-00ALcl-DY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 03:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VnTub4Y5HXxdbq9kgRXMlJDj14X+1QruDCzpXxBbgMA=; b=jZoeg6TF21XJkuWIBeOBqwSFwR
 S+XahH3FklBRWzEpYuA5k1nY0SXTXfkBvmBxqXuCWsHLq4Tt3mmRX/yFTLtoqX7JhtzCr4v49jWZS
 UMTI5vJAY2AkQ06hwM6FO8AD88bQtStfDSZ7R2H1c2kDJrTbbIvhpwgmUrOtqtBTpEfLv51y+8eVN
 bg8imgaRNgbG3Vyne7YSifIZXRQdfxsih0gA8buipA48uL/ef6WZKGQwmUGt4dMgQWtyT95Kh36jm
 A3hWIW5kpYnWbTEo1JBRfr2oBaVEyqfcQ0NcU4pvxfdGiFEUL541uK+IJpUQAYXFvC2NJp7DNAfMG
 7V3SOPsQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oxK99-005ts8-U9; Tue, 22 Nov 2022 03:40:31 +0000
Date: Tue, 22 Nov 2022 03:40:31 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <Y3xEr3hhbYfdei+k@casper.infradead.org>
References: <20221121112134.407362-1-glider@google.com>
 <20221121114840.c407626c13706ff993efabe3@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121114840.c407626c13706ff993efabe3@linux-foundation.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 21, 2022 at 11:48:40AM -0800,
 Andrew Morton wrote:
 > On Mon, 21 Nov 2022 12:21:30 +0100 Alexander Potapenko <glider@google.com>
 wrote: > > > When aops->write_begin() does not initialize fs [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1oxK9Q-00ALcl-DY
Subject: Re: [f2fs-dev] [PATCH 1/5] fs: ext4: initialize fsdata in
 pagecache_write()
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
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org, linux-fsdevel@vger.kernel.org,
 Alexander Potapenko <glider@google.com>, linux-ext4@vger.kernel.org,
 syzbot+9767be679ef5016b6082@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 21, 2022 at 11:48:40AM -0800, Andrew Morton wrote:
> On Mon, 21 Nov 2022 12:21:30 +0100 Alexander Potapenko <glider@google.com> wrote:
> 
> > When aops->write_begin() does not initialize fsdata, KMSAN reports
> > an error passing the latter to aops->write_end().
> > 
> > Fix this by unconditionally initializing fsdata.
> > 
> > ...
> >
> 
> I'm assuming that this is not-a-bug, and that these changes are purely
> workarounds for a KMSAN shortcoming?

It's a weird one.  It used to be not-a-bug.  Then we changed from
std=gnu99 to std=gnu11 or something.  And in the intervening years,
the C standards ctte decided that passing an uninitialised pointer to a
function was UB.  So we start by passing a pointer to the pointer to
->write_begin().  Some ->write_begin functions initialise that pointer;
others don't.  Then we pass the pointer directly to ->write_end.  If
->write_begin initialised the pointer, that's fine, and if not, it's UB.
Of course the ->write_end doesn't use it if the ->write_begin didn't
initialise it, but it's too late because merely calling the function
was UB.  Thanks, Itanium!



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
