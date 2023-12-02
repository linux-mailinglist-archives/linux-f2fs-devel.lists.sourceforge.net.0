Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F07F4801A47
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Dec 2023 04:53:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r9H3h-0004hY-3T;
	Sat, 02 Dec 2023 03:52:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1r9H3f-0004hS-MZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Dec 2023 03:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cwbvB8EYcD7W+lrCKHJVPZWpaw7zxUpag8CLX7nly6k=; b=VOXoiRHMo+cgflFQ+9MdtC8Au3
 KAa6BjlnTsro4Yk1CvBJIriXRB46voUISaqyJCW9V0o5nW/s8G3Paxsx4QdxCMDxifQFVeV18P0h7
 87cgTiDU0rN24pdGa5gMOJaeaasMvvQvdK1yULiQLOJCMvGxtfdREn0bN5RWYIp4Cce0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cwbvB8EYcD7W+lrCKHJVPZWpaw7zxUpag8CLX7nly6k=; b=H14m02ShiAKjsRFy4FpZQSFvHF
 ZfXS8Fu0CRqJJqKpT4DSclgjSvVRSsdVp/AOLuRXzKFuso/HRQG62GgPZlb7EJgUTkhnNRplqE5fC
 DvnNRdc2XeuppQVekyed0zfFH4OG0dJawB1IVaQGui6dvutg9UmiZbcKkZa6lTY1ZU3A=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r9H3f-0006LI-An for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Dec 2023 03:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 626EFCE28E6;
 Sat,  2 Dec 2023 03:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788CFC433C7;
 Sat,  2 Dec 2023 03:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701489151;
 bh=5DQc1mOWcsTDXpyiHSerNZx+ehkcdBrL+QVWurjwA8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cdtDKs2SVnXzus+bjT+foTkDMO2BdnkqVjvd9mr6SUuW0Z72upvKEiRzZnJgme3ip
 WfDaGNJIkRsdmet17u1wzDSWFu9UxVg8rFGxXuftKNXXUFPfufN7HR9LbVIoVRfMnL
 F0U9z5bFRWDn8+3E9IFhzm9PF54xT2kXfBcPiKQJuWzGe43/VpDwykcYYiLhMHs6g8
 vT/Em5Ux38sXz24j88Z+E+EA2Vb2+1Sqooh1iWffYs3i6Z0b+AmnxAb9pHtc5CT98w
 Eoq1xJmdvLXcf6UYNvILWJqsRMMXmFr6qEbsOWky2ONE4SVxgAYHkZYV0VrMQ59Nzp
 VQN/mQoHzTpoA==
Date: Fri, 1 Dec 2023 19:52:29 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20231202035229.GA41173@sol.localdomain>
References: <20231202030347.2330936-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231202030347.2330936-1-drosen@google.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 01, 2023 at 07:03:47PM -0800, Daniel Rosenberg
 via Linux-f2fs-devel wrote: > + /* For compatibility with 4K crypto unit
 size, we must restrict > + * the max filesize to what can fit within [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r9H3f-0006LI-An
Subject: Re: [f2fs-dev] [PATCH] f2fs: Restrict max filesize for 16K f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 01, 2023 at 07:03:47PM -0800, Daniel Rosenberg via Linux-f2fs-devel wrote:
> +	/* For compatibility with 4K crypto unit size, we must restrict
> +	 * the max filesize to what can fit within U32_MAX 4K units.
> +	 * Since the blocksize must currently be equal to the page size,
> +	 * we can grab that from there. inode is NULL when setting up
> +	 * the superblock.
> +	 */
> +
> +	result = min(result, ((loff_t) U32_MAX * 4096) >> PAGE_SHIFT);

This should be formatted like:

	/*
	 * For compatibility with ...
	 */
	result = ...

Also, the comment should mention that this is for the IV_INO_LBLK_64 and
IV_INO_LBLK_32 encryption settings.  There is no issue with the default
encryption setting.

Also, use F2FS_BLKSIZE_BITS instead of PAGE_SHIFT?

Also, the commit message could use:

	Fixes: d7e9a9037de2 ("f2fs: Support Block Size == Page Size")

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
