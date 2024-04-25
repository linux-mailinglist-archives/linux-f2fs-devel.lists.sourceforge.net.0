Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE288B18CC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Apr 2024 04:16:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzoeT-0008MD-7T;
	Thu, 25 Apr 2024 02:15:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rzoeQ-0008M3-Tv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 02:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZLLOrQUh6qa58J+kFiDQRWvufw1eG2eMMNBe7j0/MxM=; b=HrMWrsrIirbYt8wmJZRN8dJaYo
 cWGD9ILZPF5jspRGLAWw17HGdbmll3To1hfuFaF3dGJQR5+fMLXsod86Alr4ezcIUzdLUFTHxYWZp
 nGvU4OhY30K68UZkDQw0rqjSfYrwuNFLnOSR3wFBo1HvlRRwnjzGPrJqiaBebBhlVwtk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZLLOrQUh6qa58J+kFiDQRWvufw1eG2eMMNBe7j0/MxM=; b=OHj8J7rhcXHdHYORDhkCvJyfMA
 AUcnkOJNOAjCWiu6tPuEuxIxqxXYcCPixFMCXaAGVdYVfQVx9LxrJhqhJ/qFtV+98uTmqNAJgxKyh
 eg5VFr6fKyrIRDasDbDptAvqzjpzcDgVbWMTdjEl8u+78ESgniIDYhM5Wz9cmkW4htyk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzoeO-0000as-1Q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 02:15:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EC5E1CE16C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Apr 2024 02:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF19C113CD;
 Thu, 25 Apr 2024 02:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714011334;
 bh=dEDGmI/9kTTqq5sNWEW4/34w2kAbFrZ+3rJj3BEWKHg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=E4fCy3NCInG1eXymw5IhWG4OgJULmwGOr84PjKdvLi+mlw7QwIhQfTQ8WCf01N+M8
 cTw+kM6Bl9SMlCTjbi4jg6Rnb1mFCxbdVWH1QwMi2BVTzoM12RvsKDv2+FYgV41Jka
 QqQjyylEP96hkj53b4m1j1A1k7W03DeJGL4l25SdVjWpm38UEGUCgR8YviB/1saK+k
 CKe+e2LKS7CSn20Xc9TL5n+C4RUN/d9T+yvg42m1kuDe+qYdio9oQz7wmcTVtPtPRh
 SXAjKfkpY3XiRNq1yW48SRwgXRKwqSmalKDkNHgL8HF7f7aERDV+MM93X26YhsJzGR
 SyBjtenH0vOVA==
Message-ID: <30b26daf-86ae-415d-baf4-139e600ca747@kernel.org>
Date: Thu, 25 Apr 2024 10:15:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
 <20240409203411.1885121-2-jaegeuk@kernel.org> <Zh6r_yLKOnNkMedZ@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Zh6r_yLKOnNkMedZ@google.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/17 0:49, Jaegeuk Kim wrote: > Let's stop issuing
 compressed writes and clear their writeback flags. > > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzoeO-0000as-1Q
Subject: Re: [f2fs-dev] [PATCH 2/3 v2] f2fs: clear writeback when
 compression failed
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/4/17 0:49, Jaegeuk Kim wrote:
> Let's stop issuing compressed writes and clear their writeback flags.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
