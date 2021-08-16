Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41F3ECE7D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 08:14:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFVsg-0006dt-OI; Mon, 16 Aug 2021 06:13:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <frank.li@vivo.com>) id 1mFVsf-0006dh-B2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 06:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
 Message-ID:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GvE/ZWYLqmX5duhM3MyAb9731fPkevOkEdUnbKNPw7Y=; b=dCajP/GeNtmceKgAfsmUJ6otJp
 wuxe5Z/Ub1qTG9QBQuNZgj0N/23oA1A2J/W4g5RILwZIy6G13BJ+vh3lyQpruxoOULghQLlmPYy+Q
 syqZj3ho0ZOTe8so/Unb8RPdWxbCleAgy4KcPmECdz+ZuaIS/SWoI45EsS/3C9shZGQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:Message-ID:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GvE/ZWYLqmX5duhM3MyAb9731fPkevOkEdUnbKNPw7Y=; b=UAlE7F82gijia9uC1j9j9Kg2Y2
 ofRTmPbKTh4nRrO0z4y5NrvWm2FSH6OeEr1OwpTFR0MfUrbIGQGfS8lYxxjlVZlz5FDDMDEqCyu4A
 wZHhuXzj7E5NDg4DolKfm7IGNScSOBqDMeGKKr80vQ019Kpc9pDvp5F8jfR4r06Z3kfw=;
Received: from mail-m176236.qiye.163.com ([59.111.176.236])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFVsa-007yGQ-L2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 06:13:53 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m176236.qiye.163.com (Hmail) with ESMTP id 887D87800FC;
 Mon, 16 Aug 2021 14:13:40 +0800 (CST)
Message-ID: <AGwAWQBVD3NfsYDCdBIWb4qP.3.1629094420548.Hmail.frank.li@vivo.com>
To: Chao Yu <chao@kernel.org>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.231
In-Reply-To: <af34f9cd-8972-583b-bae2-f11fe9058e63@kernel.org>
MIME-Version: 1.0
Received: from frank.li@vivo.com( [58.251.74.231) ] by ajax-webmail (
 [127.0.0.1] ) ; Mon, 16 Aug 2021 14:13:40 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Date: Mon, 16 Aug 2021 14:13:40 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUNPSB1WSR4dHx5JSUlLHx
 lPVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1NS0lITk5OTEJNN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6PAw6LCo5LT9INR0IIj84HzkyLBlPCitVSFVKTUlCS0JPT0lLQklLVTMWGhIXVR0JGhUQVRcS
 Ow0SDRRVGBQWRVlXWRILWUFZTkNVSU5KVUxPVUlISllXWQgBWUFISE5INwY+
X-HM-Tid: 0a7b4d982051d9aekuws887d87800fc
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.236 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.236 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mFVsa-007yGQ-L2
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5BPATCH_1/2=5D_f2fs=3A_add_sysfs_nodes_to_?=
 =?utf-8?q?get_discard_information?=
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>>>> I've added new sysfs nodes to show discard stat since mount, which
>>>> will help us analyze whether the performance problem is related to
>>>> discard.
>>>>
>>>> issued_discard  - Shows the number of issued discard
>>>> queued_discard  - Shows the number of cached discard cmd count
>>>> discard_cmd_cnt - Shows the number of cached discard cmd count
>>>> undiscard_blks  - Shows the number of undiscard blocks
>>>
>>> We have exported them in debugfs, can you use that?
>>>
>>> Thanks,
>> 
>> But now Android is forbidden to open debugfs, and in fact we have not
>> opened this configuration for a long time.
>
>Weren't them be used for debug purpose? can you please explain more about
>your use case?

During long-term aging test or normal use, sometimes there will be performance
degradation problems. It may be caused by storage, or it may be caused by the
filesystem. For example, the filesystem accumulates a large number of undiscard
 blocks. Although there is some remaining space, the androidbench test will
show performance degradation. Therefore, it is necessary to export information
related to discard so that we can confirm this situation.

Thx,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
