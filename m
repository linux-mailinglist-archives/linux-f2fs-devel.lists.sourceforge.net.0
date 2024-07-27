Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 604AD93DFCE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jul 2024 16:54:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXiol-0006UP-0H;
	Sat, 27 Jul 2024 14:54:43 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1sXioj-0006UA-Dw
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jul 2024 14:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qLhE8zhbnsrLQesDE5s8eN6bXS32QqwKbPnsHmPpjPs=; b=EmT2AA+uipoccK488dEvAnk51r
 V8cKwXEjkVVcURWqEyRdZ9Tb4E/IH4OgJ+ZB0rE1ekA5HIvZZpt8lZbTITlQfzcWm5aKPQh/CP19j
 pb9g6D4DdcZUHjxk9m0qa3wfD9aXGOYeuqvg7Po1DnHAQnwvBCpnk1IwDWkRl+Q8Jl80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qLhE8zhbnsrLQesDE5s8eN6bXS32QqwKbPnsHmPpjPs=; b=Xs3jcJ3FuQvztrQFA6XtYAqH+G
 KzJWHyUhv+cmWEo/ftGh1g7QwWs35hPc8FswSVkOU2TrRSQ/oUjad9SvXCJv1p8eqc6GMpHgs1RlJ
 0/pGUMB4ih1sF0D4cpLrHZBBOEe5g3Uvm/c0ylJByBoepnYH/jTj9ReRVJUog9wr41sI=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sXioi-0002kj-1q for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jul 2024 14:54:41 +0000
Received: from cwcc.thunk.org (pool-173-48-113-198.bstnma.fios.verizon.net
 [173.48.113.198]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 46REqWUW017051
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jul 2024 10:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1722091958; bh=qLhE8zhbnsrLQesDE5s8eN6bXS32QqwKbPnsHmPpjPs=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=W3SqZwj6xO4JInZDIxy44/G9zuWEAwQBDT8wo9oAislq4E8B456lR87n3bSU9fcTu
 iY0V57/ee8ng08hyb4Csnb2aESguN8FAilgp5bT1uF+l0t0N6l5WFjifYiECO6bUDd
 t5BTjYHDKkOovBhtRTqwkR8rL7aX++aINeXzjuXf7n9rHduxZMGTecM7BxEExtLP51
 RiF9Pepy9ILquFzBv7I6nIGYyVPO16Y/OWE3V35dTFL7MdnWaaeUIgp9Z79JAPI2dj
 iZEP64jTBjnKooEX1ccphhGHyHOYzUv04vJ6/ie7IN7IddG/d/a9WC4B2NrMWDyWKL
 An8LLBeP0m5Aw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 8A69515C0251; Sat, 27 Jul 2024 10:52:32 -0400 (EDT)
Date: Sat, 27 Jul 2024 10:52:32 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20240727145232.GA377174@mit.edu>
References: <ZqJjsg3s7H5cTWlT@infradead.org>
 <61beb54b-399b-442d-bfdb-bad23cefa586@app.fastmail.com>
 <ZqJwa2-SsIf0aA_l@infradead.org>
 <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
 <ZqKreStOD-eRkKZU@infradead.org>
 <91bfea9b-ad7e-4f35-a2c1-8cd41499b0c0@linux.dev>
 <ZqOs84hdYkSV_YWd@infradead.org>
 <20240726152237.GH17473@twin.jikos.cz>
 <20240726175800.GC131596@mit.edu> <ZqPmPufwqbGOTyGI@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZqPmPufwqbGOTyGI@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 26, 2024 at 11:09:02AM -0700, Christoph Hellwig
 wrote: > On Fri, Jul 26, 2024 at 01:58:00PM -0400, Theodore Ts'o wrote: >
 > Yeah, that's my reaction as well. This only saves 50 lines of co [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [18.9.28.11 listed in sa-accredit.habeas.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [18.9.28.11 listed in bl.score.senderscore.com]
X-Headers-End: 1sXioi-0002kj-1q
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
 Josef Bacik <josef@toxicpanda.com>, Chris Mason <clm@fb.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 Youling Tang <youling.tang@linux.dev>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 26, 2024 at 11:09:02AM -0700, Christoph Hellwig wrote:
> On Fri, Jul 26, 2024 at 01:58:00PM -0400, Theodore Ts'o wrote:
> > Yeah, that's my reaction as well.  This only saves 50 lines of code in
> > ext4, and that includes unrelated changes such as getting rid of "int
> > i" and putting the declaration into the for loop --- "for (int i =
> > ...").  Sure, that saves two lines of code, but yay?
> > 
> > If the ordering how the functions gets called is based on the magic
> > ordering in the Makefile, I'm not sure this actually makes the code
> > clearer, more robust, and easier to maintain for the long term.
> 
> So you two object to kernel initcalls for the same reason and would
> rather go back to calling everything explicitly?

I don't oject to kernel initcalls which don't have any
interdependencies and where ordering doesn't matter.

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
