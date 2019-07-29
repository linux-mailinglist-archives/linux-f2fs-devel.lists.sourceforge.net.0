Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0301078334
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 04:00:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hruxu-00073J-TS; Mon, 29 Jul 2019 02:00:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hruxt-000738-Ss
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 02:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NTgb0o6pcZqBm/ZVF8i9R/LFOcRmqcY5V8K4pFeH/4Q=; b=ZIdxp7KQaSx5pdv5SN3JuZo9Zo
 JdF5lMI/OYyV5lNnL5uoKz4m2xWZKrKdwokx3Ra4CK2wHKByRhDFEhWierkga3UUI1g+2kZZMl8qk
 mqCTjvGgq0wE6z2NK56RM2rPqgXq3bMZ0zNLE7TXHlykmjJKb6oObJOMSb+qgos9IRaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NTgb0o6pcZqBm/ZVF8i9R/LFOcRmqcY5V8K4pFeH/4Q=; b=FfcArogTgbtWT1fuUAYdW23WyA
 xpog+kvzEIZ0bNH0LvngEiV923D4Lzko0kR3SzHscsGAZxzDT7ORlQTb6MQtscGsdpr/9b/DOJ9dR
 qPwdY3S9MMR1biPgb9d+zkpQjCPtIGpAphFg1Fkx0jwVWCHYnu3TU3POL1DWX1u/myyY=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hruxq-00CX6S-Vb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 02:00:41 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6T20BFl005802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 22:00:12 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 0C9074202F5; Sun, 28 Jul 2019 22:00:10 -0400 (EDT)
Date: Sun, 28 Jul 2019 22:00:09 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190729020009.GA3863@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-17-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-17-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hruxq-00CX6S-Vb
Subject: Re: [f2fs-dev] [PATCH v7 16/16] fscrypt: document the new ioctls
 and policy version
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

On Fri, Jul 26, 2019 at 03:41:41PM -0700, Eric Biggers wrote:
> +- The kernel cannot magically wipe copies of the master key(s) that
> +  userspace might have as well.  Therefore, userspace must wipe all
> +  copies of the master key(s) it makes as well.  Naturally, the same
> +  also applies to all higher levels in the key hierarchy.  Userspace
> +  should also follow other security precautions such as mlock()ing
> +  memory containing keys to prevent it from being swapped out.

Normally, shouldn't userspace have wiped all copies of the master key
after they have called ADD_KEY?  Why should they be left hanging
around?  Waiting until REMOVE_KEY to remove other copies of the master
key seems.... late.

> +- In general, decrypted contents and filenames in the kernel VFS
> +  caches are freed but not wiped.  Therefore, portions thereof may be
> +  recoverable from freed memory, even after the corresponding key(s)
> +  were wiped.  To partially solve this, you can set
> +  CONFIG_PAGE_POISONING=y in your kernel config and add page_poison=1
> +  to your kernel command line.  However, this has a performance cost.

... and even this won't help if you have swap configured....

> +v1 encryption policies have some weaknesses with respect to online
> +attacks:
> +
> +- There is no verification that the provided master key is correct.
> +  Consequently, malicious users can associate the wrong key with
> +  encrypted files, even files to which they have only read-only
> +  access.

Yes, but they won't be able to trick other users into using that
incorrect key.  With the old interface, it gets written into the
user's session keyring, which won't get used by another user.  And
with the newer interface, only root is allowed to set v1 key.

> +Master keys should be pseudorandom, i.e. indistinguishable from random
> +bytestrings of the same length.  This implies that users **must not**
> +directly use a password as a master key, zero-pad a shorter key, or
> +repeat a shorter key.

These paragraphs starts a bit funny, since we first say "should" in
the first sentence, and then it's followed up by "**must not**" in the
second sentence.  Basically, they *could* do this, but it would just
weaken the security of the system significantly.

At the very least, we should explain the basis of the recommendation.

> +The KDF used for a particular master key differs depending on whether
> +the key is used for v1 encryption policies or for v2 encryption
> +policies.  Users **must not** use the same key for both v1 and v2
> +encryption policies.

"Must not" seems a bit strong.  If they do, and a v1 per-file key and
nonce leaks out, then the encryption key will be compromised.  So the
strength of the key will be limited by the weaknesses of the v1
scheme.  But it's not like using a that was originally meant for v1,
and then using it for v2, causes any additional weakness.  Right?

    	       	      	  	 - Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
