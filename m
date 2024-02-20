Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 184C885B560
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 09:37:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcLd7-0003Ss-H2;
	Tue, 20 Feb 2024 08:37:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcLd6-0003Sm-FQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 08:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K/T2HU2W/wzOGVay7T9j7nlSiAOE2HyxBmZ8TXeIO5E=; b=nGwQnR73rGEdbLuvngpXsD5gTH
 UdXf5Hq7S1Cvj0sBw3wofBFUd7bjrTzj1S7R9NvL4r+VofxU4WErqHvyZSdVHTAXMPLAvQlEfmx/a
 VERMwKH7tMGubsaKhaawsFEaSMBplNW4Eki6zppO3gaK7+tYeLFTBwpRUfLg47UzNf2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K/T2HU2W/wzOGVay7T9j7nlSiAOE2HyxBmZ8TXeIO5E=; b=l4HeP+wUAlA6SWUf6jGZk8DThs
 dkfb0KbHNN4Ry26EUzjgCWeErKfMXlFJNIuoNRxfpWMT96FTT6E4XqIMD5lY4REyJuLffBiOHy8Ne
 /WrSNAQCeXVIqNzrbxzoDfwr04ngN/JNUqyAXOx6YELjr1XihTPti+tBm9Q1k0dujZzI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcLd1-00030m-3D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 08:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 856E8CE18A8;
 Tue, 20 Feb 2024 08:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3E3C43390;
 Tue, 20 Feb 2024 08:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708418235;
 bh=Ew477+9Ye5FRrxK0DgYG99Q0K0VY1K3xXdDV+za3xk0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Hhdp8xxVKBWEjwjIcv/X7LNRlkOjOaaanXdE+jXuydZnn6UCneE/M/GvoQsGlY8vw
 b4HBtmBudFQIqHtxj2C90zEJrtFaZLc4cGFfZyvzaznfCuw5FJ4dARp8JAty6okG/8
 tlu46L05a+aHZw8IzH3587ODdy6r8kcIxhu3G6H+9vrn4ABL2ZeoCuRTbJqSAaCjst
 WxZWNHiMwFxpbLojxhlrh4CIZDCTHgg5FJtY4O9Grs4lAyZcAnpw0zG38zet3/favt
 APRaSpE/x5jG/wrzTYtNX/AGl5TOw4bhdL4tH9OZY7NWN2RzAMrKImtNYjQLZQp2PT
 WM3QAAAG3eBJg==
Message-ID: <e752ba36-285e-449f-a888-88a0ecf424b1@kernel.org>
Date: Tue, 20 Feb 2024 16:37:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240213173812.1432663-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240213173812.1432663-1-daeho43@gmail.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/14 1:38, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Make f2fs_gc_range() an extenal function to use
 it for GC for a range. > > Signed-off-by: Daeho Jeong <daehojeong@ [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcLd1-00030m-3D
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: separate f2fs_gc_range() to use
 GC for a range
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/14 1:38, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Make f2fs_gc_range() an extenal function to use it for GC for a range.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
