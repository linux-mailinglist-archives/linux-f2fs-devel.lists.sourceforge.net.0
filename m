Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FC6283120
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Oct 2020 09:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZiA0bgtWkHQjWje15DClTipLY/FjYAygoRvZPlkWlBk=; b=GxMHmi21eOfn6L8A4/7rE/Evt
	T5+FXFNX3iTlDwRNKd7DimngqXa6kfom8T6J+gRQ/p9aU128sRMUH6Pp9qtesyKt+C+RxF+dp2yH3
	MBgTQTvvxKTFgOFoKVzryLwoQjCTaA/hyx+Nv6R/CeqPguqqSIpyhoPD45Oylfw/aJRLo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kPLIY-0005vj-3L; Mon, 05 Oct 2020 07:52:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kPLIV-0005vU-DX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Oct 2020 07:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X23br66JlsI+U5TsUplHSaOteTplJYGMMbIqIW0LyRE=; b=YjA9lsAD5mogyvtfB+6eE92pN8
 y6bkYCOPkOh3ys6r7E2dFwSqmzJR1DYh4K8cn/BIcryglpVLFkvXCLi7wSNxksv+hbmhy5nYXoacS
 8uF+btGBOWxj7r+Wi/rRNjg8l7dcXfFDFgni9HGN9mYbRRsZsKIgFmt69KM/V1tLNlME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X23br66JlsI+U5TsUplHSaOteTplJYGMMbIqIW0LyRE=; b=gy4eVMQFhBIDj5yIuTh+7z5fxC
 MUJJlHfcB/oWe41vk7B1q2fX6QtqF9Mev8UvumcqktA/H/OkK7+UCvr9EERs1U/gnSrjJOnxwfujE
 DxDG1LnAb52IcUkaPTjm5351JBGWDNkfIDzCuoFNJsRsiXtDg99iovPR2iAbkkPz1fcM=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kPLIO-0033zA-E8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Oct 2020 07:52:39 +0000
Received: by mail-oi1-f193.google.com with SMTP id c13so7907034oiy.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 Oct 2020 00:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X23br66JlsI+U5TsUplHSaOteTplJYGMMbIqIW0LyRE=;
 b=X0wMWPpuEYm+0K8Cy3ECdBTavARN3sHHi+Krskk0qghxKsdvff7Ppo31h7Nkm1Yf/C
 TCGkThy/lWuZ1Vaeuijj4FGNl4/cQJ0gufGWcNPlHUGUQokXCgxXSuYHBlv4DXWZm2hE
 J40qNxV0S2gRhqBnE9RNTlOaaXukK1ZSeiFXPPhybK+JMfFV+XpAqoxvG9mal2f2YRpx
 9ZvWsGeH+kna/vtlcubeG9G6N2JKJJYixvf/DKqq/qnhAqdw1KqhJnHRi1Na9T/Hd93+
 /ZpgbNGEbIejFo+8TkkyWGyHE/2LkQ9kGetqxDl7S/z++OWq6YkHW5ildHIqrh5qBkOF
 hrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X23br66JlsI+U5TsUplHSaOteTplJYGMMbIqIW0LyRE=;
 b=c4iPTlpy0/oDaMkobj75kGq0nVp/QQdYJyeMrRT24TsUDBlsHY5WCaQHJeYesnI63m
 KlPSBzTJFc7AJKgx1Ci8J8BaGZiA0jLlH+9vdgp/bkIYQCt81oMYfVhnfEDVO1t02HWG
 GZ458HLVe8HTPqLkvHTvbvi6dvjdA0Pr05xuF3PaHrNhsRE54Nvi2B4KqiWBJc36T6Vi
 v8oAav9XCiZetFJbSXQcCmQ7gq/vEwguxSPNMbbdC5ka9TpIZradna0aUJSFy2iuB44v
 Df4qTq5gfXVCN6ruwXeH091+EmUp5eZb244M3+PwcMdTaf/9lAY+twvBe72mUGkDG47/
 Wdbg==
X-Gm-Message-State: AOAM531qCvGmt/uvilJ1S2mbL1NKxLaNBnTBrrRmsGIn9m42LDtueqe/
 8cqvVjvbcLBiys+kHy66D4mpWw3nAMjGfw==
X-Google-Smtp-Source: ABdhPJxjiBhE05FbFRoagaOdnJMPR0JknN8uuakg4QEBAotLL4GrrLTqGoZh+gRIMoJ98GLs8SgnlQ==
X-Received: by 2002:a17:90a:a58d:: with SMTP id
 b13mr15569298pjq.196.1601883840413; 
 Mon, 05 Oct 2020 00:44:00 -0700 (PDT)
Received: from google.com (154.137.233.35.bc.googleusercontent.com.
 [35.233.137.154])
 by smtp.gmail.com with ESMTPSA id e8sm9754948pgj.8.2020.10.05.00.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 00:43:59 -0700 (PDT)
Date: Mon, 5 Oct 2020 07:43:56 +0000
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <20201005074356.GA1961565@google.com>
References: <20201005073606.1949772-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005073606.1949772-1-satyat@google.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kPLIO-0033zA-E8
Subject: Re: [f2fs-dev] [PATCH 0/3] add support for metadata encryption to
 F2FS
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
Cc: linux-fscrypt@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 05, 2020 at 07:36:03AM +0000, Satya Tangirala wrote:
> This patch series adds support for metadata encryption to F2FS using
> blk-crypto.
> 
> Patch 1 replaces fscrypt_get_devices (which took an array of request_queues
> and filled it up) with fscrypt_get_device, which takes a index of the
> desired device and returns the device at that index (so the index passed
> to fscrypt_get_device must be between 0 and (fscrypt_get_num_devices() - 1)
> inclusive). This allows callers to avoid having to allocate an array to
> pass to fscrypt_get_devices() when they only need to iterate through
> each element in the array (and have no use for the array itself).
> 
> Patch 2 introduces some functions to fscrypt that help filesystems perform
> metadata encryption. Any filesystem that wants to use metadata encryption
> can call fscrypt_setup_metadata_encryption() with the super_block of the
> filesystem, the encryption algorithm and the descriptor of the encryption
> key. The descriptor is looked up in the logon keyring of the current
> session with "fscrypt:" as the prefix of the descriptor.
> 
> The patch also introduces fscrypt_metadata_crypt_bio() which an FS should
> call on a bio that the FS wants metadata crypted. The function will add
> an encryption context with the metadata encryption key set up by the call
> to the above mentioned fscrypt_setup_metadata_encryption().
> 
> The patch also introduces fscrypt_metadata_crypt_prepare_all_devices().
> Filesystems that use multiple devices should call this function once all
> the underlying devices have been determined. An FS might only be able to
> determine all the underlying devices after some initial processing that
> might already require metadata en/decryption, which is why this function
> is separate from fscrypt_setup_metadata_encryption().
> 
> Patch 3 wires up F2FS with the functions introduced in Patch 2. F2FS
> will encrypt every block (that's not being encrypted by some other
> encryption key, e.g. a per-file key) with the metadata encryption key
> except the superblock (and the redundant copy of the superblock). The DUN
> of a block is the offset of the block from the start of the F2FS
> filesystem.
> 
> Please refer to the commit message for why the superblock was excluded from
> en/decryption, and other limitations. The superblock and its copy are
> stored in plaintext on disk. The encryption algorithm used for metadata
> encryption is stored within the superblock itself. Changes to the userspace
> tools (that are required to test out metadata encryption with F2FS) are
> also being sent out - I'll post a link as a reply to this mail once it's
> out.
The userspace patches are at

https://lore.kernel.org/linux-fscrypt/20201005074133.1958633-2-satyat@google.com/

> 
> Satya Tangirala (3):
>   fscrypt, f2fs: replace fscrypt_get_devices with fscrypt_get_device
>   fscrypt: Add metadata encryption support
>   f2fs: Add metadata encryption support
> 
>  Documentation/filesystems/f2fs.rst |  12 ++
>  fs/crypto/Kconfig                  |   6 +
>  fs/crypto/Makefile                 |   1 +
>  fs/crypto/fscrypt_private.h        |  19 +++
>  fs/crypto/inline_crypt.c           |  37 +----
>  fs/crypto/metadata_crypt.c         | 220 +++++++++++++++++++++++++++++
>  fs/f2fs/data.c                     |  24 ++--
>  fs/f2fs/f2fs.h                     |   2 +
>  fs/f2fs/super.c                    |  83 +++++++++--
>  include/linux/f2fs_fs.h            |   3 +-
>  include/linux/fs.h                 |   3 +
>  include/linux/fscrypt.h            |  51 ++++++-
>  12 files changed, 410 insertions(+), 51 deletions(-)
>  create mode 100644 fs/crypto/metadata_crypt.c
> 
> -- 
> 2.28.0.806.g8561365e88-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
