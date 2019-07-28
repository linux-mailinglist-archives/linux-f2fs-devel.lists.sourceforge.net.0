Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14881781BA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jul 2019 23:18:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrqYM-0002O5-U3; Sun, 28 Jul 2019 21:18:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hrqYL-0002Nx-Af
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 21:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5MQJuhga+CEM7c3/oOmHRtXoH8YD940+53nub2YEGNA=; b=akLc4GBP7jfR1GFhalU0bsE5Xb
 o1f6qZzTxPdZ/eWipj8W/V03iy1iyT/mKs0X66MwlCHgt8WtGhX85lpXln4SWxhGquk2kcL4PjqQi
 n/nnwnkM0QoKPRvlgCwBg+gEpbA4AFkAYeRI3xefM1poMH6VbgPCq1OM3Eod6bPLYQiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5MQJuhga+CEM7c3/oOmHRtXoH8YD940+53nub2YEGNA=; b=ClUoHE3OkDOU4EFouMTCWPbOFG
 6ab1249vfwkcqgLTfxxtXRWEBvT7C5z+2h+PLZLlwBSR1JeJmJg5wG/kxW60KAO3O3L/RJCrJD/xO
 nyG9kqFhBFCaeMm5KAF19+nSk7/5amqgyGUPAsiTk/xr9JKTZXlji1L/G+6lqLVCJfb4=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrqYJ-002hMQ-8m
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 21:18:01 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6SLHVFd011138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 17:17:32 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 5DD5D4202F5; Sun, 28 Jul 2019 17:17:30 -0400 (EDT)
Date: Sun, 28 Jul 2019 17:17:30 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190728211730.GK6088@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-11-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-11-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hrqYJ-002hMQ-8m
Subject: Re: [f2fs-dev] [PATCH v7 10/16] fscrypt: v2 encryption policy
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 26, 2019 at 03:41:35PM -0700, Eric Biggers wrote:
> @@ -319,6 +329,31 @@ int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
>  	if (!capable(CAP_SYS_ADMIN))
>  		goto out_wipe_secret;
>  
> +	if (arg.key_spec.type != FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR) {

This should be "== FSCRYPT_KEY_SPEC_TYPE_INDENTIFIER" instead.  That's
because you use the identifier part of the union:

> +		/* Calculate the key identifier and return it to userspace. */
> +		err = fscrypt_hkdf_expand(&secret.hkdf,
> +					  HKDF_CONTEXT_KEY_IDENTIFIER,
> +					  NULL, 0, arg.key_spec.u.identifier,

If we ever add a new key specifier type, and alternative in the union,
this is going to come back to bite us.

> +	if (policy->version == FSCRYPT_POLICY_V1) {
> +		/*
> +		 * The original encryption policy version provided no way of
> +		 * verifying that the correct master key was supplied, which was
> +		 * insecure in scenarios where multiple users have access to the
> +		 * same encrypted files (even just read-only access).

Which scenario do you have in mind?  With read-only access, Alice can
fetch the encryption policy for a directory, and introduce a key with
the same descriptor, but the "wrong" key, but that's only going to
affect Alice's use of the key.  It won't affect what key is used by
Bob, since Alice doesn't have write access to Bob's keyrings.

If what you mean is the risk when there is a single global
filesystem-specific keyring, where Alice could introduce a "wrong" key
identified with a specific descriptor, then sure, Alice could trick
Bob into encrypting his data with the wrong key (one known to Alice).
But we don't allow keys usable by V1 policies to be used in the
filesystem-specific keyring, do we?

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
