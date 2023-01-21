Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E1967640F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Jan 2023 06:47:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJ6iX-0007Ry-2k;
	Sat, 21 Jan 2023 05:47:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pJ6iV-0007Rs-Kz
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ooqmtC9vgkjhH5uMtOuYKubMReNDays7h0BBrH5+8M=; b=ZVjNIq7tAmTGoce7t/rA+nfKxS
 gLftNdL80pm4fY79MzY4AbgN9CNGBamZF+bsFqrQc29eSz4STNXtv5OeZhsSZy3ZlTBCl7+enxEuR
 bWW8LP5oVM8YKU7ZTFAT5NRQ4+GPX5hD8wDWXnDf79ZD388sLEESjqg0XdyhHbCFCcF8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ooqmtC9vgkjhH5uMtOuYKubMReNDays7h0BBrH5+8M=; b=XCq67xQv+tWuthmRs7/wtxfl9v
 6NH920/5bQeL6HkbrO88rqO+/xC7Ifq14UFkUol4M4QkdIADxqbcfjJNnohEwaO8SzgVh6xbULa5Y
 0cY5F7QXBvuKGZ1NZ6rwT4Dqs7TAn0hTmsRgS7j7swqBdj8pnt4K4q12aysHNBhZRbSg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJ6iU-00B8Dc-9u for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:47:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD219601C0;
 Sat, 21 Jan 2023 05:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E24C433EF;
 Sat, 21 Jan 2023 05:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674280012;
 bh=8SxDwvezamNgdCvUXl9WhV9580K6miB6Zm1RyeGT6PA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LAK0J7coIoDluJ2A5Jm66dZUoSbq6jKiU0ykC2xY7ovP7DEfTJbKnn4D9duF50W4n
 p2zYljlus3Uh0Kjaf9ueWDOgKRrvvjnV4KvCYfpUwrgbP/DnaO/4JGBhB23jD5kQp3
 48lmMJ+JtuoRNhhzoTco/WIgs2qT7pnU0Gr661maMMrTRCTRQDQMzkxWxv+bq9GBqh
 4gz14G6fT6bUe/40rnNzsu/GfTeei0Qh3aKzYx8TGPKxzBxW6agmm1i8ErCHvr0vHN
 kpw9PMQ8D4v/ls80RY2dGIGyTGRTz1sXsrrMCHyJXm2AnuOhZHYoUlshLTH9VCq5Fm
 LejQtZIDNL5PQ==
Date: Fri, 20 Jan 2023 21:46:49 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y8t8SZ9VGm5fjYAn@sol.localdomain>
References: <20230121051204.81251-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230121051204.81251-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 21, 2023 at 01:12:00PM +0800,
 Yangtao Li via Linux-f2fs-devel
 wrote: > commit bdc48fa11e46 ("checkpatch/coding-style: deprecate 80-column
 > warning") increased the limit to 100 columns. Le [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pJ6iU-00B8Dc-9u
Subject: Re: [f2fs-dev] [PATCH v2 1/5] f2fs: fix unnecessary newlines in
 super.c
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jan 21, 2023 at 01:12:00PM +0800, Yangtao Li via Linux-f2fs-devel wrote:
> commit bdc48fa11e46 ("checkpatch/coding-style: deprecate 80-column
> warning") increased the limit to 100 columns. Let's remove some
> unnecessary newlines.

80 is still the *preferred* limit.  See Documentation/process/coding-style.rst:

	The preferred limit on the length of a single line is 80 columns.                
											 
	Statements longer than 80 columns should be broken into sensible chunks,
	unless exceeding 80 columns significantly increases readability and does
	not hide information.                                                            

Also, to avoid churn, patches that just change whitespace generally aren't
accepted, unless they are changing the relevant code anyway.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
