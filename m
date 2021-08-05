Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A813E0B2F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Aug 2021 02:30:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBRGx-00072S-9S; Thu, 05 Aug 2021 00:30:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mBRGv-00072D-P9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 00:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zb9AHjOuco5j8HO3p81lly/TL8E5hqZzd6iGFCCFAfw=; b=fdHgF7tbpgqnMr1LMN0ZCv//m8
 VxBFAOz+f/EIXZ5yMgH8qJrjlqYlJul9LWgxWzin5UV8XEFG8nMQTVqs4q9+k4Y7Li6o/ahL1rK8P
 qN/n3/7jz+O9fRL8N6fF9T3nQKD9bDxn78/8/9sGt9//11teIknvUjzMjK4szFb/S5lU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zb9AHjOuco5j8HO3p81lly/TL8E5hqZzd6iGFCCFAfw=; b=IR1O9jEnAjZmSlu1O2qJZeCmHu
 aM/+gAhuOrH9irRVST88dEhpeyra1pMUhzA+dzS9Yvdf/HlLl0yJj+a/oGTx1R93XciO7j7L9Fby7
 XuG2ruAe9z6m+o80H2fkB/AarOhE2Lpx52F8JIE/VJKH2sjNcPjl+6a+gldWpKzVFohY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBRGp-0000g2-7L
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 00:30:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE4D7610FD;
 Thu,  5 Aug 2021 00:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628123388;
 bh=fKieLesTCiXaeb8urF0Ymy+tmaf0uoqUENpfp0I62go=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Vn5s/oVc4bdLiD2TOHDBnJ22Avzhv08uEdKUm50DR7qHK/EDLsSSNSy39IkNKM/XF
 KNHE01w6CuBc1oOktxPWGegJMb+8pxk117cVipqwomyhISSjn1ZjM3lLwt0Moe3nC4
 ae1wLfe98IFvzSE4/v92+NuWnKEQ83PL9H4EupHvtedjY72NSYBtlRBkpa8mu+kLGw
 aGSYqPm/KGRvPtNyvPNKF3T7JSz9HdXp5HLocRPutOC+Cc8g6RF2C5SWqk9KkOcdKS
 1uPTGhnpsm/YV3DJMSr+Au9nOB17PgrP08CK3oY4//mCOiEJNrxrzEczka7yVKhbsL
 Ev+48jc/QeSbg==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210804022348.1414543-1-chao@kernel.org>
 <YQsIj0wKk6YbN/FJ@google.com> <YQsmfm3ibU6bhvZr@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <0dad9863-4aa2-3ea3-fd97-457aa635ed66@kernel.org>
Date: Thu, 5 Aug 2021 08:29:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQsmfm3ibU6bhvZr@google.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBRGp-0000g2-7L
Subject: Re: [f2fs-dev] [RFC v3] f2fs: extent cache: support unaligned extent
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Chao Yu <chao.yu@linux.dev>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

On 2021/8/5 7:45, Jaegeuk Kim wrote:
> Chao,
> 
> How about this?
> https://github.com/jaegeuk/f2fs/commit/d6bbe121bc24dfabfedc07ba7cb6e921fb70ece0

Looks more clean, thanks,

> 
> I'm digging one bug in __insert_extent_tree w/ the patch tho.

Shouldn't we initialize @ei in f2fs_update_extent_tree_range(), otherwise,
__try_merge_extent_node(&ei) -> __is_extent_mergeable() will do the check
w/ uninitialized c_len of @ei.

>> On 08/04, Chao Yu wrote:
>>> +	if (from_dnode)
>>> +		goto skip_reading_dnode;

Wrong condition here, thanks for fixing.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
