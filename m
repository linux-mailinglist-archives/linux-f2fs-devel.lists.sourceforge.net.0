Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56390794DF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 21:37:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsBT1-0001Vr-0I; Mon, 29 Jul 2019 19:37:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hsBSy-0001VX-Vh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 19:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vOUpWH75c/PvyEuwx65rdlI2u9m54sjzRCuUcU7Dd1s=; b=EkkmxtlV0tFBabvIGj7XtUVZ3L
 BzS8FifBemR2qPYB+Fj5sm+kXiZpHLtI+zCWOMUqBJh5kVmESy5fR7osn7/7SxlHy+78ZQYhH8gnU
 hvwA+Uh4GasygQQJx+PuR6pdhUKBdiIs5UKELmp4naiP11iR3MrXyY9Qjf0pyF0wxVEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vOUpWH75c/PvyEuwx65rdlI2u9m54sjzRCuUcU7Dd1s=; b=bMKSnEjO8ccwSPaDwVNN+UArk7
 R2UOoTLHF9VfftS89u54uUtZA6nxOxPIh0OSwE0qfgaoloFU8//LsDGYqbsjlegvx2PT2n6aXkRas
 34usCj3YHirEa1IlZib54xE5cwm9D/Xs5yZEiltQlGWOnOfBOtk3ALSlepMONuJX7goM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsBSv-00FkOg-DJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 19:37:52 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E126206DD;
 Mon, 29 Jul 2019 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564429063;
 bh=35ZwmfXjVkjcTD49ueQekrtcYmxgdRwDGATcxQouXLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgTCz2CWqZ9GLFMzgaQtbnyPki0Oxg8qrvTR97l00Gc8CQzx+zc2oXmp7EWb24DL7
 lqI1c/qw8hCySTW9XZjhkJGofi5da7NFa4tbNNzKq3SlAVuvZteu0lZkG1ZnucaL4j
 QUyqoTdTCGY36VS+Fv9/JDNLvuGsN+DnFosM0q6c=
Date: Mon, 29 Jul 2019 12:37:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20190729193740.GD169027@gmail.com>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>,
 Satya Tangirala <satyat@google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-6-ebiggers@kernel.org>
 <20190728154032.GE6088@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190728154032.GE6088@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.4 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.5 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hsBSv-00FkOg-DJ
Subject: Re: [f2fs-dev] [PATCH v7 05/16] fscrypt: refactor v1 policy key
 setup into keysetup_legacy.c
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ted, thanks for the review!

On Sun, Jul 28, 2019 at 11:40:32AM -0400, Theodore Y. Ts'o wrote:
> On Fri, Jul 26, 2019 at 03:41:30PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > In preparation for introducing v2 encryption policies which will find
> > and derive encryption keys differently from the current v1 encryption
> > policies, refactor the v1 policy-specific key setup code from keyinfo.c
> > into keysetup_legacy.c.  Then rename keyinfo.c to keysetup.c.
> 
> I'd use keysetup_v1.c, myself.  We can hope that we've gotten it right
> with v2 and we'll never need to do another version, but *something* is
> going to come up eventually which will require a v3 keysetup , whether
> it's post-quantuum cryptography or something else we can't anticipate
> right now.
> 
> For an example of the confusion that can result, one good example is
> in the fs/quota subsystem, where QFMT_VFS_OLD, QFMT_VFS_V0, and
> QFMT_VFS_V1 maps to quota_v1 and quota_v2 in an amusing and
> non-obvious way.  (Go ahead, try to guess before you go look at the
> code.  :-)
> 
> Other than that, looks good.  We can always move code around or rename
> files in the future, so I'm not going to insist on doing it now (but
> it would be my preference).
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> 

Agreed, I'll call it keysetup_v1.c instead.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
