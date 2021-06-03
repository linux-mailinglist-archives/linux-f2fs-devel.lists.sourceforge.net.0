Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE26939AA1C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jun 2021 20:34:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1losB6-0007ex-Ue; Thu, 03 Jun 2021 18:34:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1losB3-0007ck-RQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 18:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9dQeymL0jEGvFxiq5fc7t1joe3jqU9HkME52nSxKC/Y=; b=P2dAq4+DfvEQ2bGDS1h3lB5v3n
 iKhNJQ2zBy7zPZpgWKBdGFvWX8Vw9H7/zNhs/i2uDfWJHCS/VgPADTQRPzQG5eA+ab34vpVBpGhTd
 wBkFKhFFN7we7oYI1hi/vf0bmURQJmqmWJXtk78zYtikUry66P5DgFb+euhyBgxMIP2Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9dQeymL0jEGvFxiq5fc7t1joe3jqU9HkME52nSxKC/Y=; b=HAynM0j0MRwEYU7R1rVWdBXHxs
 0uZ+g+rpWj346YBsL/YdWsb0Zh0lg6upjrjjas6eZZLnxpD/U0M2Ucsnqt3K5zKVxmK4Pq7BzDvg1
 fcNUpuGkN7JQK+uv8zcDUJWg3IAYa0REdt1OSsbtvmZSP1uzrwouZ8JY9/97Ri3g/XUw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lorxS-0006hR-PX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 18:20:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F012A61358;
 Thu,  3 Jun 2021 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622744438;
 bh=+GrwKFdUEsGpkZcaf6kKz/KwLaeOIHO4YcUr5jRFybc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mBjjvE5XDpQcg3QKItoo8C7urobYtw81MEPmwkf0jaMwfvRikumyU5Lj3BpHKGPjW
 tTjtuNe4boVSPuTdifcOiWFaU5e/u0mO0t9vMEcOW0zBZPQCyShTicYzgjcBWncCMB
 eaDsRSUyw1zOzF0zIbjHJf8Wq/HsSubRuLHuB9Al9CSsgsMBHzdiaA1d5B8KxlvZuK
 YyKQzxxDtOEMukm6QeidUfR68H9uHlqeUJthSlNStAx8K0mAVPXHVcfEXeesOi0DRp
 J2z+0fNUS0rN9GyUq9UCQswpcKc2U4lZwq40DUBwScMZnmbawmWpJQAZdJMm873UAs
 DyyqqnzTdV9fQ==
Date: Thu, 3 Jun 2021 11:20:36 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <YLkddHRPyugDUB99@sol.localdomain>
References: <20210603095038.314949-1-drosen@google.com>
 <20210603095038.314949-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603095038.314949-2-drosen@google.com>
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lorxS-0006hR-PX
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: Show casefolding support only
 when supported
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 03, 2021 at 09:50:37AM +0000, Daniel Rosenberg wrote:
> The casefolding feature is only supported when CONFIG_UNICODE is set.
> This modifies the feature list f2fs presents under sysfs accordingly.
> 
> Fixes: 5aba54302a46 ("f2fs: include charset encoding information in the superblock")
> Cc: stable@vger.kernel.org # v5.4+
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/f2fs/sysfs.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Eric Biggers <ebiggers@google.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
