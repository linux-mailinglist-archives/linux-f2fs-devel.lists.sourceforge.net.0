Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D62DC93A2D0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 16:34:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWGae-00030d-Jm;
	Tue, 23 Jul 2024 14:34:08 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+3e265a4a9aa486cd5844+7639+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1sWGac-00030U-TX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 14:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zGob8cqOMQFMd6ZJ7aKelgl8bYUnwmxgqspoHZfsBx0=; b=cGXggrZ32I6wgVxnbzDYh9OPjL
 0iTSj//4gGDCAUbOTGjyeJTttF2daT7I9/NRkidYvGnMNwDbuT5lqvYD4uoAsIOkU46xQQIQKf5fa
 tus8/03qOd6BGzxmw/wUqMPkU0vZJ4OzgGhqI0gLOJK4yJYCBIvVqh+mMFpM4N9LIOHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zGob8cqOMQFMd6ZJ7aKelgl8bYUnwmxgqspoHZfsBx0=; b=CNEu5KLWwOVQiXNouBIdHXPfqI
 hczEFJLaisLO6ZCGcNFkX3qHnthX83pL+2UqaXhc5mx95y9jM9I/YoDmydh203g3cNUbcER4ERINp
 RqYsuPsAfBDMxGyC5Q1CI0K9c0woYgKfUZgqURsc0mxSFXHS8UGleY4jwuL5UuUx08sY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWGab-0003dm-NF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 14:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zGob8cqOMQFMd6ZJ7aKelgl8bYUnwmxgqspoHZfsBx0=; b=LlGImzz7gLD4aCmwv8k4A0e1DZ
 9GPGExELQMb2KbFmKQ+PVeYYxd+u3UDPu2eFN5slv6eWCOFjXC4eQv3mVkP9Lp2d2MNtl1O+afP09
 XG4BbGox2nxhz11YruHX++g9dEN3hIXRBUrmLw4jTiE4t0Ol2b9R1vqXGaOGR0qVt9Hogrell65hH
 zXMwfVspCNgUQnTfpCAkGokZP7Oca/Qb5Jo2DQMo0jZD8u27maea1kaAWaWTK7Fsc5SauwsDTCrQ5
 AEkl44+PaDhnyrKcbbS2YHSwU947HsWksD1v28wQD+UEAjWaTY3TczmHsi3L6MxjLU6HTpkDwCLdl
 9iITSJsQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sWGaC-0000000CjEg-3FBu;
 Tue, 23 Jul 2024 14:33:40 +0000
Date: Tue, 23 Jul 2024 07:33:40 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Youling Tang <youling.tang@linux.dev>
Message-ID: <Zp-_RDk5n5431yyh@infradead.org>
References: <20240723083239.41533-1-youling.tang@linux.dev>
 <20240723083239.41533-2-youling.tang@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240723083239.41533-2-youling.tang@linux.dev>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 23, 2024 at 04:32:36PM +0800, Youling Tang wrote:
 > Providing module_subinit{_noexit} and module_subeixt helps macros ensure
 > that modules init/exit match their order, while also simplify [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [198.137.202.133 listed in list.dnswl.org]
X-Headers-End: 1sWGab-0003dm-NF
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 23, 2024 at 04:32:36PM +0800, Youling Tang wrote:
> Providing module_subinit{_noexit} and module_subeixt helps macros ensure
> that modules init/exit match their order, while also simplifying the code.
> 
> The three macros are defined as follows:
> - module_subinit(initfn, exitfn,rollback)
> - module_subinit_noexit(initfn, rollback)
> - module_subexit(rollback)
> 
> `initfn` is the initialization function and `exitfn` is the corresponding
> exit function.

I find the interface a little confusing.  What I would have expected
is to:

 - have the module_subinit call at file scope instead of in the
   module_init helper, similar to module_init/module_exit
 - thus keep the rollback state explicitly in the module structure or
   similar so that the driver itself doesn't need to care about at
   all, and thus remove the need for the module_subexit call.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
