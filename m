Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 881429D1D04
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Nov 2024 02:11:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDCmR-0004OE-HW;
	Tue, 19 Nov 2024 01:11:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tDCmD-0004Ny-Us
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 01:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/1LC2iD/B65fMh3tNY/PPEhQdIJGm4uA8PVHtkOm7I=; b=NEunJpcIDD6RXWNnHhLN0y614z
 SPLHZ9n+hS15WWLRUUGD0tKOpYey9w2r5WLsk4DVDiu+id7OVjOvlaTc8VR49bT9s4ngJotGquPcr
 EaM3wSMGN4AvGCehbhNToDq6yxy31SEOcTunyAu63cH0Oan+rY2x29VI1bO8Ha90rGnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j/1LC2iD/B65fMh3tNY/PPEhQdIJGm4uA8PVHtkOm7I=; b=ZwmIFOvMl81jlvobneub18oNWP
 CWQyv9Ft95JIxCRCuCXPsu7kAeoNIS9pKr44Eoyq7DyQO/7sPgd39nhFrZ3bNsi/Q65/8WWcjf4pM
 9vC2JxnDT+tS5eoQ5C7v85b9PYq92wyzHGPlqPwlvYker+kaU6RO3sFD2SApcm4wKxbo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tDCmD-0006Fr-6s for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 01:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F39B8A42050;
 Tue, 19 Nov 2024 01:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEC6C4CECC;
 Tue, 19 Nov 2024 01:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731978687;
 bh=Qy7Yhho+ZT7oh2iBlIBJXe979+aHEvsqN7Fey7lQZBE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=n2j0dJh2iqV/J6ok/rnsTpu359K8rK5fVyK6T2+UMo0f/noXHOsK62eh/xmoowhHF
 QusnB7RLeQxlGtoMy0UpJJzvC93Q4pr5KySfRiZpS6qRLOiNn85tLCH3ZadrSu+e39
 fN9raJ22Z4lNi2IyzoUU3cdvm0Nb2xYbiTIh91BdmQCGaSgRjwddZ3UOQNL10b5VX+
 3QPVBFM8D9B2lTSiqT9cdzJXJFUWTbMawCmofQTm9JTSvl7/ZqZcD/Smu5vYGNxXtG
 qgFprrKDuuasnyEKYhw7Udvpsz6mIqWKbcZPZXMo8uxd6j2d6KQHIUafkMxX+a7lMK
 bbW4j6skplzyw==
Message-ID: <bdc3c8eb-2c26-4575-af7c-f54541beca5a@kernel.org>
Date: Tue, 19 Nov 2024 09:11:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20241118120517.3533055-1-shengyong@oppo.com>
Content-Language: en-US
In-Reply-To: <20241118120517.3533055-1-shengyong@oppo.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/18 20:05, Sheng Yong wrote: > Fsync data recovery
 attempts to check and fix write pointer consistency > of cursegs and all
 other zones. If the write pointers of cursegs are > unaligned, cur [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tDCmD-0006Fr-6s
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix changing cursegs if
 recovery fails on zoned device
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/18 20:05, Sheng Yong wrote:
> Fsync data recovery attempts to check and fix write pointer consistency
> of cursegs and all other zones. If the write pointers of cursegs are
> unaligned, cursegs are changed to new sections.
> 
> If recovery fails, zone write pointers are still checked and fixed,
> but the latest checkpoint cannot be written back. Additionally, retry-
> mount skips recovery and rolls back to reuse the old cursegs whose
> zones are already finished. This can lead to unaligned write later.
> 
> This patch addresses the issue by leaving writer pointers untouched if
> recovery fails. When retry-mount is performed, cursegs and other zones
> are checked and fixed after skipping recovery.
> 
> Signed-off-by: Song Feng <songfeng@oppo.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
