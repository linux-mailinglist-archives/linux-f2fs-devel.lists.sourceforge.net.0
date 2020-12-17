Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5C2DD4C6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 17:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rY2pEeg1T9LKZLsCMGcDJDeumNwxfemuq4tVDQk57+M=; b=P2H4q/jSwNtIvJtSGj8IPSG7o
	NGb59QOu6pPP16lWc/qoXhjE/BqkJO8vO+YXrE8InEfgFtOt2BLCNFv2UQbMtikXHomzCk9zSVDo1
	E77zFD+HG19PK0oaPEdr4MVIN64upKof7Me1Jdmdqd9e2GRWVU4SHNk0XrQChY8Yi9MNo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpvlO-00024I-13; Thu, 17 Dec 2020 16:04:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kpvlM-00023w-PL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v0aU55AeE8gyXrbegCxUISckiU90mOhoLtQhJSg8JO4=; b=Hp/ZSXbpa7FQi7hyGUjYOSPbLz
 ABQAHupTovyEkXMpUvZ9O3yytxoi4YAHqtBOGkMCSXeefo3cnruzUpl8EPqfDCsjb8rP22tczjWwb
 xoVAEQ681/BjhSki1vTfWupb1ecJZfVxrcxSpMVzcMtY+Ts02/mgYDKn9VbvPvDOWkL8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v0aU55AeE8gyXrbegCxUISckiU90mOhoLtQhJSg8JO4=; b=nOqe1uwvD6eRKFvE2B2MG2c1Xg
 ubAiC2a+6xJn1H0lTnnPTAI90RVef5Ho71QztTZc2ImcYBdLED6ama4Wy7kGvpCcuNifMRi+eT/vu
 6yOEWsONeB/f9XH/DEwUaB8bUhGg/KwZuSzn6tbMmxmi76ThLinyVrNLfVUtd8Fo3fv0=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpvlJ-000IOl-U5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:04:20 +0000
Received: by mail-pj1-f50.google.com with SMTP id z12so3892778pjn.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 08:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v0aU55AeE8gyXrbegCxUISckiU90mOhoLtQhJSg8JO4=;
 b=A9C57Z98L1giiuA7maT0m//MwSxIA652SxKShGSsp+xshw7II7UqQ4aKf0KJPiQM+Q
 cAxRmvwycU14T3/dMyM8xGIXJDMmE7SBL6wpvXltPidw0GJZHUMHBx2ZRcXG7e698sUS
 Gy89AOJi0bvmWGsNqYs7I5gnCZTiouV6W6RMzB4Bn2wGvKNtKkLozQLBbHwfazFTT2qS
 LiRibMZtBBIkew1t/kpPnCZ3OBs9ZFHod4z/vzAmJ7TdSTD1qw+ZIE3A4xMzen34uumL
 WW6CKtpYNIpwiElwWLZ60bme/uV/rkgsbYJR/U1t6hzqlZZzan8DnWWMh+tB7z/43eTD
 Z27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v0aU55AeE8gyXrbegCxUISckiU90mOhoLtQhJSg8JO4=;
 b=I0XYbJ52ryq3VHD80tJw91NExE67zvRZwFcNzY/wsVn59zfgXCtamA/1m4Ejo+ql9K
 0BgDCQHwfFDMOCWlHsD3x4u2aEeH+LSlGo7oUuiklLeNt4wExrXTe/f3tLdMH0UCwqcw
 e0AI+nHZJkx4FCDJYUeKk0rdV1wuj7lrK6BGibhBmFwu2lMwNGjpjLKsASZwFCYkjr0k
 JqCandJLE8AECRJKNCY2q7qcT6g2NXBm6nYn51px+2CM/+zaAeDEUbb44Ori7rJiujTR
 zcDTbT8Wp/h9lwJq4pw84EsLwiDuOcCRhMJPLr95fq72KP3ZLIDl/tsgGLWw1/geZH8C
 w8zA==
X-Gm-Message-State: AOAM532Qom4aYZqssz2c6mzDUiNybRyYmQdJchag2E2EoU3A/GqnYii/
 chlq4v2fPynVoE9ty1KGZrGr4w==
X-Google-Smtp-Source: ABdhPJxVczb5sHNjrNkJDOgnTO+pA1tagXIwhGzrpyaPMVEbk/tWgO49rZ7hu5TvNgpu/peKrWDFFA==
X-Received: by 2002:a17:90a:d48f:: with SMTP id
 s15mr8560649pju.137.1608221052223; 
 Thu, 17 Dec 2020 08:04:12 -0800 (PST)
Received: from google.com (139.60.82.34.bc.googleusercontent.com.
 [34.82.60.139])
 by smtp.gmail.com with ESMTPSA id b197sm1488240pfb.42.2020.12.17.08.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 08:04:11 -0800 (PST)
Date: Thu, 17 Dec 2020 16:04:07 +0000
To: jaegeuk@kernel.org
Message-ID: <X9uBd0ubFD4ZO+T5@google.com>
References: <20201005074133.1958633-1-satyat@google.com>
 <20201005074133.1958633-2-satyat@google.com>
 <20201007194209.GB611836@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007194209.GB611836@google.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FSL_HELO_FAKE          No description available.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.50 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kpvlJ-000IOl-U5
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 07, 2020 at 12:42:09PM -0700, jaegeuk@kernel.org wrote:
> Hi Satya,
> 
> On 10/05, Satya Tangirala wrote:
> > This patch introduces two new options '-A' and '-M' for specifying metadata
> > crypt options. '-A' takes the desired metadata encryption algorithm as
> > argument. '-M' takes the linux key_serial of the metadata encryption key as
> > the argument. The keyring key provided must be of a key type that supports
> > reading the payload from userspace.
> 
> Could you please update manpages as well?
> 
Done
> > diff --git a/lib/f2fs_metadata_crypt.c b/lib/f2fs_metadata_crypt.c
> > new file mode 100644
> > index 0000000..faf399a
> > --- /dev/null
> > +++ b/lib/f2fs_metadata_crypt.c
> > @@ -0,0 +1,226 @@
> > +/**
> > + * f2fs_metadata_crypt.c
> > + *
> > + * Copyright (c) 2020 Google LLC
> > + *
> > + * Dual licensed under the GPL or LGPL version 2 licenses.
> > + */
> > +#include <string.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <unistd.h>
> > +#include <sys/socket.h>
> > +#include <linux/if_alg.h>
> > +#include <linux/socket.h>
> > +#include <assert.h>
> > +#include <errno.h>
> > +#include <keyutils.h>
> > +
> > +#include "f2fs_fs.h"
> > +#include "f2fs_metadata_crypt.h"
> > +
> > +extern struct f2fs_configuration c;
> > +struct f2fs_crypt_mode {
> > +	const char *friendly_name;
> > +	const char *cipher_str;
> > +	unsigned int keysize;
> > +	unsigned int ivlen;
> > +} f2fs_crypt_modes[] = {
> > +	[FSCRYPT_MODE_AES_256_XTS] = {
> > +		.friendly_name = "AES-256-XTS",
> > +		.cipher_str = "xts(aes)",
> > +		.keysize = 64,
> > +		.ivlen = 16,
> > +	},
> > +	[FSCRYPT_MODE_ADIANTUM] = {
> > +		.friendly_name = "Adiantum",
> > +		.cipher_str = "adiantum(xchacha12,aes)",
> > +		.keysize = 32,
> > +		.ivlen = 32,
> > +	},
> > +};
> > +#define MAX_IV_LEN 32
> > +
> > +void f2fs_print_crypt_algs(void)
> > +{
> > +	int i;
> > +
> > +	for (i = 1; i <= __FSCRYPT_MODE_MAX; i++) {
> > +		if (!f2fs_crypt_modes[i].friendly_name)
> > +			continue;
> > +		MSG(0, "\t%s\n", f2fs_crypt_modes[i].friendly_name);
> > +	}
> > +}
> > +
> > +int f2fs_get_crypt_alg(const char *optarg)
> > +{
> > +	int i;
> > +
> > +	for (i = 1; i <= __FSCRYPT_MODE_MAX; i++) {
> > +		if (f2fs_crypt_modes[i].friendly_name &&
> > +		    !strcmp(f2fs_crypt_modes[i].friendly_name, optarg)) {
> > +			return i;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +int f2fs_metadata_process_key(const char *key_serial_str)
> > +{
> > +	key_serial_t key_serial = strtol(key_serial_str, NULL, 10);
> > +
> > +	c.metadata_crypt_key_len =
> > +		keyctl_read_alloc(key_serial, (void **)&c.metadata_crypt_key);
> > +
> > +	if (c.metadata_crypt_key_len < 0)
> > +		return errno;
> > +
> > +	return 0;
> > +}
> > +
> > +int f2fs_metadata_verify_args(void)
> > +{
> > +	/* If neither specified, nothing to do */
> > +	if (!c.metadata_crypt_key && !c.metadata_crypt_alg)
> > +		return 0;
> > +
> > +	/* We need both specified */
> > +	if (!c.metadata_crypt_key || !c.metadata_crypt_alg)
> > +		return -EINVAL;
> > +
> > +	if (c.metadata_crypt_key_len !=
> > +	    f2fs_crypt_modes[c.metadata_crypt_alg].keysize) {
> > +		MSG(0, "\tMetadata encryption key length %d didn't match required size %d\n",
> > +		    c.metadata_crypt_key_len,
> > +		    f2fs_crypt_modes[c.metadata_crypt_alg].keysize);
> > +
> > +		return -EINVAL;
> > +	}
> 
> Need to check sparse mode here?
> 
I tried to support sparse mode with metadata encryption in v2 (that I
just sent out), but I haven't been able to even compile or test it yet.
Would you happen to know where I might find some info on how to compile
and test sparse mode?
> And, what about multiple partition case?
> 
IIUC I think multiple devices are handled correctly by the code - is there
something I'm missing?
> > @@ -138,6 +147,14 @@ static void f2fs_parse_options(int argc, char *argv[])
> >  		case 'a':
> >  			c.heap = atoi(optarg);
> >  			break;
> > +		case 'A':
> > +			c.metadata_crypt_alg = f2fs_get_crypt_alg(optarg);
> > +			if (c.metadata_crypt_alg < 0) {
> > +				MSG(0, "Error: invalid crypt algorithm specified. The choices are:");
> > +				f2fs_print_crypt_algs();
> > +				exit(1);
> > +			}
> > +			break;
> >  		case 'c':
> >  			if (c.ndevs >= MAX_DEVICES) {
> >  				MSG(0, "Error: Too many devices\n");
> > @@ -178,6 +195,12 @@ static void f2fs_parse_options(int argc, char *argv[])
> >  		case 'm':
> >  			c.zoned_mode = 1;
> >  			break;
> > +		case 'M':
> > +			if (f2fs_metadata_process_key(optarg)) {
> > +				MSG(0, "Error: Invalid metadata key\n");
> > +				mkfs_usage();
> > +			}
> > +			break;
> >  		case 'o':
> >  			c.overprovision = atof(optarg);
> >  			break;
> > @@ -244,6 +267,14 @@ static void f2fs_parse_options(int argc, char *argv[])
> >  		}
> >  	}
> >  
> > +	if ((!!c.metadata_crypt_key) != (!!c.metadata_crypt_alg)) {
> > +		MSG(0, "\tError: Both the metadata crypt key and crypt algorithm must be specified!");
> > +		exit(1);
> > +	}
> > +
> > +	if (f2fs_metadata_verify_args())
> > +		exit(1);
> > +
> >  	add_default_options();
> 
> Need to check options after add_default_options()?
> 
As in, you're suggesting moving the metadata_crypt_key and
metadata_crypt_alg check and the 
+ if (f2fs_metadata_verify_args())
to below the add_default_options() call? If so, I'll do that in v3 of
this patch series
> Thanks,
> 
> >  
> >  	if (!(c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR))) {
> > -- 
> > 2.28.0.806.g8561365e88-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
