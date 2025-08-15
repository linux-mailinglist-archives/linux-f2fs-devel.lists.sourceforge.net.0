Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83533B28317
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 17:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++insLNaNBoZLB5M7qk+kkoPupzFif2KVa4NC/7B/8o=; b=BmdEItDjG0B7QxIUFlCNZfxlVg
	p2NH05syhqj0SwHJbAVxnE0ANlm2sugUT+v5cDON6TegvJKu512wz93JYpR3MZKtFkupXla3sO/Do
	n0bLw/vNP6veS3SnKncT9VnmpzNh1HKZljJ1h+w/m/oKeUkdF7zI7kH6sIcj04vuPeXY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umwXp-00042q-6Q;
	Fri, 15 Aug 2025 15:40:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umwXn-00042j-NO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 15:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h2shLWe0BUVvsKwtzCIiYcr9t5BEPaphZXfmxyJe3R0=; b=RDbqbVhyto3AleSH6nrNGLUrxe
 CT99aIq5Lr2xua+DfW4HxcxhHQdNM38Hq9WJbu+qIrFIe/OMgoMmyZtS6qiLFp9jIK0AFsM9gqMCk
 KgO5Nyt89z4jGawSH+uo1H0+iy/eRqjjrkxsx+D59rrG1gVJM3r5Jf3VXzxb+beSmFvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h2shLWe0BUVvsKwtzCIiYcr9t5BEPaphZXfmxyJe3R0=; b=ipbTppqB/hlZc0fSiqLts1w+18
 kbjn1i119i8+Wyz48KejDty5zX7kMjXiNe8FeE5vHIQec9GVS3bh2AM2uXlLLlAuF+Arjtmho9eBc
 ocrhPniAgRWsaG65bNm4zfef5qZdnfpZBZf9OT7RNL+D6sUuVZKBKKsIHCYdzvZ2K2/0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umwXn-0006De-8a for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 15:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755272433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h2shLWe0BUVvsKwtzCIiYcr9t5BEPaphZXfmxyJe3R0=;
 b=JkNgejY4FtbcQi5Km2lwyfzjkLKAf3R6vdWlv+XaFnsgMlt3JsT/hfwzmbnq1oFpACng8X
 dR1xEQl1hMZBnzQ/qWzb+hwkhfJcKDpisNQbHsRF5ggnZ2nBwa8pVvqT4yTyOkw85Xa1no
 v7L//lzjp6NsIuOmtCTYErkA3mtGSXQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-PPQgCCwmOL-FxfOAhJBU8g-1; Fri, 15 Aug 2025 11:40:31 -0400
X-MC-Unique: PPQgCCwmOL-FxfOAhJBU8g-1
X-Mimecast-MFC-AGG-ID: PPQgCCwmOL-FxfOAhJBU8g_1755272430
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-244581187c6so23871735ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 08:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755272430; x=1755877230;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2shLWe0BUVvsKwtzCIiYcr9t5BEPaphZXfmxyJe3R0=;
 b=HdVtmlN46SZ1wdo3i4b2F3NMTOZX0z8S54uXNkqLWqjPHYsaNE/na5WnEb7KHKXNuS
 dLy9Eob597cgz4hl60hIjz9GOiuo932+qMaEsTRk3Xka4azhpUfmKee2ti6q992qLtLv
 14gYUlGlXXDh4wXzS060a4RnvcDMtWJ3KpxBGiw1fVmQWehTQS5YHlX2CfbH9+iYXTeV
 6/sUTN0QGCUxw2e1eBCpwshZWH9Zt4n3R4eK2IvLfWt6kvjm7k7t/ThOrdODQ4FuH+Vd
 wprZMtb1DjHtSjC7IV/K5NHwhpTV4JAXV8k7ajZCnhOY+FK1gtEKrTVV38E628egLLuq
 uSRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZlYtpomV3G9TJXN+zJSdsG8PlEDdI3pVT49RREsSUcNwOYl1OHqzXpo2WaUhAXGF6yJpkjnMR/As5G4zVrUu3@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxAP02xxk18CwqahylT2U16iqSeNQV+0YX7768lQ032uCI/caG5
 QZCAaTSBI98RCPPUkddUMHb9LiqGdCBHFDvBgBhp4qZvK+ZmpPCaH/2lJd+h+s7TBnT7lYwr5E7
 ZeMDzMJeYQyN3I0mLenlyWbC7RXT2Xt4bqMFA/OlBILZHqWqeLyKhBYYRkPa8HNH07YOhCNhWqt
 UJyFk=
X-Gm-Gg: ASbGncuo80tNKSVTp6Ve8sO9iRYCo+wiL0yN5TVV5wNP7HA1nQxehNjHo5Ynk/NCFNC
 oaSm1Mhofljs5qK+tF73QmDq7hsg1Hkvhh1Wq32e2r1NTahGlUdKI4y2xmInE3UYIKfZ5l2mjpy
 q3xHOxM6ORsf4es8LrpcU3TN+zM8qUNv8x7LXKW20Nh0t++RduXCfFUpOiqBcP2gutDdxC5QLd+
 4jAZUxAGcABGAt6CHN41GueI6q2GQ6odUfLeNdqusXgQJkT9ytyXEAACp8eN9j8mKAvRAyM8SZs
 WG4F4sO+/fZf1cEcvpgRFtUeH+EHdZXY0rJnaUhNeyHBxyokSLN3u7w19AaX31B0ojoL1uGXbIa
 2RwuT
X-Received: by 2002:a17:903:46cb:b0:242:accd:bbe8 with SMTP id
 d9443c01a7336-2446d86b233mr36533005ad.36.1755272429991; 
 Fri, 15 Aug 2025 08:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpG2P8TCPc/yq2zXXGVka9uGeMsSuVQPEBzLFlufmsjARUsak3MTv6Hk5VgKCF9aqaahyycA==
X-Received: by 2002:a17:903:46cb:b0:242:accd:bbe8 with SMTP id
 d9443c01a7336-2446d86b233mr36532615ad.36.1755272429565; 
 Fri, 15 Aug 2025 08:40:29 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9ef62sm16642255ad.6.2025.08.15.08.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 08:40:28 -0700 (PDT)
Date: Fri, 15 Aug 2025 23:40:24 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250815154024.kwpudb7uz4mt2nhr@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250815081405.2523015-1-chao@kernel.org>
 <20250815081405.2523015-3-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250815081405.2523015-3-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wqwv0T432mPz4B6h4irMSZ2lSeboaaTGTNbn5Y8RpzU_1755272430
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 15, 2025 at 04:14:05PM +0800, Chao Yu wrote: >
 This is a regression test: > 1. create directory > 2. add a new xattr entry
 to create xattr node > 3. use inject.f2fs to inject nid of xattr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umwXn-0006De-8a
Subject: Re: [f2fs-dev] [PATCH v3 3/3] f2fs/020: do sanity check on
 i_xattr_nid
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@redhat.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 15, 2025 at 04:14:05PM +0800, Chao Yu wrote:
> This is a regression test:
> 1. create directory
> 2. add a new xattr entry to create xattr node
> 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
> 4. check whether f2fs kernel module will detect and report such
>    corruption in the file
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - fix mount option
> - check return value of inject.f2fs
>  tests/f2fs/020     | 51 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/020.out |  2 ++
>  2 files changed, 53 insertions(+)
>  create mode 100755 tests/f2fs/020
>  create mode 100644 tests/f2fs/020.out
> 
> diff --git a/tests/f2fs/020 b/tests/f2fs/020
> new file mode 100755
> index 00000000..38bc6582
> --- /dev/null
> +++ b/tests/f2fs/020
> @@ -0,0 +1,51 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/020
> +#
> +# This is a regression test:
> +# 1. create directory
> +# 2. add a new xattr entry to create xattr node
> +# 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
> +# 4. check whether f2fs kernel module will detect and report such
> +#    corruption in the file
> +#
> +. ./common/preamble
> +_begin_fstest auto quick rw
> +
> +. ./common/attr
> +
> +_fixed_by_kernel_commit 061cf3a84bde \
> +	"f2fs: fix to do sanity check on ino and xnid"
> +
> +_require_scratch_nocheck
> +_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_attrs user
> +
> +# remove all mkfs options to avoid layout change of on-disk inode
> +export MKFS_OPTIONS=""
> +
> +testdir=$SCRATCH_MNT/testdir
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount "-o user_xattr,noinline_xattr"
> +
> +mkdir $testdir
> +# add a new xattr entry to create xattr node
> +$SETFATTR_PROG -n user.abc -v 123 $testdir
> +
> +_scratch_unmount
> +
> +# inject i_xattr_nid w/ nid of inode node
> +$F2FS_INJECT_PROG --node --mb i_xattr_nid --nid 4 --val 4 $SCRATCH_DEV >> $seqres.full || _fail "failed to inject"

If you'd like to deal with that _require_inject_f2fs_command (what ever name) things
in another separated patchset, this patch is good to me.

Reviewed-by: Zorro Lang <zlang@redhat.com>

> +
> +_scratch_mount "-o acl,user_xattr"
> +# may potentially trigger a deadlock w/ double inode_lock on parent's inode
> +mkdir $testdir/dir >> $seqres.full 2>&1
> +_scratch_unmount
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/020.out b/tests/f2fs/020.out
> new file mode 100644
> index 00000000..20d7944e
> --- /dev/null
> +++ b/tests/f2fs/020.out
> @@ -0,0 +1,2 @@
> +QA output created by 020
> +Silence is golden
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
