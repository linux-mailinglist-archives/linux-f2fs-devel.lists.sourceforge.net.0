Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F0EC354E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 12:15:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbHqwV6veZ9z0v2wcWTu+al35CnuoSvYAETVTstGhxA=; b=QzvLOP0tk9exUwKiKE29p1lRHR
	YpZlZTj9dDOJ7N8gzoU/MYerc0EKeHCuS2OCpsaLMOSg/+Kg3xogXTrrKHkdpArM6ZDzaEs6wLVJr
	TfI7DSPalwfoBV2YEirX2phPsyBSkclc8Vy4b343MGqMvezpfqTJDBMu1e8CE4vCQnwo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGbTS-0004mh-Aa;
	Wed, 05 Nov 2025 11:14:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vGbTQ-0004mb-Oy
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 11:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K7RlyGff/veko4vRQ2J7o/QCcvPgty5UjXygwvSvj0M=; b=QQufc/c3SpClXzrNd8sNsCrLm9
 cmWgquy73AvSIrMaqpt5cg9qPD5Z0HPMsvRXKOfks0KlgNehuguqWNnoUD2ZAugtiVprLN/04/LMh
 E+lqTDQtpMUo6c7S0f97C/p8rDVqlsdF0KzSBCnoGPovw0AWJTbNfpKn0181/uHzsHGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K7RlyGff/veko4vRQ2J7o/QCcvPgty5UjXygwvSvj0M=; b=NrgY/9IJLepAwKO7XgE9GxtaEr
 B2mC31F68GhkQpN0eQtZxd21AYuOj8SYWpY5I7hJogTIlV661zxcwTuFFxgz1LZOC62v1r19pi1y7
 Y3jCFtCZoGSDAM9arYgfTN00zllAt6jGq+NLvXQAwkn06wupPz1KBXTlFPCMWt5qxX7o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGbTP-0005YI-SA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 11:14:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 35E3960205;
 Wed,  5 Nov 2025 11:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404DEC4CEF8;
 Wed,  5 Nov 2025 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762341272;
 bh=Jy4/pQIGMv6ouvKeaMvAaVdAit3SYqxr21RQJFEBS9c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GMvarayR+VvpDw5CWp2/Wj7iPJZdttohLNlXgZkINDoPrkSQl1qraYdducma9qf2f
 1OSwN8y5ksmzdAKrvJnbNmKtKHDNjSgcjzqexlOkUuRC/URVUuIfCrvZvt2XVylQnc
 I9KzbpgtTM1G3yQIoVSDRYu/wjeltrCWMo62ARs3/7LF6s+BwTQzbUNde494wco31H
 lTd1mTWs5ptfHPLce+m7D11S6U/2EiUSXdXige4GhpaeiNEQYzkUfBxmpCTE2P6d9t
 oNmtZheyGoT2aJUGiq9NehCsyvaN/m2r/Sg1+d0QwcyNISjRVNF8EyyHgCStSUvbrB
 vqltOsI3d/LhQ==
Message-ID: <c101d5f4-f53b-43e4-959d-16c74a99eca3@kernel.org>
Date: Wed, 5 Nov 2025 19:14:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1762339963.git.zlatistiv@gmail.com>
 <eb59e101f0b201afb65cb40b38e1b1598039ac82.1762339963.git.zlatistiv@gmail.com>
Content-Language: en-US
In-Reply-To: <eb59e101f0b201afb65cb40b38e1b1598039ac82.1762339963.git.zlatistiv@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/5/25 19:09, Nikola Z. Ivanov wrote: > Rename "fail"
 label to "out" as it's used as a default > exit path out of f2fs_unlink as
 well as error path. > > Signed-off-by: Nikola Z. Ivanov <zlatistiv@ [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vGbTP-0005YI-SA
Subject: Re: [f2fs-dev] [PATCH v4 1/2] f2fs: Rename f2fs_unlink exit label
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
Cc: david.hunter.linux@gmail.com, linux-kernel@vger.kernel.org,
 khalid@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/5/25 19:09, Nikola Z. Ivanov wrote:
> Rename "fail" label to "out" as it's used as a default
> exit path out of f2fs_unlink as well as error path.
> 
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
