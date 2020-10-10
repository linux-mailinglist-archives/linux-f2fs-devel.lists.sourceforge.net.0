Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 737DC289FA7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Oct 2020 11:53:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kRBZB-0005qK-PG; Sat, 10 Oct 2020 09:53:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kRBZ9-0005qC-P3
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Oct 2020 09:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=teIAwWYJORYo6zJIO9PtHv2gUV2fW8NMoTJUqMuWJFE=; b=iYlHexDkfaiHtJUGZKVFiQ5V+b
 e92VFsnG+I+cB+w78RHsTwSN2k5AZegWCLeMXbVjX/K/IlCt7tzkEgQWSUDkPxsNniYG9XlS/Z+Sx
 RFyZSc6+GPn79yussQmL0Pwztr4a1brc109iMSujrjxSxpLwdB3MSmCPdXZ1LVjbjIdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=teIAwWYJORYo6zJIO9PtHv2gUV2fW8NMoTJUqMuWJFE=; b=KfrfB0VJ28NYdtaIXIMvaFIPm1
 KCvzPrthLA2Wg22Y1Ffgg83WEtPmlUTMviVhipuk1vgcg7LL2EmS7gs6HWOfmbhJElwbsn+r9G/Jo
 3r/xVF1vEp6Jjf/vclTAQeUnQNbzOVGH9dRxSamu2zwhp1pjGuwUbJ1lthGccU8jvxus=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kRBZ3-009THO-DF
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Oct 2020 09:53:27 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2FE562A869CF12B54854;
 Sat, 10 Oct 2020 17:53:12 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 10 Oct
 2020 17:53:07 +0800
To: Satya Tangirala <satyat@google.com>, "Theodore Y . Ts'o" <tytso@mit.edu>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
 Chao Yu <chao@kernel.org>
References: <20201005073606.1949772-1-satyat@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <471e0eb7-b035-03da-3ee3-35d5880a6748@huawei.com>
Date: Sat, 10 Oct 2020 17:53:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201005073606.1949772-1-satyat@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kRBZ3-009THO-DF
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
Cc: linux-fscrypt@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/10/5 15:36, Satya Tangirala wrote:
> This patch series adds support for metadata encryption to F2FS using
> blk-crypto.

It looks this implementation is based on hardware crypto engine, could you
please add this info into f2fs.rst as well like inlinecrypt...

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

Why not using nid as DUN, then GC could migrate encrypted node block directly via
meta inode's address space like we do for encrypted data block, rather than
decrypting node block to node page and then encrypting node page with DUN of new
blkaddr it migrates to.

Thanks,

> 
> Please refer to the commit message for why the superblock was excluded from
> en/decryption, and other limitations. The superblock and its copy are
> stored in plaintext on disk. The encryption algorithm used for metadata
> encryption is stored within the superblock itself. Changes to the userspace
> tools (that are required to test out metadata encryption with F2FS) are
> also being sent out - I'll post a link as a reply to this mail once it's
> out.
> 
> Satya Tangirala (3):
>    fscrypt, f2fs: replace fscrypt_get_devices with fscrypt_get_device
>    fscrypt: Add metadata encryption support
>    f2fs: Add metadata encryption support
> 
>   Documentation/filesystems/f2fs.rst |  12 ++
>   fs/crypto/Kconfig                  |   6 +
>   fs/crypto/Makefile                 |   1 +
>   fs/crypto/fscrypt_private.h        |  19 +++
>   fs/crypto/inline_crypt.c           |  37 +----
>   fs/crypto/metadata_crypt.c         | 220 +++++++++++++++++++++++++++++
>   fs/f2fs/data.c                     |  24 ++--
>   fs/f2fs/f2fs.h                     |   2 +
>   fs/f2fs/super.c                    |  83 +++++++++--
>   include/linux/f2fs_fs.h            |   3 +-
>   include/linux/fs.h                 |   3 +
>   include/linux/fscrypt.h            |  51 ++++++-
>   12 files changed, 410 insertions(+), 51 deletions(-)
>   create mode 100644 fs/crypto/metadata_crypt.c
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
