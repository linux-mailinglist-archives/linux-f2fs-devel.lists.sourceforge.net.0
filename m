Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5996E7F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 05:04:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smPHC-000335-IK;
	Fri, 06 Sep 2024 03:04:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1smPHA-00032y-7j
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 03:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ng1SLuAZmnmKvgePKF4gjXHvBlEXEh/62zIxKUSJwJA=; b=fXkgsVzMsx/gEFm88g8KlE65Qc
 EuC7CT6NwX2TjyEe8PHhpJ5O8Q5DZEcy5IrAVVMhIsiWxJApgEkLE7oqpyJ2NIJaowu5bpJPcSPtV
 ujR6axd8IgYI8jscbr+1Mkms6epKbIxHXdK/Sf9Oie6yYexcNbIlfa1dStfPIQwmyS5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ng1SLuAZmnmKvgePKF4gjXHvBlEXEh/62zIxKUSJwJA=; b=EvwhB3q6f/JVy712rlJdzzkkQk
 mjM/UHmx0pKALxNNUc74TgZR9lczD+SxjiVEyyylUho25T9F0QQdtLLcq7YuMkl1A7pk+yMx24iHr
 WuMG39qeW+tmgFZPv7VoFgD8YWZ4FrSH3rfFaco/XLkpOWHq0m7zt5IkSlfWy2AnoGu4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1smPH9-0005vc-37 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 03:04:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 418565C5605;
 Fri,  6 Sep 2024 03:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93944C4CEC3;
 Fri,  6 Sep 2024 03:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725591877;
 bh=vYXBEgfRmNPrT003e74yVQxsDxUlL7X0ruY8/n2rJo0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qsYFFAlToGoW/5OgOkJuDM1UC46+GgiTTS9d4zE0C17QfRgClTh2gVEeoJ20mnK04
 WEkpzUVOEniuWnbWn815UgIuA7r2ZwM/ekEboC5HOQattbQ21+7no3XzsHXiKo2kBm
 xFOzCFe1Wy+9yFT9uH6VRtznE0uLKlmi0qlgorO4K9BwXh5gn5nx/saJQTzRqtfsAl
 +oKB+Z0Hn3UylFTt37tTLoAuepqNfhvXWOFcsf1jKHXNx/gl6x2auQnlON6x6RWlis
 Ht49joGVGWQJNhxwmXYSq1k2oTKv7wkqV0z94WWEipOdbrGvSlLQCYPoTJFkFz53SS
 adHN6J8OAa2hg==
Message-ID: <321f7e25-6ff6-4480-adf5-432c3115b85d@kernel.org>
Date: Fri, 6 Sep 2024 11:04:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240829215242.3641502-1-daeho43@gmail.com>
 <20240829215242.3641502-3-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240829215242.3641502-3-daeho43@gmail.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/30 5:52, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > For the fine tuning of GC behavior,
 add reserved_segments
 sysfs node. > > Signed-off-by: Daeho Jeong <daehojeong@g [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1smPH9-0005vc-37
Subject: Re: [f2fs-dev] [PATCH 3/7] f2fs: add reserved_segments sysfs node
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/30 5:52, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> For the fine tuning of GC behavior, add reserved_segments sysfs node.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
