Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7564C976256
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 09:14:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soe2G-0002Du-Ca;
	Thu, 12 Sep 2024 07:14:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1soe2E-0002Dn-Fv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 07:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GnOd1Kn77Xp8EZEniHYN06GmSJ+gyPOcYoqS9AtuvQA=; b=UHnwYLmeD2Jue+ZlM6IqT8d1ew
 BdjOin5lBnQT7WB7rqj7nIve8YFy4hoOfvFFTIziOV+wGbyyAMfHgrc8DPplJs01D2YnXB0ZwkS3s
 ozk8sBVmbvBg49jRfwKOnYLUIm1e13L3ce/jnrbqnYm1zWOyI62VKfayP5ktBZ5a+utQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GnOd1Kn77Xp8EZEniHYN06GmSJ+gyPOcYoqS9AtuvQA=; b=SWqtndl3YDNKpY40sss0cVrosw
 LI5sTsUcDPf9rqXDqpvUOdea7SI0ToiPy9YSr3BHsX2HGEHhd3I+YQg/fPDk3t3bR0HUlw2d5ql9d
 5ESGie6UggkXXOktvODmWN4mP46Ejqi2TsitVFJM7oRzIerrsunNBpq3IcJbNqxOhMlI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soe2D-0000Go-MB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 07:14:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2B9D1A4402D;
 Thu, 12 Sep 2024 07:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E1AC4CEC3;
 Thu, 12 Sep 2024 07:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726125267;
 bh=ZA9BLxD+lQ9n6b28gDkrvcFthmnuikCEMekpEbh0DG8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Pa+3LdMJCowinybpA2znB7wcPMIXLIrrOvTLqsyo8CAXaDwGitwW2WGTHTFxIvDmS
 38ikG4e/ucuwUbhydWUy2iqV2G5vgo52cA0ubLsKAsKTdfJxomzXwXTDMg6RQYbq7l
 2h+CGZ9IBWw/BBU+NY0KhSMl/Fd+j71/+vM288l+lUthkAsu2rgHr03AA0pWnfnKlL
 Ex8w+ICqAD7dvJGy0JOGfKLEUYTE9Gjy9bYKkrApJ2Y7DXneF8EPK9jMu/JthOQV/t
 N0eFQiaF0aMR6/5rKRq6Esg7BlgqNeqjz5GSGO8TC1FNhx2wvyvzNH4u0+WGEoieMb
 a30ABy3GiOtug==
Message-ID: <679c7dae-91c4-4ad0-a2cb-55dc92b47fd4@kernel.org>
Date: Thu, 12 Sep 2024 15:14:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wu Bo <bo.wu@vivo.com>, linux-kernel@vger.kernel.org
References: <cover.1726024116.git.bo.wu@vivo.com>
Content-Language: en-US
In-Reply-To: <cover.1726024116.git.bo.wu@vivo.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/11 11:57, Wu Bo wrote: > The inode in F2FS occupies
 an entire 4k block. For many small files, this means > they consume much
 more space than their actual size. Therefore, there is > signific [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1soe2D-0000Go-MB
Subject: Re: [f2fs-dev] [PATCH v2 00/13] f2fs: introduce inline tail
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/9/11 11:57, Wu Bo wrote:
> The inode in F2FS occupies an entire 4k block. For many small files, this means
> they consume much more space than their actual size. Therefore, there is
> significant potential to better utilize the inode block space.
> 
> Currently, F2FS has two features to make use of the inode block space: inline
> data and inline xattr.
> 
> Inline data stores file which size is smaller then 3.5k in inode block. However,
> for slightly larger small files, there still have much waste.
> For example, a 5k file requires 3 blocks, totaling 12k of space, which is
> more than twice the size of the file itself!
> 
> Additionally, the end of a file often does not occupy an entire block. If we can
> store the end of the file data within the inode block, we can save an entire
> block for the file. This is particularly important for small files.
> 
> In fact, the current inline data is a special case of inline tail, and
> inline tail is an extension of inline data.
> 
> To make it simple, inline tail only on small files(<64k). And for larger files,
> inline tails don't provide any significant benefits.
> 
> The layout of an inline tail inode block is following:
> 
> | inode block     | 4096 |     inline tail enable    |
> | --------------- | ---- | --------------------------|
> | inode info      | 360  |                           |
> | --------------- | ---- | --------------------------|
> |                 |      | extra info         | 0~36 |
> |                 |      | **compact_addr[16] | 64   |
> | addr table[923] | 3692 | reserved           | 4    |
> |                 |      | **tail data        |      |
> |                 |      | inline_xattr       | 200  |
> | --------------- | ---- | --------------------------|
> | nid table[5]    | 20   |
> | node footer     | 24   |
> 
> F2fs-tools to support inline tail:
> https://lore.kernel.org/linux-f2fs-devel/20240903075931.3339584-1-bo.wu@vivo.com
> 
> I tested inline tail by copying the source code of Linux 6.9.7. The storage
> space was reduced by approximately 8%. Additionally, due to the reduced IO, the
> copy time also reduced by around 10%.
> 
> This patch series has been tested with xfstests by running 'kvm-xfstests -c f2fs
> -g quick' both with and without the patch; no regressions were observed.
> The test result is:
> f2fs/default: 583 tests, 6 failures, 213 skipped, 650 seconds
>    Failures: generic/050 generic/064 generic/250 generic/252 generic/563
>        generic/735
>        Totals: 607 tests, 213 skipped, 30 failures, 0 errors, 579s

MKFS_OPTIONS  -- -O extra_attr,encrypt,inode_checksum,flexible_inline_xattr,inode_crtime,verity,compression -f /dev/vdc
MOUNT_OPTIONS -- -o acl,user_xattr -o discard,inline_tail /dev/vdc /mnt/scratch_f2fs

Before:
Failures: generic/042 generic/050 generic/250 generic/252 generic/270 generic/389 generic/563 generic/700 generic/735
Failed 9 of 746 tests

After:
Failures: generic/042 generic/050 generic/125 generic/250 generic/252 generic/270 generic/389 generic/418 generic/551 generic/563 generic/700 generic/735
Failed 12 of 746 tests

Failures: f2fs/004

Can you please check failed testcases?

Thanks,

> 
> ---
> v2:
> - fix ARCH=arc build warning
> 
> ---
> Wu Bo (13):
>    f2fs: add inline tail mount option
>    f2fs: add inline tail disk layout definition
>    f2fs: implement inline tail write & truncate
>    f2fs: implement inline tail read & fiemap
>    f2fs: set inline tail flag when create inode
>    f2fs: fix address info has been truncated
>    f2fs: support seek for inline tail
>    f2fs: convert inline tail when inode expand
>    f2fs: fix data loss during inline tail writing
>    f2fs: avoid inlining quota files
>    f2fs: fix inline tail data lost
>    f2fs: convert inline tails to avoid potential issues
>    f2fs: implement inline tail forward recovery
> 
>   fs/f2fs/data.c     |  93 +++++++++++++++++++++++++-
>   fs/f2fs/f2fs.h     |  46 ++++++++++++-
>   fs/f2fs/file.c     |  85 +++++++++++++++++++++++-
>   fs/f2fs/inline.c   | 159 +++++++++++++++++++++++++++++++++++++++------
>   fs/f2fs/inode.c    |   6 ++
>   fs/f2fs/namei.c    |   3 +
>   fs/f2fs/node.c     |   6 +-
>   fs/f2fs/recovery.c |   9 ++-
>   fs/f2fs/super.c    |  25 +++++++
>   fs/f2fs/verity.c   |   4 ++
>   10 files changed, 409 insertions(+), 27 deletions(-)
> 
> 
> base-commit: 67784a74e258a467225f0e68335df77acd67b7ab



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
