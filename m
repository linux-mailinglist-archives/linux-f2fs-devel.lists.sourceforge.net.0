Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E69C8C1C1A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 May 2024 03:25:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5F13-0003xE-5s;
	Fri, 10 May 2024 01:25:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1s5F11-0003x8-W6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 01:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NloqIc+V0pui5CStRd+DL6w1IgT4O3i32CnVyhJwEes=; b=HBV893t00Qehc45gJ/Q+jpa/gx
 jawadqqO6FYNoMA1mtc2sTOCEtUUMRnLNrUGePG1nGx8WqSOTg/JmyChkOJXrHlb6WS7VszqkVtH+
 Sul4lPmqzYhmUnrm3b1xdV2lCEoLl81S91GI6LgY8SlFFC1RDrSyDdY/+v6wc7rbAaXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NloqIc+V0pui5CStRd+DL6w1IgT4O3i32CnVyhJwEes=; b=j+fJM737dKUHoC4qJR0OVa2Efo
 U2n/J2euj+bBT8XEuIEqFgT4ryTOOKP65j/ZyolUYS9eHCnQMXKv83DE0TzgsNfCiWuyXzKrmRgWD
 f/7OSladDvu7FQFN7MMgG6ui4qv9TG4AGzwTSy1qf/g+itfeirefz9tut6Obl8G8jFRY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5F13-0007b5-6H for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 01:25:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 22B2ECE1C14;
 Fri, 10 May 2024 01:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2062FC116B1;
 Fri, 10 May 2024 01:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715304327;
 bh=z6usap/sG4pNmXnz79zMaYcGqNYRG6xfvcprS7cuFkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N7igZdW8tgYu0o8kPCfFrxugMADMEZ0lCFEu9UoLdURi8eu138yKWg/2ootT5zu5c
 T0G/fZU941SH5WD8Qw18MiyQf9ftFYRJhvQ9C2K2KlOnzroGfZu0/+HyFi9T6OFzZ9
 p1yG48T48Ps161PumuwbBGRRTLoaQwftCeRzdqgO5Dm8ZzWnCBepTI9eO5/4/BiJdt
 JD1Q10H+z7UBJBoyGG5LekBosH0bGwkOQu8gb2bnP0QdtGMJbUKh6Xn+2O/1Emu5q7
 NfBWu5Kw7Rut2ZpIJll8V3BkstRTm7H83eEP4/JxwnV8ZtmhADiqsGocmx25eiDheN
 3GBs0ueg7Ijag==
Date: Fri, 10 May 2024 01:25:25 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Message-ID: <20240510012525.GF1110919@google.com>
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
 <20240405121332.689228-8-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240405121332.689228-8-eugen.hristev@collabora.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 05, 2024 at 03:13:30PM +0300,
 Eugen Hristev wrote:
 > If the volume is in strict mode, generi c_ci_compare can report a broken
 > encoding name. This will not trigger on a bad lookup, which [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5F13-0007b5-6H
Subject: Re: [f2fs-dev] [PATCH v16 7/9] f2fs: Log error when lookup of
 encoded dentry fails
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 05, 2024 at 03:13:30PM +0300, Eugen Hristev wrote:
> If the volume is in strict mode, generi c_ci_compare can report a broken
> encoding name.  This will not trigger on a bad lookup, which is caught
> earlier, only if the actual disk name is bad.
> 
> Suggested-by: Gabriel Krisman Bertazi <krisman@suse.de>
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>  fs/f2fs/dir.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 

Reviewed-by: Eric Biggers <ebiggers@google.com>

But please fix the typo: "generi c_ci_compare" => "generic_ci_d_compare"

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
