Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B26193712
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 04:32:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHJFt-0001AM-V3; Thu, 26 Mar 2020 03:32:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jHJFr-0001AD-EI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 03:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hUI1PCTRGSZZRj13nFvuvdcsKuKC6Lxu52tmpUuu5fU=; b=T04/FwQmfNKWKphoZVoLS+0TcN
 o33+CYVCCScAkbpiu4XzXgP2HSI3GnoOZ0NdPj9/5VRXkK5Tg67mwN3boOODD7bhbk+7EabvymiFh
 dbT238pWdtx0PHMtsQYIoYrxdarMCwpi5epjUAqh8PoeSUgRbMHRUfbPvcwsPI2b/kjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hUI1PCTRGSZZRj13nFvuvdcsKuKC6Lxu52tmpUuu5fU=; b=lMkVKmiiFRfIx81a8CTxvqyY/z
 YrSg0NiGxaCS+uV9rdmEIS6fD4dp0a/nnzWVMadTdlLEBgE94rAerxBM7E6GsPHHTOqrrWAq2TiYw
 d0V7vH2LB7HWFwHkBlogySfX044+sth+Zf7PgOigs4/CyVnUwU0fFWE3bM5YOYU29UM4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHJFn-0044q8-4t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 03:32:27 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A16420714;
 Thu, 26 Mar 2020 03:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585193535;
 bh=H8MDjdXMw4UeC+MDo5AJWCDIbLhr8JiIlIAwI10Z+3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qdxCTCnYYLrmrKMHD7/C7aC7RtVoeokIKBRmSJcTFqfSg9L9He24K/ah36MPQA3J8
 hNdqhPOPnhM8LjHvJeo+1gCJB8VLyKZxaHrhIfFzALZHKEGtdbRmyD29DexWUDhKHI
 7oPVsvCKfts7FBULpKTEy/kFk+tw/RlESgcqi/y0=
Date: Wed, 25 Mar 2020 20:32:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200326033214.GA858@sol.localdomain>
References: <20200326030702.223233-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326030702.223233-1-satyat@google.com>
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
X-Headers-End: 1jHJFn-0044q8-4t
Subject: Re: [f2fs-dev] [PATCH v9 00/11] Inline Encryption Support
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

On Wed, Mar 25, 2020 at 08:06:51PM -0700, Satya Tangirala wrote:
> This patch series adds support for Inline Encryption to the block layer,
> UFS, fscrypt, f2fs and ext4.
> 

This patch series can also be retrieved from

        Repo: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
        Tag: inline-encryption-v9

I based it on v5.6-rc2 (same base commit as v7 and v8) since it still applies
cleanly to it.  You can see what changed from v8 by:

        git diff inline-encryption-v8..inline-encryption-v9

or from v7 by:

        git diff inline-encryption-v7..inline-encryption-v9

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
