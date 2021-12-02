Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0314664E2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 15:04:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1msmhP-0007n1-97; Thu, 02 Dec 2021 14:04:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1msmhO-0007mv-E5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 14:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=elcFJP4tShqU1xBgHrUQB6kdWN2w+uj0gsTKiDnTgUc=; b=FE+cGJ9DSe21Q6NW73lwbhYrrE
 KLTTx0sX3v2DRJ4v5WndJFRc1toMWg8nhtFYseq6jWpe9pqvndl2fD1gpo/X98FWci/CiWuI+BL/P
 YQEHHByv1OJfb52pV7SQ5C0bfEcz2SOhWoN2c9M9WZG5BMjUo/sjYGhWwN+paJE+ItTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=elcFJP4tShqU1xBgHrUQB6kdWN2w+uj0gsTKiDnTgUc=; b=ehSkiWXgdcx8ehM3zxodbMkesj
 p0Ef4Zlmomt1bwaETR+dhXdO4o5xugVyLdQL96upapLvdbeM1ajYHscjvReWsexQ+OhjORWElptPi
 zGOgEovmdo5tUFHJAZIIDgezVVoaJJMTyI4KWpQEWcp6kB3DcTJRb+48plkXoNixFlqM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1msmhM-0000Zl-2i
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 14:04:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5A3CACE21BE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Dec 2021 14:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80C2C00446;
 Thu,  2 Dec 2021 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638453855;
 bh=5v11wuwoWmcBaHc5VRNqR3MfF8jXLA5MgIqvuA5C/UM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tgSj4VgQZ8YFojjMD128a/fjnqh4u4zKL6lc+xauUDAYNp3p1p6ZfBfjoCRvYWUif
 sya/XFZ52eFnLz5qhdLGqoToZ7W8j2CUDPGbUmcjo4mRaSSk9OH3Zfpb3vkvHTEVUt
 0ZkKawR/S97teDiKIVbR/IoADenvFkeRFDOBf5Uu4PRoimS3rLyvXIFiDN8jMkRg7o
 JNDo05Z1sHfukPbMiofWgcowXu0HfFc8QQdZ2oQbVB4X60e4u36SoIhEC6Y1HDrzx6
 HwkMOhTt/WkQt45ma6GZjI2Bj6WnNuhNy27ZeaAoSQRXrDFkYibJmNm56Y1Dq+bLOV
 5l+BKzAjSPVyA==
Message-ID: <1ba0f002-42c7-b085-0c54-6071664ba79b@kernel.org>
Date: Thu, 2 Dec 2021 22:04:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-5-jaegeuk@kernel.org>
 <b36e2d44-4834-3931-6a32-4fa52d1d7785@kernel.org>
 <YahIf3UlhuxJT1O4@sol.localdomain>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YahIf3UlhuxJT1O4@sol.localdomain>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/2 12:15, Eric Biggers wrote: > On Thu, Dec 02,
 2021 at 11:10:41AM +0800, Chao Yu wrote: >> Why not relocating this check
 before f2fs_map_blocks()? Wait, it supports DIO in multi-device image after
 commit 71f2c8206202 ("f2fs: multidevice: support direct IO"),
 how about checking with f2fs_allow_multi_device_dio()? 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1msmhM-0000Zl-2i
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: implement iomap operations
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/12/2 12:15, Eric Biggers wrote:
> On Thu, Dec 02, 2021 at 11:10:41AM +0800, Chao Yu wrote:
>> Why not relocating this check before f2fs_map_blocks()?

Wait, it supports DIO in multi-device image after commit 	71f2c8206202 
("f2fs: multidevice: support direct IO"), how about
checking with f2fs_allow_multi_device_dio()?

Thanks,

>>
>> Thanks,
>>
>>> +		iomap->bdev = inode->i_sb->s_bdev;
> 
> Are you talking about the check for !f2fs_is_multi_device()?  It could go in
> either location, but I think it makes the most sense to have it right before the
> line that uses 'inode->i_sb->s_bdev', since that is the place which makes the
> assumption that the filesystem has only one block device.
> 
> - Eric
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
