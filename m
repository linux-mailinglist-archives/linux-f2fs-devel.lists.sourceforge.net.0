Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F38F349A94
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 20:41:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPVrF-0004I8-FJ; Thu, 25 Mar 2021 19:41:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lPVqK-0004B9-9o
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 19:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qhr7dXDdzj51Fepmx7/kzfKY3UuNOKbA8ijLgUfUe+w=; b=mQ4ODrOjgwjSA1MakdwK146TOK
 bUnoLiFX0MrBy7jluVr8rEUbTrPJz6ljoiyoPgMyFyn55MzkvMLmo5b9GqDfV3nSAmkGf5dCeNNNl
 nDxmgyv9mDXHwNnmKk8gHU1z2nzxd+DilDygDOn1HNzfB6PyR2fKkZMZOy5/32PZfiAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qhr7dXDdzj51Fepmx7/kzfKY3UuNOKbA8ijLgUfUe+w=; b=U6QO1jM3lVwggr21icEeAw9AqB
 uwF5JplyxcH3JNZB20Uo1fbjt9Z8JRKd6UeyEf4lkMc31/ExU/4NVqulxmt67FNeJHU9qonPFFi3W
 veYCswiWZvtgiZgLYJLsZhTacrp3fJHCVwFeKmpYFIzFChZyDCUiZ1ZeUS9E2gAw9oio=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lPVqF-0005oL-Af
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 19:40:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D84361A33;
 Thu, 25 Mar 2021 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616701218;
 bh=t73TCDPbW8CCPOT1gnPyZLIMzYIWH/PeC5jyFO3S+hU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PIo7ZcQ+itFZRv3GceyXjflqxbkDu13DtfYPAWifjUac73uuPiFjWbj9C9nr0ZcUN
 xWAznZsIAk/FOT5bePJvRU1zYETQu+HdvYuGBO3U8Y6vi5XE8q5DDzJ+avczZeM6+2
 g0mxoBg8wEg7tiev7kuEm2nJ30wUR05wxTUCCacXpn2IB5gE0J9LsqzHSyv8Eli/U4
 Sf34dqc2TWQDlcvF0Frfs7aynPXOc8LA9tq90P+TuRYE0KvE3hGRi7bIZT2ZYvIFhH
 K91heJwiLnEj7isnTgbBg/cR8Pwfc8eSG+A6yf8KVr6qKn+Ysvfy29RZbyvQggBblR
 bS2uTt4RC1YlA==
Date: Thu, 25 Mar 2021 12:40:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <YFznIVf/F68oEuC6@sol.localdomain>
References: <20210325000811.1379641-1-shreeya.patel@collabora.com>
 <20210325000811.1379641-6-shreeya.patel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325000811.1379641-6-shreeya.patel@collabora.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lPVqF-0005oL-Af
Subject: Re: [f2fs-dev] [PATCH v4 5/5] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: tytso@mit.edu, drosen@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel@collabora.com,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org, krisman@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 25, 2021 at 05:38:11AM +0530, Shreeya Patel wrote:
> Also, indirect calls using function pointers are easily exploitable by
> speculative execution attacks, hence use static_call() in unicode.h and
> unicode-core.c files inorder to prevent these attacks by making direct
> calls and also to improve the performance of function pointers.

I don't think you need to worry about avoiding indirect calls to prevent
speculative execution attacks.  That's what the mitigations like Retpoline are
for.  Instead my concern was just that indirect calls are *slow*, especially
when those mitigations are enabled.  Some of the casefolding operations are
called a lot (e.g., repeatedly during path resolution), and it would be
desirable to avoid adding more overhead there.

> diff --git a/fs/unicode/Kconfig b/fs/unicode/Kconfig
> index 2c27b9a5cd6c..2961b0206b4d 100644
> --- a/fs/unicode/Kconfig
> +++ b/fs/unicode/Kconfig
> @@ -8,7 +8,16 @@ config UNICODE
>  	  Say Y here to enable UTF-8 NFD normalization and NFD+CF casefolding
>  	  support.
>  
> +# UTF-8 encoding can be compiled as a module using UNICODE_UTF8 option.
> +# Having UTF-8 encoding as a module will avoid carrying large
> +# database table present in utf8data.h_shipped into the kernel
> +# by being able to load it only when it is required by the filesystem.
> +config UNICODE_UTF8
> +	tristate "UTF-8 module"
> +	depends on UNICODE
> +	default m
> +

The help for UNICODE still says that it enables UTF-8 support.  But now there is
a separate option that people will need to remember to enable.

Please document each of these options properly.

Perhaps EXT4_FS and F2FS_FS just should select UNICODE_UTF8 if UNICODE, so that
UNICODE_UTF8 doesn't have to be a user-selectable symbol?

> +DEFINE_STATIC_CALL(validate, unicode_validate_static_call);
> +EXPORT_STATIC_CALL(validate);

Global symbols can't have generic names like "validate".  Please add an
appropriate prefix like "unicode_".

Also, the thing called "unicode_validate_static_call" isn't actually a static
call as the name suggests, but rather the default function used by the static
call.  It should be called something like unicode_validate_default.

Likewise for all the others.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
