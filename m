Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B340630110B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Jan 2021 00:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUJMfi7o5rmLp5FJ604PtgAh5Jrlni2ue0jULMmtQlg=; b=DBzRJI1tLn4SenukXQdtfwz37o
	vI3jiK/3GxgCidKl2jnOOyzvcWbdkmidhCOpU2IRy1kd0KJqgp3Wm5jy8qHUuJnNCezeIA2J9n+dZ
	VE4q1ZctYAU3h3KFh88fpC8a6+zwKwu3zEdv9B5F+sMv3I/9WOsrS8TNDbscGzdrscnE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l35vN-00075S-N0; Fri, 22 Jan 2021 23:33:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <victorhsieh@google.com>) id 1l35vM-00075K-I8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 23:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WuooQLj08FTndW6GG4FNdPUFeSvF4QeyXpQNaZQvMQU=; b=boNWJrNLURTYXqOkYr3AS0bjsG
 sWiwjq/3cb7lXahsqIwL3hWKp1hQkybZO7Vrnpk8uTVOh9AUapwIB3g8g1xpy2FrJD/W/R2TyW0TR
 9G0Ohog05bzVV0FETJKXYAUKhenMAjDrseReDuozHlT1EKseK5okXGKFsFWmApt957Mc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WuooQLj08FTndW6GG4FNdPUFeSvF4QeyXpQNaZQvMQU=; b=HBdTLWboFSZYY/VrU+sftMXoe6
 VoGvrKl/TBu9n7Q/xaVPi0ckzX3FDh2dNYKLj68Qzruhn/Gi4ScEZixu+pnsTOVqVx1ZZ/RJz5gsg
 6dUoh9JwyHSX+p+bHKBd9QUlwAWy8cwgiwPvn3AVoCcJKiA+W2ULcmq03FZZzFLQr5pE=;
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l35vC-00HOFU-OC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 23:33:04 +0000
Received: by mail-pg1-f176.google.com with SMTP id c22so4839752pgg.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Jan 2021 15:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WuooQLj08FTndW6GG4FNdPUFeSvF4QeyXpQNaZQvMQU=;
 b=YZ6nQ6FOxluHSewTFEdRxogFELFzJ61SLsAvjLFQZbuTGGMmwsF7JRUaxP7S0eEf3O
 zi4YxhJ311FM5HaM9OKi926md/9trhVY4f8oQ2L69cHtC8SiOc/RvEONC0Brp8EzYXLW
 lv6khpaUQGj21NLNM2haXeFieuHFHlPe5MsuHoJAAixyciIG/WrLFSbzGXn8urZA33tw
 GkWrMip0Wro8nMmVc+kl4jfg0hBCevvC6rr682OGhXTOkMjl301uDZC7QbGb7Yz/vxMK
 LBlL4RWfi61+hAnVPZfXrIwr9DYcO/sReuxxZfpkbORXS6rvMYifp7nAEYX563UTR1UV
 Vw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WuooQLj08FTndW6GG4FNdPUFeSvF4QeyXpQNaZQvMQU=;
 b=RvNEWI9zbAdDTEIi92EjDK6/2BY7qcyGDeI3XhUXX5B0TLe9z1bPJNivhPg0/YY43T
 Q4KZIwCxFB9Ls1EWvftXl5o/Ltj2JNMsJDab9eQUK21RfB+8od7+4Dow2pg/Yd8xtHHI
 eZJmZSFUwkgk0FzXd6gSnNyKyRRf0Wyy2jTb2TiC/Pog961Uqu+JLLSgav1+bSgZzJG+
 sUep0bYvLrJTsGAn7srx48xD7+4b7T+aopYqestVuv2ET9v1/j0s8blBkQ952TUY2Ka9
 mBORqyEJzKleWxBnhMQvOCh5w84SdojMf0LFO2iuwRSWOENdbFYscdyZKrb6erwNxmJz
 0CJw==
X-Gm-Message-State: AOAM532a310pqWQ+ZQ8wqRkTg2hEXx4U7Egj3l6TtBY5c27giv2b6MoK
 TDZW75Kaca+95MtafDX9wYgviXDqwkZsftcqFmlyFm82qIc=
X-Google-Smtp-Source: ABdhPJx2/n88EpZhF9H0QRhbuIUDjLNzHy/G5ah/y4Nn1FpXH6Y4ko0ibuQnyPTD5D1W2NrSUOQ62tixsem0o23bO4I=
X-Received: by 2002:a92:4101:: with SMTP id o1mr174997ila.82.1611358022134;
 Fri, 22 Jan 2021 15:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20210115181819.34732-1-ebiggers@kernel.org>
In-Reply-To: <20210115181819.34732-1-ebiggers@kernel.org>
Date: Fri, 22 Jan 2021 15:26:48 -0800
Message-ID: <CAFCauYN12bWRn2N+uP455KuRmz7CQkCBXnz0B2sr5kCQtpJo4A@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.176 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lwn.net]
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
X-Headers-End: 1l35vC-00HOFU-OC
Subject: Re: [f2fs-dev] [PATCH 0/6] fs-verity: add an ioctl to read verity
 metadata
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
From: Victor Hsieh via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Victor Hsieh <victorhsieh@google.com>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

LGTM. Thanks!

Reviewed-by: Victor Hsieh <victorhsieh@google.com>

On Fri, Jan 15, 2021 at 10:19 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> [This patchset applies to v5.11-rc3]
>
> Add an ioctl FS_IOC_READ_VERITY_METADATA which allows reading verity
> metadata from a file that has fs-verity enabled, including:
>
> - The Merkle tree
> - The fsverity_descriptor (not including the signature if present)
> - The built-in signature, if present
>
> This ioctl has similar semantics to pread().  It is passed the type of
> metadata to read (one of the above three), and a buffer, offset, and
> size.  It returns the number of bytes read or an error.
>
> This ioctl doesn't make any assumption about where the metadata is
> stored on-disk.  It does assume the metadata is in a stable format, but
> that's basically already the case:
>
> - The Merkle tree and fsverity_descriptor are defined by how fs-verity
>   file digests are computed; see the "File digest computation" section
>   of Documentation/filesystems/fsverity.rst.  Technically, the way in
>   which the levels of the tree are ordered relative to each other wasn't
>   previously specified, but it's logical to put the root level first.
>
> - The built-in signature is the value passed to FS_IOC_ENABLE_VERITY.
>
> This ioctl is useful because it allows writing a server program that
> takes a verity file and serves it to a client program, such that the
> client can do its own fs-verity compatible verification of the file.
> This only makes sense if the client doesn't trust the server and if the
> server needs to provide the storage for the client.
>
> More concretely, there is interest in using this ability in Android to
> export APK files (which are protected by fs-verity) to "protected VMs".
> This would use Protected KVM (https://lwn.net/Articles/836693), which
> provides an isolated execution environment without having to trust the
> traditional "host".  A "guest" VM can boot from a signed image and
> perform specific tasks in a minimum trusted environment using files that
> have fs-verity enabled on the host, without trusting the host or
> requiring that the guest has its own trusted storage.
>
> Technically, it would be possible to duplicate the metadata and store it
> in separate files for serving.  However, that would be less efficient
> and would require extra care in userspace to maintain file consistency.
>
> In addition to the above, the ability to read the built-in signatures is
> useful because it allows a system that is using the in-kernel signature
> verification to migrate to userspace signature verification.
>
> This patchset has been tested by new xfstests which call this new ioctl
> via a new subcommand for the 'fsverity' program from fsverity-utils.
>
> Eric Biggers (6):
>   fs-verity: factor out fsverity_get_descriptor()
>   fs-verity: don't pass whole descriptor to fsverity_verify_signature()
>   fs-verity: add FS_IOC_READ_VERITY_METADATA ioctl
>   fs-verity: support reading Merkle tree with ioctl
>   fs-verity: support reading descriptor with ioctl
>   fs-verity: support reading signature with ioctl
>
>  Documentation/filesystems/fsverity.rst |  76 ++++++++++
>  fs/ext4/ioctl.c                        |   7 +
>  fs/f2fs/file.c                         |  11 ++
>  fs/verity/Makefile                     |   1 +
>  fs/verity/fsverity_private.h           |  13 +-
>  fs/verity/open.c                       | 133 +++++++++++------
>  fs/verity/read_metadata.c              | 195 +++++++++++++++++++++++++
>  fs/verity/signature.c                  |  20 +--
>  include/linux/fsverity.h               |  12 ++
>  include/uapi/linux/fsverity.h          |  14 ++
>  10 files changed, 417 insertions(+), 65 deletions(-)
>  create mode 100644 fs/verity/read_metadata.c
>
>
> base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837
> --
> 2.30.0
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
