Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2642A5CAE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Nov 2020 03:29:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ka8Y5-00019r-Dh; Wed, 04 Nov 2020 02:29:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ka8Y4-00019k-KN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 02:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Knza/ewcgshF8lMqycVcm7mlIJXnFgmJ6yQV/T16U+Q=; b=ZQdQ+LbYMY5YZtk/cVLGH2chT7
 ADYFDF5P+w0u83DVPz4TpgwvRhmzERgb6e+hNTwzRfYIIWW36Kq5eqsv+R4LajE6ExA6d9Uh6yCWG
 7bulD8wN17GDQW1iaU/rnt45zTr7kp4+yvEdHAltzhZ3VtL5UTu7QajO+DL/EqZLkMsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Knza/ewcgshF8lMqycVcm7mlIJXnFgmJ6yQV/T16U+Q=; b=imS431Hsw0KnvG5yET935Qwpvu
 VYy54vSg/AOCB1jOoUWfhLaTvJxFcJxfg6riB6gmndNyFxgD5DVo+UHHIMH/S52s6Cv/79l1NKnQu
 +KBR0RrI+o5MZYhq99z7WztwXOSga3bwXExtlHCqhTHmooNsDNTV1sXAzYMKoTjGq+Wc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ka8Xz-000i6F-EW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 02:29:20 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D861C216C4;
 Wed,  4 Nov 2020 02:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604456950;
 bh=2ZfJqIORjLB7q6zIRwiMeO00SRx9XOpoB4zxqcAStZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JUbc06gcfBLn8oELert5Splrgauetjeyxyh9ubPz1PBQ2Bjm7XHR0I2uod6IRs2XE
 i/dA/HaJqxwKJ+pcRpLYr+7KSW6WopibJ5K3yrQBVW2cAjWnHU2QL2hx/+b6brHtMv
 YHVYFNlOTWVA7DSDUjnGQ7mltm/2DrNMsC/paekY=
Date: Tue, 3 Nov 2020 18:29:08 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201104022908.GA832@sol.localdomain>
References: <20201104021906.108534-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104021906.108534-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ka8Xz-000i6F-EW
Subject: Re: [f2fs-dev] [PATCH RFC] f2fs: fix compat F2FS_IOC_{MOVE,
 GARBAGE_COLLECT}_RANGE
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 04, 2020 at 10:19:06AM +0800, Chao Yu wrote:
> Eric reported a ioctl bug in below link:
> 
> https://lore.kernel.org/linux-f2fs-devel/20201103032234.GB2875@sol.localdomain/
> 
> That said, on some 32-bit architectures, u64 has only 32-bit alignment,
> notably i386 and x86_32, so that size of struct f2fs_gc_range compiled
> in x86_32 is 20 bytes, however the size in x86_64 is 24 bytes, binary
> compiled in x86_32 can not call F2FS_IOC_GARBAGE_COLLECT_RANGE successfully
> due to mismatched value of ioctl command in betweeen binary and f2fs
> module, similarly, F2FS_IOC_MOVE_RANGE will fail too.
> 
> In this patch we introduce two ioctls for compatibility of above special
> 32-bit binary:
> - F2FS_IOC32_GARBAGE_COLLECT_RANGE
> - F2FS_IOC32_MOVE_RANGE
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> 
> Jaegeuk, Eric,
> 
> I have no 32-bit machine now, so I don't run any test on this patch,
> please take a look at this RFC patch first.

You can test this by running a 32-bit binary on a machine with a 64-bit kernel.
E.g. on x86_64, compile a binary with 'gcc -m32'.

>  #ifdef CONFIG_COMPAT
> +static int f2fs_compat_ioc_gc_range(struct file *file, unsigned long arg)
> +{
> +	struct compat_f2fs_gc_range __user *urange;
> +	struct f2fs_gc_range range;
> +	int err;
> +
> +	urange = compat_ptr(arg);
> +	err = get_user(range.sync, &urange->sync);
> +	err |= get_user(range.start, &urange->start);
> +	err |= get_user(range.len, &urange->len);
> +	if (err)
> +		return -EFAULT;
> +	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(file)))))
> +		return -EIO;
> +	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(file))))
> +		return -ENOSPC;
> +	return f2fs_ioc_gc_range(file, (unsigned long)&range);
> +}

This won't work because f2fs_ioc_gc_range() expects a user pointer.  You'll need
to make the native and compat versions do the copy from user separately, and
have them call a helper function that takes a pointer to the argument in kernel
memory.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
