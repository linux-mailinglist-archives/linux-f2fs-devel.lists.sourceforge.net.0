Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5411770B328
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 May 2023 04:23:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q0vCT-0005UX-OQ;
	Mon, 22 May 2023 02:23:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiubli@redhat.com>) id 1q0vCS-0005UR-1d
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 02:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6gCnSvHg5O9ml4/OuYzbyOxwskor4dFbbIHvczRVaEk=; b=gNXew06koYpN31piPdAFm8b/7t
 21X0HgEhFP55TkAZ7uDokpgoskIh36Y1g4C8CcFv18dC8XPKT3sfws1gaLS3Ofhxt4vIJ/1aqWpKr
 mXmdrY2S1xapqNoTkega+xNQPu3gC2NFtUoU25ercreRfgDBelpxlCvX3HPolDFE4mwI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6gCnSvHg5O9ml4/OuYzbyOxwskor4dFbbIHvczRVaEk=; b=QhZ8r4UGizf8VzoChT0uabB2kS
 1poiX69NQ5PiWbnyik085KdYfTYE4CCtceW1RuMCatZ1DygsPj7mOiluoX8FNSakrz/wfRkX6hVqq
 MnFyVInEw3N0lnjzpGYwXZYTwDO618T7Y6fYhDXaVUGcYxm0DH3xqCAYbOAgpPRqxl6M=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q0vCO-00FM7k-Jm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 02:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684722174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6gCnSvHg5O9ml4/OuYzbyOxwskor4dFbbIHvczRVaEk=;
 b=RobspGm3+bSGNagOU7fC7pFLucpKSzZAnFz7yRVjVRFbdYz+fu/xH6EnpDkcv5TiOtF7KC
 7lOHk0a4i21LnzBFfuVoH8pSvG3MihCn0DE478+I+GNGDVIOCFhleUU6JEwLKj49IVcpYP
 05cX7dEXR0sRnndr/aaQQLcMDjw8kQQ=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-655nj2pMNsakPWDtjVW_Bg-1; Sun, 21 May 2023 22:22:52 -0400
X-MC-Unique: 655nj2pMNsakPWDtjVW_Bg-1
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-517c06c1a1bso2944676a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 21 May 2023 19:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684722171; x=1687314171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6gCnSvHg5O9ml4/OuYzbyOxwskor4dFbbIHvczRVaEk=;
 b=Dr6zb61dUQ7X8qiIXFzE5tlt0sgwFUlWo+A2ea3q3UwaiKs/yHlwYUu11+pqaVg0i/
 ZxVceHwnjjoOAuwyPJWKHhNkG09x9FleMWGLHQqqSVuobVtGXWYfh/pj+ypf2aCuDnaI
 ka74ozm5oY/c6JgeTG70X7nUrM2TqH0OEjUksqxVjEfUhYz5AYeeWBQArMCzds/TuH0o
 w20c/hHunwpebuMgdiQ6dtJOiVLF+0S6CqH+Kie5MZwRJItansm+bwVEWdbsEinp3sPV
 VDhwxxTVIspeqodhUN6SF+3W7GojA6pXwLgwhuUDS3UQ+ex0ZE5KyXJ2U/+yG0tbRXwh
 Znwg==
X-Gm-Message-State: AC+VfDzMhbbnNl6QN8G1/NvUaQSJkIzE9Co4ZKSetB7geX0Um/xcmNZI
 zLyKJioQ34VoLI6oLfE9JBapqOKBQU+uOqY7R4AGKyUVDpYmUDAyChDsJzGZGLBz4rIwxiyz3oX
 IV+ZBNyd4oSKkQ8Pc78NBZGHPZJF/TZEBQQHD0g==
X-Received: by 2002:a05:6a20:428a:b0:10b:e54f:1c00 with SMTP id
 o10-20020a056a20428a00b0010be54f1c00mr597193pzj.57.1684722171604; 
 Sun, 21 May 2023 19:22:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6YIe9VLQS6yzKMQ0WkmEEqdfd17sZ9Y4FgV9G2cXXtS6sfNqDs6Fii9g74G57D4O2vtAJBpQ==
X-Received: by 2002:a05:6a20:428a:b0:10b:e54f:1c00 with SMTP id
 o10-20020a056a20428a00b0010be54f1c00mr597169pzj.57.1684722171305; 
 Sun, 21 May 2023 19:22:51 -0700 (PDT)
Received: from [10.72.12.68] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a631d16000000b0050be8e0b94csm3281962pgd.90.2023.05.21.19.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 19:22:50 -0700 (PDT)
Message-ID: <25ae2aff-daab-eaa3-19dd-aa5e56c9b6f1@redhat.com>
Date: Mon, 22 May 2023 10:22:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-4-hch@lst.de>
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <20230519093521.133226-4-hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/19/23 17:35,
 Christoph Hellwig wrote: > Move the assignment
 to current->backing_dev_info from the callers into > generic_perform_write
 to reduce boiler plate code and reduce the scope > to just a [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q0vCO-00FM7k-Jm
Subject: Re: [f2fs-dev] [PATCH 03/13] filemap: assign
 current->backing_dev_info in generic_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 5/19/23 17:35, Christoph Hellwig wrote:
> Move the assignment to current->backing_dev_info from the callers into
> generic_perform_write to reduce boiler plate code and reduce the scope
> to just around the page dirtying loop.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   fs/ceph/file.c | 4 ----
>   fs/ext4/file.c | 3 ---
>   fs/f2fs/file.c | 2 --
>   fs/nfs/file.c  | 5 +----
>   mm/filemap.c   | 2 ++
>   5 files changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index feeb9882ef635a..767f4dfe7def64 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -1791,9 +1791,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	else
>   		ceph_start_io_write(inode);
>   
> -	/* We can write back this queue in page reclaim */
> -	current->backing_dev_info = inode_to_bdi(inode);
> -
>   	if (iocb->ki_flags & IOCB_APPEND) {
>   		err = ceph_do_getattr(inode, CEPH_STAT_CAP_SIZE, false);
>   		if (err < 0)
> @@ -1938,7 +1935,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		ceph_end_io_write(inode);
>   out_unlocked:
>   	ceph_free_cap_flush(prealloc_cf);
> -	current->backing_dev_info = NULL;
>   	return written ? written : err;
>   }
>   
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 50824831d31def..3cb83a3e2e4a2a 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -29,7 +29,6 @@
>   #include <linux/pagevec.h>
>   #include <linux/uio.h>
>   #include <linux/mman.h>
> -#include <linux/backing-dev.h>
>   #include "ext4.h"
>   #include "ext4_jbd2.h"
>   #include "xattr.h"
> @@ -285,9 +284,7 @@ static ssize_t ext4_buffered_write_iter(struct kiocb *iocb,
>   	if (ret <= 0)
>   		goto out;
>   
> -	current->backing_dev_info = inode_to_bdi(inode);
>   	ret = generic_perform_write(iocb, from);
> -	current->backing_dev_info = NULL;
>   
>   out:
>   	inode_unlock(inode);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 9e3855e43a7a63..7134fe8bd008cb 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4517,9 +4517,7 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
>   	if (iocb->ki_flags & IOCB_NOWAIT)
>   		return -EOPNOTSUPP;
>   
> -	current->backing_dev_info = inode_to_bdi(inode);
>   	ret = generic_perform_write(iocb, from);
> -	current->backing_dev_info = NULL;
>   
>   	if (ret > 0) {
>   		f2fs_update_iostat(F2FS_I_SB(inode), inode,
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 3cc87ae8473356..e8bb4c48a3210a 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -648,11 +648,8 @@ ssize_t nfs_file_write(struct kiocb *iocb, struct iov_iter *from)
>   	since = filemap_sample_wb_err(file->f_mapping);
>   	nfs_start_io_write(inode);
>   	result = generic_write_checks(iocb, from);
> -	if (result > 0) {
> -		current->backing_dev_info = inode_to_bdi(inode);
> +	if (result > 0)
>   		result = generic_perform_write(iocb, from);
> -		current->backing_dev_info = NULL;
> -	}
>   	nfs_end_io_write(inode);
>   	if (result <= 0)
>   		goto out;
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 4d0ec2fa1c7070..bf693ad1da1ece 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3892,6 +3892,7 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
>   	long status = 0;
>   	ssize_t written = 0;
>   
> +	current->backing_dev_info = inode_to_bdi(mapping->host);
>   	do {
>   		struct page *page;
>   		unsigned long offset;	/* Offset into pagecache page */
> @@ -3956,6 +3957,7 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
>   
>   		balance_dirty_pages_ratelimited(mapping);
>   	} while (iov_iter_count(i));
> +	current->backing_dev_info = NULL;
>   
>   	if (!written)
>   		return status;

LGTM.

Reviewed-by: Xiubo Li <xiubli@redhat.com>

Thanks

- Xiubo




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
