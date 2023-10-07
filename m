Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F07BC514
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Oct 2023 08:38:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qp0wy-0007HJ-9J;
	Sat, 07 Oct 2023 06:38:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qp0ww-0007H7-AT
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 06:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=340S/dQR8J0AhtcCu8/K8Cw1vtlsfYeaKogvAu8MI3I=; b=SgwFFVN09nni7n8ggpi+c6tqsK
 12lGJ0aksCf/3vc/gCfB+wvjj94YuuB4vXNFa6H4BW6QXBrprRhYwoC/mF77SsTrNIQpnMRxuR9fx
 5UYmWBovFru8z7jOyvIz1TBg8yz080jQa1/h+0kQ172eep3j5i1V06RjGD1nJ8QytYas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=340S/dQR8J0AhtcCu8/K8Cw1vtlsfYeaKogvAu8MI3I=; b=JQ0uq4/CJbebE6DqxG5Or/OFBw
 X41WqxpxiI/zYyBrPLz9w3AftfKB66+rC26R0Z/qtoU0xaBQ3hdeimJMThXmsX/Anv3TYqCz5/U3T
 BJ/r0oPWz/RG4bqtkd4KnnduHqjorJPGfWzDR+inZHsjpgkfM/r/zj+J1tzqP7KkkZ7s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qp0wu-00537k-B5 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 06:38:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E066E60686;
 Sat,  7 Oct 2023 06:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B88BC433C8;
 Sat,  7 Oct 2023 06:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696660678;
 bh=haeoZMfXVfuibJKXHZqwDbIGTXzIAr3k6IkAQRF6pGU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LYKw1oSSSpwkcD4fhCwHni6Ndss572NgxpTqVxC5jgsE7TlYs5RlDFU+9avG9S2cA
 noeCbcswqAJHHYBGO3AUMG6Vg3UPpv/ijWYL2J27VBFkbzJ5bDLlppgNxPt6b8GiBi
 ubhgW9omtxuu5SqZuooU1fBG2xlRQTrWxP5Pgtqh8TtwJu6gmCD4gBhvHclhGPva5o
 +CA8Q8KNQOt0ITHZbDpzDj7mGVmwIClECbKA9imkjRa9oonpRG0os2x9XW2PKVmVhU
 lW9JRXFD8rGPNDToPtMb0VOavsgimBSlNUgTT62qczTGD3XTVMAhamwgqHxpw7YyuB
 lJrstfDNVDK7Q==
Message-ID: <fa622c39-c02e-b143-0c40-99f85c9a8063@kernel.org>
Date: Sat, 7 Oct 2023 14:37:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20231003210754.275175-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231003210754.275175-1-daeho43@gmail.com>
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/4 5:07, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Let's say we have 100 nodes to be checked. With
 post-increment of > checked_node_cnt, when we reach the last node, [...] 
 Content analysis details:   (-8.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qp0wu-00537k-B5
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: make checked node progress
 correct
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/10/4 5:07, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Let's say we have 100 nodes to be checked. With post-increment of
> checked_node_cnt, when we reach the last node, we cannot print out 100%
> progress. So, go with pre-increment.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
