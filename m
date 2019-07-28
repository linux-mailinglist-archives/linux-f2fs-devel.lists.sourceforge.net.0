Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF565781BF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jul 2019 23:22:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrqcx-0002Z6-AR; Sun, 28 Jul 2019 21:22:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hrqcv-0002Yt-6h
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 21:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BrXCpbwpFHXORs4OhAY744eAoP4l7QXnK7Yu8buxj7s=; b=Sl/TIo/xvWI+hmb57pDTKp1J7E
 3JTbzSXgm+tm1TxICiDUUEle6XqsrEMTxm8TS8YJKESPtnIap5IN7EwE5nUcwjGK2IOTORCGMWYre
 hWrSkhEee51KnYRNHnIzE8FvMwk0vz2rZNhReeZP//CD1PgkAow7GNtuumJX36BrT1ug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BrXCpbwpFHXORs4OhAY744eAoP4l7QXnK7Yu8buxj7s=; b=kNkVEDIRKdP5daDX08CyHKCN+f
 1yzzbYYLteSmfx7xP+SQYMpnVfJmzFDGsDJO66V10YJBULL98XwTcJS8umaOTFLkl2nnsLLekMY6f
 ivCK9GG7zKuNEHJrF5iGD7oLqIWBIXK6ONS8YjnEegboG2vNtYZNut2BBXiF8uFFhkUE=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrqct-00BnX5-Ed
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 21:22:45 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6SLMSdP012995
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 17:22:29 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id F22684202F5; Sun, 28 Jul 2019 17:22:26 -0400 (EDT)
Date: Sun, 28 Jul 2019 17:22:26 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190728212226.GL6088@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-12-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-12-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hrqct-00BnX5-Ed
Subject: Re: [f2fs-dev] [PATCH v7 11/16] fscrypt: allow unprivileged users
 to add/remove keys for v2 policies
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 26, 2019 at 03:41:36PM -0700, Eric Biggers wrote:
> diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
> index 56e085c2ed8c6..307533d4d7c51 100644
> --- a/fs/crypto/keyring.c
> +++ b/fs/crypto/keyring.c
> +		if (mk->mk_users->keys.nr_leaves_on_tree != 0) {
> +			/*
> +			 * Other users have still added the key too.  We removed
> +			 * the current user's usage of the key if there was one,
> +			 * but we still can't remove the key itself.
> +			 */
> +			err = -EUSERS;
> +			up_write(&key->sem);
> +			goto out_put_key;

I commented about this on an earlier patch, but I'm not convinced we
should be returning EUSERS here.  Returning success might be a better
choice.

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
