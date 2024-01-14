Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E56E582D0AA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Jan 2024 13:58:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rP03p-0003Qn-NL;
	Sun, 14 Jan 2024 12:57:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1rP03l-0003Qd-Rh
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Jan 2024 12:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EV9qT0xi0f/EfAM2vWU4Of1/cD06Z7Hd39BHq/uthHs=; b=i8Mrv+XWeESm6qIRhSQzdWYxui
 RbOere7xixUCDHk1An7vFPxGzvsL18xexch/1Ux5rNX9FeSQWYrv3sEU0wSCna4ACmjm92+2jGby1
 RseoAJTRKbTj2GuGYaVM1F+DhMJt/FtGXn3CpAdqkUXREtN9HVvDzFvSevTLifuy1GtA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EV9qT0xi0f/EfAM2vWU4Of1/cD06Z7Hd39BHq/uthHs=; b=EZLw9bEHWrtYacwVV1Tper3vWd
 ec2jPdsuv6AHvdXoCPwF9DD1OvJpcRt05rLa6v92bJaW4Rlk3xD/jJGoNwitXw4M0YjRBnSxpL7lC
 ZnNK17m9mTrtNkAQxDpOrzQ3FfOJgAjU/Zv6GiaBIGZO2BnQcRKSRLfWMf2DbxqStnQE=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rP03i-0003Wc-Bb for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Jan 2024 12:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705237059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EV9qT0xi0f/EfAM2vWU4Of1/cD06Z7Hd39BHq/uthHs=;
 b=Sh4LkkB8o0TUhFq3xjU0RmfK/dwkH26LF775183qip2qvplNIosTfYiMeSLBxnXVjvADsr
 3d0Pl4nOR9HP1+B8d6W0Q7nOC1iIdiqr/fmixWSgvoWlFh3J6vpmlTQHZlXlqVhiumhX0U
 CleyBU1b9W7VeOvH/duo7f4MMYoyB7Q=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-IZkdp9VcMnyOA9xE4wCccA-1; Sun, 14 Jan 2024 07:57:37 -0500
X-MC-Unique: IZkdp9VcMnyOA9xE4wCccA-1
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-598f58b95c7so422496eaf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Jan 2024 04:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705237057; x=1705841857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EV9qT0xi0f/EfAM2vWU4Of1/cD06Z7Hd39BHq/uthHs=;
 b=LBweBLtNn6JfOSEvRGercX9EPDLlFW/mbmdrpRTRlRYcqU8TEWXDsA9xN9FpjDk74R
 koE45JINb3WU+MBlFVfsTM+lDlUX6CfhT0tJO8LWtfqlxwHA7696sRwNC46leeE9sP6i
 hOOEtdmc9qevk44wM+Kj7cSHQ8FZ1ZngjiQMib8EBmyVrnFEX/RQCHQ7L/Y88fEDUGok
 3eqDhq6TJBnM3lBM1aDr+wxigulLU/hG4W+Wq86xUFLqVUZjXVJFKFdnDj6Lu4jQmbCH
 bVUcWVfySn/Az8AvY+1nGN7lxBgx6j2LeMrYUM3PCiSognt0uO5XONhazQtCg//C1mV9
 MAcA==
X-Gm-Message-State: AOJu0YwsN0DFiri96SZIcQFK1gXqNMEThpKaSH0iQU75qB1dzq25dv61
 U5FD0GFXGhHE2wS8fyzRLrWsEed8SjhA8AEnIcRVJVct+jMUJ8yDMM8gEuKOqRiWUaxGQLSZ0zo
 TdSLkwI2GtlfICbUP9krNdcIbN/+pxgBWYjPXKj3S61Yqvg==
X-Received: by 2002:a05:6820:505:b0:596:419f:502e with SMTP id
 m5-20020a056820050500b00596419f502emr2934055ooj.0.1705237057182; 
 Sun, 14 Jan 2024 04:57:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8oOHaDdPTRniQcbYTAy+7Dj4vGLEtue7MrlKUooDRPzKm1Jr6QGHx9j19qpkoultOKB/JDw==
X-Received: by 2002:a05:6820:505:b0:596:419f:502e with SMTP id
 m5-20020a056820050500b00596419f502emr2934049ooj.0.1705237056928; 
 Sun, 14 Jan 2024 04:57:36 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 pt12-20020a17090b3d0c00b0028e3feea296sm1450033pjb.1.2024.01.14.04.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 04:57:36 -0800 (PST)
Date: Sun, 14 Jan 2024 20:57:32 +0800
From: Zorro Lang <zlang@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20240114125732.qpdltz52wrjursl2@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20231121223909.4617-1-ebiggers@kernel.org>
 <20231121223909.4617-5-ebiggers@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231121223909.4617-5-ebiggers@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 21, 2023 at 02:39:09PM -0800, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Add a test that verifies the
 on-disk format of encrypted files that use > a crypto data uni [...] 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rP03i-0003Wc-Bb
Subject: Re: [f2fs-dev] [PATCH v2 4/4] generic: add test for custom crypto
 data unit size
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 21, 2023 at 02:39:09PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a test that verifies the on-disk format of encrypted files that use
> a crypto data unit size that differs from the filesystem block size.
> This tests the functionality that was introduced in Linux 6.7 by kernel
> commit 5b1188847180 ("fscrypt: support crypto data unit size less than
> filesystem block size").
> 
> This depends on the xfsprogs patch
> "xfs_io/encrypt: support specifying crypto data unit size"
> (https://lore.kernel.org/r/20231013062639.141468-1-ebiggers@kernel.org)
> which adds the '-s' option to the set_encpolicy command of xfs_io.
> 
> As usual, the test skips itself when any prerequisite isn't met.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  tests/generic/900     | 29 +++++++++++++++++++++++++++++
>  tests/generic/900.out | 11 +++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100755 tests/generic/900
>  create mode 100644 tests/generic/900.out
> 
> diff --git a/tests/generic/900 b/tests/generic/900
> new file mode 100755
> index 00000000..8d1b5766
> --- /dev/null
> +++ b/tests/generic/900
> @@ -0,0 +1,29 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright 2023 Google LLC
> +#
> +# FS QA Test No. generic/900
> +#
> +# Verify the on-disk format of encrypted files that use a crypto data unit size
> +# that differs from the filesystem block size.  This tests the functionality
> +# that was introduced in Linux 6.7 by kernel commit 5b1188847180
> +# ("fscrypt: support crypto data unit size less than filesystem block size").

I'll write this part as:

  _wants_kernel_commit 5b1188847180
	"fscrypt: support crypto data unit size less than filesystem block size"

when I merge it.

> +#
> +. ./common/preamble
> +_begin_fstest auto quick encrypt
> +
> +. ./common/filter
> +. ./common/encrypt
> +
> +_supported_fs generic
> +
> +# For now, just test 512-byte and 1024-byte data units.  Filesystems accept
> +# power-of-2 sizes between 512 and the filesystem block size, inclusively.
> +# Testing 512 and 1024 ensures this test will run for any FS block size >= 1024
> +# (provided that the filesystem supports sub-block data units at all).
> +_verify_ciphertext_for_encryption_policy AES-256-XTS AES-256-CTS-CBC v2 log2_dusize=9

Oh, all _require_scratch_... things are in this helper. I was wondering
why it doesn't need to _require_scratch :)

This patchset looks good to me, tested passed on latest upstream kernel.
Thanks for this upgrade. Feel free to ping me, if your patchset be blocked
long time.

Reviewed-by: Zorro Lang <zlang@redhat.com>

> +_verify_ciphertext_for_encryption_policy AES-256-XTS AES-256-CTS-CBC v2 log2_dusize=10
> +
> +# success, all done
> +status=0
> +exit
> diff --git a/tests/generic/900.out b/tests/generic/900.out
> new file mode 100644
> index 00000000..3259f08c
> --- /dev/null
> +++ b/tests/generic/900.out
> @@ -0,0 +1,11 @@
> +QA output created by 900
> +
> +Verifying ciphertext with parameters:
> +	contents_encryption_mode: AES-256-XTS
> +	filenames_encryption_mode: AES-256-CTS-CBC
> +	options: v2 log2_dusize=9
> +
> +Verifying ciphertext with parameters:
> +	contents_encryption_mode: AES-256-XTS
> +	filenames_encryption_mode: AES-256-CTS-CBC
> +	options: v2 log2_dusize=10
> -- 
> 2.42.1
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
