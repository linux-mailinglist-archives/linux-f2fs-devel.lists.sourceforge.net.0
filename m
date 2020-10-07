Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9BB286A82
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Oct 2020 23:52:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQHMe-0003R6-7G; Wed, 07 Oct 2020 21:52:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kQHMc-0003Qz-JI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 21:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6FXx3+aM3hsf/zpeqyouTOiZsjd5g3Z16PtSiRGD3d0=; b=QFQ9viZGHiweIe0+YdIdWHvBrr
 u9HDUZTdak7ZdylU+VzGRHDo6h/amzPTfZc4CF+N69eWTfHid3JUwPF1wrQZcflpjUMZMCGixJOnn
 Oh5bAUE46iHktKR8GBliFa9RczH1TNsYfSw8IOp7koNwkxb+QiuDp7nahtuo7barh10o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6FXx3+aM3hsf/zpeqyouTOiZsjd5g3Z16PtSiRGD3d0=; b=gHLUzIdX/PkfLHf4PaO60LUHhK
 KytjRgRb73Fj5boum0g1IgG4jxXuC70rE6H7R7bXm5rSqLYzeuwViPn9e0Cn+myYA8Ptv9XqddZ/E
 vVf7CzHmQVZzbeSUP9Oz6roKN3n2yxHCS0+PuWEyKlfVDXYFiFrE0FvIGheuxIZoeV18=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQHMT-002VX9-3a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 21:52:46 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 274382083B;
 Wed,  7 Oct 2020 21:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602107544;
 bh=VdkmJJp1c5bqqhJdGgZSlalw2xii9IqwJrWwX4QLgLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n0l98GHSsSAUDO5qxArcBpKiEq304YkENSqz44eeuuMHonjCZvtr4abAPrp1dGixU
 WY33tKU2Z8ldxpWtt86sKQjSq5FPmcnD+bJX1TcqQMMZgrF8+dt9NQR3Z+kqXJLOAh
 K7KivvQcZO6Jhnyy+eMGrHbzQx+nr6r6G2pg76CY=
Date: Wed, 7 Oct 2020 14:52:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20201007215222.GF1530638@gmail.com>
References: <20201005074133.1958633-1-satyat@google.com>
 <20201005074133.1958633-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005074133.1958633-2-satyat@google.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: libf2fs.la]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQHMT-002VX9-3a
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs-tools: Introduce metadata
 encryption support
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 05, 2020 at 07:41:33AM +0000, Satya Tangirala wrote:
> diff --git a/lib/Makefile.am b/lib/Makefile.am
> index 871d773..a82d753 100644
> --- a/lib/Makefile.am
> +++ b/lib/Makefile.am
> @@ -2,10 +2,10 @@
>  
>  lib_LTLIBRARIES = libf2fs.la
>  
> -libf2fs_la_SOURCES = libf2fs.c libf2fs_io.c libf2fs_zoned.c nls_utf8.c
> +libf2fs_la_SOURCES = libf2fs.c libf2fs_io.c libf2fs_zoned.c nls_utf8.c f2fs_metadata_crypt.c
>  libf2fs_la_CFLAGS = -Wall
>  libf2fs_la_CPPFLAGS = -I$(top_srcdir)/include
> -libf2fs_la_LDFLAGS = -version-info $(LIBF2FS_CURRENT):$(LIBF2FS_REVISION):$(LIBF2FS_AGE)
> +libf2fs_la_LDFLAGS = -lkeyutils -version-info $(LIBF2FS_CURRENT):$(LIBF2FS_REVISION):$(LIBF2FS_AGE)

This introduces a dependency on libkeyutils.  Doesn't that need to be checked in
configure.ac?

> diff --git a/lib/f2fs_metadata_crypt.c b/lib/f2fs_metadata_crypt.c
> new file mode 100644
> index 0000000..faf399a
> --- /dev/null
> +++ b/lib/f2fs_metadata_crypt.c
> @@ -0,0 +1,226 @@
> +/**
> + * f2fs_metadata_crypt.c
> + *
> + * Copyright (c) 2020 Google LLC
> + *
> + * Dual licensed under the GPL or LGPL version 2 licenses.
> + */
> +#include <string.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <sys/socket.h>
> +#include <linux/if_alg.h>
> +#include <linux/socket.h>
> +#include <assert.h>
> +#include <errno.h>
> +#include <keyutils.h>
> +
> +#include "f2fs_fs.h"
> +#include "f2fs_metadata_crypt.h"
> +
> +extern struct f2fs_configuration c;
> +struct f2fs_crypt_mode {
> +	const char *friendly_name;
> +	const char *cipher_str;
> +	unsigned int keysize;
> +	unsigned int ivlen;
> +} f2fs_crypt_modes[] = {

Use 'const' for static or global data that isn't modified.

> +void f2fs_print_crypt_algs(void)
> +{
> +	int i;
> +
> +	for (i = 1; i <= __FSCRYPT_MODE_MAX; i++) {
> +		if (!f2fs_crypt_modes[i].friendly_name)
> +			continue;
> +		MSG(0, "\t%s\n", f2fs_crypt_modes[i].friendly_name);
> +	}
> +}
> +
> +int f2fs_get_crypt_alg(const char *optarg)
> +{
> +	int i;
> +
> +	for (i = 1; i <= __FSCRYPT_MODE_MAX; i++) {
> +		if (f2fs_crypt_modes[i].friendly_name &&
> +		    !strcmp(f2fs_crypt_modes[i].friendly_name, optarg)) {
> +			return i;
> +		}
> +	}
> +
> +	return 0;
> +}

Although __FSCRYPT_MODE_MAX is defined in <linux/fscrypt.h>, it isn't intended
to be used in userspace programs, as its value will change depending on the
version of the kernel headers.  Just use ARRAY_SIZE(f2fs_crypt_modes) instead.

> +int f2fs_metadata_crypt_block(void *buf, size_t len, __u64 blk_addr,
> +			      bool encrypt)
> +{
> +	struct f2fs_crypt_mode *crypt_mode;
> +	int sockfd, fd;
> +	struct sockaddr_alg sa = {
> +		.salg_family = AF_ALG,
> +		.salg_type = "skcipher",
> +	};
> +	struct msghdr msg = {};
> +	struct cmsghdr *cmsg;
> +	char cbuf[CMSG_SPACE(4) + CMSG_SPACE(4 + MAX_IV_LEN)] = {0};
> +	int blk_offset;
> +	struct af_alg_iv *iv;
> +	struct iovec iov;
> +	int err;
> +
> +	crypt_mode = &f2fs_crypt_modes[c.metadata_crypt_alg];
> +	memcpy(sa.salg_name, crypt_mode->cipher_str,
> +	       strlen(crypt_mode->cipher_str));
> +
> +	sockfd = socket(AF_ALG, SOCK_SEQPACKET, 0);
> +	if (sockfd < 0)
> +		return errno;

This will fail if AF_ALG isn't enabled in the kernel config, or if the process
isn't allowed to use AF_ALG by SELinux policy.  Can you show a proper error
message?

> +	err = bind(sockfd, (struct sockaddr *)&sa, sizeof(sa));
> +	if (err) {
> +		MSG(0, "\tCouldn't bind crypto socket. Maybe support for the crypto algorithm isn't enabled?\n");
> +		close(sockfd);
> +		return errno;
> +	}

This will fail if either CRYPTO_USER_API_SKCIPHER isn't enabled in the kernel
config, or if the required crypto algorithm isn't enabled in the kernel config.
Can you show a better error message?

Also, these new kernel config option dependencies should be documented in the
documentation for f2fs-tools.

> +	err = setsockopt(sockfd, SOL_ALG, ALG_SET_KEY, c.metadata_crypt_key,
> +			 crypt_mode->keysize);
> +	if (err) {
> +		MSG(0, "\tCouldn't set crypto socket options.\n");
> +		close(sockfd);
> +		return errno;
> +	}
> +	fd = accept(sockfd, NULL, 0);
> +	if (fd < 0)
> +		goto err_out;

It's a lot of work to allocate an AF_ALG algorithm socket, set the key, and
allocate a request socket for every block.  Can any of this be cached?  For
single threaded use, it seems the request socket can be cached; otherwise the
algorithm socket with a key set can be cached.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
