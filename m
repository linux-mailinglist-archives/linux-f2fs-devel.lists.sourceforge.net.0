Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9037493B411
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 17:44:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWe9l-0005L0-Ql;
	Wed, 24 Jul 2024 15:43:57 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+577de27a8df23d97afd0+7640+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1sWe9j-0005Kn-Da for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 15:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A5NCdA5yQOqvciqjVmzO4FQb/LC/NqR4RCRHik4/Oxc=; b=jBJDKZgprqdXSPZVF+O1GRXZXp
 EjsjJmF8YMSeqYd5SKlX//owSM2/vUjGSO4sxwa/LKotDEQptREroSJNp7cztZOSnpyZXnipsI4Xq
 GKGNmfvxXhqQqACTMpPN1ts3e+gYoXz1qiuJyFM3fts7JX4Lc5OtcJCgNbVTj+8gnDsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A5NCdA5yQOqvciqjVmzO4FQb/LC/NqR4RCRHik4/Oxc=; b=R3o0fNvStCUxq0hdDbCXf81Qlk
 diSxDabQSjEbjTRLmYW2l6SkWL2vdXcIrC/6DJ069KQyLFUgDvcz6IAPZm1oXkioFHoMemn9SCsSD
 gtXNIlbjSPzM3K5JFIj9sFWaztVclqffbVgFbgT8krYm5PSwc3sJ88juzMBg7EUjpdDk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWe9i-0006oG-1O for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 15:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=A5NCdA5yQOqvciqjVmzO4FQb/LC/NqR4RCRHik4/Oxc=; b=xBBhe6jVMTs+rNw1ry/JeDmbO3
 MNV3LRo+Yl7MrNMLXKUiUDh5a3l9B6nf0f4P0IsTIY0nSlDEHnV7a6G5I2EsV8/T4721oBI5r3MGc
 3bgO/JHGl3nAfelh+Kd6Thukp30duUluFSk8tydhbdTnaK6QW2elJGcYbFqV8rWXjiP3d5KDfa8w4
 PKjt6QhDh7m9FgZOlBwsfH+sj8NdO57AqPTZgajuCBIN3V0F78TjO4UmAGVqo581pq2+6oegH//ao
 JHXnFbMNWsFGotBDBWynEQzuNL5NRzCkOLNKenS7i9xbMEBAP0uAoZ6mo4RKLEfZS3L7srGg/rYXh
 hSFx2mNg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sWe9Y-0000000FoTR-2trX;
 Wed, 24 Jul 2024 15:43:44 +0000
Date: Wed, 24 Jul 2024 08:43:44 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Youling Tang <youling.tang@linux.dev>
Message-ID: <ZqEhMCjdFwC3wF4u@infradead.org>
References: <20240723083239.41533-1-youling.tang@linux.dev>
 <20240723083239.41533-2-youling.tang@linux.dev>
 <Zp-_RDk5n5431yyh@infradead.org>
 <0a63dfd1-ead3-4db3-a38c-2bc1db65f354@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a63dfd1-ead3-4db3-a38c-2bc1db65f354@linux.dev>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 24, 2024 at 09:57:05AM +0800, Youling Tang wrote:
 > module_init(initfn)/module_exit(exitfn) has two definitions (via MODULE):
 > - buindin: uses do_initcalls() to iterate over the contents [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-accredit.habeas.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWe9i-0006oG-1O
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
Cc: linux-arch@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 linux-f2fs-devel@lists.sourceforge.net, tytso@mit.edu,
 Arnd Bergmann <arnd@arndb.de>, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Chris Mason <clm@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 24, 2024 at 09:57:05AM +0800, Youling Tang wrote:
> module_init(initfn)/module_exit(exitfn) has two definitions (via MODULE):
> - buindin: uses do_initcalls() to iterate over the contents of the specif=
ied
> =A0 section and executes all initfn functions in the section in the order=
 in
> =A0 which they are stored (exitfn is not required).
> =

> - ko: run do_init_module(mod)->do_one_initcall(mod->init) to execute init=
fn
> =A0 of the specified module.
> =

> If we change module_subinit to something like this, not called in
> module_init,

> Not only do we want to ensure that exit is executed in reverse order of
> init, but we also want to ensure the order of init.

Yes.

> This does not guarantee the order in which init will be executed (although
> the init/exit order will remain the same)

Hmm, so the normal built-in initcalls depend on the link order, but when
they are in the same file, the compiler can reorder them before we even
get to the linker.

I wonder what a good syntax would be to still avoid the boilerplate
code.  We'd probably need one macro to actually define the init/exit
table in a single statement so that it can't be reordered, but that
would lose the ability to actually declare the module subinit/exit
handlers in multiple files, which really is the biggest win of this
scheme as it allows to keep the functions static instead of exposing
them to other compilation units.

And in fact even in your three converted file systems, most
subinit/exit handler are in separate files, so maybe instead
enforcing that there is just one per file and slightly refactoring
the code so that this is the case might be the best option?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
