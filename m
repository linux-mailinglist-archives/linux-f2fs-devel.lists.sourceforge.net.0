Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3865CD68
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 07:58:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCxjF-0008HA-IN;
	Wed, 04 Jan 2023 06:58:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pCxjD-0008H3-31
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 06:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mE6ZKwD3kNSC8T9t4dogJG/RMfblG8gG8cQg98HLjSw=; b=b4gHScTA36CUyl0Aj/YmlQiamh
 h2qktcmiG/cTC2AMkpQXaP2vIax6gkpMIeQHV7X6UNYRAajGpphXZp7695yT4c31K2a1noIJyJqm9
 PES14grltOlgZVhTtlJzmX3RiryXhFwaxNlHhTLwvT8ebr5CRXZ2wZRuALZ+kEHL8PCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mE6ZKwD3kNSC8T9t4dogJG/RMfblG8gG8cQg98HLjSw=; b=bTt/kUiC4GUi10xgYwt+boLl7N
 YRPzKAktyVTv3wUosbdS6/0spb9u1V3KcSLQ4YuAEYHsfF/xBQb+x/4KdKn1IWQbK5Mairm/2okvl
 8UtyGfonPbf2npPRQgE1wWuO6DX0trsw0D0iLdR0pymfKC2yS9wE3LRmR+QN4qeDB2mw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCxj8-0006t6-S1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 06:58:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7633861538
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 Jan 2023 06:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAB0C433D2;
 Wed,  4 Jan 2023 06:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672815492;
 bh=vWfykaBxFK2pbWTG8aqUgsTxDhfUAki+UHVh3CZ1kTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qwTIUFZ70fsAPevhykQFaIiev2rVp1Zi6w8IBwq0eEjefZZTS0vCq4zoZVpWesh/q
 +BQiFRv6kiTpn/0OYS6Ge3NjGTVzcH0zT9EWfba6XrDjW4X6ElYC3XjEDOt5iuF69R
 bSbsEN8OHTKbQL5JcvI/uhUmZpUlEXI730THT+mZKU95gXFs3KOH3TrUYJ+hjvcDEc
 792voQwfxHzXs8in+F8Wzpe3PnRZbukSaABO2HlkDYrxboe2cC+/K4K4QREP1aXcKh
 ZgfthXZGBf8M62pHfy5B14c4kbBDpx0X/jiFj6p/m+ScG+Br2yrRPSMDsY/0MWpryv
 WBuD1ek9Zzt3Q==
Date: Tue, 3 Jan 2023 22:58:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <Y7UjgiewvGecg9XQ@sol.localdomain>
References: <20221214224304.145712-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221214224304.145712-1-ebiggers@kernel.org>
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Dec 14, 2022 at 02:43:00PM -0800, Eric Biggers wrote:
 > This series implements a few cleanups that have been suggested > in the
 thread "[RFC PATCH 00/11] fs-verity support for XFS" > (https:// [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pCxj8-0006t6-S1
Subject: Re: [f2fs-dev] [PATCH 0/4] fsverity cleanups
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 14, 2022 at 02:43:00PM -0800, Eric Biggers wrote:
> This series implements a few cleanups that have been suggested 
> in the thread "[RFC PATCH 00/11] fs-verity support for XFS"
> (https://lore.kernel.org/linux-fsdevel/20221213172935.680971-1-aalbersh@redhat.com/T/#u).
> 
> This applies to mainline (commit 93761c93e9da).
> 
> Eric Biggers (4):
>   fsverity: optimize fsverity_file_open() on non-verity files
>   fsverity: optimize fsverity_prepare_setattr() on non-verity files
>   fsverity: optimize fsverity_cleanup_inode() on non-verity files
>   fsverity: pass pos and size to ->write_merkle_tree_block
> 
>  fs/btrfs/verity.c        | 19 ++++-------
>  fs/ext4/verity.c         |  6 ++--
>  fs/f2fs/verity.c         |  6 ++--
>  fs/verity/enable.c       |  4 +--
>  fs/verity/open.c         | 46 ++++---------------------
>  include/linux/fsverity.h | 74 +++++++++++++++++++++++++++++++++-------
>  6 files changed, 84 insertions(+), 71 deletions(-)
> 
> 

Applied for 6.3.  (To
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git/log/?h=fsverity for now,
but there might be a new git repo soon, as is being discussed elsewhere.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
