Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1E37812D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jul 2019 21:30:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrosK-0005xw-Ks; Sun, 28 Jul 2019 19:30:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hrosJ-0005xq-LH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 19:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fEacubbptbYCsyPUf5BguAmJwlBoBAm5gOiz7gqGmYg=; b=RR4hsGK8GbwReXKQ27qYQrlhI4
 VIr3KxpOJXwuOeZRGDb2IAxD+hlPCjJHUuoNaWD31Dp+sBvDWsaHuMTko+O0h8D9e130VUTILCQPv
 f2hyuLvrVXfAGx4ZgGbvTKYm18reqhJyDZVVpCTbYdOdj15CZ3s/grwNJTcQMBDLQ2LM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fEacubbptbYCsyPUf5BguAmJwlBoBAm5gOiz7gqGmYg=; b=SuDkJHMXY5bm9VJDxDZElbD4cB
 w3XZxksUZpuRQEm5b4MP2LIJ6OYU9ieuQ9OD5UYo8+d7nl8cL9KpHeR5D1+1rhkv/vNpH7PZcv6jB
 s4A7Dx9/nqNWEaWRq8Xe5EjKlQ+7qtWaU6Fzmf41LOIAjfHSaR34xKmPgf1yexl0/B2M=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrosH-002Cyz-UQ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 19:30:31 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6SJUDhE009303
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 15:30:14 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 7DDB54202F5; Sun, 28 Jul 2019 15:30:12 -0400 (EDT)
Date: Sun, 28 Jul 2019 15:30:12 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190728193012.GH6088@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-9-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-9-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hrosH-002Cyz-UQ
Subject: Re: [f2fs-dev] [PATCH v7 08/16] fscrypt: add
 FS_IOC_GET_ENCRYPTION_KEY_STATUS ioctl
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

On Fri, Jul 26, 2019 at 03:41:33PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a new fscrypt ioctl, FS_IOC_GET_ENCRYPTION_KEY_STATUS.  Given a key
> specified by 'struct fscrypt_key_specifier' (the same way a key is
> specified for the other fscrypt key management ioctls), it returns
> status information in a 'struct fscrypt_get_key_status_arg'.
> 
> The main motivation for this is that applications need to be able to
> check whether an encrypted directory is "unlocked" or not, so that they
> can add the key if it is not, and avoid adding the key (which may
> involve prompting the user for a passphrase) if it already is.
> 
> It's possible to use some workarounds such as checking whether opening a
> regular file fails with ENOKEY, or checking whether the filenames "look
> like gibberish" or not.  However, no workaround is usable in all cases.
> 
> Like the other key management ioctls, the keyrings syscalls may seem at
> first to be a good fit for this.  Unfortunately, they are not.  Even if
> we exposed the keyring ID of the ->s_master_keys keyring and gave
> everyone Search permission on it (note: currently the keyrings
> permission system would also allow everyone to "invalidate" the keyring
> too), the fscrypt keys have an additional state that doesn't map cleanly
> to the keyrings API: the secret can be removed, but we can be still
> tracking the files that were using the key, and the removal can be
> re-attempted or the secret added again.
> 
> After later patches, some applications will also need a way to determine
> whether a key was added by the current user vs. by some other user.
> Reserved fields are included in fscrypt_get_key_status_arg for this and
> other future extensions.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
