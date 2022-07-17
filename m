Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0868A5773C4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 05:36:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCv4v-0007DX-Ep; Sun, 17 Jul 2022 03:36:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oCv4u-0007DN-2o
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 03:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nloFYsx8s0mN10C+O1LmlFVe1JbB/yINgbiRBSrsG0g=; b=PPV0E/fQ5vR6qQ7UbuC7f5dygI
 OxnP+TgTAo2MCnBk04F/yBKTH+0cLH0QJmttMj5scPSYTk8uOQkHTA3mq91MCTiSCa8TDIP5Gl81y
 u/eB+aVWkkAmwTfs/9wch81cImo5pTMYrDvrdyuUSIxoeKvWzhLxppa2Z9vuVO4sedu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nloFYsx8s0mN10C+O1LmlFVe1JbB/yINgbiRBSrsG0g=; b=eD6OOelg4mxk2XgmlkNnRLH4NG
 fZHWXr96EX4xZHaK/KBbyQh2rODgMOeDzlygnMxw0d8NcbIU/nS05hxvnpOJ23Mp+abGWdEo6ue2b
 IkkXzjVKV9QXALUspHODqigYLstpWpqANeJxwSVFQCY23HaPiGkQjPp67JwEYKx3W8Ps=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oCv4o-001X8W-T4
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 03:36:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 492E060F8D;
 Sun, 17 Jul 2022 03:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC8FC3411E;
 Sun, 17 Jul 2022 03:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658028961;
 bh=uweVRROjd05rXuYslDAq7zKFMT5EAy/UXZVfEjM8Sk0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ISv4u8/VLzG0az+3a3UpyWgQ2Jx57tfLkuCngCjhTfE9UYf1DBFfkwku6XvuScaLh
 4fH3hvYOLsdLSMy+XgnpA3wkB0mo4qq6VCsr42v5/k9ztDlzteVzdn0f7EImS2UoJZ
 BDyx+qjrR88HE9/ZO8PhTujDdUTM3pwvddEVBRNe6DUzkgfOPVhW5bjofhICxJ9pj5
 OjvtnnOZc3h4x+0nP1zeXqb2WvXhdgrcmr1nlI0LMTTwBAKf9Mk4KDyUqNngNrNipJ
 ImYg3C2UEfP6B1U+wB+hQ1V/UE7oHi1cSERThPZlFts4aw2yt5J2BgfWeX+AAD9X4l
 XxoT4c4wpZ2hQ==
Message-ID: <656d9130-ae50-5155-97b5-dd6a5b678e28@kernel.org>
Date: Sun, 17 Jul 2022 11:35:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220623181208.3596448-1-bvanassche@acm.org>
 <20220623181208.3596448-3-bvanassche@acm.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220623181208.3596448-3-bvanassche@acm.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/24 2:12, Bart Van Assche wrote: > The definition
 of struct blk_zone_report is as follows: > > struct blk_zone_report { > __u64
 sector; > __u32 nr_zones; > __u32 flags; > struct blk_zone zone [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oCv4o-001X8W-T4
Subject: Re: [f2fs-dev] [PATCH v2 2/5] Fix f2fs_report_zone()
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
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/24 2:12, Bart Van Assche wrote:
> The definition of struct blk_zone_report is as follows:
> 
> 	struct blk_zone_report {
> 		__u64		sector;
> 		__u32		nr_zones;
> 		__u32		flags;
> 		struct blk_zone zones[0];
> 	};
> 
> Since f2fs_report_zone() allocates the above data structure with
> malloc() and since f2fs_report_zone() only initializes the sector and
> nr_zones members, the flags member is not initialized. Modify
> f2fs_report_zone() such that 0 is passed as flags to the
> BLKREPORTZONE ioctl instead of a random value. This has been
> discovered by reading the source code.
> 
> Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Fixes: 6d7c7b785feb ("libf2fs_zoned: Introduce f2fs_report_zone() helper function")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
