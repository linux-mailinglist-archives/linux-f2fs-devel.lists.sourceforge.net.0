Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 049B4A5D4C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 04:31:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsCok-0008O7-DG;
	Wed, 12 Mar 2025 03:31:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsCoi-0008Nx-Tn
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=egPaMpCQU+tFLwdkClcuW3SKLxZx91aJHF9GhxtJScM=; b=WNpgdVIXaK0HuhLjPyeJ1UhQAI
 cwBcnQPUHsDdowAlR+fQd+p37HidWMmHKGCRh6o5HPYWG9v7UIVlob3qOPEdpWIKCFvMqcyh9Rrd2
 dkHUjXgdKVwiSxHF3pZfzkrPm7mEN/Dx5J+GMnSdULoxDRtRRwIr7NuGoPOLWjsHyA+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=egPaMpCQU+tFLwdkClcuW3SKLxZx91aJHF9GhxtJScM=; b=CbQYscvuQEJEr6Mg99kDQ6YuwI
 +pr0YLO3dz5g3mS3rTU0Qp/flqEXqAmWpLFCymeCcQsHHxZTHMa+xhTCfYR9EC3dRu2Oub+lAebf7
 cmLib6HxAYc2Quy7fwI+L1aVTfZwB4MFfFjeruQ9uaKiXhdYcYgeCB89TzAnL98ett/M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsCoU-0007Q2-Ju for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:31:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77A035C48C6;
 Wed, 12 Mar 2025 03:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01119C4CEE3;
 Wed, 12 Mar 2025 03:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741750272;
 bh=OZfavFvPSRew3S6ScA/hZQNXUX/p8PazPQ2mpZ6NtkY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=g/CFEg4NUbTKMI8+SSUmLEC3wO4VFnXodYlVzydNB2xgp2Jms0QGjvJ2fctopibnW
 lhyGhDrfHC1FUAGBParKELmrkjOpR0TSiFHRn+8RPcAfRPo9rHcfmt2B6WNlM1Uy/l
 gUAFhtoL8WXNt3vJutmqnXX1+fZaaMD1XPGEPKBBj1qPTK3dkC9fuOobb4JW6u06lf
 BRmSvA867+qrn1czEZ/ergc226KZxbQrND4ohV56zH7aMAa5BceAU2sz580476AVYA
 kbPSSj1Wk6pBIvwGW3I5Z2TcoxFnBTB6eZtvhZVT8jQg8zmfWLAQQbNFoLYtP7O090
 pcITioCkKe4MQ==
Message-ID: <2224cd48-5adc-444c-9141-5e26c9eee77b@kernel.org>
Date: Wed, 12 Mar 2025 11:31:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <20250303172127.298602-7-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250303172127.298602-7-sandeen@redhat.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/25 01:12, Eric Sandeen wrote: > This removes another
 sb instance from parse_options() > > Signed-off-by: Eric Sandeen
 <sandeen@redhat.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsCoU-0007Q2-Ju
Subject: Re: [f2fs-dev] [PATCH 6/9] f2fs: Pass sbi rather than sb to
 f2fs_set_test_dummy_encryption
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/4/25 01:12, Eric Sandeen wrote:
> This removes another sb instance from parse_options()
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
