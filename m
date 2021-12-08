Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F85146D211
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Dec 2021 12:22:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1muv1r-0004D4-7v; Wed, 08 Dec 2021 11:22:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1muv1q-0004Cx-55
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Dec 2021 11:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ARElGDpyLP91aIflVNoyfJLSQUpDQGeagnXg0gXEaY=; b=UX5JHxAffWzXNTHGkvDSJaAaGo
 vVg3qh7SwTbTe9nSC/4YwQydZ2Aj3VMQoescY7sprDflJI7Egs5QJ/wPT6rNeKW8K1sNlcVjQcB+0
 yKvk08YU53xtLUTaUi7jVkYKMk4YaNGlJ5MrFWb4guZNqPMGB/NubDlFlDBOYvE8DwuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ARElGDpyLP91aIflVNoyfJLSQUpDQGeagnXg0gXEaY=; b=TnUoqZkfet5WGMpga5C1hxKzSQ
 jRy4zu9iMWHxkSYoWszXPc91xUmDQNKLYQFjXiZrVu+By2FhW1/axcf3HM+YqqxuRdE66qinWUSFW
 fKsHBsvK7SmnKr8hCSvgBwJJRFGe8kl6FF5NpxlbfTztD1XnyoppqxbWLbTZLnJJlshk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1muv1k-008bh4-QY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Dec 2021 11:22:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D653B820CD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  8 Dec 2021 11:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D0CC341CE;
 Wed,  8 Dec 2021 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638962527;
 bh=5SCZDZx8rEnwxKyk8CGCVkI0WR9NMr7PX3XmVrOuKN4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=TrH76gdUbxX5QchyiVOudntAXhYRDf/DqehtIGzzO4z8HVpn2Lx5+v7U8Z5g52MYd
 W/bmczM1WJCCUEnHvpMoSmpT907AZ7NQdqeNRw+/9wo+/zOyGkZy4CqySzYmq9e7wH
 qnyo+iyumOJJp2Yw2WxAsVdCSdgWqxc8trL1NNMF+TUSxHc8tm7FYSi/H6a42U+5hg
 HnhkN+y7zvQSMDY1KlfHOTNCenY52d8m/VRQVoVKz9yyANXr8T5BHJ0Kv/SzqnaJkz
 I4Qo2O2NN7v4IduBg3rSuGwMCJa1hqauAWj70po3U5GpCz/A9oRhYEW0MzXGdiwmA3
 iA5a4stIBO1Rg==
Message-ID: <660bd307-87eb-8b23-344e-b3cbac396665@kernel.org>
Date: Wed, 8 Dec 2021 19:22:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20211204190158.3158405-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211204190158.3158405-1-jaegeuk@kernel.org>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/5 3:01,
 Jaegeuk Kim wrote: > Let's check the condition
 first before set|clear bit. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1muv1k-008bh4-QY
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid duplicate call of
 mark_inode_dirty
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/12/5 3:01, Jaegeuk Kim wrote:
> Let's check the condition first before set|clear bit.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
