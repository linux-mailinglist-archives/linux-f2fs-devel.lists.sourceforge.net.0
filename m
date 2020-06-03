Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2E1EC71A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jun 2020 04:08:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgIoy-0001hz-IU; Wed, 03 Jun 2020 02:08:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jgIox-0001ht-Us
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 02:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tEFdXShQJ0up1pN37XQdL2Osut/PFZARmSLjyY6TQgA=; b=iyTqJVcGQPyDWJDoDwQJOhSiYu
 qFhBkRBfqg65acG/AbYdtp2M0NU8rbvcDbRgL1WHQ70/bVrUqgr+S2QbydhoQXnI7WdUBfwafUmyE
 NaeeCGoGRbgF9pgo5ZqeIGSI/f1nxUiCmcVHzYFuSSmnUWlONmL7q5OSk25gWfepoafM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tEFdXShQJ0up1pN37XQdL2Osut/PFZARmSLjyY6TQgA=; b=JwhGvAj1yldGbYARD/+0A3j75r
 HWcLCgxv9KZBZUh+o/cwfqBrudRB0+3D7sMRPrkDN62pJFJ6b3GNA1koxM8czbSiRewyu7qdLguAw
 pckzLFe/tApmaYLgmpzugBFMpmMKzekJiN5HcAOs4gLcwYqz7HWaH9W2sSEpMxrve0iE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jgIos-006zvW-NE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 02:07:59 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32A502072F;
 Wed,  3 Jun 2020 02:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591150064;
 bh=qLcUIqg4MkGQXm/ALUeDTBM4qZrROCTmpgT+XERn3Wo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aq1ZrZwQU3kRCrtJOZAwJUWVfYq2+bOd3t19aKhFjRpZJjQ7d+Ws0QDXHtHTp4POk
 R8bz/dDLIX+5ng8Qi7HF7HQhyQniQJZPjcc7IzSHpZ0zGN5s5i/2EhPAsNVyErNBhD
 imgt4H8pvVTVYE1AU9KFtJHzqyXDQxsAq7RLeOCY=
Date: Tue, 2 Jun 2020 19:07:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200603020742.GA50072@sol.localdomain>
References: <20200514003727.69001-1-satyat@google.com>
 <20200514003727.69001-11-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514003727.69001-11-satyat@google.com>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgIos-006zvW-NE
Subject: Re: [f2fs-dev] [PATCH v13 10/12] fscrypt: add inline encryption
 support
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

One more thing:

On Thu, May 14, 2020 at 12:37:25AM +0000, Satya Tangirala wrote:
> +/* Enable inline encryption for this file if supported. */
> +void fscrypt_select_encryption_impl(struct fscrypt_info *ci)
> +{
> +	const struct inode *inode = ci->ci_inode;
> +	struct super_block *sb = inode->i_sb;
> +	struct blk_crypto_config crypto_cfg;
> +	int num_devs;
> +	struct request_queue **devs;
> +	int i;
> +
> +	/* The file must need contents encryption, not filenames encryption */
> +	if (!fscrypt_needs_contents_encryption(inode))
> +		return;
> +
> +	/* The crypto mode must be valid */
> +	if (ci->ci_mode->blk_crypto_mode == BLK_ENCRYPTION_MODE_INVALID)
> +		return;
> +
> +	/* The filesystem must be mounted with -o inlinecrypt */
> +	if (!(sb->s_flags & SB_INLINECRYPT))
> +		return;
> +
> +	/*
> +	 * blk-crypto must support the crypto configuration we'll use for the
> +	 * inode on all devices in the sb
> +	 */
> +	crypto_cfg.crypto_mode = ci->ci_mode->blk_crypto_mode;
> +	crypto_cfg.data_unit_size = sb->s_blocksize;
> +	crypto_cfg.dun_bytes = fscrypt_get_dun_bytes(ci);
> +	num_devs = fscrypt_get_num_devices(sb);
> +	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_NOFS);
> +	if (!devs)
> +		return;

This function needs to return an error code, so that if this memory allocation
fails, the error is not ignored.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
