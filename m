Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2B677D87B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 04:34:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW6Mg-0000Di-8l;
	Wed, 16 Aug 2023 02:34:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qW6Mf-0000Dc-40
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 02:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pp0CtaiscONLb3fkEtcSx1vT3jM/xxHAr4Yhj6l+74E=; b=PHmVk0fYJz3qyRKUR3c+cwhDM2
 oWP/2OXDBA3TYhsjqSVz8SPe/jdjHx77Imzr2Q30WfP4c9k1EEfPrkLPqQpCiahStv0h6kgmY3VF8
 Hlc1gC1ne5v2H5KcWQY5FqKqqMeiU1TX0Hfn+RFobUm3vXLh1Z/5/vU90ITRZU4VQUlg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pp0CtaiscONLb3fkEtcSx1vT3jM/xxHAr4Yhj6l+74E=; b=LkWT7t7a90PuAJbzLZc5AYprN8
 rjMjZV/Xam57kLTyrEwEZGuY/RnDKbNPQIoLDRIfYN2uhy4HGW0DEd1DytFiwmVA6a/FZh5yVtPlb
 RVpUak4LSVeI7nDvhp2EOdGwp5ryTGFza/ESXpH4NSy4klJixurDFaxRxcq/U+u+iGHI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qW6Mb-006jZK-Mw for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 02:34:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 17A916329C;
 Wed, 16 Aug 2023 02:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55073C433C8;
 Wed, 16 Aug 2023 02:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692153259;
 bh=ILKLaDUtT4i0mLelpGeGRXNq7uFDFZtIQuCu+6LzedM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PuEwZD18a+rqpN6UCHqN06Yf4QFXzCf+Tf9BmBrmkdCIJIBCkmqCsmctg8RBclgVV
 eeJ+SYK6N9DCir13+XKXkYpNE2bQADoV0p/40qnnWkJHP36HH+HrbQ+bFVF9Fqgplx
 yHaAEud6GmX6qIiZUfKLdWRTaigIhI8lZHajJkH0voVHAqrsnVB8sVPdXSAvr74x6/
 Dgjv5w1tw8+EDOVn/ADghbjLDzGul6s0ijY+EliEvC9HwKzz4V/bPL+WTS5uWtBH3u
 qgVAdGdMYD0LNKeUrjsx5RUv+HnPyy/8Oz3mAc7KcT+dPzKz9dxem/5i4jwiECgZe/
 GhkZZCkJUUk5w==
Date: Tue, 15 Aug 2023 19:34:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20230816023417.GA899@sol.localdomain>
References: <20230816011432.1966838-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230816011432.1966838-1-drosen@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 15, 2023 at 06:14:31PM -0700, Daniel Rosenberg
 via Linux-f2fs-devel wrote: > F2fs filesystems currently have two large
 restrictions
 around block size. > The block size must equal the page [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qW6Mb-006jZK-Mw
Subject: Re: [f2fs-dev] [PATCH 0/1] Add 16K Support for f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 15, 2023 at 06:14:31PM -0700, Daniel Rosenberg via Linux-f2fs-devel wrote:
> F2fs filesystems currently have two large restrictions around block size.
> The block size must equal the page size, and the block size must be 4096.
> 
> The following patch, along with the associated f2fs-tools patch set, relax the
> latter restriction, allowing you to use 16K block size f2fs on a 16K page size
> system. It does not allow mounting 4K block size f2fs on a 16k page system.
> 
> Doing that would require a lot more work, requiring a refactor of all block
> sized struct similar to the userspace patches, as well as handling the block
> reading/writing at sub page boundaries. As far as I know, buffer_heads are
> still the main way this is handled in other filesystems. Is there a different
> option there? I know there's a general desire to move away from buffer_heads,
> but I don't know of any replacements covering that use case. And it would feel
> a bit silly to not be able to read older filesystems from a 16k system...

iomap is the replacement for buffer heads.  See https://lwn.net/Articles/935934

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
