Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F6B13602
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 10:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwDwccTbnruNuTIgoI2pH5QXeQsgtwG2YKPgohn5daA=; b=aZJa+HJ1B0oWs+0b0n6ew2sma6
	8h+U02PSzHe+9CQiDk2WPSuHDbvzkf4lXzDcUllgSCMWxSCgNmi2c9RRo39JiyKFMvrvMcuSSIQr7
	9MhMMUTOXhsL+Hiv5rWsglg5Zm+UXByDU7rKBTGtFe8bNqSZmE9TfS/7touUXngVhAP4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugIr1-00020f-H1;
	Mon, 28 Jul 2025 08:05:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ugIqf-0001vE-PL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 08:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oRguP8zyYDhgnRUcn0MHXp9CPvdM6piqxyKvUkMIvB0=; b=X+RkqtzcAaZxf00ULUfby6Cuey
 CeUP49OFbNS3NlssLN/ZmnY3UcuJzKYtY+A75c0MWx5JWFmw9WkQmfqXLvA9nlEWS/x4fyBgfRLGK
 FUm6zgQtQ2siApCGYYYJq1n5gRR916NFKwqpKlKi6SONB6TjadjT1JffA1UiIp1hZY4s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oRguP8zyYDhgnRUcn0MHXp9CPvdM6piqxyKvUkMIvB0=; b=Q6YVim2wlNidlQd7xSASt5z9tT
 TfliqBAblBrbQb9oRWKbDDdnhO8rX4dIIdV/GSvcrZoJ7LjUHm5gGvmeesV6N55DCmB1BxxNbF+QF
 MnjgIXLtuo8gqdTLM44e389HIEr20hgvaZMW5DNzL35AryeyvZ1GT9QPFnmGIhi2T+Aw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugIqf-0005Ll-Bd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 08:04:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E75D15C57F4;
 Mon, 28 Jul 2025 08:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F68C4CEF7;
 Mon, 28 Jul 2025 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753689875;
 bh=LXlPgqlbroplMreAPMQyK215lSJrhJZdI+BT1WhtDFs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TXUelbVpCUn2eo+5niYt9Y9d5hF1PjLCl3UQ+WExufDJclKuuynM920MDodnl68NX
 xX6ES2lUIMsI0Rt2B6Ut2zAqs746SsgP1bVa8BaKPPrKQNpyuiXpSa9HykRE6B5ADG
 LDkiLhrpDRU8RyS9ETDvBqyjQyWgVBnXFtLGfNdaHy5uJUa4fRL+nTag4WE97j5RZn
 4L6bBdPkHU6R+1hPma1GMl/QGtvp72AHmQT8hp57+NrPNpiqqA9ICom6KSu/z6Afy/
 rSp6ny6la46o6Q7qty96f7d2+Fnw4PKkySr0BWepylVoOP7Dmhhv7J7tVoZW5887bZ
 L+gaAiKFeQ8OA==
Message-ID: <de7d1680-15ea-4d88-976f-1a27890e4f42@kernel.org>
Date: Mon, 28 Jul 2025 16:04:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250724232839.848672-1-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20250724232839.848672-1-chullee@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/25/25 07:28, Daniel Lee wrote: > Commit 84447ee7212e
 correctly relocated the zone alignment check to its > proper location. However,
 this revealed that the original check's > condition was incorr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ugIqf-0005Ll-Bd
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: Fix zoned alignment check for
 multi-device setups
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/25/25 07:28, Daniel Lee wrote:
> Commit 84447ee7212e correctly relocated the zone alignment check to its
> proper location. However, this revealed that the original check's
> condition was incorrect for multi-device setups.
> 
> This patch corrects the logic to check the alignment relative to the start
> of the segment0 and improves the error messages.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
