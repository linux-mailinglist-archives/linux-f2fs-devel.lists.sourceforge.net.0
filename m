Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E567BC447
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Oct 2023 04:53:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qoxRa-0001tn-QB;
	Sat, 07 Oct 2023 02:53:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qoxRT-0001tV-H5
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 02:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K5kheW7h/5pealJDR/SvljKd/NfrGgPtrJ6jnsTs4co=; b=VbX8QYGKETUkWW3SRr7korsJ2N
 k2INViD88FRMMiWRH9xHjleu1yzOIN0wrllVrUP2Rj26pCayalQKhZri0voEZZpVj4vxBvT6lDOPh
 yNz3FRe+WzlksbD4MWj9lxGCWKTlLGODtpaPkis0lTvk+ZNLOqDOLh2bRkKmdNaSNn0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K5kheW7h/5pealJDR/SvljKd/NfrGgPtrJ6jnsTs4co=; b=YFL7yoG0Pmsb0GRTf9vXywkEeZ
 GIFG5kaB2XR6lcqyFlrwCWOJeI60Bl0N5n3To2fZyM3DwPnD4NphWv8lw+F0v2I9riiC9IJa3+9rK
 VD4N8HRsjr3vymA/bgvWFulto8mdw3qmN4/MHlqSP4/iOjMmKwZfPtkpLFlOtwvQnk6Y=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qoxRP-00030E-Ig for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 02:53:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 89689CE2571;
 Sat,  7 Oct 2023 02:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869E4C433C8;
 Sat,  7 Oct 2023 02:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696647187;
 bh=givokbT2OdwtFmBNzjJjWzXCgdXE/WSNCW7e+2KIMQU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rvo704i/b/RrDeKrLlLDA+scaLJqCAubGm+KPKDWfEbOFEhxuNtKNlXag/R0uS/0q
 Neaw8cU571O9XUJAuDgtObxKPDT7DEBETSYQifFRnDu9O1UEBRzTaa2IYOXmEiwnjx
 qEZfm4m0YwgcKtOSvKvR5Ix/GuHhiIq4zhhvcPtXzeAVIhVN/mTrlFpNyX726/dEho
 PVLg+fSAxssew9kaQL8LM2yMY+a1BxNq3lKa+ClTro4XzpJzbWahV2cM/EishRP5Zn
 EoRl8uzmHFpKz8RtNIukVyeWQg2ySvVUHww4PJ27FJtXpG63dLX5Bev2T+ksbp7bFg
 bfGNSO5JtGE9A==
Message-ID: <b20de8c6-5b29-10cb-257e-fc0ec7698cc5@kernel.org>
Date: Sat, 7 Oct 2023 10:53:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20230928175113.3840888-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230928175113.3840888-1-daeho43@gmail.com>
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/9/29 1:51, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > We don't have lots of benefits from this, since
 block devices already > have page caches in the kernel. Moreover, [...] 
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qoxRP-00030E-Ig
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: do not support user-space cache
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/9/29 1:51, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We don't have lots of benefits from this, since block devices already
> have page caches in the kernel. Moreover, this feature has some
> stability issues corrupting metadata. So, we better make this deprecated.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
