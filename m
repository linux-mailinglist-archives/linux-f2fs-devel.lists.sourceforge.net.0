Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5A382C889
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 02:01:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOSOx-0003xA-01;
	Sat, 13 Jan 2024 01:01:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rOSOs-0003x3-OO
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 01:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SZqoaJDMLM5hSF2L9c0vsenFbxrqsEuP28RWqvESI28=; b=KjHDDtCV5eujjglfLp8ndt7oXu
 mqzs28LrP9lPOygpNPPGUM/38Xlr3DfaB5/b8ETaMS4gJGLXxdZHi3TMUUk3KoHbcEj1ssuN6mcIu
 b8dpGbgNdp1EoFNzOCa6Z/x0pbhIYE160TOKKUoqRy/gni5VEgzBSV1gHYOT65nTcjQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SZqoaJDMLM5hSF2L9c0vsenFbxrqsEuP28RWqvESI28=; b=JqoN2QA1GG8OuYFX2BdsxjXgg3
 abmEn/QKlGAUlI3wUflddvK0AurTd81i6OShy8rkTraJkxwF2qPsc/MmcCcAf/t/sLlwngJIVK0/a
 Pvh7W4ZdLR7AE4KQEX30JsgCD4Atzp0UFxlVQ+b7oqbCXU0PHJMraaNbqLX+H2cqs62o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOSOr-00068D-Hy for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 01:01:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABE6B61CB2;
 Sat, 13 Jan 2024 01:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315AAC433C7;
 Sat, 13 Jan 2024 01:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705107680;
 bh=+axu1UQ1Imh6/igfm1lDN70XKP8E1L63E0Njkf/6jd8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jqsswl9z2poabxiZG85CfxI0w6SBy1fHX1/INz3/sZd5qR0Rpd2HavlCN5QRfGZef
 PFv71ASZlEX2RaG6lfknGUpafqZUxCF/vO3nvb8FJBRENa0MuxDApGr7lJbe5wEM9Y
 uSE3R6YLPhGWxa0e3VDoM6/1vfc0sL0X/xE3qwfC/TuStcQ1SjSCG6ey0VLNJvrWyZ
 Ee7jhghzm2kbGFMNEhzAjDakTIdpb/6cAw5yK45hH3Q8pbrmxweqx4Wo9maf7+iODQ
 JvOIGuyebsBi5OaeqY+xSAmW8DWk6ZxXitW+vTipmLiBcT5vYD9I2FTO9Fbyz1nCrV
 2IdJN2aXRRPLw==
Date: Fri, 12 Jan 2024 17:01:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20240113010118.GB1147@sol.localdomain>
References: <20240113005031.GA1147@sol.localdomain>
 <20240113005747.38887-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240113005747.38887-1-ebiggers@kernel.org>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 12, 2024 at 04:57:47PM -0800, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > kill_f2fs_super() is called
 even if f2fs_fill_super() fails. > f2fs_fill_super() frees the [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOSOr-00068D-Hy
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix double free of f2fs_sb_info
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
Cc: syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com,
 linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 12, 2024 at 04:57:47PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> kill_f2fs_super() is called even if f2fs_fill_super() fails.
> f2fs_fill_super() frees the struct f2fs_sb_info, so it must set
> sb->s_fs_info to NULL to prevent it from being freed again.
> 
> Fixes: 275dca4630c1 ("f2fs: move release of block devices to after kill_block_super()")
> Reported-by: syzbot+8f477ac014ff5b32d81f@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/r/0000000000006cb174060ec34502@google.com
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Jaegeuk, I'd be glad to take this through the fscrypt tree since that's where my
broken commit came from.  But let me know if you want to just take this through
the f2fs tree.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
