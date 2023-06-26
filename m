Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8AE73DEB5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jun 2023 14:17:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDl9I-0000Q1-Ae;
	Mon, 26 Jun 2023 12:16:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1qDl9F-0000Pu-Sl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 12:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R4tjfUZZ3ZzgCOG/Djcs2zoeSaqHM5jLeuwOhbQ5exw=; b=codEnRt8yiCWt3hsWtY4TY4oPC
 k8/7iOl0Ny0vNl5nC1vSBi6dskhTjUnhRosPKsI87/P6FpNh05KCfR+ov8cMJ1j7zQN8MsyEzahBn
 IAqfceC+jYzURa62tw5qPpS2MWpNossLbmRBUJ65qfDWrzguE6ktC0FWWmbhqs/11NpE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R4tjfUZZ3ZzgCOG/Djcs2zoeSaqHM5jLeuwOhbQ5exw=; b=muVzlWgtbPwBUSH1usi/LPRRgf
 y+I+sNFs4kyHZhhM8MothG/PISHVpfOC5Ch87sCSxqd0oBfLz02yU9GUwSzAhvNhqZLHlJYnif53h
 VyMxxhL4qLj34OZiW2XKfVV/5RB4MRqHIT5pN7aSOgkiuQlQsQkfCalO5iMvToy72qLQ=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDl9E-0006dH-1C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 12:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=R4tjfUZZ3ZzgCOG/Djcs2zoeSaqHM5jLeuwOhbQ5exw=; b=vERxQwvE3o7wKKT+TE3cMyGukY
 0Wen//vsB9rcCl+/Nvx5OmSyJl4WYQYH/izrhNOBzMD91XX+3zp1tW4vucFWCLuSNA6k1f9zqMtBV
 BPLJ3yMw9Xbx8hndsmi7UvlvC3SrfZAxVrw4yctl+TuFSTecnSGaVqevmGzqb3aA0Gu8xoZDXiSnY
 1LKj0AVEOyrgX7f6Rq2G2mJGMB1k9R/RXIegO4M5YO3cf+wqT3I58ZFsg10Xj+HI+6kQvyEo/zIcM
 GoMhnVcIGmdNgYHMijFLSpt/ccA1Cmvav9XnUqMWVcSbl1CEENBfd3SNi9amTlV6Iw33gP1aaBxgC
 cAG6aWAg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qDl8s-001hPT-Ki; Mon, 26 Jun 2023 12:16:26 +0000
Date: Mon, 26 Jun 2023 13:16:26 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <ZJmBmt3WmUpWR3+2@casper.infradead.org>
References: <1dc1a0f2-9be4-8ae0-da26-3c00c8a71b41@kernel.dk>
 <953510c3-4bcd-1426-3527-09d5cbdcf8cc@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <953510c3-4bcd-1426-3527-09d5cbdcf8cc@vivo.com>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 26, 2023 at 03:31:57PM +0800, Yangtao Li wrote:
 > +cc willy@infradead.org > > > On 2023/6/20 4:43, Jens Axboe wrote: > >
 > Hi, > > > > I came across this patch in a news posting: > > > > h [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1qDl9E-0006dH-1C
Subject: Re: [f2fs-dev] f2fs async buffered write patch
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
Cc: Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Lu Hongfei <luhongfei@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 26, 2023 at 03:31:57PM +0800, Yangtao Li wrote:
> +cc willy@infradead.org
> =

> =

> On 2023/6/20 4:43, Jens Axboe wrote:
> =

> > Hi,
> > =

> > I came across this patch in a news posting:
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit=
/?h=3Ddev&id=3Dd618126911829523e35a61f4a5a4ad159b1b2c8d
> > =

> > which has me a bit worried. As far as I can tell, all that patch does is
> > set FMODE_BUF_WASYNC, and then just hope that the lower layers handle
> > the rest?
> > =

> > What happens if iocb->ki_flags & IOCB_NOWAIT is true, and now we do:
> > =

> > generic_perform_write(iocb, from)
> > 	...
> > 	->write_begin() <- does this block?
> =

> Most file systems have not been changed to the iomap method,

That's what needs to be fixed.

> and the generic_perform_write method is still used. So it seems
> =

> =A0reasonable to make IOCB_NOWAIT be handled correctly by the
> =

> =A0generic_perform_write function. This means that we need to modify

No.  Use the modern infrastructure.

> =A0several places mentioned by Jens in the generic_perform_write function,
> =

> =A0and need to pass AOP_FLAG_xxx or iocb into write_begin.

Definitely not.

> =

> I noticed that Matthew Wilcox removed the flags parameter in write_begin
> =

> in a previous commit, maybe we can add it back?

No.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
