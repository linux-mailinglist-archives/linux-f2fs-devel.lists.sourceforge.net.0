Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DA42DB733
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Dec 2020 01:01:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpKFY-0004Y7-B2; Wed, 16 Dec 2020 00:01:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>)
 id 1kpKFX-0004Xu-Un; Wed, 16 Dec 2020 00:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=baOWQA14j9JKLPbQCUgRNsGZpuBiyZ/B0fXYRs7Z3Hs=; b=Nv1GXFs1vwyeKFM5cIUa5Ws1um
 /hzvQQq8501FCOAoUaKz3w0TjlnhkKohlJokSMbt9/pwy6r8iwQSDWbL96C0HMQWs3F3fZ3AAArVJ
 gZyL4LDt8m4ChVj8p0LXBkk4BFErGwh1v9RuWIkwKBKKHV8B563rM1LXwvphZfCvOqlw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=baOWQA14j9JKLPbQCUgRNsGZpuBiyZ/B0fXYRs7Z3Hs=; b=Qz5Dxv6XqUcG7w27gPBGwuT0XQ
 qr5Np2s7WzejbkcA14G709Fyx8/oNeFuX+xT+rNcp2cFcJXxq3t6kLfBtTT6fEX4z8xQORTr1WhjQ
 0EZTobRecrEVLc5moPnXYokBfvDDDVb1/VR/JGbWx1smkdLSQkUtTAYdEOe1BUKt6kBw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpKFN-00FmhM-Lc; Wed, 16 Dec 2020 00:00:59 +0000
Date: Tue, 15 Dec 2020 16:00:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608076832;
 bh=SMdx46Co4JVowwroGILEbnCiRoajuP8+Xelb/U43yRM=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nby56K462/a5pb6JiyVx6iGyF5q9dI9fujCkY3Zfc0Dn0DsHQFYlDHxMzFcjr7005
 FHzppVUvkQaZO5lLwYvgPibaok/OmBhJjKDmDQm4TRRk0wIUWizhq5aFfwqqBJlYzq
 jDYVqjAIfrC4qhBrFGB/2vV0qxGhmRYiwBTIL5qzm5TrvZ+sdd1H2l2VLEoZ5UZ8/P
 60ZVcBiqgwYdHT8Z9rp7AM8pWcpKXaHvQFPPoic9oeUoKZD3/242x+P2EqNtue+NJO
 G5MgakcIi8KVeI7S0gS5Z3y6EVRbeJQJQke+st3fukl0XIZiAPzX+4wuYZinlU36JV
 XZp4H3Ej/6bqA==
From: Eric Biggers <ebiggers@kernel.org>
To: Nick Terrell <terrelln@fb.com>
Message-ID: <X9lOHkAE67EP/sXo@sol.localdomain>
References: <20201203205114.1395668-1-nickrterrell@gmail.com>
 <DF6B2E26-2D6E-44FF-89DB-93A37E2EA268@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DF6B2E26-2D6E-44FF-89DB-93A37E2EA268@fb.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kpKFN-00FmhM-Lc
Subject: Re: [f2fs-dev] [PATCH v7 0/3] Update to zstd-1.4.6
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
Cc: "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Petr Malat <oss@malat.biz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>, Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 15, 2020 at 08:58:52PM +0000, Nick Terrell via Linux-f2fs-devel wrote:
> 
> 
> > On Dec 3, 2020, at 12:51 PM, Nick Terrell <nickrterrell@gmail.com> wrote:
> > 
> > From: Nick Terrell <terrelln@fb.com>
> > 
> > Please pull from
> > 
> >  git@github.com:terrelln/linux.git tags/v7-zstd-1.4.6
> > 
> > to get these changes. Alternatively the patchset is included.
> 
> Is it possible to get this patchset merged in the 5.11 merge window? It applies
> cleanly to the latest master. Please let me know if there is anything that I can do
> to drive this patchset towards merge.
> 
> Thanks,
> Nick

Well, it's too late for 5.11 for patches that weren't already in linux-next, so
you'll have to aim for 5.12.

It looks like you're asking Herbert to pull this into the crypto tree?  If he's
interested in doing that, that could work.  However lib/zstd/ isn't that
strongly "crypto-related", and it doesn't actually have a maintainer listed in
MAINTAINERS.  Perhaps another path forwards is for you to volunteer to maintain
lib/zstd/ and send pull requests for it directly to Linus?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
