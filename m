Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4072A27B753
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Sep 2020 23:56:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kN17w-0000TD-2e; Mon, 28 Sep 2020 21:56:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kN17v-0000T6-3i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Sep 2020 21:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WHy9XGvmL6Ex8Tuhvv8l+vI95iXoKv9w+/jIAAOb0pw=; b=l3rS6zcz6MLG165vkoGf4CQkI4
 /BuoOZ848PlF6crTUhrTSTu5vghwA8S/FUU2PTu+FbUeez62k7a0O9158XXT25aFGVJsPnXPoXYs2
 HhAso7bvwgrK/vUqw4PVpralfDADb1XTb5P4wXBmnc7XPRY2K9bRr+dAiHRXG5T9GXM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WHy9XGvmL6Ex8Tuhvv8l+vI95iXoKv9w+/jIAAOb0pw=; b=kuOQfm2n6BvK6jlgh/9zo0ne+C
 1W0p17t+xrIRrKXbQmqc+fmoOzGaRbHrMLF67nvCdfXPPaJczt7/6xSELdwnqGJKwzRNKyhbgPNt0
 JMZOcizCATb+m5iaEQy87GQxmKEdAJxJLXTYHkGm4v+iaj83ASZetPeqoAqFhSbkpyAQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kN17t-009K5V-Bi
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Sep 2020 21:56:07 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C032B21D41;
 Mon, 28 Sep 2020 21:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601330159;
 bh=6z91mKn6qjuem7zZtYDzbCSm4BYLZg64yE8VCJOoMxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PjVti+/d6/LARjkYevcmTfmDAbtEZwPm5zllEgC+l1/f3jnBjeRBhkbxdDhtbZwsD
 M9iaw83EBAmwBx920b7jFyftZLQ3qF9s2nENfvDC/lr595X7CjWN9fd3DBp92cO9Ru
 MgWunJMvRxRGUCBbbn7UNs1IaCDXfauboH8LY7co=
Date: Mon, 28 Sep 2020 14:55:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200928215558.GD1340@sol.localdomain>
References: <20200924054721.187797-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924054721.187797-1-ebiggers@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kN17t-009K5V-Bi
Subject: Re: [f2fs-dev] [PATCH] fscrypt: export fscrypt_d_revalidate()
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
Cc: ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 23, 2020 at 10:47:21PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Dentries that represent no-key names must have a dentry_operations that
> includes fscrypt_d_revalidate().  Currently, this is handled by
> fscrypt_prepare_lookup() installing fscrypt_d_ops.
> 
> However, ceph support for encryption
> (https://lore.kernel.org/r/20200914191707.380444-1-jlayton@kernel.org)
> can't use fscrypt_d_ops, since ceph already has its own
> dentry_operations.
> 
> Similarly, ext4 and f2fs support for directories that are both encrypted
> and casefolded
> (https://lore.kernel.org/r/20200923010151.69506-1-drosen@google.com)
> can't use fscrypt_d_ops either, since casefolding requires some dentry
> operations too.
> 
> To satisfy both users, we need to move the responsibility of installing
> the dentry_operations to filesystems.
> 
> In preparation for this, export fscrypt_d_revalidate() and give it a
> !CONFIG_FS_ENCRYPTION stub.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> Compared to the versions of this patch from Jeff and Daniel, I've
> improved the commit message and added a !CONFIG_FS_ENCRYPTION stub,
> which was missing.  I'm planning to apply this for 5.10 in preparation
> for both the ceph patchset and the encrypt+casefold patchset.
> 
> 
>  fs/crypto/fname.c       | 3 ++-
>  include/linux/fscrypt.h | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)

Applied to fscrypt.git#master for 5.10.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
