Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282B5E7295
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Sep 2022 05:54:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1obZlz-0004yL-OK;
	Fri, 23 Sep 2022 03:54:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1obZlx-0004yF-Po
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Sep 2022 03:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kTS/qyPPQoB7Lo0ZCuFqDZdN0cx5OUhZZiLgdNfYncc=; b=PQ9WoVmLL2eskn1iNc3PXrgBDr
 1yCLhTgn6hT+ihP+lt8Rai1AJ7QNk73ACKpKRI5pxFdADtfaA2HIlwmeFg9N5atCEVQZCAmvj4jXG
 OuQGf1Il+PGzFiamL1O48D+XSSWY4ze1GgRaaGlLxIMFxkO1jMVmT2mZUfUHUn4J56Is=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kTS/qyPPQoB7Lo0ZCuFqDZdN0cx5OUhZZiLgdNfYncc=; b=ASNyqm1Pel/XC+6sq7BstKY4df
 J3ciT+dkZfjjlviCji2PNVUGawgS9PySF4Nc35zlPbU/CpxwM/bVC6JYQvyTLIVDZk82h+Sf8J4P6
 1C+02S1xWU2rnVrZHlYhkQhlVN5RQDrQGTziYvKJPmaKT1ApK+sqo5V1j+njrV0ktkBU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obZlx-00HC36-64 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Sep 2022 03:54:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C65B261137;
 Fri, 23 Sep 2022 03:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0F2C433C1;
 Fri, 23 Sep 2022 03:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663905267;
 bh=0b8qZx/Dn5ZEbcgLdRW7xn+o1HAyAGmZiNloh7DqwqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HSnAek8OAiM5A6ppds2zC3rzPfYrvfXDxt8HDN8HvJ0KprDgfbNMj0YhjUWhDAXAq
 j0bdKU5dBwuF7YvCeSc8X8j0SDY6i4K++NL3GvSC9DGmGVE3uEcVnU5YInusoxRzzq
 ViX4UCXsATrqpSJbKSmhguzzJdxDYxvAUr0MONfM56E6tywbxRlL4Azz7pchX/zp5E
 wyO65zg8/BzW9FYeYyIsNRIIirUJGuid+cZ5xIYgtaEc3JvS8e519yl0dXwAxKwhw6
 mNAaOFsfiVfYxmW1bKeSFUMU0QYcihQEsA/zdSTjHRlWr4cP/ogHq3yip9TQB0BKTd
 lr5k1pPOYE7YA==
Date: Thu, 22 Sep 2022 20:54:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <Yy0t8WYhM+Dv3gX1@sol.localdomain>
References: <20220913234150.513075-1-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220913234150.513075-1-krisman@collabora.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 13, 2022 at 07:41:42PM -0400, Gabriel Krisman
 Bertazi wrote: > Hi, > > I'm resubmitting this as v9 since I think it has
 fallen through the > cracks :). It is a collection of trivial fixes [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1obZlx-00HC36-64
Subject: Re: [f2fs-dev] [PATCH v9 0/8] Clean up the case-insensitive lookup
 path
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

On Tue, Sep 13, 2022 at 07:41:42PM -0400, Gabriel Krisman Bertazi wrote:
> Hi,
> 
> I'm resubmitting this as v9 since I think it has fallen through the
> cracks :).  It is a collection of trivial fixes for casefold support on
> ext4/f2fs. More details below.
> 
> It has been sitting on the list for a while and most of it is r-b
> already. I'm keeping the tags for this submission, since there is no
> modifications from previous submissions, apart from a minor conflict
> resolution when merging to linus/master.

Who are you expecting to apply this?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
