Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3580A8107A6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Dec 2023 02:29:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDE3l-0005Ft-KP;
	Wed, 13 Dec 2023 01:29:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rDE3j-0005Ff-7S
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 01:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tbLF/xRBGFXTbCeNMbw4obwrMHh3RCnWbBeVvi5hy6U=; b=UYr44qkCEVi+8PxP8CneYUDRwX
 LHdEZFpEWpgMFgXa+rddwqMMyhuNrYL0lrBG0uv1YwArTJ9H1qJ6Kw/KrMdLnRlA7LsC2N0sbH999
 RR9oOykQVsVoRMWqeGEBjlyq4y7wms3lyfwesLRcsa5kBIb+gf/G/B0ARL1nq22iLuT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tbLF/xRBGFXTbCeNMbw4obwrMHh3RCnWbBeVvi5hy6U=; b=l3L6ByZdvgECT8GOgVnmgHQUlv
 f8MkAhhpvdZNcWNq/g+KC4kESObmO23lXeEbkN334VS0OFlroTZyEzqQ8JsbLUyeLmCPO1xHXKSO2
 obP0rm5v0MymqhP5u2OcvJwzJug+r4k+GWfTkiykKJXWwZX0kUL8p1FPoFg5Aslp8KmQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDE3i-00033H-Th for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 01:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 24977B81ABD;
 Wed, 13 Dec 2023 01:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAF7C433C7;
 Wed, 13 Dec 2023 01:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702430934;
 bh=WHT7yhKML4b47HIYKO+zlfH79QBE5JY7QcP0BwiA0S8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uAlEUEW5DH1jtd23uEK97RhH1sMDjeaXr/+8cvWEY7H8DWnBRu9WYK4z+LquCqduC
 d5yOoh2A5t8B8EMIWYb/+gZFCeW5rcboH2p7gSXO7k25GkeuobI4SUO/xfBnDhwaT8
 fUZiN3mFTu1WTUG2y7Qcl9x7bDatbIycB9nt/X2REgZt3O28IeY5TyBq656pRLqcKe
 icG6X4V1+maL9YYYzcb/kUaOEQmH86ymexTx4y3DT7GOKfxEHKID7v/k+vrJNQWZxC
 cPxMaWP0rOWZdesc5wteOUYZpT0C/rtvPIDjL/xrl/6+iqFuJ+l4wQ6VzP4crWZvvv
 ywikPVplcPtzg==
Message-ID: <9dc77c35-bcb3-4a87-9926-36a0fa205d17@kernel.org>
Date: Wed, 13 Dec 2023 09:28:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1702347327-24181-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1702347327-24181-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/12 10:15, Zhiguo Niu wrote: > Should check return
 value of f2fs_recover_xattr_data in > __f2fs_setxattr rather than doing
 invalid
 retry if error happen. > > Also just do set_page_dirty in f [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDE3i-00033H-Th
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to check return value of
 f2fs_recover_xattr_data
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
Cc: ke.wang@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/12/12 10:15, Zhiguo Niu wrote:
> Should check return value of f2fs_recover_xattr_data in
> __f2fs_setxattr rather than doing invalid retry if error happen.
> 
> Also just do set_page_dirty in f2fs_recover_xattr_data when
> page is changed really.
> 
> Fixes: 50a472bbc79f ("f2fs: do not return EFSCORRUPTED, but try to run online repair")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
