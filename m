Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77E8193EB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Dec 2023 23:55:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFizs-0005FI-UH;
	Tue, 19 Dec 2023 22:55:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rFizr-0005FC-Td
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 22:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iJBY0cZPGYKTgAhNrTp9X1DV9e8Zee1G9jD4NbD9bYk=; b=IRSreQqxoy8Upzv5RNklR9N9fW
 bGprgCXvTbSKYG6BZdmex37z4QhRsKZweAW2hQNgQZ76jjNW8Vy0BdtNcAKTYjJEYNGW96FvkphjZ
 mWg9USrtKgfRq3megpB6bOsnlHQ2/cX1ajlDf+ssagdjcp+3KZNPFrJtWgxKH4aT0Y3w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iJBY0cZPGYKTgAhNrTp9X1DV9e8Zee1G9jD4NbD9bYk=; b=VNJg11PAvhNU9NFOiNmYSPsXK1
 u8qRXNzsWf1lst2eMMReDGifqBtjawLSKmTrITkRwrb1pWTBpTskGl63FcQudHyZiVi7VIIMAVdJh
 dIkGSmxhlX9JFatlcO9TYemEKVfwLMPgpMflWTujo30qHHjWxRia9DCFpm8aMLqMft7E=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFizo-0001Ea-4B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 22:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E64B8CE1AB1;
 Tue, 19 Dec 2023 22:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1D1C433C8;
 Tue, 19 Dec 2023 22:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703026512;
 bh=MW5t6/exIbCttjI/uoABa/B9xpu348NYEe4YO75s+Hk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t6zZn2z3m7PdGkeWMUltfF2jJFqBL6orYuCfJw1xhZ7RA25lwXFH/1pVdS4up5/e8
 4B1wnBM+QeQRGx3LWxmyq+L99bwdG5m4n/SOH7ysDpRzQWaSIS0RAPVM69MiAAgoOE
 hlBhWcWmFDk4EwA61LrkLCzGCtnPBZ5/Am0i3qUA/0yFWhahY/K36uAvaydE/RRb46
 kJxVzRlvDiWn/d78ZH3Gt/D6briDMOg4ITNVxWD6xuI0KfY261MHKf7Fexi0UUJLw9
 5RcgKa05SvuogZjIhQX7mpGSbzHy+9xVQpOQ0kvKLwUjogXRJCIf+goh1SUfud+x2J
 H3UzDIDFRZh7Q==
Date: Tue, 19 Dec 2023 15:55:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20231219225509.GE38652@quark.localdomain>
References: <20231215211608.6449-1-krisman@suse.de>
 <20231215211608.6449-4-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215211608.6449-4-krisman@suse.de>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 15, 2023 at 04:16:03PM -0500, Gabriel Krisman
 Bertazi wrote: > +#if defined(CONFIG_FS_ENCRYPTION) > + .d_revalidate =
 fscrypt_d_revalidate, 
 > +#endif #ifdef CONFIG_FS_ENCRYPTION, since it's a bool. 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFizo-0001Ea-4B
Subject: Re: [f2fs-dev] [PATCH v2 3/8] libfs: Merge encrypted_ci_dentry_ops
 and ci_dentry_ops
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 15, 2023 at 04:16:03PM -0500, Gabriel Krisman Bertazi wrote:
> +#if defined(CONFIG_FS_ENCRYPTION)
> +	.d_revalidate = fscrypt_d_revalidate,
> +#endif

#ifdef CONFIG_FS_ENCRYPTION, since it's a bool.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
