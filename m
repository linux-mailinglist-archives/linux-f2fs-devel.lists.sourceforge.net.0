Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C1D64F2F2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Dec 2022 22:07:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6Hv2-0006OT-Rq;
	Fri, 16 Dec 2022 21:07:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p6Hv1-0006ON-9X
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 21:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=at6967C7j64I3lOpJBO5sAVcM5CEP23kwlurpaiaQL4=; b=Hb+68OE/UqlGQthI6eNd6v+BDS
 kJty/S4mvf9x5wvsZlHm4XJ0gIZy+Nv2oM/krCF6rl+MqtLu7xJK4DFxqD5G4OFvqkikd6MQpyFXs
 et19X0vJx7G57yK/TeLbkZ7Gkbb/3SGx+6OJIbFA5DG/ydYKYnzJtgOKuCSUpOu5t5cM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=at6967C7j64I3lOpJBO5sAVcM5CEP23kwlurpaiaQL4=; b=MdG/R7VY6cP8wlTWsOKE41X4qG
 iw/ZMLJ3uVtE/N5OayFLdwplxyEL8wpK/Vavj3VOVH3YQucULnn8tsJPQba4nIQlag42SZR2lrQCP
 rGKZAoUIfe4FnG2J/MEgS5GDtRYGarntNekYKnBrMukIPGiSvDISdcpt94s/fOUG9dio=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6Hv0-001lsB-LB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 21:06:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45AF062237;
 Fri, 16 Dec 2022 21:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7663AC433EF;
 Fri, 16 Dec 2022 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671224812;
 bh=vQnEle8DIQDINZxnB4NynE9ZPfDylYmC1JKlkPCWync=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lw67mAqbYQewRYaBRK79ZyXVfd7uicKtXjRTP7rWqlPFcx4p8r4qJm9WleLTc/9m8
 Afj57BHi1WUzfLH1Lxo5o91LOvRYNBobnEZZHw7J/c+GvYDJnjRDjMo7mUYDk7HnXS
 tPkiXE1SPXm7AgxVv+GWXCBAG7Zv6vbDwyoxDVymffwBbRQ/rsolhHDCiduVlPkofI
 a3sYKxMNkEgQKmD2ZYkz8a4CCAZPS1R2r7S87MvDJPi1tQjgQXU84dDlFFcrtqbn7h
 /+JMg29kiV0wbYgBTSmTnFbvcrbK/radR1MK9d8dLg0WF8h1Y9DKtrmx7etugfndQ7
 gGg/dbKobgxKQ==
Date: Fri, 16 Dec 2022 13:06:50 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Luca Boccassi <bluca@debian.org>
Message-ID: <Y5zd6ucBc20CV7Le@sol.localdomain>
References: <20221208033523.122642-1-ebiggers@kernel.org>
 <CAMw=ZnQUmeOWQkMM9Kn5iYaT4dyDQ3j1K=dUgk9jFNcHPxxHrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMw=ZnQUmeOWQkMM9Kn5iYaT4dyDQ3j1K=dUgk9jFNcHPxxHrg@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 08, 2022 at 08:42:56PM +0000,
 Luca Boccassi wrote:
 > On Thu, 8 Dec 2022 at 03:35, Eric Biggers <ebiggers@kernel.org> wrote:
 > > > > From: Eric Biggers <ebiggers@google.com> > > > > An issu [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p6Hv0-001lsB-LB
Subject: Re: [f2fs-dev] [PATCH] fsverity: don't check builtin signatures
 when require_signatures=0
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 08, 2022 at 08:42:56PM +0000, Luca Boccassi wrote:
> On Thu, 8 Dec 2022 at 03:35, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > An issue that arises when migrating from builtin signatures to userspace
> > signatures is that existing files that have builtin signatures cannot be
> > opened unless either CONFIG_FS_VERITY_BUILTIN_SIGNATURES is disabled or
> > the signing certificate is left in the .fs-verity keyring.
> >
> > Since builtin signatures provide no security benefit when
> > fs.verity.require_signatures=0 anyway, let's just skip the signature
> > verification in this case.
> >
> > Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
> > Cc: <stable@vger.kernel.org> # v5.4+
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  fs/verity/signature.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> Acked-by: Luca Boccassi <bluca@debian.org>

So if I can't apply
https://lore.kernel.org/linux-fscrypt/20221208033548.122704-1-ebiggers@kernel.org
("fsverity: mark builtin signatures as deprecated") due to IPE, wouldn't I not
be able to apply this patch either?  Surely IPE isn't depending on
fs.verity.require_signatures=1, given that it enforces the policy itself?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
