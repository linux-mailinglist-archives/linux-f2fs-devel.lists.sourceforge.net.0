Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D36226CED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 19:10:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxZIk-0008Hz-Bu; Mon, 20 Jul 2020 17:10:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jxZIj-0008Hm-Du
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 17:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3zDzyuvCVI76Ko7WBwIypAzVGX0KhRlOc6FBqWTcM54=; b=C/qld8+NIQiDZDPBqBCpNyRbHA
 Dhpi+4RUT6haXbPstPJl+pvw4np5+lFQjl1YCrL8iVhmhdR67Z/e5uP+s9j+XQvsOloEz4cRLWcg5
 v900z1hVxmq+CKyzxa4O7HkSpKFDNZ7YOhrrGESbp4ErCiez4vqmBU8eHcVBiyfxvALw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3zDzyuvCVI76Ko7WBwIypAzVGX0KhRlOc6FBqWTcM54=; b=K3DKrbJmFFjFJuwLNrihHOg9gY
 ylEcOFLgZV4jNfuSpb0Ghd7+HJ7ypmCjBQlNUTFqhqJDOkG6+P35WBN1KGvvlGBPHbjQgAMd0uuaX
 Lrn0ndoJbs2wsChuef9Er9E0N2LX5uiREyDwX4YMu16sBd+cC4MsTccGnKrWHvBBBlyY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxZIi-001q3o-AM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 17:10:05 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5796207DF;
 Mon, 20 Jul 2020 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595264993;
 bh=OthK/AQBHEtdjBBAz0n/15WPSHBWT0arVmiBxqHTdbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rwg++Qqd28JZ8teR6Wn7NDm2yRrPKRUXPCfuzh8ZpZPAWd0YfMmSXjxHQP4nWQF0o
 FrYFN3RpBW5U2NGYXWhrdk4coaezy1WR6SdlptXgG5oxgriJtgAPEw45ju74Rm4iSZ
 eBhgXcl8BUAPAe6EtMV4CKHIMUm9uD+CIwQNfKks=
Date: Mon, 20 Jul 2020 10:09:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20200720170951.GE1292162@gmail.com>
References: <20200708091237.3922153-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708091237.3922153-1-drosen@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxZIi-001q3o-AM
Subject: Re: [f2fs-dev] [PATCH v12 0/4] Prepare for upcoming
 Casefolding/Encryption patches
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 08, 2020 at 02:12:33AM -0700, Daniel Rosenberg wrote:
> This lays the ground work for enabling casefolding and encryption at the
> same time for ext4 and f2fs. A future set of patches will enable that
> functionality.
> 
> These unify the highly similar dentry_operations that ext4 and f2fs both
> use for casefolding. In addition, they improve d_hash by not requiring a
> new string allocation.
> 
> Daniel Rosenberg (4):
>   unicode: Add utf8_casefold_hash
>   fs: Add standard casefolding support
>   f2fs: Use generic casefolding support
>   ext4: Use generic casefolding support
> 

Ted, are you interested in taking this through the ext4 tree for 5.9?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
