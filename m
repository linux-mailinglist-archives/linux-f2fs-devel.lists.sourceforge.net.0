Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84065975E5E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 03:12:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soYNT-0000eK-M7;
	Thu, 12 Sep 2024 01:12:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1soYNS-0000eC-DB
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 01:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1ocBm9qtQJhVE26nlMctciwruYQqaaWeDWDltJwOkxQ=; b=VoAgf8YW5PCtpZmVC2st502IIe
 uYPYCjKwnqD4z+djoy8oA0sE+pgk7cgjBV8pHQpuhymjrc9whWNue4A/kiFxGaSZTOlyRMoSDCb7c
 tvch2ZszavXrkHacA0o7G7dEoeFuBZ4yJEOymPacIU9qkVXFQmsTm+vuvoXNzPgF/KpY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1ocBm9qtQJhVE26nlMctciwruYQqaaWeDWDltJwOkxQ=; b=JExe3O8Oi4fMc4QQgW+KIJBiis
 +DFkMdYarXPQWlaA+lq+BnYmnMqE8Cd3dyGzi4cciyKefjhX8ZMhbNXLQ2PP3VQ5tU4kXwJcTC4UH
 WENqp/NBR2E9+typjAfgXKWPXDzIr9y6Oi5tj/UhR2VtulzstKwroTdHp8PbtWz/zyWY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soYNR-0003SS-Qo for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 01:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D980E5C0284;
 Thu, 12 Sep 2024 01:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10501C4CEC5;
 Thu, 12 Sep 2024 01:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726103515;
 bh=1ocBm9qtQJhVE26nlMctciwruYQqaaWeDWDltJwOkxQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=XWf2s7PVTwlFV++tPiH1g+ufx7crsPpcdjlWbI87zYo58+hTgipfukrdQZOnYeNUD
 ZPDZBxsYfQoTD133IuXDoN5TemPHO7+fcMCYvECA5gQx7oLLOfYFMccTNkOqoHhHiB
 EWgpooPxfvPaEPNRQ7sbn5WSuKv4E5iUa0LBtRz/Cdjcz3SgMUNHqa2PqDGufL693Y
 uLwjau00ZffhQbQJUX0dPW01WkPVP3W2rmOY9EQeY+H/r02mQoJFjAOga0br8kCDWP
 MxeYHThFA2Iz7CInTIFNO2GThnqwVFL1Gn2V0wviiUf2ik538cg6hjRlY2hJD/gNMx
 2oxOsrVx8l+RQ==
Message-ID: <cedd86de-4749-4880-93dd-373188bbfd47@kernel.org>
Date: Thu, 12 Sep 2024 09:11:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hongbo Li <lihongbo22@huawei.com>, jaegeuk@kernel.org
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
 <adbbf133-08e3-4990-85a3-9dfa9d72c9fa@huawei.com>
Content-Language: en-US
In-Reply-To: <adbbf133-08e3-4990-85a3-9dfa9d72c9fa@huawei.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/11 10:04, Hongbo Li wrote: > Is the subject of the
 email required to be [f2fs-dev][PATCH]? Hongbo, "[f2fs-dev]" prefix is added
 by f2fs mailing list when it forwards your patch to someone who subscribes
 the list, if you receive a patch w/o f2fs-dev prefix,
 it is because you Sent/Cced patch to yours [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1soYNR-0003SS-Qo
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: new mount API conversion
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/9/11 10:04, Hongbo Li wrote:
> Is the subject of the email required to be [f2fs-dev][PATCH]?

Hongbo,

"[f2fs-dev]" prefix is added by f2fs mailing list when it forwards
your patch to someone who subscribes the list, if you receive a patch
w/o f2fs-dev prefix, it is because you Sent/Cced patch to yourself,
and the list selected to not send you another email which has prefix
based on your mailing list option, IIUC.

So, it doesn't matter. :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
