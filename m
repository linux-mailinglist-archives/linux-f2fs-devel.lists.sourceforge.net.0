Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5A0A99E43
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Apr 2025 03:31:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7lQk-0002KP-U8;
	Thu, 24 Apr 2025 01:31:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u7lQi-0002KF-DT
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 01:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b9Dm+F1tmJAZbQmAi1t3GI5CpN3cSmuJFbcN3qg2vu4=; b=X5vaIo8AaSPEjflQ3M+pwtrl0B
 XWbeaGfTLj6YW+9fptfzs+V3BglkTldrOMvhmxlGcA1Fzhx9Y51rVlKJcHT9usAv9B/5HCKaTJtvg
 vgvR3tjvP8FyfeFV/3eZMGzBpLl16XGI/y4djqkJ/8r7w3RY+qKctP7r47Kze02plyVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b9Dm+F1tmJAZbQmAi1t3GI5CpN3cSmuJFbcN3qg2vu4=; b=LbGCNQDXzOlAwNI+ltOz+2r0Kr
 DhMLnePcUrosQs8+ADhh50gB761T6aJgbXm9elaR0ztekDLE31KzMs1uxjIoEfdIHAAFG+BEGKqGp
 3FQJldHBKyOa1ZEo2e26xEvAT1deFhK9077lvQVm4d6O4zwFWQ5AwB4wwrbjV2HWll3M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u7lQS-0005IQ-5f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 01:31:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1B6E5C3DE4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Apr 2025 01:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4259C4CEE2;
 Thu, 24 Apr 2025 01:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745458241;
 bh=inlMUCRFqnABddpRCcfNzuNn6R9QuNDbo71+V8QxfT4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gEdP53LlNPDdOGPkjsAPS9X5hkoe1gE0KB+RDFiqVSVyyBTZ+Y0zLDMIMRP3puLie
 dh0/ylUIWiT1GSHj7mVsJFnp3AAmvvCHYKLc8FvF/8x6vPyapaJx+q5/6sBqXl1LBy
 wcwafmYtgE69rL0pyX4LwTjxHV9JNmGT2N4E3OHJeO9c3bzQEd4tXvEh1EcoTTVxqp
 16NPhum6IH+eDHhMuGdASTIBhTiEfDKsQFqxQ7xOmZbOS/mo6GudtJHOPdG8f/a1bK
 ixl45IoIDxyHcsl/GY1eEHm2GyyD9RiWI+p9LhSNN5HhgIl3f1yRBRmC9pfRgKqGd4
 ZZL1134+gAx8g==
Message-ID: <09a000cd-b7e0-4368-8c5d-fef9d9bb7b8d@kernel.org>
Date: Thu, 24 Apr 2025 09:30:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250421161555.1630917-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250421161555.1630917-1-jaegeuk@kernel.org>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/22/25 00:15, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > If the device support write hints, let's assign it in Android devices. >
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org>
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u7lQS-0005IQ-5f
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: enable write hint by default
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/22/25 00:15, Jaegeuk Kim via Linux-f2fs-devel wrote:
> If the device support write hints, let's assign it in Android devices.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
