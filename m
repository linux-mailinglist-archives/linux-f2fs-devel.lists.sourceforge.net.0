Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 502CC3EAE10
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Aug 2021 03:10:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mELie-00019b-RG; Fri, 13 Aug 2021 01:10:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mELid-00019U-LK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 01:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WIdaISNPqwn8Llsgc5HOxL21WdlzGWLzu2JU5+Qou48=; b=CghVTp/hEdH03L4mwBB8OnfmAr
 a5+waJF6ouLXSTZkrhR9B6PlyyjrRvZlaL838sQVGmDozM37HZauAPPWwKG5dpxEHS6CMqUVq1fP+
 VsDaMfaxbyZkAGCAMyKnmGyqkCW8ZBZEn061IQ8M6SRgEfYHs2uOhQPQj37hCW6LojlM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WIdaISNPqwn8Llsgc5HOxL21WdlzGWLzu2JU5+Qou48=; b=c3wPNH7kOd9ElsuXmmrinlB4xt
 O8EWnSudapN2NMSxGJHWPyJocNuCQjFZPDnSQ1bWcd3r5mTdWi+m1il7GVdUCJ8UOZT6R+Chpm80a
 gGlI8kxB+pjd3TJFPNiaS8XemQjknPRP19VdY0ccoQXoeZy1sbdJkFwAfuv5SvkCam1o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mELic-004hsQ-93
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 01:10:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0D9960E76;
 Fri, 13 Aug 2021 01:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628817036;
 bh=P7xrO+NWCshb+QKSx1kQ2DBMJrqKOnLzFvqQxOil/BE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Kl7TrLP/5h9CvllOQjZR9r6uVrWwfMKkvLxNHVgyOnqQ7TMn7HAYXWpH0gXqKjQFe
 ywBo783miVG5l7P1ZkEyl1B8HTTzcH9QAunKRNpMp91vdbzsB1hWzVxlN41SuWPplf
 R6ck2Ds1i6mba//CD7+SLuc/2FUlRkRobN/3vV+do3+aO7+a19FKbc+q9xzF4U1voz
 FSrShmg2DtEO0HUMgb37LTw+JovpffqtUcTe48wD6PjhldmMX2Mm0ww0UrTQbJ5/hH
 y8b6uN2k90fR9BjKatRfK01zmxFPZkgn1sB1HvFUKajlUBd9MxNCXfQdEetEckZmvJ
 bHBr82LmeyDnA==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210811044557.23951-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <6b198991-f092-0350-2257-87a25812b5a0@kernel.org>
Date: Fri, 13 Aug 2021 09:10:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811044557.23951-1-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mELic-004hsQ-93
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: improve sbi status info in
 debugfs/f2fs/status
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/11 12:45, Yangtao Li wrote:
> Do not use numbers but strings to improve readability when flag is set.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
