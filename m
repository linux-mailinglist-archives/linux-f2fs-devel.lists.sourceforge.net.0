Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 041EC5773C5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 05:37:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCv5f-0002ty-2B; Sun, 17 Jul 2022 03:37:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oCv5d-0002t6-Ar
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 03:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kS/2wHqSmMKaRERQPBRFvFcnMU3rfVZG4MuqdyswWZ8=; b=g25Giu/eYac6/SdueNRI4jOqxE
 RZhjqhfasQB48XJIp64XgcII8rM6WF2TqM+kXMX7T9D9bYkeK05uQ2D8vGpdb+dSppzN+MZEEmOiY
 pIE3Y6p3twkK2Q/w9Ne8JaDGO3gVcPDFn5n8ssyNtSBO6VQpUGqKPBwMlQRUB9YjNh/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kS/2wHqSmMKaRERQPBRFvFcnMU3rfVZG4MuqdyswWZ8=; b=M721IQcOzVP+y/h02NcWjGeOEM
 j7b44ye7DnqECS8Ll+Ybb+nP16/NpYojWc/o5WUsEXKzsBuZKIWYhwDim86L68DZMOYfjE0pHLtyb
 rwMNCVWfA8QDNdHflsUNuwuHdTCG97YwzfSDNN7L6nlG4szGERe2igGYZyNaROzeG39U=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oCv5b-0005MF-AN
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 03:37:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0932FB80861;
 Sun, 17 Jul 2022 03:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FCAC3411E;
 Sun, 17 Jul 2022 03:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658029015;
 bh=6RMiqVYCcyHb6RyWBbGuM5iORhgOrqfvfLhvuvv037o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fqIKzWv6H7ZHj7UNcCCZ/D1h8Dy8iiALUDUE3QEFUUPKykZjw1jDpWp/2KIQkK8co
 bbABsxqQAWE0XxX+66bNWIpXBQnKiu6SPzUOU/H5kV/VH42I80B6G6ivJUxILEXwZL
 P6hEWmpzb44miUMX68TqewbeMFQYU6EwOR9chTr9wRr5f5hYFUFZNjF6/SiMt7LkwL
 LLQLh/cfWGsrgRJynBWAROUNjl8u4xUwn0r5Muhj8wlswS8AEAw5y7tUOP79NsDh+B
 VO8OWtgl0LkdrxO0GR+E9yCq3fvSN+SU72bwNjJU5FAA/aQhhbQVhvw1vg19aKSzfM
 aeqaVAWhRw5xQ==
Message-ID: <53a6fed6-6254-4848-0557-237ead50b8f1@kernel.org>
Date: Sun, 17 Jul 2022 11:36:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220623181208.3596448-1-bvanassche@acm.org>
 <20220623181208.3596448-4-bvanassche@acm.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220623181208.3596448-4-bvanassche@acm.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/24 2:12, Bart Van Assche wrote: > Change the type
 of the third argument of f2fs_report_zone() from void * > into struct blk_zone
 * to enable type checking. > > Signed-off-by: Bart Van Assche [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oCv5b-0005MF-AN
Subject: Re: [f2fs-dev] [PATCH v2 3/5] Improve compile-time type checking
 for f2fs_report_zone()
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

On 2022/6/24 2:12, Bart Van Assche wrote:
> Change the type of the third argument of f2fs_report_zone() from void *
> into struct blk_zone * to enable type checking.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
