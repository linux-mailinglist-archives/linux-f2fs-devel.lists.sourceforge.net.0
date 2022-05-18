Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD31052C347
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 21:27:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrPKI-0007WD-1F; Wed, 18 May 2022 19:27:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrPK5-0007W1-Oi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 19:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j8+absFiRt71sQVT9HiVnziVhcGHmYgCjIpOBqkpKWw=; b=G3xQxRsufUKhEPsPQsN/kFgo70
 BpfOGpx71EdOKJJd4xeRO2BIgnmBu+ZZZJIkiOpZFJ510hZCChBepMxaaL22+0ehgz/P5uZ6Oag3X
 04ciqc99yjDMNDWYZtSFaYq1nci2rzKygqHJ8oeZMflKfL6yRfIHyCC1HhCytaUjQgZ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j8+absFiRt71sQVT9HiVnziVhcGHmYgCjIpOBqkpKWw=; b=Tne9/2SLCofCJm9YVLUporipZQ
 mRzgFN4suK7sfYCueuiufZ6OrRN6iACaiIZjX0eQG3t15PhqjlXdaUwRfy6WAPKArN5OSTMAPSLDS
 JGcMyPXTPAVmQj6hZIBW2QvjTWKsgKidmYJrBUocKCQ+iAE4dhFi6z5Rihs3ljtG0+/Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrPK2-0002P0-Co
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 19:27:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB31061913;
 Wed, 18 May 2022 19:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD69C385A5;
 Wed, 18 May 2022 19:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652902016;
 bh=6bK0g96KHKgmSLVgDc/esxHtkqrzJWXIyc5tLrYriNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2Wz/2Nvj4IMrE3hQMQPPRHCALP2EaKRug9MA4I0XX7WC/5AfQJY0lvZN+mFRZLkw
 RoxwlJF3mCK7hGxKuNfWOwCmr5JyS8BJm0mTLOINQpO2Oh6AA4yKBpcb3lz9AG6P04
 DXJk4MimjTgMHrgYigXWoHY/VZd//Cj7wWBVvyi+v/JlW92EweUrqC1Pc/VFnbCWbB
 pAZl6zwc68mXSlm4nextD9sS38g6I8wg8jCuqccKA1pbNgANC6SZN9VBvi6dhHLQ8U
 hSG/e3nnI8tqJ5OKiJWVlncLTQVjvhEt8oGO9gUvnJuthqXwPfPshuIfN6ylaB/DYx
 tRRp4rE5HydQA==
Date: Wed, 18 May 2022 12:26:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YoVIfsjT2OE6Wj2k@sol.localdomain>
References: <20220518172320.333617-1-krisman@collabora.com>
 <20220518172320.333617-9-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518172320.333617-9-krisman@collabora.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 18, 2022 at 01:23:20PM -0400, Gabriel Krisman
 Bertazi wrote: > Instead of a bunch of ifdefs, make the unicode built checks
 part of the > code flow where possible, as requested by Torvalds. [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrPK2-0002P0-Co
Subject: Re: [f2fs-dev] [PATCH v5 8/8] f2fs: Move CONFIG_UNICODE defguards
 into the code flow
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 18, 2022 at 01:23:20PM -0400, Gabriel Krisman Bertazi wrote:
> Instead of a bunch of ifdefs, make the unicode built checks part of the
> code flow where possible, as requested by Torvalds.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> ---
> Changes since v4:
>   - Drop stub removal for !CONFIG_UNICODE case (eric)
> ---
>  fs/f2fs/namei.c | 11 +++++------
>  fs/f2fs/super.c |  8 ++++----
>  2 files changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
