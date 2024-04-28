Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A59AC8B4AE5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Apr 2024 11:09:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s10X2-0003Se-9j;
	Sun, 28 Apr 2024 09:09:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s10X1-0003SY-U3
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 09:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2tP4WEZOMkIS1sLkWlghhXO5TyWe82hph+C/8aOfuWw=; b=J+g3KpsRkQzkQBcm2bLkxLsDGn
 bQzgXMUFsLOi42oa9GSqdWPcqbKEkQITqx6j2MDvq5Sqphkk57VDDxdpxWa4G89xVhDQhP/0jkHPD
 b5OyN9EEaq6+/AU+A3DKgyY1jrOuvZ9f6Bgh4IMEMR0SObWIBwkd5N4ilzdlJDP2aUi8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2tP4WEZOMkIS1sLkWlghhXO5TyWe82hph+C/8aOfuWw=; b=LK5dRLAzPWC3Gbdp/K5mYBswEs
 gOkbTDQRUdxDqL+XKrw7pO+f1dwY2VF7bCWTMN7tZuRi7MHxZngK6FxtRwAbtfSHlt9Uv5e1J5Bt6
 dJqdNf++KlGCDD0YY5i2NtthTA7dCS5onCeYIGjocXuFY2ceQKp3x4F3IKJ8bw2Pa0tY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s10X1-00006j-B7 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 09:09:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A4DC602DC;
 Sun, 28 Apr 2024 09:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9D8C113CC;
 Sun, 28 Apr 2024 09:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714295340;
 bh=2tP4WEZOMkIS1sLkWlghhXO5TyWe82hph+C/8aOfuWw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T7Y5RiXNdk2af9yVhMFgN0/9t8Ya5JILUoNzmuTeGqJEcOhC/3ROemVdt08eAAiOd
 kQQC0R3+OpOmJRauom0KPVXVC4FFyaUy89IClXA8NA1sZTM95kpee/tkV9jb64Y63k
 mYABO5C0gAg9O7gFHpmGC8Z5W/NVBR5i2TiqFPA1OlhA4d2RC2cgmXjsZx2pwJwE7d
 TajWZ0o+VX54bspL0D9ik39WZnf2579ruacTVyk53sL0WKajc5b4Z9ACHvvRo9Go9z
 0duLopJ0cIxlpKveXfedpgmgKoX0NaB2PQx5fxvjtcLkicidIy2s5Ix+On69DT6p2e
 fuqiHkqGxpVHQ==
Message-ID: <9c56bbe5-6f33-4e67-82bf-01978b0e2519@kernel.org>
Date: Sun, 28 Apr 2024 17:08:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
 <20240409203411.1885121-3-jaegeuk@kernel.org>
 <050a93dc-d9a8-44bd-9a83-83718e95f04d@kernel.org>
 <Zhmf4klcOr4eplin@google.com>
 <CAD14+f0Scnc1GTjqR1izHqPerCqgHsLMR9mfKocUxw_4hyZ+Zg@mail.gmail.com>
 <49a4cc15-299f-432c-85c7-ab1b1daaaad1@kernel.org>
 <CACOAw_wbCJfOpfHzsznofkP8nb=gigjwmMqrCaeUR+ago8Xo7Q@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_wbCJfOpfHzsznofkP8nb=gigjwmMqrCaeUR+ago8Xo7Q@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/28 9:23, Daeho Jeong wrote: > I have a question.
 Is it okay for META_GENERIC? It seems all users of META_GENERIC comes from
 IO paths: a) f2fs_merge_page_bio b) f2fs_submit_page_bio c)
 f2fs_submit_page_write - verify_fio_blkaddr 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s10X1-00006j-B7
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix false alarm on invalid block
 address
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

On 2024/4/28 9:23, Daeho Jeong wrote:
> I have a question. Is it okay for META_GENERIC?

It seems all users of META_GENERIC comes from IO paths:
a) f2fs_merge_page_bio
b) f2fs_submit_page_bio
c) f2fs_submit_page_write - verify_fio_blkaddr

They are all impossible cases? so it's fine to record the error
for this case?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
