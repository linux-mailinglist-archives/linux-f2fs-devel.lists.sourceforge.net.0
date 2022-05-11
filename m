Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 022E9522EC5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 10:55:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1noi7W-0002gm-U9; Wed, 11 May 2022 08:54:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1noi7V-0002gI-MA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 08:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H683aMqSfQekJAlXEaYaqxqsT84/Qnzaa6VZJJxYrak=; b=AZ84Wpr/GyeRVafqk/JUNxuUoe
 yE9lqZdByum3Y6IyvQoj34H58A03d8k1c45pMuA2Q1yQPQedwSKIzOXsuOewqr1dzDACl7FLOpHqD
 aWadn6L6rBGGHMb0YvW+XaR3PkWF+0NyiPnrOGmuVcRcEYx1OEIVVpziurvp+bODh9m4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H683aMqSfQekJAlXEaYaqxqsT84/Qnzaa6VZJJxYrak=; b=avighi+F4er/Mp1croHOwStWqb
 pjd7p9Ji1HovaCm25IzdAEJ60QWkC5S/kbo7St5H6rmw/h7BSsBPdQR0qSXTQlE96XeMTbB36wSWD
 6ojlon9bmqphbfSya1KFImO6sIfG1e/QQOjxXMSSpuXcHg9M9c3RwlyAGJ6rTRLqEcGY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1noi7U-0003FL-T9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 08:54:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D692B82139
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 May 2022 08:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B4AC340EB;
 Wed, 11 May 2022 08:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652259289;
 bh=Yb3MAYFk9Yi9xQ3U4krUF9K+QBSMz8vdE+dZbdTZ3y8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=SeQi0tEt3GQMDQ/VIbBaZKep/ONNI381zhrA7M+b+H+mJbzS7JV8O6tKphzRc3CK7
 2l/Ft8zPpMHqWnjG7Ij17pbC4MCOKex3OZISe9XJtupjJ7wskBkvNBUytliIcMMufp
 zEA/39jXTmSp7qoQdwr1oPDMLb9c1zVbSjJl6BwtWqci2Tj74QbMeA3cMIjJAsWuxP
 eZAx4szrkue6kOjZ2G8zedEG6JkBA3p1akK7MUlg/w1doX7CTQ+NJoK1lhyIGu+ISM
 x38tL/ygtePNU4euH21OsrJS8SJwXil4mwsaRaqlP6O96J0nEOzZsRN4LuTyv74+PU
 2EGhT/lP73R4w==
Message-ID: <a1b7c4e9-53f2-aa51-4aea-4a530b731a56@kernel.org>
Date: Wed, 11 May 2022 16:54:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
 <20220506232032.1264078-2-jaegeuk@kernel.org> <YnlFiz/IgsjtGhqu@google.com>
 <YnstyDv0Po5g0W1F@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YnstyDv0Po5g0W1F@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/11 11:30,
 Jaegeuk Kim wrote: > No functional change.
 > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org> Thanks, 
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
X-Headers-End: 1noi7U-0003FL-T9
Subject: Re: [f2fs-dev] [PATCH 2/5 v2] f2fs: introduce f2fs_gc_control to
 consolidate f2fs_gc parameters
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

On 2022/5/11 11:30, Jaegeuk Kim wrote:
> No functional change.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
