Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF8C51BDEE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 May 2022 13:22:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmZYT-0007OZ-IU; Thu, 05 May 2022 11:21:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nmZYS-0007OT-Kb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 May 2022 11:21:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yQEvZzOueWZpuHg+a7W+n0laUeSUADXRbshXPObf4DU=; b=DD+YMFJIov7lhOhrZViGugrhn+
 Qafa/DssCjWLHJuD8haMJWiwyQAl81asq++oGaANWfzU9yVyv7dYDQygEqUhwL0Q/s3HQrErJQ3bN
 rap3QKmKWVOLmeHPBh+qTA6TEsAD6xvsX0lOOjFrO35dzuzrgwYX07jtcVf8oKHkube4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yQEvZzOueWZpuHg+a7W+n0laUeSUADXRbshXPObf4DU=; b=PNhauicINwOqlQlEGPZTtzdbMC
 7//yiyaZzv02HCTwP/NnDVaRRfxJvYZGTeEdVx+aJvv3jW/DJTaerFbv1O9GYYJzOSV72+MZ3nccs
 9MMN45Rcx9D+V1mkS4wsipjIzKjt2GQxmlm9tK51d0zRzdVaP2oEhviGVxEltoWuCx14=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmZYP-0024ef-KR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 May 2022 11:21:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F249618CB;
 Thu,  5 May 2022 11:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43AFC385A4;
 Thu,  5 May 2022 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651749699;
 bh=IEGwp11v+XWOBcZIXxbJqS0+XkO/ZxJHw7PTpy7YXkw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uVWDH1F/bcDYSL1K2jAVsYwx5/Ue4/zMDYq9RD86PXqERhK1OvBTv9DZj0aZeU32u
 s3ibzjOX01kkdrb6lMVU++JepDSZVluYjc+w4G6rjtEZClVWi3WF1nvSQZ+xkvG3Vv
 NOB8Sj6qjI3Eh6Q4/WTxhjSCewUafhzC1gr7lN/36QzmPcc6Wir5tNyOuFpx4+i6BX
 iZLgMy5pkSVqlZGgPScNzsa4G66WoblShQXl7sOeAHYCfuqsAV1cijYohwCq2INy0e
 Ps6PJ/Co7z/i8BBeROx22t4vn9OJjT1jL3jT65bFjZ5/7sslKdgLIO5ohFy7oQ0gMr
 6ILJoijzSFQQg==
Message-ID: <5157b1b3-520a-769c-b031-5a9d1f7039dc@kernel.org>
Date: Thu, 5 May 2022 19:21:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220503203040.365028-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220503203040.365028-1-jaegeuk@kernel.org>
X-Spam-Score: -8.3 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/4 4:30,
 Jaegeuk Kim wrote: > From: Byungki Lee <dominicus79@gmail.com>
 > > If there's not enough free sections each of which consistis of large
 segments, > we can hit no free section for upc [...] 
 Content analysis details:   (-8.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nmZYP-0024ef-KR
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: write checkpoint during FG_GC
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
Cc: Byungki Lee <dominicus79@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/4 4:30, Jaegeuk Kim wrote:
> From: Byungki Lee <dominicus79@gmail.com>
> 
> If there's not enough free sections each of which consistis of large segments,
> we can hit no free section for upcoming section allocation. Let's reclaim some
> prefree segments by writing checkpoints.
> 
> Signed-off-by: Byungki Lee <dominicus79@gmail.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
