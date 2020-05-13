Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 898271D1BB2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 18:59:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYujR-00046P-8X; Wed, 13 May 2020 16:59:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYujQ-00046I-B1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 16:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ywHRfeNSJYyleu0tHShTxLQb/zbxsicvFI//fMhAesE=; b=B/ivV+B1jDc9q/5HYNlweRAlz3
 d8QBUuvtWs67+ULGyf50MKRqNDbsHpqSUGMdv4VlxdOY8zn/06ie+U9oImimViSWlcaMo1gg/qTOe
 84TcsP1aaFqIBeGFpEvOD5xbmQaj56j556sj3osz0T4I8uC9UhRFP4qeG4nvRCHw/SDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ywHRfeNSJYyleu0tHShTxLQb/zbxsicvFI//fMhAesE=; b=YMtt5dOW8HTBtS+XpIAmcBKA82
 WxP+1Vg11YIyI0s7eCE5ehGhWvMhvU1PzrVDXgYryP1nNLLT6+lvtM3gHUoMQ/OH4c+o7kwaZNQp0
 7J3Dx2Q4IRMWeYQk7GHPGLV2ixGcR2TlXUGq1Hq+q3oxO778NpvmsGItL2eF+RLY+U1Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYujP-005mUC-0l
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 16:59:44 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B515D2065D;
 Wed, 13 May 2020 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589389171;
 bh=0HQMOP0BpZgRgfro5Mx19xoVjR8i8Cp7hfF6JzMVoQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mZSBuSCStcxLjCAB+/NCz5XuRjsEymEMhj0DzbMcXIZPg17N6m+05ljS1tpC2ZXSQ
 G7iMU/eF/ZGy+rh2C52IJnRrN+DEtntzxsiAtuUR+BQZisarEi9iOZ2ucnojqr23J8
 jelKPJj+XrbsiCkUqvAWLI+FTzNCHmr38Z5DdSuI=
Date: Wed, 13 May 2020 09:59:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200513165928.GB1243@sol.localdomain>
References: <20200430115959.238073-1-satyat@google.com>
 <20200430115959.238073-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430115959.238073-3-satyat@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYujP-005mUC-0l
Subject: Re: [f2fs-dev] [PATCH v12 02/12] block: Keyslot Manager for Inline
 Encryption
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Apr 30, 2020 at 11:59:49AM +0000, Satya Tangirala wrote:
> Inline Encryption hardware allows software to specify an encryption context
> (an encryption key, crypto algorithm, data unit num, data unit size) along
> with a data transfer request to a storage device, and the inline encryption
> hardware will use that context to en/decrypt the data. The inline
> encryption hardware is part of the storage device, and it conceptually sits
> on the data path between system memory and the storage device.
> 
> Inline Encryption hardware implementations often function around the
> concept of "keyslots". These implementations often have a limited number
> of "keyslots", each of which can hold a key (we say that a key can be
> "programmed" into a keyslot). Requests made to the storage device may have
> a keyslot and a data unit number associated with them, and the inline
> encryption hardware will en/decrypt the data in the requests using the key
> programmed into that associated keyslot and the data unit number specified
> with the request.
> 
> As keyslots are limited, and programming keys may be expensive in many
> implementations, and multiple requests may use exactly the same encryption
> contexts, we introduce a Keyslot Manager to efficiently manage keyslots.
> 
> We also introduce a blk_crypto_key, which will represent the key that's
> programmed into keyslots managed by keyslot managers. The keyslot manager
> also functions as the interface that upper layers will use to program keys
> into inline encryption hardware. For more information on the Keyslot
> Manager, refer to documentation found in block/keyslot-manager.c and
> linux/keyslot-manager.h.
> 
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

Looks good.  This already has my Co-developed-by, but if needed you can also add

    Reviewed-by: Eric Biggers <ebiggers@google.com>

A couple comments below for when you resend:

> +++ b/block/keyslot-manager.c
> @@ -0,0 +1,378 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +/**
> + * DOC: The Keyslot Manager
> + *
> + * Many devices with inline encryption support have a limited number of "slots"
> + * into which encryption contexts may be programmed, and requests can be tagged
> + * with a slot number to specify the key to use for en/decryption.
> + *
> + * As the number of slots are limited, and programming keys is expensive on

"are limited" => "is limited".

> +/**
> + * struct blk_crypto_key - an inline encryption key
> + * @crypto_cfg: the crypto configuration (like crypto_mode, key size) for this
> + *		key
> + * @data_unit_size_bits: log2 of data_unit_size
> + * @size: size of this key in bytes (determined by @crypto_cfg.crypto_mode)
> + * @raw: the raw bytes of this key.  Only the first @size bytes are used.
> + *
> + * A blk_crypto_key is immutable once created, and many bios can reference it at
> + * the same time.  It must not be freed until all bios using it have completed.
> + */

Since eviction is now mandatory, the last sentence should be something like:

"It must not be freed until all bios using it have completed and it has been
evicted from all devices on which it may have been used."

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
