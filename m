Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B1392F600
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 09:12:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sSASD-0000P7-Uo;
	Fri, 12 Jul 2024 07:12:30 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sSASC-0000P0-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tT45xhPfs5bhRuOX9jMCvjwh/tZeGPyvk2XmihLPiaY=; b=ShTlXAg0EwATmHbD6QX7OSj1NE
 FNUdRk+RHYD+UWsf3orPzPLJMhyz8ksngLXamFoWVmfdQch+ADGn6vs2jDt45v0Z3kHbKugvFynRt
 c7lFO/xe7blMCcuAM3J6gvGaCOZ9cuj+3aWvJwUowAAqoIJ+iyq0gK5/DPWIEMmCfAEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tT45xhPfs5bhRuOX9jMCvjwh/tZeGPyvk2XmihLPiaY=; b=ixfGKxaRln4akGht0gZbZErg2C
 rfZ51wqQjFpTDzbH9TbFsoe8sOBi85F2Iz+A72/JayVdRzdET1977ft3yuuM49NwwJvtroxeWDoAw
 YyWJyqprk9N3AGmX0ChyKtPu7FoOcGnXo2J/hktZ0MwrpsfvcmzTpRmV37JVTgLSFPCo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sSASC-0004hY-R9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:12:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 33698CE140D;
 Fri, 12 Jul 2024 07:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8CEC3277B;
 Fri, 12 Jul 2024 07:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720768335;
 bh=p7bZwNIwfqiebUvE8LelOzg//t5QYg1L+hxJ8UHPRVA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Fc7jdzGbXkGIkBmfh8rfbzLmHt+A/Li6WuKA6UX7ZokTZQ0V2jyk5Bh1ZdXrCCovG
 dKsS7uCijcWn6SXG6dueSz3JNyk04WDaqmcaqf/tAn/JoyHmveQWa6ZcLqpF8UlVmv
 q6xkR66yHwM+RcEpn5WTCLBLnRKw9HH3alIX2fQL3W7fhdmDR3OhzTlwWQqPu1T6pj
 dpS6FNJ3dFu3DEzAtHXHu8odvK0FPFnEcuGmwZH2qhVospArvdqKCXvL8KvfXLk8VA
 SIw4kuPnX1c48+mFejaP7aHfJDupOHPGqv3/TrgxYB9uWrpAyhTUaWlR9kpnBkQ17a
 DIsARlVSa9SkA==
Message-ID: <2b5ab848-1ce1-4f5d-bb7f-2286bf76e6cf@kernel.org>
Date: Fri, 12 Jul 2024 15:12:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <cover.1720515215.git.bo.wu@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <cover.1720515215.git.bo.wu@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/10 9:33, Wu Bo wrote: > The inode in F2FS occupies
 an entire 4k block. For many small files, this means > they consume much
 more space than their actual size. Therefore, there is > significa [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sSASC-0004hY-R9
Subject: Re: [f2fs-dev] [RFC PATCH 0/5] Add inline tail support
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/10 9:33, Wu Bo wrote:
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
> To verify the benefits of inline tail, I have developed these preliminary codes.
> To make it simple, inline tail only on small files(<64k). And the layout of
> an inode block is following:
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
> I tested inline tail by copying the source code of Linux 6.9.7. The storage
> space was reduced by approximately 8%. Additionally, due to the reduced IO, the
> copy time also reduced by around 10%.

Wu Bo,

Thanks for the effort, but can you please change user-space tools as well?
since this patchset changes layout of inode.

Thanks,

> 
> Wu Bo (5):
>    f2fs: add inline tail mount option
>    f2fs: add inline tail disk layout definition
>    f2fs: implement inline tail write & truncate
>    f2fs: implement inline tail read & fiemap
>    f2fs: set inline tail flag when create inode
> 
>   fs/f2fs/data.c   | 61 ++++++++++++++++++++++++++++++++++++++++++++-
>   fs/f2fs/f2fs.h   | 44 ++++++++++++++++++++++++++++++++-
>   fs/f2fs/file.c   | 10 ++++++++
>   fs/f2fs/inline.c | 64 ++++++++++++++++++++++++++++++++----------------
>   fs/f2fs/inode.c  |  6 +++++
>   fs/f2fs/namei.c  |  3 +++
>   fs/f2fs/node.c   |  6 ++++-
>   fs/f2fs/super.c  | 15 ++++++++++++
>   8 files changed, 185 insertions(+), 24 deletions(-)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
