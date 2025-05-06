Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E2AABBA7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 09:45:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqULKWp4gjhp9LHyVhaaL/502lb0sO+tgiaqLfRDhfc=; b=mIPxUyEqjVQOE/Q7nvZaNljUIk
	0ZeCDMJ4OGUtV0jzgDYhrU3rOcZMgAin4hYaEgAIpCDx2SLX7Xwdcg4BteSAQvYAkvrv49aRGqfSY
	zkwoD09O0nzsDwqtz2n+irCkKHjZ+yCjgKHqR0pyJ3UiX0U85xt8yrF4aoAqxcqYFEkE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCCzV-0005oH-GG;
	Tue, 06 May 2025 07:45:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCCzT-0005o7-Ob
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 07:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8WF2NkAbUEXbJvHZGtu5LS4eFlwcwb3i3Se4rp4uL5o=; b=KBcMola8fTTzmopb0LffBDT4yZ
 OuHpj2yV5w/amvhjgPL/Ifn+Qi3JchLSSRyr2mITMdCwAQsngRTf7uR0UK8rP8YtGE4FRyd1hnj5v
 87ATGXYGKBKC5SLSA4nNP6tkFOh2qfNF1s848pf9MyXgh4jmyG1drEZoD3NAG9vMQQMk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8WF2NkAbUEXbJvHZGtu5LS4eFlwcwb3i3Se4rp4uL5o=; b=EIYsX2kGHP/frWvFX9SC415F1h
 G+ZhL1XQJMy6kxZdPF+U1MzWiyGkTz/t+c1qdXAnnIQYmWu0ptaHEkH6oWvepePQBl5HXRn68WG/y
 wh2IcheSxDZ8ffNOLtBKUPxPf45isl/pCSSxaHZpgzPsELjAlFerpNRMIkUhx85spOCE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCCzE-0004OV-7D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 07:45:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9953E49EA0;
 Tue,  6 May 2025 07:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB46C4CEE4;
 Tue,  6 May 2025 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746517502;
 bh=B6sC1f2QNO64o97AJnkfgwsT5Z+gGdMAqFOk0d0vM70=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=la/onv/BI/oYLBcOQz9X10kjDlF/XA9P8ET2UdKui3O673PK9OFCP+UdrO/Xq97qL
 z4eBaAnx8WMCu5/WPq4xxhVq/wjlfONpGHxfCaoN8SP1hG4BN10RjfT9ZixNPOJBq9
 6lUncF56JfEUO0OGDfsYNorBKzjL6LepoEVq96kOODTMnq7FzK4HsxCpJmKxZRqKRi
 Uci8itVQL6fP17siOrdCdUFo6pTkZhyDnXdWfNGO9YEkl+wvXklkgsgpIJJHVm0cg9
 XQCZnaWe8YqBPEnvuDh3zc4bc4PWPsTJuQCyHWsjJ/J8GFe+kQqjEaTY0vJu3zZ+FU
 8+CPEA23jnPOw==
Message-ID: <b19dbd5a-bb6e-4e7f-b914-bc5d921276c8@kernel.org>
Date: Tue, 6 May 2025 15:44:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250430183530.3254943-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250430183530.3254943-1-daeho43@gmail.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/5/1 2:35,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Due to the difficulty of intentionally corrupting specific metadata on
 > some storage devices like zoned storage de [...] 
 Content analysis details:   (-0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCCzE-0004OV-7D
Subject: Re: [f2fs-dev] [PATCH v5] f2fs-tools: introduce fault injection to
 fsck
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

On 2025/5/1 2:35, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Due to the difficulty of intentionally corrupting specific metadata on
> some storage devices like zoned storage devices, it is challenging to
> effectively verify fsck functionality. To facilitate this verification,
> it is necessary to add a fault injection mode.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
