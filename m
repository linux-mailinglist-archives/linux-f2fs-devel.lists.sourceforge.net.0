Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC3CA7D20B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Apr 2025 04:12:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u1byf-0008DV-TW;
	Mon, 07 Apr 2025 02:12:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u1byY-0008DK-VB
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 02:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H7FyQKxItqrwekRWFjZ6+SDapCiOqjZmlYoiKH1dIbY=; b=bfYFmXLWKo6CJXiMEpA9iQBSrT
 LaZqZRg5f5XvZI91sZaYN1M6FUgiJfJCFhCqA6l/9uIMr6/9uf9DmgxF7xH68NRcSj6lA+AbKsMM1
 0/MMuzz3uC4rvuYwFgVDTPH87KZPRlswUb26+4Sm6YaKXm9yqvBN4aI/CyDL8eGpeXhU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H7FyQKxItqrwekRWFjZ6+SDapCiOqjZmlYoiKH1dIbY=; b=NlJYG+HPfcaNpX2wa//gZN/aX8
 wBC52hlKWBa0eJQLQ9u6BQDfoPdIXn1dlrzqyDsQzSGrd3w22w5Ikrc8Q2s78olAYGTDHVnZ+T7Pt
 CT0O8XXLD+6vXldzEm1riH4sIF9RGmM2M0ZnFTBSLVUk9m/PFFye28V+Rr0BMvVnoFVw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u1byI-0005hC-AN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 02:12:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E064F5C0F79;
 Mon,  7 Apr 2025 02:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3C8C4CEE3;
 Mon,  7 Apr 2025 02:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743991931;
 bh=1jdeWWXi13/hetboFMdwN4rP37Vc8xsYW3UO4jUkNMg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qRmooqh4tXcuuYlmRgwMi6zXJwwT4oD4y8uH0EaqLDvjR1hV4dDQU84OAT4ejYMi2
 CWsSBna9YNnYktXP7E6UAcMDgD2tbLDY/DjBCsPah0pCLaz4MdVdbaQ9rx0z22965M
 VhMgZNcLts5o6zAOdbcB/EmwK+fNu9bLOA/Z8sT9l14oMfOec8F9dZOV6FTJZHH7Mz
 KH8yaEgXI5W4ZMk0h0frgdhCa6NI/EoEtbXTajud1y6DiBKvadygnwbGEqQ8g3esl4
 tKgIQgz9RQpG5fevzRtK145Y6pC6arxis8VhCjBDbzIwk7gvpJg1bL1NnyDLQahRqx
 DApj0nw4+wq+g==
Message-ID: <2d4c2367-57bf-42bd-9841-9cc2536f9e0f@kernel.org>
Date: Mon, 7 Apr 2025 10:12:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250331202835.4057396-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250331202835.4057396-1-daeho43@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/1/25 04:28,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > To utilize the delay option of atomic write more useful,
 need to > apportion
 it to each operation of it. > > Signed- [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u1byI-0005hC-AN
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: apportion atomic write's total
 delay to its operations
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

On 4/1/25 04:28, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> To utilize the delay option of atomic write more useful, need to
> apportion it to each operation of it.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
