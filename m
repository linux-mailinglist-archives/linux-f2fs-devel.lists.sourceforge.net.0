Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 852D752D178
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 13:28:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nreKF-0002EV-Cr; Thu, 19 May 2022 11:28:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nreK2-0002E7-82
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 11:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K1IrmUqSwek0WbRh1VQh8fTVOJNXHH734HkOIQK69DI=; b=S9eSrSadBziArRfKRd6AaSI1Wg
 YqUuo0yCC7pgTwsA0JY5suVqoWnrkIp9N0N6mfgHJP7c1xT0KGgyGof0fT4zHB0a52cIH8270V4QU
 emO4uKnGRjVI59wC1PxdQT7wwvdkwxmWRVwC710lvMFc0KOfaVhyuGynR2p8TYIJowv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K1IrmUqSwek0WbRh1VQh8fTVOJNXHH734HkOIQK69DI=; b=TXxQ5Mz/3OL3NedNMM7dhxpHAR
 pXr8C32Ekgb7ORkYAop5pbePyicVcQii1FdLgUirxra3JTibgXxLJTtP1QdxE3pxaHkR1PqCJy+wL
 Ow6GIgKKzW+VZZ0i72hX9jHUb8MiVTUkdfaM/XzBld0zzOkuWK4OcOH5pJmpghJctJzs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nreJr-0092u9-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 11:27:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6509CB823E3;
 Thu, 19 May 2022 11:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3AAC385AA;
 Thu, 19 May 2022 11:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652959664;
 bh=iNoDGxMLFdCDEbqbHZkAgsEP87xmldbX8bJVs3NNCrM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bT/ZvvJu+Th5l6pSJFTdweeI/hxLMTlzS2tUOINtFItCLBLP7G8NG4A5sB/y3owyY
 uqWQ1jdzvrytm4bX/PgDBRPzSIff95didQBB+SBJkpYEnnkKzGSRtFJiNszTs0dol0
 r/RO8RhneotCU2Q3d/bYKzDZPscY6qCLifmV85z85m/i3FDLQjsh2hF6DI8kLJ5f1d
 bk7JfChyQNtq88H4XlwNJYdz4dSTC4BQlyVIPq6PoIPEioMJwPzNCW3+DRUIcO4Tlm
 yUiI0RZLgR6tCgIfWg8xOq6ucXbugJr+sSzWp4lvgdDCHqnws4blstgm+6QziZfuSe
 h3ba38yO0EyAg==
Message-ID: <fb8aaa09-7bfd-7e2a-4cb1-de691fdb6408@kernel.org>
Date: Thu, 19 May 2022 19:27:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Gabriel Krisman Bertazi <krisman@collabora.com>, tytso@mit.edu,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org, ebiggers@kernel.org
References: <20220518172320.333617-1-krisman@collabora.com>
 <20220518172320.333617-3-krisman@collabora.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220518172320.333617-3-krisman@collabora.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/19 1:23, Gabriel Krisman Bertazi wrote: > Keeping
 it as qstr avoids the unnecessary conversion in f2fs_match > > Signed-off-by:
 Gabriel Krisman Bertazi <krisman@collabora.com> Reviewed-by: Chao Yu
 <chao@kernel.org>
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
X-Headers-End: 1nreJr-0092u9-Mq
Subject: Re: [f2fs-dev] [PATCH v5 2/8] f2fs: Simplify the handling of cached
 insensitive names
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
Cc: linux-ext4@vger.kernel.org, kernel@collabora.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/19 1:23, Gabriel Krisman Bertazi wrote:
> Keeping it as qstr avoids the unnecessary conversion in f2fs_match
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
