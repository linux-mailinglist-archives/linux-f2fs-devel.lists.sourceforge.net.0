Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D761D1B83
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 18:47:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYuXT-0001bw-D3; Wed, 13 May 2020 16:47:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYuXS-0001bl-GE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 16:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s4qxG4meaKv0qWXbc2p3+RX1ICYDpo7oUB6r8FrVW7M=; b=D4QvBF2tieFQxZlLIPpxPkG+oa
 FYqpgvMXyBUUo41fVk4KcIIWKIsDJ5DanPxEHhoeFsw33LtY6ALxzjfxFfKdTtToOL6G9zNH7gAs1
 GLgdovDmX1T08oEoH8CP/wncnDHHSfdGANdd39UW+Uey8nEYQKEjK5U0WRPpmyqvyHBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s4qxG4meaKv0qWXbc2p3+RX1ICYDpo7oUB6r8FrVW7M=; b=jkNiD3c21dSnPCYKC0uRlGi81H
 jC/vNFXxViurz7ksyTcLJvF8KwEfiw2iIxGIT6otiyyTc+BPNIObU7Y58jvwCe3NbpDC9wVHpRVSb
 VFnIyy1sk0HN0mGi43Pj4PjwswWlQXuv6Vpe5yRWZEYJnUGvMyjotB4XdKCBRznfkG14=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYuXP-008n2n-Su
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 16:47:22 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACEC32054F;
 Wed, 13 May 2020 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589388430;
 bh=/v2IdDrymQyOQwGKwD3DYskW13FfX9JBpATBQnCGEcA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nAeGjCGQQCEXECiiVUZ7LQP3/1bJtcWmeYZLTYbvUSHQs9C+sg1PGBkyCDUte1c9B
 UYBEHmYQLrO4Ycv+IwUgQAYx+Ig+4XaEH8IHLafNSLlVrXNOtJ6gnpBTOZ0UREEf2n
 x/hhC5VoAEYTb5c9q+su5I0gJUEo4ndlnhA7bCQY=
Date: Wed, 13 May 2020 09:47:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200513164707.GA1243@sol.localdomain>
References: <20200430115959.238073-1-satyat@google.com>
 <20200430115959.238073-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430115959.238073-2-satyat@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYuXP-008n2n-Su
Subject: Re: [f2fs-dev] [PATCH v12 01/12] Documentation: Document the
 blk-crypto framework
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Apr 30, 2020 at 11:59:48AM +0000, Satya Tangirala wrote:
> The blk-crypto framework adds support for inline encryption. There
> are numerous changes throughout the storage stack. This patch documents
> the main design choices in the block layer, the API presented to users
> of the block layer (like fscrypt or layered devices) and the API presented
> to drivers for adding support for inline encryption.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

Looks good, you can add:

    Reviewed-by: Eric Biggers <ebiggers@google.com>

But a few comments for when you resend:

> +When a bio is added to a request, the request takes over ownership of the
> +``bi_crypt_context`` of the bio - in particular, the request keeps the
> +``bi_crypt_context`` of the first bio in its bio-list, and frees the rest
> +(blk-mq needs to be careful to maintain this invariant during bio and request
> +merges).

Is this part up-to-date?  There was discussion about not freeing the bios' crypt
contexts.

> +``blk_crypto_evict_key`` should be called by upper layers when they want
> +to ensure that a key is removed from memory and from any keyslots in inline
> +encryption hardware that the key might have been programmed into (or the
> +blk-crypto-fallback).

This should be reworded to emphasize that blk_crypto_evict_key()
*must* be called (as now the keyslot manager has a pointer to the key).

> +API presented to device drivers
> +===============================
> +
> +A :c:type:``struct keyslot_manager`` should be set up by device drivers in the

"keyslot_manager" => "blk_keyslot_manager".  Likewise below.

> +``request_queue`` of the device. The device driver needs to call
> +``blk_ksm_init`` on the ``keyslot_manager``, which specfying the number of
> +keyslots supported by the hardware.

"which specfying" => "while specifying"

> +The device driver also needs to tell the KSM how to actually manipulate the
> +IE hardware in the device to do things like programming the crypto key into
> +the IE hardware into a particular keyslot. All this is achieved through the
> +:c:type:`struct keyslot_mgmt_ll_ops` field in the KSM that the device driver
> +must fill up after initing the ``keyslot_manager``.

"keyslot_mgmt_ll_ops" => "blk_ksm_ll_ops"

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
