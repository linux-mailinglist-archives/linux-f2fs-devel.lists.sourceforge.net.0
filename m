Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E3128C17
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Dec 2019 01:16:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iiov0-0007EJ-7m; Sun, 22 Dec 2019 00:16:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iiouy-0007E8-7T
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Dec 2019 00:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JBXvJfArDIUHBEOO1lTRUbwOFqOeE91lqlG4Jj9DJKs=; b=J5Nf+aVUNLpyxGCMlE73Ts6vCb
 yOLTnHc9Kln3/4eo8rmZ6KYJ3HzLth5y5s7Cbw0YWMXtv0tENNDiWDIxC6Q4+eFGzxiPYkFW6yMty
 k5eA69pIL6bumHX3CIOeZ8K0m+hnltKKGqEyqkLl9lJSsEzX8woFeUJ5ixso4biG2bsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JBXvJfArDIUHBEOO1lTRUbwOFqOeE91lqlG4Jj9DJKs=; b=Wp8Ie84kYzEChYkTlbIk3zF4h9
 hxu0iQPXelqbk0LW8njnxKbQwbfGxBJUsA9rd7xHfJ0Gw3LXfmDAyJ9Cmhxp54dfI4SseSmhkjAky
 Yzxdd6qM3qSm8NyUcWs7BIldqfXGrBuYhth5774JhVFiYNPcP42v6OcZ7iJcrOO1NFm0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iiouu-00C4Gk-Vl
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Dec 2019 00:16:20 +0000
Received: from zzz.localdomain
 (h75-100-12-111.burkwi.broadband.dynamic.tds.net [75.100.12.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0C0A206B7;
 Sun, 22 Dec 2019 00:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576973771;
 bh=zi2nezPZMF4U5iDzHEZMniOW0jiKQ3XbzvQhTGVXih0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmEfdcFEm4iZEYixgfnC/uRgDEvX64zJcJZxYGNrmnC0RXjmgUCwRq2bvJHzcfEd7
 cD8IWH5mszK2iHiQeuHCMd4zK8J0IDMhr8Utv4MZmvn41dMIQwyBIhGe4pZDLiqNMR
 HajyfoOLGjhfi6UBWGo831W+/NFlYI1SyH8S+KUA=
Date: Sat, 21 Dec 2019 18:16:08 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20191222001608.GB551@zzz.localdomain>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-10-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-10-satyat@google.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iiouu-00C4Gk-Vl
Subject: Re: [f2fs-dev] [PATCH v6 9/9] ext4: add inline encryption support
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 06:51:36AM -0800, Satya Tangirala wrote:
> @@ -1460,6 +1466,7 @@ enum {
>  	Opt_journal_path, Opt_journal_checksum, Opt_journal_async_commit,
>  	Opt_abort, Opt_data_journal, Opt_data_ordered, Opt_data_writeback,
>  	Opt_data_err_abort, Opt_data_err_ignore, Opt_test_dummy_encryption,
> +	Opt_inlinecrypt,
>  	Opt_usrjquota, Opt_grpjquota, Opt_offusrjquota, Opt_offgrpjquota,
>  	Opt_jqfmt_vfsold, Opt_jqfmt_vfsv0, Opt_jqfmt_vfsv1, Opt_quota,
>  	Opt_noquota, Opt_barrier, Opt_nobarrier, Opt_err,
> @@ -1556,6 +1563,7 @@ static const match_table_t tokens = {
>  	{Opt_noinit_itable, "noinit_itable"},
>  	{Opt_max_dir_size_kb, "max_dir_size_kb=%u"},
>  	{Opt_test_dummy_encryption, "test_dummy_encryption"},
> +	{Opt_inlinecrypt, "inlinecrypt"},
>  	{Opt_nombcache, "nombcache"},
>  	{Opt_nombcache, "no_mbcache"},	/* for backward compatibility */
>  	{Opt_removed, "check=none"},	/* mount option from ext2/3 */
> @@ -1767,6 +1775,11 @@ static const struct mount_opts {
>  	{Opt_jqfmt_vfsv1, QFMT_VFS_V1, MOPT_QFMT},
>  	{Opt_max_dir_size_kb, 0, MOPT_GTE0},
>  	{Opt_test_dummy_encryption, 0, MOPT_GTE0},
> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +	{Opt_inlinecrypt, EXT4_MOUNT_INLINECRYPT, MOPT_SET},
> +#else
> +	{Opt_inlinecrypt, EXT4_MOUNT_INLINECRYPT, MOPT_NOSUPPORT},
> +#endif
>  	{Opt_nombcache, EXT4_MOUNT_NO_MBCACHE, MOPT_SET},
>  	{Opt_err, 0, 0}
>  };

This mount option will need to be documented in
Documentation/admin-guide/ext4.rst for ext4 and
Documentation/filesystems/f2fs.txt for f2fs.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
