Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E662292F606
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 09:14:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sSATs-0001DX-R1;
	Fri, 12 Jul 2024 07:14:14 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sSATq-0001DQ-NO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0MN+I9RJFlFXBz0R0Twn0tJECxDOTaPFOsws24lXkKE=; b=IW0+vPsChaupbtaFrodEKt8w0h
 At3p7IUy0NHbYa4lqVDkL/71oizWgY40GX7/ZTj7IRvdNcciYuvGm2usEC5Kw+LOt/urexCKY0OVf
 3O76Jb4t34oxU/a9/iXG7sTfkneZTKTF0S/VE92tLGlevPym0YA28Zicm9VVnxf8IXOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0MN+I9RJFlFXBz0R0Twn0tJECxDOTaPFOsws24lXkKE=; b=c/6/z34tTcjBTHLylvoOSasoV8
 kZ9iWUuUggPbvH5eVSJZy5CzeLX4zFK2dVRwhY1lIcWlzY3SBA34jzoXicbWA2IYm0D574edD7J96
 QdVwQu1PSThEKlcbKlTcnjP7eaowV2h49n4pwgNCmwOfJk47fZRo6AG7bT8mNh3vHSak=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sSATs-0004ma-2h for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF77161E38;
 Fri, 12 Jul 2024 07:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5037AC4AF09;
 Fri, 12 Jul 2024 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720768440;
 bh=qmVVk7uYZe/k5WdmZbEwnaBnNEJpiGVycenTPC31V8E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qa9hT9gRxlAZnmeYkJ+1+yfK0Qp4uuXH91by8bD6MvsZOUZyq4xCzCthclwrV4aV4
 OftZ8vjIlUm25Qr0YFiVULw7PSzVg1DYFWs3p5m7VWMEsLqXEplD3FFRBeHyVCCP0y
 h8vdEGklPlnWi0UctGh7WHyn4cgWqC+SPjAgfc9sDMZO6iGS8yk89NjONNSvJfP4Zo
 MDC0Olj6ykyd+PqFxs5eFyoUQjpl+iJv7X/xASWTsXilF9vQXpxWFBdD8CRstAMJlY
 ciBPHH4nUUdqSP2q3+x4Ujy5QJCnNQdYursSkdiFcDHZThC9+sGgTQ8QrA8gwu619A
 4D6Fnoip/XxgQ==
Message-ID: <9422d2d3-6954-4fd5-8c2a-57950315c6ff@kernel.org>
Date: Fri, 12 Jul 2024 15:13:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240712020133.140148-1-shengyong@oppo.com>
 <20240712020133.140148-2-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240712020133.140148-2-shengyong@oppo.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/12 10:01,
 Sheng Yong wrote: > Show multidevice infomation
 like the follwoing: > > devs[i].path [meta.img] > devs[i].total_segments
 [0x 3f : 63] > devs[i].path [data.img] > devs[i].total_segm [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sSATs-0004ma-2h
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: show device info of sb->devs
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/12 10:01, Sheng Yong wrote:
> Show multidevice infomation like the follwoing:
> 
>    devs[i].path                            [meta.img]
>    devs[i].total_segments                  [0x      3f : 63]
>    devs[i].path                            [data.img]
>    devs[i].total_segments                  [0x      80 : 128]
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
