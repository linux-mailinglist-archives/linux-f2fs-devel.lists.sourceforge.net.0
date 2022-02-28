Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8F4C626F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 06:19:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOYRn-0002wj-Su; Mon, 28 Feb 2022 05:19:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nOYRn-0002wa-6U
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Feb 2022 05:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-id:Date:References:In-reply-to:Subject:Cc:
 To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OsOdRKyOPTsqFVySVeje99MCazN8FHXIRZGctTB3Fjc=; b=dhytS8fLYLrO7eCyLORNgk23UU
 gtL8nwWpVOnJO67KlE1igWM3R6lAFiCjNuRIOJmSZTQ9de9EsevksQc3HLibA0yRbk1gpTYP8EIhW
 wLCL09jY/T+FntJ1V/+pOoH8gtWOuSRZODtheR6sMtGRo97BoVsZtM+DFmUQ3aT1F7WA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-id:Date:References:In-reply-to:Subject:Cc:To:From:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OsOdRKyOPTsqFVySVeje99MCazN8FHXIRZGctTB3Fjc=; b=KRAJIpwWE2KvAbjrDOckKszf9h
 nDKQWs4drhb9+LTXmPwkzGePjzz+zH08sQGQ6gKtQuVE0JCLwCUA2WWgr2itPoUG3U15DdVn3cb9j
 6ZM7mISq9+gHSWDk+9xWi/ro5u6O+/L02pq1vvwPi3xh92Wx058U5pJTles2IGH0vUYY=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOYRk-00HNqp-0f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Feb 2022 05:19:45 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6BD921155;
 Mon, 28 Feb 2022 05:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646025575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsOdRKyOPTsqFVySVeje99MCazN8FHXIRZGctTB3Fjc=;
 b=1aDnYNyCMKoqi7852ELng+RjN9qj4H3oZKIs6lZKTxoiwJvkWraBZGmj+Lgr7uB+1SHFJz
 Yh2mZu17ZFxMhdj6twoLK7xeDGS6uw7JuUWs/fN+ewmZBdcdER+polBa/xGaRr74gldhFA
 Ag1t4rw/IZDJ70lWUTD3DCkE1pDKQVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646025575;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsOdRKyOPTsqFVySVeje99MCazN8FHXIRZGctTB3Fjc=;
 b=ETy1bbk4AvRTgoyR516RJsfNTn47d24xVl6EFjxT7PerkTAmm+E/x1KFcnx2xiTY9paC/z
 4vNKWy2UyfSPGfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E5C712FC5;
 Mon, 28 Feb 2022 05:19:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5BzICmBbHGIXfAAAMHmgww
 (envelope-from <neilb@suse.de>); Mon, 28 Feb 2022 05:19:28 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Andrew Morton" <akpm@linux-foundation.org>
In-reply-to: <20220227204728.b2eb5dd94ecc3e86912bacad@linux-foundation.org>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>,
 <164447147257.23354.2801426518649016278.stgit@noble.brown>,
 <20220210122440.vqth5mwsqtv6vjpq@quack3.lan>,
 <164453611721.27779.1299851963795418722@noble.neil.brown.name>,
 <20220224182622.n7abfey3asszyq3x@quack3.lan>,
 <164602251992.20161.9146570952337454229@noble.neil.brown.name>,
 <20220227204728.b2eb5dd94ecc3e86912bacad@linux-foundation.org>
Date: Mon, 28 Feb 2022 16:19:24 +1100
Message-id: <164602556430.20161.5451268677064506613@noble.neil.brown.name>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 28 Feb 2022, Andrew Morton wrote: > On Mon, 28 Feb
 2022 15:28:39 +1100 "NeilBrown" <neilb@suse.de> wrote: > > > When writing
 documentation the intent of the author is of some interest, > > but [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOYRk-00HNqp-0f
Subject: Re: [f2fs-dev] [PATCH 02/11] MM: document and polish read-ahead
 code.
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
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Wu Fengguang <fengguang.wu@intel.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 28 Feb 2022, Andrew Morton wrote:
> On Mon, 28 Feb 2022 15:28:39 +1100 "NeilBrown" <neilb@suse.de> wrote:
> 
> > When writing documentation the intent of the author is of some interest,
> > but the behaviour of the code is paramount.
> 
> uh, er, ah, no.  The code describes the behaviour of the code.  The
> comments are there to describe things other than the code's behaviour.
> Things such as the author's intent.
> 
> Any deviation between the author's intent and the code's behaviour is
> called a "bug", so it's pretty important to understand authorial
> intent, no?

When the author is writing the documentation - then yes - definitely. 
When the "author" is several different people over a period of years,
then it is not even certain that there is a single unified "intent".

The author's intent is less interesting not so much because it is less
relevant, but because it is less available.

So when writing third-party post-hoc documentation, the focus has to be
on the code, though with reference to the intent to whatever extent it
is available.  Bugs then show up where the actual behaviour turns out to
be impossible to document coherently.

Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
