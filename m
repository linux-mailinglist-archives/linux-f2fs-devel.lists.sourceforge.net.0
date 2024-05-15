Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1258C5F09
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 03:59:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s73v6-0002Gu-Vg;
	Wed, 15 May 2024 01:59:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s73v6-0002Gj-00
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 01:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FH6TIEF8N8aJPi/x0cnfbgObFQSBh1YfL2aI+tIET0U=; b=jGzXPar7FN1Mwz9pTNC/qLBle/
 I3joAufRhlGwzi5g9+SGcr3CDgQkzW/sSTSP+bKVU3S3B/88tnSaxAmW+BuVbm722f5LZSjI9CHnr
 qc9WSQX1wUsfJrFSWpXUmejBBG/D/qZIFTRnBvwJGnriPIubKUPRMLL0V8Tp1EshaJz0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FH6TIEF8N8aJPi/x0cnfbgObFQSBh1YfL2aI+tIET0U=; b=Bz1QlsaQD+OAjA1mrAPIpgDq3d
 ZTfrYwlxZ/imF92LJLGnbSJ4faTRyM8MPP8jYLHTlVa5QUIMDbQkVPB5PLqanVBdNyS753J60LJOp
 rkPm6znO8ekdIvIT2OWc5eTu1p3hAjO4fPF0h9W7dm3l3NyxSceVjN9XeMb9DU2eot+4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s73v6-00010w-E0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 01:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 511176141C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2024 01:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCF8C2BD10;
 Wed, 15 May 2024 01:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715738333;
 bh=PiqmwQhY65nKtxuwnzFGkqzm42JUhIORrWtSpEC+A0Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aOn48PaQdT+XxcAIt1p61gKDTXfTX6N+XcZG7xVftr0H1XUMm8Z2Nbc3qdVwRm7tx
 om0hiTBWd02QVurgp9gkKS7c85yB15fBcK4nk4ujHYNcfZjWthbWzw7MtVGCiHNchk
 9+ahE0p+2xr6BPZgOYFNxClcYm50b1GIDsBHzpoDSqZblqPonKmiyh4XJPuCMGVO/6
 7ih0xgPgLVOGE0Rh1/r+xefLzjyjnHHZmOTz9MN2NgTmg/Rw2WhCBvVirUFPThf8J+
 oi2ClJkUwcSQvy3WVBLb3prsCq4lXnuvZGDQGX/D1skbhS7oBCJQokO926YGt3ctKZ
 eUxPiy/TD4XtA==
Message-ID: <77409343-8352-4738-b856-15bca01bef58@kernel.org>
Date: Wed, 15 May 2024 09:58:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nathan Chancellor <nathan@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240513-f2fs-add-missing-inline-to-f2fs_build_fault_attr-v1-1-c3ce1c995fa2@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240513-f2fs-add-missing-inline-to-f2fs_build_fault_attr-v1-1-c3ce1c995fa2@kernel.org>
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/13 23:40, Nathan Chancellor wrote: > When building
 without CONFIG_F2FS_FAULT_INJECTION, there is a warning > from each file
 that includes f2fs.h because the stub for > f2fs_build_fault_attr( [...] 
 Content analysis details:   (-6.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s73v6-00010w-E0
Subject: Re: [f2fs-dev] [PATCH] f2fs: Add inline to f2fs_build_fault_attr()
 stub
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
Cc: patches@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/13 23:40, Nathan Chancellor wrote:
> When building without CONFIG_F2FS_FAULT_INJECTION, there is a warning
> from each file that includes f2fs.h because the stub for
> f2fs_build_fault_attr() is missing inline:
> 
>    In file included from fs/f2fs/segment.c:21:
>    fs/f2fs/f2fs.h:4605:12: warning: 'f2fs_build_fault_attr' defined but not used [-Wunused-function]
>     4605 | static int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
>          |            ^~~~~~~~~~~~~~~~~~~~~
> 
> Add the missing inline to resolve all of the warnings for this
> configuration.
> 
> Fixes: 4ed886b187f4 ("f2fs: check validation of fault attrs in f2fs_build_fault_attr()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
