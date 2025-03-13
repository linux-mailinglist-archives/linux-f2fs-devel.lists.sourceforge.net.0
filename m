Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B2BA5E95F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Mar 2025 02:19:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsXEV-0000Ac-7g;
	Thu, 13 Mar 2025 01:19:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsXEU-0000AV-En
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Mar 2025 01:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qtufJcWclqZeLaJy0tqAc9dnXgxtGW11APYw+Jzx0Ps=; b=WELZB5QTPd6lHTgy7buppEBxtc
 ccI2iIWisJCYNGESNn00+swaIIpMlksNQbYtbNSIaAaZZQMf9Drtg10hmv8q2892DiUlcKpvSc9vj
 SlImUDV+3YkEjTAQ3EBOIgT2ZWljEDkNPjT0cuR+oOAwd3pJmq+oN3Bx5DYj7qnnrkWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qtufJcWclqZeLaJy0tqAc9dnXgxtGW11APYw+Jzx0Ps=; b=C8HrrTh92ZzCZpiebMqVLqj7Wb
 +1+xyqcDf7OO6nuTpU2ZI8XbuP5avAAf5dbq+iycujDlqFy5ZIDdwXqs7ORPKyc2I4kIvPbZrPmM9
 DKLRI1pM33iv0h5SD0m2PUgDHRLZBLAgQ5Y6J800IHqKrL8MdLVv2vQAyljzGH32ANe0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsXEK-0001al-9f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Mar 2025 01:19:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A8438A4556C;
 Thu, 13 Mar 2025 01:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC96C4CEEB;
 Thu, 13 Mar 2025 01:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741828758;
 bh=VTXgiklq/UXDkZeGwoU5V8KaGpojlXqESK7KZcNIKzo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=uG8stgWIsOW1bRspuntE1tJoS0n4fmMFjJb2DE40UwirUvCRwO8G+AwGq18wPATUH
 4wiWexMAvCZCuCGBcpHIPPh6bZYKkVpGi3fuScM681fhPpWWOTNYHHy0h3bHvOwJsQ
 TwuqPU28E1BKiTyZv1EKeH48RrOk3b62zF8pERrmYwHAxzvnVmOvWMCmsF9ZCrlgTl
 WU2pFyMGcyM02J4yBvREQaPZzt/MsTtreApKHAsoAIPd/hd8ift5NMaTa+S93/qdYa
 mkVpBdFF5gnPBFJuZIiqJBJDP1sZRv73DhbHLJF1EOPhVwGxIKIWCERVRrm21rVGF7
 Qt/iBxG2Z9wjA==
Message-ID: <11b8f5a8-f9d6-4d86-a313-b678b8e188e1@kernel.org>
Date: Thu, 13 Mar 2025 09:19:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250311182931.1043290-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250311182931.1043290-1-daeho43@gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/12/25 02:29,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > For several zoned storage devices, vendors will provide extra space >
 which was used for device level GC than specs [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsXEK-0001al-9f
Subject: Re: [f2fs-dev] [PATCH] f2fs: add carve_out sysfs node
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/12/25 02:29, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> For several zoned storage devices, vendors will provide extra space
> which was used for device level GC than specs and F2FS can use this
> space for filesystem level GC. To do that, we can reserve the space
> using reserved_blocks. However, it is not enough, since this extra
> space should not be shown to users. So, with this new sysfs node,
> we can hide the space by substracting reserved_blocks from total
> bytes.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
