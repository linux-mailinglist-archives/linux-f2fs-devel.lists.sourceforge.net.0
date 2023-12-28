Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779C81F38C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Dec 2023 02:10:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIeuF-0003Cy-Jb;
	Thu, 28 Dec 2023 01:09:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rIeuE-0003Cs-FF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 01:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e0Bv7bAD8YYlYvi/Mo+K3hlnUUbat0Tf3QVdNoDi7dc=; b=RP/dXuFlu0mGn7WhaqMUFQ7zTR
 /TWRVzlerznnoGhMOl6fV10LbjCdZ2ObL+gj5QshMPPxCOiqwBkyRxjiR3Zq3IIJ++bTfWN90uIER
 q+04H8iTPF7CAebntu5HXoLs6OhVukuOvrJFxtxqaqppgdo8PAshtC0J132ekF9cl8j0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e0Bv7bAD8YYlYvi/Mo+K3hlnUUbat0Tf3QVdNoDi7dc=; b=GyeOwWUQEFo7GSvY4z0Xo/qnvg
 2WnBHnhpyRJoVS5xPAlGdn6dfCbV1xOJN6Y1TiVRSSJkqrEGoguacLlOZqMxwZcftPrEmhkd4aK+2
 IdUnIuW2wbO6u4dRTviYkM+V9YEnuCBwmp8Z89+Ulz7OrZ9KnKCpCzwlXV0D89jIxTOk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIeu9-0002ot-0z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 01:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 938F560FC7;
 Thu, 28 Dec 2023 01:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A166EC433C8;
 Thu, 28 Dec 2023 01:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703725774;
 bh=VwYCv6gGPQ/YYWxYxWflWCiB/el4SBogmDzpvdiEhUA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I5va7tQ8MTVS+c7ooSC2tg96OtVZYUxvtVGElOdTMeSxywXvk1j79HPZZ9JkI1BjX
 ylX7ra8UbxT0INljhybm6o24XgjCBukv7UfGitluAoPLDA0xrlgzZEmgCcZfKa1eRz
 PD/A2WdS9ro00mPmD8spoFdQnsVvpyRaupvLmeaGh+toAYlRUAXvAB7GmAdxOM9qya
 SkQz2vzdBrkbTU2UwfVPoS8qr9ext0gtrYhwUbUI86Wf0nelk1FBSF32bqYe2yfbAK
 nrh8Ou9OjNJOFl9acbT+eRy3Lrws3DpGCSUTDnPkKDsFWhn3jwtRM+wFeN9ImOKMFR
 T9jG00cu55QrQ==
Message-ID: <f1def3f6-e93d-46f0-b074-b459b6255b84@kernel.org>
Date: Thu, 28 Dec 2023 09:09:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
References: <20231227171429.9223-1-ebiggers@kernel.org>
 <20231227171429.9223-2-ebiggers@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231227171429.9223-2-ebiggers@kernel.org>
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/28 1:14, Eric Biggers wrote: > From: Eric Biggers
 <ebiggers@google.com> > > Call destroy_device_list() and free the f2fs_sb_info
 from > kill_f2fs_super(), after the call to kill_block_super [...] 
 Content analysis details:   (-8.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIeu9-0002ot-0z
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: move release of block devices
 to after kill_block_super()
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/12/28 1:14, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Call destroy_device_list() and free the f2fs_sb_info from
> kill_f2fs_super(), after the call to kill_block_super().  This is
> necessary to order it after the call to fscrypt_destroy_keyring() once
> generic_shutdown_super() starts calling fscrypt_destroy_keyring() just
> after calling ->put_super.  This is because fscrypt_destroy_keyring()
> may call into f2fs_get_devices() via the fscrypt_operations.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
